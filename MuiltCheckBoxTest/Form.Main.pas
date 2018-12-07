unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TStrapKind = (skSingleGroup, skSubGroups);
  TGenerateMode = (gmStandard, gmNoRedraw);

  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    btnClearAll: TButton;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure btnClearAllClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateStraps(AContainer: TWinControl; kind: TStrapKind;
      numStraps: integer);
    procedure Generate(AContainer: TWinControl; mode: TGenerateMode;
      StrapsNumber: integer);
    procedure InvalidateRecusively(ctrl: TControl);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function GenerateGroupBoxL(Container: TWinControl; AWidth: integer): TGroupBox;
begin
  Result := TGroupBox.Create(Container);
  Result.AlignWithMargins := true;
  Result.Left := 9999;
  Result.Align := alLeft;
  Result.Width := AWidth;
  Result.Parent := Container;
end;

function GenerateGroupBoxT(Container: TWinControl; AHeight: integer): TGroupBox;
begin
  Result := TGroupBox.Create(Container);
  Result.AlignWithMargins := true;
  Result.Top := 9999;
  Result.Align := alTop;
  Result.Height := AHeight;
  Result.Parent := Container;
end;

procedure GenerateCheckBoxesSet(Container: TWinControl; Count: integer);
var
  i: integer;
  chk: TCheckBox;
begin
  for i := 0 to Count - 1 do
  begin
    chk := TCheckBox.Create(Container);
    chk.AlignWithMargins := true;
    chk.Top := 9999;
    chk.Align := alTop;
    chk.Caption := 'Check Box' + IntToStr(i + 1);
    chk.Parent := Container;
  end;
end;

procedure GenerateStrap_SigleGroup(AContainer: TWinControl);
var
  grbx: TGroupBox;
begin
  grbx := GenerateGroupBoxL(AContainer, 150);
  GenerateCheckBoxesSet(grbx, 30);
end;

procedure GenerateStrap_ThreeSubGroups(AContainer: TWinControl);
var
  grbx1: TGroupBox;
  grbx2: TGroupBox;
  j: integer;
begin
  grbx1 := GenerateGroupBoxL(AContainer, 150);
  grbx1.Caption := 'Master';
  for j := 0 to 2 do
  begin
    grbx2 := GenerateGroupBoxT(grbx1, 270);
    grbx2.Caption := 'Child';
    GenerateCheckBoxesSet(grbx2, 10);
  end;
end;

procedure TForm1.GenerateStraps(AContainer: TWinControl; kind: TStrapKind;
  numStraps: integer);
var
  i: integer;
begin
  for i := 1 to numStraps do
    case kind of
      skSingleGroup:
        GenerateStrap_SigleGroup(AContainer);
      skSubGroups:
        GenerateStrap_ThreeSubGroups(AContainer);
    end;
end;

procedure TForm1.InvalidateRecusively(ctrl: TControl);
var
  i: integer;
  winctrl: TWinControl;
  child: TControl;
begin
  if ctrl is TWinControl then
  begin
    winctrl := ctrl as TWinControl;
    for i := 0 to winctrl.ControlCount - 1 do
    begin
      child := winctrl.Controls[i];
      if child is TWinControl then
        InvalidateRecusively(child)
      else
        child.Invalidate;
    end;
  end;
  ctrl.Invalidate;
end;

procedure TForm1.Generate(AContainer: TWinControl; mode: TGenerateMode;
  StrapsNumber: integer);
var
  t1: Cardinal;
  Enlapsed: Cardinal;
begin
  t1 := GetTickCount;
  case mode of
    gmStandard:
      GenerateStraps(AContainer, skSubGroups, StrapsNumber);
    gmNoRedraw:
      begin
        SendMessage(AContainer.Handle, WM_SETREDRAW, WPARAM(False), 0);
        Application.ProcessMessages;
        try
          GenerateStraps(AContainer, skSubGroups, StrapsNumber);
        finally
          SendMessage(AContainer.Handle, WM_SETREDRAW, WPARAM(true), 0);
        end;
        InvalidateRecusively(AContainer);
      end;
  end;
  Enlapsed := GetTickCount - t1;
  self.Caption := IntToStr(Enlapsed);
end;

procedure TForm1.btnClearAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := self.ControlCount - 1 downto 0 do
    if (self.Controls[i] <> GroupBox1) and (self.Controls[i] is TGroupBox) then
      (self.Controls[i] as TGroupBox).Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  StrapsNumber: integer;
  GenerateMode: TGenerateMode;
begin
  StrapsNumber := StrToInt(Edit1.Text);
  if ComboBox1.ItemIndex = 0 then
    GenerateMode := gmStandard
  else
    GenerateMode := gmNoRedraw;
  Generate(self, GenerateMode, StrapsNumber);
end;

end.
