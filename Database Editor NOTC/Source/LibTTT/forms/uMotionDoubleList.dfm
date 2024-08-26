object fMotionDouble: TfMotionDouble
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Motion'
  ClientHeight = 416
  ClientWidth = 624
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
    TabOrder = 1
    OnDblClick = lbAllMotionDblClick
  end
  object lbMotionSelect: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 6
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 376
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object btnOk: TButton
    Left = 456
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 8
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = btnCancelClick
  end
  object btCopy: TButton
    Left = 93
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 4
    Visible = False
    OnClick = btCopyClick
  end
  object btEdit: TButton
    Left = 180
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 5
    Visible = False
    OnClick = btEditClick
  end
  object btNew: TButton
    Left = 8
    Top = 337
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 3
    Visible = False
    OnClick = btNewClick
  end
  object lbTempId: TListBox
    Left = 8
    Top = 376
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
end
