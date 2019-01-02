unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFormMain = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btnPostMessage1: TButton;
    btnShowSubscribers: TButton;
    Edit1: TEdit;
    chkFastAnimataion: TCheckBox;
    btnExit: TButton;
    ColorBox1: TColorBox;
    GridPanel1: TGridPanel;
    btnPause: TButton;
    btnAnimate: TButton;
    procedure btnAnimateClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnPostMessage1Click(Sender: TObject);
    procedure btnShowSubscribersClick(Sender: TObject);
    procedure chkFastAnimataionClick(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
  private
    procedure UpdateControlsEnable(Registered: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses Messaging.EventBus, Global.MessagesID, Unit1;


procedure TFormMain.UpdateControlsEnable (Registered: boolean);
begin
	btnShowSubscribers.Enabled := not Registered;
	btnPostMessage1.Enabled := Registered;
	Edit1.Enabled := Registered;
	chkFastAnimataion.Enabled := Registered;
	ColorBox1.Enabled := Registered;
	btnPause.Enabled := Registered;
	btnAnimate.Enabled := Registered;
end;

procedure TFormMain.btnShowSubscribersClick(Sender: TObject);
var
	frm1: TForm1;
begin
  UpdateControlsEnable(true);
	// ---
	frm1 := TForm1.Create(Application);
	frm1.Visible := true;
	frm1.Left := Left + Width;
	frm1.Top := Top;
	frm1.Show();
	// ---
  {
	TForm2* frm2;
	Application->CreateForm(__classid(TForm2), &frm2);
	// TForm2* frm2 = new TForm2(this);
	frm2->Visible = true;
	frm2->Left = frm1->Left + frm1->Width;
	frm2->Top = this->Top;
	frm2->Show();
  }
end;

procedure TFormMain.btnPostMessage1Click(Sender: TObject);
var
  AMessage: TEventMessage;
begin
  AMessage.TagString := Edit1.Text;
  GetDefaultEventBus().PostMessage(EB_BOARD_StartScroll, AMessage);
end;


procedure TFormMain.chkFastAnimataionClick(Sender: TObject);
begin
	{
  std::unique_ptr<TEventMessage>AMessage(new TEventMessage);
	AMessage->TagBoolean = chkFastAnimataion->Checked;
	GetDefaultEventBus()->PostMessage(EB_BOARD_ChangeSpeed, AMessage.get());
  }
end;

procedure TFormMain.ColorBox1Change(Sender: TObject);
begin
  {
	TColor col = ColorBox1->Selected;
	std::unique_ptr<TEventMessage>AMessage(new TEventMessage);
	AMessage->TagInt = col;
	GetDefaultEventBus()->PostMessage(EB_BOARD_ChangeColor, AMessage.get());
  }
end;

procedure TFormMain.btnPauseClick(Sender: TObject);
begin
	GetDefaultEventBus().PostPing(EB_BOARD_Pause);
end;

procedure TFormMain.btnAnimateClick(Sender: TObject);
begin
	GetDefaultEventBus().PostPing(EB_BOARD_Animate);
end;

procedure TFormMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
