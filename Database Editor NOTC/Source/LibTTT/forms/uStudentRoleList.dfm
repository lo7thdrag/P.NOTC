object fStudentRole: TfStudentRole
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Student Role List'
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 8
    Top = 368
    Width = 605
    Height = 2
  end
  object lbAllStudent: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbAllStudentDblClick
  end
  object lbStudentSel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
  object btnRemove: TButton
    Left = 459
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = btnRemoveClick
  end
  object btnOk: TButton
    Left = 459
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 5
    OnClick = btnAddClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 373
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 7
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy..'
    TabOrder = 8
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New..'
    TabOrder = 9
    OnClick = btnNewClick
  end
  object lbTempIdSel: TListBox
    Left = 8
    Top = 373
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
  object btn1: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit'
    Enabled = False
    TabOrder = 11
  end
end
