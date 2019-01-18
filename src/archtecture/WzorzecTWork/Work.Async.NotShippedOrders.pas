unit Work.Async.NotShippedOrders;

interface

uses
  System.Classes,
  System.SysUtils,
  Vcl.ExtCtrls,
  Plus.TWork;

type
  TOrders = class
    FOrdes: array of String;
    function ToString: String; override;
    procedure Clear;
  end;

type
  TNotShippedOrdersWork = class(TWork)
  private
    FForEachOrderDelay: word;
    FNotShippedOrders: TOrders;
    FInProgress: boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DoWork: boolean; override;
    property InProgress: boolean read FInProgress;
    property NotShippedOrders: TOrders read FNotShippedOrders;
  end;

implementation

uses
  System.Threading,
  Data.DB,
  Module.Orders;

{ TOrders }

procedure TOrders.Clear;
begin
  SetLength(FOrdes, 0);
end;

function TOrders.ToString: String;
var
  S: String;
begin
  Result := '';
  for S in FOrdes do
  begin
    if Result = '' then
      Result := S
    else
      Result := Result + ', ' + S;
  end;

end;

{ TMessagingWork }

constructor TNotShippedOrdersWork.Create(AOwner: TComponent);
begin
  inherited;
  FNotShippedOrders := TOrders.Create;
  FInProgress := False;
  FForEachOrderDelay := 60;
  Caption := '[Work2] Start getting data';
end;

destructor TNotShippedOrdersWork.Destroy;
begin
  inherited;
  FNotShippedOrders.Free;
end;

function ISODateStringToDate(const DateStr: String): TDateTime;
var
  AFormatSettings: TFormatSettings;
begin
  AFormatSettings := TFormatSettings.Create;
  AFormatSettings.DateSeparator := '-';
  AFormatSettings.ShortDateFormat := 'yyyy.mm.dd';
  Result := StrToDate(DateStr, AFormatSettings);
end;

function TNotShippedOrdersWork.DoWork: boolean;
var
  dtDay: TDateTime;
begin
  Action.Enabled := False;
  FInProgress := True;
  CallWorkStart;
  dtDay := ISODateStringToDate('1998-06-01');
  TTask.Run(
    procedure()
    var
      OrdersModule: TModuleOrders;
      ds: TDataSet;
      StrOrderId: string;
    begin
      NotShippedOrders.Clear;
      OrdersModule := TModuleOrders.Create(Self);
      ds := OrdersModule.OpenNotShippedOrders (dtDay);
      while not ds.Eof do
      begin
        StrOrderId := ds.FieldByName('OrderID').AsString;
        System.Classes.TThread.Synchronize(nil,
          procedure()
          begin
            Caption := 'Order: ' + StrOrderId;
          end);
        NotShippedOrders.FOrdes := NotShippedOrders.FOrdes + [StrOrderId];
        ds.Next;
        sleep(FForEachOrderDelay);
      end;
      OrdersModule.Free;
      System.Classes.TThread.Synchronize(nil,
        procedure()
        begin
          Caption := 'Done';
          CallWorkDone;
          Action.Enabled := True;
        end);
    end);
  FInProgress := False;
  Result := True;
end;

end.
