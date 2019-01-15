program VclApplicationOOP;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {FormMain},
  VclPlus.FormWithReady in 'VclPlus.FormWithReady.pas',
  VclPlus.Timer in 'VclPlus.Timer.pas',
  Form.Form2 in 'Form.Form2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
