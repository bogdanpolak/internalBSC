unit Form.Main;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Base.Receiver;

type
  TFormMain = class(TForm)
    btnCreateTFooClass1: TButton;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure btnCreateTFooClass1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    procedure OnReciver(AComponent: TComponent; Operation: TOperation);
  public
    FReceiver: TReceiver;
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses Base.Foo, Form.Second;

procedure TFormMain.btnCreateTFooClass1Click(Sender: TObject);
var
  foo: TFoo;
begin
  Self.Tag := Self.Tag + 1;
  foo := TFoo.Create(Self);
  foo.Name := 'Foo' + Self.Tag.ToString;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FReceiver.OnNotification := nil;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FReceiver := TReceiver.Create(Self);
  FReceiver.OnNotification :=
    procedure(AComponent: TComponent; Operation: TOperation)
    begin
      OnReciver(AComponent, Operation);
    end;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  with TForm2.Create(Application) do begin
    Show;
    Left := Self.Left + Self.Width - 8;
    Top := Self.Top;
  end;
end;

procedure TFormMain.OnReciver(AComponent: TComponent; Operation: TOperation);
var
  op: string;
begin
  case Operation of
    opInsert:
      op := '[INSERT]';
    opRemove:
      op := '[REMOVE]';
  end;
  ListBox1.Items.Add(op+'  '+AComponent.Name+': '+AComponent.ClassName);
end;

end.
