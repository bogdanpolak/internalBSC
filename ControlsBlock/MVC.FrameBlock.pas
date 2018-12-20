unit MVC.FrameBlock;

interface

uses
  System.Classes, MVC.ViewBlocks, Vcl.Forms;

type
  TVclFrameClass = class of Vcl.Forms.TFrame;

  TFrameBlock = class(TViewBlock)
  private
    FFrame: TFrame;
    procedure SetFrame(const Value: TFrame);
  public
    procedure BuildAndShow(ViewFrameClass: TVclFrameClass); virtual;
    property Frame: TFrame read FFrame write SetFrame;
  end;

implementation

uses
  System.SysUtils, Vcl.Controls;


procedure TFrameBlock.BuildAndShow(ViewFrameClass: TVclFrameClass);
var
  AContainer: TWinControl;
begin
  if not(self.Owner is Vcl.Controls.TWinControl) then
    raise Exception.Create
      ('Invalid Parent Class! Expected TWinControl as Parent.');
  AContainer := (self.Owner as TWinControl);
  Frame := ViewFrameClass.Create(self);
  Frame.Align := alClient;
  Frame.Parent := AContainer;
end;

procedure TFrameBlock.SetFrame(const Value: TFrame);
begin
  FFrame := Value;
end;

end.
