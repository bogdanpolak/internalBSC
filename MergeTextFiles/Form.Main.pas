unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lbxFilesToAdd: TListBox;
    lbTitleFilesToAdd: TLabel;
    Splitter1: TSplitter;
    lbTitleFilesToRemove: TLabel;
    lbxFilesToRemove: TListBox;
    Button1: TButton;
    lbTitleImport: TLabel;
    edtUnsubsrcribedURL: TEdit;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    btnImportUnsubscribed: TButton;
    lbUnsubscribed: TLabel;
    IdHTTP1: TIdHTTP;
    procedure btnImportUnsubscribedClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    slUnsubscribed: TStringList;
    procedure fillListBoxeWithTextFileNames(lbx: TListBox; const dir: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.IOUtils, System.Types;

procedure TForm1.btnImportUnsubscribedClick(Sender: TObject);
var
  s: string;
begin
  slUnsubscribed.Clear;
  slUnsubscribed.Text := IdHTTP1.Get(edtUnsubsrcribedURL.Text);
  lbUnsubscribed.Caption := Format('Zaimportowano: %d linii',
    [slUnsubscribed.Count]);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  slUnsubscribed := TStringList.Create;
  fillListBoxeWithTextFileNames(lbxFilesToAdd, '.\add\');
  fillListBoxeWithTextFileNames(lbxFilesToRemove, '.\remove\');
end;

procedure TForm1.FormResize(Sender: TObject);
var
  hg: Integer;
  ControlsToExclude: TArray<TControl>;
  AParent: TWinControl;
  sumHeight: Integer;
  i: Integer;
  ctrl: TControl;
  isExcluded: Boolean;
  j: Integer;
begin
  ControlsToExclude := [lbxFilesToAdd, lbxFilesToRemove];
  AParent := GroupBox1;
  // sumChildrenHeight
  sumHeight := 0;
  for i := 0 to AParent.ControlCount-1 do
  begin
    ctrl := AParent.Controls[i];
    isExcluded := false;
    for j := 0 to Length(ControlsToExclude)-1 do
      if ControlsToExclude[j] = ctrl then
        isExcluded := True;
    if not isExcluded then begin
      sumHeight := sumHeight + ctrl.Height;
      if ctrl.AlignWithMargins then 
        sumHeight := sumHeight + ctrl.Margins.Top + ctrl.Margins.Bottom;
    end;
  end;
  hg := (GroupBox1.ClientHeight - sumHeight - 12) div 2;
  lbxFilesToAdd.Height := hg;
end;

procedure TForm1.fillListBoxeWithTextFileNames(lbx: TListBox;
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
