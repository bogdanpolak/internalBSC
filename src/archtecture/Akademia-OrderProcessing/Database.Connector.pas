unit Database.Connector;

interface

uses
  FireDAC.Comp.Client;

type
  EDatabaseConnector = interface
    function GetMainConnection: TFDConnection;
    function GetNewConnection: TFDConnection;
  end;

type
  TDatabaseConnector = class (TInterfacedObject, EDatabaseConnector)
  private
    class var MainConnection: TFDConnection;
  public
    function GetMainConnection: TFDConnection;
    function GetNewConnection: TFDConnection; virtual; abstract;
  end;

var
  GlobalConnector: EDatabaseConnector;

implementation

{ TInterbaseDatabaseConnector }

function TDatabaseConnector.GetMainConnection: TFDConnection;
begin
  if not Assigned(MainConnection) then
    MainConnection := GetNewConnection;
  Result := MainConnection;
end;

end.
