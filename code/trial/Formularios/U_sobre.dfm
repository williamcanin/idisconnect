object frm_sobre: Tfrm_sobre
  Left = 0
  Top = 0
  AutoSize = True
  BorderIcons = []
  Caption = 
    'Sobre Windows Off v1.0.25 Premium|About Windows Off v1.0.25 Prem' +
    'ium'
  ClientHeight = 444
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object sPanel1: TsPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 444
    Align = alClient
    TabOrder = 0
    SkinData.SkinSection = 'PANEL'
    object sLabel1: TsLabel
      Left = 24
      Top = 24
      Width = 393
      Height = 286
      Caption = 
        'Windows Off Vers'#227'o 1.0.25 Premium'#13#10#13#10'Este software '#233' Free com Di' +
        'reitos Autorais.'#13#10'Membro/Contato: William da Costa Canin'#13#10'Empres' +
        'a: IAMSoft (c)'#13#10#13#10'      Com Windows Off Vers'#227'o 1.0.25 voc'#234' pode ' +
        'deixar seu computador/notebook '#13#10'ligado fazendo as opera'#231#245'es nec' +
        'essarias do dia-a-dia, sem se preocupar em que'#13#10'horas dever'#225' des' +
        'ligar ou reiniciar sua maquina. O Windows Off Vers'#227'o 1.0.25 faz'#13 +
        #10'isso para voc'#234'.'#13#10'       Alem de uma interface agradativa e  mod' +
        'erna, o Windows Off Vers'#227'o 1.0.25 '#13#10'possui v'#225'rios recursos, como' +
        ' altera'#231#227'o de Idiomas, Temas, Prote'#231#227'o com '#13#10'Senha, Modo Invisiv' +
        'el e dentre outras.'#13#10'       Caso voc'#234' tenha alguma dificuldade e' +
        'm operar o software,'#13#10' veja no Menu de Ajuda.'#13#10#13#10'---------------' +
        '----------------------------------------------------------------' +
        '--------'#13#10'Todos os Direitos Reservados'#13#10'Software Free'#13#10'E-mail de' +
        ' Contato: william.costa.canin@gmail.com'#13#10'Ultima Compila'#231#227'o: Segu' +
        'nda-Feira, 03 Junho de 2013'#13#10'IAMSoft(c)'
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5059883
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel2: TsLabel
      Left = 24
      Top = 24
      Width = 403
      Height = 351
      Caption = 
        'Windows Off Version 1.0.25 Premium'#13#10#13#10'This software is Free with' +
        ' Copyright.'#13#10'Member / Contact: William Costa Canin'#13#10'Company: IAM' +
        'Soft (c)'#13#10#13#10#13#10#160#160#160#160#160#160' With Windows Off Version 1.0.25 you can lea' +
        've your computer / notebook'#13#10'making the necessary operations on ' +
        'the day-to-day, without worrying that'#13#10'hours should shut down or' +
        ' restart your machine. The Windows version 1.0.25 is Off'#13#10'this f' +
        'or you.'#13#10#160#160#160#160#160#160#160' Besides an interface agradativa and modern Wind' +
        'ows Off Version 1.0.25'#13#10'has several features, such as changing L' +
        'anguages, Themes , Protection with'#13#10'Password .'#13#10#160#160#160#160#160#160#160' If you h' +
        'ave any difficulty in operating the software,'#13#10#160' see the help me' +
        'nu.'#13#10#13#10#13#10'-------------------------------------------------- ----' +
        '---------------------------------'#13#10#13#10'All rights reserved'#13#10'Free s' +
        'oftware'#13#10'E-mail Contact: william.costa.canin @ gmail.com'#13#10'Last C' +
        'ompilation: Monday, June 3, 2013'#13#10#13#10#13#10'IAMSoft (c)'
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5059883
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sSpeedButton1: TsSpeedButton
      Left = 346
      Top = 407
      Width = 81
      Height = 33
      Cursor = crHandPoint
      Caption = 'Sair'
      OnClick = sSpeedButton1Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
    object sLabel3: TsLabel
      Left = 7
      Top = 423
      Width = 188
      Height = 16
      Caption = 'Produto Ativado|Product Activate'
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5059883
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sLabel4: TsLabel
      Left = 6
      Top = 424
      Width = 196
      Height = 16
      Caption = 'Ative o Produto|Active the Product'
      ParentFont = False
      Visible = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5059883
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object sSpeedButton2: TsSpeedButton
      Left = 115
      Top = 420
      Width = 59
      Height = 20
      Cursor = crHandPoint
      Caption = 'Ativar|Active'
      Visible = False
      OnClick = sSpeedButton2Click
      SkinData.SkinSection = 'SPEEDBUTTON'
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 8000
    Left = 288
    Top = 392
  end
end
