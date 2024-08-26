object fmBaseLocation: TfmBaseLocation
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Base Location'
  ClientHeight = 413
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 12
    Top = 371
    Width = 265
    Height = 2
  end
  object lbBaseID: TListBox
    Left = 12
    Top = 6
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 5
  end
  object lbBaseLocation: TListBox
    Left = 12
    Top = 6
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbBaseLocationClick
  end
  object btnRemove: TButton
    Left = 202
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 1
    OnClick = btnRemoveClick
  end
  object btnEdit: TButton
    Left = 107
    Top = 336
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btnPick: TButton
    Left = 107
    Top = 382
    Width = 75
    Height = 25
    Caption = 'Pick'
    TabOrder = 3
    OnClick = btnPickClick
  end
  object btnCancel: TButton
    Left = 202
    Top = 382
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnNew: TButton
    Left = 12
    Top = 336
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 6
    OnClick = btnNewClick
  end
end
