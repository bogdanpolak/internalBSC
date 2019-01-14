unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask,
  // -----
  Action.DataSet;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    fdqCustomers: TFDQuery;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    lblHandlesTarget: TLabel;
    Timer1: TTimer;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    actDataSetFirst: TDataSetFirstAction;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  DBGrid1.DataSource := DataSource1;
  DBEdit1.DataSource := DataSource1;
  DBEdit1.DataField := 'CompanyName';
  DBNavigator1.DataSource := DataSource1;
  DataSource1.DataSet := fdqCustomers;
  fdqCustomers.Open();

  actDataSetFirst := TDataSetFirstAction.Create(Button1);
  actDataSetFirst.DataSource := DataSource1;
  actDataSetFirst.Caption := 'First';
  Button1.Action := actDataSetFirst;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  lblHandlesTarget.Caption := actDataSetFirst.FCountHandlesTarget.ToString;
end;

end.
