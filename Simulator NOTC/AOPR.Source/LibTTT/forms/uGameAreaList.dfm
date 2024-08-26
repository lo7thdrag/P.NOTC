object fGameAreaList: TfGameAreaList
  Left = 0
  Top = 0
  Caption = 'Game Area'
  ClientHeight = 457
  ClientWidth = 346
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
  object lbGameId: TListBox
    Left = 8
    Top = 8
    Width = 121
    Height = 22
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object lbScenarioList: TListBox
    Left = 8
    Top = 8
    Width = 330
    Height = 376
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbScenarioListClick
  end
  object btNew: TButton
    Left = 8
    Top = 390
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 1
    OnClick = btNewClick
  end
  object btEdit: TButton
    Left = 173
    Top = 390
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 2
    OnClick = btEditClick
  end
  object btRemove: TButton
    Left = 263
    Top = 390
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 4
    OnClick = btRemoveClick
  end
  object btCopy: TButton
    Left = 92
    Top = 390
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = btCopyClick
  end
  object btUsage: TButton
    Left = 178
    Top = 421
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 6
  end
  object btClose: TButton
    Left = 263
    Top = 421
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 7
    OnClick = btCloseClick
  end
  object btFilter: TButton
    Left = 8
    Top = 421
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 8
  end
end
