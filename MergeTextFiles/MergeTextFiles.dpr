program MergeTextFiles;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {FormMain},
  Helper.TGroupBox in 'Helper.TGroupBox.pas',
  Global.AppConfiguration in 'Global.AppConfiguration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
