unit Form.PreviewItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormPreview = class(TForm)
    Memo1: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    class procedure Execute (ItemContent: string);
  end;


implementation

{$R *.dfm}

class procedure TFormPreview.Execute(ItemContent: string);
var
  frm: TFormPreview;
begin
  frm := TFormPreview.Create(Application);
  frm.Show;
  frm.Memo1.Text := ItemContent;
end;

procedure TFormPreview.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=caFree;
end;

end.
