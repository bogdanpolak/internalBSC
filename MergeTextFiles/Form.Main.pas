unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Vcl.StdActns, Vcl.Menus, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

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
    edtImportURL: TEdit;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    btnImportFromWeb: TButton;
    lbWebImport: TLabel;
    IdHTTP1: TIdHTTP;
    Splitter2: TSplitter;
    ActionManager1: TActionManager;
    actEditCut1: TEditCut;
    actEditCopy1: TEditCopy;
    actFileSaveAs1: TFileSaveAs;
    PopupMenu1: TPopupMenu;
    Copy1: TMenuItem;
    Cut1: TMenuItem;
    actEditSelectAll1: TEditSelectAll;
    actEditUndo1: TEditUndo;
    actEditDelete1: TEditDelete;
    SelectAll1: TMenuItem;
    Delete1: TMenuItem;
    Undo1: TMenuItem;
    N1: TMenuItem;
    SaveAs1: TMenuItem;
    procedure actFileSaveAs1Accept(Sender: TObject);
    procedure btnImportFromWebClick(Sender: TObject);
    procedure btnMergeAllFilesClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lbxFilesToAddDblClick(Sender: TObject);
    procedure lbxFilesToRemoveDblClick(Sender: TObject);
  private
    procedure fillStringsWithTextFileNames(sl: TStrings; const dir: string);
    function mergeEverything(filesToAdd, filesToRemove: TStrings): string;
    procedure mergeAppendLinesFromAddFiles(slResultData: TStrings;
      filesToAdd: TStrings);
    procedure mergeDeleteLinesFromRemoveFiles(slResultData: TStrings;
      removeItemsList: TStrings);
    procedure mergeDeleteLinesFromList(slResultData: TStrings;
      slLinesToRemove: TStringList);
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  System.IOUtils, System.Types, Helper.TGroupBox, System.JSON,
  Global.AppConfiguration, Form.PreviewItem;

const
  LIST_WEB_PREFIX = '[WEB] ';

procedure TFormMain.actFileSaveAs1Accept(Sender: TObject);
begin
  ShowMessage ('not implemented yet. FielName: '+actFileSaveAs1.Dialog.FileName);
end;

procedure TFormMain.btnImportFromWebClick(Sender: TObject);
var
  cmd: string;
  sl: TStringList;
  idx: Integer;
begin
  sl := TStringList.Create;
  IdHTTP1.Request.UserAgent :=
    'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; MAAU)';
  sl.Text := IdHTTP1.Get(edtImportURL.Text);
  lbWebImport.Caption := Format('Zaimportowano: %d linii', [sl.Count]);
  cmd := LIST_WEB_PREFIX + edtImportURL.Text;
  idx := lbxFilesToRemove.Items.IndexOf(cmd);
  if idx >= 0 then
  begin
    (lbxFilesToRemove.Items.Objects[idx] as TStringList).Free;
    lbxFilesToRemove.Items.Delete(idx);
  end;
  lbxFilesToRemove.AddItem(cmd, sl);
end;

procedure TFormMain.btnMergeAllFilesClick(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Text := mergeEverything(lbxFilesToAdd.Items,
    lbxFilesToRemove.Items);
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  fillStringsWithTextFileNames(lbxFilesToAdd.Items, '.\add\');
  fillStringsWithTextFileNames(lbxFilesToRemove.Items, '.\remove\');
  TAppConfiguration.loadSecureConfiguration();
  edtImportURL.Text := TAppConfiguration.secureUrlUnsubscribe;
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

procedure TFormMain.fillStringsWithTextFileNames(sl: TStrings;
  const dir: string);
var
  files: TStringDynArray;
  i: Integer;
begin
  files := System.IOUtils.TDirectory.GetFiles(dir, '*.txt',
    TSearchOption.soTopDirectoryOnly);
  sl.BeginUpdate;
  for i := 0 to Length(files) - 1 do
    sl.Add(files[i]);
  sl.EndUpdate;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to lbxFilesToRemove.Count - 1 do
    if lbxFilesToRemove.Items[i].StartsWith(LIST_WEB_PREFIX) then
      (lbxFilesToRemove.Items.Objects[i] as TStringList).Free;
end;

procedure TFormMain.lbxFilesToAddDblClick(Sender: TObject);
var
  idx: Integer;
  ItemName: string;
  ItemContent: string;
begin
  idx := lbxFilesToAdd.ItemIndex;
  if idx >= 0 then
  begin
    ItemName := lbxFilesToAdd.Items[idx];
    if ItemName.StartsWith(LIST_WEB_PREFIX) then
      ItemContent := (lbxFilesToAdd.Items.Objects[idx] as TStringList).Text
    else
      ItemContent := TFile.ReadAllText(ItemName);
    TFormPreview.Execute(ItemContent);
  end;
end;

procedure TFormMain.lbxFilesToRemoveDblClick(Sender: TObject);
var
  idx: Integer;
  ItemName: string;
  ItemContent: string;
begin
  idx := lbxFilesToRemove.ItemIndex;
  if idx >= 0 then
  begin
    ItemName := lbxFilesToRemove.Items[idx];
    if ItemName.StartsWith(LIST_WEB_PREFIX) then
      ItemContent := (lbxFilesToRemove.Items.Objects[idx] as TStringList).Text
    else
      ItemContent := TFile.ReadAllText(ItemName);
    TFormPreview.Execute(ItemContent);
  end;
end;

function TFormMain.mergeEverything(filesToAdd, filesToRemove: TStrings): string;
var
  slResultData: TStringList;
begin
  slResultData := TStringList.Create;
  try
    mergeAppendLinesFromAddFiles(slResultData, filesToAdd);
    mergeDeleteLinesFromRemoveFiles(slResultData, filesToRemove);
    Result := slResultData.Text;
  finally
    slResultData.Free;
  end;

end;

procedure TFormMain.mergeAppendLinesFromAddFiles(slResultData: TStrings;
  filesToAdd: TStrings);
var
  fname: string;
  fileText: string;
begin
  for fname in filesToAdd do
  begin
    fileText := TFile.ReadAllText(fname);
    slResultData.Text := slResultData.Text + fileText;
  end;
end;

procedure TFormMain.mergeDeleteLinesFromRemoveFiles(slResultData: TStrings;
  removeItemsList: TStrings);
var
  slContent: TStringList;
  i: Integer;
  ItemName: string;
  isMemoryItem: boolean;
  memoryList: TStringList;
begin
  slContent := TStringList.Create;
  try
    for i := 0 to removeItemsList.Count - 1 do
    begin
      ItemName := removeItemsList[i];
      isMemoryItem := ItemName.StartsWith(LIST_WEB_PREFIX);
      if isMemoryItem then
      begin
        memoryList := removeItemsList.Objects[i] as TStringList;
        mergeDeleteLinesFromList(slResultData, memoryList);
      end
      else
      begin
        slContent.Clear;
        slContent.Text := TFile.ReadAllText(ItemName);
        mergeDeleteLinesFromList(slResultData, slContent);
      end;
    end;
  finally
    slContent.Free;
  end;
end;

procedure TFormMain.mergeDeleteLinesFromList(slResultData: TStrings;
  slLinesToRemove: TStringList);
var
  sLineToRemove: string;
  idx: Integer;
begin
  for sLineToRemove in slLinesToRemove do
    if not sLineToRemove.Trim.IsEmpty then
    begin
      idx := slResultData.IndexOf(sLineToRemove.Trim);
      if idx >= 0 then
        slResultData.Delete(idx);
    end;
end;

end.
