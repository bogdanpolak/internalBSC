unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Component.GraphicNumber, Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList;

type
  TForm1 = class(TForm)
    grbxOptions: TGroupBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    edtIncrease: TEdit;
    Splitter1: TSplitter;
    ActionList1: TActionList;
    Action1: TAction;
    CheckBox1: TCheckBox;
    procedure Action1Execute(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    GraphicNumber: TGraphicNumber;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  with GraphicNumber do
    Number := Number + StrToInt(edtIncrease.Text);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  GraphicNumber.Enabled := CheckBox1.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  aParent: TWinControl;
begin
  aParent := GroupBox2;
  GraphicNumber := TGraphicNumber.Create(aParent);
  GraphicNumber.AlignWithMargins := True;
  GraphicNumber.Margins.Bottom := 0;
  GraphicNumber.Align := alTop;
  GraphicNumber.Parent := aParent;
  GraphicNumber.Action := Action1;
  // ----------
  with TSplitter.Create(aParent) do begin
    Parent := aParent;
    Top := 999;
    Align := alTop;
    Height := 5;
  end;
end;

end.
