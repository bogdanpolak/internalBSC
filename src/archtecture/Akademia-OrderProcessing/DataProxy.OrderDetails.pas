unit DataProxy.OrderDetails;

interface

uses
  Data.DB,
  Data.DataProxy;

type
  TOrderDetailsProxy = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    OrderID: TIntegerField;
    ProductID: TIntegerField;
    UnitPrice: TBCDField;
    Quantity: TSmallintField;
    Discount: TSingleField;
    // property DataSet: TDataSet read FDataSet;
    function GetTotalQuantity: integer;
  end;

implementation

{ TOrder }

uses Database.Connector;

const
  SQL_SELECT_OrderDetails = 'SELECT OrderID, ProductID, UnitPrice, Quantity, ' +
    ' Discount FROM "Order Details" WHERE OrderID = :OrderID';

procedure TOrderDetailsProxy.ConnectFields;
begin
  OrderID := FDataSet.FieldByName('OrderID') as TIntegerField;
  ProductID := FDataSet.FieldByName('ProductID') as TIntegerField;
  UnitPrice := FDataSet.FieldByName('UnitPrice') as TBCDField;
  Quantity := FDataSet.FieldByName('Quantity') as TSmallintField;
  Discount := FDataSet.FieldByName('Discount') as TSingleField;
{$IFDEF CONSOLEAPP}
  WriteLn(' [Data.Proxy] [OK] Proxy object: Order Details');
{$ENDIF}
end;

function TOrderDetailsProxy.GetTotalQuantity: integer;
var
  Quantity: integer;
begin
  Quantity := 0;
  Self.ForEach(
    procedure(dsp: TDatasetProxy)
    begin
      Quantity :=  Quantity + (dsp as TOrderDetailsProxy).Quantity.Value;
    end);
  Result := Quantity;
end;

end.
