object frmSummaryResourceAllocation: TfrmSummaryResourceAllocation
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Resource Allocation'
  ClientHeight = 358
  ClientWidth = 432
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
  object pnl2: TPanel
    Left = 0
    Top = 52
    Width = 432
    Height = 265
    Align = alBottom
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 8
      Top = 1
      Width = 417
      Height = 261
      ActivePage = Platforms
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object btnBrowseEnvironment: TSpeedButton
          Left = 383
          Top = 72
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btnBrowseEnvironmentClick
        end
        object btnBrowseDefaults: TSpeedButton
          Left = 383
          Top = 122
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btnBrowseDefaultsClick
        end
        object edtStartTime: TEdit
          Left = 204
          Top = 34
          Width = 173
          Height = 21
          TabOrder = 0
          OnChange = edtNameChange
        end
        object lblStartTime: TStaticText
          Left = 146
          Top = 11
          Width = 60
          Height = 17
          Caption = 'Start Time :'
          TabOrder = 1
        end
        object lblEnvironment: TStaticText
          Left = 16
          Top = 56
          Width = 64
          Height = 17
          Caption = 'Environment'
          TabOrder = 2
        end
        object edtEnvironment: TEdit
          Left = 16
          Top = 72
          Width = 361
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '[None]'
          OnChange = edtNameChange
        end
        object lblDefaults: TStaticText
          Left = 16
          Top = 107
          Width = 44
          Height = 17
          Caption = 'Defaults'
          TabOrder = 4
        end
        object edtDefaults: TEdit
          Left = 16
          Top = 122
          Width = 361
          Height = 21
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '[None]'
          OnChange = edtNameChange
        end
        object btnStudentRoleList: TButton
          Left = 16
          Top = 160
          Width = 217
          Height = 25
          Caption = 'Student Role List...'
          TabOrder = 6
          OnClick = btnStudentRoleListClick
        end
        object btnRuntimePlatformLibraries: TButton
          Left = 16
          Top = 191
          Width = 217
          Height = 25
          Caption = 'Runtime Platform Libraries...'
          TabOrder = 7
          OnClick = btnRuntimePlatformLibrariesClick
        end
        object lbTextTime: TStaticText
          Left = 212
          Top = 11
          Width = 8
          Height = 17
          Caption = '-'
          TabOrder = 8
        end
      end
      object Platforms: TTabSheet
        Caption = 'Platforms'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbForcePlatforms: TGroupBox
          Left = 11
          Top = 8
          Width = 118
          Height = 185
          Caption = 'Force'
          TabOrder = 0
          object rbRedPlatforms: TRadioButton
            Left = 5
            Top = 32
            Width = 110
            Height = 17
            Caption = 'Red'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbAmberPlatforms: TRadioButton
            Left = 5
            Top = 52
            Width = 100
            Height = 17
            Caption = 'Yellow'
            TabOrder = 1
          end
          object rbBluePlatforms: TRadioButton
            Left = 5
            Top = 75
            Width = 110
            Height = 17
            Caption = 'Blue'
            TabOrder = 2
          end
          object rbGreenPlatforms: TRadioButton
            Left = 5
            Top = 97
            Width = 110
            Height = 17
            Caption = 'Green'
            TabOrder = 3
          end
          object rbNoPlatforms: TRadioButton
            Left = 5
            Top = 119
            Width = 110
            Height = 17
            Caption = 'No Force'
            TabOrder = 4
          end
        end
        object grbPlatforms: TGroupBox
          Left = 135
          Top = 8
          Width = 271
          Height = 185
          Caption = 'Platforms'
          TabOrder = 1
          object btnVehicle: TButton
            Left = 11
            Top = 28
            Width = 118
            Height = 25
            Caption = 'Vehicle...'
            TabOrder = 0
            OnClick = btnVehicleClick
          end
          object btnMissile: TButton
            Left = 135
            Top = 28
            Width = 118
            Height = 25
            Caption = 'Missile...'
            TabOrder = 1
            OnClick = btnMissileClick
          end
          object btnTorpedo: TButton
            Left = 11
            Top = 74
            Width = 118
            Height = 25
            Caption = 'Torpedo...'
            TabOrder = 2
            OnClick = btnTorpedoClick
          end
          object btnSonobuoy: TButton
            Left = 135
            Top = 74
            Width = 118
            Height = 25
            Caption = 'Sonobuoy...'
            TabOrder = 3
            OnClick = btnSonobuoyClick
          end
          object btnMine: TButton
            Left = 11
            Top = 116
            Width = 118
            Height = 25
            Caption = 'Mine...'
            TabOrder = 4
            OnClick = btnMineClick
          end
          object btnSatelite: TButton
            Left = 135
            Top = 116
            Width = 118
            Height = 25
            Caption = 'Satellite...'
            TabOrder = 5
            OnClick = btnSateliteClick
          end
        end
      end
      object Resources: TTabSheet
        Caption = 'Resources'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbForceResources: TGroupBox
          Left = 11
          Top = 8
          Width = 118
          Height = 185
          Caption = 'Force'
          TabOrder = 0
          object rbRedResources: TRadioButton
            Left = 5
            Top = 32
            Width = 92
            Height = 17
            Caption = 'Red'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object rbAmberResources: TRadioButton
            Left = 5
            Top = 52
            Width = 92
            Height = 17
            Caption = 'Yellow'
            TabOrder = 1
          end
          object rbBlueResources: TRadioButton
            Left = 5
            Top = 75
            Width = 92
            Height = 17
            Caption = 'Blue'
            TabOrder = 2
          end
          object rbGreenResources: TRadioButton
            Left = 5
            Top = 97
            Width = 92
            Height = 17
            Caption = 'Green'
            TabOrder = 3
          end
          object rbNoForceResources: TRadioButton
            Left = 5
            Top = 119
            Width = 92
            Height = 17
            Caption = 'No Force'
            TabOrder = 4
          end
        end
        object grbResources: TGroupBox
          Left = 135
          Top = 8
          Width = 271
          Height = 185
          Caption = 'Resources'
          TabOrder = 1
          object btnReferencePointsResources: TButton
            Left = 11
            Top = 28
            Width = 118
            Height = 25
            Caption = 'Reference Points...'
            TabOrder = 0
            OnClick = btnReferencePointsResourcesClick
          end
          object btnPredifenedPatterns: TButton
            Left = 135
            Top = 28
            Width = 118
            Height = 25
            Caption = 'Predefined Patterns...'
            TabOrder = 1
            OnClick = btnPredifenedPatternsClick
          end
          object btnOverlaysResources: TButton
            Left = 11
            Top = 74
            Width = 118
            Height = 25
            Caption = 'Overlays...'
            TabOrder = 2
            OnClick = btnOverlaysResourcesClick
          end
          object btnRadarIntervalLists: TButton
            Left = 135
            Top = 74
            Width = 118
            Height = 25
            Caption = 'Radar Interval Lists...'
            TabOrder = 3
            OnClick = btnRadarIntervalListsClick
          end
          object btnCommunicationResources: TButton
            Left = 11
            Top = 116
            Width = 242
            Height = 25
            Caption = 'Communication Channels ...'
            TabOrder = 4
            OnClick = btnCommunicationResourcesClick
          end
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 317
    Width = 432
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 350
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 269
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 188
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = -8
    Width = 432
    Height = 60
    Align = alBottom
    TabOrder = 2
    object lblName: TStaticText
      Left = 8
      Top = 17
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 8
      Top = 32
      Width = 410
      Height = 21
      TabOrder = 1
      Text = '[Noname]'
      OnChange = edtNameChange
    end
  end
end
