unit Shippment;

interface

type
  TShippment = record
    OrderID: Integer;
    ShipmentDate: TDateTime;
    ShipperID: Integer;
    constructor Create (aOrderID: Integer; aShipmentDate: TDateTime; aShipperID: Integer);
  end;

implementation

{ TShippment }

constructor TShippment.Create(aOrderID: Integer; aShipmentDate: TDateTime;
  aShipperID: Integer);
begin
  OrderID := aOrderID;
  ShipmentDate := aShipmentDate;
  ShipperID := aShipperID;
end;

end.
