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
    procedure SetDataSource(Value: TDataSource);
    function GetDataSetFromActionTarget(Target: TObject): TDataSet;
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
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
  // inherited;
  GetDataSetFromActionTarget(Target).First;
end;

procedure TDataSetFirstAction.UpdateTarget(Target: TObject);
var
  LDataSet: TDataSet;
begin
  // inherited;
  LDataSet := GetDataSetFromActionTarget(Target);
  Enabled := LDataSet.Active and not LDataSet.Bof;
end;

// *** ----------- from: Vcl.DBActns.TDataSetAction

function TDataSetFirstAction.HandlesTarget(Target: TObject): Boolean;
var
  isAccepted: Boolean;
begin
  isAccepted := (Target = FDataSource) and (FDataSource.DataSet <> nil);
  if isAccepted then
    FCountHandlesTarget := FCountHandlesTarget + 1;
  Result := isAccepted;
end;

procedure TDataSetFirstAction.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (AComponent = DataSource) then DataSource := nil;
end;

procedure TDataSetFirstAction.SetDataSource(Value: TDataSource);
begin
  if Value <> FDataSource then
  begin
    FDataSource := Value;
    if Value <> nil then
      Value.FreeNotification(Self);
  end;
end;

function TDataSetFirstAction.GetDataSetFromActionTarget(Target: TObject): TDataSet;
begin
  Result := (Target as TDataSource).DataSet;
end;


end.
