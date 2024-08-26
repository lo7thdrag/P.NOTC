object fRadarIntervalSelect: TfRadarIntervalSelect
  Left = 329
  Top = 118
  Caption = 'Radar Interval'
  ClientHeight = 416
  ClientWidth = 606
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
    Top = 369
    Width = 591
    Height = 2
  end
  object lstIDSelectedPredefined: TListBox
    Left = 336
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
  end
  object btnCopy: TButton
    Left = 89
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 1
    Visible = False
    OnClick = btnCopyClick
  end
  object btnEdit: TButton
    Left = 170
    Top = 338
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    Visible = False
    OnClick = btnEditClick
  end
  object btnAdd: TButton
    Left = 281
    Top = 159
    Width = 49
    Height = 25
    Caption = 'Add ->'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnCancel: TButton
    Left = 521
    Top = 382
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnNew: TButton
    Left = 8
    Top = 338
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 5
    Visible = False
    OnClick = btnNewClick
  end
  object btnOk: TButton
    Left = 440
    Top = 382
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = btnOkClick
  end
  object btnRemove: TButton
    Left = 524
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object lstPredefinedAvailable: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 8
    OnDblClick = lstPredefinedAvailableDblClick
  end
  object lstPredefinedSelect: TListBox
    Left = 336
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 9
  end
  object lstIDPredefined: TListBox
    Left = 8
    Top = 376
    Width = 121
    Height = 38
    Color = clBtnFace
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
end
