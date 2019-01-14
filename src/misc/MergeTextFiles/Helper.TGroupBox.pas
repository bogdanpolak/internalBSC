unit Helper.TGroupBox;

interface

uses
  System.Types, Vcl.StdCtrls, Vcl.Controls;

type
  TGroubBoxClassHelper = class helper for Vcl.StdCtrls.TGroupBox
    function ChildrensSumHeight(ControlsToExclude: TArray<TControl>): Integer;
  end;

implementation


function TGroubBoxClassHelper.ChildrensSumHeight(ControlsToExclude
  : TArray<TControl>): Integer;
var
  i: Integer;
  ctrl: Vcl.Controls.TControl;
  isExcluded: Boolean;
  j: Integer;
  sumHeight: Integer;
begin
  //
  sumHeight := 0;
  for i := 0 to self.ControlCount - 1 do
  begin
    ctrl := self.Controls[i];
    isExcluded := false;
    for j := 0 to Length(ControlsToExclude) - 1 do
      if ControlsToExclude[j] = ctrl then
        isExcluded := True;
    if not isExcluded then
    begin
      sumHeight := sumHeight + ctrl.Height;
      if ctrl.AlignWithMargins then
        sumHeight := sumHeight + ctrl.Margins.Top + ctrl.Margins.Bottom;
    end;
  end;
  Result := sumHeight;
end;

end.
