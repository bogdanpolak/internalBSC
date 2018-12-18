unit View.OrderList;

interface

uses MVC.ViewBlocks, Vcl.Controls,
  // TODO: Usun�� zalezno�� od TFDConnection
  FireDAC.Comp.Client;

type
  TOrdersListBlock = class(TDataSetBlock)
  private
    procedure ConstructComponents(AContainer: TWinControl;
      ConnFireDAC: TFDConnection);
  protected
    procedure EventOnButtonCloseClick (Stnder: TObject);
  public
    constructor Create(AContainer: TWinControl; ConnFireDAC: TFDConnection);
      reintroduce;
    destructor Destroy; override;
  end;

implementation

uses
  Vcl.StdCtrls, Vcl.DBGrids, Vcl.ExtCtrls, Data.DB,
  Helper.TDBGrid;

constructor TOrdersListBlock.Create(AContainer: TWinControl;
  ConnFireDAC: TFDConnection);
begin
  inherited Create(AContainer);
  ConstructComponents(AContainer, ConnFireDAC);
end;

destructor TOrdersListBlock.Destroy;
begin

  inherited;
end;

procedure TOrdersListBlock.EventOnButtonCloseClick(Stnder: TObject);
begin
  self.Tag := -1;
end;

const
  // TODO: Przenie�� SELECT-a do fabryki dataset�w (przy okazji usuwania
  // zale�no�ci od TFDConnection
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

procedure TOrdersListBlock.ConstructComponents(AContainer: TWinControl;
  ConnFireDAC: TFDConnection);
var
  grbx: Vcl.StdCtrls.TGroupBox;
  btn1: Vcl.StdCtrls.TButton;
  grid: Vcl.DBGrids.TDBGrid;
  mainPanel: Vcl.ExtCtrls.TPanel;
  btnClose: TButton;
  fdq: FireDAC.Comp.Client.TFDQuery;
begin
  mainPanel := TPanel.Create(self);
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

  fdq := TFDQuery.Create(mainPanel);
  fdq.Connection := ConnFireDAC;
  fdq.Open(SQL_GetOrdersList);

  MainDataSet := fdq;
  grid := Vcl.DBGrids.TDBGrid.Create(mainPanel);
  grid.DataSource := TDataSource.Create(mainPanel);
  grid.DataSource.DataSet := fdq;
  grid.Align := alClient;
  grid.AlignWithMargins := True;
  grid.Parent := mainPanel;

  btn1 := TButton.Create(grbx);
  btn1.Caption := 'Edit';
  btn1.AlignWithMargins := True;
  btn1.Align := alLeft;
  btn1.Parent := grbx;


  btnClose := TButton.Create(grbx);
  btnClose.OnClick := EventOnButtonCloseClick;
  btnClose.Caption := 'Close';
  btnClose.AlignWithMargins := True;
  btnClose.Align := alRight;
  btnClose.Parent := grbx;

  grid.AutoSizeColumns();
end;

end.