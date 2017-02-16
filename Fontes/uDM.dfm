object DM: TDM
  OldCreateOrder = False
  Height = 495
  Width = 777
  object Banco: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\Larissa\Documents\GitHub\ksrestaurante\Banco\B' +
        'ANCO.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 40
    Top = 40
  end
  object Transacao: TFDTransaction
    Connection = Banco
    Left = 104
    Top = 40
  end
  object qryUSU: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 40
    Top = 160
  end
  object dspUSU: TDataSetProvider
    DataSet = qryUSU
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 160
  end
  object cdsUSU: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspUSU'
    Left = 160
    Top = 160
  end
  object dsUSU: TDataSource
    DataSet = cdsUSU
    Left = 208
    Top = 168
  end
  object qryCONSULTA: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from usuario')
    Left = 272
    Top = 32
  end
  object dspCONSULTA: TDataSetProvider
    DataSet = qryCONSULTA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 344
    Top = 32
  end
  object cdsCONSULTA: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspCONSULTA'
    Left = 416
    Top = 32
  end
  object dsCONSULTA: TDataSource
    DataSet = cdsCONSULTA
    Left = 488
    Top = 32
  end
  object qryCAT: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from categorias')
    Left = 40
    Top = 216
  end
  object dspCAT: TDataSetProvider
    DataSet = qryCAT
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 216
  end
  object cdsCAT: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from categorias'
    Params = <>
    ProviderName = 'dspCAT'
    Left = 160
    Top = 216
  end
  object dsCAT: TDataSource
    DataSet = cdsCAT
    Left = 208
    Top = 216
  end
  object qryTRAVAR: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 272
    Top = 80
  end
  object dspTRAVAR: TDataSetProvider
    DataSet = qryTRAVAR
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 344
    Top = 80
  end
  object cdsTRAVAR: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from usuario'
    Params = <>
    ProviderName = 'dspTRAVAR'
    Left = 416
    Top = 80
  end
  object dsTRAVAR: TDataSource
    DataSet = cdsTRAVAR
    Left = 488
    Top = 80
  end
  object qryITE: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from itens')
    Left = 40
    Top = 272
  end
  object dspITE: TDataSetProvider
    DataSet = qryITE
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 272
  end
  object cdsITE: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from itens'
    Params = <>
    ProviderName = 'dspITE'
    Left = 160
    Top = 272
  end
  object dsITE: TDataSource
    DataSet = cdsITE
    Left = 208
    Top = 272
  end
  object qryCXA: TFDQuery
    Connection = Banco
    Transaction = Transacao
    SQL.Strings = (
      'select * from itens')
    Left = 40
    Top = 336
  end
  object dspCXA: TDataSetProvider
    DataSet = qryCXA
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 336
  end
  object cdsCXA: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from caixa'
    Params = <>
    ProviderName = 'dspCXA'
    Left = 160
    Top = 336
  end
  object dsCXA: TDataSource
    DataSet = cdsCXA
    Left = 208
    Top = 336
  end
  object qryPEDIDO: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 336
    Top = 168
  end
  object dspPEDIDO: TDataSetProvider
    DataSet = qryPEDIDO
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 400
    Top = 168
  end
  object cdsPEDIDO: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from pedido'
    Params = <>
    ProviderName = 'dspPEDIDO'
    Left = 456
    Top = 168
  end
  object dsPEDIDO: TDataSource
    DataSet = cdsPEDIDO
    Left = 512
    Top = 168
  end
  object qryITEM_PEDIDO: TFDQuery
    Connection = Banco
    Transaction = Transacao
    Left = 336
    Top = 216
  end
  object dspITEM_PEDIDO: TDataSetProvider
    DataSet = qryITEM_PEDIDO
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 400
    Top = 216
  end
  object cdsITEM_PEDIDO: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from item_pedido'
    Params = <>
    ProviderName = 'dspITEM_PEDIDO'
    Left = 456
    Top = 216
  end
  object dsITEM_PEDIDO: TDataSource
    DataSet = cdsITEM_PEDIDO
    Left = 512
    Top = 216
  end
end
