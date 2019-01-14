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
  Action.DataSet,
  VclPlus.FormPlusReady;

type
  TForm1 = class(TFormWithReadyEvent)
    FDConnection1: TFDConnection;
    fdqCustomers: TFDQuery;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    Button1: TButton;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    lblHandlesTarget: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
  protected
    // procedure FormReady; override;
  private
    actDataSetFirst: TDataSetFirstAction;
    procedure FormReady(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses VclPlus.Timer;

procedure TForm1.FormReady(Sender: TObject);
begin
  FDConnection1.Open();

  DBGrid1.DataSource := DataSource1;
  DBEdit1.DataSource := DataSource1;
  DBEdit1.DataField := 'CompanyName';
  DBNavigator1.DataSource := DataSource1;
  DataSource1.DataSet := fdqCustomers;
  fdqCustomers.Open();

  actDataSetFirst.DataSource := DataSource1;
  actDataSetFirst.Caption := 'First';
  Button1.Action := actDataSetFirst;

  TEvenOnTimer.SetupRepeat(Self, 1000,
    procedure
    begin
      lblHandlesTarget.Caption := actDataSetFirst.FCountHandlesTarget.ToString;
    end);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  actDataSetFirst := TDataSetFirstAction.Create(Button1);
  OnFormReady := FormReady;
end;

end.
