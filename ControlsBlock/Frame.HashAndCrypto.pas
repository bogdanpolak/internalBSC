unit Frame.HashAndCrypto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrameHashes = class(TFrame)
    Panel1: TPanel;
    mmResults: TMemo;
    GroupBox1: TGroupBox;
    edtSha1: TEdit;
    btnExecuteSHA1: TButton;
    tmrFrameReady: TTimer;
    btnClose: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    mmUsers: TMemo;
    Label1: TLabel;
    edtKey: TEdit;
    btnEncrypt: TButton;
    Label2: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure btnExecuteSHA1Click(Sender: TObject);
    procedure btnEncryptClick(Sender: TObject);
    procedure tmrFrameReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  System.Hash, Utils.CipherAES128;

procedure TFrameHashes.btnCloseClick(Sender: TObject);
begin
  self.Tag := -1;
end;

procedure TFrameHashes.btnExecuteSHA1Click(Sender: TObject);
var
  s: String;
begin
  mmResults.Lines.Add('------------------------------------------------');
  s := edtSha1.Text;
  mmResults.Lines.Add(QuotedStr(s) + ',' +
    QuotedStr(System.Hash.THashSHA1.GetHashString(edtSha1.Text)));
end;

procedure TFrameHashes.btnEncryptClick(Sender: TObject);
var
  s: String;
  key: String;
  aes_b64: string;
  pass: string;
begin
  mmResults.Lines.Add('------------------------------------------------');
  s := mmUsers.Lines.Text;
  key := edtKey.Text;
  aes_b64 := Utils.CipherAES128.TCipherAES128.Encrypt(s,key);
  mmResults.Lines.Add('Szyfrowanie zbioru hase³.');
  mmResults.Lines.Add('  *** d³ugoœæ: '+length(aes_b64).ToString);
  mmResults.Lines.Add(aes_b64);
  pass := Utils.CipherAES128.TCipherAES128.Decrypt(aes_b64,key);
  mmResults.Lines.Add('--');
  mmResults.Lines.Add (pass);
end;

procedure TFrameHashes.tmrFrameReadyTimer(Sender: TObject);
begin
  tmrFrameReady.Enabled := False;
  Panel1.Align := alClient;
  mmResults.Clear;
end;

end.
