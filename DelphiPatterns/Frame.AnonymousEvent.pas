unit Frame.AnonymousEvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TFrameAnonymousEvent = class(TFrame)
    Button1: TButton;
    tmrFrameReady: TTimer;
    procedure tmrFrameReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Utils.AnonymousEvent;

procedure TFrameAnonymousEvent.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
  Button1.OnClick := AnonymousMethodToTNotifyEvent(Button1,
    procedure(Sender: TObject)
    begin
      (Sender as TButton).Caption := 'Clicked';
    end);
end;

end.
