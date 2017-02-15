object CADCAT: TCADCAT
  Left = 0
  Top = 0
  Caption = 'Cadastro - Categorias'
  ClientHeight = 302
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = dbeDESC_CAT
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 174
    Width = 477
    Height = 120
    DataSource = DM.dsCONSULTA
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_CAT'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_CAT'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
        Visible = True
      end>
  end
  object dbeDESC_CAT: TDBEdit
    Left = 8
    Top = 72
    Width = 394
    Height = 21
    DataField = 'DESC_CAT'
    DataSource = DM.dsCAT
    TabOrder = 1
  end
  object btIncluir: TButton
    Left = 8
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Incluir'
    Enabled = False
    TabOrder = 4
    OnClick = btIncluirClick
  end
  object btSalvar: TButton
    Left = 89
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 5
    OnClick = btSalvarClick
  end
  object btExcluir: TButton
    Left = 170
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 6
    OnClick = btExcluirClick
  end
  object btSair: TButton
    Left = 251
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
    OnClick = btSairClick
  end
  object edID_CAT: TEdit
    Left = 8
    Top = 35
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnEnter = edID_CATEnter
    OnExit = edID_CATExit
  end
  object DBCheckBox1: TDBCheckBox
    Left = 16
    Top = 107
    Width = 97
    Height = 17
    Caption = 'Almo'#231'o'
    DataField = 'ALMOCO_CAT'
    DataSource = DM.dsCAT
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DBCheckBox2: TDBCheckBox
    Left = 148
    Top = 107
    Width = 97
    Height = 17
    Caption = 'Janta'
    DataField = 'JANTA_CAT'
    DataSource = DM.dsCAT
    TabOrder = 3
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsCAT
    Left = 240
    Top = 136
  end
end
