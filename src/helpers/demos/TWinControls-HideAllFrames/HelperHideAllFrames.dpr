program HelperHideAllFrames;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Frame.Command in 'Frame.Command.pas' {CommandFrame: TFrame},
  Frame.Grid in 'Frame.Grid.pas' {GridFrame: TFrame},
  Helper.TWinControl in '..\..\Helper.TWinControl.pas',
  Module.Customers in 'Module.Customers.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
