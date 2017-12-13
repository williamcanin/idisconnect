unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Menus, GIFImg, Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage;

type
  Tfrm_principal = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    edt_HoraProgramada: TEdit;
    edt_MinutosProgramado: TEdit;
    cb_operacao: TComboBox;
    ud_HoraProgramada: TUpDown;
    ud_MinutosProgramado: TUpDown;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel2: TPanel;
    Bevel2: TBevel;
    btn_cancelar: TButton;
    btn_Programar: TButton;
    edt_HoraAtual: TEdit;
    edt_SegundosProgramado: TEdit;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    Arquivo1: TMenuItem;
    Sair2: TMenuItem;
    Sobre1: TMenuItem;
    SobreWindowsOffv1025Portable1: TMenuItem;
    Image1: TImage;
    Bevel3: TBevel;
    MinimizarnoRelogio1: TMenuItem;
    Image2: TImage;
    procedure Timer1Timer(Sender: TObject);
    procedure ud_HoraProgramadaClick(Sender: TObject; Button: TUDBtnType);
    procedure ud_MinutosProgramadoClick(Sender: TObject; Button: TUDBtnType);
    procedure edt_HoraProgramadaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_HoraProgramadaExit(Sender: TObject);
    procedure edt_MinutosProgramadoKeyPress(Sender: TObject; var Key: Char);
    procedure edt_MinutosProgramadoExit(Sender: TObject);
    procedure btn_ProgramarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_HoraProgramadaClick(Sender: TObject);
    procedure edt_MinutosProgramadoClick(Sender: TObject);
    procedure cb_operacaoKeyPress(Sender: TObject; var Key: Char);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure SobreWindowsOffv1025Portable1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure MinimizarnoRelogio1Click(Sender: TObject);
    procedure cb_operacaoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_principal: Tfrm_principal;

implementation



{$R *.dfm}

procedure Tfrm_principal.btn_cancelarClick(Sender: TObject);
begin
Timer1.Enabled:=false;
edt_HoraProgramada.Enabled:=true;
edt_MinutosProgramado.Enabled:=true;
cb_operacao.Enabled:=true;
ud_HoraProgramada.Refresh;
ud_MinutosProgramado.Refresh;
btn_Programar.Enabled:=true;
btn_cancelar.Enabled:=false;
edt_HoraProgramada.SetFocus;

TrayIcon1.BalloonHint:='iDisconnect v1.0.00 Portable está Parado';
TrayIcon1.Hint:='iDisconnect v1.0.00 Portable foi Parado';
TrayIcon1.BalloonTitle:='iDisconnect v1.0.00 Portable';
TrayIcon1.ShowBalloonHint;
Image1.Visible:=false;


end;

procedure Tfrm_principal.btn_ProgramarClick(Sender: TObject);
begin
Timer1.Enabled:=true;
edt_HoraProgramada.Enabled:=false;
edt_MinutosProgramado.Enabled:=false;
cb_operacao.Enabled:=false;
ud_HoraProgramada.Refresh;
ud_MinutosProgramado.Refresh;
btn_Programar.Enabled:=false;
btn_cancelar.Enabled:=true;
btn_cancelar.SetFocus;

if (cb_operacao.ItemIndex = 2) then
begin
TrayIcon1.BalloonHint:='iDisconnect v1.0.00 Portable está em Operação. O computador irá realizar o '+cb_operacao.Text+' na próxima '+edt_HoraProgramada.Text+':'+edt_MinutosProgramado.Text+' hrs';
TrayIcon1.Hint:='iDisconnect v1.0.00 Portable está em Operação. O computador irá irá realizar o '+cb_operacao.Text+' na próxima '+edt_HoraProgramada.Text+':'+edt_MinutosProgramado.Text+' hrs';
TrayIcon1.BalloonTitle:='iDisconnect v1.0.00 Portable';
TrayIcon1.ShowBalloonHint;
TrayIcon1.Visible:=true;
Image1.Visible:=true;
hide;
end
else
begin
TrayIcon1.BalloonHint:='iDisconnect v1.0.00 Portable está em Operação. O computador irá '+cb_operacao.Text+' na próxima '+edt_HoraProgramada.Text+':'+edt_MinutosProgramado.Text+' hrs';
TrayIcon1.Hint:='iDisconnect v1.0.00 Portable está em Operação. O computador irá '+cb_operacao.Text+' na próxima '+edt_HoraProgramada.Text+':'+edt_MinutosProgramado.Text+' hrs';
TrayIcon1.BalloonTitle:='iDisconnect v1.0.00 Portable';
TrayIcon1.ShowBalloonHint;
TrayIcon1.Visible:=true;
Image1.Visible:=true;
hide;
end;


end;

procedure Tfrm_principal.cb_operacaoClick(Sender: TObject);
begin
{case cb_operacao.ItemIndex of
1:begin
MessageBox(handle,'A Operação de   R E I N I C I A R   só esta disponivel para Versão Free instalavel.'+#13+'A Versão Portable só tem a operação de D E S L I G A R.'+#13+'Entre em contato com o Fornecedor para adiquirir a Versão Free instalavel.','Aviso',MB_ICONINFORMATION);
cb_operacao.ItemIndex:=0;
end;
2:begin
MessageBox(handle,'A Operação de   L O G O F F   só esta disponivel para Versão Free instalavel.'+#13+'A Versão Portable só tem a operação de D E S L I G A R.'+#13+'Entre em contato com o Fornecedor para adiquirir a Versão Free instalavel.','Aviso',MB_ICONINFORMATION);
cb_operacao.ItemIndex:=0;
end;
3:begin
MessageBox(handle,'A Operação de   H I B E R N A R   só esta disponivel para Versão Free instalavel.'+#13+'A Versão Portable só tem a operação de D E S L I G A R.'+#13+'Entre em contato com o Fornecedor para adiquirir a Versão Free instalavel.','Aviso',MB_ICONINFORMATION);
cb_operacao.ItemIndex:=0;
end;
end; }

end;

procedure Tfrm_principal.cb_operacaoKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
  btn_Programar.SetFocus;
end;
end;

procedure Tfrm_principal.edt_HoraProgramadaClick(Sender: TObject);
begin
edt_HoraProgramada.Clear;
edt_HoraProgramada.SetFocus;
end;

procedure Tfrm_principal.edt_HoraProgramadaExit(Sender: TObject);
var i:integer;
begin
if edt_HoraProgramada.Text = '' then
edt_HoraProgramada.Text:='00';



if edt_HoraProgramada.Text = '0' then
edt_HoraProgramada.Text:='00'
else
if edt_HoraProgramada.Text = '1' then
edt_HoraProgramada.Text:='01'
else
if edt_HoraProgramada.Text = '2' then
edt_HoraProgramada.Text:='02'
else
if edt_HoraProgramada.Text = '3' then
edt_HoraProgramada.Text:='03'
else
if edt_HoraProgramada.Text = '4' then
edt_HoraProgramada.Text:='04'
else
if edt_HoraProgramada.Text = '5' then
edt_HoraProgramada.Text:='05'
else
if edt_HoraProgramada.Text = '6' then
edt_HoraProgramada.Text:='06'
else
if edt_HoraProgramada.Text = '7' then
edt_HoraProgramada.Text:='07'
else
if edt_HoraProgramada.Text = '8' then
edt_HoraProgramada.Text:='08'
else
if edt_HoraProgramada.Text = '9' then
edt_HoraProgramada.Text:='09';


if Length(text) > 2 then
begin
if edt_HoraProgramada.Text > '23' then
begin
  MessageBoxA(handle,'Ops! Horas vão até 23','Atenção',MB_ICONINFORMATION);
  edt_HoraProgramada.Clear;
   edt_HoraProgramada.text:='23';
   edt_HoraProgramada.SetFocus;
end;
end;


end;

procedure Tfrm_principal.edt_HoraProgramadaKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['0'..'9', #13, #8]) then
begin
  MessageBoxA(handle,'Você só pode digitar numeros','Atenção',MB_ICONINFORMATION);
  key:=#0;
end;

if key = #13 then
begin
if edt_HoraProgramada.Text = '0' then
edt_HoraProgramada.Text:='00'
else
if edt_HoraProgramada.Text = '1' then
edt_HoraProgramada.Text:='01'
else
if edt_HoraProgramada.Text = '2' then
edt_HoraProgramada.Text:='02'
else
if edt_HoraProgramada.Text = '3' then
edt_HoraProgramada.Text:='03'
else
if edt_HoraProgramada.Text = '4' then
edt_HoraProgramada.Text:='04'
else
if edt_HoraProgramada.Text = '5' then
edt_HoraProgramada.Text:='05'
else
if edt_HoraProgramada.Text = '6' then
edt_HoraProgramada.Text:='06'
else
if edt_HoraProgramada.Text = '7' then
edt_HoraProgramada.Text:='07'
else
if edt_HoraProgramada.Text = '8' then
edt_HoraProgramada.Text:='08'
else
if edt_HoraProgramada.Text = '9' then
edt_HoraProgramada.Text:='09';

  edt_MinutosProgramado.SetFocus;
end;

end;

procedure Tfrm_principal.edt_MinutosProgramadoClick(Sender: TObject);
begin
edt_MinutosProgramado.Clear;
edt_MinutosProgramado.SetFocus;
end;

procedure Tfrm_principal.edt_MinutosProgramadoExit(Sender: TObject);
begin
if edt_MinutosProgramado.Text = '' then
edt_MinutosProgramado.Text:='00';





if edt_MinutosProgramado.Text = '0' then
edt_MinutosProgramado.Text:='00'
else
if edt_MinutosProgramado.Text = '1' then
edt_MinutosProgramado.Text:='01'
else
if edt_MinutosProgramado.Text = '2' then
edt_MinutosProgramado.Text:='02'
else
if edt_MinutosProgramado.Text = '3' then
edt_MinutosProgramado.Text:='03'
else
if edt_MinutosProgramado.Text = '4' then
edt_MinutosProgramado.Text:='04'
else
if edt_MinutosProgramado.Text = '5' then
edt_MinutosProgramado.Text:='05'
else
if edt_MinutosProgramado.Text = '6' then
edt_MinutosProgramado.Text:='06'
else
if edt_MinutosProgramado.Text = '7' then
edt_MinutosProgramado.Text:='07'
else
if edt_MinutosProgramado.Text = '8' then
edt_MinutosProgramado.Text:='08'
else
if edt_MinutosProgramado.Text = '9' then
edt_MinutosProgramado.Text:='09';


if Length(text) > 2 then
begin
if edt_MinutosProgramado.Text > '59' then
begin
  MessageBoxA(handle,'Ops! Minutos vão até 59','Atenção',MB_ICONINFORMATION);
  edt_MinutosProgramado.Clear;
 edt_MinutosProgramado.Text:='59';
   edt_MinutosProgramado.SetFocus;
end;
end;


end;

procedure Tfrm_principal.edt_MinutosProgramadoKeyPress(Sender: TObject;
  var Key: Char);
begin
if not (key in['0'..'9', #13, #8]) then
begin
  MessageBoxA(handle,'Você só pode digitar numeros','Atenção',MB_ICONINFORMATION);
  key:=#0;
end;

if key = #13 then
begin
if edt_MinutosProgramado.Text = '0' then
edt_MinutosProgramado.Text:='00'
else
if edt_MinutosProgramado.Text = '1' then
edt_MinutosProgramado.Text:='01'
else
if edt_MinutosProgramado.Text = '2' then
edt_MinutosProgramado.Text:='02'
else
if edt_MinutosProgramado.Text = '3' then
edt_MinutosProgramado.Text:='03'
else
if edt_MinutosProgramado.Text = '4' then
edt_MinutosProgramado.Text:='04'
else
if edt_MinutosProgramado.Text = '5' then
edt_MinutosProgramado.Text:='05'
else
if edt_MinutosProgramado.Text = '6' then
edt_MinutosProgramado.Text:='06'
else
if edt_MinutosProgramado.Text = '7' then
edt_MinutosProgramado.Text:='07'
else
if edt_MinutosProgramado.Text = '8' then
edt_MinutosProgramado.Text:='08'
else
if edt_MinutosProgramado.Text = '9' then
edt_MinutosProgramado.Text:='09';

  cb_operacao.SetFocus;
end;

end;

procedure Tfrm_principal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
{ if Application.MessageBox('Você deseja minimizar o iDisconnect v1.0.00 Portable no relógio?', 'Aviso',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2)=ID_YES then
 begin
   CanClose:=false;
   TrayIcon1.Visible:=true;
   hide;
 end
 else
 begin
      CanClose:=true;
      Application.Terminate;
 end;}
end;

procedure Tfrm_principal.FormShow(Sender: TObject);
begin
if edt_HoraProgramada.Text = '0' then
edt_HoraProgramada.Text:='00';

if edt_MinutosProgramado.Text = '0' then
edt_MinutosProgramado.Text:='00';
end;

procedure Tfrm_principal.MinimizarnoRelogio1Click(Sender: TObject);
begin
TrayIcon1.Visible:=true;
hide;
end;

procedure Tfrm_principal.Sair1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfrm_principal.Sair2Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfrm_principal.SobreWindowsOffv1025Portable1Click(Sender: TObject);
begin
{
Windows Off Versão 1.0.25 Free

Este software é Free com Direitos Autorais.
Membro/Contato: William da Costa Canin
Empresa: IAMSoft (c)
}
MessageBoxA(handle,'iDisconnect Versão 1.0.00 Portable'+#13+#13+'iDisconnect Versão 1.0.00 Portable é software Free com Direitos Autorais.'
+#13+ 'Esta versão portable comparada com versão Free Instalavel é limitada em algumas funcionalidades.'+#13+#13+
'> Versão Free Instalavel(Funcionalidades):' +#13+
'Desligar,Reiniciar,Logoff e Hibernar, Inicialização com S.O, Criação de mensagens personalizadas(Não remotamente),'+#13+
'Habilitar/Desabilitar temas e Alteração de idiomas disponiveis(Português e Inglês).'+#13+#13+
#13+#13+#13+'Direitos de: William da Costa Canin'+#13+'Compatibilidade: Plataforma Windows.'+#13+
'Fornecedor/Contato: william.costa.canin@gmail.com'+#13+#13+'IAMSoft(c) 2009 - 2013. Brasil','iDisconnect v1.0.00 Portable',MB_ICONINFORMATION);
end;

procedure Tfrm_principal.Timer1Timer(Sender: TObject);
var
Tempo, hora_alarme1,hora_alarme5:string;
hToken : THandle;
pPrivileges : TTokenPrivileges;
pOldPrivileges: TTokenPrivileges;
Zero: DWord;
ptZero: DWord;
tResult: Boolean;
begin
edt_HoraAtual.Text:= TimeToStr(now);

Tempo:= edt_HoraProgramada.Text +':'+ edt_MinutosProgramado.Text +':'+edt_SegundosProgramado.Text;
hora_alarme1:=TimeToStr(strtotime(Tempo) - StrToTime('00:01:00'));
hora_alarme5:=TimeToStr(strtotime(Tempo) - StrToTime('00:05:00'));

// Mensagem de alerta de 5 minutos

      if (( (Edt_HoraAtual.Text) = (hora_alarme5)) and (cb_operacao.ItemIndex = 0 )) then
       begin


        messagebox(handle,'Seu computador vai ser Desligado em 5 minutos!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

       end
        else
   if (( (Edt_HoraAtual.Text) = (hora_alarme5)) and (cb_operacao.ItemIndex = 1 )) then
    begin



        messagebox(handle,'Seu computador vai ser Reiniciado em 5 minutos!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end
        else
   if (( (Edt_HoraAtual.Text) = (hora_alarme5)) and (cb_operacao.ItemIndex = 2 )) then
    begin



       messagebox(handle,'Seu computador vai fazer o Logoff em 5 minutos!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end
        else
   if (( (Edt_HoraAtual.Text) = (hora_alarme5)) and (cb_operacao.ItemIndex = 3 )) then
    begin

        messagebox(handle,'Seu computador vai ser Hibernado em 5 minutos!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end;

// Mensagem de alerta de 1 minuto
   if (( (Edt_HoraAtual.Text) = (hora_alarme1)) and (cb_operacao.ItemIndex = 0 )) then
       begin

        messagebox(handle,'Seu computador vai ser Desligado em 1 minuto!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

       end
        else
    if (( (Edt_HoraAtual.Text) = (hora_alarme1)) and (cb_operacao.ItemIndex = 1 )) then
    begin

        messagebox(handle,'Seu computador vai ser Reiniciado em 1 minuto!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end
        else
     if (( (Edt_HoraAtual.Text) = (hora_alarme1)) and (cb_operacao.ItemIndex = 2 )) then
    begin

        messagebox(handle,'Seu computador vai fazer o Logoff em 1 minuto!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end
        else
     if (( (Edt_HoraAtual.Text) = (hora_alarme1)) and (cb_operacao.ItemIndex = 3 )) then
    begin

        messagebox(handle,'Seu computador vai ser Hibernado em 1 minuto!','Aviso do iDisconnect v1.0.00 Portable', MB_ICONINFORMATION)

    end;



if (edt_HoraAtual.Text = Tempo) and (cb_operacao.ItemIndex = 0) then
begin
// MessageBoxA(handle,'Desligando','Atenção',MB_ICONINFORMATION);
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
if tResult then
tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);
pPrivileges.PrivilegeCount := 1;
pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
Zero := 0;
ptZero := SizeOf(pOldPrivileges);
if tResult then
Windows.AdjustTokenPrivileges(hToken, False, pPrivileges, ptZero, pOldPrivileges, Zero);
end;
ExitWindowsEx(EWX_SHUTDOWN + EWX_FORCE, 0);

end
else
if (edt_HoraAtual.Text = Tempo) and (cb_operacao.ItemIndex = 1) then
begin
//  MessageBoxA(handle,'Reiniciando','Atenção',MB_ICONINFORMATION);
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
if tResult then
tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);
pPrivileges.PrivilegeCount := 1;
pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
Zero := 0;
ptZero := SizeOf(pOldPrivileges);
if tResult then
Windows.AdjustTokenPrivileges(hToken, False, pPrivileges, ptZero, pOldPrivileges, Zero);
end;
ExitWindowsEx(EWX_REBOOT + EWX_FORCE, 0);
end
else
if (edt_HoraAtual.Text = Tempo) and (cb_operacao.ItemIndex = 2) then
begin
//  MessageBoxA(handle,'Realizando Logof','Atenção',MB_ICONINFORMATION);
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
if tResult then
tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);
pPrivileges.PrivilegeCount := 1;
pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
Zero := 0;
ptZero := SizeOf(pOldPrivileges);
if tResult then
Windows.AdjustTokenPrivileges(hToken, False, pPrivileges, ptZero, pOldPrivileges, Zero);
end;
ExitWindowsEx(EWX_LOGOFF + EWX_FORCE, 0);
end
else
if (edt_HoraAtual.Text = Tempo) and (cb_operacao.ItemIndex = 3) then
begin
 // MessageBoxA(handle,'Hibernando','Atenção',MB_ICONINFORMATION);
 if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tResult := OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken);
if tResult then
tResult := LookupPrivilegeValue(nil, 'SeShutdownPrivilege', pPrivileges.Privileges[0].Luid);
pPrivileges.PrivilegeCount := 1;
pPrivileges.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
Zero := 0;
ptZero := SizeOf(pOldPrivileges);
if tResult then
Windows.AdjustTokenPrivileges(hToken, False, pPrivileges, ptZero, pOldPrivileges, Zero);
end;
  WinExec('RunDll32.exe powrprof.dll,SetSuspendState',SW_HIDE);
end;
end;

procedure Tfrm_principal.TrayIcon1Click(Sender: TObject);
begin
frm_principal.Show;
end;

procedure Tfrm_principal.ud_HoraProgramadaClick(Sender: TObject;
  Button: TUDBtnType);
begin
edt_HoraProgramada.SetFocus;

if edt_HoraProgramada.Text = '0' then
edt_HoraProgramada.Text:='00'
else
if edt_HoraProgramada.Text = '1' then
edt_HoraProgramada.Text:='01'
else
if edt_HoraProgramada.Text = '2' then
edt_HoraProgramada.Text:='02'
else
if edt_HoraProgramada.Text = '3' then
edt_HoraProgramada.Text:='03'
else
if edt_HoraProgramada.Text = '4' then
edt_HoraProgramada.Text:='04'
else
if edt_HoraProgramada.Text = '5' then
edt_HoraProgramada.Text:='05'
else
if edt_HoraProgramada.Text = '6' then
edt_HoraProgramada.Text:='06'
else
if edt_HoraProgramada.Text = '7' then
edt_HoraProgramada.Text:='07'
else
if edt_HoraProgramada.Text = '8' then
edt_HoraProgramada.Text:='08'
else
if edt_HoraProgramada.Text = '9' then
edt_HoraProgramada.Text:='09';
end;

procedure Tfrm_principal.ud_MinutosProgramadoClick(Sender: TObject;
  Button: TUDBtnType);
begin
edt_MinutosProgramado.SetFocus;

if edt_MinutosProgramado.Text = '0' then
edt_MinutosProgramado.Text:='00'
else
if edt_MinutosProgramado.Text = '1' then
edt_MinutosProgramado.Text:='01'
else
if edt_MinutosProgramado.Text = '2' then
edt_MinutosProgramado.Text:='02'
else
if edt_MinutosProgramado.Text = '3' then
edt_MinutosProgramado.Text:='03'
else
if edt_MinutosProgramado.Text = '4' then
edt_MinutosProgramado.Text:='04'
else
if edt_MinutosProgramado.Text = '5' then
edt_MinutosProgramado.Text:='05'
else
if edt_MinutosProgramado.Text = '6' then
edt_MinutosProgramado.Text:='06'
else
if edt_MinutosProgramado.Text = '7' then
edt_MinutosProgramado.Text:='07'
else
if edt_MinutosProgramado.Text = '8' then
edt_MinutosProgramado.Text:='08'
else
if edt_MinutosProgramado.Text = '9' then
edt_MinutosProgramado.Text:='09';
end;

end.
