unit U_principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls, Menus, Buttons, ShellApi,
  WideStrings, DBXFirebird, DB, SqlExpr,registry, FMTBcd, DBClient, Provider, IniFiles,
  GIFImg, pngimage, DBCtrls, sSkinManager, sSkinProvider, sPanel, sBevel, acPNG,
  ImgList, sSpeedButton, acAlphaImageList, TypInfo, WebServExp, WSDLBind,
  XMLSchema, WSDLPub, RpDefine, RpRave, RpCon, RpConDS;

  const
  WM_NOTIFYICON  = WM_USER+333;

type
  Tfrm_principal = class(TForm)
    Edt_horaatual: TEdit;
    Timer: TTimer;
    edt_segundos: TEdit;
    MainMenu1: TMainMenu;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel1: TPanel;
    Memo1: TMemo;
    TimerMsg: TTimer;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    TrayIcon1: TTrayIcon;
    Opes1: TMenuItem;
    Opes2: TMenuItem;
    CONN: TSQLConnection;
    MinimizarnoRelgio1: TMenuItem;
    TrayIconInitialize: TTrayIcon;
    rocarSenha1: TMenuItem;
    RemoverSenha1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Sair2: TMenuItem;
    sSkinManager1: TsSkinManager;
    sDragBar1: TsDragBar;
    btn_criar: TSpeedButton;
    btn_cancelmsg: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    sDragBar2: TsDragBar;
    edt_hora: TEdit;
    UpDown1: TUpDown;
    edt_minutos: TEdit;
    UpDown2: TUpDown;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label1: TLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sDragBar3: TsDragBar;
    CheckBox2: TCheckBox;
    btn_criarmsg: TSpeedButton;
    edt_minutosmsg: TEdit;
    UpDown6: TUpDown;
    Label6: TLabel;
    Label5: TLabel;
    UpDown5: TUpDown;
    edt_horamsg: TEdit;
    sBevel3: TsBevel;
    sBevel4: TsBevel;
    btn_cancelar_: TSpeedButton;
    sBevel5: TsBevel;
    Image1: TImage;
    btn_prog_: TSpeedButton;
    Label7: TLabel;
    sAlphaImageList1: TsAlphaImageList;
    btn_cancelar: TsSpeedButton;
    btn_prog: TsSpeedButton;
    sDragBar4: TsDragBar;
    sDragBar5: TsDragBar;
    sDragBar7: TsDragBar;
    Ajuda1: TMenuItem;
    sBevel6: TsBevel;
    sDragBar6: TsDragBar;
    RvProject1: TRvProject;
    RvProject2: TRvProject;
    LicenaLicense1: TMenuItem;
    ValidaroWindowsOffv20251: TMenuItem;
    procedure TimerTimer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edt_horaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_minutosKeyPress(Sender: TObject; var Key: Char);
    procedure btn_prog_Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_criarmsgClick(Sender: TObject);
    procedure btn_criarClick(Sender: TObject);
    procedure btn_cancelmsgClick(Sender: TObject);
    procedure TimerMsgTimer(Sender: TObject);
    procedure edt_horamsgKeyPress(Sender: TObject; var Key: Char);
    procedure edt_minutosmsgKeyPress(Sender: TObject; var Key: Char);
    procedure CheckBox2Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Opes2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure MinimizarnoRelgio1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CONNBeforeConnect(Sender: TObject);
    procedure edt_horaExit(Sender: TObject);
    procedure edt_minutosExit(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure edt_horamsgExit(Sender: TObject);
    procedure UpDown5Click(Sender: TObject; Button: TUDBtnType);
    procedure edt_minutosmsgExit(Sender: TObject);
    procedure UpDown6Click(Sender: TObject; Button: TUDBtnType);
    procedure btn_cancelar_Click(Sender: TObject);
    procedure edt_horaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_minutosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_horamsgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edt_minutosmsgMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure TrayIconInitializeClick(Sender: TObject);
    procedure rocarSenha1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RemoverSenha1Click(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_progClick(Sender: TObject);
    procedure Ajuda1Click(Sender: TObject);
    procedure edt_horaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edt_minutosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edt_horamsgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edt_minutosmsgMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edt_horaChange(Sender: TObject);
    procedure ValidaroWindowsOffv20251Click(Sender: TObject);
  private
    { Private declarations }
    procedure Atalho(var Msg: TWMHotKey); message WM_HOTKEY;

  //   tnid: TNotifyIconData;
   //   HMainIcon: HICON;
  //    procedure CMClickIcon(var msg: TMessage); message WM_NOTIFYICON;
  public
    { Public declarations }


  end;

var
  frm_principal: Tfrm_principal;
  horaatual:string;
  REG:Tregistry;
  hToken : THandle;
pPrivileges : TTokenPrivileges;
pOldPrivileges: TTokenPrivileges;
Zero: DWord;
ptZero: DWord;
tResult: Boolean;
//  horaatual:= timetostr(time);


implementation

uses U_opcoes, GifImage, U_bloqueio, U_trocasenha, U_DM, U_removesenha, U_sobre,
  U_validasoftware;

{$R *.dfm}



{procedure Tfrm_principal.CMClickIcon(var msg: TMessage);
begin
  case msg.lparam of
    WM_LBUTTONDBLCLK : Show;
  end;
end;}


procedure Tfrm_principal.Atalho(var Msg: TWMHotKey);
begin
if Msg.HotKey = 1 then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('Tray') = 1) and (REG.ReadInteger('Inv') = 1) and (REG.ReadInteger('ProtS') = 0) and (REG.ReadString('Pw') = '') then
begin
  frm_principal.Show;
end
else
if (REG.ReadInteger('Tray') = 1) and (REG.ReadInteger('Inv') = 1) and  (REG.ReadInteger('ProtS') = 1) and (REG.ReadString('Pw') <> '') then
begin
  frm_bloqueio.ShowModal;
end
else
if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 1) and (REG.ReadString('Pw') = '') then
begin
  frm_principal.Show;
end
else
if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 1) and (REG.ReadString('Pw') <> '') and (REG.ReadInteger('ProtS') = 1) then
begin
  frm_bloqueio.ShowModal;
end
else
if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 1) and (REG.ReadString('Pw') <> '') and (REG.ReadInteger('ProtS') = 0) then
begin
  frm_principal.Show;
end

end;
end;

procedure Tfrm_principal.btn_progClick(Sender: TObject);
var
shut,shutmsg:string;
begin
shut:= (edt_hora.Text)+':'+(edt_minutos.Text)+':'+(edt_segundos.Text);
shutMSG:= (edt_horamsg.Text)+':'+(edt_minutosmsg.Text)+':'+(edt_segundos.Text);


{if strtotime(shut) = strtotime('00:00:00') then
begin
  shut:= '24:00:00';
  if (((shut) < (shutmsg)) and (edt_horamsg.Enabled = true) and (edt_minutosmsg.Enabled = true)) then
  begin
   MessageDlg('Atenção! O Horario da mensagem não pode ser maior que o Horario da Operação', mtWarning, [mbOK], 0);
  end;

end
else }

{// arrumar esse codigo esta com erro
if ((strtotime(shut) < strtotime(shutmsg)) and (edt_horamsg.Enabled = true) and (edt_minutosmsg.Enabled = true)) then
 MessageDlg('Atenção! O Horario da mensagem não pode ser maior que o Horario da Operação', mtWarning, [mbOK], 0)

else }


if ((edt_hora.Text >= '24') )then
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'A Hora não pode ser maior nem igual que 24.'+#13+'Por Favor, verifique.','Atenção!', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'The time can not be greater or equal than 24. '+ #13 +' Please, check. ',' Warning!', MB_ICONINFORMATION);
edt_hora.Text:='00';
end
else
if ((edt_horamsg.Text >= '24') )then
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'A Hora não pode ser maior nem igual que 24.'+#13+'Por Favor, verifique.','Atenção!', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'The time can not be greater or equal than 24. '+ #13 +' Please, check. ',' Warning!', MB_ICONINFORMATION);
edt_horamsg.Text:='00';
end
else
begin


edt_segundos.Text:='00';
Timer.Enabled:=true;
TrayIconInitialize.Visible:=false;
edt_hora.Enabled:=false;
edt_segundos.Enabled:=false;
edt_minutos.Enabled:=false;
Btn_prog.Enabled:=false;
ComboBox1.Enabled:=false;
CheckBox1.Enabled:=false;
btn_cancelar.Enabled:=true;

btn_criarmsg.Enabled:=false;
CheckBox2.Enabled:=false;
edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;

if ((CheckBox2.Enabled = false ) and (CheckBox2.Checked = true) and (Memo1.Text <> '')) then
//if ((edt_hora.Text < '24') and(edt_minutos.text < '60') and (edt_minutosmsg.text < '60') and (edt_horamsg.text < '24')) then

begin
  TimerMsg.Enabled:=true;
end;


if (REG.ReadInteger('Tray') = 1) and (REG.ReadInteger('Inv') = 0)
then
begin
  TrayIcon1.Visible:=true;
  TrayIconInitialize.Visible:=FALSE;
//Action := caNone;
Hide;
Image1.Visible:=true;
end
else
if (REG.ReadInteger('Tray') = 1) and (REG.ReadInteger('Inv') = 1) then
begin
  TrayIcon1.Visible:=false;
  TrayIconInitialize.Visible:=FALSE;
//Action := caNone;
Hide;
Image1.Visible:=true;
end


else
if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 1) then
begin
  TrayIcon1.Visible:=false;
  TrayIconInitialize.Visible:=FALSE;
//Action := caNone;
Hide;
Image1.Visible:=true;
end
else
begin
Hide;
TrayIcon1.Visible:=true;
Image1.Visible:=true;
end;


//Hide;
//TrayIcon1.Visible:=true;
//Image1.Visible:=true;

if frm_opcoes.GetIdioma = 0 then
begin
btn_prog.Caption:='Operação Programada|Operaction Programing';
btn_cancelar.Caption:='Cancelar Operação|Cancel';
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
btn_prog.ImageIndex:=4;
TrayIcon1.BalloonHint:='Windows Off esta em Ação';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='Windows Off esta em Ação';
TrayIcon1.ShowBalloonHint;
TrayIconInitialize.ShowBalloonHint;
end
else
if frm_opcoes.GetIdioma = 1 then
begin
btn_prog.Caption:='Operação Programada|Operaction Programing';
btn_cancelar.Caption:='Cancelar Operação|Cancel';
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
btn_prog.ImageIndex:=4;
TrayIcon1.BalloonHint:='Windows Off this Action';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='Windows Off this Action';
TrayIcon1.ShowBalloonHint;
TrayIconInitialize.ShowBalloonHint;
end;
end;




end;

procedure Tfrm_principal.btn_prog_Click(Sender: TObject);
var
shut,shutmsg:string;
begin
shut:= (edt_hora.Text)+':'+(edt_minutos.Text)+':'+(edt_segundos.Text);
shutMSG:= (edt_horamsg.Text)+':'+(edt_minutosmsg.Text)+':'+(edt_segundos.Text);


{if strtotime(shut) = strtotime('00:00:00') then
begin
  shut:= '24:00:00';
  if (((shut) < (shutmsg)) and (edt_horamsg.Enabled = true) and (edt_minutosmsg.Enabled = true)) then
  begin
   MessageDlg('Atenção! O Horario da mensagem não pode ser maior que o Horario da Operação', mtWarning, [mbOK], 0);
  end;

end
else }

{// arrumar esse codigo esta com erro
if ((strtotime(shut) < strtotime(shutmsg)) and (edt_horamsg.Enabled = true) and (edt_minutosmsg.Enabled = true)) then
 MessageDlg('Atenção! O Horario da mensagem não pode ser maior que o Horario da Operação', mtWarning, [mbOK], 0)

else }

 begin


edt_segundos.Text:='00';
Timer.Enabled:=true;
TrayIconInitialize.Visible:=false;
edt_hora.Enabled:=false;
edt_segundos.Enabled:=false;
edt_minutos.Enabled:=false;
Btn_prog.Enabled:=false;
ComboBox1.Enabled:=false;
CheckBox1.Enabled:=false;
btn_cancelar.Enabled:=true;

btn_criarmsg.Enabled:=false;
CheckBox2.Enabled:=false;
edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;

if ((CheckBox2.Enabled = false ) and (CheckBox2.Checked = true) and (Memo1.Text <> '')) then
begin
  TimerMsg.Enabled:=true;
end;


Hide;
TrayIcon1.Visible:=true;
Image1.Visible:=true;
 end;

end;

procedure Tfrm_principal.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked = true then
begin
ComboBox1.Enabled:=true;
edt_hora.Enabled:=true;
edt_minutos.Enabled:=true;
btn_prog.Enabled:=true;
UpDown1.Enabled:=true;
UpDown2.Enabled:=true;
UpDown1.Refresh;
UpDown2.Refresh;

//CheckBox2.Enabled:=true;
btn_criarmsg.Enabled:=true;
//edt_horamsg.Enabled:=true;
//edt_minutosmsg.Enabled:=true;
//UpDown5.Enabled:=true;
//UpDown6.Enabled:=true;
//UpDown5.Refresh;
//UpDown6.Refresh;
end
else
begin
ComboBox1.Enabled:=false;
edt_hora.Enabled:=false;
edt_minutos.Enabled:=false;
btn_prog.Enabled:=false;
btn_cancelar.Enabled:=false;
UpDown1.Enabled:=false;
UpDown2.Enabled:=false;
UpDown1.Refresh;
UpDown2.Refresh;

memo1.Clear;
CheckBox2.Enabled:=false;
CheckBox2.Checked:=false;
btn_criarmsg.Enabled:=false;
edt_horamsg.text:='00';
edt_minutosmsg.text:='00';
edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;
UpDown5.Refresh;
UpDown6.Refresh;
end;
end;

procedure Tfrm_principal.CheckBox2Click(Sender: TObject);
begin
if CheckBox2.Checked = true then
begin
  edt_horamsg.Enabled:=true;
edt_minutosmsg.Enabled:=true;
UpDown5.Enabled:=true;
UpDown6.Enabled:=true;
UpDown5.Refresh;
UpDown6.Refresh;
btn_criarmsg.Enabled:=false;
end
else
begin
btn_criarmsg.Enabled:=true;
   edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
   edt_horamsg.text:='00';
edt_minutosmsg.text:='00';
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;
UpDown5.Refresh;
UpDown6.Refresh;
end;
end;

procedure Tfrm_principal.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin

{
Deixando o Combobox não editavel:
Na combobox configure a propriedade style com a 2 opcao : csDropDownList
}

// IMPEDIR CLIQUE DO BOTÃO DIREITO MOUSE

if not (key in[#27]) then
begin
messagebox(handle,'Você editar esse campo!','Atenção', MB_ICONINFORMATION);
key:= #0;
end;
end;

procedure Tfrm_principal.CONNBeforeConnect(Sender: TObject);
var
Arquivo: TIniFile{uses IniFiles};
dir:string;
begin
dir:= (ExtractFilePath(Application.ExeName)+'\Database\');
 // descomentar essas linhas, apos a apricação ficar pronta
{try
      Arquivo:= TIniFile.Create(ExtractFilePath(Application.ExeName)+ 'CONF.ini');

     with conn do
     begin
      // Conexão para o SQLConnection
    //   Params.Values['CONNECTIONNAME'] := Arquivo.ReadString('DADOS','CONNECTIONNAME','');
  //     Params.Values['DRIVER'] := Arquivo.ReadString('DADOS','DRIVER','');
   //    Params.Values['GETDRIVERFUNC'] := Arquivo.ReadString('DADOS','GETDRIVERFUNC','');
  //     Params.Values['LIBRARYNAME'] := Arquivo.ReadString('DADOS','LIBRARYNAME','');
  //     Params.Values['VENDORLIB'] := Arquivo.ReadString('DADOS','VENDORLIB','');

    //   Params.Values['HOSTNAME'] := Arquivo.ReadString('LOGIN','HOSTNAME','');
       Params.Values['DATABASE'] := Arquivo.ReadString('DADOS','DATABASE','');
       Params.Values['USER_NAME'] := Arquivo.ReadString('DADOS','USER_NAME','SYSDBA');
       Params.Values['PASSWORD'] := Arquivo.ReadString('DADOS','PASSWORD','masterkey');

       Arquivo.Free;


    end;
    Except
   application.terminate;
   ShowMessage('Erro!!!');

  end; }
end;

procedure Tfrm_principal.edt_horaChange(Sender: TObject);
begin
{if (   ( (edt_hora.text) > ('23'))         ) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! As Horas vão até as 23!','Atenção', MB_ICONINFORMATION)
else
messagebox(handle,'Ops! Time vão até as 23!','Atenção', MB_ICONINFORMATION);
//edt_hora.Clear;
edt_hora.Text:='23';
end; }
end;

procedure Tfrm_principal.edt_horaExit(Sender: TObject);
begin
if edt_hora.Text = '' then
edt_hora.Text:='00'
else
if edt_hora.Text = '0' then
edt_hora.Text:='00'
else
if edt_hora.Text = '1' then
edt_hora.Text:='01'
else
if edt_hora.Text = '2' then
edt_hora.Text:='02'
else
if edt_hora.Text = '3' then
edt_hora.Text:='03'
else
if edt_hora.Text = '4' then
edt_hora.Text:='04'
else
if edt_hora.Text = '5' then
edt_hora.Text:='05'
else
if edt_hora.Text = '6' then
edt_hora.Text:='06'
else
if edt_hora.Text = '7' then
edt_hora.Text:='07'
else
if edt_hora.Text = '8' then
edt_hora.Text:='08'
else
if edt_hora.Text = '9' then
edt_hora.Text:='09';

if ((edt_hora.text > '23') ) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! As Horas vão até as 23!','Atenção', MB_ICONINFORMATION)
else
messagebox(handle,'Oops! The hours go to the 23! ',' Attention', MB_ICONINFORMATION);
edt_hora.Text:='00';
end;
end;

procedure Tfrm_principal.edt_horaKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #13, #8 ]) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Você só pode digitar Numeros nesse campo!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'You can only enter Numbers in the field! ',' Attention', MB_ICONINFORMATION);

key:= #0;
end;

if key = #13 then
edt_minutos.SetFocus;

if (((edt_hora.text) > '23') or ((edt_hora.text) = '24')) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! As Horas vão até as 23!','Atenção', MB_ICONINFORMATION)
else
messagebox(handle,'Oops! The hours go to the 23! ',' Attention', MB_ICONINFORMATION);
key:=#0;
edt_hora.Clear;
end;

end;

procedure Tfrm_principal.edt_horaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 0)) then
messagebox(handle,'O botão direito do mouse é bloqueado nesse campo!','Atenção', MB_ICONINFORMATION)
else
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 1)) then
messagebox(handle,'The right mouse button is locked in this field!','Attention!', MB_ICONINFORMATION);

end;

procedure Tfrm_principal.edt_horaMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
if frm_opcoes.GetIdioma = 0 then
edt_hora.Hint:='Aqui você deverá informar a Hora, para realizar a operação.'
else
if frm_opcoes.GetIdioma = 1 then
edt_hora.Hint:='Here you must enter the time to perform the operation.';
end;

procedure Tfrm_principal.edt_horamsgExit(Sender: TObject);
begin
if edt_horamsg.Text = '' then
edt_horamsg.Text:='00'
else
if edt_horamsg.Text = '0' then
edt_horamsg.Text:='00'
else
if edt_horamsg.Text = '1' then
edt_horamsg.Text:='01'
else
if edt_horamsg.Text = '2' then
edt_horamsg.Text:='02'
else
if edt_horamsg.Text = '3' then
edt_horamsg.Text:='03'
else
if edt_horamsg.Text = '4' then
edt_horamsg.Text:='04'
else
if edt_horamsg.Text = '5' then
edt_horamsg.Text:='05'
else
if edt_horamsg.Text = '6' then
edt_horamsg.Text:='06'
else
if edt_horamsg.Text = '7' then
edt_horamsg.Text:='07'
else
if edt_horamsg.Text = '8' then
edt_horamsg.Text:='08'
else
if edt_horamsg.Text = '9' then
edt_horamsg.Text:='09';
end;

procedure Tfrm_principal.edt_horamsgKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #13, #8 ]) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Você só pode digitar Numeros nesse campo!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'You can only enter Numbers in the field! ',' Attention', MB_ICONINFORMATION);
key:=#0;
end;

if key = #13 then
edt_minutosmsg.SetFocus;

if edt_horamsg.text > '23' then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! As Horas vão até as 23!','Atenção', MB_ICONINFORMATION)
else
messagebox(handle,'Oops! The hours go to the 23! ',' Attention', MB_ICONINFORMATION);
key:=#0;
edt_horamsg.text:='00';
end;

end;

procedure Tfrm_principal.edt_horamsgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 0)) then
messagebox(handle,'O botão direito do mouse é bloqueado nesse campo!','Atenção', MB_ICONINFORMATION)
else
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 1)) then
messagebox(handle,'The right mouse button is locked in this field!','Attention!', MB_ICONINFORMATION);
end;

procedure Tfrm_principal.edt_horamsgMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

if frm_opcoes.GetIdioma = 0 then
edt_horamsg.Hint:='Aqui você deverá informar a Hora, para  a mensagem ser disparada.'
else
if frm_opcoes.GetIdioma = 1 then
edt_horamsg.Hint:='Here you must enter the Hour, and the message is triggered.';
end;

procedure Tfrm_principal.edt_minutosExit(Sender: TObject);
begin
if edt_minutos.Text = '' then
edt_minutos.Text:='00'
else
if edt_minutos.Text = '0' then
edt_minutos.Text:='00'
else
if edt_minutos.Text = '1' then
edt_minutos.Text:='01'
else
if edt_minutos.Text = '2' then
edt_minutos.Text:='02'
else
if edt_minutos.Text = '3' then
edt_minutos.Text:='03'
else
if edt_minutos.Text = '4' then
edt_minutos.Text:='04'
else
if edt_minutos.Text = '5' then
edt_minutos.Text:='05'
else
if edt_minutos.Text = '6' then
edt_minutos.Text:='06'
else
if edt_minutos.Text = '7' then
edt_minutos.Text:='07'
else
if edt_minutos.Text = '8' then
edt_minutos.Text:='08'
else
if edt_minutos.Text = '9' then
edt_minutos.Text:='09';
end;

procedure Tfrm_principal.edt_minutosKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #13, #8 ]) then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Você só pode digitar Numeros nesse campo!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'You can only enter Numbers in the field! ',' Attention', MB_ICONINFORMATION);

key:= #0;
end;

if key = #13 then
edt_minutos.SetFocus;

if edt_minutos.text > '59' then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! Minutos vão até 59!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The! 59 minutes to go! ',' Attention', MB_ICONINFORMATION);
key:=#0;
edt_minutos.Text:='00';
end;



end;


procedure Tfrm_principal.edt_minutosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 0)) then
messagebox(handle,'O botão direito do mouse é bloqueado nesse campo!','Atenção', MB_ICONINFORMATION)
else
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 1)) then
messagebox(handle,'The right mouse button is locked in this field!','Attention!', MB_ICONINFORMATION);
end;

procedure Tfrm_principal.edt_minutosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin

if frm_opcoes.GetIdioma = 0 then
edt_minutos.Hint:='Aqui você deverá informar os Minutos da Hora, para realizar a operação.'
else
if frm_opcoes.GetIdioma = 1 then
edt_minutos.Hint:='Here you must enter the Minutes of Time, to perform the operation.';
end;

procedure Tfrm_principal.edt_minutosmsgExit(Sender: TObject);
begin
if edt_minutosmsg.Text = '' then
edt_minutosmsg.Text:='00'
else
if edt_minutosmsg.Text = '0' then
edt_minutosmsg.Text:='00'
else
if edt_minutosmsg.Text = '1' then
edt_minutosmsg.Text:='01'
else
if edt_minutosmsg.Text = '2' then
edt_minutosmsg.Text:='02'
else
if edt_minutosmsg.Text = '3' then
edt_minutosmsg.Text:='03'
else
if edt_minutosmsg.Text = '4' then
edt_minutosmsg.Text:='04'
else
if edt_minutosmsg.Text = '5' then
edt_minutosmsg.Text:='05'
else
if edt_minutosmsg.Text = '6' then
edt_minutosmsg.Text:='06'
else
if edt_minutosmsg.Text = '7' then
edt_minutosmsg.Text:='07'
else
if edt_minutosmsg.Text = '8' then
edt_minutosmsg.Text:='08'
else
if edt_minutosmsg.Text = '9' then
edt_minutosmsg.Text:='09';
end;

procedure Tfrm_principal.edt_minutosmsgKeyPress(Sender: TObject; var Key: Char);
begin
if not (key in['0'..'9', #13, #8 ]) and (frm_opcoes.GetIdioma = 0) then
begin
messagebox(handle,'Você só pode digitar Numeros nesse campo!','Atenção', MB_ICONINFORMATION);
key:= #0;
end
else
if not (key in['0'..'9', #13 ]) and (frm_opcoes.GetIdioma = 1) then
begin
messagebox(handle,'You can only enter Numbers in the field!','Attention!', MB_ICONINFORMATION);
key:= #0;
end;



if key = #13 then
edt_minutosmsg.SetFocus;

if edt_minutosmsg.text > '59' then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Ops! Minutos vão até 59!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The! 59 minutes to go! ',' Attention', MB_ICONINFORMATION);
key:=#0;
edt_minutosmsg.text:='00';
end;

end;

procedure Tfrm_principal.edt_minutosmsgMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 0)) then
messagebox(handle,'O botão direito do mouse é bloqueado nesse campo!','Atenção', MB_ICONINFORMATION)
else
if ((Button = mbRight) and (frm_opcoes.GetIdioma = 1)) then
messagebox(handle,'The right mouse button is locked in this field!','Attention!', MB_ICONINFORMATION);
end;

procedure Tfrm_principal.edt_minutosmsgMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
if frm_opcoes.GetIdioma = 0 then
edt_minutosmsg.Hint:='Aqui você deverá informar os Minutos da Hora, para  a mensagem ser disparada.'
else
if frm_opcoes.GetIdioma = 1 then
edt_minutosmsg.Hint:='Here you must enter the Minutes of Time, and the message is triggered.';

end;

procedure Tfrm_principal.FormActivate(Sender: TObject);
begin








{if  (DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 1)
and (DM.tbl_operaction.FieldByName('password').Asstring <> '' )
and (DM.tbl_operaction.FieldByName('conf_password').Asstring <> '' )
then
 begin
 if frm_bloqueio = nil then
  frm_bloqueio:= tfrm_bloqueio.Create(Application);
  frm_principal.Show;
   frm_bloqueio.Showmodal;
 end; }

 //frm_principal.rocarSenha1.Enabled:=false;


end;

procedure Tfrm_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{DM.tbl_operaction.Close;
DM.sql_operaction.SQL.Clear;
DM.sql_operaction.SQL.Add('select * from operaction');
DM.tbl_operaction.Open; }

{if (DM.tbl_operactionTRAYICON.Value = 1) and
   (DM.tbl_operactionMODOINVISIVEL.Value = 0)
 then
begin
TrayIcon1.Visible:=true;
TrayIconInitialize.Visible:=FALSE;
Action := caNone;
Hide;
end
else
if (DM.tbl_operactionTRAYICON.Value = 1) and
   (DM.tbl_operactionMODOINVISIVEL.Value = 1)
 then
 begin
  TrayIcon1.Visible:=false;
TrayIconInitialize.Visible:=FALSE;
Action := caNone;
Hide;
 end
 else
begin
TrayIcon1.Visible:=false;
  Application.Terminate;
end; }

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('Tray') = 1) //and (REG.ReadInteger('Inv') = 0)
then
begin
  TrayIcon1.Visible:=true;
  TrayIconInitialize.Visible:=FALSE;
Action := caNone;
Hide;
end
{else
if (REG.ReadInteger('Tray') = 1) and (REG.ReadInteger('Inv') = 1) then
begin
  TrayIcon1.Visible:=false;
  TrayIconInitialize.Visible:=FALSE;
Action := caNone;
Hide;
end


else
if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 1) then
begin
  TrayIcon1.Visible:=false;
  TrayIconInitialize.Visible:=FALSE;
Action := caNone;
Hide;
end }
else


//if (REG.ReadInteger('Tray') = 0) and (REG.ReadInteger('Inv') = 0) then
 begin
 TrayIcon1.Visible:=false;
   Application.Terminate;
 end;


end;

procedure Tfrm_principal.FormCreate(Sender: TObject);
var reg:tregistry;
begin


{if  DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 1 then
 begin
 if frm_bloqueio = nil then
  frm_bloqueio:= tfrm_bloqueio.Create(Application);
  frm_principal.Show;
   frm_bloqueio.Showmodal;
 end; }



{if  (DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 1)
and (DM.tbl_operaction.FieldByName('password').Asstring <> '' )
and (DM.tbl_operaction.FieldByName('conf_password').Asstring <> '' )
then
 begin
   frm_bloqueio.Showmodal;
 end; }


 REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('ProtS') = 0)
and (REG.Readstring('Pw') = '')
and (REG.Readstring('ConPw') = '')then
begin
TrayIcon1.Visible:=false;

end;

RegisterHotKey(Handle, 1, MOD_ALT + MOD_SHIFT + MOD_CONTROL,  Ord('W'));


end;

procedure Tfrm_principal.FormDeactivate(Sender: TObject);
begin

//DM.tbl_operaction.Active:=false;

end;

procedure Tfrm_principal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
WITH frm_principal do
begin
  if KEY = VK_F3 then
      BEGIN
          frm_principal.Show;
          if frm_opcoes.GetIdioma = 0 then
          MessageBox(handle,'Feche pelo botão "Fechar"','Atenção',mb_IconError + mb_OK)
          else
          if frm_opcoes.GetIdioma = 1 then
          MessageBox(handle,'Closes the "Close" button ',' Attention',mb_IconError + mb_OK);

          key:=0;
      END;

end;
end;

procedure Tfrm_principal.FormShow(Sender: TObject);
begin
Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If Reg.ReadString('ProductID') <> 'JtHBy[pazxxn' then
  begin
  if frm_opcoes.GetIdioma = 0 then

  frm_principal.Caption:='Windows Off v2.0.25 [NÃO ATIVADO]'
  else
   if frm_opcoes.GetIdioma = 1 then
     frm_principal.Caption:='Windows Off v2.0.25 [NOT ACTIVE]';
 End
 else
 If Reg.ReadString('ProductID') = 'JtHBy[pazxxn' then
 begin
frm_principal.Caption:='Windows Off v2.0.25 Premium';
 end;

{TrayIconInitialize.Visible:=true;
TrayIconInitialize.BalloonHint:='Windows Off esta iniciado';
TrayIconInitialize.BalloonTitle:='Windows Off';
TrayIconInitialize.Hint:='Windows Off esta iniciado'; }

if edt_hora.Text = '0' then
edt_hora.Text:='00';

if edt_minutos.Text = '0' then
edt_minutos.Text:='00';

if edt_horamsg.Text = '0' then
edt_horamsg.Text:='00';

if edt_minutosmsg.Text = '0' then
edt_minutosmsg.Text:='00';

//Button1.Click;
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
//rdgIdioma.ItemIndex := frm_opcoes.GetIdioma;


if frm_opcoes.GetIdioma = 0 then
 begin
 ComboBox1.Clear;
 ComboBox1.DeleteSelected;
  ComboBox1.Items.Add('Desligar');
  ComboBox1.Items.Add('Hibernar');
  ComboBox1.Items.Add('Logoff');
  ComboBox1.Items.Add('Reiniciar');
   ComboBox1.ItemIndex:=0;

 end
  else
   if frm_opcoes.GetIdioma = 1 then
   begin
   ComboBox1.Clear;
   ComboBox1.DeleteSelected;
   ComboBox1.Items.Add('Disconnect');
  ComboBox1.Items.Add('Hibernate');
  ComboBox1.Items.Add('Logoff');
  ComboBox1.Items.Add('Restart');
   ComboBox1.ItemIndex:=0;

   end;

    REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('T3m') = 1 then
begin
  sSkinManager1.Active:=true;
end
else
 begin
   sSkinManager1.Active:=false;
 end;

end;

procedure Tfrm_principal.MinimizarnoRelgio1Click(Sender: TObject);
begin
TrayIcon1.Visible:=true;
if frm_opcoes.GetIdioma = 0 then
begin
TrayIcon1.BalloonHint:='Windows Off esta iniciado';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='Windows Off esta iniciado';
end
else
if frm_opcoes.GetIdioma = 1 then
begin
TrayIcon1.BalloonHint:='Windows Off this started';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='Windows Off this started';
end;
TrayIconInitialize.Visible:=FALSE;
Hide;
end;



procedure Tfrm_principal.Opes2Click(Sender: TObject);
begin
 //if frm_opcoes = nil then
//  frm_opcoes:= tfrm_opcoes.Create(Application);
frm_opcoes.ShowModal;
end;

procedure Tfrm_principal.RemoverSenha1Click(Sender: TObject);
begin

{if((DM.tbl_operactionPASSWORD.Value = '') and (DM.tbl_operactionCONF_PASSWORD.Value = '') )
then
begin
  if frm_opcoes.GetIdioma = 0 then

 messagebox(handle,'O Windows Off ainda não possui uma senha cadastrada para remover','Atenção!', MB_ICONINFORMATION)
 else
 if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The Windows Off ainda não possui uma senha cadastrada para remover','Attention!', MB_ICONINFORMATION)
end
 else
 begin
frm_removesenha.ShowModal;
 end; }


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
if  (pw <> '') and (conpw <> '')then
begin
 frm_removesenha.ShowModal;

end
else
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'O Windows Off ainda não possui uma senha cadastrada para realizar a remoção.'+#13+'Por Favor crie uma senha no Menu Opções.','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The Windows Off does not have a password registered for remove.'+#13+'Please create a password in Options Menu.',' Warning!', MB_ICONINFORMATION)
end;


end;

procedure Tfrm_principal.rocarSenha1Click(Sender: TObject);
begin
{if (DM.tbl_operaction.FieldByName('password').Asstring = '')and
(DM.tbl_operaction.FieldByName('conf_password').Asstring = '')
then
messagebox(handle,'O Windows Off ainda não possui uma senha cadastrada para realizar a troca.'+#13+'Por Favor crie uma senha no Menu Opções.','Aviso', MB_ICONINFORMATION)
else
begin

end; }

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
if  (pw <> '') and (conpw <> '')then
begin
 frm_trocasenha.ShowModal;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'O Windows Off ainda não possui uma senha cadastrada para realizar a troca.'+#13+'Por Favor crie uma senha no Menu Opções.','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The Windows Off does not have a password registered for replacement.'+#13+'Please create a password in Options Menu.',' Warning!', MB_ICONINFORMATION)
end;

end;

procedure Tfrm_principal.Sair1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure Tfrm_principal.Sair2Click(Sender: TObject);
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('ProtS') = 1)
and (REG.Readstring('Pw') <> '')
and (REG.Readstring('ConPw') <> '')then
begin
TrayIcon1.Visible:=false;
//frm_principal.Show;
frm_bloqueio.ShowModal;
end
else
 begin
 TrayIcon1.Visible:=false;

 REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('Tray') = 0) then
Application.Terminate
else
if (REG.ReadInteger('Tray') = 1) then
Application.Terminate;

end;

end;

procedure Tfrm_principal.Sobre2Click(Sender: TObject);
begin
frm_sobre.ShowModal;
end;

procedure Tfrm_principal.btn_criarmsgClick(Sender: TObject);
begin
panel1.Visible:=true;
memo1.SetFocus;
//CheckBox2.Enabled:=true;

end;

procedure Tfrm_principal.Ajuda1Click(Sender: TObject);
begin
{if frm_opcoes.GetIdioma = 0 then
WinExec('cmd /c .\Doc\ptbr-help.htm',SW_hide)
else
if frm_opcoes.GetIdioma = 1 then
WinExec('cmd /c .\Doc\en-help.htm',SW_hide);
//WinExec('cmd /c help.html',SW_HIDE); }
if frm_opcoes.GetIdioma = 0 then
begin
//RvProject1.ProjectFile:='C:\Documents and Settings\admin\Desktop\Windows Off\Doc\Help-Ptbr.rav';
RvProject1.Execute;
end
else
if frm_opcoes.GetIdioma = 1 then
begin
//RvProject2.ProjectFile:='C:\Documents and Settings\admin\Desktop\Windows Off\Doc\Help-En.rav';
RvProject2.Execute;
end;
//RvProject1.Open;
end;




procedure Tfrm_principal.btn_cancelarClick(Sender: TObject);
begin

edt_hora.Enabled:=true;
edt_minutos.Enabled:=true;
Btn_prog.Enabled:=true;
edt_hora.Text:='00';
edt_minutos.Text:='00';
edt_segundos.Text:='00';
Edt_horaatual.Clear;
CheckBox1.Enabled:=true;
CheckBox1.Checked:=true;
ComboBox1.Enabled:=true;
UpDown1.Enabled:=true;
UpDown2.Enabled:=true;
UpDown1.Refresh;
UpDown2.Refresh;

if ((CheckBox2.Checked = true) and (Memo1.Text <> '')) then
begin
edt_horamsg.Enabled:=true;
edt_minutosmsg.Enabled:=true;
CheckBox2.Enabled:=true;
btn_criarmsg.Enabled:=true;
UpDown5.Enabled:=true;
UpDown6.Enabled:=true;
end
else
begin
btn_criarmsg.Enabled:=true;
CheckBox2.Enabled:=false;
CheckBox2.Checked:=false;
edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;
end;


Timer.Enabled:=false;
TimerMSG.Enabled:=false;
btn_cancelar.Enabled:=false;
Image1.Visible:=false;
btn_prog.ImageIndex:=3;
btn_prog.Caption:='Programar Operação|Program Operaction';
btn_cancelar.Caption:='Operação Cancelada|Operaction Cancel';
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );

if frm_opcoes.GetIdioma = 0 then
begin
TrayIcon1.BalloonHint:='A Operação do Windows Off foi Cancelada';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='A operação do Windows Off esta Cancelada';
end
else
if frm_opcoes.GetIdioma = 1 then
begin
TrayIcon1.BalloonHint:='Operation Windows Off was Canceled';
TrayIcon1.BalloonTitle:='Windows Off';
TrayIcon1.Hint:='The operation of this Windows Off Canceled';
end;
TrayIcon1.Visible:=true;

end;

procedure Tfrm_principal.btn_cancelar_Click(Sender: TObject);
begin

edt_hora.Enabled:=true;
edt_minutos.Enabled:=true;
Btn_prog.Enabled:=true;
edt_hora.Text:='00';
edt_minutos.Text:='00';
edt_segundos.Text:='00';
Edt_horaatual.Clear;
CheckBox1.Enabled:=true;
CheckBox1.Checked:=true;
ComboBox1.Enabled:=true;
UpDown1.Enabled:=true;
UpDown2.Enabled:=true;
UpDown1.Refresh;
UpDown2.Refresh;

if ((CheckBox2.Checked = true) and (Memo1.Text <> '')) then
begin
edt_horamsg.Enabled:=true;
edt_minutosmsg.Enabled:=true;
CheckBox2.Enabled:=true;
btn_criarmsg.Enabled:=true;
UpDown5.Enabled:=true;
UpDown6.Enabled:=true;
end
else
begin
btn_criarmsg.Enabled:=true;
CheckBox2.Enabled:=false;
CheckBox2.Checked:=false;
edt_horamsg.Enabled:=false;
edt_minutosmsg.Enabled:=false;
UpDown5.Enabled:=false;
UpDown6.Enabled:=false;
end;


Timer.Enabled:=false;
TimerMSG.Enabled:=false;
btn_cancelar.Enabled:=false;
Image1.Visible:=false;
end;

procedure Tfrm_principal.btn_cancelmsgClick(Sender: TObject);
begin
Memo1.Clear;
panel1.Visible:=false;
CheckBox2.Enabled:=false;
CheckBox2.Checked:=false;
end;

procedure Tfrm_principal.btn_criarClick(Sender: TObject);
begin
if Memo1.Text <> '' then
begin
panel1.Visible:=false;
CheckBox2.Enabled:=true;
end
else
if frm_opcoes.GetIdioma = 0 then
  messagebox(handle,'Você tem que escrever  alguma mensagem para poder gravar!','Atenção', MB_ICONINFORMATION)
  else
  if frm_opcoes.GetIdioma = 1 then
  messagebox(handle,'You have to write a message to be able to write! ',' Attention', MB_ICONINFORMATION)
end;

procedure Tfrm_principal.TimerMsgTimer(Sender: TObject);
var
shutMSG,shut:string;
CanClose: Boolean;

begin
Edt_horaatual.Text:= timetostr(time);
shut:= (edt_hora.Text)+':'+(edt_minutos.Text);
shutMSG:= (edt_horamsg.Text)+':'+(edt_minutosmsg.Text)+':'+(edt_segundos.Text);

if (Edt_horaatual.Text) = (shutMSG) then
begin
  if ((CheckBox2.Checked = true) and (ComboBox1.ItemIndex = 0) and (Memo1.Text <> '')) then
     begin
     if frm_opcoes.GetIdioma = 0 then
      MessageDlg(Memo1.Text+'.Desligando ás: '+shut, mtWarning, [mbOK], 0)
     else
     if frm_opcoes.GetIdioma = 1 then
     MessageDlg(Memo1.Text+'.Shutting ace: '+shut, mtWarning, [mbOK], 0)
     end
     else
     if ((CheckBox2.Checked = true) and (ComboBox1.ItemIndex = 1) and (Memo1.Text <> '')) then
     begin
      if frm_opcoes.GetIdioma = 0 then
      MessageDlg(Memo1.Text+'.Reiniciando ás: '+shut, mtWarning, [mbOK], 0)
     else
     if frm_opcoes.GetIdioma = 1 then
     MessageDlg(Memo1.Text+'.Restarting ace: '+shut, mtWarning, [mbOK], 0)
     end
     else
      if ((CheckBox2.Checked = true) and (ComboBox1.ItemIndex = 2) and (Memo1.Text <> '')) then
     begin
         if frm_opcoes.GetIdioma = 0 then
      MessageDlg(Memo1.Text+'.Realizando Logoff ás: '+shut, mtWarning, [mbOK], 0)
     else
     if frm_opcoes.GetIdioma = 1 then
     MessageDlg(Memo1.Text+'.Performing Logoff ace: '+shut, mtWarning, [mbOK], 0)
     end
     else
     if ((CheckBox2.Checked = true) and (ComboBox1.ItemIndex = 3) and (Memo1.Text <> '')) then
     begin
      if frm_opcoes.GetIdioma = 0 then
      MessageDlg(Memo1.Text+'.Hibernando ás: '+shut, mtWarning, [mbOK], 0)
     else
     if frm_opcoes.GetIdioma = 1 then
     MessageDlg(Memo1.Text+'.Hibernating ace: '+shut, mtWarning, [mbOK], 0)
     end;
end;





end;

procedure Tfrm_principal.TimerTimer(Sender: TObject);
var
shut:string;
CanClose: Boolean;
hora_alarme,hora_alarme5:string;
hToken : THandle;
pPrivileges : TTokenPrivileges;
pOldPrivileges: TTokenPrivileges;
Zero: DWord;
ptZero: DWord;
tResult: Boolean;
BEGIN
{
//desliga monitor
//  SendMessage(Application.Handle, WM_SYSCOMMAND,          SC_MONITORPOWER, 1);

// Windows Vista 32/64 e Windows 7 32/64 e provavelmente os superiores.
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);


}




Edt_horaatual.Text:= timetostr(time);
shut:= (edt_hora.Text)+':'+(edt_minutos.Text)+':'+(edt_segundos.Text);
hora_alarme:=TimeToStr(strtotime(shut) - StrToTime('00:01:00'));
hora_alarme5:=TimeToStr(strtotime(shut) - StrToTime('00:05:00'));


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('AlMsg') = 1 then
begin

// Mensagem de alerta de 5 minutos

      if (( (Edt_horaatual.Text) = (hora_alarme5)) and (ComboBox1.ItemIndex = 0 )) then
       begin
         if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Desligado em 5 minutos!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be turned Off in 5 minutes! ',' Attention', MB_ICONINFORMATION)
       end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme5)) and (ComboBox1.ItemIndex = 1 )) then
    begin
        if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Reiniciado em 5 minutos!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be reset in 5 minutes! ',' Warning.', MB_ICONINFORMATION)
    end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme5)) and (ComboBox1.ItemIndex = 2 )) then
    begin
        if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai fazer o Logoff em 5 minutos!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will do the Logoff in 5 minutes! ',' Attention', MB_ICONINFORMATION)
    end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme5)) and (ComboBox1.ItemIndex = 3 )) then
    begin
         if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Hibernado em 5 minutos!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be Hibernating in 5 minutes! ',' Attention', MB_ICONINFORMATION)
    end;

// Mensagem de alerta de 1 minuto
    if (( (Edt_horaatual.Text) = (hora_alarme)) and (ComboBox1.ItemIndex = 0 )) then
       begin
         if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Desligado em 1 minuto!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be turned Off in 1 minute! ',' Attention', MB_ICONINFORMATION)
       end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme)) and (ComboBox1.ItemIndex = 1 )) then
    begin
        if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Reiniciado em 1 minuto!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be reset in 1 minute! ',' Warning.', MB_ICONINFORMATION)
    end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme)) and (ComboBox1.ItemIndex = 2 )) then
    begin
        if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai fazer o Logoff em 1 minuto!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will do the Logoff in 1 minute! ',' Attention', MB_ICONINFORMATION)
    end
        else
    if (( (Edt_horaatual.Text) = (hora_alarme)) and (ComboBox1.ItemIndex = 3 )) then
    begin
         if frm_opcoes.GetIdioma = 0 then
        messagebox(handle,'Seu computador vai ser Hibernado em 1 minuto!','Atenção', MB_ICONINFORMATION)
        else
          if frm_opcoes.GetIdioma = 1 then
         messagebox(handle,'Your computer will be Hibernating in 1 minute! ',' Attention', MB_ICONINFORMATION)
    end;


end;




   if ((Edt_horaatual.Text) = (shut)) then
      begiN

        if ComboBox1.ItemIndex = 0 then
            begin


             // ao inves da mensagem colocar codigo de desligar
             //Checa a versão do Windows
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


     //        showmessage('Desligando');


            end
            else
          if ComboBox1.ItemIndex = 1 then
            begin
            //Checa a versão do Windows

            WinExec('RunDll32.exe powrprof.dll,SetSuspendState',SW_HIDE);
         //    showmessage('Reiniciando');
            end
            else
           if ComboBox1.ItemIndex = 2 then
            begin
            //Checa a versão do Windows
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

      //       showmessage('Logoff');
            end
            else
            if ComboBox1.ItemIndex = 3 then
            begin

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



//             showmessage('Hibernando');
            end
        enD;



END;


procedure Tfrm_principal.TrayIcon1Click(Sender: TObject);
begin
{
if  DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 1 then
begin
//Panel5.Visible:=true;
//Panel2.Enabled:=false;
//Panel3.Enabled:=false;
//Panel4.Enabled:=false;
TrayIcon1.Visible:=false;
frm_principal.Show;
frm_bloqueio.ShowModal;
end
else
if DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 0 then
begin

//Panel5.Visible:=false;
//Panel2.Enabled:=true;
//Panel3.Enabled:=true;
//Panel4.Enabled:=true;
TrayIcon1.Visible:=false;
frm_principal.Show;
end;}

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('ProtS') = 1)
and (REG.Readstring('Pw') <> '')
and (REG.Readstring('ConPw') <> '')then
begin
TrayIcon1.Visible:=false;
frm_bloqueio.ShowModal;
end
else
 begin
TrayIcon1.Visible:=false;
frm_principal.Show;
 end;

end;

procedure Tfrm_principal.TrayIconInitializeClick(Sender: TObject);
begin
 {




if  DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 1 then
begin
//Panel5.Visible:=true;
//Panel2.Enabled:=false;
//Panel3.Enabled:=false;
//Panel4.Enabled:=false;
TrayIconInitialize.Visible:=false;
frm_principal.Show;
frm_bloqueio.ShowModal;

end
else
if DM.tbl_operaction.FieldByName('statusprotect').AsInteger = 0 then
begin

//Panel5.Visible:=false;
//Panel2.Enabled:=true;
//Panel3.Enabled:=true;
//Panel4.Enabled:=true;
TrayIconInitialize.Visible:=false;
frm_principal.Show;

end;
     }


     REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if (REG.ReadInteger('ProtS') = 1)
and (REG.Readstring('Pw') <> '')
and (REG.Readstring('ConPw') <> '')then
begin
TrayIconInitialize.Visible:=false;
//frm_principal.Show;
frm_bloqueio.ShowModal;
end
else
 begin
TrayIconInitialize.Visible:=false;
frm_principal.Show;
 end;

end;

procedure Tfrm_principal.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
if edt_hora.Text = '0' then
edt_hora.Text:='00'
else
if edt_hora.Text = '1' then
edt_hora.Text:='01'
else
if edt_hora.Text = '2' then
edt_hora.Text:='02'
else
if edt_hora.Text = '3' then
edt_hora.Text:='03'
else
if edt_hora.Text = '4' then
edt_hora.Text:='04'
else
if edt_hora.Text = '5' then
edt_hora.Text:='05'
else
if edt_hora.Text = '6' then
edt_hora.Text:='06'
else
if edt_hora.Text = '7' then
edt_hora.Text:='07'
else
if edt_hora.Text = '8' then
edt_hora.Text:='08'
else
if edt_hora.Text = '9' then
edt_hora.Text:='09';

edt_hora.SetFocus;
end;

procedure Tfrm_principal.UpDown2Click(Sender: TObject; Button: TUDBtnType);
begin
edt_minutos.SetFocus;
if edt_minutos.Text = '0' then
edt_minutos.Text:='00'
else
if edt_minutos.Text = '1' then
edt_minutos.Text:='01'
else
if edt_minutos.Text = '2' then
edt_minutos.Text:='02'
else
if edt_minutos.Text = '3' then
edt_minutos.Text:='03'
else
if edt_minutos.Text = '4' then
edt_minutos.Text:='04'
else
if edt_minutos.Text = '5' then
edt_minutos.Text:='05'
else
if edt_minutos.Text = '6' then
edt_minutos.Text:='06'
else
if edt_minutos.Text = '7' then
edt_minutos.Text:='07'
else
if edt_minutos.Text = '8' then
edt_minutos.Text:='08'
else
if edt_minutos.Text = '9' then
edt_minutos.Text:='09';
end;

procedure Tfrm_principal.UpDown5Click(Sender: TObject; Button: TUDBtnType);
begin
edt_horamsg.SetFocus;
if edt_horamsg.Text = '0' then
edt_horamsg.Text:='00'
else
if edt_horamsg.Text = '1' then
edt_horamsg.Text:='01'
else
if edt_horamsg.Text = '2' then
edt_horamsg.Text:='02'
else
if edt_horamsg.Text = '3' then
edt_horamsg.Text:='03'
else
if edt_horamsg.Text = '4' then
edt_horamsg.Text:='04'
else
if edt_horamsg.Text = '5' then
edt_horamsg.Text:='05'
else
if edt_horamsg.Text = '6' then
edt_horamsg.Text:='06'
else
if edt_horamsg.Text = '7' then
edt_horamsg.Text:='07'
else
if edt_horamsg.Text = '8' then
edt_horamsg.Text:='08'
else
if edt_horamsg.Text = '9' then
edt_horamsg.Text:='09';
end;

procedure Tfrm_principal.UpDown6Click(Sender: TObject; Button: TUDBtnType);
begin
edt_minutosmsg.SetFocus;
if edt_minutosmsg.Text = '0' then
edt_minutosmsg.Text:='00'
else
if edt_minutosmsg.Text = '1' then
edt_minutosmsg.Text:='01'
else
if edt_minutosmsg.Text = '2' then
edt_minutosmsg.Text:='02'
else
if edt_minutosmsg.Text = '3' then
edt_minutosmsg.Text:='03'
else
if edt_minutosmsg.Text = '4' then
edt_minutosmsg.Text:='04'
else
if edt_minutosmsg.Text = '5' then
edt_minutosmsg.Text:='05'
else
if edt_minutosmsg.Text = '6' then
edt_minutosmsg.Text:='06'
else
if edt_minutosmsg.Text = '7' then
edt_minutosmsg.Text:='07'
else
if edt_minutosmsg.Text = '8' then
edt_minutosmsg.Text:='08'
else
if edt_minutosmsg.Text = '9' then
edt_minutosmsg.Text:='09';

end;

procedure Tfrm_principal.ValidaroWindowsOffv20251Click(Sender: TObject);
var
l: string;
begin
with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',False);
l:= readString('ProductID');
end;
closekey;
end;

if l = 'JtHBy[pazxxn' then
begin
messagebox(handle,'Seu Produto já está Ativado! Obrigado!','Aviso', MB_ICONINFORMATION);
end
else
begin
frm_VALIDASOFTWARE:= Tfrm_VALIDASOFTWARE.Create(Application);
frm_VALIDASOFTWARE.sLabel1.Left:=120;
frm_VALIDASOFTWARE.sLabel1.Top:=67;
frm_VALIDASOFTWARE.sLabel1.caption:= 'Informa o serial para validar o software!';
frm_VALIDASOFTWARE.ShowModal;
end;
end;

end.
