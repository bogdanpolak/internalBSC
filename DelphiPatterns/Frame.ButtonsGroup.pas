unit Frame.ButtonsGroup;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFrameButtonsGroup = class(TFrame)
    Image1: TImage;
    tmrFrameReady: TTimer;
    GroupBox1: TGroupBox;
    btnStaticTop: TButton;
    btnStaticBottom: TButton;
    procedure btnStaticTopClick(Sender: TObject);
    procedure tmrFrameReadyTimer(Sender: TObject);
  private
    procedure CreateCommandButtons;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  System.Messaging,
  MVC.Work,
  Work.CommandOne, Utils.AnonymousEvent, Work.Messaging;

type
  TClassWork = class of TWork;

procedure FixChildrensTabOrder(Container: TWinControl);
var
  i: Integer;
  sl: TStringList;
  ControlPosition: string;
  AControl: TControl;
begin
  sl := TStringList.Create;
  try
    for i := 0 to Container.ControlCount - 1 do
    begin
      AControl := Container.Controls[i];
      ControlPosition := Format('%5d,%5d', [AControl.Top, AControl.Left]);
      if AControl is TWinControl then
        sl.AddObject(ControlPosition, AControl);
    end;
    sl.Sort;
    for i := 0 to sl.Count - 1 do
      (sl.Objects[i] as TWinControl).TabOrder := i;
  finally
    sl.Free;
  end;
end;

function AddButtonToContainer(Container: TWinControl;
  WorkClass: TClassWork): TButton;
var
  btn: TButton;
  Work: TWork;
begin
  btn := TButton.Create(Container);
  btn.Top := 10000;
  btn.Align := alTop;
  btn.AlignWithMargins := True;
  btn.Parent := Container;
  if WorkClass <> TWork then
  begin
    Work := WorkClass.Create(btn);
    btn.Action := Work.Action;
    btn.Caption := Work.Caption;
  end
  else
    btn.Caption := 'Nothing to do';
  Result := btn;
end;

function AddButtonAndEvent(Container: TWinControl; const ACaption: String;
  EventMethod: TProc<TObject>): TButton;
var
  btn: TButton;
begin
  btn := TButton.Create(Container);
  btn.Top := 10000;
  btn.Align := alTop;
  btn.AlignWithMargins := True;
  btn.Caption := ACaption;
  btn.Parent := Container;
  Result := btn;
  btn.OnClick := TNotifyEventWrapper.Create(btn, EventMethod).Event;
  Result := btn;
end;

function AddBevel(Container: TWinControl): TBevel;
var
  bevel: TBevel;
begin
  bevel := TBevel.Create(Container);
  bevel.Height := 3;
  bevel.Margins.Top := 5;
  bevel.Margins.Bottom := 5;
  bevel.Top := 10000;
  bevel.Align := alTop;
  bevel.AlignWithMargins := True;
  bevel.Parent := Container;
  Result := bevel;
end;

constructor TFrameButtonsGroup.Create(AOwner: TComponent);
begin
  inherited;

end;

destructor TFrameButtonsGroup.Destroy;
begin

  inherited;
end;

procedure TFrameButtonsGroup.CreateCommandButtons;
var
  AContainer: TWinControl;
begin
  AContainer := GroupBox1;
  AddButtonToContainer(AContainer, TCommandOneWork);
  AddBevel(AContainer);
  AddButtonToContainer(AContainer, TMessagingWork);
  AddBevel(AContainer);
  AddButtonAndEvent(AContainer, 'Adhoc Event Button',
    procedure(Sender: TObject)
    begin
      (Sender as TButton).Caption := 'Use the Force Luke!'
    end);
end;

procedure TFrameButtonsGroup.btnStaticTopClick(Sender: TObject);
begin
  btnStaticTop.Caption := 'Check Buttons Tab Order';
end;

function StringArrayToString(arr: array of String): string;
var
  i: Integer;
  arrSize: Integer;
begin
  arrSize := Length(arr);
  for i := 0 to arrSize - 1 do
  begin
    if i = 0 then
      Result := '[' + QuotedStr(arr[0])
    else
    begin
      Result := Result + ', ' + QuotedStr(arr[i]);
    end;
  end;
  if arrSize > 0 then
    Result := Result + ']';
end;

procedure TFrameButtonsGroup.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
  CreateCommandButtons();

  TMessageManager.DefaultManager.SubscribeToMessage(TMessage<TNotShippedOrders>,
    procedure(const Sender: TObject; const M: TMessage)
    var
      Data: TNotShippedOrders;
    begin
      Data := (M as TMessage<TNotShippedOrders>).Value;
      ShowMessage ('Orders not sipped yet: '+ StringArrayToString(Data.FOrdes) );
    end);

  FixChildrensTabOrder(GroupBox1);
end;

end.
