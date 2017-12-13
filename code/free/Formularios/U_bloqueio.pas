unit U_bloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,registry, sSpeedButton, ImgList,
  acAlphaImageList, sSkinManager;

type
  Tfrm_bloqueio = class(TForm)
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    btn_confirmarPass_: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    btn_minimizar_: TSpeedButton;
    sAlphaImageList1: TsAlphaImageList;
    btn_confirmarPass: TsSpeedButton;
    btn_minimizar: TsSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_confirmarPass_Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_minimizar_Click(Sender: TObject);
    procedure btn_confirmarPassClick(Sender: TObject);
    procedure btn_minimizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_bloqueio: Tfrm_bloqueio;

implementation

uses U_principal, U_DM, U_opcoes;

{$R *.dfm}

procedure Tfrm_bloqueio.btn_confirmarPassClick(Sender: TObject);
var np,nc:string;
begin
frm_principal.Cliquis;{if ((Edit1.Text) =  (DM.tbl_operaction.FieldByName('password').Asstring)) and
((Edit2.Text) =  (DM.tbl_operaction.FieldByName('conf_password').Asstring))
then
begin
close;
Edit1.Clear;
Edit2.Clear;

end
else
begin

if frm_opcoes = nil then
frm_opcoes:= Tfrm_opcoes.Create(Application);


if frm_opcoes.GetIdioma = 0 then

  messagebox(handle,'A senha esta incorreta ou não coincidem!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The password is incorrect or does not match.!','Attention!', MB_ICONINFORMATION);
end; }

if Edit1.Text = Edit2.Text then
begin
with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
np:=readstring('Pw');
nc:=readstring('ConPw');
closekey;
end;
end;
if  (np = Edit1.Text) and (nc = Edit2.Text) then
begin
close;
Edit1.Clear;
Edit2.Clear;
frm_principal.Show;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'Senha incorreta','Atenção',mb_IconError + mb_OK)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'Incorrect password ',' Attention',mb_IconError + mb_OK)
end;
REG.CloseKey;
REG.Free;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'As senhas não coincidem','Atenção',mb_IconError + mb_OK)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'Passwords do not match ',' Attention',mb_IconError + mb_OK)
end;
end;

procedure Tfrm_bloqueio.btn_confirmarPass_Click(Sender: TObject);
var np,nc:string;
begin
{if ((Edit1.Text) =  (DM.tbl_operaction.FieldByName('password').Asstring)) and
((Edit2.Text) =  (DM.tbl_operaction.FieldByName('conf_password').Asstring))
then
begin
close;
Edit1.Clear;
Edit2.Clear;

end
else
begin

if frm_opcoes = nil then
frm_opcoes:= Tfrm_opcoes.Create(Application);


if frm_opcoes.GetIdioma = 0 then

  messagebox(handle,'A senha esta incorreta ou não coincidem!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The password is incorrect or does not match.!','Attention!', MB_ICONINFORMATION);
end; }

if Edit1.Text = Edit2.Text then
begin
with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
np:=readstring('Pw');
nc:=readstring('ConPw');
closekey;
end;
end;
if  (np = Edit1.Text) and (nc = Edit2.Text) then
begin
close;
Edit1.Clear;
Edit2.Clear;
frm_principal.Show;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'Senha incorreta','Atenção',mb_IconError + mb_OK)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'Incorrect password ',' Attention',mb_IconError + mb_OK)
end;
REG.CloseKey;
REG.Free;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
MessageBox(handle,'As senhas não coincidem','Atenção',mb_IconError + mb_OK)
else
if frm_opcoes.GetIdioma = 1 then
MessageBox(handle,'Passwords do not match ',' Attention',mb_IconError + mb_OK)
end;



end;

procedure Tfrm_bloqueio.btn_minimizarClick(Sender: TObject);
begin
frm_principal.Cliquis;
close;
frm_principal.MinimizarnoRelgio1.Click;
//frm_principal.TrayIconInitialize.Visible:=FALSE;
//frm_principal.Close;
//frm_principal.Hide;
end;

procedure Tfrm_bloqueio.btn_minimizar_Click(Sender: TObject);
begin

close;
frm_principal.MinimizarnoRelgio1.Click;
//frm_principal.TrayIconInitialize.Visible:=FALSE;
//frm_principal.Close;
//frm_principal.Hide;
end;

procedure Tfrm_bloqueio.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// habilitar o keypreview para true
WITH frm_bloqueio do
begin
  if KEY = VK_F4 then
      BEGIN
      if frm_opcoes.GetIdioma = 0 then
          MessageBox(handle,'Operação invalida','Atenção',mb_IconError + mb_OK)
          else
          if frm_opcoes.GetIdioma = 1 then
          MessageBox(handle,'Operation invalid ',' Attention',mb_IconError + mb_OK);
          key:=0;
      END;

end;
end;

procedure Tfrm_bloqueio.FormShow(Sender: TObject);
begin
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
Edit1.SetFocus;

{   REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('T3m') = 1 then
begin
 sSkinManager1.Active:=true;
end
else
 begin
  sSkinManager1.Active:=false;
 end; }

end;

end.
