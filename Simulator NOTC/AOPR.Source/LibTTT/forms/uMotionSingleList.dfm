object fmotionSingleList: TfmotionSingleList
  Left = 0
  Top = 0
  Caption = 'Motions'
  ClientHeight = 465
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
  object lbIdMotions: TListBox
    Left = 8
    Top = 8
    Width = 331
    Height = 377
    ItemHeight = 13
    TabOrder = 9
  end
  object grpFilter: TGroupBox
    Left = 8
    Top = 496
    Width = 376
    Height = 54
    Caption = 'Filter'
    TabOrder = 1
    object cbUsage: TCheckBox
      Left = 16
      Top = 21
      Width = 97
      Height = 17
      Caption = 'Usage'
      TabOrder = 0
    end
    object cbxUsedBy: TComboBox
      Left = 145
      Top = 19
      Width = 218
      Height = 21
      TabOrder = 1
      Text = 'Used by Vehicle'
    end
  end
  object btNew: TButton
    Left = 8
    Top = 399
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 2
    OnClick = btNewClick
  end
  object btCopy: TButton
    Left = 93
    Top = 399
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 3
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 180
    Top = 399
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 4
    OnClick = btEditClick
  end
  object btRemove: TButton
    Left = 264
    Top = 399
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btRemoveClick
  end
  object btUsage: TButton
    Left = 180
    Top = 430
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 6
  end
  object btClose: TButton
    Left = 264
    Top = 430
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 7
    OnClick = btCloseClick
  end
  object btFilter: TButton
    Left = 8
    Top = 430
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 8
    OnClick = btFilterClick
  end
  object lbMotions: TListBox
    Left = 8
    Top = 8
    Width = 331
    Height = 377
    ItemHeight = 13
    TabOrder = 0
  end
end
