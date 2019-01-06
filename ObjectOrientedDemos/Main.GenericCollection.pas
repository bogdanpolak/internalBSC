unit Main.GenericCollection;

interface

procedure Execute_GenericCollectionDemo;

implementation

uses DataModule.CenericCollection;

type
  TOrder = class
    OrderID: Integer;
    CustomerID: String;
    EmployeeID: Integer;
    EmployeeName: String;
    OrderDate: TDateTime;
    RequiredDate: TDateTime;
    ShippedDate: TDateTime;
    ShipVia: Integer;
    Freight: Currency;
  end;


procedure Execute_GenericCollectionDemo;
begin

end;

end.
