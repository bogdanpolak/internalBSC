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
    procedure btnHashesAndCiphersClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure tmrIdleTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Frame.HashAndCrypto, View.OrderList;

procedure TForm1.btnHashesAndCiphersClick(Sender: TObject);
var
  AFrame: TFrameHashes;
begin
  GroupBox1.Parent := nil;
  AFrame := Frame.HashAndCrypto.TFrameHashes.Create(self);
  AFrame.Parent := GridPanel1;
end;

procedure TForm1.btnOrdersClick(Sender: TObject);
begin
  FDConnection1.ConnectionDefName := 'IB_Demo';
  FDConnection1.Open();
  GridPanel1.BevelOuter := bvNone;
  GroupBox1.Parent := nil;

  View.OrderList.TOrdersListBlock.Create(GridPanel1,FDConnection1);
end;

procedure TForm1.tmrIdleTimer(Sender: TObject);
var
  AContainer: TWinControl;
  i: Integer;
begin
  ReportMemoryLeaksOnShutdown := True;
  AContainer := GridPanel1;
  for i := AContainer.ComponentCount-1 downto 0 do
    if AContainer.Components[i].Tag<0 then
    begin
      AContainer.Components[i].Free;
      GroupBox1.Parent := GridPanel1;
    end;
  for i := AContainer.ControlCount-1 downto 0 do
    if AContainer.Controls[i].Tag<0 then
    begin
      AContainer.Controls[i].Free;
      GroupBox1.Parent := GridPanel1;
    end;
end;

end.
