object fOtherSingle: TfOtherSingle
  Left = 0
  Top = 0
  ClientHeight = 467
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
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
    TabOrder = 3
    OnClick = btnCopyClick
  end
  object btnEdit: TButton
    Left = 185
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Edit'
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
    TabOrder = 6
    OnClick = btnRemoveClick
  end
  object btnUsage: TButton
    Left = 185
    Top = 435
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 7
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
end
