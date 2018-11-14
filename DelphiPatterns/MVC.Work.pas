unit MVC.Work;

interface

uses
  System.Classes,
  VCL.ActnList;

type
  TWork = class (TComponent)
  private
    FCaption: String;
    FAction: TAction;
    function GetAction: TAction;
    procedure SetCaption (ACaption: string);
    procedure ExecuteEvent (Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DoWork: boolean;  virtual; abstract;
    procedure SetActionEnable (Enable: boolean);
    property Caption: String read FCaption write SetCaption;
    property Action: TAction read GetAction;
  end;

implementation

{ TWork }

constructor TWork.Create(AOwner: TComponent);
begin
  inherited;
  FAction := TAction.Create(self);
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

procedure TWork.SetActionEnable(Enable: boolean);
begin
  FAction.Enabled := Enable;
end;

end.
