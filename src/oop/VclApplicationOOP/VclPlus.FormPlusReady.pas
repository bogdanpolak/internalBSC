unit VclPlus.FormPlusReady;

interface

uses
  System.Classes,
  Vcl.ExtCtrls,
  Vcl.Forms;

type
  TFormWithReadyEvent = class(TForm)
  private
    FTimer: TTimer;
    FOnFormReady: TNotifyEvent;
    procedure OnTimerEvent(Sender: TObject);
    procedure SetOnFormReady(const Value: TNotifyEvent);
  protected
    // procedure FormReady; virtual; abstract;
  public
    constructor Create (Owner: TComponent); override;
    property OnFormReady: TNotifyEvent read FOnFormReady write SetOnFormReady;
  end;

implementation

{ TFormWithReadyEvent }

constructor TFormWithReadyEvent.Create(Owner: TComponent);
begin
  inherited;
  FTimer := TTimer.Create(Self);
  FTimer.OnTimer := OnTimerEvent;
  FTimer.Interval := 1;
  FTimer.Enabled := True;
end;

procedure TFormWithReadyEvent.OnTimerEvent(Sender: TObject);
begin
  if Assigned(FOnFormReady) then
    FOnFormReady(Sender);
  FTimer.Free;
  FTimer := nil;
end;

procedure TFormWithReadyEvent.SetOnFormReady(const Value: TNotifyEvent);
begin
  FOnFormReady := Value;
end;

end.
