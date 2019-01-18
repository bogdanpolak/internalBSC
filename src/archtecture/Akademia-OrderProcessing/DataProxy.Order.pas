unit DataProxy.Order;

interface

uses
  Data.DB,
  Data.DataProxy;

type
  TOrderProxy = class(TDatasetProxy)
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
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

{ TOrder }

uses
  System.SysUtils,
  Database.Connector;

procedure TOrderProxy.ConnectFields;
begin
  OrderID := FDataSet.FieldByName('OrderID') as TIntegerField;
  CustomerID := FDataSet.FieldByName('CustomerID') as TStringField;
  EmployeeID := FDataSet.FieldByName('EmployeeID') as TIntegerField;
  OrderDate := FDataSet.FieldByName('OrderDate') as TDateField;
  RequiredDate := FDataSet.FieldByName('RequiredDate') as TDateField;
  ShippedDate := FDataSet.FieldByName('ShippedDate') as TDateField;
  ShipVia := FDataSet.FieldByName('ShipVia') as TIntegerField;
  Freight := FDataSet.FieldByName('Freight') as TBCDField;
{$IFDEF CONSOLEAPP}
  WriteLn(' [Data.Proxy] [OK] Proxy object: Order');
{$ENDIF}
end;

end.
