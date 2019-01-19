unit Plus.TWork;

interface

uses
  System.Classes,
  System.SysUtils,
  System.Generics.Collections,
  VCL.ActnList;

type
  TWork = class;

  EInvalidWork = class(Exception);

  TWorkAction = class(TAction)
  private
    FWork: TObjectList<TWork>;
  protected
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure RegisterWork(aWork: TWork);
    function AddWork<T: TWork>: T;
  end;

  TWork = class(TComponent)
  private
    FWorkAction: TWorkAction;
    FOnWorkDone: TNotifyEvent;
    FOnWorkStart: TNotifyEvent;
    procedure SetWorkAction(const aWorkAction: TWorkAction);
    procedure ValidateIfWorkActionIsSet;
    function GetCaption: string;
    procedure SetCaption(ACaption: string);
    procedure SetOnWorkStart(const Event: TNotifyEvent);
    procedure SetOnWorkDone(const Event: TNotifyEvent);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: boolean; virtual; abstract;
    procedure CallWorkDone;
    procedure CallWorkStart;
    property WorkAction: TWorkAction read FWorkAction write SetWorkAction;
    property Caption: String read GetCaption write SetCaption;
    property OnWorkStart: TNotifyEvent read FOnWorkStart write SetOnWorkStart;
    property OnWorkDone: TNotifyEvent read FOnWorkDone write SetOnWorkDone;
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
  if not(AOwner is TWorkAction) then
    raise EInvalidWork.Create
      ('TWork cant be created. TWorkAction is required as TWork Owner');
  inherited;
  WorkAction := (AOwner as TWorkAction);
end;

destructor TWork.Destroy;
begin

  inherited;
end;

procedure TWork.SetWorkAction(const aWorkAction: TWorkAction);
begin
  FWorkAction := aWorkAction;
end;

procedure TWork.ValidateIfWorkActionIsSet;
begin
  if FWorkAction = nil then
    raise EInvalidWork.Create
      ('TWorkAction is required. Set property TWork.WorkAction.');
end;

function TWork.GetCaption: string;
begin
  ValidateIfWorkActionIsSet;
  Result := WorkAction.Caption;
end;

procedure TWork.SetCaption(ACaption: string);
begin
  ValidateIfWorkActionIsSet;
  WorkAction.Caption := ACaption;
end;

procedure TWork.SetOnWorkDone(const Event: TNotifyEvent);
begin
  FOnWorkDone := Event;
end;

procedure TWork.SetOnWorkStart(const Event: TNotifyEvent);
begin
  FOnWorkStart := Event;
end;

// -------------------------------------------------------------------
// -------------------------------------------------------------------
// TActionWork
// -------------------------------------------------------------------

function TWorkAction.AddWork<T>: T;
var
  aWork: TWork;
begin
  aWork := T.Create(Self);
  Self.RegisterWork(aWork);
  Result := aWork as T;
end;

constructor TWorkAction.Create(AOwner: TComponent);
begin
  inherited;
  FWork := TObjectList<TWork>.Create;
end;

destructor TWorkAction.Destroy;
begin
  FWork.Free;
  inherited;
end;

function TWorkAction.HandlesTarget(Target: TObject): Boolean;
var
  isAccepted: Boolean;
begin
  isAccepted := (Target <> nil);
  Result := isAccepted;
end;

procedure TWorkAction.ExecuteTarget(Target: TObject);
var
  Work: TWork;
begin
  inherited;
  for Work in FWork do
    Work.Execute;
end;

procedure TWorkAction.RegisterWork(aWork: TWork);
begin
  FWork.Add(aWork);
end;

end.
