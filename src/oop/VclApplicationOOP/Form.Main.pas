unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    btnShowForm2: TButton;
    Bevel1: TBevel;
    procedure btnShowForm2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function AddLabel(aParent: TGroupBox; aCaption: string): TLabel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses VclPlus.Timer, Form.Form2;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  VclPlus.Timer.TEventOnFirstShow.Setup(Self,
    procedure()
    begin
      btnShowForm2.SetFocus;
      AddLabel(GroupBox1, 'Done: On first show event.');
      TEvenOnTimer.SetupOnce(Self, 1000,
        procedure()
        var
          lblTimer: TLabel;
        begin
          AddLabel(GroupBox1, 'Done: Timer tick once (Interval = 10000 ms)');
          lblTimer := AddLabel(GroupBox1, '');
          TEvenOnTimer.SetupRepeat(Self, 1000,
            procedure
            begin
              lblTimer.Tag := lblTimer.Tag + 1;
              lblTimer.Caption := Format('Timer counter: %d', [lblTimer.Tag]);
            end);
        end);
    end);
end;

function TFormMain.AddLabel(aParent: TGroupBox; aCaption: string): TLabel;
begin
  Result := TLabel.Create(aParent);
  Result.Caption := aCaption;
  Result.Parent := aParent;
  Result.Top := 2000;
  Result.AlignWithMargins := True;
  Result.Align := alTop;
end;

procedure TFormMain.btnShowForm2Click(Sender: TObject);
var
  frm2: TForm2;
begin
  frm2 := TForm2.Create(Application);
  frm2.Left := Self.Left + Self.Width + 1;
  frm2.Top := Self.Top;
  frm2.Show;
end;

end.
