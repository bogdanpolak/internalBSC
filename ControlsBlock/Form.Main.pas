unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TForm1 = class(TForm)
    Button1: TButton;
    GroupBox1: TGroupBox;
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    FDQuery1: TFDQuery;
    procedure Button1Click(Sender: TObject);
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
  Vcl.DBGrids, FireDAC.DApt;

procedure TForm1.Button1Click(Sender: TObject);
var
  AContainer: TWinControl;
  grbx: TGroupBox;
  btn1: TButton;
  ds: TDataSet;
  grid: TDBGrid;
begin
  FDConnection1.ConnectionDefName := 'IB_Demo';
  FDConnection1.Open();
  AContainer := GroupBox1;

  grbx := TGroupBox.Create(AContainer);
  grbx.Caption := 'DB Grid Commands';
  grbx.AlignWithMargins := True;
  grbx.Align := alTop;
  grbx.Height := 48;
  grbx.Parent := AContainer;

  FDConnection1.ExecSQL(

  'SELECT Orders.OrderID, ' +
  '  Orders.CustomerID, Customers.CompanyName, ' +
  '  Orders.EmployeeID, '+
  '  Employees.FirstName||'' ''||Employees.LastName EmployeeName, ' +
  '  Orders.OrderDate, ' +
  '  Orders.RequiredDate, Orders.ShippedDate, ' +
  '  Orders.ShipVia, Shippers.CompanyName ShipperCompany ' +
  'FROM {id Orders} Orders ' +
  '  INNER JOIN {id Employees} Employees '+
  '    ON Orders.EmployeeID = Employees.EmployeeID ' +
  '  INNER JOIN {id Customers} Customers ON Orders.CustomerID = Customers.CustomerID' +
  '  INNER JOIN {id Shippers} Shippers ON Orders.ShipVia = Shippers.ShipperID' +
  '

  ',
   ds);
  grid := Vcl.DBGrids.TDBGrid.Create(AContainer);
  grid.DataSource := TDataSource.Create(AContainer);
  grid.DataSource.DataSet := ds;
  grid.Align := alClient;
  grid.AlignWithMargins := True;
  grid.Parent := AContainer;


  btn1 := TButton.Create(grbx);
  btn1.Caption := 'Edit';
  btn1.AlignWithMargins := True;
  btn1.Align := alLeft;
  btn1.Parent := grbx;
end;

end.
