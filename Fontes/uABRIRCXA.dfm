object ABRIRCXA: TABRIRCXA
  Left = 0
  Top = 0
  Caption = 'Caixa - Abertura'
  ClientHeight = 142
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 26
    Height = 13
    Caption = 'Saldo'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    Date = 42555.952813680550000000
    Time = 42555.952813680550000000
    TabOrder = 0
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 184
    Top = 8
    Width = 89
    Height = 58
    Caption = 'Turno'
    DataField = 'TURNO_CXA'
    DataSource = DM.dsCXA
    Items.Strings = (
      'Dia'
      'Noite')
    TabOrder = 1
    Values.Strings = (
      '0'
      '1')
  end
  object dbeVALORABERTURA_CXA: TDBEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    DataField = 'VALORABERTURA_CXA'
    DataSource = DM.dsCXA
    TabOrder = 2
  end
  object Button1: TButton
    Left = 48
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 129
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 4
  end
end
