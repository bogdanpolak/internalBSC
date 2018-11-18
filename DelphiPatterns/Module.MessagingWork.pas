unit Module.MessagingWork;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.StorageBin, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TModuleOrders = class(TDataModule)
    qOrders: TFDMemTable;
    qOrdersOrderID: TFDAutoIncField;
    qOrdersCustomerID: TStringField;
    qOrdersEmployeeID: TIntegerField;
    qOrdersOrderDate: TDateTimeField;
    qOrdersRequiredDate: TDateTimeField;
    qOrdersShippedDate: TDateTimeField;
    qOrdersShipVia: TIntegerField;
    qOrdersFreight: TCurrencyField;
    qOrdersCountry: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function LocateNearestNotShippedOrder: boolean;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  System.Variants;

{ TModuleOrders }

function TModuleOrders.LocateNearestNotShippedOrder: boolean;
begin
  while not qOrders.Eof and not qOrdersShippedDate.IsNull do
    qOrders.Next;
  Result := not qOrders.Eof and qOrdersShippedDate.IsNull;
end;

end.
