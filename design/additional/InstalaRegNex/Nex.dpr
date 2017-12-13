program Nex;

uses
  Forms,
  registry,windows;

{$R *.res}
{$R UAC.res}
var
REG:tregistry;


begin
  Application.Initialize;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Nex') then
begin
REG.writeInteger('Nex',0);
REG.CloseKey;
REG.Free;
end;


  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
