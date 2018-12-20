unit MVC.ViewBlocks;

interface

uses
  System.Classes, Data.DB,
  Vcl.Forms;

  // ------------ ------------ ------------ ------------ ------------ --------
  // TODO: Dodać dokumentację do klas bazowych ViewBlock
  // Klasy w fazie rozwojowej. Należy:
  //   * ustalić metody abstrakcyjne
  //   * rozbudować klasę TDataSetBlock i przenieść do osobnego unit-u
  // ------------ ------------ ------------ ------------ ------------ --------

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
