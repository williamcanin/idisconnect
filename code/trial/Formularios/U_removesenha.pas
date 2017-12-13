unit U_removesenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, FMTBcd, DB, SqlExpr,registry, ImgList,
  acAlphaImageList, sSpeedButton;

type
  Tfrm_removesenha = class(TForm)
    Panel5: TPanel;
    Bevel4: TBevel;
    Bevel1: TBevel;
    Bevel3: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    sAlphaImageList1: TsAlphaImageList;
    btn_confirmarPass: TsSpeedButton;
    btn_cancelarPass: TsSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btn_confirmarPassClick(Sender: TObject);
    procedure btn_cancelarPassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_removesenha: Tfrm_removesenha;
  pw,conpw:string;
  prots:integer;
  reg:tregistry;

implementation

uses U_DM, U_opcoes, U_principal;

{$R *.dfm}

procedure Tfrm_removesenha.btn_cancelarPassClick(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
close;
end;

procedure Tfrm_removesenha.btn_confirmarPassClick(Sender: TObject);
begin
{if ((Edit1.Text) =  (DM.tbl_operaction.FieldByName('password').Asstring)) and
((Edit2.Text) =  (DM.tbl_operaction.FieldByName('conf_password').Asstring))
then
begin
DM.tbl_operaction.Edit;
DM.tbl_operactionSTATUSPROTECT.Clear;
DM.tbl_operactionPASSWORD.Clear;
DM.tbl_operactionCONF_PASSWORD.Clear;
DM.tbl_operaction.Post;
DM.tbl_operaction.ApplyUpdates(0);
close;
Edit1.Clear;
Edit2.Clear;
end
else
begin
if frm_opcoes.GetIdioma = 0 then

  messagebox(handle,'A senha esta incorreta ou não coincidem!','Atenção', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The password is incorrect or does not match.!','Attention!', MB_ICONINFORMATION);
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
if  (pw = edit1.Text) and (conpw = edit2.Text) then
begin

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.Writestring('pw','');
REG.CloseKey;
REG.Free;


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.Writestring('conpw','');
REG.CloseKey;
REG.Free;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.Writeinteger('prots',0);
REG.CloseKey;
REG.Free;
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Senha removida com sucesso!','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'Password removed successfully ',' Warning', MB_ICONINFORMATION);
edit1.Clear;
edit2.Clear;
btn_confirmarPass.Enabled:=false;
Sleep(1500);
close;



end
else
begin
  if frm_opcoes.GetIdioma = 0 then

  messagebox(handle,'A senha esta incorreta ou não coincidem!','Atenção', MB_ICONERROR)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'The password is incorrect or does not match.!','Attention!', MB_ICONERROR);
end;
end;

procedure Tfrm_removesenha.FormShow(Sender: TObject);
begin
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
Edit1.SetFocus;

end;

end.
