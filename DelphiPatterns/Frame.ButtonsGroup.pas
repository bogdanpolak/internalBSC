unit Frame.ButtonsGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  MVC.Work,
  Work.CommandOne;

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
  Work := WorkClass.Create(btn);
  btn.Top := 10000;
  btn.Align := alTop;
  btn.AlignWithMargins := True;
  btn.Caption := Work.Caption;
  btn.Parent := Container;
  btn.Action := Work.Action;
  Result := btn;
end;

constructor TFrameButtonsGroup.Create(AOwner: TComponent);
begin
  inherited;
  AddButtonToContainer(GroupBox1, TCommandOneWork);
end;

destructor TFrameButtonsGroup.Destroy;
begin

  inherited;
end;

procedure TFrameButtonsGroup.btnStaticTopClick(Sender: TObject);
begin
  btnStaticTop.Caption :=  'Check Buttons Tab Order';
end;

procedure TFrameButtonsGroup.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
  FixChildrensTabOrder(GroupBox1);
end;

end.
