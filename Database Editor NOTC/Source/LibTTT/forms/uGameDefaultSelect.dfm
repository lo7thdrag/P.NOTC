object fGameDefaults: TfGameDefaults
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Game Defaults'
  ClientHeight = 424
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 9
    Top = 370
    Width = 590
    Height = 2
  end
  object lbTempIDSelect: TListBox
    Left = 336
    Top = 232
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 10
  end
  object lbTempID: TListBox
    Left = 8
    Top = 232
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 6
  end
  object lbGameDefaultAvailable: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbGameDefaultAvailableDblClick
  end
  object btnAdd: TButton
    Left = 279
    Top = 159
    Width = 51
    Height = 25
    Caption = 'Add ->'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 526
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 3
    OnClick = btnRemoveClick
  end
  object btnCancel: TButton
    Left = 526
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 445
    Top = 384
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 7
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy..'
    TabOrder = 8
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New..'
    TabOrder = 9
    OnClick = btnNewClick
  end
  object lbGameDefaultSelect: TListBox
    Left = 336
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
end
