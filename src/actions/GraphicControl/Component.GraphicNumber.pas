unit Component.GraphicNumber;

interface

uses
  System.Classes,
  Vcl.Controls;

type
  TGraphicNumber = class(TGraphicControl)
  private
    FNumber: Integer;
    procedure SetNumber(const aNumber: Integer);
  protected
    procedure Paint; override;
  public
    constructor Create(Owner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
  published
    property Action;
    property OnClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property Number: Integer read FNumber write SetNumber;
  end;

implementation

uses
  System.SysUtils,
  Vcl.Graphics,
  Winapi.Windows;

{ TGraphicNumber }

constructor TGraphicNumber.Create(Owner: TComponent);
begin
  inherited;
  Width := 128;
  Height := 48;
  Number := 10;
end;

procedure TGraphicNumber.Paint;
var
  NumStr: string;
  i: Integer;
  DigitWidth: Integer;
  Len: Integer;
  x0: Integer;
  digit: string;
  wd: Integer;
begin
  NumStr := IntToStr(Number);
  Canvas.Brush.Style := bsClear;
  Canvas.Pen.Color := clSilver;
  Canvas.Pen.Style := psDash;
  Canvas.Rectangle(0, 0, Width, Height);
  Canvas.Pen.Style := psSolid;
  Canvas.Pen.Color := clBlack;
  Canvas.Font.Height := Height;
  DigitWidth := round(Height * 0.55);
  Len := Length(NumStr);
  Canvas.Font.Color := clBlack;
  for i := 0 to Len - 1 do
  begin
    x0 := i * DigitWidth;
    digit := NumStr.Chars[i];
    wd := Canvas.TextWidth(digit);
    Canvas.TextOut(x0 + (DigitWidth - wd) div 2, 0, digit);
    begin
      Canvas.Pen.Color := RGB(225, 225, 225);
      Canvas.MoveTo(x0 + DigitWidth, 0);
      Canvas.LineTo(x0 + DigitWidth, Height);
    end;
  end;
end;

procedure TGraphicNumber.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
begin
  inherited;

end;

procedure TGraphicNumber.SetNumber(const aNumber: Integer);
begin
  FNumber := aNumber;
  Invalidate;
end;

end.
