object fSonobuoy: TfSonobuoy
  Left = 0
  Top = 0
  Caption = 'Sonobuoy'
  ClientHeight = 422
  ClientWidth = 623
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
    Top = 370
    Width = 605
    Height = 2
  end
  object lbAllSonobuoy: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = btnRemoveClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object lbTempIdSel: TListBox
    Left = 135
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 4
    Visible = False
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
  object btnCancel: TButton
    Left = 540
    Top = 383
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object lbSonobuoySel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 7
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 8
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy..'
    TabOrder = 9
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New..'
    TabOrder = 10
    OnClick = btnNewClick
  end
  object btnEditMount: TButton
    Left = 458
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 11
    OnClick = btnEditClick
  end
end