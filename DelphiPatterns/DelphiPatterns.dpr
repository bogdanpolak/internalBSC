program DelphiPatterns;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  MVC.Work in 'MVC.Work.pas',
  Work.CommandOne in 'Work.CommandOne.pas',
  Frame.AnonymousMethodAsEvent in 'Frame.AnonymousMethodAsEvent.pas' {FrameAnonyMethodAsEvent: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
