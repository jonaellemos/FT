object CTarefa: TCTarefa
  Left = 0
  Top = 0
  Caption = 'Criador de Tarefas em LOTE'
  ClientHeight = 41
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI Light'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 17
  object Label1: TLabel
    Left = 10
    Top = 11
    Width = 132
    Height = 17
    Caption = 'DESCRI'#199#195'O DA TAREFA'
  end
  object descricao: TEdit
    Left = 148
    Top = 8
    Width = 245
    Height = 25
    TabOrder = 0
  end
  object Button1: TButton
    Left = 393
    Top = 8
    Width = 120
    Height = 25
    Caption = 'PROCESSAR'
    TabOrder = 1
    OnClick = Button1Click
  end
end
