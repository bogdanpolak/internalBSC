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
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls;

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
  Frame.HashAndCrypto, View.OrderList;

procedure TForm1.CheckControlsAndComponentsToClose(AContainer: TWinControl);
var
  i: Integer;
begin
  for i := AContainer.ComponentCount - 1 downto 0 do
    if AContainer.Components[i].Tag < 0 then
    begin
      AContainer.Components[i].Free;
      self.StartMenuShow;
    end;
  for i := AContainer.ControlCount - 1 downto 0 do
    if AContainer.Controls[i].Tag < 0 then
    begin
      AContainer.Controls[i].Free;
      self.StartMenuShow;
    end;
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
var
  AFrame: TFrameHashes;
begin
  self.StartMenuHide;
  AFrame := Frame.HashAndCrypto.TFrameHashes.Create(self);
  AFrame.Align := alClient;
  AFrame.Parent := GridPanel1;
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
