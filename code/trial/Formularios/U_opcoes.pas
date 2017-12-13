unit U_opcoes;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  FMTBcd,
  DB,
  SqlExpr,
  Provider,
  DBClient,
  DBCtrls,
  Grids,
  DBGrids,
  registry,
  ExtCtrls,
  Mask,
  Buttons,
  inifiles,
  StrUtils,
  TypInfo, acPNG, sPanel, sBevel, sLabel, sCheckBox;

  const
  strDelimitador : String = '|';

type
  Tfrm_opcoes = class(TForm)
    Panel2: TPanel;
    sDragBar2: TsDragBar;
    Label8: TLabel;
    rdgIdioma: TComboBox;
    Label6: TLabel;
    CheckBox5: TCheckBox;
    sBevel5: TsBevel;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    sDragBar1: TsDragBar;
    sBevel4: TsBevel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    btn_confirmarNova: TSpeedButton;
    btn_cancelarNova: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Image1: TImage;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    CheckBox2: TsCheckBox;
    CheckBox3: TsCheckBox;
    CheckBox4: TsCheckBox;
    CheckBox1: TsCheckBox;
    CheckBox6: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_confirmarNovaClick(Sender: TObject);
    procedure btn_cancelarNovaClick(Sender: TObject);
    procedure rdgIdiomaClick(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    class procedure GetConfiguracaoIdioma;
    class function GetIdioma : Integer;
    class procedure SetIdioma(intIdioma: Integer; wclRecipiente: TWinControl);


    procedure STARTWIN;
    procedure TRAYICON;
    procedure GravaIndiceIdioma;



  end;

var
  frm_opcoes: Tfrm_opcoes;
  reg:tregistry;
    Loading : boolean;

implementation

uses U_principal, U_DM, FileCtrl;

{$R *.dfm}

class procedure Tfrm_opcoes.GetConfiguracaoIdioma;
begin
  //* Instanciando o formulário de configuração do idioma [FB]

  Try
    Application.CreateForm( Tfrm_opcoes, frm_opcoes );
    frm_opcoes.ShowModal;
  Finally
    FreeAndNil( frm_opcoes );
  End;
end;

class function Tfrm_opcoes.GetIdioma: Integer;
  Var
    //* É necessário adicionar a DCU: IniFiles [FB]
    iniArquivo : TIniFile;
begin
  //* Setando idioma de retorno padrão (No caso 0 corresponde a português) [FB]
  Result := 0;

  //* Instanciando um objeto de controle de arquivos INI [FB]
  iniArquivo := TIniFile.Create( ExtractFilePath( Application.ExeName ) + 'idioma.ini' );

  Try

    //* Recuperando o idioma setado [FB]
    Result := StrToInt( iniArquivo.ReadString( 'GERAL', 'IDIOMA', '0' ) );

  Finally
    //* Destruindo o objeto de controle do arquivo INI [FB]
    FreeAndNil( iniArquivo );

  End;

end;


procedure Tfrm_opcoes.GravaIndiceIdioma;
  Var
       iniArquivo : TIniFile;
begin

 //* Instanciando um objeto de controle de arquivos INI [FB]
  iniArquivo := TIniFile.Create( ExtractFilePath( Application.ExeName ) + 'idioma.ini' );

  Try
    //* Gravando o idioma selecionado no arquivo INI [FB]
    iniArquivo.WriteString( 'GERAL', 'IDIOMA', IntToStr( rdgIdioma.ItemIndex ) );

  Finally
    //* Destruindo o objeto de controle do arquivo INI [FB]
    FreeAndNil( iniArquivo );

  End;

 // ShowMessage('O sistema irá ser fechado, para poder realizar as alterações de idioma');
 // Application.Terminate;

end;

procedure Tfrm_opcoes.rdgIdiomaClick(Sender: TObject);
begin
//GravaIndiceIdioma;
Label8.Visible:=true;
Label8.font.Color:=clred;

 GravaIndiceIdioma;

if frm_opcoes.GetIdioma = 0 then
Label8.Caption:='O Idioma será alterado na próxima inicialização do Windows Off'
else
Label8.Caption:='The language will be changed the next time the Windows Off';


end;

class procedure Tfrm_opcoes.SetIdioma(intIdioma: Integer; wclRecipiente: TWinControl);
	Var
  	intObjeto : Integer;
  	intSelecionado : Integer;
    intPosFinal : Integer;
    intPropTexto : Integer;
    strTexto : String;
    stlPropTexto : TStringList;

  procedure SetPropObjeto( objInstancia : TObject; strPropriedade : String );
  Begin
      //* Verificando se existe uma propriedade de interface com usuário [FB]
      If ( GetPropInfo( objInstancia, stlPropTexto.Strings[ intPropTexto ] ) <> Nil ) Then
      Begin

        //* Recuperando o texto contido na propriedade [FB]
        strTexto := GetPropValue( objInstancia, stlPropTexto.Strings[ intPropTexto ] );

        //* Verificando se o texto foi recuperado [FB]
        If ( strTexto <> '' ) Then
        Begin
          //* Iniciando variáveis [FB]
          intPosFinal := 0;
          intSelecionado := 0;

          //* Recuperando texto correspondente ao idioma setado [FB]
          While ( intSelecionado <= intIdioma ) Do
          Begin
            //* Recuperando a próxima posição do delimitador [FB]
            intPosFinal := Pos( strDelimitador, strTexto );

            //* Verificando se o delimitador foi encontrado [FB]
            If ( intPosFinal = 0 ) Then intPosFinal := Length( strTexto )+1;

            //* Verificando se o idioma atual NÃO é o que está configurado [FB]
            If ( intSelecionado <> intIdioma ) Then
            Begin
              //* Desprezando o idioma processado, pois não é o idioma configurado [FB]
              strTexto := MidStr( strTexto, intPosFinal+1, Length( strTexto ) );
            End;

            //* Processando o próximo idioma [FB]
            Inc( intSelecionado );
          End;

          //* Recuperando o texto correspondente ao idioma configurado [FB]
          strTexto := Trim( LeftStr( strTexto, intPosFinal-1 ) );

          //* Verificando se algum texto foi selecinado [FB]
          If (Length( strTexto ) > 0) And (intPosFinal > 0) Then
          Begin
            //* Setando o texto correspondente ao idioma na propriedade de interface com o usuário [FB]
            SetPropValue( objInstancia, stlPropTexto.Strings[ intPropTexto ], strTexto );
          End;
        End;
      End;
  End;

begin
  //* Configurando as propriedade de interface com o usuário [FB]
  stlPropTexto := TStringList.Create;
  stlPropTexto.Add( 'Caption' );
  stlPropTexto.Add( 'DisplayLabel' );
  stlPropTexto.Add( 'Hint' );

  //* Idiomas suportados: [FB]
	//* 0 = Português [FB]
  //* 1 = Inglês [FB]
  //* 2 = Espanhol [FB]

  //* Processando todos os objetos contidos no recipiente [FB]
  For intObjeto := 0 To wclRecipiente.ComponentCount-1 Do
  Begin
    //* Processando as propriedade de interface com o usuário que foram configuradas [FB]
    For intPropTexto := 0 To stlPropTexto.Count-1 Do
    Begin
      //* Setando a propriedade do objeto se necessário [FB]
      SetPropObjeto( wclRecipiente.Components[ intObjeto ], stlPropTexto[ intPropTexto ] );
    End;
  End;

  //* Processando as propriedade de interface com o usuário que foram configuradas [FB]
  For intPropTexto := 0 To stlPropTexto.Count-1 Do
  Begin
    //* Setando a propriedade do objeto recipiente se necessário [FB]
    SetPropObjeto( wclRecipiente, stlPropTexto[ intPropTexto ] );
  End;

end;




procedure Tfrm_opcoes.STARTWIN;
var
REG:TRegistry;
begin

if CheckBox2.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_CURRENT_USER;
REG.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run\',true);
REG.WriteString('Windows Off',ParamStr(0));
REG.CloseKey;
REG.Free;
end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_CURRENT_USER;
REG.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run\',true);
reg.DeleteValue('Windows Off');
REG.Free;
end;
end;



procedure Tfrm_opcoes.TRAYICON;
var reg:tregistry;
begin
if CheckBox3.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('Tray',1);
REG.CloseKey;
REG.Free;
//CheckBox4.Checked:= false;
end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('Tray',0);
REG.CloseKey;
REG.Free;

//CheckBox4.Checked:= false;
end;

{
Configure as propriedades ValueChecked e
ValueUnChecked do DBCheckBox1 para 0 e 1

0 = checked true
1 = checked false
}
{
if DBCheckBox1.Checked = true then
begin
DM.tbl_operaction.Edit;
//DBCheckBox4.Enabled:=true; // APENAS PARA VERÃOA PREMIUM
DM.tbl_operaction.FieldByName('TRAYICON').AsInteger:=1;

end
else
begin
DM.tbl_operaction.Edit;
//DBCheckBox4.Enabled:=false;  // APENAS PARA VERÃOA PREMIUM
DM.tbl_operaction.FieldByName('TRAYICON').AsInteger:=0;
end; }
end;


procedure Tfrm_opcoes.btn_cancelarNovaClick(Sender: TObject);
begin
edit1.Clear;
edit2.Clear;
Panel1.Visible:=false;
CheckBox1.Checked:=false;

end;

procedure Tfrm_opcoes.btn_confirmarNovaClick(Sender: TObject);
begin
if Edit1.Text = Edit2.Text then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
reg.writestring('Pw',Edit1.Text);
REG.CloseKey;
REG.Free;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
reg.writestring('ConPw',Edit2.Text);
REG.CloseKey;
REG.Free;

 Panel1.Visible:=false;
 Image1.Visible:=true;
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

procedure Tfrm_opcoes.CheckBox1Click(Sender: TObject);
var reg:tregistry;
ns:string;
begin
if CheckBox1.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('ProtS',1);
REG.CloseKey;
REG.Free;


with Reg do
begin
Reg:=Tregistry.create;
with Reg do
begin
rootkey:=HKEY_LOCAL_MACHINE;
Openkey('Software\WOFF',True);
ns:=readstring('Pw');
closekey;
end;
end;
if  (ns = '') then
begin
panel1.Visible:=true;
Image1.Visible:=false;
Edit1.SetFocus;
end
else
begin
  Label6.Visible:=true;
  if frm_opcoes.GetIdioma = 0 then
  Label6.Caption:='Você ja possui uma senha cadastrada, por favor, use-a!'
  else
    if frm_opcoes.GetIdioma = 1 then
    Label6.Caption:='You have already registered a password, please use it!';
end;
end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('ProtS',0);
REG.CloseKey;
REG.Free;
panel1.Visible:=false;
Image1.Visible:=true;
Label6.Visible:=false;
Panel2.SetFocus;
end;

end;

procedure Tfrm_opcoes.CheckBox2Click(Sender: TObject);
begin
STARTWIN;
end;

procedure Tfrm_opcoes.CheckBox3Click(Sender: TObject);
begin
TRAYICON;
end;

procedure Tfrm_opcoes.CheckBox4Click(Sender: TObject);
begin

// APENAS PARA VERSÃO PREMIUM

if CheckBox4.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('Inv',1);
REG.CloseKey;
REG.Free;

//CheckBox3.Checked:=false;

if frm_opcoes.GetIdioma = 0 then

messagebox(handle,'IMPORTANTE! O Modo invisivel do Windows Off v 1.0.25  esta habilitado,'+#13+
'Quando o Windows Off v 1.0.25 for fechado irá ficar invisivelmente em execução. Para sair do modo invisivel,'+#13+
'precione as teclas "Ctrl+Alt+Shift+W".'+#13+#13+
'Se você não quer que o Windows Off v 1.0.25 fique em modo invisivel, desabilite a opção:'+#13+
'"Ativar Modo Invisivel ao Fechar Windows Off" no Menu Opções.','AVISO IMPORTANTE!', MB_ICONINFORMATION)
else
if frm_opcoes.GetIdioma = 1 then
messagebox(handle,'IMPORTANT! Invisible Mode Off Windows v 1.0.25 is enabled, '+ #13 +
'Off When Windows v 1.0.25 is closed will be running invisibly. To exit invisible, '+ #13 +
'precione " Ctrl + Alt + Shift + W ". '+ #13 + #13 +
'If you do not want Windows v 1.0.25 Off stay in invisible mode, disable the option:' + #13 +
'"Invisible Mode Turn to Close Windows Off " Menu Options.', 'IMPORTANT NOTICE!', MB_ICONINFORMATION);
end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('Inv',0);
REG.CloseKey;
REG.Free;
end;
end;

procedure Tfrm_opcoes.CheckBox5Click(Sender: TObject);
begin
frm_principal.sSkinManager1.Active := CheckBox5.Checked;
//ComboBox1.Enabled := frm_principal.sSkinManager1.Active;

if CheckBox5.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('T3m',1);
REG.CloseKey;
REG.Free;

CheckBox1.Refresh;
CheckBox2.Refresh;
CheckBox3.Refresh;
CheckBox4.Refresh;
CheckBox5.Refresh;
end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('T3m',0);
REG.CloseKey;
REG.Free;
sDragBar2.Color:= clBtnFace;
sDragBar1.Color:= clBtnFace;
sDragBar2.Refresh;
sDragBar1.Refresh;

// frm_principal
frm_principal.sDragBar1.Color:= clBtnFace;
frm_principal.sDragBar2.Color:= clBtnFace;
frm_principal.sDragBar3.Color:= clBtnFace;
frm_principal.sDragBar4.Color:= clBtnFace;
frm_principal.sDragBar5.Color:= clBtnFace;
frm_principal.sDragBar6.Color:= clBtnFace;
frm_principal.sDragBar7.Color:= clBtnFace;

frm_principal.sDragBar1.Refresh;
frm_principal.sDragBar2.Refresh;
frm_principal.sDragBar3.Refresh;
frm_principal.sDragBar4.Refresh;
frm_principal.sDragBar5.Refresh;
frm_principal.sDragBar6.Refresh;
frm_principal.sDragBar7.Refresh;
//frm_principal.btn_criarmsg.Font.Color:=clblack;


CheckBox1.Refresh;
CheckBox2.Refresh;
CheckBox3.Refresh;
CheckBox4.Refresh;
CheckBox5.Refresh;
end;

end;

procedure Tfrm_opcoes.CheckBox5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if frm_opcoes.GetIdioma = 0 then
CheckBox5.Hint:='Desabilitar o Tema você terá uma melhor eficiência do Windows Off, porem não terá sua beleza em vista.'
else
if frm_opcoes.GetIdioma = 1 then
CheckBox5.Hint:='Disable the theme you have a better efficiency of Windows Off, but it does not have its beauty in mind.';
end;

procedure Tfrm_opcoes.CheckBox6Click(Sender: TObject);
begin
if CheckBox6.Checked = true then
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('AlMsg',1);
REG.CloseKey;
REG.Free;

end
else
begin
REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF',true);
REG.WriteInteger('AlMsg',0);
REG.CloseKey;
REG.Free;
end;
end;

procedure Tfrm_opcoes.ComboBox1Change(Sender: TObject);
var
  sl : TStringList;
  s : string;
  i : integer;
begin
 if Loading then Exit;
  if ComboBox1.ItemIndex = 0 then begin
    if SelectDirectory('Select directory with skins :', '', s) then begin
      frm_principal.sSkinManager1.SkinDirectory := s;
      sl := TStringList.Create;
       frm_principal.sSkinManager1.GetSkinNames(sl);
      ComboBox1.Items.Clear;
      ComboBox1.Items.Add('Skins directory...');
      for i := 0 to sl.Count - 1 do begin
        ComboBox1.Items.Add(sl[i]);
        Application.ProcessMessages; // Update dlg hiding
      end;
      FreeAndNil(sl);
    end;
  end
  else begin
     frm_principal.sSkinManager1.SkinName := ComboBox1.Text;
  end;

end;

procedure Tfrm_opcoes.FormClose(Sender: TObject; var Action: TCloseAction);
var canclose:boolean;
begin
{   DM.tbl_operaction.Edit;
  DM.tbl_operaction.Post;
  DM.tbl_operaction.ApplyUpdates(0);
  DM.tbl_operaction.CANCEL;   }

//  GravaIndiceIdioma;

if panel1.Visible = true then
begin
{if Application.MessageBox('Você não informou a senha.'+#13+#13+#13, 'Aviso!',MB_ICONWARNING+MB_YESNO+MB_DEFBUTTON2)=ID_YES then
begin

end
else
begin
  canclose:=false;
end;}

// impedir que feche a janela se o panel1 tiver tru
end;





end;

procedure Tfrm_opcoes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
// habilitar o keypreview para true
WITH frm_opcoes do
begin
  if KEY = VK_F4 then
      BEGIN
      if frm_opcoes.GetIdioma = 0 then
          MessageBox(handle,'Feche pelo botão "Fechar"','Atenção',mb_IconError + mb_OK)
          else
          if frm_opcoes.GetIdioma = 1 then
           MessageBox(handle,'Closes the "Close" button ',' Attention',mb_IconError + mb_OK);
          key:=0;
      END;

end;
end;

procedure Tfrm_opcoes.FormShow(Sender: TObject);
var
  sl : TStringList;
  i : integer;
begin

inherited;

//MudaFoco;

// temas
 sl := TStringList.Create;
  frm_principal.sSkinManager1.GetSkinNames(sl);
  ComboBox1.Clear;
  if frm_opcoes.getIdioma = 1 then

  ComboBox1.Items.Add('Skins directory...')
  else
   if frm_opcoes.getIdioma = 0 then
   ComboBox1.Items.Add('Diretório Skins...');
  for i := 0 to sl.Count - 1 do
  begin

    ComboBox1.Items.Add(sl[i]);
  end;
  // If no available skins...
  if ComboBox1.Items.Count < 1 then begin
   if frm_opcoes.getIdioma = 1 then
    ComboBox1.Items.Add('No skins available')
    else
    if frm_opcoes.getIdioma = 0 then
    ComboBox1.Items.Add('Skins não diponivel');
    ComboBox1.ItemIndex := 0;
  end
  else begin
    // Sets ComboBox to current skin name value without skin changing
    Loading := True;
    ComboBox1.ItemIndex := sl.IndexOf(frm_principal.sSkinManager1.SkinName) + 1;
    Loading := False;
  end;
  FreeAndNil(sl);

{tbl_operaction.Close;
sql_operaction.SQL.Clear;
sql_operaction.SQL.Add('select * from operaction');
tbl_operaction.open;}
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
rdgIdioma.ItemIndex := frm_opcoes.GetIdioma;
//DM.tbl_operaction.Edit;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('ProtS') = 1 then
begin
  CheckBox1.Checked:=true;
  Image1.Visible:=true;
end
else
 begin
   CheckBox1.Checked:=false;
 end;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('AlMsg') = 1 then
begin
  CheckBox6.Checked:=true;
end
else
 begin
   CheckBox6.Checked:=false;
 end;


 REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('T3m') = 1 then
begin
  CheckBox5.Checked:=true;
end
else
 begin
   CheckBox5.Checked:=false;
 end;



REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('Tray') = 1 then
begin
  CheckBox3.Checked:=true;
end
else
 begin
   CheckBox3.Checked:=false;
 end;

REG := TRegistry.Create;
REG.RootKey := HKEY_LOCAL_MACHINE;
REG.OpenKey('Software\WOFF\',true);

if REG.ReadInteger('Inv') = 1 then
begin
  CheckBox4.Checked:=true;
end
else
 begin
   CheckBox4.Checked:=false;
 end;


REG := TRegistry.Create;
REG.RootKey := HKEY_CURRENT_USER;
REG.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run\',true);
if REG.ValueExists('Windows Off')then
begin
  CheckBox2.Checked:=true;
end
else
 begin
   CheckBox2.Checked:=false;
 end;



end;

end.
