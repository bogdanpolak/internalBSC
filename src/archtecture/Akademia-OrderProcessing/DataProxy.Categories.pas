unit DataProxy.Categories;

interface

uses
  Data.DB,
  Data.DataProxy;

type
  TCategoriesProxy = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    CategoryID: TIntegerField;
    CategoryName: TWideStringField;
    Description: TWideMemoField;
    Picture: TBlobField;
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

{ TOrder }

uses
  System.SySUtils,
  Database.Connector;

procedure TCategoriesProxy.ConnectFields;
begin
  CategoryID := FDataSet.FieldByName('CATEGORYID') as TIntegerField;
  CategoryName := FDataSet.FieldByName('CATEGORYNAME') as TWideStringField;
  Description := FDataSet.FieldByName('DESCRIPTION') as TWideMemoField;
  Picture := FDataSet.FieldByName('PICTURE') as TBlobField;
end;


end.
