unit Action.Main.Command2;

interface

uses
  System.Classes,
  VCL.ActnList;

type
  TMainCommandTwoAction = class (TAction)
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean; override;
  private
    procedure EmptyOnExecute(Sender: TObject);
  end;

implementation

{ TMainCommandOneAction }

constructor TMainCommandTwoAction.Create(AOwner: TComponent);
begin
  inherited;
  Caption := 'Polecenie drugie (2)';
  self.OnExecute := EmptyOnExecute;
end;

function TMainCommandTwoAction.Execute: Boolean;
begin
  Caption := 'Klikniêto dwójkê';
  Result := True;
end;

procedure TMainCommandTwoAction.EmptyOnExecute(Sender: TObject);
begin

end;

end.

