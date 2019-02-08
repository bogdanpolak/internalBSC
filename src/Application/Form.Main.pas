unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.AppEvnts,
  Vcl.ExtCtrls,
  Vcl.Grids, Plus.Vcl.Timer;

type
  TForm1 = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    Button1: TButton;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
  private
    FStoper: TStoper;
    procedure DysplayCounter(aCounter: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FStoper := TStoper.Create(Self);
end;

procedure TForm1.ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
begin
  Tag := Tag + 1;
  // if FStoper.IfPassThenReset(3) then
    DysplayCounter(Tag);
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  Tag := 0;
end;

procedure TForm1.DysplayCounter(aCounter: Integer);
begin
  case RadioGroup1.ItemIndex of
    0:
      Button1.Caption := aCounter.ToString;
    1:
      ListBox1.Items.Text := aCounter.ToString;
  else
    Panel1.Caption := aCounter.ToString;
  end;
end;

end.
