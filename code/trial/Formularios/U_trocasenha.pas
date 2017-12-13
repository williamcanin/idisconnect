unit U_trocasenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, pngimage,registry,
  ImgList, acAlphaImageList, sSpeedButton;

type
  Tfrm_trocasenha = class(TForm)
    Panel5: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Edit3: TEdit;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    Edit2: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label2: TLabel;
    btn_confirmarPass: TsSpeedButton;
    btn_cancelarPass: TsSpeedButton;
    sAlphaImageList1: TsAlphaImageList;
    procedure Edit3Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure btn_confirmarPassClick(Sender: TObject);
    procedure btn_cancelarPassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_trocasenha: Tfrm_trocasenha;
  reg:tregistry;
  pw,conpw:string;
  prots:integer;


implementation

uses U_principal, U_DM, U_opcoes;

{$R *.dfm}

procedure Tfrm_trocasenha.btn_cancelarPassClick(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
btn_confirmarPass.Enabled:=false;
 Image1.Visible:=false;
    Image2.Visible:=false;
    Label2.Visible:=false;
    close;
end;

procedure Tfrm_trocasenha.btn_confirmarPassClick(Sender: TObject);
begin
{if edit1.Text = Edit2.Text then
begin

if edit3.Text = DM.tbl_operaction.FieldByName('password').Asstring then
begin
DM.tbl_operaction.Edit;
   Image1.Visible:=false;
    Image2.Visible:=true;
    Label2.Visible:=true;
    if rdgIdioma.ItemIndex = 0 then
    Label2.Caption:='A senha correta!'
    else
    if rdgIdioma.ItemIndex = 1 then
      Label2.Caption:='The correct password!';

DM.tbl_operactionPASSWORD.Value:=edit1.Text;
DM.tbl_operactionCONF_PASSWORD.Value:=edit2.Text;
DM.tbl_operaction.Post;
DM.tbl_operaction.ApplyUpdates(0);

if rdgIdioma.ItemIndex = 0 then
messagebox(handle,'Senha Alterada!','Aviso', MB_ICONINFORMATION)
else
if rdgIdioma.ItemIndex = 1 then
messagebox(handle,'Password Changed!','Warning', MB_ICONINFORMATION);
}
//btn_confirmarPass.Enabled:=false;
{DM.tbl_operaction.Close;
DM.sql_operaction.SQL.Clear;
DM.sql_operaction.SQL.Add('select * from operaction');
DM.tbl_operaction.open;}
{sleep(1000);
close;
end
else
begin
    Image1.Visible:=true;
    Image2.Visible:=false;
    Label2.Visible:=true;
    if rdgIdioma.ItemIndex = 0 then
    Label2.Caption:='A senha incorreta!'
    else
    if rdgIdioma.ItemIndex = 1 then
    Label2.Caption:='The incorrect password!';
end;
end
else
begin
if rdgIdioma.ItemIndex = 0 then
messagebox(handle,'A Nova senha é diferente da confirmação da Nova Senha!','Aviso', MB_ICONINFORMATION)
else
if rdgIdioma.ItemIndex = 1 then
messagebox(handle,'The new password is different from the confirmation of the new password! ',' Warning', MB_ICONINFORMATION)
end; }

if edit1.Text = Edit2.Text then
begin
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

if  (pw = edit3.Text)then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.Writestring('pw',Edit1.Text);
REG.CloseKey;
REG.Free;


REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.Writestring('conpw',Edit2.Text);
REG.CloseKey;
REG.Free;

if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Senha alterada com sucesso!','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'Password changed successfully ',' Warning', MB_ICONINFORMATION);
edit1.Clear;
edit2.Clear;
edit3.Clear;
btn_confirmarPass.Enabled:=false;
Sleep(1500);
close;
end
else
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Senha antiga errada!','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'Old Password wrong! ',' Warning', MB_ICONINFORMATION)

end;





end
else
if edit1.Text <> Edit2.Text then
begin
if frm_opcoes.GetIdioma = 0 then
messagebox(handle,'Senha é diferente da confirmação!','Aviso', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'Password confirmation is different! ',' Warning', MB_ICONINFORMATION)

end;

end;

procedure Tfrm_trocasenha.Edit2Change(Sender: TObject);
begin
    if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
        btn_confirmarPass.Enabled:=true;
    end
    else
    begin
      btn_confirmarPass.Enabled:=false;
    end;


     if (Edit1.Text = '') or (Edit2.Text = '') then
    begin
        btn_confirmarPass.Enabled:=false;
    end;

end;

procedure Tfrm_trocasenha.Edit3Exit(Sender: TObject);
begin
{if ((Edit3.Text) =  (DM.tbl_operaction.FieldByName('password').Asstring)) then
begin
    Image1.Visible:=false;
    Image2.Visible:=true;
    Label2.Visible:=true;
    Label2.font.Color:= clgreen;

     if rdgIdioma.ItemIndex = 0 then

    Label2.Caption:='A senha correta!'

    else
    if rdgIdioma.ItemIndex = 1 then

      Label2.Caption:='The correct password!';


    if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
        btn_confirmarPass.Enabled:=true;
    end;




end
else
begin
  Image1.Visible:=true;
    Image2.Visible:=false;
    Label2.Visible:=true;
    Label2.font.Color:= clred;

    if rdgIdioma.ItemIndex = 0 then
    Label2.Caption:='A senha incorreta!'
    else
    if rdgIdioma.ItemIndex = 1 then
    Label2.Caption:='The incorrect password!';
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
if  (pw = edit3.Text)then
begin
 Image1.Visible:=false;
    Image2.Visible:=true;
    Label2.Visible:=true;
    Label2.font.Color:= $0015FF8A;

     if (frm_opcoes.GetIdioma = 0) then

    Label2.Caption:='A senha correta!'

    else
if (frm_opcoes.GetIdioma = 1) then

      Label2.Caption:='The correct password!';


    if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
        btn_confirmarPass.Enabled:=true;
    end;
end
else
begin
 Image1.Visible:=true;
    Image2.Visible:=false;
    Label2.Visible:=true;
    Label2.font.Color:= clred;

    if (frm_opcoes.GetIdioma = 0) then
    Label2.Caption:='A senha incorreta!'
    else
   if (frm_opcoes.GetIdioma = 1) then
    Label2.Caption:='The incorrect password!';
end;


end;

procedure Tfrm_trocasenha.FormShow(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
btn_confirmarPass.Enabled:=false;
 Image1.Visible:=false;
    Image2.Visible:=false;
    Label2.Visible:=false;
    Edit3.SetFocus;

 Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
// rdgIdioma.ItemIndex := frm_opcoes.GetIdioma;
end;

end.
