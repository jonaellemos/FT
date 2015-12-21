object CadastrarUsuario: TCadastrarUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 63
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 8
    Top = 6
    Width = 50
    Height = 17
    Caption = 'USUARIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 183
    Top = 6
    Width = 39
    Height = 17
    Caption = 'SENHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI Light'
    Font.Style = []
    ParentFont = False
  end
  object login_usuario: TEdit
    Left = 10
    Top = 29
    Width = 172
    Height = 21
    CharCase = ecUpperCase
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'Digite seu Usuario'
  end
  object login_senha: TMaskEdit
    Left = 183
    Top = 29
    Width = 223
    Height = 21
    CharCase = ecUpperCase
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
    Text = ''
    TextHint = 'Digite sua Senha'
  end
  object Button1: TButton
    Left = 408
    Top = 28
    Width = 75
    Height = 23
    Caption = 'CADASTRAR'
    TabOrder = 2
    OnClick = Button1Click
  end
end
