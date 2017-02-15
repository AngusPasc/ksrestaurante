object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  Caption = 'frmUsuario'
  ClientHeight = 263
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 11
    Height = 13
    Caption = 'ID'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 29
    Height = 13
    Caption = 'NOME'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 208
    Top = 48
    Width = 33
    Height = 13
    Caption = 'SENHA'
    FocusControl = DBEdit3
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 135
    Width = 353
    Height = 120
    DataSource = dmGerenciador.dsCONSULTA
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 21
    Width = 134
    Height = 21
    DataField = 'ID_USU'
    DataSource = dmGerenciador.dsUSU
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 61
    Width = 134
    Height = 21
    DataField = 'NOME_USU'
    DataSource = dmGerenciador.dsUSU
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 208
    Top = 61
    Width = 134
    Height = 21
    DataField = 'SENHA_USU'
    DataSource = dmGerenciador.dsUSU
    TabOrder = 3
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 89
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
  end
  object Button3: TButton
    Left = 170
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
  end
  object Button4: TButton
    Left = 251
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
  end
end
