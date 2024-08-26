object SatelliteListForm: TSatelliteListForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Satellites'
  ClientHeight = 421
  ClientWidth = 335
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
  object lbIdSatellites: TListBox
    Left = 7
    Top = 8
    Width = 321
    Height = 347
    ItemHeight = 13
    TabOrder = 3
  end
  object lbSatellites: TListBox
    Left = 7
    Top = 8
    Width = 321
    Height = 347
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = lbSatellitesDblClick
  end
  object btnNew: TButton
    Left = 7
    Top = 361
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 1
    OnClick = btnNewClick
  end
  object btnEdit: TButton
    Left = 171
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 2
    OnClick = btnEditClick
  end
  object btClose: TButton
    Left = 253
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btCloseClick
  end
  object btCopy: TButton
    Left = 89
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 5
    OnClick = btCopyClick
  end
  object btFilter: TButton
    Left = 7
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Filter >>'
    Enabled = False
    TabOrder = 6
    Visible = False
  end
  object btRemove: TButton
    Left = 253
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 7
    OnClick = btRemoveClick
  end
  object btUsage: TButton
    Left = 171
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 8
    OnClick = btUsageClick
  end
end
