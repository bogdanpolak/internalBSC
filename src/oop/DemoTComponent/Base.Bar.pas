{ * ------------------------------------------------------------------------
  * ♥  Bogdan Polak © 2019  ♥
  *  ----------------------------------------------------------------------- * }
unit Base.Bar;

interface

uses
  System.Classes;

type
  TBar = class (TComponent)
  private
    FInfo: string;
  public
    property Info: string read FInfo write FInfo;
  end;

implementation

end.
