unit Form.Second;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btnCreateTBarClass: TButton;
    GroupBox1: TGroupBox;
    procedure btnCreateTBarClassClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

uses
  Base.Bar,
  Base.Foo;

procedure TForm2.btnCreateTBarClassClick(Sender: TObject);
var
  bar: TBar;
begin
  Self.Tag := Self.Tag +1;
  bar := TBar.Create(Application);
  bar.Name := 'Bar'+Self.Tag.ToString;
  bar.Free;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
