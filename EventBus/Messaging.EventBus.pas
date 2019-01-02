unit Messaging.EventBus;

interface

uses
  System.Classes;

type
  TEventMessage = record
  public
    TagInt: Integer;
    TagString: String;
    TagBoolean: boolean;
  end;

  TSubscriberEvent = procedure(MessageID: Integer;
    const AMessagee: TEventMessage) of object;

  TRegistrationInfo = record
    MessageID: Integer;
    method: TSubscriberEvent;
  end;

  TEventBus = class(TComponent)
  private
    Subscribers: TArray<TRegistrationInfo>;
    function LocateMethod(MessageID: Integer; method: TSubscriberEvent)
      : Integer;
  public
    procedure RegisterMethod(MessageID: Integer; method: TSubscriberEvent);
    procedure UnregisterMethod(MessageID: Integer; method: TSubscriberEvent);
    procedure PostMessage(MessageID: Integer; const AMessagee: TEventMessage);
    procedure PostPing(MessageID: Integer);
  end;

function GetDefaultEventBus(): TEventBus;

implementation

uses
  Vcl.Forms;

function SameMethod(AMethod1, AMethod2: TSubscriberEvent): boolean;
begin
  result := (TMethod(AMethod1).Code = TMethod(AMethod2).Code) and
    (TMethod(AMethod1).Data = TMethod(AMethod2).Data);
end;

function TEventBus.LocateMethod(MessageID: Integer;
  method: TSubscriberEvent): Integer;
var
  count: Integer;
  i: Integer;
begin
  count := Length(Subscribers);
  for i := 0 to count - 1 do
    if (Subscribers[i].MessageID = MessageID) and
      SameMethod(Subscribers[i].method, method) then
    begin
      result := i;
      exit;
    end;
  result := -1;
end;

procedure TEventBus.RegisterMethod(MessageID: Integer;
  method: TSubscriberEvent);
var
  idx: Integer;
  count: Integer;
begin
  idx := LocateMethod(MessageID, method);
  if idx < 0 then
  begin
    count := Length(Subscribers);
    SetLength(Subscribers, count + 1);
    Subscribers[count].MessageID := MessageID;
    Subscribers[count].method := method;
  end;
end;

procedure TEventBus.UnregisterMethod(MessageID: Integer;
  method: TSubscriberEvent);
var
  idx: Integer;
  count: Integer;
  i: Integer;
begin
  idx := LocateMethod(MessageID, method);
  if idx >= 0 then
  begin
    count := Length(Subscribers);
    for i := idx to count - 2 do
      Subscribers[i] := Subscribers[i + 1];
    SetLength(Subscribers, count - 1);
  end;
end;

procedure TEventBus.PostMessage(MessageID: Integer;
  const AMessagee: TEventMessage);
var
  count: Integer;
  i: Integer;
begin
  count := Length(Subscribers);
  for i := 0 to count - 1 do
    if Subscribers[i].MessageID = MessageID then
      Subscribers[i].method(MessageID, AMessagee);
end;

procedure TEventBus.PostPing(MessageID: Integer);
var
  mess: TEventMessage;
begin
  PostMessage(MessageID, mess);
end;

// -------------------------------------------------------------------------
var
  GlobalEventBus: TEventBus;

function GetDefaultEventBus(): TEventBus;
begin
  if not Assigned(GlobalEventBus) then
    GlobalEventBus := TEventBus.Create(Vcl.Forms.Application);
  Result := GlobalEventBus;
end;

end.
