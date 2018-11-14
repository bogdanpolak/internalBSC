unit Work.CommandOne;

interface

uses
  System.Classes,
  MVC.Work;

type
  TCommandOneState = (csActive,csSecond,csDisabled);
type
  TCommandOneWork = class(TWork)
  public
    State: TCommandOneState;
    constructor Create(AOwner: TComponent); override;
    function DoWork: boolean;  override;
  end;

implementation

{ TCommandOneWork }

constructor TCommandOneWork.Create(AOwner: TComponent);
begin
  inherited;
  State := csActive;
  Caption := 'Polecenie pierwsze';
end;

function TCommandOneWork.DoWork: boolean;
begin
  if State=csActive then
  begin
    self.Caption := 'Kliknêto na polecenie 1';
    State := csSecond;
  end
  else if State=csSecond then
  begin
    State := csDisabled;
    Self.SetActionEnable(False);
  end;
end;

end.
