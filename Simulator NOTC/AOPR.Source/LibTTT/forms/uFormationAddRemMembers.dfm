object frmFormationAddRemMembers: TfrmFormationAddRemMembers
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Add/Remove Formation Members'
  ClientHeight = 364
  ClientWidth = 473
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 8
    Top = 322
    Width = 449
    Height = 3
    Shape = bsTopLine
  end
  object lb1: TLabel
    Left = 12
    Top = 11
    Width = 60
    Height = 16
    Caption = 'Available :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 283
    Top = 11
    Width = 62
    Height = 16
    Caption = 'Members :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lvAvailable: TListView
    Left = 12
    Top = 28
    Width = 175
    Height = 256
    Color = clWhite
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = lvAvailableSelectItem
  end
  object lvMembers: TListView
    Left = 281
    Top = 28
    Width = 175
    Height = 256
    Color = clWhite
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvMembersSelectItem
  end
  object btnClose: TButton
    Left = 383
    Top = 330
    Width = 75
    Height = 30
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object btnAdd: TButton
    Left = 195
    Top = 119
    Width = 80
    Height = 30
    Caption = 'Add >'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 195
    Top = 154
    Width = 80
    Height = 30
    Caption = '< Remove'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object btnEdit: TButton
    Left = 281
    Top = 288
    Width = 100
    Height = 30
    Caption = 'Edit Members'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnEditClick
  end
end
