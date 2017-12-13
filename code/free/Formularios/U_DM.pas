unit U_DM;

interface

uses
  SysUtils, Classes, FMTBcd, Provider, DB, SqlExpr, DBClient;

type
  TDM = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses U_principal;

{$R *.dfm}

end.
