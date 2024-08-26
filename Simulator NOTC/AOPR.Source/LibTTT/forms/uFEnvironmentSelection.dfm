object fEnvironmentsSelect: TfEnvironmentsSelect
  Left = 0
  Top = 0
  Caption = 'Environments'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbTempId: TListBox
    Left = 8
    Top = 8
    Width = 331
    Height = 361
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object lbTempIdArea: TListBox
    Left = 8
    Top = 8
    Width = 331
    Height = 356
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object lbEnvironmentList: TListBox
    Left = 8
    Top = 8
    Width = 332
    Height = 361
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbEnvironmentListClick
  end
  object btNew: TButton
    Left = 8
    Top = 375
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 1
    OnClick = btNewClick
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
  object btCopy: TButton
    Left = 93
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = btCopyClick
  end
  object btRemove: TButton
    Left = 264
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = btRemoveClick
  end
  object btUsage: TButton
    Left = 178
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 7
  end
  object btFilter: TButton
    Left = 8
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    TabOrder = 8
  end
  object btClose: TButton
    Left = 264
    Top = 406
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 9
    OnClick = btCloseClick
  end
end
