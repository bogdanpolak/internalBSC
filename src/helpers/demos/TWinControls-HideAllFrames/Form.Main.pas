unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    tmrReady: TTimer;
    MainPanel: TPanel;
    procedure tmrReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Frame.Command, Frame.Grid, Helper.TWinControl;

procedure TForm1.tmrReadyTimer(Sender: TObject);
var
  CommandFrame: TCommandFrame;
  gridFrame: TGridFrame;
begin
  tmrReady.Enabled := False;
  // -----------------------------
  MainPanel.Hi
  MainPanel.HideAllChildFrames();
  CommandFrame := TCommandFrame.Create(MainPanel);
  CommandFrame.Align := alTop;
  CommandFrame.Parent := MainPanel;
  gridFrame := TGridFrame.Create(MainPanel);
  gridFrame.Align := alClient;
  gridFrame.Parent := MainPanel;
end;

end.
