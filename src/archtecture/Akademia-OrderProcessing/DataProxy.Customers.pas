unit DataProxy.Customers;

interface

uses
  Data.DB,
  Data.DataProxy;

type
  TCustomersProxy = class(TDatasetProxy)
  protected
    procedure ConnectFields; override;
  public
    CustomerID: TWideStringField;
    CompanyName: TWideStringField;
    ContactName: TWideStringField;
    ConstacTitle: TWideStringField;
    Address: TWideStringField;
    City: TWideStringField;
    Region: TWideStringField;
    PostalCode: TWideStringField;
    Country: TWideStringField;
    Phone: TWideStringField;
    Fax: TWideStringField;
    // property DataSet: TDataSet read FDataSet;
  end;

implementation

{ TOrder }

uses
  System.SysUtils,
  Database.Connector;

procedure TCustomersProxy.ConnectFields;
begin
  CustomerID := FDataSet.FieldByName('CustomerID') as TWideStringField;
  CompanyName := FDataSet.FieldByName('CompanyName') as TWideStringField;
  ContactName := FDataSet.FieldByName('ContactName') as TWideStringField;
  ConstacTitle := FDataSet.FieldByName('ConstacTitle') as TWideStringField;
  Address := FDataSet.FieldByName('Address') as TWideStringField;
  City := FDataSet.FieldByName('City') as TWideStringField;
  Region := FDataSet.FieldByName('Region') as TWideStringField;
  PostalCode := FDataSet.FieldByName('PostalCode') as TWideStringField;
  Country := FDataSet.FieldByName('Country') as TWideStringField;
  Phone := FDataSet.FieldByName('Phone') as TWideStringField;
  Fax := FDataSet.FieldByName('Fax') as TWideStringField;
end;

end.
