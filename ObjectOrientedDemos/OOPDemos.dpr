program OOPDemos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Main.VirtualMetods in 'Main.VirtualMetods.pas',
  Main.GenericCollection in 'Main.GenericCollection.pas',
  DataModule.CenericCollection in 'DataModule.CenericCollection.pas' {DataModule1: TDataModule};

begin
  try
    // Execute_VirtualMetodsDemo;
    Execute_GenericCollectionDemo;
    Write('+--> Press Enter to close ...');
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
