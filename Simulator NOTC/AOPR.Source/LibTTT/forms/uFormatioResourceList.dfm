object FormationResourcesForm: TFormationResourcesForm
  Left = 0
  Top = 0
  Caption = 'Formation Resources'
  ClientHeight = 411
  ClientWidth = 584
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
  object Shape1: TShape
    Left = 8
    Top = 370
    Width = 565
    Height = 2
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Available:'
  end
  object Label2: TLabel
    Left = 338
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Members:'
  end
  object lbSelectedPlatformsIndex: TListBox
    Left = 338
    Top = 36
    Width = 236
    Height = 321
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object lbAvailablePlatformIndex: TListBox
    Left = 8
    Top = 36
    Width = 236
    Height = 321
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object lbAvailablePlatforms: TListBox
    Left = 8
    Top = 27
    Width = 236
    Height = 330
    ItemHeight = 13
    TabOrder = 2
  end
  object btnClose: TButton
    Left = 501
    Top = 378
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object btnAdd: TButton
    Left = 250
    Top = 168
    Width = 81
    Height = 25
    Caption = 'Add >'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object lbSelectedPlatforms: TListBox
    Left = 338
    Top = 27
    Width = 236
    Height = 330
    ItemHeight = 13
    TabOrder = 3
  end
  object btnRemove: TButton
    Left = 250
    Top = 199
    Width = 82
    Height = 25
    Caption = '< Remove'
    TabOrder = 6
    OnClick = btnAddClick
  end
end
