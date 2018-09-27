program MergeTextFiles;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Helper.TGroupBox in 'Helper.TGroupBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
