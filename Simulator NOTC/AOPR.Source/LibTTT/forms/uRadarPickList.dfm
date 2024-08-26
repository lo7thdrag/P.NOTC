object fRadarPickList: TfRadarPickList
  Left = 0
  Top = 0
  Caption = 'Radars'
  ClientHeight = 473
  ClientWidth = 358
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
  object lbIdRadars: TListBox
    Left = 8
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 3
  end
  object btnNew: TButton
    Left = 7
    Top = 407
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnEdit: TButton
    Left = 186
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object lbRadars: TListBox
    Left = 9
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 0
  end
  object btClose: TButton
    Left = 274
    Top = 437
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btCloseClick
  end
  object btCopy: TButton
    Left = 96
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = btCopyClick
  end
  object btFilter: TButton
    Left = 8
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 6
  end
  object btRemove: TButton
    Left = 274
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btRemoveClick
  end
  object btUsage: TButton
    Left = 186
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 8
  end
  object lbTempidRadars: TListBox
    Left = 328
    Top = 216
    Width = 61
    Height = 161
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
end
