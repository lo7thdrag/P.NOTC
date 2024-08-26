object fSonarList: TfSonarList
  Left = 0
  Top = 0
  Caption = 'Sonar'
  ClientHeight = 469
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btClose: TButton
    Left = 274
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
  end
  object btCopy: TButton
    Left = 88
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 1
  end
  object btFilter: TButton
    Left = 8
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    TabOrder = 2
  end
  object btnEdit: TButton
    Left = 193
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
  end
  object btnNew: TButton
    Left = 8
    Top = 404
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 4
  end
  object btRemove: TButton
    Left = 274
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
  end
  object btUsage: TButton
    Left = 193
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 6
  end
  object lbIdSonars: TListBox
    Left = 8
    Top = 7
    Width = 337
    Height = 393
    ItemHeight = 13
    TabOrder = 7
  end
  object lbSonars: TListBox
    Left = 8
    Top = 5
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 8
  end
end
