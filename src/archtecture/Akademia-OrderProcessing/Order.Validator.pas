unit Order.Validator;

interface

uses
  DataProxy.Order;

type

  TOrderValidator = class
    function IsValid(aOrder: TOrderProxy): Boolean;
  end;

implementation

uses
  System.Variants;

function TOrderValidator.IsValid(aOrder: TOrderProxy): Boolean;
var
  valid: Boolean;
begin
  valid := not(aOrder.OrderDate.isNull) and not(aOrder.RequiredDate.isNull)
    and (aOrder.OrderDate.Value < aOrder.RequiredDate.Value) and
    (aOrder.ShippedDate.isNull or (aOrder.OrderDate.Value <
    aOrder.ShippedDate.Value));
  Result := valid;
{$IFDEF CONSOLEAPP}
  WriteLn('Validating Order....');
{$ENDIF}
end;

end.
