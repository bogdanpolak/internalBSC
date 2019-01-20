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
    actCommandOne: TWorkAction;
    actNotShipped: TWorkAction;
    procedure EventWork2Started(Sender: TObject; Work:TWork);
    procedure EventWork2Done(Sender: TObject; Work:TWork);
    procedure Event_OnActionExecute(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EventWork2Done(Sender: TObject; Work:TWork);
var
  WorkResult: string;
begin
  WorkResult := (Work as TNotShippedOrdersWork).NotShippedOrders.ToString;
  lblResults.Caption := 'Not Shipped orders: ' + sLineBreak + WorkResult;
end;

procedure TForm1.EventWork2Started(Sender: TObject; Work:TWork);
begin
  lblResults.Caption := '...';
end;

procedure TForm1.Event_OnActionExecute(Sender: TObject);
begin
  actCommandOne.Caption := 'Shortcut';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // --------------------------------------------------------------------
  // --------------------------------------------------------------------
  actCommandOne := TWorkAction.Create(Self);
  actCommandOne.Caption := 'Command One: Click to preapre';
  // TODO: Provide proper code, this is not working:
  // actCommandOne.ShortCut := Vcl.Menus.TextToShortCut('Ctrl+1');
  // actCommandOne.ShortCut := System.Classes.scCtrl + System.UITypes.vk1;
  actCommandOne.OnExecute := Event_OnActionExecute;
  Button1.Action := actCommandOne;
  // actCommandOne.CreateAndAddWork(TCommandOneWork);

  // --------------------------------------------------------------------
  // --------------------------------------------------------------------
  actNotShipped := TWorkAction.Create(Self);
  actNotShipped.Caption := 'Get not shipped orders (SQLite_Demo)';
  Button2.Action := actNotShipped;
  actNotShipped.CreateAndAddWork(TNotShippedOrdersWork);
  actNotShipped.OnWorkStarted := EventWork2Started;
  actNotShipped.OnWorkDone := EventWork2Done;
end;

end.
