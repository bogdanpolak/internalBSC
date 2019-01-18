unit Order.ShippmentProcesor;

interface

uses
  System.Classes,
  Data.DB,
  Shippment,
  DataProxy.Order,
  Order.Validator;

type
  TShipmentProcessor = class(TComponent)
  private
  public
    procedure ShipOrder (Shippment: TShippment);
  end;

implementation

uses DataProxy.OrderDetails, Data.DataProxy, DataProxy.Factory;

procedure TShipmentProcessor.ShipOrder (Shippment: TShippment);
var
  isValid: Boolean;
  OrderDetails: TOrderDetailsProxy;
  Order: TOrderProxy;
  OrderValidator: TOrderValidator;
  TotalQuantity: Integer;
begin
  OrderValidator := TOrderValidator.Create;
  try
    Order := DataProxyFactory.GetDataProxy_Order1(Shippment.OrderID);
    Order.Open;
    OrderDetails := DataProxyFactory.GetDataProxy_OrderDetails(Shippment.OrderID);
    OrderDetails.Open;
    TotalQuantity := OrderDetails.GetTotalQuantity;
    WriteLn ( ' TotalQuantity: ', TotalQuantity);
    Order.Edit;
    Order.ShippedDate.Value := Shippment.ShipmentDate;
    Order.ShipVia.Value := Shippment.ShipperID;
    isValid := OrderValidator.isValid(Order);
    if isValid then
      Order.Post;
    Order.Free;
  finally
    OrderValidator.Free;
  end;
{$IFDEF CONSOLEAPP}
  WriteLn('Order has been processed....');
{$ENDIF}
end;

end.
