object dmGerenciador: TdmGerenciador
  OldCreateOrder = False
  Height = 481
  Width = 913
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=E:\Projetos\Restaurante\Banco\BANCO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 32
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnection1
    Left = 160
    Top = 32
  end
  object qryUSU: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from usuario')
    Left = 40
    Top = 128
  end
  object dspUSU: TDataSetProvider
    DataSet = qryUSU
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 136
  end
  object cdsUSU: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspUSU'
    Left = 168
    Top = 136
    object cdsUSUID_USU: TIntegerField
      FieldName = 'ID_USU'
      Required = True
    end
    object cdsUSUNOME_USU: TStringField
      FieldName = 'NOME_USU'
      Size = 10
    end
    object cdsUSUSENHA_USU: TStringField
      FieldName = 'SENHA_USU'
      Size = 10
    end
  end
  object dsUSU: TDataSource
    DataSet = cdsUSU
    Left = 232
    Top = 136
  end
  object qryCONSULTA: TFDQuery
    Connection = FDConnection1
    Transaction = FDTransaction1
    SQL.Strings = (
      'select * from usuario')
    Left = 384
    Top = 40
  end
  object dspCONSULTA: TDataSetProvider
    DataSet = qryCONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 448
    Top = 48
  end
  object cdsCONSULTA: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspCONSULTA'
    Left = 512
    Top = 48
  end
  object dsCONSULTA: TDataSource
    DataSet = cdsCONSULTA
    Left = 576
    Top = 48
  end
end
