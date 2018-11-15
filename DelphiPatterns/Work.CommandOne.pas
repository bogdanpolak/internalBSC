unit Work.CommandOne;

interface

uses
  System.Classes,
  MVC.Work,
  Vcl.ExtCtrls;

type
  TCommandOneState = (csReady,csPrepared,csWorking);
type
  TCommandOneWork = class(TWork)
  private
    FDisableTimer: TTimer;
    procedure DisableTimerEvent (Sender: TObject);
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
  State := csReady;
  Caption := 'Click to preapre';
  FDisableTimer := Vcl.ExtCtrls.TTimer.Create(Self);
  FDisableTimer.Enabled := False;
  FDisableTimer.OnTimer := DisableTimerEvent;
end;

function TCommandOneWork.DoWork: boolean;
begin
  if State=csReady then
  begin
    self.Caption := 'Command is prepared and ready';
    State := csPrepared;
  end
  else if State=csPrepared then
  begin
    State := csWorking;
    self.Caption := 'Working for 3 seconds';
    Self.SetActionEnable(False);
    FDisableTimer.Interval := 3000;
    FDisableTimer.Enabled := True;
  end;
end;

procedure TCommandOneWork.DisableTimerEvent(Sender: TObject);
begin
  FDisableTimer.Enabled := False;
  State := csReady;
  Caption := 'Click to preapre';
  Self.SetActionEnable(True);
end;

end.
