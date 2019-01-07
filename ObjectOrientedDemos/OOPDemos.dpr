program OOPDemos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Main.VirtualMetods in 'Main.VirtualMetods.pas',
  Main.GenericCollection in 'Main.GenericCollection.pas',
  DataModule.CenericCollection in 'DataModule.CenericCollection.pas' {DataModule1: TDataModule},
  Helper.TDataSet in 'Helper.TDataSet.pas',
  Main.DependencyInjectionContainer in 'Main.DependencyInjectionContainer.pas';

begin
  try
    // 1 --------------------------------------
    // Execute_VirtualMetodsDemo;
    // 2 --------------------------------------
    // Execute_GenericCollectionDemo;
    // 3 --------------------------------------
    Execute_DependencyInjectionContainerDemo;
    // ----------------------------------------
    Write('+--> Press Enter to close ...');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
