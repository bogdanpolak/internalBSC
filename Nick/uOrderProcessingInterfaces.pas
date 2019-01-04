unit uOrderProcessingInterfaces;

interface

type
  IOrder = interface
  ['{26188A06-065A-42D2-8A38-DE419CB36AF4}']
  // do nothing
  end;

  IOrderEntry = interface
  ['{81D4524B-D9D6-4C68-8226-5047B3128E34}']
    function EnterOrderIntoDatabase(const aOrder: IOrder): Boolean;
  end;

  IOrderValidator = interface
  ['{DA7B116E-C488-4B96-85F6-55ECB44FFC80}']
    function ValidateOrder(const aOrder: IOrder): Boolean;
  end;

  IOrderProcessor = interface
  ['{1BECFD6A-4DCE-4DC6-B613-84C2D1C3C562}']
    function ProcessOrder(const aOrder: IOrder): Boolean;
  end;

implementation

end.
