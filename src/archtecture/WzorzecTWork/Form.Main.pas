unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.DBActns, Vcl.StdCtrls,
  Plus.TWork,
  Work.CommandOne,
  Work.Async.NotShippedOrders;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    lblResults: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    Work2 :TNotShippedOrdersWork;
    procedure EventWork2Start(Sender: TObject);
    procedure EventWork2Done(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EventWork2Done(Sender: TObject);
var
  WorkResult: string;
begin
  WorkResult := Work2.NotShippedOrders.ToString;
  lblResults.Caption := 'Not Shipped orders: ' + sLineBreak + WorkResult;
end;

procedure TForm1.EventWork2Start(Sender: TObject);
begin
  lblResults.Caption := '...';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // --------------------------------------------------------------------
  // --------------------------------------------------------------------
  Button1.Action := TWorkAction.Create(Button1)
    .AddWork<TCommandOneWork>.WorkAction;
  // --------------------------------------------------------------------
  // --------------------------------------------------------------------
  Work2 := TWorkAction.Create(Button1).AddWork<TNotShippedOrdersWork>;
  Work2.OnWorkStart := EventWork2Start;
  Work2.OnWorkDone := EventWork2Done;
  Button2.Action := Work2.WorkAction;
end;

end.
