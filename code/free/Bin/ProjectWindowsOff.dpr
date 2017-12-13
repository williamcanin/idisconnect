program ProjectWindowsOff;

uses
  Forms,
  registry,
  windows,
  dialogs,
  Graphics,
  Controls,
  StdCtrls,
  ExtCtrls,
  Messages,
  ShellApi,
  db,
  ComCtrls,
  DBCtrls,
  SysUtils,
  inifiles,
  U_principal in '..\Formularios\U_principal.pas' {frm_principal},
  U_opcoes in '..\Formularios\U_opcoes.pas' {frm_opcoes},
  U_bloqueio in '..\Formularios\U_bloqueio.pas' {frm_bloqueio},
  U_trocasenha in '..\Formularios\U_trocasenha.pas' {frm_trocasenha},
  U_removesenha in '..\Formularios\U_removesenha.pas' {frm_removesenha},
  U_DM in '..\Formularios\U_DM.pas' {DM: TDataModule},
  GifImage in '..\Formularios\GifImage.pas',
  U_sobre in '..\Formularios\U_sobre.pas' {frm_sobre},
  U_splash in '..\Formularios\U_splash.pas' {frm_splash};

{$R *.res}
{$R UAC.res}

var
Nex,n,prots:integer;
Nexs,ns,pw,conpw,dir,dirdata:string;
iniArquivo:Tinifile;

begin
  Application.Initialize;
  dir:= (ExtractFilePath(Application.ExeName));
  dirdata:= (ExtractFilePath(Application.ExeName)+'\data');

{
  if FileExists(ExtractFilePath(Application.ExeName)+'data\Language.ini') and
        ( iniArquivo.ReadString('Geral','Language','') <> '0') and
         ( iniArquivo.ReadString('Geral','Language','') <> '1')
   then
   begin
//    iniArquivo := TIniFile.Create( ExtractFilePath( Application.ExeName ) + 'data\Language.ini' );
    iniArquivo := TIniFile.Create( ExtractFilePath( Application.ExeName ) + 'data\Language.ini' );
     iniArquivo.WriteString( 'Geral', 'Language', '0');
   end

   else }
    if not FileExists(ExtractFilePath(Application.ExeName)+'data\Language.ini')
    and not DirectoryExists(dirdata)
    then
    begin
     createdir(dirdata);
     iniArquivo := TIniFile.Create( ExtractFilePath( Application.ExeName ) + 'data\Language.ini' );
     iniArquivo.WriteString( 'Geral', 'Language', '0');
    end;



//winexec(PAnsiChar(AnsiString(dir+'Nex.exe')),sw_hide);
//winexec(PAnsiChar(AnsiString('cmd /c del Nex.exe')),sw_hide);
//WinExec('C:\Users\william\Desktop\WCSOFT\Windows Off\InstalaRegNex\Nex.exe');
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if reg.ValueExists('Nex') then
begin
Nex:= REG.ReadInteger('Nex');
Nex:=Nex+1;
REG.WriteInteger('Nex',Nex);
REG.CloseKey;
REG.Free;
end
else
if not reg.ValueExists('Nex') then
begin
Messagedlg('Erro de Registro. Reinstale o iDisconnect v1.0.25 Free',mtWarning, [mbOK], 0);
Application.Terminate;
REG.CloseKey;
REG.Free;
end;





{REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Nex') then
begin
Messagedlg('Erro de Registro',mtWarning, [mbOK], 0);
Application.Terminate;
REG.CloseKey;
REG.Free;
end;}






{REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if reg.ValueExists('Nex') then
begin
Nex:= REG.ReadInteger('Nex');
Nex:=Nex+1;
REG.WriteInteger('Nex',Nex);
REG.CloseKey;
REG.Free; }

with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
n:=readinteger('Nex');
closekey;
end;
end;
if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
 end;
 {

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('ProtS') then
begin
REG.WriteInteger('ProtS',0);
REG.CloseKey;
REG.Free;
end;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('AlMsg') then
begin
REG.WriteInteger('AlMsg',0);
REG.CloseKey;
REG.Free;
end;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Pw') then
begin
REG.writeString('Pw','');
REG.CloseKey;
REG.Free;
end;


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('ConPw') then
begin
REG.writeString('ConPw','');
REG.CloseKey;
REG.Free;
end;


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('T3m') then
begin
REG.WriteInteger('T3m',1);
REG.CloseKey;
REG.Free;
end;

end

end

else
begin
Messagedlg('Erro de Registro, reinstale o Windows Off',mtWarning, [mbOK], 0);
Application.Terminate;
end;}



// verifica a chave de contagem do programa, se for zero
// cria registro de proteção com senha, se for maior ou igual a 1
// ele não cria





  //  verifica se a minha chave de proteção de senha foi apagada do registro
  // por acidente, se foi, manda mensagem de erro e a aplicação não
  //inicia
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('ProtS')
or not reg.ValueExists('Inv')
or not reg.ValueExists('AlMsg')
or not reg.ValueExists('Nex')
or not reg.ValueExists('T3m')
or not reg.ValueExists('Tray')
or not reg.ValueExists('Pw')
or not reg.ValueExists('ConPw')
or not reg.ValueExists('Sod')

then
begin
Messagedlg('Erro de Registro. Reinstale o iDisconnect v 1.0.25 Free',mtWarning, [mbOK], 0);
Application.Terminate;
REG.CloseKey;
REG.Free;
end;

{REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Pw') then
begin
Messagedlg('Erro de Registro, reinstale o Windows Off',mtWarning, [mbOK], 0);

Application.Terminate;
REG.CloseKey;
REG.Free;
end;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('ConPw') then
begin

Messagedlg('Erro de Registro, reinstale o Windows Off',mtWarning, [mbOK], 0);

Application.Terminate;
REG.CloseKey;
REG.Free;
end; }
{

// criar chave de modo invisivel
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Inv') then
begin
REG.WriteInteger('Inv',0);
REG.CloseKey;
REG.Free;
end;

// criar a minha chave de minimizar a aplicação no tray, se não existir.
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
if not reg.ValueExists('Tray') then
begin
REG.WriteInteger('Tray',0);
REG.CloseKey;
REG.Free;
end;
}




  // fim




with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
pw:=readstring('Pw');
conpw:=readstring('ConPw');
prots:=readinteger('ProtS');
closekey;
end;
end;
if  (pw <> '') and (conpw <> '') and (prots = 1) then
begin


Application.MainFormOnTaskbar := True;



  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.ShowMainForm := False;
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
  Application.Run;
end
else
begin
Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
    Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
  Application.Run;
end;


end.
