unit U_validasoftware;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls,registry, sPanel, sLabel, sBevel,
  sSkinManager;

type
  Tfrm_VALIDASOFTWARE = class(TForm)
    Panel1: TPanel;
    edt_serial: TMaskEdit;
    sLabel3: TsLabel;
    sBevel1: TsBevel;
    sPanel1: TsPanel;
    btn_validasoftware: TSpeedButton;
    SpeedButton1: TSpeedButton;
    sLabel1: TsLabel;
    sSkinManager1: TsSkinManager;
    sPanel2: TsPanel;
    procedure btn_validasoftwareClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_VALIDASOFTWARE: Tfrm_VALIDASOFTWARE;
  reg:tregistry;

implementation

uses U_principal, U_opcoes;

{$R *.dfm}

procedure Tfrm_VALIDASOFTWARE.btn_validasoftwareClick(Sender: TObject);
begin
if edt_serial.Text = 'FGTR1-UYYBN-581L0-WILCT-YHVJ8' then
      begin
        ModalResult:=mrOk;
        MessageBox(handle,'Parabéns! O Windows Off v2.0.25 foi ativado com sucesso!','Ativação Sucedida!',+MB_ICONINFORMATION);


reg := TRegistry.Create;
reg.RootKey := HKEY_LOCAL_MACHINE;
reg.OpenKey('Software\WOFF',True);
reg.WriteString('ProductID', 'JtHBy[pazxxn');
reg.CloseKey();
reg.Free;

frm_principal.Caption:='Windows Off v2.0.25 Premium';

        end
  else
      begin
       reg := TRegistry.Create;
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('Software\WOFF',True);
    reg.WriteString('ProductID', 'Wui/@OillmnkF8772');
    reg.CloseKey();
    reg.Free;
        MessageBox(handle,'Serial Invalido!','Atenção!',+MB_ICONINFORMATION);
        edt_serial.Clear;
      end;


end;

procedure Tfrm_VALIDASOFTWARE.FormShow(Sender: TObject);
begin
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );
end;

procedure Tfrm_VALIDASOFTWARE.SpeedButton1Click(Sender: TObject);
begin
close;
end;

end.
