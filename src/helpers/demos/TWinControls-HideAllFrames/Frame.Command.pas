unit Frame.Command;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TCommandFrame = class(TFrame)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PopupMenu1: TPopupMenu;
    pmCountryUSA: TMenuItem;
    pmCountryGreatBritain: TMenuItem;
    pmCountryGermany: TMenuItem;
    pmCountryFrance: TMenuItem;
    pmCountryItally: TMenuItem;
    pmCountrySpain: TMenuItem;
    pmCountryPoland: TMenuItem;
    Bevel1: TBevel;
    procedure Button3Click(Sender: TObject);
    procedure pmCountryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCommandFrame.Button3Click(Sender: TObject);
var
  pt1,pt2: TPoint;
begin
  pt1 := self.ClientToScreen(TPoint.Create(Button3.Left + 4,
    Button3.Top + Button3.Height + 3));
  // pt2 := Application.MainForm.ScreenToClient(pt1);
  Button3.DropDownMenu.Popup(pt1.X, pt1.Y);
end;

procedure TCommandFrame.pmCountryClick(Sender: TObject);
begin
  Button3.Caption := (Sender as TMenuItem).Caption;
end;

end.
