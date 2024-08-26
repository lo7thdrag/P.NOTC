object fMissileSummary: TfMissileSummary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Missile'
  ClientHeight = 705
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 496
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 10
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClassMissile: TEdit
      Left = 10
      Top = 20
      Width = 463
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 664
    Width = 496
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnApply: TButton
      Left = 415
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 330
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 245
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 496
    Height = 615
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 6
      Width = 480
      Height = 603
      ActivePage = Physical
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label1: TLabel
          Left = 15
          Top = 175
          Width = 108
          Height = 13
          Caption = 'Primary Target domain'
        end
        object Label2: TLabel
          Left = 15
          Top = 202
          Width = 87
          Height = 13
          Caption = 'Detectability Type'
        end
        object Label3: TLabel
          Left = 137
          Top = 175
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label4: TLabel
          Left = 137
          Top = 202
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label5: TLabel
          Left = 15
          Top = 229
          Width = 120
          Height = 13
          Caption = 'Mid Course Update Mode'
        end
        object Label6: TLabel
          Left = 137
          Top = 229
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label7: TLabel
          Left = 15
          Top = 272
          Width = 281
          Height = 13
          Caption = 'Maximum Altitude Difference between Platform and Target'
        end
        object Label8: TLabel
          Left = 316
          Top = 272
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 407
          Top = 272
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 3
          Width = 222
          Height = 65
          Caption = 'Capabilities'
          TabOrder = 0
          object cbxAntiAir: TCheckBox
            Left = 11
            Top = 16
            Width = 54
            Height = 17
            Caption = 'Anti-Air'
            TabOrder = 0
          end
          object cbxAntiSurface: TCheckBox
            Left = 11
            Top = 39
            Width = 78
            Height = 17
            Caption = 'Anti-Surface'
            TabOrder = 1
          end
          object cbxAntiSubsurface: TCheckBox
            Left = 123
            Top = 16
            Width = 96
            Height = 17
            Caption = 'Anti-Subsurface'
            TabOrder = 2
          end
          object cbxAntiLand: TCheckBox
            Left = 123
            Top = 39
            Width = 78
            Height = 17
            Caption = 'Anti-Land'
            TabOrder = 3
          end
        end
        object grbHomeOnJammer: TGroupBox
          Left = 231
          Top = 3
          Width = 222
          Height = 65
          Caption = 'Home On Jammer Type'
          TabOrder = 1
          object cbxTypeA: TCheckBox
            Left = 11
            Top = 16
            Width = 54
            Height = 17
            Caption = 'Type A'
            TabOrder = 0
          end
          object cbxTypeB: TCheckBox
            Left = 11
            Top = 39
            Width = 78
            Height = 17
            Caption = 'Type B'
            TabOrder = 1
          end
          object cbxTypeC: TCheckBox
            Left = 123
            Top = 16
            Width = 70
            Height = 17
            Caption = 'Type C'
            TabOrder = 2
          end
        end
        object grbLaunchSettingGeneral: TGroupBox
          Left = 3
          Top = 74
          Width = 450
          Height = 82
          Caption = 'Launch Setting'
          TabOrder = 2
          object lbl4: TLabel
            Left = 12
            Top = 28
            Width = 36
            Height = 13
            Caption = 'Method'
          end
          object lbl5: TLabel
            Left = 12
            Top = 55
            Width = 121
            Height = 13
            Caption = 'Initial Commanded Speed'
          end
          object Label134: TLabel
            Left = 134
            Top = 28
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label135: TLabel
            Left = 134
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object cbMethod: TComboBox
            Left = 140
            Top = 24
            Width = 273
            Height = 21
            TabOrder = 0
            Items.Strings = (
              'Aimpoint Only Launch'
              'Bearing Only Launch'
              'Aimpoint or Bearing Launch'
              'Direct Launch')
          end
          object cbInitialCommanded: TComboBox
            Left = 140
            Top = 51
            Width = 273
            Height = 21
            TabOrder = 1
            Items.Strings = (
              'Minimum'
              'Cruise'
              'High'
              'Maximum')
          end
        end
        object grbHybridTorpedo: TGroupBox
          Left = 3
          Top = 304
          Width = 450
          Height = 52
          TabOrder = 3
          object sbbtnSearch: TSpeedButton
            Left = 404
            Top = 16
            Width = 23
            Height = 22
            Caption = '...'
            OnClick = sbbtnSearchClick
          end
          object edtHybridTorpedoDef: TEdit
            Left = 12
            Top = 16
            Width = 386
            Height = 21
            Enabled = False
            TabOrder = 0
          end
        end
        object grbLethality: TGroupBox
          Left = 3
          Top = 362
          Width = 450
          Height = 58
          Caption = 'Lethality'
          TabOrder = 4
          object Label120: TLabel
            Left = 332
            Top = 42
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object Label119: TLabel
            Left = 19
            Top = 42
            Width = 6
            Height = 13
            Caption = '0'
          end
          object edtLethality: TEdit
            Left = 378
            Top = 15
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarLethality: TTrackBar
            Left = 12
            Top = 13
            Width = 360
            Height = 28
            Max = 100000
            Frequency = 20000
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarLethalityChange
          end
        end
        object cbPrimaryTarget: TComboBox
          Left = 143
          Top = 171
          Width = 273
          Height = 21
          TabOrder = 5
          Items.Strings = (
            'Air to Surface/Subsurface'
            'Surface/Subsurface to Surface/Subsurface'
            'Surface/Subsurface to Air'
            'Air to Air'
            'Land Attack')
        end
        object cbDetectabilityType: TComboBox
          Left = 143
          Top = 198
          Width = 273
          Height = 21
          TabOrder = 6
          Items.Strings = (
            'Normal Detection'
            'Undetectable'
            'Passive Detection'
            'Always Visible')
        end
        object cbMidCourse: TComboBox
          Left = 143
          Top = 225
          Width = 273
          Height = 21
          TabOrder = 7
          Items.Strings = (
            'Switch Missile Target Designation'
            'Change Cruise Phase waypoints'
            'None'
            'HF'
            'UHF'
            'SATCOM')
        end
        object edtMaxAltitude: TEdit
          Left = 326
          Top = 269
          Width = 75
          Height = 21
          TabOrder = 8
        end
        object cbxHybridTorpedo: TCheckBox
          Left = 14
          Top = 297
          Width = 147
          Height = 17
          Caption = 'Hybrid Torpedo Definition'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 9
        end
        object grbDamageSustainability: TGroupBox
          Left = 3
          Top = 426
          Width = 450
          Height = 58
          Caption = 'Damage Sustainability'
          TabOrder = 10
          object Label10: TLabel
            Left = 332
            Top = 42
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object Label11: TLabel
            Left = 19
            Top = 42
            Width = 6
            Height = 13
            Caption = '0'
          end
          object edtDamage: TEdit
            Left = 378
            Top = 15
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarDamage: TTrackBar
            Left = 12
            Top = 13
            Width = 360
            Height = 23
            Max = 100000
            Frequency = 20000
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarDamageChange
          end
        end
        object grbProbabilityOfHit: TGroupBox
          Left = 3
          Top = 490
          Width = 450
          Height = 58
          Caption = 'Probability of Hit'
          TabOrder = 11
          object Label12: TLabel
            Left = 343
            Top = 42
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label13: TLabel
            Left = 19
            Top = 42
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object EditProbability: TEdit
            Left = 378
            Top = 15
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarProbability: TTrackBar
            Left = 12
            Top = 13
            Width = 360
            Height = 23
            Max = 100000
            Frequency = 20000
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarProbabilityChange
          end
        end
      end
      object Physical: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object sbbtnsearchMotion: TSpeedButton
          Left = 418
          Top = 144
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = sbbtnsearchMotionClick
        end
        object Label15: TLabel
          Left = 3
          Top = 125
          Width = 113
          Height = 13
          Caption = 'Motion Characteristics :'
        end
        object Bevel1: TBevel
          Left = 3
          Top = 308
          Width = 456
          Height = 3
        end
        object Label36: TLabel
          Left = 3
          Top = 317
          Width = 78
          Height = 13
          Caption = 'Cross-Sections :'
        end
        object grbDimensions: TGroupBox
          Left = 3
          Top = 1
          Width = 456
          Height = 118
          Caption = 'Dimensions'
          TabOrder = 0
          object Label16: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label17: TLabel
            Left = 167
            Top = 23
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label18: TLabel
            Left = 11
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Width'
          end
          object Label19: TLabel
            Left = 99
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label20: TLabel
            Left = 167
            Top = 55
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label21: TLabel
            Left = 11
            Top = 87
            Width = 31
            Height = 13
            Caption = 'Height'
          end
          object Label22: TLabel
            Left = 99
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 167
            Top = 87
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label24: TLabel
            Left = 247
            Top = 22
            Width = 94
            Height = 13
            Caption = 'Engagement Range '
            WordWrap = True
          end
          object Label25: TLabel
            Left = 347
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label26: TLabel
            Left = 415
            Top = 23
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label14: TLabel
            Left = 11
            Top = 23
            Width = 33
            Height = 13
            Caption = 'Length'
          end
          object edtLengthDimension: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtWidthDimension: TEdit
            Left = 109
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtHeightDimension: TEdit
            Left = 109
            Top = 83
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object edtEngagementRangeDimension: TEdit
            Left = 357
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 3
          end
        end
        object edtMotionCharacteristic: TEdit
          Left = 3
          Top = 144
          Width = 409
          Height = 21
          TabOrder = 1
        end
        object grbBoosterSeparation: TGroupBox
          Left = 3
          Top = 180
          Width = 222
          Height = 117
          TabOrder = 2
          object Label27: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label28: TLabel
            Left = 167
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label29: TLabel
            Left = 11
            Top = 55
            Width = 49
            Height = 13
            Caption = 'Box Width'
          end
          object Label30: TLabel
            Left = 99
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label31: TLabel
            Left = 167
            Top = 55
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label32: TLabel
            Left = 11
            Top = 87
            Width = 52
            Height = 13
            Caption = 'Box Height'
          end
          object Label33: TLabel
            Left = 99
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label34: TLabel
            Left = 167
            Top = 87
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label35: TLabel
            Left = 11
            Top = 23
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object edtRangeBooster: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtBoxWeightBooster: TEdit
            Left = 109
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtBoxHeightBooster: TEdit
            Left = 109
            Top = 83
            Width = 52
            Height = 21
            TabOrder = 2
          end
        end
        object cbxBoosterSeparation: TCheckBox
          Left = 17
          Top = 171
          Width = 160
          Height = 17
          Caption = 'Booster Separation Required'
          TabOrder = 3
        end
        object grbRadarPhysical: TGroupBox
          Left = 3
          Top = 336
          Width = 222
          Height = 74
          Caption = 'Radar'
          TabOrder = 4
          object Label37: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label38: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object edtFrontRadarPhysical: TEdit
            Left = 82
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbFrontRadarPhysical: TComboBox
            Left = 140
            Top = 16
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = 'dB m'#178
          end
          object edtSideRadarPhysical: TEdit
            Left = 82
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object cbSideRadarPhysical: TComboBox
            Left = 140
            Top = 43
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = 'dB m'#178
          end
        end
        object grbVisualPhysical: TGroupBox
          Left = 231
          Top = 336
          Width = 222
          Height = 74
          Caption = 'Visual/Electro-Optical'
          TabOrder = 5
          object Label39: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label40: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object Label41: TLabel
            Left = 167
            Top = 21
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label42: TLabel
            Left = 167
            Top = 45
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object edtFrontVisualPhysical: TEdit
            Left = 109
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideVisualPhysical: TEdit
            Left = 109
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbInfraredPhysical: TGroupBox
          Left = 3
          Top = 416
          Width = 222
          Height = 74
          Caption = 'Infrared'
          TabOrder = 6
          object Label43: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label44: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object Label45: TLabel
            Left = 172
            Top = 21
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label46: TLabel
            Left = 172
            Top = 45
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object edtFrontInfraredPhysical: TEdit
            Left = 114
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideInfraredPhysical: TEdit
            Left = 114
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'POH Modifier'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbMissile: TGroupBox
          Left = 2
          Top = 3
          Width = 457
          Height = 174
          Caption = 'Missile'
          TabOrder = 0
          object Label100: TLabel
            Left = 9
            Top = 20
            Width = 68
            Height = 13
            Caption = 'Anti-Radiation'
          end
          object Label103: TLabel
            Left = 9
            Top = 57
            Width = 40
            Height = 13
            Caption = 'Infrared'
          end
          object Label104: TLabel
            Left = 110
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label105: TLabel
            Left = 110
            Top = 57
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label106: TLabel
            Left = 9
            Top = 95
            Width = 27
            Height = 13
            Caption = 'SARH'
          end
          object Label107: TLabel
            Left = 110
            Top = 95
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label108: TLabel
            Left = 9
            Top = 132
            Width = 27
            Height = 13
            Caption = 'TARH'
          end
          object Label109: TLabel
            Left = 110
            Top = 132
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label110: TLabel
            Left = 120
            Top = 158
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label128: TLabel
            Left = 369
            Top = 158
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtAntiRadiationMissile: TEdit
            Left = 396
            Top = 17
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object edtInfraredMissile: TEdit
            Left = 396
            Top = 54
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object edtSARHMissile: TEdit
            Left = 396
            Top = 91
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object edtTARHMissile: TEdit
            Left = 396
            Top = 127
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object TrackBarAntiRadiationMissile: TTrackBar
            Left = 120
            Top = 20
            Width = 270
            Height = 29
            Max = 100
            Frequency = 25
            TabOrder = 4
            ThumbLength = 15
            OnChange = TrackBarAntiRadiationMissileChange
          end
          object TrackBarInfraredMissile: TTrackBar
            Left = 120
            Top = 57
            Width = 270
            Height = 29
            Max = 100
            Frequency = 25
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarInfraredMissileChange
          end
          object TrackBarSARHMissile: TTrackBar
            Left = 120
            Top = 93
            Width = 270
            Height = 29
            Max = 100
            Frequency = 25
            TabOrder = 6
            ThumbLength = 15
            OnChange = TrackBarSARHMissileChange
          end
          object TrackBarTARHMissile: TTrackBar
            Left = 120
            Top = 128
            Width = 270
            Height = 29
            Max = 100
            Frequency = 25
            TabOrder = 7
            ThumbLength = 15
            OnChange = TrackBarTARHMissileChange
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Guidance'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label94: TLabel
          Left = 330
          Top = 523
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label101: TLabel
          Left = 14
          Top = 523
          Width = 105
          Height = 13
          Caption = 'Maximum Firing Depth'
        end
        object Label102: TLabel
          Left = 330
          Top = 550
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label111: TLabel
          Left = 398
          Top = 550
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label112: TLabel
          Left = 14
          Top = 550
          Width = 108
          Height = 13
          Caption = 'Default Cruise Altitude'
        end
        object Label113: TLabel
          Left = 398
          Top = 522
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object grbLaunchSettingGuidance: TGroupBox
          Left = 3
          Top = 3
          Width = 450
          Height = 102
          Caption = 'Launch Setting'
          TabOrder = 0
          object Label47: TLabel
            Left = 12
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Primary'
          end
          object Label48: TLabel
            Left = 12
            Top = 47
            Width = 51
            Height = 13
            Caption = 'Secondary'
          end
          object Label49: TLabel
            Left = 134
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label50: TLabel
            Left = 134
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label51: TLabel
            Left = 12
            Top = 74
            Width = 33
            Height = 13
            Caption = 'Pursuit'
          end
          object Label52: TLabel
            Left = 134
            Top = 74
            Width = 4
            Height = 13
            Caption = ':'
          end
          object cbPrimaryLaunchGuidance: TComboBox
            Left = 140
            Top = 16
            Width = 273
            Height = 21
            TabOrder = 0
            Items.Strings = (
              'Semi-Active Radar Homing'
              'Terminal-Active Radar Homing'
              'Infrared Homing'
              'Anti-Radiation'
              'Straight'
              'Hybrid(Stand of ASW)')
          end
          object cbSecondaryLaunchGuidance: TComboBox
            Left = 140
            Top = 43
            Width = 273
            Height = 21
            TabOrder = 1
            Items.Strings = (
              'None'
              'Infrared Homing'
              'Anti-Radiation')
          end
          object cbPursuitLaunchGuidance: TComboBox
            Left = 140
            Top = 70
            Width = 93
            Height = 21
            TabOrder = 2
            Items.Strings = (
              'Lead'
              'Pure')
          end
        end
        object grbRangeGuidance: TGroupBox
          Left = 3
          Top = 119
          Width = 222
          Height = 82
          Caption = 'Range'
          TabOrder = 1
          object Label53: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label54: TLabel
            Left = 167
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label55: TLabel
            Left = 11
            Top = 55
            Width = 44
            Height = 13
            Caption = 'Maximum'
          end
          object Label56: TLabel
            Left = 99
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label57: TLabel
            Left = 167
            Top = 55
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label61: TLabel
            Left = 11
            Top = 23
            Width = 40
            Height = 13
            Caption = 'Minimum'
          end
          object edtMinRangeGuide: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtMaxRangeGuide: TEdit
            Left = 109
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbFlyGuidance: TGroupBox
          Left = 231
          Top = 127
          Width = 222
          Height = 74
          TabOrder = 2
          object Label58: TLabel
            Left = 99
            Top = 15
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label59: TLabel
            Left = 167
            Top = 15
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label60: TLabel
            Left = 11
            Top = 47
            Width = 37
            Height = 13
            Caption = 'Altitude'
          end
          object Label62: TLabel
            Left = 99
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label63: TLabel
            Left = 167
            Top = 47
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label67: TLabel
            Left = 11
            Top = 15
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object edtRangeFlyGuide: TEdit
            Left = 109
            Top = 11
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtAltitudeFlyGuide: TEdit
            Left = 109
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object cbxFlyOutRequired: TCheckBox
          Left = 242
          Top = 119
          Width = 103
          Height = 17
          Caption = 'Fly Out Required'
          TabOrder = 3
        end
        object grbTerminalGuidance: TGroupBox
          Left = 3
          Top = 207
          Width = 222
          Height = 170
          Caption = 'Terminal Guidance'
          TabOrder = 4
          object Label64: TLabel
            Left = 100
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label65: TLabel
            Left = 168
            Top = 47
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label66: TLabel
            Left = 12
            Top = 74
            Width = 37
            Height = 13
            Caption = 'Altitude'
          end
          object Label68: TLabel
            Left = 100
            Top = 74
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label69: TLabel
            Left = 168
            Top = 74
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label70: TLabel
            Left = 12
            Top = 47
            Width = 58
            Height = 13
            Caption = 'Start Range'
          end
          object Label71: TLabel
            Left = 12
            Top = 20
            Width = 47
            Height = 13
            Caption = 'Capability'
          end
          object Label72: TLabel
            Left = 100
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label73: TLabel
            Left = 100
            Top = 101
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label74: TLabel
            Left = 168
            Top = 101
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label75: TLabel
            Left = 12
            Top = 128
            Width = 47
            Height = 13
            Caption = 'Amplitude'
          end
          object Label76: TLabel
            Left = 100
            Top = 128
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label77: TLabel
            Left = 168
            Top = 128
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label78: TLabel
            Left = 12
            Top = 101
            Width = 30
            Height = 13
            Caption = 'Period'
          end
          object edtStartRangeTerminalGuidance: TEdit
            Left = 110
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtAltitudeTerminalGuidance: TEdit
            Left = 110
            Top = 70
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object cbCapabilityTerminalGuidance: TComboBox
            Left = 110
            Top = 16
            Width = 67
            Height = 21
            TabOrder = 2
            Text = 'Sinuation'
          end
          object edtPeriodTerminalGuidance: TEdit
            Left = 110
            Top = 97
            Width = 52
            Height = 21
            TabOrder = 3
          end
          object edtAmplitudeTerminalGuidance: TEdit
            Left = 110
            Top = 124
            Width = 52
            Height = 21
            TabOrder = 4
          end
        end
        object grbSeekerTurnOnGuidance: TGroupBox
          Left = 231
          Top = 207
          Width = 222
          Height = 69
          Caption = 'Seeker Turn-On Range'
          TabOrder = 5
          object Label79: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label80: TLabel
            Left = 167
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label84: TLabel
            Left = 11
            Top = 23
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object edtRangeSeekerTurnGuidance: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbxRangeSeekerTurnGuidance: TCheckBox
            Left = 11
            Top = 46
            Width = 150
            Height = 17
            Caption = 'Range Operator Modifiable'
            TabOrder = 1
          end
        end
        object grbSeekerDetectionEnvelopeGuidance: TGroupBox
          Left = 231
          Top = 282
          Width = 222
          Height = 95
          Caption = 'Seeker Detection Envelope'
          TabOrder = 6
          object Label81: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label82: TLabel
            Left = 167
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label83: TLabel
            Left = 11
            Top = 23
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object Label85: TLabel
            Left = 99
            Top = 46
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label86: TLabel
            Left = 167
            Top = 46
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object Label87: TLabel
            Left = 11
            Top = 46
            Width = 38
            Height = 13
            Caption = 'Azimuth'
          end
          object Label88: TLabel
            Left = 99
            Top = 69
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label89: TLabel
            Left = 167
            Top = 69
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object Label90: TLabel
            Left = 11
            Top = 69
            Width = 44
            Height = 13
            Caption = 'Elevation'
          end
          object edtRangeSeekerDetectionGuidance: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtAzimuthSeekerDetectionGuidance: TEdit
            Left = 109
            Top = 42
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtElevationSeekerDetectionGuidance: TEdit
            Left = 109
            Top = 65
            Width = 52
            Height = 21
            TabOrder = 2
          end
        end
        object grbTerminalAcquisition: TGroupBox
          Left = 3
          Top = 391
          Width = 450
          Height = 42
          TabOrder = 7
          object Label91: TLabel
            Left = 327
            Top = 15
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label92: TLabel
            Left = 395
            Top = 15
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label96: TLabel
            Left = 11
            Top = 15
            Width = 99
            Height = 13
            Caption = 'Commanded Altitude'
          end
          object edtCommandAltitudeGuidance: TEdit
            Left = 337
            Top = 11
            Width = 52
            Height = 21
            TabOrder = 0
          end
        end
        object cbxTerminalAcqGuidance: TCheckBox
          Left = 14
          Top = 383
          Width = 203
          Height = 17
          Caption = 'Terminal Acquisition Altitude Required'
          TabOrder = 8
        end
        object grbWaypointUser: TGroupBox
          Left = 3
          Top = 447
          Width = 450
          Height = 66
          TabOrder = 9
          object Label93: TLabel
            Left = 327
            Top = 15
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label95: TLabel
            Left = 11
            Top = 15
            Width = 191
            Height = 13
            Caption = 'Maximum Numbers of Waypoint Allowed'
          end
          object Label97: TLabel
            Left = 327
            Top = 42
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label98: TLabel
            Left = 395
            Top = 42
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label99: TLabel
            Left = 11
            Top = 42
            Width = 170
            Height = 13
            Caption = 'Minimum Final Waypoint Leg Length'
          end
          object edtmaxNumWaypointGuidance: TEdit
            Left = 337
            Top = 11
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtMinFinalWaypointGuidance: TEdit
            Left = 337
            Top = 38
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object cbxWaypointUserGuidance: TCheckBox
          Left = 14
          Top = 439
          Width = 151
          Height = 17
          Caption = 'Waypoint User for Guidance'
          TabOrder = 10
        end
        object edtMaxFiringGuidance: TEdit
          Left = 340
          Top = 519
          Width = 52
          Height = 21
          TabOrder = 11
        end
        object edtDefaultCruiseGuidance: TEdit
          Left = 340
          Top = 546
          Width = 52
          Height = 21
          TabOrder = 12
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'TARH/AR Setting'
        ImageIndex = 4
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label114: TLabel
          Left = 12
          Top = 20
          Width = 55
          Height = 13
          Caption = 'ECCM Type'
        end
        object Label115: TLabel
          Left = 82
          Top = 20
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label116: TLabel
          Left = 323
          Top = 21
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label117: TLabel
          Left = 255
          Top = 20
          Width = 62
          Height = 13
          Caption = 'Spot Number'
        end
        object cbPrimaryTARH: TComboBox
          Left = 92
          Top = 17
          Width = 117
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'A'
            'B'
            'C')
        end
        object edtRangeTARH: TEdit
          Left = 333
          Top = 17
          Width = 84
          Height = 21
          TabOrder = 1
        end
        object grbECM: TGroupBox
          Left = 3
          Top = 51
          Width = 450
          Height = 78
          Caption = 'ECM'
          TabOrder = 2
          object Label118: TLabel
            Left = 12
            Top = 20
            Width = 53
            Height = 13
            Caption = 'Detonation'
          end
          object Label121: TLabel
            Left = 12
            Top = 47
            Width = 46
            Height = 13
            Caption = 'Detection'
          end
          object Label122: TLabel
            Left = 134
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label123: TLabel
            Left = 134
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object cbDetonationECMTARH: TComboBox
            Left = 140
            Top = 16
            Width = 273
            Height = 21
            TabOrder = 0
            Items.Strings = (
              'On Chaff')
          end
          object cbDetectionECMTARH: TComboBox
            Left = 140
            Top = 43
            Width = 273
            Height = 21
            TabOrder = 1
            Items.Strings = (
              'Chaff')
          end
        end
        object grnTerminalGuidanceTARH: TGroupBox
          Left = 3
          Top = 135
          Width = 450
          Height = 154
          Caption = 'Terminal Guidance'
          TabOrder = 3
          object Label124: TLabel
            Left = 192
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label125: TLabel
            Left = 283
            Top = 47
            Width = 17
            Height = 13
            Caption = 'kHz'
          end
          object Label126: TLabel
            Left = 12
            Top = 74
            Width = 56
            Height = 13
            Caption = 'Pulse Width'
          end
          object Label127: TLabel
            Left = 192
            Top = 74
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label129: TLabel
            Left = 283
            Top = 74
            Width = 64
            Height = 13
            Caption = 'microseconds'
          end
          object Label130: TLabel
            Left = 12
            Top = 47
            Width = 77
            Height = 13
            Caption = 'Pulse Repetition'
          end
          object Label131: TLabel
            Left = 12
            Top = 20
            Width = 51
            Height = 13
            Caption = 'Frequency'
          end
          object Label132: TLabel
            Left = 192
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label133: TLabel
            Left = 192
            Top = 101
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label136: TLabel
            Left = 283
            Top = 101
            Width = 38
            Height = 13
            Caption = 'deg/sec'
          end
          object Label137: TLabel
            Left = 12
            Top = 128
            Width = 88
            Height = 13
            Caption = 'Transmitter Power'
          end
          object Label138: TLabel
            Left = 192
            Top = 128
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label139: TLabel
            Left = 283
            Top = 128
            Width = 34
            Height = 13
            Caption = 'kWatts'
          end
          object Label140: TLabel
            Left = 12
            Top = 101
            Width = 49
            Height = 13
            Caption = 'Scan Rate'
          end
          object Label141: TLabel
            Left = 283
            Top = 20
            Width = 20
            Height = 13
            Caption = 'MHz'
          end
          object edtPulseRepTerminalTARH: TEdit
            Left = 202
            Top = 43
            Width = 75
            Height = 21
            TabOrder = 0
          end
          object edtPulseWidthTerminalTARH: TEdit
            Left = 202
            Top = 70
            Width = 75
            Height = 21
            TabOrder = 1
          end
          object edtScanRateTerminalTARH: TEdit
            Left = 202
            Top = 97
            Width = 75
            Height = 21
            TabOrder = 2
          end
          object edtTransmitterPowerTerminalTARH: TEdit
            Left = 202
            Top = 124
            Width = 75
            Height = 21
            TabOrder = 3
          end
          object edtFreqTerminalTARH: TEdit
            Left = 202
            Top = 16
            Width = 75
            Height = 21
            TabOrder = 4
          end
        end
        object grbReceivedFreqTARH: TGroupBox
          Left = 3
          Top = 295
          Width = 450
          Height = 74
          Caption = 'Received Frequency'
          TabOrder = 4
          object Label142: TLabel
            Left = 192
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label143: TLabel
            Left = 283
            Top = 47
            Width = 20
            Height = 13
            Caption = 'MHz'
          end
          object Label147: TLabel
            Left = 12
            Top = 47
            Width = 53
            Height = 13
            Caption = 'Lower Limit'
          end
          object Label148: TLabel
            Left = 12
            Top = 20
            Width = 53
            Height = 13
            Caption = 'Upper Limit'
          end
          object Label149: TLabel
            Left = 192
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label156: TLabel
            Left = 283
            Top = 20
            Width = 20
            Height = 13
            Caption = 'MHz'
          end
          object edtLowerLimitReceivedFreqTARH: TEdit
            Left = 202
            Top = 43
            Width = 75
            Height = 21
            TabOrder = 0
          end
          object edtUpperLimitReceivedFreqTARH: TEdit
            Left = 202
            Top = 16
            Width = 75
            Height = 21
            TabOrder = 1
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Notes'
        ImageIndex = 5
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 456
          Height = 558
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
