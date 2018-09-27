unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    Label1: TLabel;
    Splitter1: TSplitter;
    Label2: TLabel;
    ListBox2: TListBox;
    Button1: TButton;
    Label3: TLabel;
    Edit1: TEdit;
    ListBox3: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure fillListBoxeWithTextFileNames(lbx: TListBox; const dir: string);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.IOUtils, System.Types;

procedure TForm1.FormCreate(Sender: TObject);
begin
  fillListBoxeWithTextFileNames(ListBox1, '.\add\');
  fillListBoxeWithTextFileNames(ListBox2, '.\remove\');
end;

procedure TForm1.FormResize(Sender: TObject);
var
  hg: Integer;
begin
  hg := GroupBox1.ClientHeight;
  ListBox2.Height := (hg div 2) - 40;
end;

procedure TForm1.fillListBoxeWithTextFileNames(lbx: TListBox; const dir: string);
var
  files: TStringDynArray;
  i: Integer;
begin
  files := System.IOUtils.TDirectory.GetFiles(dir, '*.txt', TSearchOption.soTopDirectoryOnly);
  for i := 0 to Length(files) - 1 do
    lbx.Items.Add(files[i]);
end;

end.
