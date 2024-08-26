object fSatellite: TfSatellite
  Left = 0
  Top = 0
  Caption = 'Satellite'
  ClientHeight = 412
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
    Top = 370
    Width = 605
    Height = 2
  end
  object lbAllSatellite: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbAllSatelliteDblClick
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 1
    OnClick = btnAddClick
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
    Top = 378
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 540
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object lbTempIdSel: TListBox
    Left = 135
    Top = 378
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object lbSatelliteSel: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 7
  end
  object btnEditTrack: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 8
    OnClick = btnEditTrackClick
  end
  object btnUsage: TButton
    Left = 378
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Usage...'
    TabOrder = 9
    OnClick = btnUsageClick
  end
  object btnEdit: TButton
    Left = 170
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 10
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 89
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy...'
    TabOrder = 11
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 12
    OnClick = btnNewClick
  end
  object btnFilter: TButton
    Left = 8
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 13
  end
end
