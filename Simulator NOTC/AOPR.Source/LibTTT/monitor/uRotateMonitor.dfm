object frmRotateMonitor: TfrmRotateMonitor
  Left = 629
  Top = 321
  BorderStyle = bsToolWindow
  Caption = 'Flipped'
  ClientHeight = 159
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 121
    Width = 43
    Height = 13
    Caption = 'Monitor :'
    Visible = False
  end
  object Label2: TLabel
    Left = 32
    Top = 24
    Width = 61
    Height = 13
    Caption = 'Orientation :'
  end
  object Label3: TLabel
    Left = 128
    Top = 53
    Width = 51
    Height = 13
    Caption = 'Landscape'
  end
  object Label5: TLabel
    Left = 128
    Top = 84
    Width = 88
    Height = 13
    Caption = 'Landscape Flipped'
  end
  object cbMonitor: TComboBox
    Left = 88
    Top = 118
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Visible = False
  end
  object btnLandscape: TButton
    Tag = 1
    Left = 32
    Top = 48
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 1
    OnClick = BtnOrientationClick
  end
  object btnLandscapeFlipped: TButton
    Tag = 3
    Left = 32
    Top = 79
    Width = 75
    Height = 25
    Caption = '180'
    TabOrder = 2
    OnClick = BtnOrientationClick
  end
end
