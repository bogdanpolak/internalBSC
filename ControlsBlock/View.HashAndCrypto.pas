unit View.HashAndCrypto;

interface

uses MVC.ViewBlocks, MVC.FrameBlock, Vcl.Controls;

type
  THashAndCryptoBlock = class(TFrameBlock)
    procedure CheckIsFrameClosing(Sender: TObject);
  public
    procedure BuildAndShow(); reintroduce;

  end;

implementation

uses Vcl.ExtCtrls, Frame.HashAndCrypto;

procedure THashAndCryptoBlock.BuildAndShow;
begin
  inherited BuildAndShow(TFrameHashes);
  with TTimer.Create(Self) do begin
    Interval := 200;
    OnTimer := CheckIsFrameClosing;
    Enabled := True;
  end;
end;

procedure THashAndCryptoBlock.CheckIsFrameClosing(Sender: TObject);
var
  frm: TFrameHashes;
begin
  frm := self.Frame as TFrameHashes;
  if frm.isFrameClosing  then
  begin
    frm.Free;
    self.Free;
  end;
end;

end.
