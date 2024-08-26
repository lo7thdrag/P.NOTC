object fOtherSingle: TfOtherSingle
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = '\'
  ClientHeight = 472
  ClientWidth = 357
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
    Left = 8
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object lbSingle: TListBox
    Left = 8
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbSingleClick
    OnDblClick = lbSingleDblClick
  end
  object btnClose: TButton
    Left = 274
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnCopy: TButton
    Left = 96
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Copy'
    Enabled = False
    TabOrder = 3
    OnClick = btnCopyClick
  end
  object btnEdit: TButton
    Left = 185
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Edit'
    Enabled = False
    TabOrder = 4
    OnClick = btnEditClick
  end
  object btnNew: TButton
    Left = 8
    Top = 404
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object btnRemove: TButton
    Left = 274
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Remove'
    Enabled = False
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object btnUsage: TButton
    Left = 185
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Usage'
    Enabled = False
    TabOrder = 7
    OnClick = btnUsageClick
  end
  object btnFilter: TButton
    Left = 8
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 8
  end
  object btnOK: TButton
    Left = 96
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Pick'
    TabOrder = 9
    Visible = False
    OnClick = btnOKClick
  end
end
