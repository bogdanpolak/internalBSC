program DemoTComponent;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {FormMain},
  Base.Receiver in 'Base.Receiver.pas',
  Base.Bar in 'Base.Bar.pas',
  Base.Foo in 'Base.Foo.pas',
  Form.Second in 'Form.Second.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
