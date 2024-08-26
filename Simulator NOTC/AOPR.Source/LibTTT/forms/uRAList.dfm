object fRAList: TfRAList
  Left = 0
  Top = 0
  Caption = 'Resource Allocations'
  ClientHeight = 439
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btClose: TButton
    Left = 264
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btCloseClick
  end
  object btCopy: TButton
    Left = 92
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 1
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 178
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 2
    OnClick = btEditClick
  end
  object btFilter: TButton
    Left = 8
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    TabOrder = 3
  end
  object btNew: TButton
    Left = 8
    Top = 375
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 4
    OnClick = btNewClick
  end
  object btRemove: TButton
    Left = 264
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btRemoveClick
  end
  object btUsage: TButton
    Left = 178
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 6
  end
  object lbRAId: TListBox
    Left = 9
    Top = 8
    Width = 331
    Height = 361
    ItemHeight = 13
    TabOrder = 8
    Visible = False
  end
  object lbRAList: TListBox
    Left = 8
    Top = 8
    Width = 332
    Height = 361
    ItemHeight = 13
    TabOrder = 7
    OnClick = lbRAListClick
  end
end
