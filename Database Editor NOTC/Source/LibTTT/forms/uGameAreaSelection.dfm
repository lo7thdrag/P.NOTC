object fGameAreaSelection: TfGameAreaSelection
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Game Area Selection'
  ClientHeight = 424
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 10
    Top = 370
    Width = 600
    Height = 2
    Brush.Color = clGradientActiveCaption
  end
  object lbAllGame: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 326
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbAllGameDblClick
  end
  object lbGameSel: TListBox
    Left = 351
    Top = 8
    Width = 266
    Height = 326
    ItemHeight = 13
    TabOrder = 1
  end
  object btAdd: TButton
    Left = 279
    Top = 144
    Width = 66
    Height = 25
    Caption = 'Add ->'
    TabOrder = 2
    OnClick = btAddClick
  end
  object btCopy: TButton
    Left = 89
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Copy...'
    TabOrder = 3
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 170
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 4
    OnClick = btEditClick
  end
  object btNew: TButton
    Left = 8
    Top = 340
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 5
    OnClick = btNewClick
  end
  object btOK: TButton
    Left = 462
    Top = 378
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 6
    OnClick = btOKClick
  end
  object btRemove: TButton
    Left = 542
    Top = 340
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btRemoveClick
  end
  object btCancel: TButton
    Left = 543
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 8
    OnClick = btCancelClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
end
