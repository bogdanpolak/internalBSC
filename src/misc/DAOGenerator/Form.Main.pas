unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Phys.IBDef,
  FireDAC.Phys.FBDef, FireDAC.Phys.FB, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, System.Actions, Vcl.ActnList;

type
  TFormMain = class(TForm)
    grbxAppCommands: TGroupBox;
    btnConnectWithDB: TButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    PageControl1: TPageControl;
    tshDataSet: TTabSheet;
    tshDaoCode: TTabSheet;
    mmSqlStatement: TMemo;
    GridPanel1: TGridPanel;
    btnGenerateDAO: TButton;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    tmrReady: TTimer;
    ActionList1: TActionList;
    actGenerateDAO: TAction;
    mmDaoCode: TMemo;
    Label1: TLabel;
    Splitter1: TSplitter;
    procedure actGenerateDAOExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tmrReadyTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  PageControl1.Align := alClient;
  mmDaoCode.Align := alClient;
  mmSqlStatement.Clear;
  mmDaoCode.Clear;
  self.Caption := 'DAO FireDAC Generator - 0.1 beta';
end;

procedure TFormMain.tmrReadyTimer(Sender: TObject);
begin
  tmrReady.Enabled := False;
end;

procedure TFormMain.actGenerateDAOExecute(Sender: TObject);
begin
  PageControl1.ActivePage := tshDaoCode;
  mmDaoCode.Lines.Add('['+TimeToStr(Now)+'] Code generated ...');
end;

end.
