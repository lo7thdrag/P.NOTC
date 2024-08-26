object frmScenario: TfrmScenario
  Left = 0
  Top = 0
  Caption = 'Scenario'
  ClientHeight = 312
  ClientWidth = 424
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object edScenarioName: TEdit
    Left = 8
    Top = 24
    Width = 382
    Height = 21
    TabOrder = 0
  end
  object pcScenarioTabs: TPageControl
    Left = 8
    Top = 64
    Width = 398
    Height = 201
    ActivePage = tsGeneral
    TabOrder = 1
    object tsGeneral: TTabSheet
      Caption = 'General'
      object StaticText1: TStaticText
        Left = 3
        Top = 3
        Width = 105
        Height = 17
        Caption = 'Resource Allocation :'
        TabOrder = 0
      end
      object edResourceAllocation: TEdit
        Left = 8
        Top = 24
        Width = 329
        Height = 21
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 343
        Top = 23
        Width = 33
        Height = 23
        Caption = '...'
        DoubleBuffered = True
        ParentDoubleBuffered = False
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object btDeployPlatforms: TButton
        Left = 3
        Top = 64
        Width = 135
        Height = 25
        Caption = 'Deploy Platforms...'
        TabOrder = 3
        OnClick = btDeployPlatformsClick
      end
    end
    object tsRelationships: TTabSheet
      Caption = 'Relationships'
      ImageIndex = 3
      object Label95: TLabel
        Left = 95
        Top = 106
        Width = 3
        Height = 13
      end
      object rgforce: TRadioGroup
        Left = 16
        Top = 3
        Width = 129
        Height = 158
        Caption = 'Force'
        ItemIndex = 0
        Items.Strings = (
          'Red'
          'Yellow'
          'Blue'
          'Green'
          'No Force'
          'NTDS')
        TabOrder = 0
      end
      object gbPlatformRelationships: TGroupBox
        Left = 151
        Top = 3
        Width = 227
        Height = 158
        Caption = 'Platform Relationships'
        TabOrder = 1
        object btGroups: TButton
          Left = 16
          Top = 24
          Width = 121
          Height = 33
          Caption = 'Groups...'
          TabOrder = 0
          OnClick = btGroupsClick
        end
        object btLinks: TButton
          Left = 16
          Top = 80
          Width = 121
          Height = 33
          Caption = 'Links...'
          TabOrder = 1
          OnClick = btLinksClick
        end
      end
    end
  end
  object btPreplayScenario: TButton
    Left = 16
    Top = 272
    Width = 104
    Height = 25
    Caption = 'Preplay Scenario...'
    TabOrder = 2
    OnClick = btPreplayScenarioClick
  end
  object btOK: TButton
    Left = 171
    Top = 271
    Width = 73
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btOKClick
  end
  object btCancel: TButton
    Left = 250
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btCancelClick
  end
  object Apply: TButton
    Left = 331
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 5
    OnClick = ApplyClick
  end
end
