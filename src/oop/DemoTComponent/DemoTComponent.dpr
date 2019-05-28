program DemoTComponent;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Base.Receiver in 'Base.Receiver.pas',
  Base.Bar in 'Base.Bar.pas',
  Base.Foo in 'Base.Foo.pas',
  Form.Second in 'Form.Second.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
