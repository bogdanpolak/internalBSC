unit View.OrderList;

interface

uses MVC.ViewBlocks, Vcl.Controls,
  // TODO: Usunąć zalezność od TFDConnection
  FireDAC.Comp.Client;

// ------------ ------------ ------------ ------------ ------------ --------
// Usuwanie zależności od TFDConection (koncepcja)
// * Singleton: function GetConnection: IDataConnection
// * Implementacja: TFireDacDataConnection = class (.., IDataConnection)
// * IDataConnection.GetAndOpenDataSet (ASQL, AParams, ATypes): TDataSet;
// * IDataConnection.GetAndOpenDataSet (ASQL, AParams, ATypes): TDataSet;
// ------------ ------------ ------------ ------------ ------------ --------

type
  TOrdersListBlock = class(TDataSetBlock)
  private
    procedure ConstructComponents(AContainer: TWinControl;
      ConnFireDAC: TFDConnection);
    procedure CloseAndFreeViewBlock;
    procedure EditCurrentOrder;
  protected
    procedure EventOnButtonEditClick(Stnder: TObject);
    procedure EventOnDblClick_DBGrid(Stnder: TObject);
    procedure EventOnButtonCloseClick(Stnder: TObject);
  public
    procedure BuildAndShow(ConnFireDAC: TFDConnection);
  end;

implementation

uses
  Vcl.StdCtrls, Vcl.DBGrids, Vcl.ExtCtrls, Data.DB, Helper.TDBGrid,
  System.SysUtils, Frame.OrderEdit;

procedure TOrdersListBlock.CloseAndFreeViewBlock;
begin
  self.Free;
end;

procedure TOrdersListBlock.EditCurrentOrder;
var
  AConnection: TFDConnection;
  OrderID: Integer;
  AContainer: TWinControl;
  mainPanel: TPanel;
begin
  AContainer := (Self.Owner as TWinControl);
  mainPanel := (AContainer.Controls[0] as TPanel);
  // TODO: Zależność od TFDQuery i TFDConnnection
  AConnection := (self.MainDataSet as TFDQuery).Connection as TFDConnection;
  // TODO: Nie ma obsługu NULL (gdy lista zamówień jest pusta)
  OrderID := self.MainDataSet.FieldByName('OrderID').AsInteger;
  mainPanel.Parent := nil;
  TFrameOrderEdit.ShowFrame (AContainer, AConnection, OrderID);
  mainPanel.Parent := AContainer;
  (MainDataSet as TFDQuery).RefreshRecord;
end;

procedure TOrdersListBlock.EventOnButtonEditClick(Stnder: TObject);
begin
  EditCurrentOrder;
end;

procedure TOrdersListBlock.EventOnDblClick_DBGrid(Stnder: TObject);
begin
  EditCurrentOrder;
end;

procedure TOrdersListBlock.EventOnButtonCloseClick(Stnder: TObject);
begin
  CloseAndFreeViewBlock;
end;

const
  // TODO: Przenieść SELECT-a do fabryki datasetów (przy okazji usuwania
  // zależności od TFDConnection
  SQL_GetOrdersList = 'SELECT Orders.OrderID, ' +
    '  Orders.CustomerID, Customers.CompanyName, ' + // -
    '  Orders.EmployeeID, ' + // -
    '  Employees.FirstName||'' ''||Employees.LastName EmployeeName, ' +
    '  Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, ' +
    '  Orders.ShipVia, Shippers.CompanyName ShipperCompany ' +
    'FROM {id Orders} Orders ' + // -
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
  mainPanel.Visible := False;
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
  grid.OnDblClick := EventOnDblClick_DBGrid;
  grid.Align := alClient;
  grid.AlignWithMargins := True;
  grid.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines,
    dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete,
    dgTitleClick, dgTitleHotTrack];
  grid.ReadOnly := True;
  grid.Parent := mainPanel;

  btn1 := TButton.Create(grbx);
  btn1.OnClick := EventOnButtonEditClick;
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

  mainPanel.Visible := True;
end;

procedure TOrdersListBlock.BuildAndShow(ConnFireDAC: TFDConnection);
begin
  if not(self.Owner is TWinControl) then
    raise Exception.Create
      ('Invalid Parent Class! Expected TWinControl as Parent.');
  ConstructComponents((self.Owner as TWinControl), ConnFireDAC);
end;

end.
