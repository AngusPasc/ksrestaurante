object frmCONSITE: TfrmCONSITE
  Left = 0
  Top = 0
  Caption = 'Consulta - Itens'
  ClientHeight = 201
  ClientWidth = 447
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 40
    Width = 431
    Height = 120
    DataSource = DM.dsITE
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_ITE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_ITE'
        Title.Caption = 'Nome'
        Width = 250
        Visible = True
      end>
  end
  object edConsulta: TEdit
    Left = 32
    Top = 172
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 336
    Top = 168
    Width = 89
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 2
    OnClick = Button1Click
  end
end
