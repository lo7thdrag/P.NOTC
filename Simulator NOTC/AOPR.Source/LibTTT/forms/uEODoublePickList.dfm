object fEODoublePickList: TfEODoublePickList
  Left = 0
  Top = 0
  Caption = 'Electro Optical Detector'
  ClientHeight = 414
  ClientWidth = 625
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
  object shp1: TShape
    Left = 8
    Top = 370
    Width = 605
    Height = 2
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy..'
    TabOrder = 2
    OnClick = btnCopyClick
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New..'
    TabOrder = 4
    OnClick = btnNewClick
  end
  object btnOk: TButton
    Left = 460
    Top = 383
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnRemove: TButton
    Left = 539
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object lbAllEO: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 7
  end
  object lbEOSel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 8
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
  object lbTempIdSel: TListBox
    Left = 135
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
  object btnEditMount: TButton
    Left = 458
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 11
    OnClick = btnEditMountClick
  end
end
