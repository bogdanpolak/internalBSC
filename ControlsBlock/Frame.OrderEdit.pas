unit Frame.OrderEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls;

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
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    btnCalcFreight: TButton;
    btnClose: TButton;
    procedure btnCloseClick(Sender: TObject);
  private
    isClosing: Boolean;
    { Private declarations }
  public
    { Public declarations }
    class procedure ShowFrame (AContainer: TWinControl;
      AConnection:TFDConnection; OrderID:integer);
  end;

implementation

{$R *.dfm}


procedure TFrameOrderEdit.btnCloseClick(Sender: TObject);
begin
  isClosing := True;
end;

{ TFrameOrderEdit }

class procedure TFrameOrderEdit.ShowFrame(AContainer: TWinControl;
  AConnection:TFDConnection; OrderID:integer);
var
  frm: TFrameOrderEdit;
begin
  frm := TFrameOrderEdit.Create(AContainer);
  frm.Parent := AContainer;
  frm.FDQuery1.Connection := AConnection;
  frm.FDQuery2.Connection := AConnection;
  frm.FDQuery1.Open;
  frm.FDQuery2.Open;
  frm.Parent := AContainer;
  frm.Visible := True;
  while not frm.isClosing do
    Application.ProcessMessages;
  frm.Free;
end;

end.
