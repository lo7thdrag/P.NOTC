object fEO: TfEO
  Left = 0
  Top = 0
  Caption = 'Electro Optical'
  ClientHeight = 470
  ClientWidth = 337
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
  object lbTempId: TListBox
    Left = 8
    Top = 8
    Width = 321
    Height = 393
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object lbEO: TListBox
    Left = 8
    Top = 8
    Width = 321
    Height = 393
    ItemHeight = 13
    TabOrder = 1
  end
  object btnClose: TButton
    Left = 257
    Top = 437
    Width = 72
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnEdit: TButton
    Left = 176
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Copy..'
    TabOrder = 4
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 407
    Width = 75
    Height = 25
    Caption = 'New..'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object btnRemove: TButton
    Left = 257
    Top = 407
    Width = 72
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object btnUsage: TButton
    Left = 176
    Top = 437
    Width = 75
    Height = 25
    Caption = 'Usage..'
    TabOrder = 7
  end
  object btnFilter: TButton
    Left = 8
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 8
  end
end
