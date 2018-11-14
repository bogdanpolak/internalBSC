unit Action.Main.Command1;

interface

uses
  System.Classes,
  VCL.ActnList;

type
  TMainCommandOneAction = class (TAction)
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean; override;
  end;

implementation

{ TMainCommandOneAction }

constructor TMainCommandOneAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := 'Polecenie pierwsze';
end;

function TMainCommandOneAction.Execute: Boolean;
begin
  Caption := 'Klikniêto na polecenie 1';
  Result := True;
end;

end.
