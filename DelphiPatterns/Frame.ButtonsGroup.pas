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
    procedure tmrFrameReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrameButtonsGroup.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
end;

end.
