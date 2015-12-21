object DMS: TDMS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 393
  Width = 220
  object QUERY: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM LOJAS')
    Left = 96
    Top = 16
  end
  object DT: TDataSource
    DataSet = QueryGrid
    Left = 160
    Top = 48
  end
  object QueryGrid: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM LOJAS')
    Left = 96
    Top = 80
    object QueryGridLOJAINF: TWideStringField
      FieldName = 'LOJAINF'
      FixedChar = True
      Size = 5
    end
    object QueryGridLOJAPROC: TWideStringField
      FieldName = 'LOJAPROC'
      FixedChar = True
      Size = 5
    end
    object QueryGridUNIDADE: TWideStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 50
    end
    object QueryGridRAZAOSOCIAL: TWideStringField
      FieldName = 'RAZAOSOCIAL'
      FixedChar = True
      Size = 68
    end
    object QueryGridCNPJ: TWideStringField
      FieldName = 'CNPJ'
      FixedChar = True
      Size = 25
    end
    object QueryGridENDERECO: TWideStringField
      FieldName = 'ENDERECO'
      FixedChar = True
      Size = 150
    end
    object QueryGridBAIRRO: TWideStringField
      FieldName = 'BAIRRO'
      FixedChar = True
    end
    object QueryGridCIDADE: TWideStringField
      FieldName = 'CIDADE'
      FixedChar = True
      Size = 35
    end
    object QueryGridEMAIL: TWideStringField
      FieldName = 'EMAIL'
      FixedChar = True
      Size = 60
    end
    object QueryGridSUPERVISOR: TWideStringField
      FieldName = 'SUPERVISOR'
      FixedChar = True
      Size = 10
    end
    object QueryGridGERENTE: TWideStringField
      FieldName = 'GERENTE'
      FixedChar = True
    end
    object QueryGridTELLOJA: TWideStringField
      FieldName = 'TELLOJA'
      FixedChar = True
      Size = 25
    end
    object QueryGridTELGERENTE: TWideStringField
      FieldName = 'TELGERENTE'
      FixedChar = True
      Size = 25
    end
    object QueryGridTEAMSERVIDOR: TWideStringField
      FieldName = 'TEAMSERVIDOR'
      FixedChar = True
      Size = 68
    end
    object QueryGridTEAMCPD: TWideStringField
      FieldName = 'TEAMCPD'
      FixedChar = True
      Size = 68
    end
    object QueryGridTEAMCAIXA: TWideStringField
      FieldName = 'TEAMCAIXA'
      FixedChar = True
      Size = 68
    end
    object QueryGridTEAMSOM: TWideStringField
      FieldName = 'TEAMSOM'
      FixedChar = True
      Size = 68
    end
    object QueryGridTEAMCAIXA2: TWideStringField
      FieldName = 'TEAMCAIXA2'
      FixedChar = True
      Size = 68
    end
  end
  object Conexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI10.1;Persist Security Info=False;User ID=SA;Init' +
      'ial Catalog=FT;Data Source=14.0.0.112\TICE;Use Procedure for Pre' +
      'pare=1;Auto Translate=True;Packet Size=4096;Workstation ID=ZEUS;' +
      'Initial File Name="";Use Encryption for Data=False;Tag with colu' +
      'mn collation when possible=False;MARS Connection=False;DataTypeC' +
      'ompatibility=0;Trust Server Certificate=False;Server SPN=""'
    LoginPrompt = False
    Provider = 'SQLNCLI10.1'
    Left = 32
    Top = 56
  end
  object Controle: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM LOJAS')
    Left = 96
    Top = 144
  end
  object DT2: TDataSource
    DataSet = GridTarefas
    Left = 160
    Top = 224
  end
  object GridTarefas: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM TAREFAS')
    Left = 96
    Top = 224
    object GridTarefasDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      FixedChar = True
      Size = 100
    end
    object GridTarefasLOJA: TWideStringField
      FieldName = 'LOJA'
      FixedChar = True
      Size = 3
    end
    object GridTarefasSTATUS: TWideStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 10
    end
    object GridTarefasID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object GridLigacoes: TADOQuery
    Connection = Conexao
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *  FROM LIGACOES')
    Left = 96
    Top = 304
    object GridLigacoesIDLIGACAO: TAutoIncField
      FieldName = 'IDLIGACAO'
      ReadOnly = True
    end
    object GridLigacoesLOJAPROC: TIntegerField
      FieldName = 'LOJAPROC'
    end
    object GridLigacoesTELEFONECONTATO: TWideStringField
      FieldName = 'TELEFONECONTATO'
      FixedChar = True
      Size = 25
    end
    object GridLigacoesPROTOCOLO: TWideStringField
      FieldName = 'PROTOCOLO'
      FixedChar = True
      Size = 16
    end
    object GridLigacoesDATAGERADA: TWideStringField
      FieldName = 'DATAGERADA'
      FixedChar = True
      Size = 25
    end
    object GridLigacoesASSUNTO: TWideStringField
      FieldName = 'ASSUNTO'
      FixedChar = True
      Size = 100
    end
  end
  object DT3: TDataSource
    DataSet = GridLigacoes
    Left = 160
    Top = 312
  end
end
