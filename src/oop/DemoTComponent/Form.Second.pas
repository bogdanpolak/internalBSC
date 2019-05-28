unit Form.Second;

interface

uses
  System.SysUtils, System.Variants, System.Classes,
  Winapi.Windows, Winapi.Messages,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Base.Bar;

procedure TForm2.Button1Click(Sender: TObject);
var
  bar: TBar;
begin
  Self.Tag := Self.Tag +1;
  bar := TBar.Create(Self);
  bar.Name := 'Bar'+Self.Tag.ToString;
  bar.Free;
end;

end.
