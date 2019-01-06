unit Main;

interface

procedure MainProc;

implementation

uses
  System.SysUtils,
  Shippment,
  DataProxy.Order,
  Order.ShippmentProcesor,
  Database.Connector,
  Database.Connector.Interbase;

procedure MainProc;
var
  Shippment: TShippment;
  processor: TShipmentProcessor;
begin
  Shippment := TShippment.Create(11077, Int(Now()), 3);
  GlobalConnector := TInterbaseDatabaseConnector.Create;
  processor := TShipmentProcessor.Create(Shippment);
  try
    processor.ShipCurrentOrder;
    WriteLn('Order successfully processed....');
  finally
    processor.Free;
  end;
end;

end.
