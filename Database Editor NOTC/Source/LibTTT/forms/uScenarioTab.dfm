object ScenarioGeneralTabForm: TScenarioGeneralTabForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Scenario'
  ClientHeight = 417
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 407
    Height = 57
    Align = alTop
    TabOrder = 0
    object Name: TLabel
      Left = 16
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object edtName: TEdit
      Left = 16
      Top = 22
      Width = 385
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 376
    Width = 407
    Height = 41
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object btnOK: TButton
      Left = 161
      Top = 5
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 242
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnApply: TButton
      Left = 323
      Top = 5
      Width = 78
      Height = 25
      Caption = 'Apply'
      TabOrder = 2
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 48
    Width = 407
    Height = 328
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 2
    object tab: TPageControl
      Left = 1
      Top = 1
      Width = 405
      Height = 326
      ActivePage = TabGeneral
      Align = alClient
      TabOrder = 0
      object TabGeneral: TTabSheet
        Caption = 'General'
        object lblResource: TLabel
          Left = 8
          Top = 11
          Width = 97
          Height = 13
          Caption = ' Resource Allocation'
        end
        object btnBrowse: TSpeedButton
          Left = 327
          Top = 30
          Width = 23
          Height = 22
          Caption = '...'
        end
        object edtResourceAllocation: TEdit
          Left = 8
          Top = 30
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object btnDeploy: TButton
          Left = 8
          Top = 78
          Width = 113
          Height = 25
          Caption = 'Deploy Platforms...'
          TabOrder = 1
        end
        object btnPreplayScenario: TButton
          Left = 8
          Top = 217
          Width = 113
          Height = 25
          Caption = 'Preplay Scenario...'
          TabOrder = 2
        end
      end
      object tabRelationships: TTabSheet
        Caption = 'Relationships'
        ImageIndex = 1
        object grbForce: TGroupBox
          Left = 11
          Top = 8
          Width = 118
          Height = 185
          Caption = 'Force'
          TabOrder = 0
          object rbRed: TRadioButton
            Left = 3
            Top = 16
            Width = 113
            Height = 17
            Caption = 'Red'
            TabOrder = 0
          end
          object rbYellow: TRadioButton
            Left = 3
            Top = 39
            Width = 113
            Height = 17
            Caption = 'Yellow'
            TabOrder = 1
          end
          object rbBlue: TRadioButton
            Left = 3
            Top = 62
            Width = 113
            Height = 17
            Caption = 'Blue'
            TabOrder = 2
          end
          object rbGreen: TRadioButton
            Left = 3
            Top = 85
            Width = 113
            Height = 17
            Caption = 'Green'
            TabOrder = 3
          end
          object rbNoForce: TRadioButton
            Left = 3
            Top = 103
            Width = 113
            Height = 17
            Caption = 'No Force'
            TabOrder = 4
          end
          object rbNTDS: TRadioButton
            Left = 3
            Top = 126
            Width = 113
            Height = 17
            Caption = 'NTDS'
            TabOrder = 5
          end
        end
        object grbPlatform: TGroupBox
          Left = 144
          Top = 8
          Width = 233
          Height = 185
          Caption = 'Platform Relationships'
          TabOrder = 1
          object btnGroups: TButton
            Left = 16
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Groups...'
            TabOrder = 0
          end
          object btnLinks: TButton
            Left = 16
            Top = 59
            Width = 75
            Height = 25
            Caption = 'Links...'
            TabOrder = 1
          end
        end
      end
    end
  end
end
