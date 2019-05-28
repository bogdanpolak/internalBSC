{ * ------------------------------------------------------------------------
  * ♥  Bogdan Polak © 2019  ♥
  *  ----------------------------------------------------------------------- * }
unit Base.Receiver;

interface

uses
  System.Classes, System.SysUtils;

type
  TNotificationProc = TProc<TComponent,TOperation>;

  TReceiver = class(TComponent)
  private
    FOnNotification: TNotificationProc;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    property OnNotification: TNotificationProc read FOnNotification
      write FOnNotification;
  end;

implementation

{ TReceiver }

procedure TReceiver.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Assigned(FOnNotification) then
    FOnNotification(AComponent, Operation);
end;

end.
