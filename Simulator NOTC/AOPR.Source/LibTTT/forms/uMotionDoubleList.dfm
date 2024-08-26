object fMotionDouble: TfMotionDouble
  Left = 0
  Top = 0
  Caption = 'Motion'
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
    Top = 368
    Width = 605
    Height = 2
  end
  object lbAllMotion: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
  end
  object lbMotionSelect: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 2
    Visible = False
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object btnOk: TButton
    Left = 456
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object btCopy: TButton
    Left = 93
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 7
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 180
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 8
    OnClick = btEditClick
  end
  object btNew: TButton
    Left = 8
    Top = 337
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 9
    OnClick = btNewClick
  end
end
