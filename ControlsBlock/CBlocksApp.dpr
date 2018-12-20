program CBlocksApp;

uses
  Vcl.Forms,
  Form.Main in 'Form.Main.pas' {Form1},
  Helper.TDBGrid in 'Helper.TDBGrid.pas',
  Frame.HashAndCrypto in 'Frame.HashAndCrypto.pas' {FrameHashes: TFrame},
  Utils.CipherAES128 in 'Utils.CipherAES128.pas',
  MVC.ViewBlocks in 'MVC.ViewBlocks.pas',
  View.OrderList in 'View.OrderList.pas',
  MVC.FrameBlock in 'MVC.FrameBlock.pas',
  View.HashAndCrypto in 'View.HashAndCrypto.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
