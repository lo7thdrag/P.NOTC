object ChooseMap: TChooseMap
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Game Area'
  ClientHeight = 171
  ClientWidth = 259
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
  object grbDepthContours: TGroupBox
    Left = 8
    Top = 8
    Width = 241
    Height = 114
    Caption = 'Map Selection'
    TabOrder = 0
    object cbENC: TCheckBox
      Left = 16
      Top = 22
      Width = 65
      Height = 17
      Caption = 'ENC'
      TabOrder = 0
      OnClick = cbENCClick
    end
    object cbVektorMap: TCheckBox
      Left = 16
      Top = 45
      Width = 89
      Height = 26
      Caption = 'Vektor Map'
      TabOrder = 1
      OnClick = cbVektorMapClick
    end
  end
  object btnOk: TButton
    Left = 93
    Top = 136
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 174
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
