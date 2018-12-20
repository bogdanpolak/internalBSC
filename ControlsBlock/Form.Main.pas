unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    btnOrders: TButton;
    FDConnection1: TFDConnection;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    GridPanel1: TGridPanel;
    GroupBox1: TGroupBox;
    btnHashesAndCiphers: TButton;
    tmrIdle: TTimer;
    tmrReady: TTimer;
    StatusBar1: TStatusBar;
    procedure btnHashesAndCiphersClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure tmrIdleTimer(Sender: TObject);
    procedure tmrReadyTimer(Sender: TObject);
  private
    { Private declarations }
    procedure StartMenuShow();
    procedure StartMenuHide();
    procedure CheckControlsAndComponentsToClose(AContainer: TWinControl);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  View.OrderList, View.HashAndCrypto;

procedure TForm1.CheckControlsAndComponentsToClose(AContainer: TWinControl);
begin
  if AContainer.ComponentCount = 0 then
    self.StartMenuShow;
end;

procedure TForm1.StartMenuHide;
begin
  GroupBox1.Parent := nil;
end;

procedure TForm1.StartMenuShow;
begin
  GroupBox1.Parent := GridPanel1;
end;

procedure TForm1.btnHashesAndCiphersClick(Sender: TObject);
begin
  self.StartMenuHide;
  THashAndCryptoBlock.Create(GridPanel1).BuildAndShow ();
end;

procedure TForm1.btnOrdersClick(Sender: TObject);
begin
  self.StartMenuHide;
  // FDConnection1.Close();
  FDConnection1.ConnectionDefName := 'IB_Demo';
  FDConnection1.Open();
  TOrdersListBlock.Create(GridPanel1).BuildAndShow (FDConnection1);
end;

procedure TForm1.tmrIdleTimer(Sender: TObject);
begin
  self.CheckControlsAndComponentsToClose(GridPanel1);
  StatusBar1.Panels[0].Text :=' GridPanel1.ComponentCount : '+
    GridPanel1.ComponentCount.ToString;
end;

procedure TForm1.tmrReadyTimer(Sender: TObject);
begin
  tmrReady.Enabled := False;
  ReportMemoryLeaksOnShutdown := True;
  GridPanel1.BevelOuter := bvNone;
  self.StartMenuShow;
  tmrIdle.Enabled := True;
end;

end.
