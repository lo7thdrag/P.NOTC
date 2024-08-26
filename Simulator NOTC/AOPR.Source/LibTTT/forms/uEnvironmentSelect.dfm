object fEnvironmentSelect: TfEnvironmentSelect
  Left = 0
  Top = 0
  Caption = 'Environment'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 8
    Top = 369
    Width = 591
    Height = 2
  end
  object lbEnvironmentAvailable: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
  end
  object lbEnvironmentSelect: TListBox
    Left = 334
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
  object btnAdd: TButton
    Left = 279
    Top = 159
    Width = 49
    Height = 25
    Caption = 'Add ->'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 524
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 3
    OnClick = btnRemoveClick
  end
  object btnOk: TButton
    Left = 440
    Top = 382
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 521
    Top = 382
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object lbtempIDEnvi: TListBox
    Left = 8
    Top = 377
    Width = 121
    Height = 38
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object btNew: TButton
    Left = 8
    Top = 338
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 7
    OnClick = btNewClick
  end
  object btCopy: TButton
    Left = 89
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 8
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 170
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 9
    OnClick = btEditClick
  end
  object lbTempIdArea: TListBox
    Left = 8
    Top = 377
    Width = 121
    Height = 38
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
end
