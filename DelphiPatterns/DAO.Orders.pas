unit DAO.Orders;

interface

uses
  System.Classes, FireDAC.Comp.Client, Data.DB, System.SysUtils;

type
  TOrdersDAO = class(TComponent)
  public
    OrderID: TIntegerField;
    CompanyName: TStringField;
    EmployeeID: TIntegerField;
    EmployeeName: TStringField;
    OrderDate: TDateField;
    RequiredDate: TDateField;
    ShippedDate: TDateField;
    ShipVia: TIntegerField;
    Freight: TBCDField;
    procedure Open(AConnection: TFDConnection);
    procedure Next;
    function Eof: boolean;
    function ToString: String;
    procedure ForEach(proc: TProc<TOrdersDAO>);
    function Count: Integer;
  private
    fdq: TFDQuery;
  end;

implementation

const
  SQL_GetOrdersList = 'SELECT Orders.OrderID, ' +
    '  Orders.CustomerID, Customers.CompanyName,  Orders.EmployeeID, ' +
    '  Employees.FirstName||'' ''||Employees.LastName EmployeeName, ' +
    '  Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, ' +
    '  Orders.ShipVia, Orders.Freight ' + // -
    'FROM {id Orders} Orders ' + // -
    '  INNER JOIN {id Employees} Employees ' +
    '    ON Orders.EmployeeID = Employees.EmployeeID ' +
    '  INNER JOIN {id Customers} Customers ' +
    '    ON Orders.CustomerID = Customers.CustomerID ' +
    'ORDER BY Orders.OrderID ';

  { OrdersDAO }

function TOrdersDAO.Count: Integer;
begin
  Result := fdq.RecordCount;
end;

function TOrdersDAO.Eof: boolean;
begin
  Result := fdq.Eof;
end;

procedure TOrdersDAO.Next;
begin
  fdq.Next;
end;

procedure TOrdersDAO.ForEach (proc: TProc<TOrdersDAO>);
var
  Bookmark: TBookmark;
begin
  Bookmark := fdq.GetBookmark;
  // stworzenie zak³adki
  fdq.DisableControls;
  try
    fdq.First;
    while not fdq.Eof do
    begin
      proc(self);
      fdq.Next;
    end;
  finally
    if fdq.BookmarkValid(Bookmark) then
      fdq.GotoBookmark(Bookmark);
    fdq.FreeBookmark(Bookmark);
    fdq.EnableControls;
  end;
end;

procedure TOrdersDAO.Open(AConnection: TFDConnection);
begin
  fdq := TFDQuery.Create(self);
  fdq.Connection := AConnection;
  fdq.Open(SQL_GetOrdersList);
  OrderID := fdq.FieldByName('OrderID') as TIntegerField;
  CompanyName := fdq.FieldByName('CompanyName') as TStringField;
  EmployeeID := fdq.FieldByName('EmployeeID') as TIntegerField;
  EmployeeName := fdq.FieldByName('EmployeeName') as TStringField;
  OrderDate := fdq.FieldByName('OrderDate') as TDateField;
  RequiredDate := fdq.FieldByName('RequiredDate') as TDateField;
  ShippedDate := fdq.FieldByName('ShippedDate') as TDateField;
  ShipVia := fdq.FieldByName('ShipVia') as TIntegerField;
  // TODO: Dodaæ mapowanie i zmieniæ pole na Currency
  Freight := fdq.FieldByName('Freight') as TBCDField;
end;

function TOrdersDAO.ToString: String;
begin
  Result := Format('[%.5d] on %s, %s - %s', [OrderID.Value, OrderDate.AsString,
    CompanyName.Value, EmployeeName.Value]);
end;

end.
