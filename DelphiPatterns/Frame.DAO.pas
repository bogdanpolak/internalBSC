unit Frame.DAO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.IB, FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls;

type
  TFrameDAO = class(TFrame)
    FDConnection1: TFDConnection;
    Customers: TFDQuery;
    GroupBox1: TGroupBox;
    Button1: TButton;
    ListBox1: TListBox;
    GridPanel1: TGridPanel;
    GroupBox2: TGroupBox;
    Button2: TButton;
    ListBox2: TListBox;
    Label1: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fldCustomersCustomerID: TStringField;
    fldCustomersCopmanyName: TStringField;
    fldCustomersAddress: TStringField;
    fldCustomersCity: TStringField;
    fldCustomersCountry: TStringField;
  end;

implementation

{$R *.dfm}

uses DAO.Orders;

procedure TFrameDAO.Button1Click(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  // ---------------------------------------------------------------------
  // Open Dataset and bind fields
  // ---------------------------------------------------------------------
  Customers.Open('select CUSTOMERID, COMPANYNAME, ADDRESS, CITY, COUNTRY' +
    ' from {id Customers}');
  fldCustomersCustomerID := Customers.FieldByName('CustomerID') as TStringField;
  fldCustomersCopmanyName := Customers.FieldByName('CompanyName')
    as TStringField;
  fldCustomersAddress := Customers.FieldByName('Address') as TStringField;
  fldCustomersCity := Customers.FieldByName('City') as TStringField;
  fldCustomersCountry := Customers.FieldByName('Country') as TStringField;
  // ---------------------------------------------------------------------
  ListBox1.Clear;
  for i := 0 to 9 do
  begin
    s := Format('[%s] %s, %s', [fldCustomersCustomerID.Value,
      fldCustomersCopmanyName.Value, fldCustomersCountry.Value]);
    ListBox1.Items.Add(s);
    Customers.Next;
  end;
end;

procedure TFrameDAO.Button2Click(Sender: TObject);
var
  Orders: TOrdersDAO;
  i: Integer;
  s: string;
  year: Integer;
begin
  Orders := TOrdersDAO.Create(GroupBox2);
  year := StrToInt(Edit2.Text);
  Orders.Open(FDConnection1, year);
  ListBox2.Clear;
  Orders.ForEach(
    procedure(o: TOrdersDAO)
    begin
      ListBox2.Items.Add (o.ToString);
    end);
  (Sender as TButton).Caption := 'Loaded: '+Orders.Count.ToString;
  Orders.Free;
end;

end.
