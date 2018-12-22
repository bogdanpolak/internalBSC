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
    FDQuery1: TFDQuery;
    FDQuery1ORDERID: TIntegerField;
    FDQuery1CUSTOMERID: TStringField;
    FDQuery1EMPLOYEEID: TIntegerField;
    FDQuery1ORDERDATE: TDateField;
    FDQuery1REQUIREDDATE: TDateField;
    FDQuery1SHIPPEDDATE: TDateField;
    FDQuery1FREIGHT: TBCDField;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
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
    procedure DateTimePicker1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    isClosing: Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowFrame(AContainer: TWinControl;
      AConnection: TFDConnection; OrderID: integer);
  end;

implementation

{$R *.dfm}

procedure TFrameOrderEdit.btnCloseClick(Sender: TObject);
begin
  isClosing := True;
end;

{ TFrameOrderEdit }

procedure TFrameOrderEdit.CheckBox1Click(Sender: TObject);
var
  frmSettings: TFormatSettings;
begin
  frmSettings := TFormatSettings.Create;
  DataSource1.OnDataChange := nil;
  if CheckBox1.Checked then
  begin
    DateTimePicker1.Format := frmSettings.ShortDateFormat;
    FDQuery1.Edit;
    FDQuery1.FieldByName('OrderDate').AsDateTime := Now();
  end
  else begin
    DateTimePicker1.Format:=' ';
    FDQuery1.Edit;
    FDQuery1.FieldByName('OrderDate').Clear;
  end;
  DataSource1.OnDataChange := DataSource1DataChange;
end;

procedure TFrameOrderEdit.DataSource1DataChange(Sender: TObject; Field: TField);
var
  frmSettings: TFormatSettings;
begin
  frmSettings := TFormatSettings.Create;
  DateTimePicker1.Format := frmSettings.ShortDateFormat;
  DateTimePicker1.Date := FDQuery1.FieldByName('OrderDate').AsDateTime;
end;

procedure TFrameOrderEdit.DateTimePicker1Change(Sender: TObject);
begin
  FDQuery1.Edit;
  FDQuery1.FieldByName('OrderDate').AsDateTime := DateTimePicker1.Date;
end;

class procedure TFrameOrderEdit.ShowFrame(AContainer: TWinControl;
  AConnection: TFDConnection; OrderID: integer);
var
  frm: TFrameOrderEdit;
begin
  frm := TFrameOrderEdit.Create(AContainer);
  frm.Parent := AContainer;
  frm.FDQuery1.Connection := AConnection;
  frm.FDQuery2.Connection := AConnection;
  frm.FDQuery1.Open;
  frm.FDQuery2.Open;
  frm.AlignWithMargins := True;
  frm.Align := alClient;
  frm.Parent := AContainer;
  // frm.Visible := True;
  while not frm.isClosing do
    Application.ProcessMessages;
  frm.Free;
end;

procedure TFrameOrderEdit.tmrReadyTimer(Sender: TObject);
begin
  tmrReady.Enabled := False;
  GridPanel1.AlignWithMargins := True;
  GridPanel1.Align := alTop;
end;

end.
