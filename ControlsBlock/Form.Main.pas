unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    btnOrders: TButton;
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDQuery1: TFDQuery;
    GridPanel1: TGridPanel;
    GroupBox1: TGroupBox;
    btnHashesAndCiphers: TButton;
    tmrIdle: TTimer;
    procedure btnHashesAndCiphersClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure tmrIdleTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Vcl.DBGrids, Helper.TDBGrid, Frame.HashAndCrypto;

const
  SQL_GetOrdersList = 'SELECT Orders.OrderID, ' +
    '  Orders.CustomerID, Customers.CompanyName, ' + '  Orders.EmployeeID, ' +
  // -#-
    '  Employees.FirstName||'' ''||Employees.LastName EmployeeName, ' +
    '  Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, ' +
    '  Orders.ShipVia, Shippers.CompanyName ShipperCompany ' +
    'FROM {id Orders} Orders ' + // -#-
    '  INNER JOIN {id Employees} Employees ' +
    '    ON Orders.EmployeeID = Employees.EmployeeID ' +
    '  INNER JOIN {id Customers} Customers ' +
    '    ON Orders.CustomerID = Customers.CustomerID ' +
    '  INNER JOIN {id Shippers} Shippers ' +
    '    ON Orders.ShipVia = Shippers.ShipperID ' + 'ORDER BY Orders.OrderID ';

procedure TForm1.btnHashesAndCiphersClick(Sender: TObject);
var
  AFrame: TFrameHashes;
begin
  GroupBox1.Parent := nil;
  AFrame := Frame.HashAndCrypto.TFrameHashes.Create(self);
  AFrame.Parent := GridPanel1;
end;

procedure TForm1.btnOrdersClick(Sender: TObject);
var
  AContainer: TWinControl;
  grbx: TGroupBox;
  btn1: TButton;
  ds: TDataSet;
  grid: TDBGrid;
  mainPanel: TPanel;
begin
  FDConnection1.ConnectionDefName := 'IB_Demo';
  FDConnection1.Open();
  GridPanel1.BevelOuter := bvNone;
  GroupBox1.Parent := nil;
  AContainer := GridPanel1;

  mainPanel := TPanel.Create(AContainer);
  mainPanel.Tag := 1;
  mainPanel.BevelOuter := bvNone;
  mainPanel.Align := alClient;
  mainPanel.AlignWithMargins := True;
  mainPanel.Parent := AContainer;

  grbx := TGroupBox.Create(mainPanel);
  grbx.Caption := 'DB Grid Commands';
  grbx.AlignWithMargins := True;
  grbx.Align := alTop;
  grbx.Height := 48;
  grbx.Parent := mainPanel;

  FDConnection1.ExecSQL(SQL_GetOrdersList, ds);
  grid := Vcl.DBGrids.TDBGrid.Create(mainPanel);
  grid.DataSource := TDataSource.Create(mainPanel);
  grid.DataSource.DataSet := ds;
  grid.Align := alClient;
  grid.AlignWithMargins := True;
  grid.Parent := mainPanel;

  btn1 := TButton.Create(grbx);
  btn1.Caption := 'Edit';
  btn1.AlignWithMargins := True;
  btn1.Align := alLeft;
  btn1.Parent := grbx;

  grid.AutoSizeColumns();
end;

procedure TForm1.tmrIdleTimer(Sender: TObject);
var
  AContainer: TWinControl;
  i: Integer;
begin
  AContainer := GridPanel1;
  for i := 0 to AContainer.ControlCount-1 do
    if AContainer.Controls[i].Tag<0 then
    begin
      AContainer.Controls[i].Free;
      GroupBox1.Parent := GridPanel1;
    end;
end;

end.
