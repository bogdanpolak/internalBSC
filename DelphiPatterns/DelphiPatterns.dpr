program DelphiPatterns;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  MVC.Work in 'MVC.Work.pas',
  Work.CommandOne in 'Work.CommandOne.pas',
  Frame.AnonymousEvent in 'Frame.AnonymousEvent.pas' {FrameAnonymousEvent: TFrame},
  Frame.ButtonsGroup in 'Frame.ButtonsGroup.pas' {FrameButtonsGroup: TFrame},
  Utils.AnonymousEvent in 'Utils.AnonymousEvent.pas',
  Work.Messaging in 'Work.Messaging.pas',
  Module.MessagingWork in 'Module.MessagingWork.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
