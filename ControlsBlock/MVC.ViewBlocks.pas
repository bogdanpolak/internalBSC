unit MVC.ViewBlocks;

interface

uses
  System.Classes, Data.DB;

type
  TViewBlock = class (TComponent)
  end;

  TDataSetBlock = class(TViewBlock)
  private
    FMainDataSet: TDataSet;
    procedure SetMainDataSet(const Value: TDataSet);
  public
    property MainDataSet: TDataSet read FMainDataSet write SetMainDataSet;
  end;

implementation

procedure TDataSetBlock.SetMainDataSet(const Value: TDataSet);
begin
  FMainDataSet := Value;
end;

end.
