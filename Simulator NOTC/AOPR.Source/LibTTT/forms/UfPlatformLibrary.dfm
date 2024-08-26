object fPlatformLibraryDoublePickList: TfPlatformLibraryDoublePickList
  Left = 0
  Top = 0
  Caption = 'Platform Libraries'
  ClientHeight = 420
  ClientWidth = 608
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
  object shp1: TShape
    Left = 8
    Top = 369
    Width = 591
    Height = 2
  end
  object lbPlatformLibrarySelectedID: TListBox
    Left = 335
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 10
  end
  object btCopy: TButton
    Left = 89
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 0
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 170
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 1
    OnClick = btEditClick
  end
  object btnAdd: TButton
    Left = 280
    Top = 159
    Width = 49
    Height = 25
    Caption = 'Add ->'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnCancel: TButton
    Left = 521
    Top = 382
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btNew: TButton
    Left = 8
    Top = 338
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 4
    OnClick = btNewClick
  end
  object btnOk: TButton
    Left = 440
    Top = 382
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnRemove: TButton
    Left = 525
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object lbPlatformLibraryAvailable: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 7
  end
  object lbPlatformLibrarySelected: TListBox
    Left = 334
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 8
  end
  object lbPlatformLibraryID: TListBox
    Left = 8
    Top = 376
    Width = 121
    Height = 38
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
end
