unit Order.ShippmentProcesor;

interface

uses
  Shippment,
  DataProxy.Order,
  Order.Validator;

type
  TShipmentProcessor = class
  private
    FShippment: TShippment;
    FOrder: TOrderDAO;
    FOrderValidator: TOrderValidator;
  public
    constructor Create(aShippment: TShippment);
    destructor Destroy; override;
    procedure ShipCurrentOrder;

  end;

implementation

constructor TShipmentProcessor.Create(aShippment: TShippment);
begin
  FShippment := aShippment;
  FOrder := TOrderDao.Create(nil);
  FOrderValidator := TOrderValidator.Create;
end;

destructor TShipmentProcessor.Destroy;
begin
  FOrder.Free;
  FOrderValidator.Free;
  inherited;
end;

procedure TShipmentProcessor.ShipCurrentOrder;
begin
  FOrder.Open(FShippment.OrderID);
  FOrderValidator.isValid(FOrder);
  // if isValid then
  // FOrder.Post;
{$IFDEF CONSOLEAPP}
  WriteLn('Order has been processed....');
{$ENDIF}
end;

end.
