unit Work.Messaging;

interface

uses
  System.Classes,
  System.SysUtils,
  MVC.Work,
  Vcl.ExtCtrls;

type
  TMessagingWork = class(TWork)
  private
    FWorkerTimer: TTimer;
    FInProgress: boolean;
    FMaxSteps: Integer;
    procedure WorkerTimerEvent (Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    function DoWork: boolean;  override;
  end;

implementation

{ TMessagingWork }

constructor TMessagingWork.Create(AOwner: TComponent);
begin
  inherited;
  FWorkerTimer := TTimer.Create(self);
  FWorkerTimer.Enabled := False;
  FWorkerTimer.Interval := 300;
  FWorkerTimer.OnTimer := WorkerTimerEvent;
  FMaxSteps := 20;
  Caption := '[Work2] Start getting data';
end;

function TMessagingWork.DoWork: boolean;
begin
  if FWorkerTimer.Enabled then
    Caption := 'Just working ... busy'
  else
  begin
    FWorkerTimer.Tag := 0;
    FWorkerTimer.Enabled := True;
  end;
end;

procedure TMessagingWork.WorkerTimerEvent(Sender: TObject);
begin
  if FWorkerTimer.Tag = FMaxSteps then
  begin
    FWorkerTimer.Enabled := False;
    Caption := 'Done';
  end
  else
  begin
    FWorkerTimer.Tag := FWorkerTimer.Tag + 1;
    Caption := Format('Step: %d / %d ',[FWorkerTimer.Tag,FMaxSteps]);
  end;
end;

end.
