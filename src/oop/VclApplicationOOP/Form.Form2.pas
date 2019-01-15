unit Form.Form2;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  VclPlus.FormWithReady;

type
  TForm2 = class(TFormWithReady)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    FText: string;
    procedure FormReady; override;
  public
    constructor Create (Owner: TComponent); override;
  end;

implementation

{$R *.dfm}


constructor TForm2.Create(Owner: TComponent);
begin
  inherited;
  FText := 'constructor Create';
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(FText);
  Memo1.Lines.Add('FormCreate');
end;

{ TForm2 }

procedure TForm2.FormReady;
begin
  Memo1.Lines.Add('FormReady');
end;

end.
