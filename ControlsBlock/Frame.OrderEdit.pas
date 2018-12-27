unit Frame.OrderEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrameOrderEdit = class(TFrame)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    GridPanel1: TGridPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    btnCalcFreight: TButton;
    DateTimePicker1: TDateTimePicker;
    GroupBox4: TGroupBox;
    btnClose: TButton;
    DBNavigator1: TDBNavigator;
    tmrReady: TTimer;
    CheckBox1: TCheckBox;
    procedure btnCloseClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure tmrReadyTimer(Sender: TObject);
  private
    OrderID: integer;
    // {{ Переключиться на UTF-8 }} - Przełącza zapisywanie plików PAS na UTF-8
    // TODO: Usuń zalezność od FDConnection
    CurrentConnection: TFDConnection;
    isClosing: Boolean;
    fldOrderDate: TField;
    procedure UpdateDatePickerValue(fld: TField);
    procedure dtpOrderDate_EventOnChange(Sender: TObject);
    procedure cbxDateNull_EventOnClick(Sender: TObject);
  public
    { Public declarations }
    class procedure ShowFrame(AContainer: TWinControl;
      AConnection: TFDConnection; OrderID: integer);
  end;

implementation

{$R *.dfm}
{$REGION 'DB aware DateTimePicker with NULL CheckBox'}

var
  cbxNullOrderDate: TCheckBox;
  dtpOrderDate: TDateTimePicker;
  FieldOrderDate: TField;
  DataSourceOrderDate: TDataSource;

procedure TFrameOrderEdit.cbxDateNull_EventOnClick(Sender: TObject);
var
  frmSettings: TFormatSettings;
  OnChangeEvent: TDataChangeEvent;
begin
  frmSettings := TFormatSettings.Create;
  OnChangeEvent := DataSourceOrderDate.OnDataChange;
  DataSourceOrderDate.OnDataChange := nil;
  if cbxNullOrderDate.Checked then
  begin
    dtpOrderDate.Format := frmSettings.ShortDateFormat;
    FieldOrderDate.DataSet.Edit;
    FieldOrderDate.AsDateTime := Now();
  end
  else
  begin
    dtpOrderDate.Format := ' ';
    FieldOrderDate.DataSet.Edit;
    FieldOrderDate.Clear;
  end;
  DataSourceOrderDate.OnDataChange := OnChangeEvent;
end;

procedure TFrameOrderEdit.UpdateDatePickerValue(fld: TField);
var
  frmSettings: TFormatSettings;
begin
  frmSettings := TFormatSettings.Create;
  dtpOrderDate.Format := frmSettings.ShortDateFormat;
  dtpOrderDate.Date := fld.AsDateTime;
end;

procedure TFrameOrderEdit.dtpOrderDate_EventOnChange(Sender: TObject);
begin
  FieldOrderDate.DataSet.Edit;
  FieldOrderDate.AsDateTime := dtpOrderDate.Date;
end;

{$ENDREGION}

procedure TFrameOrderEdit.btnCloseClick(Sender: TObject);
begin
  isClosing := True;
end;

class procedure TFrameOrderEdit.ShowFrame(AContainer: TWinControl;
  AConnection: TFDConnection; OrderID: integer);
var
  frm: TFrameOrderEdit;
begin
  frm := TFrameOrderEdit.Create(AContainer);
  frm.OrderID := OrderID;
  frm.CurrentConnection := AConnection;
  frm.AlignWithMargins := True;
  frm.Align := alClient;
  frm.Parent := AContainer;
  repeat
    Application.HandleMessage;
  until frm.isClosing or Application.Terminated;
  frm.Free;
end;

procedure TFrameOrderEdit.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  if Assigned(fldOrderDate) and ((Field = nil) or (Field = fldOrderDate)) then
    UpdateDatePickerValue(fldOrderDate)
end;

procedure TFrameOrderEdit.tmrReadyTimer(Sender: TObject);
var
  // TODO: Usuń zalezność od TFDQuery (powinien wystarczyć TDataSet)
  fdq1: TFDQuery;
  fdq2: TFDQuery;
begin
  tmrReady.Enabled := False;
  // --------------------------------------------------------------
  GridPanel1.AlignWithMargins := True;
  GridPanel1.Align := alTop;
  // --------------------------------------------------------------
  // Zbuduj, podepnij i otwórz query dla bierzącego zamówienia (OrderID)
  fdq1 := TFDQuery.Create(self);
  fdq1.Connection := CurrentConnection;
  fdq1.Open('select OrderID,CustomerID, EmployeeID, OrderDate, ' +
    'RequiredDate, ShippedDate, Freight from {id Orders} where ' +
    'OrderID = :OrderID', [OrderID]);
  fldOrderDate := fdq1.FieldByName('OrderDate');
  // --------------------------------------------------------------
  // Konfiguruj dtpOrderDate
  FieldOrderDate := fldOrderDate;
  DataSourceOrderDate := DataSource1;
  cbxNullOrderDate := CheckBox1;
  dtpOrderDate := DateTimePicker1;
  cbxNullOrderDate.OnClick := cbxDateNull_EventOnClick;
  dtpOrderDate.OnChange := dtpOrderDate_EventOnChange;
  // --------------------------------------------------------------
  // Zbuduj, podepnij i otwórz query dla listy pracowników
  fdq2 := TFDQuery.Create(self);
  fdq2.Connection := CurrentConnection;
  fdq2.Open('select EmployeeID, FirstName||'' ''||LastName||''  ' +
    ' (ID:''||EmployeeID||'')'' as EmployeeName from {id Employees} ' +
    ' order by EmployeeID');
  // --------------------------------------------------------------
  DataSource1.DataSet := fdq1;
  DataSource2.DataSet := fdq2;
end;

end.
