unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateControls1;
    procedure CreateControls2;
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
  Result.Align := alLeft;
  Result.Width := AWidth;
  Result.Parent := Container;
end;

function GenerateGroupBoxT(Container: TWinControl; AHeight: integer): TGroupBox;
begin
  Result := TGroupBox.Create(Container);
  Result.AlignWithMargins := true;
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
    chk.Align := alTop;
    chk.Caption := 'Check Box' + IntToStr(i + 1);
    chk.Parent := Container;
  end;
end;

procedure TForm1.CreateControls1;
var
  grbx: TGroupBox;
begin
  grbx := GenerateGroupBoxL(self, 150);
  GenerateCheckBoxesSet(grbx, 30);
end;

procedure TForm1.CreateControls2;
var
  grbx1: TGroupBox;
  grbx2: TGroupBox;
  j: integer;
  i: integer;
  Enlapsed: Cardinal;
  t1: Cardinal;
begin
  t1 := GetTickCount;
  for i := 1 to 6 do
  begin
    grbx1 := GenerateGroupBoxL(self, 150);
    grbx1.Caption := 'Master';
    for j := 0 to 2 do
    begin
      grbx2 := GenerateGroupBoxT(grbx1, 270);
      grbx2.Caption := 'Child';
      GenerateCheckBoxesSet(grbx2, 10);
    end;
  end;
  Enlapsed := GetTickCount - t1;
  self.Caption := IntToStr(Enlapsed);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  grbx: TGroupBox;
  j: Integer;
  grbx2: TGroupBox;
  k: Integer;
begin
  CreateControls2();
  exit;

  // CreateControls2;
  SendMessage(Handle, WM_SETREDRAW, WPARAM(False), 0);
  try
    // Create all your controls here
    CreateControls2();
  finally
    // Make sure updates are re-enabled
    SendMessage(Handle, WM_SETREDRAW, WPARAM(true), 0);
    self.Invalidate; // Might be required to reflect the changes
  end;

  for i := 0 to self.ControlCount-1 do
    if self.Controls[i] is TGroupBox then
    begin
      grbx := (self.Controls[i] as TGroupBox);
      grbx.Invalidate;
      for j := 0 to grbx.ControlCount-1 do
        if grbx.Controls[j] is TGroupBox then
        begin
          grbx2 := (grbx.Controls[j] as TGroupBox);
          grbx2.Invalidate;
          for k := 0 to grbx2.ControlCount-1 do
            grbx2.Controls[k].Invalidate;
        end;
    end;



end;

end.
