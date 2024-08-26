object fSonobuoySelect: TfSonobuoySelect
  Left = 0
  Top = 0
  Caption = 'Sonobuoy'
  ClientHeight = 412
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
    OnClick = lbAllSonobuoyClick
    OnDblClick = lbAllSonobuoyDblClick
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    Enabled = False
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 458
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    Enabled = False
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
  object btnClose: TButton
    Left = 540
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 5
    OnClick = btnCloseClick
  end
  object lbSonobuoySel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 6
    OnClick = lbSonobuoySelClick
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 7
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy...'
    Enabled = False
    TabOrder = 8
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 9
    OnClick = btnNewClick
  end
  object btnEditMount: TButton
    Left = 538
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 10
    OnClick = btnEditMountClick
  end
  object btnUsage: TButton
    Left = 377
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Usage...'
    Enabled = False
    TabOrder = 11
    OnClick = btnUsageClick
  end
  object btnFilter: TButton
    Left = 8
    Top = 378
    Width = 75
    Height = 25
    Caption = '>> Filter'
    Enabled = False
    TabOrder = 12
    OnClick = btnEditClick
  end
  object btn1: TButton
    Left = 459
    Top = 378
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 13
    OnClick = btnCloseClick
  end
end
