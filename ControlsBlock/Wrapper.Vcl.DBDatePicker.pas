unit Wrapper.Vcl.DBDatePicker;

interface

uses
  System.Classes, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB, System.SysUtils;

type
  EWraperInvalidConfiguration = class(Exception);

type
  TDBDatePickerWrapper = class(TComponent)
  public
    chkNullDate: TCheckBox;
    dtp: TDateTimePicker;
    procedure ConnectToDataSource(DataSource: TDataSource;
      Field: TField); overload;
    procedure ConnectToDataSource(DataSource: TDataSource;
      const FieldName: String); overload;
    procedure DataSourceOnChange(Sender: TObject; Field: TField);
  private
    DateField: TField;
    DataSource: TDataSource;
    procedure chkOnClick(Sender: TObject);
    procedure dtpOnChange(Sender: TObject);
    procedure setPickerDefaultDateFormat;
  end;

implementation

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

procedure TDBDatePickerWrapper.ConnectToDataSource(DataSource: TDataSource;
  Field: TField);
begin
  if not Assigned(DataSource) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectDataSourceRequired);
  if not Assigned(DataSource.DataSet) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectDataSetRequired);
  if not Assigned(Field) then
    raise EWraperInvalidConfiguration.Create(MsgCantConnectFieldRequired);
  if not Assigned(chkNullDate) or not Assigned(dtp) then
    raise EWraperInvalidConfiguration.Create(MsgInvalidDBDatePicker);
  self.DataSource := DataSource;
  self.DateField := Field;
  dtp.OnChange := dtpOnChange;
  chkNullDate.OnClick := chkOnClick;
  DataSourceOnChange(self, DateField);
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
    //   * Komunikat: Nie znaleziono pola
    fld := DataSource.DataSet.FieldByName(FieldName);
  end;
  ConnectToDataSource (DataSource, fld);
end;

procedure TDBDatePickerWrapper.DataSourceOnChange(Sender: TObject;
  Field: TField);
begin
  if Assigned(DateField) and ((Field = nil) or (Field = DateField)) then
  begin
    dtp.OnChange := nil;
    chkNullDate.OnClick := nil;
    if DateField.IsNull then
    begin
      dtp.Format := ' ';
      chkNullDate.Checked := False;
    end
    else
    begin
      if dtp.Format = ' ' then
        setPickerDefaultDateFormat();
      chkNullDate.Checked := True;
      dtp.Date := DateField.AsDateTime;
    end;
    dtp.OnChange := dtpOnChange;
    chkNullDate.OnClick := chkOnClick;
  end;
end;

procedure TDBDatePickerWrapper.setPickerDefaultDateFormat;
var
  fs: TFormatSettings;
  s: string;
begin
  fs := TFormatSettings.Create;
  s := fs.ShortDateFormat;
  s := StringReplace(s,'/',fs.DateSeparator,[rfReplaceAll]);
  dtp.Format := s;
end;

procedure TDBDatePickerWrapper.chkOnClick(Sender: TObject);
var
  frmSettings: TFormatSettings;
begin
    DateField.DataSet.Edit;
  if chkNullDate.Checked then
    DateField.AsDateTime := Now()
  else
    DateField.Clear;
end;

procedure TDBDatePickerWrapper.dtpOnChange(Sender: TObject);
begin
  DateField.DataSet.Edit;
  DateField.AsDateTime := dtp.Date;
end;

end.
