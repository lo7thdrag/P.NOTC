object FormationResourcesForm: TFormationResourcesForm
  Left = 0
  Top = 0
  Caption = 'Formation Resources'
  ClientHeight = 434
  ClientWidth = 624
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
    Left = 9
    Top = 394
    Width = 606
    Height = 2
  end
  object Label1: TLabel
    Left = 9
    Top = 17
    Width = 91
    Height = 13
    Caption = 'Available Platforms'
  end
  object Label2: TLabel
    Left = 335
    Top = 17
    Width = 89
    Height = 13
    Caption = 'Selected Platforms'
  end
  object lbSelectedPlatformsIndex: TListBox
    Left = 335
    Top = 36
    Width = 281
    Height = 321
    ItemHeight = 13
    TabOrder = 10
    Visible = False
  end
  object lbAvailablePlatformIndex: TListBox
    Left = 8
    Top = 36
    Width = 266
    Height = 321
    ItemHeight = 13
    TabOrder = 9
    Visible = False
  end
  object lbAvailablePlatforms: TListBox
    Left = 8
    Top = 36
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 7
  end
  object btCopy: TButton
    Left = 88
    Top = 363
    Width = 75
    Height = 25
    Caption = 'Copy...'
    TabOrder = 0
  end
  object btEdit: TButton
    Left = 169
    Top = 363
    Width = 75
    Height = 25
    Caption = 'Edit...'
    TabOrder = 1
    OnClick = btEditClick
  end
  object btNew: TButton
    Left = 8
    Top = 363
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 2
    OnClick = btNewClick
  end
  object btOK: TButton
    Left = 459
    Top = 402
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btOKClick
  end
  object btRemove: TButton
    Left = 540
    Top = 363
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 4
    OnClick = btRemoveClick
  end
  object Button2: TButton
    Left = 540
    Top = 402
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 280
    Top = 168
    Width = 49
    Height = 25
    Caption = 'Add ->'
    TabOrder = 6
    OnClick = Button3Click
  end
  object lbSelectedPlatforms: TListBox
    Left = 335
    Top = 36
    Width = 281
    Height = 321
    ItemHeight = 13
    TabOrder = 8
  end
end
