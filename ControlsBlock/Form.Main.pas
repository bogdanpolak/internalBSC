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
    btnStart: TButton;
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDQuery1: TFDQuery;
    GridPanel1: TGridPanel;
    procedure btnStartClick(Sender: TObject);
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
  Vcl.DBGrids, Helper.TDBGrid;

const
  SQL_GetOrdersList = 'SELECT Orders.OrderID, ' +
    '  Orders.CustomerID, Customers.CompanyName, ' + '  Orders.EmployeeID, ' +
    '  Employees.FirstName||'' ''||Employees.LastName EmployeeName, ' +
    '  Orders.OrderDate, ' + '  Orders.RequiredDate, Orders.ShippedDate, ' +
    '  Orders.ShipVia, Shippers.CompanyName ShipperCompany ' +
    'FROM {id Orders} Orders ' + // -##-
    '  INNER JOIN {id Employees} Employees ' +
    '    ON Orders.EmployeeID = Employees.EmployeeID ' +
    '  INNER JOIN {id Customers} Customers ' +
    '    ON Orders.CustomerID = Customers.CustomerID' +
    '  INNER JOIN {id Shippers} Shippers ' +
    '    ON Orders.ShipVia = Shippers.ShipperID';

procedure TForm1.btnStartClick(Sender: TObject);
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
  btnStart.Parent := nil;
  AContainer := GridPanel1;

  mainPanel := TPanel.Create(AContainer);
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

end.
