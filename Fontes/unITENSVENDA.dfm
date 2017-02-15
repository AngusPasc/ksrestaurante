object frmITENSVENDA: TfrmITENSVENDA
  Left = 0
  Top = 0
  Caption = 'Vendas - Itens'
  ClientHeight = 388
  ClientWidth = 516
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
    Left = 16
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Pedido'
  end
  object Label2: TLabel
    Left = 400
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label3: TLabel
    Left = 16
    Top = 45
    Width = 49
    Height = 13
    Caption = 'Sequencia'
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 22
    Height = 13
    Caption = 'Item'
  end
  object Label5: TLabel
    Left = 16
    Top = 130
    Width = 24
    Height = 13
    Caption = 'Qtde'
  end
  object Label6: TLabel
    Left = 105
    Top = 130
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label7: TLabel
    Left = 200
    Top = 130
    Width = 49
    Height = 13
    Caption = 'Total Item'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 211
    Width = 503
    Height = 169
    DataSource = DM.dsCONSULTA
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COD_IPE'
        Title.Caption = 'Sequencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ITE'
        Title.Caption = 'Item'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTD_IPE'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object edCODPED_IPE: TEdit
    Left = 15
    Top = 22
    Width = 74
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 9
  end
  object edTotal: TEdit
    Left = 399
    Top = 22
    Width = 74
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 10
  end
  object edCOD_IPE: TEdit
    Left = 16
    Top = 60
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
    OnEnter = edCOD_IPEEnter
    OnExit = edCOD_IPEExit
  end
  object edDESC_ITE: TEdit
    Left = 104
    Top = 104
    Width = 289
    Height = 21
    Color = clInactiveBorder
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 11
  end
  object btIncluir: TButton
    Left = 48
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Incluir'
    Enabled = False
    TabOrder = 3
    OnClick = btIncluirClick
  end
  object btSalvar: TButton
    Left = 129
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 4
    OnClick = btSalvarClick
  end
  object btExcluir: TButton
    Left = 210
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Enabled = False
    TabOrder = 5
    OnClick = btExcluirClick
  end
  object btCancelar: TButton
    Left = 291
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btCancelarClick
  end
  object btSair: TButton
    Left = 372
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
  end
  object Button6: TButton
    Left = 77
    Top = 102
    Width = 25
    Height = 25
    Caption = '?'
    TabOrder = 12
  end
  object dbeQTD_IPE: TDBEdit
    Left = 16
    Top = 146
    Width = 64
    Height = 21
    DataField = 'QTD_IPE'
    DataSource = DM.dsITEM_PEDIDO
    TabOrder = 2
    OnExit = dbeQTD_IPEExit
  end
  object dbeIDITE_IPE: TDBEdit
    Left = 16
    Top = 103
    Width = 58
    Height = 21
    DataField = 'IDITE_IPE'
    DataSource = DM.dsITEM_PEDIDO
    TabOrder = 1
    OnExit = dbeIDITE_IPEExit
  end
  object edVLRUNI_IPE: TEdit
    Left = 104
    Top = 146
    Width = 74
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 13
  end
  object edTotalItem: TEdit
    Left = 199
    Top = 146
    Width = 74
    Height = 21
    Color = clInactiveBorder
    ReadOnly = True
    TabOrder = 14
  end
end
