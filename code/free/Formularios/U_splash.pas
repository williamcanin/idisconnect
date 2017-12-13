unit U_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, ComCtrls, acProgressBar, sGauge, jpeg,
  sLabel, Buttons, sSpeedButton, MPlayer,MMSystem;

type
  Tfrm_splash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ProgressBar1: TsGauge;
    Label1: TsLabel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sLabel2: TsLabel;
    sLabel8: TsLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_splash: Tfrm_splash;

implementation

uses U_principal, U_opcoes;

{$R *.dfm}

procedure Tfrm_splash.FormActivate(Sender: TObject);
begin

ProgressBar1.Progress:= 0;
while  ProgressBar1.Progress < 100 do
  begin
    ProgressBar1.Progress:= ProgressBar1.Progress + 3;


    case ProgressBar1.Progress of

    3 : begin label1.Visible:=true;  end;//Label1.Caption:= '                    Inicializando| Starting       ';
    18 :  begin label1.Visible:=false; slabel3.Visible:=true; end; //Label1.Caption:='                    Inserindo Registros| Inserting Registry...             ';
    33 :  begin label1.Visible:=false; slabel3.Visible:=false; slabel4.Visible:=true; end;  //Label1.Caption:='                    Definindo Layout| Layout...             ';
    48 : begin label1.Visible:=false; slabel3.Visible:=false; slabel4.Visible:=false; slabel5.Visible:=true; end; //Label1.Caption:= '                   Instalando Idiomas|Installing Languages...';
  //  30 : Image2.Visible:= true;
    63 :  begin label1.Visible:=false; slabel3.Visible:=false; slabel4.Visible:=false; slabel5.Visible:=false; slabel6.Visible:=true;end;  //Label1.Caption:= '                   Finalizando Estrutura|Finalizing Structure...! ';
    100 : begin
    label1.Visible:=false; slabel3.Visible:=false; slabel4.Visible:=false; slabel5.Visible:=false; slabel6.Visible:=false; slabel7.Visible:=true;
    //   sleep(980);
    end;//Label1.Caption:= '                  Finalizamento Completado!| Finnaly Complete! ';
 end;
    frm_splash.Update;
    Sleep(230);
end;


end;

procedure Tfrm_splash.FormShow(Sender: TObject);
var dir:string;
begin
dir:=ExtractFilePath(Application.ExeName);
{//MediaPlayer1.FileName:=  dir + '\sound\sound2.wav';
MediaPlayer1.FileName:='C:\Users\william\Desktop\IAMSoft\iDisconnect\Version Free\iDisconnect\Bin\sound\sound2.wav';
MediaPlayer1.AutoOpen:=true;
 MediaPlayer1.Play; }

//  MediaPlayer1.Play;






frm_opcoes:= Tfrm_opcoes.Create(Application);
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );

if frm_opcoes.GetIdioma = 0 then
sLabel1.Caption:='Todos os Direitos Reservados. IAMSoft (c) Systems Softwares. Brasil'
else
if frm_opcoes.GetIdioma = 1 then
sLabel1.Caption:='All Rights Reserved. IAMSoft (c) Systems Softwares. Brazil';

if frm_opcoes.GetIdioma = 0 then
begin
  sndPlaySound(pwidechar(dir+'.\sound\sound0.wav'),
  SND_NODEFAULT OR SND_ASYNC);
end
else
if frm_opcoes.GetIdioma = 1 then
begin
sndPlaySound(pwidechar(dir+'.\sound\sound0.wav'),
  SND_NODEFAULT OR SND_ASYNC);
end;
end;

procedure Tfrm_splash.Image1Click(Sender: TObject);
begin
//MessageBox(handle,'Aguarde o temino ...','Aviso',MB_ICONINFORMATION);
end;

procedure Tfrm_splash.Timer1Timer(Sender: TObject);
begin
//FreeAndNil(frm_splash);
frm_principal.show;




end;

end.
