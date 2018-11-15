unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    btnAnonymousMethosAsEvent: TButton;
    PageControl1: TPageControl;
    tmrAppReady: TTimer;
    btnCloseAllFrames: TButton;
    procedure tmrAppReadyTimer(Sender: TObject);
    procedure btnAnonymousMethosAsEventClick(Sender: TObject);
    procedure btnCloseAllFramesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Action.Main.Command1, Action.Main.Command2, MVC.Work, Work.CommandOne,
  Frame.AnonymousMethodAsEvent;

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

procedure TForm1.btnAnonymousMethosAsEventClick(Sender: TObject);
var
  TabSheet: TTabSheet;
  AFrame: TFrame;
begin
  TabSheet := TTabSheet.Create(PageControl1);
  TabSheet.Caption := 'Use anonymous method as TNotifyEvent';
  TabSheet.PageControl := PageControl1;
  AFrame := TFrameAnonyMethodAsEvent.Create(TabSheet);
  AFrame.Parent := TabSheet;
  AFrame.Align := alClient;
end;

procedure TForm1.btnCloseAllFramesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := PageControl1.PageCount - 1 downto 0 do
    PageControl1.Pages[i].Free;
end;

procedure TForm1.tmrAppReadyTimer(Sender: TObject);
var
  btn: Vcl.StdCtrls.TButton;
  Container: Vcl.Controls.TWinControl;
begin
  tmrAppReady.Enabled := false;
  btn := AddButtonToContainer(GroupBox1, TCommandOneWork);
  FixChildrensTabOrder(GroupBox1);
end;

end.
