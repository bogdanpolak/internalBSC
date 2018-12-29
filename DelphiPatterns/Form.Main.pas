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
    RadioGroup1: TRadioGroup;
    btnDAO: TButton;
    procedure tmrAppReadyTimer(Sender: TObject);
    procedure btnAnonymousEventClick(Sender: TObject);
    procedure btnCloseAllFramesClick(Sender: TObject);
    procedure btnDAOClick(Sender: TObject);
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
  Frame.ButtonsGroup, Frame.DAO;

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

procedure TForm1.btnDAOClick(Sender: TObject);
begin
  CreateNewFrameInsideNewTabSheet(PageControl1, 'Delphi Classic DAO',
    TFrameDAO);
end;

function inDeveloperMode: boolean;
begin
  { TODO : Needs implementation }
  Result := True;
end;

procedure TForm1.tmrAppReadyTimer(Sender: TObject);
begin
  tmrAppReady.Enabled := false;
  if inDeveloperMode then
  begin
    if RadioGroup1.ItemIndex > 0 then
    begin
      case RadioGroup1.ItemIndex of
        1:
          btnAnonymousEvent.Click;
        2:
          btnDynamicButtonsDemo.Click;
        3:
          btnDAO.Click;
      end;
      PageControl1.ActivePage.SetFocus
    end;
  end;
end;

end.
