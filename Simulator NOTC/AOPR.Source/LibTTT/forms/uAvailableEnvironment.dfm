object AvailableEnvironmentForm: TAvailableEnvironmentForm
  Left = 0
  Top = 0
  Caption = 'Available Environment'
  ClientHeight = 419
  ClientWidth = 353
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
  object lbEnvironment: TListBox
    Left = 8
    Top = 8
    Width = 337
    Height = 353
    ItemHeight = 13
    TabOrder = 0
  end
  object btNew: TButton
    Left = 8
    Top = 367
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 1
    OnClick = btNewClick
  end
  object btEdit: TButton
    Left = 89
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btEditClick
  end
end
