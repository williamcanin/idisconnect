unit U_sobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, sLabel, GIFImg, sPanel, sSpeedButton,
  acPNG;

type
  Tfrm_sobre = class(TForm)
    sPanel1: TsPanel;
    sLabel1: TsLabel;
    Timer1: TTimer;
    sLabel2: TsLabel;
    sSpeedButton1: TsSpeedButton;
    Image1: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_sobre: Tfrm_sobre;

implementation

uses U_opcoes, U_principal;

{$R *.dfm}

procedure Tfrm_sobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frm_principal.Cliquis;
end;

procedure Tfrm_sobre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key =  VK_ESCAPE then
BEGIN
  close;
END;
end;

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
sLabel1.Font.Color:=clblack;
end
else
if frm_opcoes.GetIdioma = 1 then
begin
sLabel1.Visible:=false;
sLabel2.Visible:=true;
sLabel2.Font.Color:=clblack;
end;

//Timer1.Enabled:=true;

frm_sobre.SetFocus;


end;

procedure Tfrm_sobre.sSpeedButton1Click(Sender: TObject);
begin
frm_principal.Cliquis;close;
end;

end.
