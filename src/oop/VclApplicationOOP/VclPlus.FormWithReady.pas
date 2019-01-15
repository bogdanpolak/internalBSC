unit VclPlus.FormWithReady;

interface

uses
  System.Classes,
  Vcl.ExtCtrls,
  Vcl.Forms;

type
  TFormWithReady = class(TForm)
  private
    FTimer: TTimer;
    procedure OnTimerEvent(Sender: TObject);
  protected
    procedure FormReady; virtual; abstract;
  public
    constructor Create (Owner: TComponent); override;
  end;

implementation

{ TFormWithReadyEvent }

constructor TFormWithReady.Create(Owner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := OnTimerEvent;
  FTimer.Interval := 1;
  FTimer.Enabled := True;
end;

procedure TFormWithReady.OnTimerEvent(Sender: TObject);
begin
  try
    FormReady;
  finally
    FTimer.Free;
    FTimer := nil;
  end;
end;

end.
