object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Gerenciador'
  ClientHeight = 151
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 92
    Top = 45
    Width = 68
    Height = 13
    Caption = 'Senha Geral'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edSenha: TEdit
    Left = 61
    Top = 64
    Width = 145
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object btAcessar: TButton
    Left = 92
    Top = 91
    Width = 75
    Height = 25
    Caption = 'Acessar'
    TabOrder = 1
    OnClick = btAcessarClick
  end
end
