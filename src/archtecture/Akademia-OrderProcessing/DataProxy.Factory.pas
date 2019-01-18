unit DataProxy.Factory;

interface

uses
  // --- FireDAC - TFDQuery -------
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Stan.Async,
  // ------------------------------
  Data.DataProxy,
  System.Classes,
  DataProxy.Categories,
  DataProxy.Customers,
  DataProxy.Order,
  DataProxy.OrderDetails,
  DataProxy.Products;

type
  TDataProxyFactory = class (TComponent)
    function GetDataProxy_Order1 (OrderID: integer): TOrderProxy;
    function GetDataProxy_OrderDetails (OrderID: integer): TOrderDetailsProxy;
    function GetDataProxy_Categories: TCategoriesProxy;
    function GetDataProxy_Customers: TCustomersProxy;
  end;

var
  DataProxyFactory :TDataProxyFactory;

implementation

uses
  Database.Connector;

const
  SQL_SELECT_Order = 'SELECT OrderID, CustomerID, EmployeeID, OrderDate, ' +
    ' RequiredDate,ShippedDate,ShipVia,Freight FROM {id Orders} ' +
    ' WHERE OrderID = :OrderID';
  SQL_SELECT_OrderDetails = 'SELECT OrderID, ProductID, UnitPrice, Quantity, '+
  ' Discount FROM "Order Details" WHERE OrderID = :OrderID';
  SQL_SELECT_Categories = 'SELECT CATEGORYID, CATEGORYNAME. DESCRIPTION, ' +
    ' PICTURE FROM {id Categories}';
  SQL_SELECT_Customers = 'SELECT CUSTOMERID, COMPANYNAME, CONTACTNAME, ' +
    ' CONTACTTITLE, ADDRESS, CITY, REGION, POSTALCODE, COUNTRY PHONE, FAX' +
    ' FROM {id Customers} ';

function TDataProxyFactory.GetDataProxy_Categories: TCategoriesProxy;
var
  fdq: TFDQuery;
begin
  Result := TCategoriesProxy.Create(self);
  fdq := TFDQuery.Create(Result);
  fdq.Connection := GlobalConnector.GetMainConnection;
  fdq.SQL.Text := SQL_SELECT_Categories;
  Result.ConnectWithDataSet(fdq);
end;

function TDataProxyFactory.GetDataProxy_Customers: TCustomersProxy;
var
  fdq: TFDQuery;
begin
  Result := TCustomersProxy.Create(self);
  fdq := TFDQuery.Create(Result);
  fdq.Connection := GlobalConnector.GetMainConnection;
  fdq.SQL.Text := SQL_SELECT_Customers;
  Result.ConnectWithDataSet(fdq);
end;

function TDataProxyFactory.GetDataProxy_Order1(OrderID: integer): TOrderProxy;
var
  fdq: TFDQuery;
begin
  Result := TOrderProxy.Create(self);
  fdq := TFDQuery.Create(Result);
  fdq.Connection := GlobalConnector.GetMainConnection;
  fdq.SQL.Text := SQL_SELECT_Order;
  fdq.ParamByName('OrderID').AsInteger := OrderID;
  Result.ConnectWithDataSet(fdq);
end;

function TDataProxyFactory.GetDataProxy_OrderDetails(
  OrderID: integer): TOrderDetailsProxy;
var
  fdq: TFDQuery;
begin
  Result := TOrderDetailsProxy.Create(self);
  fdq := TFDQuery.Create(nil);
  fdq.Connection := GlobalConnector.GetMainConnection;
  fdq.SQL.Text := SQL_SELECT_OrderDetails;
  fdq.ParamByName('OrderID').AsInteger := OrderID;
  Result.ConnectWithDataSet(fdq);
end;

initialization
   DataProxyFactory := TDataProxyFactory.Create(nil);
finalization
  DataProxyFactory.Free;
end.
