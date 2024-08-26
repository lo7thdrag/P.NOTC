object fWeaponSingle: TfWeaponSingle
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 421
  ClientWidth = 334
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
  object lbTempId: TListBox
    Left = 7
    Top = 8
    Width = 321
    Height = 347
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object lbSingle: TListBox
    Left = 7
    Top = 8
    Width = 321
    Height = 347
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbSingleClick
    OnDblClick = lbSingleDblClick
  end
  object btnClose: TButton
    Left = 253
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnCopy: TButton
    Left = 89
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 3
    OnClick = btnCopyClick
  end
  object btnEdit: TButton
    Left = 171
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 4
    OnClick = btnEditClick
  end
  object btnNew: TButton
    Left = 7
    Top = 361
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object btnRemove: TButton
    Left = 253
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object btnUsage: TButton
    Left = 171
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 7
    OnClick = btnUsageClick
  end
  object btnFilter: TButton
    Left = 7
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 8
  end
end
