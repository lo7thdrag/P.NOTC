object fTorpedoSingleList: TfTorpedoSingleList
  Left = 0
  Top = 0
  Caption = 'Torpedo'
  ClientHeight = 466
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTempId: TListBox
    Left = 6
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 0
    Visible = False
  end
  object lbTorpedo: TListBox
    Left = 6
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 1
  end
  object btnClose: TButton
    Left = 272
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnCopy: TButton
    Left = 93
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 3
  end
  object btnEdit: TButton
    Left = 183
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 4
  end
  object btnNew: TButton
    Left = 6
    Top = 407
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 5
  end
  object btnRemove: TButton
    Left = 272
    Top = 407
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 6
  end
  object btnUsage: TButton
    Left = 183
    Top = 438
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 7
  end
end
