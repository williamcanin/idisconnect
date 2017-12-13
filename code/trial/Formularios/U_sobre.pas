unit U_sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, sLabel, GIFImg, sPanel, sSpeedButton,registry;

type
  Tfrm_sobre = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    Timer1: TTimer;
    sLabel2: TsLabel;
    sSpeedButton1: TsSpeedButton;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sSpeedButton2: TsSpeedButton;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sobre: Tfrm_sobre;
  reg:tregistry;

implementation

uses U_opcoes, U_validasoftware;

{$R *.dfm}

procedure Tfrm_sobre.FormResize(Sender: TObject);
begin
//frm_sobre.Height:=602;
//frm_sobre.Width:=575;
end;

procedure Tfrm_sobre.FormShow(Sender: TObject);
begin
Tfrm_opcoes.SetIdioma( Tfrm_opcoes.GetIdioma, Self );

if frm_opcoes.GetIdioma = 0 then
begin
sLabel2.Visible:=false;
sLabel1.Visible:=true;
end
else
if frm_opcoes.GetIdioma = 1 then
begin
sLabel1.Visible:=false;
sLabel2.Visible:=true;
end;

Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\WOFF', True);
  If Reg.ReadString('ProductID') <> 'JtHBy[pazxxn' then
  begin
    sLabel4.Visible:=true;
    sSpeedButton2.Visible:=true;
    sLabel3.Visible:=false;
  end
  else
    begin
    sLabel4.Visible:=false;
    sSpeedButton2.Visible:=false;
    sLabel3.Visible:=true;
  end

//Timer1.Enabled:=true;


end;

procedure Tfrm_sobre.sSpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_sobre.sSpeedButton2Click(Sender: TObject);
begin

frm_VALIDASOFTWARE:= Tfrm_VALIDASOFTWARE.Create(Application);
frm_VALIDASOFTWARE.sLabel1.Left:=120;
frm_VALIDASOFTWARE.sLabel1.Top:=67;
frm_VALIDASOFTWARE.sLabel1.caption:= 'Informa o serial para validar o software!';
frm_VALIDASOFTWARE.ShowModal;
close;
end;

end.
