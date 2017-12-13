program Project1;

uses
  Forms,
  U_principal in '..\Forms\U_principal.pas' {frm_principal},
  GifImage in '..\Forms\GifImage.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(Tfrm_principal, frm_principal);
  Application.Run;
end.
