unit Base.Foo;

interface

uses
  System.Classes, Vcl.ExtCtrls;

type
  TFoo = class (TComponent)
  private
    FTimer: Vcl.ExtCtrls.TTimer;
    procedure OnTimer (Sender: TObject);
  public
    constructor Create (AOwner: TComponent); override;
  end;

implementation

{ TFoo }

constructor TFoo.Create(AOwner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(Self);
  FTimer.Interval := 600;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := True;
end;

procedure TFoo.OnTimer(Sender: TObject);
begin
  Free;
end;

end.
