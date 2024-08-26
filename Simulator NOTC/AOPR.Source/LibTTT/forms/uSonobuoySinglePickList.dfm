object fSonobuoySelect: TfSonobuoySelect
  Left = 0
  Top = 0
  Caption = 'Sonobuoy'
  ClientHeight = 437
  ClientWidth = 351
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
  object lbTempSonobuoyId: TListBox
    Left = 183
    Top = 168
    Width = 331
    Height = 361
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object lbSonobuoyList: TListBox
    Left = 11
    Top = 8
    Width = 332
    Height = 361
    ItemHeight = 13
    TabOrder = 1
  end
  object btNew: TButton
    Left = 8
    Top = 375
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 2
    OnClick = btNewClick
  end
  object btEdit: TButton
    Left = 178
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 3
    OnClick = btEditClick
  end
  object btCopy: TButton
    Left = 93
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 4
    OnClick = btCopyClick
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
  object btFilter: TButton
    Left = 8
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 7
  end
  object btClose: TButton
    Left = 264
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 8
    OnClick = btCloseClick
  end
end
