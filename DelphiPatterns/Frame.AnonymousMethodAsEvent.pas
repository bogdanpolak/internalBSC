unit Frame.AnonymousMethodAsEvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrameAnonyMethodAsEvent = class(TFrame)
    Button1: TButton;
    tmrFrameReady: TTimer;
    procedure tmrFrameReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

type
  TNotifyEventWrapper = class(TComponent)
  private
    FProc: TProc<TObject>;
  public
    constructor Create(Owner: TComponent; Proc: TProc<TObject>);
  published
    procedure Event(Sender: TObject);
  end;

constructor TNotifyEventWrapper.Create(Owner: TComponent; Proc: TProc<TObject>);
begin
  inherited Create(Owner);
  FProc := Proc;
end;

procedure TNotifyEventWrapper.Event(Sender: TObject);
begin
  FProc(Sender);
end;

function AnonProc2NotifyEvent(Owner: TComponent; Proc: TProc<TObject>)
  : TNotifyEvent;
begin
  Result := TNotifyEventWrapper.Create(Owner, Proc).Event;
end;

procedure TFrameAnonyMethodAsEvent.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
  Button1.OnClick := AnonProc2NotifyEvent(Button1,
    procedure(Sender: TObject)
    begin
      (Sender as TButton).Caption := 'Clicked';
    end);
end;

end.
