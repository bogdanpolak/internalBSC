{ * ------------------------------------------------------------------------
  * ♥  Bogdan Polak © 2019  ♥
  *  ----------------------------------------------------------------------- * }
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
    procedure SetupTimeBomb (DelayMs: integer = 1000);
  end;

implementation

{ TFoo }

constructor TFoo.Create(AOwner: TComponent);
begin
  inherited;
end;

procedure TFoo.OnTimer(Sender: TObject);
begin
  Free;
end;

procedure TFoo.SetupTimeBomb(DelayMs: integer);
begin
  FTimer := TTimer.Create(Self);
  FTimer.Interval := DelayMs;
  FTimer.OnTimer := OnTimer;
  FTimer.Enabled := True;
end;

end.
