unit DataProxy.Products;

interface

uses
  Data.DB,
  Data.DataProxy,
  // FireDAC - TFDQuery ------------------------------
  FireDAC.Comp.Client,
  FireDAC.DApt,
  FireDAC.Stan.Param,
  FireDAC.Stan.Async;

type
  TProductsProxy = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    ProductID: TIntegerField;
    ProductName: TWideStringField;
    SupplierID: TIntegerField;
    CategoryID: TIntegerField;
    QuantityPerUnit: TWideStringField;
    UnitPrice: TBCDField;
    UnitsInStock: TSmallintField;
    UnitsOnOrder: TSmallintField;
    ReoderLevel: TSmallintField;
    Discontinued: TSmallintField;
    procedure Open(OrderID: integer);
    procedure Close;
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

uses
  System.SysUtils,
  Database.Connector;

const
  SQL_SELECT = 'SELECT PRODUCTID, PRODUCTNAME, SUPPLIERID, CATEGORYID, ' +
    ' QUANTITYPERUNIT, UNITPRICE, UNITSINSTOCK, UNITSONORDER, REORDERLEVEL, ' +
    ' DISCONTINUED FROM {id Products} ';

procedure TProductsProxy.Close;
begin

end;

procedure TProductsProxy.ConnectFields;
begin
  ProductID := FDataSet.FieldByName('PRODUCTID') as TIntegerField;
  ProductName := FDataSet.FieldByName('PRODUCTNAME') as TWideStringField;
  SupplierID := FDataSet.FieldByName('SUPPLIERID') as TIntegerField;
  CategoryID := FDataSet.FieldByName('CATEGORYID') as TIntegerField;
  QuantityPerUnit := FDataSet.FieldByName('QUANTITYPERUNIT') as TWideStringField;
  UnitPrice := FDataSet.FieldByName('UNITPRICE') as TBCDField;
  UnitsInStock := FDataSet.FieldByName('UNITSINSTOCK') as TSmallintField;
  UnitsOnOrder := FDataSet.FieldByName('UNITSONORDER') as TSmallintField;
  ReoderLevel := FDataSet.FieldByName('REORDERLEVEL') as TSmallintField;
  Discontinued := FDataSet.FieldByName('DISCONTINUED') as TSmallintField;
end;

procedure TProductsProxy.Open(OrderID: integer);
var
  fdq: TFDQuery;
begin
  if not Assigned(FDataSet) then
    raise Exception.Create('The DataSet is required');
  fdq := TFDQuery.Create(nil);
  fdq.SQL.Text := SQL_SELECT;
  fdq.Connection := GlobalConnector.GetMainConnection;
  FDataSet := fdq;
  FDataSet.Open;
  ConnectFields;
end;

end.
