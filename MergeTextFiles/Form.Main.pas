unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFormMain = class(TForm)
    GroupBox1: TGroupBox;
    lbxFilesToAdd: TListBox;
    lbTitleFilesToAdd: TLabel;
    Splitter1: TSplitter;
    lbTitleFilesToRemove: TLabel;
    lbxFilesToRemove: TListBox;
    btnMergeAllFiles: TButton;
    lbTitleImport: TLabel;
    edtUnsubsrcribedURL: TEdit;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    btnImportUnsubscribed: TButton;
    lbUnsubscribed: TLabel;
    IdHTTP1: TIdHTTP;
    procedure btnImportUnsubscribedClick(Sender: TObject);
    procedure btnMergeAllFilesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    slUnsubscribed: TStringList;
    procedure fillListBoxeWithTextFileNames(lbx: TListBox; const dir: string);
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  System.IOUtils, System.Types, Helper.TGroupBox, System.JSON,
  Global.AppConfiguration;

procedure TFormMain.btnImportUnsubscribedClick(Sender: TObject);
var
  s: string;
  c: Tcontrol;
begin
  slUnsubscribed.Clear;
  IdHttp1.Request.UserAgent := 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; MAAU)';
  slUnsubscribed.Text := IdHTTP1.Get(edtUnsubsrcribedURL.Text);
  lbUnsubscribed.Caption := Format('Zaimportowano: %d linii',
    [slUnsubscribed.Count]);
end;

procedure TFormMain.btnMergeAllFilesClick(Sender: TObject);
var
  fname: string;
  fileText: string;
  slResultData: TStringList;
  slFileContent: TStringList;
  sLineToRemove: string;
  idx: Integer;
begin
  Memo1.Clear;
  slResultData := TStringList.Create;
  slFileContent := TStringList.Create;
  try
    for fname in lbxFilesToAdd.Items do
    begin
      fileText := TFile.ReadAllText(fname);
      slResultData.Text := slResultData.Text + fileText;
    end;
    for fname in lbxFilesToRemove.Items do
    begin
      slFileContent.Clear;
      slFileContent.Text := TFile.ReadAllText(fname);
      for sLineToRemove in slFileContent do
        if not sLineToRemove.Trim.IsEmpty then begin
          idx :=  slResultData.IndexOf(sLineToRemove.Trim);
          if idx>=0 then
            slResultData.Delete(idx);
      end;
    end;
    Memo1.Lines := slResultData;
  finally
    slFileContent.Free;
    slResultData.Free;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  slUnsubscribed := TStringList.Create;
  fillListBoxeWithTextFileNames(lbxFilesToAdd, '.\add\');
  fillListBoxeWithTextFileNames(lbxFilesToRemove, '.\remove\');
  TAppConfiguration.loadSecureConfiguration();
  edtUnsubsrcribedURL.Text := TAppConfiguration.secureUrlUnsubscribe;
end;

procedure TFormMain.FormResize(Sender: TObject);
var
  sumHeight: Integer;
  hg: Integer;
begin
  sumHeight := GroupBox1.ChildrensSumHeight([lbxFilesToAdd, lbxFilesToRemove]);
  hg := (GroupBox1.ClientHeight - sumHeight) div 2;
  lbxFilesToAdd.Height := hg;
end;

procedure TFormMain.fillListBoxeWithTextFileNames(lbx: TListBox;
  const dir: string);
var
  files: TStringDynArray;
  i: Integer;
begin
  files := System.IOUtils.TDirectory.GetFiles(dir, '*.txt',
    TSearchOption.soTopDirectoryOnly);
  for i := 0 to Length(files) - 1 do
    lbx.Items.Add(files[i]);
end;

end.
