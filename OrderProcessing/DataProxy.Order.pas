unit DataProxy.Order;

interface

uses
  Data.DB,
  Data.DataProxy,
  // FireDAC - TFDQuery ------------------------------
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Stan.Async;

type
  TOrderDAO = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    OrderID: TIntegerField;
    CustomerID: TStringField;
    EmployeeID: TIntegerField;
    OrderDate: TDateField;
    RequiredDate: TDateField;
    ShippedDate: TDateField;
    ShipVia: TIntegerField;
    Freight: TBCDField;
    procedure Open(OrderID: integer);
    procedure Close;
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

{ TOrder }

uses Database.Connector;

const
  SQL_SELECT_Order = 'SELECT OrderID, CustomerID, EmployeeID, OrderDate, ' +
    ' RequiredDate,ShippedDate,ShipVia,Freight FROM {id Orders} ' +
    ' WHERE OrderID = :OrderID';

procedure TOrderDao.Close;
begin

end;

procedure TOrderDao.ConnectFields;
begin
  OrderID := FDataSet.FieldByName('OrderID') as TIntegerField;
  CustomerID := FDataSet.FieldByName('CustomerID') as TStringField;
  EmployeeID := FDataSet.FieldByName('EmployeeID') as TIntegerField;
  OrderDate := FDataSet.FieldByName('OrderDate') as TDateField;
  RequiredDate := FDataSet.FieldByName('RequiredDate') as TDateField;
  ShippedDate := FDataSet.FieldByName('ShippedDate') as TDateField;
  ShipVia := FDataSet.FieldByName('ShipVia') as TIntegerField;
  Freight := FDataSet.FieldByName('Freight') as TBCDField;
end;

procedure TOrderDao.Open(OrderID: integer);
var
  fdq: TFDQuery;
  cust: string;
  id: string;
begin
  if not Assigned(FDataSet) then
  begin
    fdq := TFDQuery.Create(nil);
    fdq.SQL.Text := SQL_SELECT_Order;
    fdq.Connection := GlobalConnector.GetMainConnection;
    FDataSet := fdq;
{$IFDEF CONSOLEAPP}
    WriteLn('Created Order DAO object....');
{$ENDIF}
  end;
  (FDataSet as TFDQuery).ParamByName('OrderID').AsInteger := OrderID;
  FDataSet.Open;
  ConnectFields;
  id := self.OrderID.AsString;
  cust := self.CustomerID.AsString;
{$IFDEF CONSOLEAPP}
  WriteLn('DataSet opened.... OrderID: ',id,' for customer: ',cust);
{$ENDIF}
end;

end.
