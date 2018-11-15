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
    btnAnonymousEvent: TButton;
    PageControl1: TPageControl;
    tmrAppReady: TTimer;
    btnCloseAllFrames: TButton;
    btnDynamicButtonsDemo: TButton;
    procedure tmrAppReadyTimer(Sender: TObject);
    procedure btnAnonymousEventClick(Sender: TObject);
    procedure btnCloseAllFramesClick(Sender: TObject);
    procedure btnDynamicButtonsDemoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Frame.AnonymousEvent,
  Frame.ButtonsGroup;

type
  TClassFrame = class of TFrame;

procedure CreateNewFrameInsideNewTabSheet(PageControl: TPageControl;
  const Caption: string; ClassFrame: TClassFrame);
var
  TabSheet: TTabSheet;
  AFrame: TFrame;
begin
  TabSheet := TTabSheet.Create(PageControl);
  TabSheet.Caption := Caption;
  TabSheet.PageControl := PageControl;
  PageControl.ActivePage := TabSheet;
  AFrame := ClassFrame.Create(TabSheet);
  AFrame.Parent := TabSheet;
  AFrame.Align := alClient;
end;


procedure TForm1.btnAnonymousEventClick(Sender: TObject);
begin
  CreateNewFrameInsideNewTabSheet(PageControl1, 'Anonymous Event',
    TFrameAnonymousEvent);
end;

procedure TForm1.btnCloseAllFramesClick(Sender: TObject);
var
  i: Integer;
begin
  for i := PageControl1.PageCount - 1 downto 0 do
    PageControl1.Pages[i].Free;
end;

procedure TForm1.btnDynamicButtonsDemoClick(Sender: TObject);
begin
  CreateNewFrameInsideNewTabSheet(PageControl1, 'Dynamic Buttons',
    TFrameButtonsGroup);
end;

procedure TForm1.tmrAppReadyTimer(Sender: TObject);
var
  btn: Vcl.StdCtrls.TButton;
  Container: Vcl.Controls.TWinControl;
begin
  tmrAppReady.Enabled := false;
end;

end.