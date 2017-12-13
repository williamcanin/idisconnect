unit U_splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, acPNG, ExtCtrls, StdCtrls, ComCtrls, acProgressBar, sGauge, jpeg,
  sLabel,registry, sPanel;

type
  Tfrm_splash = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    ProgressBar1: TsGauge;
    Label1: TsLabel;
    sDragBar1: TsDragBar;
    sLabel2: TsLabel;
    sLabel1: TsLabel;
    sDragBar2: TsDragBar;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_splash: Tfrm_splash;
  reg:tregistry;

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
    3 : Label1.Caption:= '                 Inicializando          ';
    6 : Label1.Caption:='                  Carregando Dados             ';
    9 : Label1.Caption:='                  Carregando Layout             ';
    12 : Label1.Caption:= '                Finalizando Estruturas...';
  //  30 : Image2.Visible:= true;
    40 : Label1.Caption:= '                Finalizamento Completado! ';
    90 : Label1.Caption:= '                Finalizamento Completado! ';
    end;
    frm_splash.Update;
    Sleep(200);
end;
end;

procedure Tfrm_splash.FormShow(Sender: TObject);
begin
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );

Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If Reg.ReadString('ProductID') <> 'JtHBy[pazxxn' then
  begin
  sLabel1.Visible:=true;
  sLabel2.Visible:=false;
 End
 else
 If Reg.ReadString('ProductID') = 'JtHBy[pazxxn' then
 begin
   sLabel1.Visible:=false;
  sLabel2.Visible:=true;
 end;

end;

procedure Tfrm_splash.Timer1Timer(Sender: TObject);
begin
frm_splash.Destroy;
frm_principal.show;
end;

end.
