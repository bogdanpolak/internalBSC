unit Plus.TWork;

interface

uses
  System.Classes,
  System.Generics.Collections,
  VCL.ActnList;

type
  TWork = class(TComponent)
  private
    FCaption: String;
    FAction: TAction;
    FOnWorkDone: TNotifyEvent;
    FOnWorkStart: TNotifyEvent;
    function GetAction: TAction;
    procedure SetCaption(ACaption: string);
    procedure ExecuteEvent(Sender: TObject);
    procedure SetOnWorkStart(const Event: TNotifyEvent);
    procedure SetOnWorkDone(const Event: TNotifyEvent);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DoWork: boolean; virtual; abstract;
    procedure CallWorkDone;
    procedure CallWorkStart;
    procedure SetActionEnable(Enable: boolean);
    property Caption: String read FCaption write SetCaption;
    property Action: TAction read GetAction;
    property OnWorkStart: TNotifyEvent read FOnWorkStart write SetOnWorkStart;
    property OnWorkDone: TNotifyEvent read FOnWorkDone write SetOnWorkDone;
  end;

type
  TActionWork = class(TAction)
  private
    FWork: TObjectList<TWork>;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegisterWork(aWork: TWork);
  end;

implementation

// -------------------------------------------------------------------
// -------------------------------------------------------------------
// TWork
// -------------------------------------------------------------------

procedure TWork.CallWorkDone;
begin
  if Assigned(OnWorkDone) then
    OnWorkDone(Self);
end;

procedure TWork.CallWorkStart;
begin
  if Assigned(OnWorkStart) then
    OnWorkStart(Self);
end;

constructor TWork.Create(AOwner: TComponent);
begin
  inherited;
  FAction := TAction.Create(Self);
  FAction.OnExecute := ExecuteEvent;
end;

destructor TWork.Destroy;
begin

  inherited;
end;

procedure TWork.ExecuteEvent(Sender: TObject);
begin
  DoWork;
end;

function TWork.GetAction: TAction;
begin
  FAction.Caption := FCaption;
  Result := FAction;
end;

procedure TWork.SetCaption(ACaption: string);
begin
  FCaption := ACaption;
  FAction.Caption := ACaption;
end;

procedure TWork.SetOnWorkDone(const Event: TNotifyEvent);
begin
  FOnWorkDone := Event;
end;

procedure TWork.SetOnWorkStart(const Event: TNotifyEvent);
begin
  FOnWorkStart := Event;
end;

procedure TWork.SetActionEnable(Enable: boolean);
begin
  FAction.Enabled := Enable;
end;

// -------------------------------------------------------------------
// -------------------------------------------------------------------
// TActionWork
// -------------------------------------------------------------------

constructor TActionWork.Create(AOwner: TComponent);
begin
  inherited;
  FWork := TObjectList<TWork>.Create;
end;

destructor TActionWork.Destroy;
begin
  FWork.Free;
  inherited;
end;

procedure TActionWork.RegisterWork(aWork: TWork);
begin
  FWork.Add(aWork);
end;

end.
