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
  U_principal in '..\Formularios\U_principal.pas' {frm_principal},
  U_opcoes in '..\Formularios\U_opcoes.pas' {frm_opcoes},
  U_bloqueio in '..\Formularios\U_bloqueio.pas' {frm_bloqueio},
  U_trocasenha in '..\Formularios\U_trocasenha.pas' {frm_trocasenha},
  U_removesenha in '..\Formularios\U_removesenha.pas' {frm_removesenha},
  U_DM in '..\Formularios\U_DM.pas' {DM: TDataModule},
  GifImage in '..\Formularios\GifImage.pas',
  U_sobre in '..\Formularios\U_sobre.pas' {frm_sobre},
  U_splash in '..\Formularios\U_splash.pas' {frm_splash},
  U_validasoftware in '..\Formularios\U_validasoftware.pas' {frm_VALIDASOFTWARE};

{$R *.res}
{$R UAC.res}

var
Nex,n,prots:integer;
Nexs,ns,pw,conpw,dir, id, v:string;
license, l,endlis, ds: TDate;

begin
  Application.Initialize;

   license:= now + 5;
   endlis:= now + 365;
  dir:= (ExtractFilePath(Application.ExeName));

//winexec(PAnsiChar(AnsiString(dir+'Nex.exe')),sw_hide);
//winexec(PAnsiChar(AnsiString('cmd /c del Nex.exe')),sw_hide);
//WinExec('C:\Users\william\Desktop\WCSOFT\Windows Off\InstalaRegNex\Nex.exe');

{ with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);

ds:= readDate('DateIns');

closekey;
end;

if (ds <> now) then
begin
Messagedlg('A Data de Instalação é ',mtWarning, [mbOK], 0);
end;


end; }


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',false);
if not reg.ValueExists('ProtS')
or not reg.ValueExists('Inv')
or not reg.ValueExists('AlMsg')
or not reg.ValueExists('Nex')
or not reg.ValueExists('T3m')
or not reg.ValueExists('Tray')
or not reg.ValueExists('Pw')
or not reg.ValueExists('ConPw')
or not reg.ValueExists('LyerrIAMWO')
or not reg.ValueExists('ProductID')


then
begin
Messagedlg('Erro de Registro. Reinstale o Windows Off v 1.0.25',mtWarning, [mbOK], 0);
Application.Terminate;
REG.CloseKey;
REG.Free;
end;

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
Messagedlg('Erro de Registro',mtWarning, [mbOK], 0);
Application.Terminate;
REG.CloseKey;
REG.Free;
end;



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

     Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', False);
  If Reg.ValueExists('LyerrIAMWO') then // licença
  begin
   reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteDate('LyerrIAMWO',license);
    reg.CloseKey();
    reg.Free;
 End;

 Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If Reg.ValueExists('EndLis') then
  begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteDate('EndLis',endlis);
    reg.CloseKey();
    reg.Free;
 End;

 end;

{    Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', False);
  If not Reg.ValueExists('LyerrIAMWO') then // licença
  begin
   reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteDate('LyerrIAMWO',license);
    reg.CloseKey();
    reg.Free;
 End;  }


 
 {with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
l:= readDate('LyerrIAMWO');
closekey;
end;
if (l = '') then
begin
reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteDate('LyerrIAMWO',license);
    reg.CloseKey();
    reg.Free;
    end;



end;}


 {    Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If not Reg.ValueExists('License') then
  begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteDate('DateIns',dateins);
    reg.CloseKey();
    reg.Free;
 End; }


{Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If not Reg.ValueExists('ProductID') then
  begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteString('ProductID', 'Wui/@OillmnkF8772');
    reg.CloseKey();
    reg.Free;
 End;}


 with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
id:=readstring('ProductID');
l:= readDate('LyerrIAMWO');
endlis:= readDate('EndLis');
v:= readString('Version');
n:=readinteger('Nex');
pw:=readstring('Pw');
conpw:=readstring('ConPw');
prots:=readinteger('ProtS');
closekey;
end;


       if (now > endlis  ) then
       begin
          messageDlg('O Serial do Windows Off v2.0.25 expirou. O Serial tinha um prazo de 365 dias para expirar. Por favor adquira um novo Serial com o desenvolvedor para continuar usufruindo do mesmo!'+#13+'Atenciosamente: IAMSoft (c) Systems Softwares'+#13'Obrigado: ',mtwarning,[mbok],0);
       application.Terminate;
       end
       else

if  ((now < l)and (id = 'JtHBy[pazxxn') and  (pw <> '') and (conpw <> '') and (prots = 1)) then
begin
{if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end;}

Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.ShowMainForm := False;
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
  Application.Run;


end
else
if  ((now < l)and (id = 'JtHBy[pazxxn') and  (pw = '') and (conpw = '') and (prots = 0)) then
begin
{if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end;}

Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
  Application.Run;


end
else
 if ((now <= l) and (id <> 'JtHBy[pazxxn') and (prots = 0)) then
    BEGIN

        messageDlg('Seu software vai expirar no dia: '+datetostr(l)+'!'+#13+'A menos que você ative ele antes de terminar o prazo de expiração, no menu "Ativação".',mtwarning,[mbok],0);


   {  if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end; }
        //  Application.MainFormOnTaskbar := True;
        Application.CreateForm(TFRM_PRINCIPAL, FRM_PRINCIPAL);
        Application.CreateForm(TDM, DM);
           Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
        FreeAndNil(frm_validasoftware);
        FreeAndNil(frm_splash);
        Application.Run;
  END
  else
   if ((now <= l) and (id <> 'JtHBy[pazxxn') and (prots = 1)) then
    BEGIN

        messageDlg('Seu software vai expirar no dia: '+datetostr(l)+'!'+#13+'A menos que você valide ele antes de terminar o prazo de expiração, no menu "LICENÇA".',mtwarning,[mbok],0);


   {  if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end; }
        //  Application.MainFormOnTaskbar := True;
        Application.CreateForm(TFRM_PRINCIPAL, FRM_PRINCIPAL);
        Application.CreateForm(TDM, DM);
           Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
    Application.ShowMainForm := False;
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
        FreeAndNil(frm_validasoftware);
        FreeAndNil(frm_splash);
        Application.Run;
  END
  else
   if ((now > l) and (id <> 'JtHBy[pazxxn')) then
   begin
      frm_validasoftware:= Tfrm_validasoftware.Create(Application);

       frm_validasoftware.sSkinManager1.Active:=true;


           messageDlg('O Windows Off v2.0.25 esta expirado, por favor adquira o serial'+#13+'para continuar usufruindo do mesmo!'+#13+'Atenciosamente: IAMSoft(c) Systems Softwares'+#13'Obrigado: ',mtwarning,[mbok],0);
         if (frm_validasoftware.ShowModal = 1) then
                  begin
                   frm_validasoftware.sSkinManager1.Active:=true;

                 {     if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end; }
                    Application.CreateForm(TFRM_PRINCIPAL, FRM_PRINCIPAL);
                    Application.CreateForm(TDM, DM);
                     Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
                    FreeAndNil(frm_validasoftware);
                    FreeAndNil(frm_splash);



                    Application.Run;
                  end

   end
   else
    if ((now > l) and (id = 'JtHBy[pazxxn')) then
       BEGIN

              {                       if  (n = 1) then
begin
 frm_splash:= Tfrm_splash.Create(Application);
 frm_splash.Show;
 FreeAndNil(frm_splash);
end; }
                    Application.CreateForm(TFRM_PRINCIPAL, FRM_PRINCIPAL);
                    Application.CreateForm(TDM, DM);
                                  Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);


                    FreeAndNil(frm_validasoftware);
                    FreeAndNil(frm_splash);

                    Application.Run;


      END





//end fim
end;





  // fim
{

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
id:=readstring('ProductID');
l:= readDate('License');
v:= readString('Version');
closekey;
end;
end;
if  (pw <> '') and (conpw <> '') and (prots = 1) then
begin


Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_sobre, frm_sobre);
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
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
  Application.CreateForm(Tfrm_VALIDASOFTWARE, frm_VALIDASOFTWARE);
  Application.CreateForm(Tfrm_opcoes, frm_opcoes);
  Application.CreateForm(Tfrm_bloqueio, frm_bloqueio);
  Application.CreateForm(Tfrm_trocasenha, frm_trocasenha);
  Application.CreateForm(Tfrm_removesenha, frm_removesenha);
  Application.Run;
end;}


end.
