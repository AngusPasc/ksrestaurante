object frmVENDA: TfrmVENDA
  Left = 0
  Top = 0
  Caption = 'Venda'
  ClientHeight = 210
  ClientWidth = 626
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 248
    Top = 57
    Width = 102
    Height = 13
    Caption = 'Forma de Pagamento'
  end
  object Label2: TLabel
    Left = 139
    Top = 57
    Width = 25
    Height = 13
    Caption = 'Mesa'
  end
  object Label3: TLabel
    Left = 8
    Top = 57
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object lbl: TLabel
    Left = 472
    Top = 57
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label4: TLabel
    Left = 472
    Top = 1
    Width = 52
    Height = 13
    Caption = 'Nro Pedido'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 72
    Width = 113
    Height = 21
    Date = 42688.476214814810000000
    Time = 42688.476214814810000000
    Enabled = False
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 136
    Top = 72
    Width = 97
    Height = 21
    Enabled = False
    ItemIndex = 0
    TabOrder = 1
    Text = 'Padr'#227'o'
    Items.Strings = (
      'Padr'#227'o'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10')
  end
  object ComboBox2: TComboBox
    Left = 248
    Top = 72
    Width = 145
    Height = 21
    Enabled = False
    ItemIndex = 0
    TabOrder = 2
    Text = 'Dinheiro'
    Items.Strings = (
      'Dinheiro'
      'Cart'#227'o')
  end
  object edTotal: TEdit
    Left = 472
    Top = 72
    Width = 121
    Height = 24
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object btNovo: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 4
    OnClick = btNovoClick
  end
  object btFinalizar: TButton
    Left = 89
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Finalizar'
    Enabled = False
    TabOrder = 5
  end
  object edCOD_PED: TEdit
    Left = 472
    Top = 16
    Width = 121
    Height = 24
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object BtConsultar: TButton
    Left = 170
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 7
  end
  object BtItens: TButton
    Left = 8
    Top = 128
    Width = 113
    Height = 41
    Caption = 'Itens'
    Enabled = False
    TabOrder = 8
    OnClick = BtItensClick
  end
  object btPagamento: TButton
    Left = 139
    Top = 128
    Width = 113
    Height = 41
    Caption = 'Pagamento'
    Enabled = False
    TabOrder = 9
  end
end
