unit Form.Main;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Base.Receiver;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FReceiver: TReceiver;
    procedure OnReciver(AComponent: TComponent; Operation: TOperation);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Base.Foo, Form.Second;

procedure TForm1.Button1Click(Sender: TObject);
var
  foo: TFoo;
begin
  Self.Tag := Self.Tag + 1;
  foo := TFoo.Create(Self);
  foo.Name := 'Foo' + Self.Tag.ToString;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FReceiver.OnNotification := nil;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FReceiver := TReceiver.Create(Self);
  FReceiver.OnNotification :=
      procedure(AComponent: TComponent; Operation: TOperation)
    begin
      if AComponent<>Self then
        OnReciver(AComponent, Operation);
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Form2.Show;
  Form2.FreeNotification(FReceiver);
end;

procedure TForm1.OnReciver(AComponent: TComponent; Operation: TOperation);
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
