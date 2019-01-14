unit Frame.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TGridFrame = class(TFrame)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses Module.Customers;

end.
