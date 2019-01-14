program TDataSetActionDemo;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Action.DataSet in 'Action.DataSet.pas',
  VclPlus.Timer in 'VclPlus.Timer.pas',
  VclPlus.FormPlusReady in 'VclPlus.FormPlusReady.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
