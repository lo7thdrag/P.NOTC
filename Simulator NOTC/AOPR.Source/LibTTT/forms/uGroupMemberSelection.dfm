object fGroupMemberSelection: TfGroupMemberSelection
  Left = 0
  Top = 0
  ClientHeight = 407
  ClientWidth = 623
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
    Top = 366
    Width = 605
    Height = 2
  end
  object shp2: TShape
    Left = 8
    Top = 368
    Width = 605
    Height = 2
  end
  object lbAllMember: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
  end
  object lbMemberSel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
  object btnRemove: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = btnRemoveClick
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
  object btnOk: TButton
    Left = 459
    Top = 374
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 373
    Width = 121
    Height = 28
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object lbTempIdSel: TListBox
    Left = 8
    Top = 374
    Width = 121
    Height = 28
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object pnl1: TPanel
    Left = 320
    Top = -16
    Width = 1
    Height = 17
    Caption = 'pnl1'
    TabOrder = 8
  end
end
