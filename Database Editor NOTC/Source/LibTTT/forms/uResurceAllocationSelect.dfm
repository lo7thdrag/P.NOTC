object fResorceAllocationSelect: TfResorceAllocationSelect
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Resource Allocation'
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
  OnClick = btnAddClick
  OnCreate = FormCreate
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 9
    Top = 376
    Width = 606
    Height = 2
  end
  object lbAvailableResAlloc: TListBox
    Left = 8
    Top = 17
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbAvailableResAllocDblClick
  end
  object lbSelectedRes: TListBox
    Left = 334
    Top = 17
    Width = 281
    Height = 321
    ItemHeight = 13
    TabOrder = 1
  end
  object btOK: TButton
    Left = 459
    Top = 389
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btOKClick
  end
  object Button2: TButton
    Left = 540
    Top = 389
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = Button2Click
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 49
    Height = 25
    Caption = 'Add ->'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object btRemove: TButton
    Left = 540
    Top = 344
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btRemoveClick
  end
  object lbTempIdRA: TListBox
    Left = 8
    Top = 384
    Width = 65
    Height = 97
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object btNew: TButton
    Left = 8
    Top = 345
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 7
    OnClick = btNewClick
  end
  object btCopy: TButton
    Left = 93
    Top = 345
    Width = 75
    Height = 25
    Caption = 'Copy...'
    TabOrder = 8
    OnClick = btCopyClick
  end
  object btnEdit: TButton
    Left = 178
    Top = 345
    Width = 75
    Height = 25
    Caption = 'Edit..'
    TabOrder = 9
    OnClick = btnEditClick
  end
end
