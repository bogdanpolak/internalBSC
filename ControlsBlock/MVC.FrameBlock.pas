unit MVC.FrameBlock;

interface

uses
  System.Classes, MVC.ViewBlocks, Vcl.Forms;

type
  TVclFrameClass = class of Vcl.Forms.TFrame;

  TFrameBlock = class(TViewBlock)
  private
    FFrameClass: TVclFrameClass;
    procedure SetFrameClass(const Value: TVclFrameClass);
  public
    procedure BuildAndShow(ViewFrameClass: TVclFrameClass);
    property FrameClass: TVclFrameClass read FFrameClass write SetFrameClass;
  end;

implementation

uses
  System.SysUtils, Vcl.Controls;


procedure TFrameBlock.BuildAndShow(ViewFrameClass: TVclFrameClass);
var
  frm: TFrame;
  AContainer: TWinControl;
begin
  if not(self.Owner is Vcl.Controls.TWinControl) then
    raise Exception.Create
      ('Invalid Parent Class! Expected TWinControl as Parent.');
  AContainer := (self.Owner as TWinControl);
  frm := ViewFrameClass.Create(self);
  frm.Align := alClient;
  frm.Parent := AContainer;
  self.FrameClass := ViewFrameClass;
end;

procedure TFrameBlock.SetFrameClass(const Value: TVclFrameClass);
begin
  FFrameClass := Value;
end;

end.
