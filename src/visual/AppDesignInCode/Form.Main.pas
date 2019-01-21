unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList, Vcl.Grids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    tmrReady: TTimer;
    GroupBox2: TGroupBox;
    StringGrid1: TStringGrid;
    procedure tmrReadyTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    actConfirmPerson: TAction;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    lblPersonValidatorInfo: TLabel;
    procedure BuildPersonControls(aOwner: TWinControl);
    procedure actConfirmPersonExecute(Sender: TObject);
    procedure actConfirmPersonUpdate(Sender: TObject);
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  actConfirmPerson := TAction.Create(Self);
  actConfirmPerson.Caption := 'ZatwierdŸ';
  actConfirmPerson.OnExecute := actConfirmPersonExecute;
  actConfirmPerson.OnUpdate := actConfirmPersonUpdate;
  StringGrid1.Rows[0].Text := ''+sLineBreak+'Imiê'+sLineBreak+'Nazwisko';
  StringGrid1.ColWidths[1] := 80;
  StringGrid1.ColWidths[2] := 80;
end;

procedure TForm1.actConfirmPersonExecute(Sender: TObject);
var
  aRow: Integer;
begin
  aRow := StringGrid1.RowCount-1;
  StringGrid1.Cells[1,aRow] := edtFirstName.Text;
  StringGrid1.Cells[2,aRow] := edtLastName.Text;
  StringGrid1.RowCount := StringGrid1.RowCount + 1;
  edtFirstName.Text := '';
  edtLastName.Text := '';
  edtFirstName.SetFocus;
end;

procedure TForm1.actConfirmPersonUpdate(Sender: TObject);
var
  isValid: Boolean;
begin
  isValid := (Trim(edtFirstName.Text) <> '') and (Trim(edtLastName.Text) <> '');
  actConfirmPerson.Enabled := isValid;
  lblPersonValidatorInfo.Visible := not isValid;
end;

procedure TForm1.BuildPersonControls(aOwner: TWinControl);
begin
  with TLabel.Create(aOwner) do
  begin
    Caption := 'Imiê';
    Align := alTop;
    AlignWithMargins := True;
    Top := 999;
    Parent := aOwner;
  end;
  edtFirstName := TEdit.Create(aOwner);
  with edtFirstName do
  begin
    Text := 'Bogdan';
    Align := alTop;
    AlignWithMargins := True;
    Top := 999;
    Parent := aOwner;
  end;
  with TLabel.Create(aOwner) do
  begin
    Caption := 'Nazwisko';
    Align := alTop;
    AlignWithMargins := True;
    Top := 999;
    Parent := aOwner;
  end;
  edtLastName := TEdit.Create(aOwner);
  with edtLastName do
  begin
    Name := 'edtLastName';
    Text := 'Polak';
    Align := alTop;
    AlignWithMargins := True;
    Top := 999;
    Parent := aOwner;
  end;
  lblPersonValidatorInfo := TLabel.Create(aOwner);
  with lblPersonValidatorInfo do
  begin
    Caption := 'Nazwisko';
    Align := alTop;
    AlignWithMargins := True;
    WordWrap := True;
    Font.Color := clRed;
    Caption := 'Proszê wprowadziæ wszystkie wymagane pola.';
    Font.Style := [fsItalic];
    Top := 999;
    Parent := aOwner;
    AutoSize := False;
    AutoSize := True;
  end;
  with TButton.Create(aOwner) do
  begin
    Name := 'btnConfirm';
    Action := actConfirmPerson;
    Align := alTop;
    AlignWithMargins := True;
    Margins.Top := 10;
    Top := 999;
    Parent := aOwner;
  end;
end;

procedure TForm1.tmrReadyTimer(Sender: TObject);
begin
  tmrReady.Enabled := False;
  BuildPersonControls(GroupBox1);
end;

end.
