unit Action.DataSet;

interface

uses
  System.Classes,
  Data.DB,
  Vcl.ActnList;

type
  TDataSetFirstAction = class(TAction)
  private
    FDataSource: TDataSource;
    procedure SetDataSource(DataSource: TDataSource);
  protected
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
  public
    FCountHandlesTarget: integer;
    function HandlesTarget(Target: TObject): Boolean; override;
    procedure ExecuteTarget(Target: TObject); override;
    procedure UpdateTarget(Target: TObject); override;
    property DataSource: TDataSource read FDataSource write SetDataSource;
  end;

implementation

// ------------------------------------------------------------------------
// TDataSetFirstAction
// ------------------------------------------------------------------------

procedure TDataSetFirstAction.ExecuteTarget(Target: TObject);
begin
  FDataSource.DataSet.First;
end;

procedure TDataSetFirstAction.UpdateTarget(Target: TObject);
begin
  Enabled := (FDataSource <> nil) and FDataSource.DataSet.Active and
    not FDataSource.DataSet.Bof;
end;

// TDataSource specyfic code

function TDataSetFirstAction.HandlesTarget(Target: TObject): Boolean;
var
  isAccepted: Boolean;
begin
  isAccepted := (FDataSource <> nil) and (Target = FDataSource) and
    (FDataSource.DataSet <> nil);
  if isAccepted then
    FCountHandlesTarget := FCountHandlesTarget + 1;
  Result := isAccepted;
end;

procedure TDataSetFirstAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSource) then
    DataSource := nil;
end;

procedure TDataSetFirstAction.SetDataSource(DataSource: TDataSource);
begin
  if DataSource <> FDataSource then
  begin
    FDataSource := DataSource;
    // TODO: Check this. Not sure why it's required
    if DataSource <> nil then
      DataSource.FreeNotification(Self);
  end;
end;

end.
