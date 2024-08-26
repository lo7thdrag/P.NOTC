object fGroupSelect: TfGroupSelect
  Left = 0
  Top = 0
  ClientHeight = 433
  ClientWidth = 355
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
  object lbSingle: TListBox
    Left = 8
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 0
  end
  object lbId: TListBox
    Left = 8
    Top = 8
    Width = 341
    Height = 393
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object btnCopy: TButton
    Left = 95
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 2
  end
  object btnEdit: TButton
    Left = 185
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 3
    OnClick = btnEditClick
  end
  object btnNew: TButton
    Left = 8
    Top = 404
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 4
    OnClick = btnNewClick
  end
  object btnRemove: TButton
    Left = 274
    Top = 404
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
  end
end
