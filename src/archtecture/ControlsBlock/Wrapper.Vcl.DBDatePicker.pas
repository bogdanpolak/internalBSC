unit Wrapper.Vcl.DBDatePicker;

interface

uses
  System.Classes, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, System.SysUtils;

type
  EWraperInvalidConfiguration = class(Exception);

type
  TDBDatePickerWrapper = class(TComponent)
  public
    procedure SetDBDatePickerControls(CheckBox: TCheckBox;
      DatePicker: TDateTimePicker);
    procedure ConnectToDataSource(DataSource: TDataSource;
      Field: TField); overload;
    procedure ConnectToDataSource(DataSource: TDataSource;
      const FieldName: String); overload;
    procedure DataSourceOnChange(Sender: TObject; Field: TField);
  private
    CheckBox: TCheckBox;
    DatePicker: TDateTimePicker;
    DBField: TField;
    DataSource: TDataSource;
    DisableControlsUpdate: boolean;
    procedure chkOnClick(Sender: TObject);
    procedure dtpOnChange(Sender: TObject);
    procedure setPickerDefaultDateFormat;
  end;

implementation

uses
  Vcl.Graphics;

resourcestring
  MsgInvalidDBDatePicker = 'Invalid DBDatePicker Wrapper configuration. No' +
    ' controls was provided. You have to setup TCheckBox and TDateTimePicker' +
    ' controls.';
  MsgCantConnectDataSourceRequired = 'Can''t connect DBDatePicker Wrapper.' +
    ' DataSource is required';
  MsgCantConnectDataSetRequired = 'Can''t connect DBDatePicker Wrapper.' +
    ' DataSet connected to DataSource is required';
  MsgCantConnectFieldRequired = 'Can''t connect DBDatePicker Wrapper.' +
    ' Field is required';

procedure TDBDatePickerWrapper.SetDBDatePickerControls(CheckBox: TCheckBox;
  DatePicker: TDateTimePicker);
begin
  self.CheckBox := CheckBox;
  self.DatePicker := DatePicker;
end;

procedure TDBDatePickerWrapper.ConnectToDataSource(DataSource: TDataSource;
  Field: TField);
begin
  if not Assigned(DataSource) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectDataSourceRequired);
  if not Assigned(DataSource.DataSet) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectDataSetRequired);
  if not Assigned(Field) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectFieldRequired);
  if not Assigned(CheckBox) or not Assigned(DatePicker) then
    raise EWraperInvalidConfiguration.Create(MsgInvalidDBDatePicker);
  self.DataSource := DataSource;
  self.DBField := Field;
  DatePicker.OnChange := dtpOnChange;
  CheckBox.OnClick := chkOnClick;
  DataSourceOnChange(self, DBField);
end;

procedure TDBDatePickerWrapper.ConnectToDataSource(DataSource: TDataSource;
  const FieldName: String);
var
  fld: TField;
begin
  fld := nil;
  if Assigned(DataSource) and Assigned(DataSource.DataSet) then
  begin
    // TODO: Zmiana wyjatku EDatabaseError na EWraperInvalidConfiguration
    // * Komunikat: Nie znaleziono pola
    fld := DataSource.DataSet.FieldByName(FieldName);
  end;
  ConnectToDataSource(DataSource, fld);
end;

procedure TDBDatePickerWrapper.DataSourceOnChange(Sender: TObject;
  Field: TField);
begin
  if DisableControlsUpdate then
    exit;
  if Assigned(DBField) and ((Field = nil) or (Field = DBField)) then
  begin
    DatePicker.OnChange := nil;
    CheckBox.OnClick := nil;
    if DBField.IsNull then
    begin
      if DatePicker.Format <> ' ' then
      begin
        DatePicker.Format := ' ';
        // {{ Переключиться на UTF-8 }} - Przełącza na UTF-8
        // TODO: Sprawdzić jak zmieniać kolor w TDateTimePicker
        // dtp.Color := Vcl.Graphics.clBtnFace;
        DatePicker.Enabled := False;
      end;
      CheckBox.Checked := False;
    end
    else
    begin
      if DatePicker.Format = ' ' then
      begin
        setPickerDefaultDateFormat();
        DatePicker.Enabled := True;
        // dtp.Color := Vcl.Graphics.clWindow;
      end;
      CheckBox.Checked := True;
      DatePicker.Date := DBField.AsDateTime;
    end;
    DatePicker.OnChange := dtpOnChange;
    CheckBox.OnClick := chkOnClick;
  end;
end;

procedure TDBDatePickerWrapper.setPickerDefaultDateFormat;
var
  fs: TFormatSettings;
  s: string;
begin
  fs := TFormatSettings.Create;
  s := fs.ShortDateFormat;
  s := StringReplace(s, '/', fs.DateSeparator, [rfReplaceAll]);
  DatePicker.Format := s;
end;

procedure TDBDatePickerWrapper.chkOnClick(Sender: TObject);
begin
  DisableControlsUpdate := True;
  try
    DBField.DataSet.Edit;
    if CheckBox.Checked then
      DBField.AsDateTime := Now()
    else
      DBField.Clear;
  finally
    DisableControlsUpdate := False;
  end;
  DataSourceOnChange(self, DBField);
end;

procedure TDBDatePickerWrapper.dtpOnChange(Sender: TObject);
begin
  DisableControlsUpdate := True;
  try
    DBField.DataSet.Edit;
    DBField.AsDateTime := DatePicker.Date;
  finally
    DisableControlsUpdate := False;
  end;
  DataSourceOnChange(self, DBField);
end;

end.
