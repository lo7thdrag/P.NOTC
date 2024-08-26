object fTorpedoSummary: TfTorpedoSummary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Torpedo'
  ClientHeight = 700
  ClientWidth = 497
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
    Width = 497
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
    object edtClassTorpedo: TEdit
      Left = 10
      Top = 20
      Width = 463
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 659
    Width = 497
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
    Width = 497
    Height = 610
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 6
      Width = 480
      Height = 603
      ActivePage = TabSheet4
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label2: TLabel
          Left = 11
          Top = 226
          Width = 109
          Height = 13
          Caption = 'Primary Target Domain'
        end
        object Label3: TLabel
          Left = 137
          Top = 226
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label4: TLabel
          Left = 137
          Top = 254
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label7: TLabel
          Left = 11
          Top = 281
          Width = 112
          Height = 13
          Caption = 'Maximum Search Depth'
        end
        object Label8: TLabel
          Left = 137
          Top = 281
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 224
          Top = 281
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label5: TLabel
          Left = 11
          Top = 253
          Width = 87
          Height = 13
          Caption = 'Detectability Type'
        end
        object grbLaunchSettingGeneral: TGroupBox
          Left = 3
          Top = 3
          Width = 450
          Height = 82
          Caption = 'Launch Setting'
          TabOrder = 0
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
            Width = 30
            Height = 13
            Caption = 'Speed'
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
        object grbOptLaunchRange: TGroupBox
          Left = 3
          Top = 304
          Width = 450
          Height = 132
          Caption = 'Optimum Launch Range (% Maximum Range)'
          TabOrder = 1
          object Label12: TLabel
            Left = 10
            Top = 21
            Width = 89
            Height = 13
            Caption = 'Nuclear Submarine'
          end
          object Label13: TLabel
            Left = 138
            Top = 21
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label154: TLabel
            Left = 10
            Top = 51
            Width = 116
            Height = 13
            Caption = 'Conventional Submarine'
          end
          object Label155: TLabel
            Left = 138
            Top = 51
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label157: TLabel
            Left = 10
            Top = 81
            Width = 81
            Height = 13
            Caption = 'Other Submarine'
          end
          object Label158: TLabel
            Left = 138
            Top = 81
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label159: TLabel
            Left = 167
            Top = 107
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label160: TLabel
            Left = 349
            Top = 107
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtNuclearSubmarine: TEdit
            Left = 378
            Top = 17
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarNuclearSubmarine: TTrackBar
            Left = 167
            Top = 13
            Width = 205
            Height = 28
            Max = 4
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarNuclearSubmarineChange
          end
          object edtConvSubmarine: TEdit
            Left = 378
            Top = 47
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object TrackBarConvSubmarine: TTrackBar
            Left = 167
            Top = 43
            Width = 205
            Height = 28
            Max = 4
            TabOrder = 3
            ThumbLength = 15
            OnChange = TrackBarConvSubmarineChange
          end
          object edtOtherSubmarine: TEdit
            Left = 378
            Top = 77
            Width = 49
            Height = 21
            TabOrder = 4
          end
          object TrackBarOtherSubmarine: TTrackBar
            Left = 167
            Top = 73
            Width = 205
            Height = 28
            Max = 4
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarOtherSubmarineChange
          end
        end
        object grbLethality: TGroupBox
          Left = 3
          Top = 442
          Width = 450
          Height = 58
          Caption = 'Lethality'
          TabOrder = 2
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
            Max = 4
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarLethalityChange
          end
        end
        object cbPrimaryTarget: TComboBox
          Left = 143
          Top = 222
          Width = 273
          Height = 21
          TabOrder = 3
          Items.Strings = (
            'Any Within Capabilities'
            'Surface'
            'Subsurface')
        end
        object cbDetectabilityType: TComboBox
          Left = 143
          Top = 250
          Width = 273
          Height = 21
          TabOrder = 4
          Items.Strings = (
            'Normal Detection'
            'Undetectable'
            'Passive Detection'
            'Always Visible')
        end
        object edtMaxSearchDepth: TEdit
          Left = 143
          Top = 277
          Width = 75
          Height = 21
          TabOrder = 5
        end
        object grbDamageSustainability: TGroupBox
          Left = 3
          Top = 506
          Width = 450
          Height = 58
          Caption = 'Damage Sustainability'
          TabOrder = 6
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
            Max = 4
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarDamageChange
          end
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 91
          Width = 222
          Height = 65
          Caption = 'Capabilities'
          TabOrder = 7
          object cbxAntiSurface: TCheckBox
            Left = 12
            Top = 16
            Width = 91
            Height = 17
            Caption = 'Anti-Surface'
            TabOrder = 0
          end
          object cbxAntiSubSurface: TCheckBox
            Left = 11
            Top = 39
            Width = 117
            Height = 17
            Caption = 'Anti-Subsurface'
            TabOrder = 1
          end
        end
        object grbSafetyCeiling: TGroupBox
          Left = 231
          Top = 91
          Width = 222
          Height = 65
          Caption = 'Safety Ceiling'
          TabOrder = 8
          object Label144: TLabel
            Left = 99
            Top = 22
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label145: TLabel
            Left = 167
            Top = 22
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label146: TLabel
            Left = 11
            Top = 22
            Width = 29
            Height = 13
            Caption = 'Depth'
          end
          object edtDepthSafetyCeiling: TEdit
            Left = 109
            Top = 18
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbxFixDepth: TCheckBox
            Left = 11
            Top = 41
            Width = 70
            Height = 17
            Caption = 'Fix-Depth'
            TabOrder = 1
          end
        end
        object grbActiveAccoustic: TGroupBox
          Left = 3
          Top = 162
          Width = 450
          Height = 47
          Caption = 'Active Accoustic Seeker Head Transmission'
          TabOrder = 9
          object Label1: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label6: TLabel
            Left = 167
            Top = 23
            Width = 34
            Height = 13
            Caption = 'kWatts'
          end
          object Label150: TLabel
            Left = 11
            Top = 23
            Width = 30
            Height = 13
            Caption = 'Power'
          end
          object Label151: TLabel
            Left = 327
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label152: TLabel
            Left = 395
            Top = 23
            Width = 17
            Height = 13
            Caption = 'kHz'
          end
          object Label153: TLabel
            Left = 239
            Top = 23
            Width = 51
            Height = 13
            Caption = 'Frequency'
          end
          object edtPower: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtFreq: TEdit
            Left = 337
            Top = 18
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
      end
      object Physical: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
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
        object grbDimensions: TGroupBox
          Left = 3
          Top = 1
          Width = 456
          Height = 118
          Caption = 'Dimensions'
          TabOrder = 0
          object Label16: TLabel
            Left = 115
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label17: TLabel
            Left = 183
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
            Left = 115
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label20: TLabel
            Left = 183
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
            Left = 115
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 183
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
            Left = 125
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtWidthDimension: TEdit
            Left = 125
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtHeightDimension: TEdit
            Left = 125
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
        object grbAirDropCapable: TGroupBox
          Left = 3
          Top = 185
          Width = 450
          Height = 88
          TabOrder = 2
          object Label27: TLabel
            Left = 115
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label28: TLabel
            Left = 183
            Top = 23
            Width = 41
            Height = 13
            Caption = 'knot/sec'
          end
          object Label29: TLabel
            Left = 11
            Top = 55
            Width = 60
            Height = 13
            Caption = 'Decent Rate'
          end
          object Label30: TLabel
            Left = 115
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label31: TLabel
            Left = 183
            Top = 55
            Width = 40
            Height = 13
            Caption = 'feet/min'
          end
          object Label35: TLabel
            Left = 11
            Top = 23
            Width = 96
            Height = 13
            Caption = 'Lateral Deceleration'
          end
          object edtLateralDecelerationAirDrop: TEdit
            Left = 125
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtDecentRateAirDrop: TEdit
            Left = 125
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object cbxAirDropCapable: TCheckBox
          Left = 17
          Top = 175
          Width = 99
          Height = 17
          Caption = 'Air Drop Capable'
          TabOrder = 3
        end
        object grbAcousticCrossSection: TGroupBox
          Left = 3
          Top = 279
          Width = 450
          Height = 74
          Caption = 'Acoustic Cross-Section'
          TabOrder = 4
          object Label37: TLabel
            Left = 9
            Top = 20
            Width = 26
            Height = 13
            Caption = 'Front'
          end
          object Label38: TLabel
            Left = 9
            Top = 47
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label32: TLabel
            Left = 183
            Top = 20
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label33: TLabel
            Left = 183
            Top = 47
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label34: TLabel
            Left = 115
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label36: TLabel
            Left = 115
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object edtFrontAcousticCross: TEdit
            Left = 125
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideAcousticCross: TEdit
            Left = 125
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbAcousticIntensity: TGroupBox
          Left = 0
          Top = 359
          Width = 450
          Height = 154
          Caption = 'Acoustic Intensity'
          TabOrder = 5
          object Label39: TLabel
            Left = 115
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label40: TLabel
            Left = 183
            Top = 23
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label41: TLabel
            Left = 11
            Top = 55
            Width = 80
            Height = 13
            Caption = 'Below Cavitation'
          end
          object Label42: TLabel
            Left = 115
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label43: TLabel
            Left = 183
            Top = 55
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label44: TLabel
            Left = 11
            Top = 87
            Width = 83
            Height = 13
            Caption = 'Above Cavitation'
          end
          object Label45: TLabel
            Left = 115
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label46: TLabel
            Left = 183
            Top = 87
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label114: TLabel
            Left = 247
            Top = 22
            Width = 49
            Height = 26
            Caption = 'Cavitation Speed'
            WordWrap = True
          end
          object Label115: TLabel
            Left = 347
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label116: TLabel
            Left = 415
            Top = 23
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object Label117: TLabel
            Left = 11
            Top = 23
            Width = 73
            Height = 13
            Caption = 'Minimum Speed'
          end
          object Label123: TLabel
            Left = 12
            Top = 118
            Width = 77
            Height = 13
            Caption = 'Maximum Speed'
          end
          object Label124: TLabel
            Left = 115
            Top = 117
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label125: TLabel
            Left = 183
            Top = 117
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object edtMinSpeedAccoustic: TEdit
            Left = 125
            Top = 24
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtBelowCavitationAccoustic: TEdit
            Left = 125
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtAboveCavitationAccoustic: TEdit
            Left = 125
            Top = 83
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object edtCavitationSpeedAccoustic: TEdit
            Left = 357
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 3
          end
          object edtMaxSpeedAccoustic: TEdit
            Left = 125
            Top = 113
            Width = 52
            Height = 21
            TabOrder = 4
          end
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'POH Modifier'
        ImageIndex = 2
        object grbTorpedo: TGroupBox
          Left = 3
          Top = 3
          Width = 457
          Height = 214
          Caption = 'Torpedo'
          TabOrder = 0
          object Label100: TLabel
            Left = 9
            Top = 20
            Width = 65
            Height = 13
            Caption = 'Wake Homing'
          end
          object Label103: TLabel
            Left = 9
            Top = 57
            Width = 59
            Height = 13
            Caption = 'Wire-Guided'
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
            Width = 73
            Height = 13
            Caption = 'Active Acoustic'
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
            Width = 79
            Height = 13
            Caption = 'Passive Acoustic'
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
            Top = 190
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label128: TLabel
            Left = 369
            Top = 190
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label118: TLabel
            Left = 9
            Top = 168
            Width = 73
            Height = 26
            Caption = 'Active/Passive Acoustic'
            WordWrap = True
          end
          object Label121: TLabel
            Left = 110
            Top = 168
            Width = 4
            Height = 13
            Caption = ':'
          end
          object edtWakeHoming: TEdit
            Left = 396
            Top = 17
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object edtWireGuided: TEdit
            Left = 396
            Top = 54
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object edtActiveAccoustic: TEdit
            Left = 396
            Top = 91
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object edtPassiveAccoustic: TEdit
            Left = 396
            Top = 127
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object TrackBarWakeHoming: TTrackBar
            Left = 120
            Top = 20
            Width = 270
            Height = 29
            Max = 4
            TabOrder = 4
            ThumbLength = 15
            OnChange = TrackBarWakeHomingChange
          end
          object TrackBarWireGuided: TTrackBar
            Left = 120
            Top = 57
            Width = 270
            Height = 29
            Max = 4
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarWireGuidedChange
          end
          object TrackBarActiveAcoustic: TTrackBar
            Left = 120
            Top = 93
            Width = 270
            Height = 29
            Max = 4
            TabOrder = 6
            ThumbLength = 15
            OnChange = TrackBarActiveAcousticChange
          end
          object TrackBarPassiveAccoustic: TTrackBar
            Left = 120
            Top = 128
            Width = 270
            Height = 29
            Max = 4
            TabOrder = 7
            ThumbLength = 15
            OnChange = TrackBarPassiveAccousticChange
          end
          object edtActPassAccoustic: TEdit
            Left = 396
            Top = 163
            Width = 49
            Height = 21
            TabOrder = 8
          end
          object TrackBarActPassAccoustic: TTrackBar
            Left = 120
            Top = 164
            Width = 270
            Height = 29
            Max = 4
            TabOrder = 9
            ThumbLength = 15
            OnChange = TrackBarActPassAccousticChange
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = 'Guidance'
        ImageIndex = 3
        object Label126: TLabel
          Left = 330
          Top = 83
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label127: TLabel
          Left = 398
          Top = 83
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label129: TLabel
          Left = 242
          Top = 83
          Width = 81
          Height = 26
          Caption = 'Minimum Runout Range'
          WordWrap = True
        end
        object Label82: TLabel
          Left = 330
          Top = 387
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label83: TLabel
          Left = 14
          Top = 387
          Width = 100
          Height = 13
          Caption = 'Default Cruise Depth'
        end
        object Label85: TLabel
          Left = 330
          Top = 414
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label86: TLabel
          Left = 398
          Top = 414
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label87: TLabel
          Left = 14
          Top = 414
          Width = 87
          Height = 13
          Caption = 'Wire-Angle Offset'
        end
        object Label88: TLabel
          Left = 398
          Top = 386
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object grbGuidance: TGroupBox
          Left = 3
          Top = 0
          Width = 450
          Height = 73
          Caption = 'Guidance'
          TabOrder = 0
          object Label47: TLabel
            Left = 12
            Top = 20
            Width = 36
            Height = 13
            Caption = 'Primary'
          end
          object Label49: TLabel
            Left = 134
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label51: TLabel
            Left = 12
            Top = 47
            Width = 33
            Height = 13
            Caption = 'Pursuit'
          end
          object Label52: TLabel
            Left = 134
            Top = 47
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
              'Straight'
              'Active Acoustic'
              'Passive Acoustic'
              'Active/Passive'
              'Wire Guided'
              'Wake Homing')
          end
          object cbPursuitLaunchGuidance: TComboBox
            Left = 140
            Top = 43
            Width = 93
            Height = 21
            TabOrder = 1
            Items.Strings = (
              'Lead'
              'Pure')
          end
        end
        object grbSeekDetectionGuidance: TGroupBox
          Left = 3
          Top = 79
          Width = 222
          Height = 122
          Caption = 'Seeker Detection Envelope'
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
            Top = 50
            Width = 38
            Height = 13
            Caption = 'Azimuth'
          end
          object Label56: TLabel
            Left = 99
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label57: TLabel
            Left = 167
            Top = 50
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object Label61: TLabel
            Left = 12
            Top = 23
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object Label48: TLabel
            Left = 11
            Top = 77
            Width = 44
            Height = 13
            Caption = 'Elevation'
          end
          object Label50: TLabel
            Left = 99
            Top = 77
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label122: TLabel
            Left = 167
            Top = 77
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object edtRangeSeekerDetectionGuide: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtAzimuthSeekerDetectionGuide: TEdit
            Left = 109
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtElevationSeekerDetectionGuide: TEdit
            Left = 109
            Top = 73
            Width = 52
            Height = 21
            TabOrder = 2
          end
        end
        object grbSinuationRunout: TGroupBox
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
            Width = 27
            Height = 13
            Caption = 'yards'
          end
          object Label60: TLabel
            Left = 11
            Top = 42
            Width = 47
            Height = 13
            Caption = 'Amplitude'
          end
          object Label62: TLabel
            Left = 99
            Top = 42
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label63: TLabel
            Left = 167
            Top = 42
            Width = 27
            Height = 13
            Caption = 'yards'
          end
          object Label67: TLabel
            Left = 11
            Top = 15
            Width = 30
            Height = 13
            Caption = 'Period'
          end
          object edtPeriodSinuation: TEdit
            Left = 109
            Top = 11
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtAmplitudeSinuation: TEdit
            Left = 109
            Top = 38
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object cbxSinuationRunout: TCheckBox
          Left = 242
          Top = 119
          Width = 103
          Height = 17
          Caption = 'Sinuation Runout'
          TabOrder = 3
        end
        object grbRangeGuidance: TGroupBox
          Left = 3
          Top = 207
          Width = 222
          Height = 82
          Caption = 'Range'
          TabOrder = 4
          object Label64: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label65: TLabel
            Left = 167
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label66: TLabel
            Left = 11
            Top = 50
            Width = 44
            Height = 13
            Caption = 'Maximum'
          end
          object Label68: TLabel
            Left = 99
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label69: TLabel
            Left = 167
            Top = 50
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label70: TLabel
            Left = 11
            Top = 23
            Width = 40
            Height = 13
            Caption = 'Minimum'
          end
          object edtMinRangeGuidance: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtMaxRangeGuidance: TEdit
            Left = 109
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbUseTerminalCircleGuidance: TGroupBox
          Left = 231
          Top = 220
          Width = 222
          Height = 69
          TabOrder = 5
          object Label79: TLabel
            Left = 99
            Top = 14
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label80: TLabel
            Left = 167
            Top = 14
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label84: TLabel
            Left = 11
            Top = 14
            Width = 32
            Height = 13
            Caption = 'Radius'
          end
          object edtRadiusGuidance: TEdit
            Left = 109
            Top = 10
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbxRadiusOperatorGuidance: TCheckBox
            Left = 11
            Top = 37
            Width = 150
            Height = 17
            Caption = 'Radius Operator Modifiable'
            TabOrder = 1
          end
        end
        object grbSeekerTurnOnGuidance: TGroupBox
          Left = 3
          Top = 303
          Width = 222
          Height = 74
          Caption = 'Seeker Turn-On Range'
          TabOrder = 6
          object Label71: TLabel
            Left = 100
            Top = 22
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label72: TLabel
            Left = 168
            Top = 22
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label73: TLabel
            Left = 12
            Top = 22
            Width = 31
            Height = 13
            Caption = 'Range'
          end
          object edtRangeSeekerTurnOnGuidance: TEdit
            Left = 110
            Top = 18
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbxRangeSeekerTurnOnGuidance: TCheckBox
            Left = 12
            Top = 45
            Width = 150
            Height = 17
            Caption = 'Range Operator Modifiable'
            TabOrder = 1
          end
        end
        object grbWaypointUser: TGroupBox
          Left = 3
          Top = 447
          Width = 450
          Height = 66
          Caption = 'Aspect Dependent Probability of Hit'
          TabOrder = 7
          object btnEdit: TButton
            Left = 134
            Top = 24
            Width = 167
            Height = 33
            Caption = 'Edit...'
            TabOrder = 0
          end
        end
        object edtMinRunoutGuidance: TEdit
          Left = 340
          Top = 79
          Width = 52
          Height = 21
          TabOrder = 8
        end
        object cbxUseTerminalCircle: TCheckBox
          Left = 242
          Top = 207
          Width = 111
          Height = 17
          Caption = 'Use Terminal Circle'
          TabOrder = 9
        end
        object grbRadiusGyroAngels: TGroupBox
          Left = 231
          Top = 308
          Width = 222
          Height = 69
          TabOrder = 10
          object Label74: TLabel
            Left = 9
            Top = 14
            Width = 51
            Height = 13
            Caption = 'First Angle'
          end
          object Label75: TLabel
            Left = 99
            Top = 14
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label76: TLabel
            Left = 9
            Top = 41
            Width = 65
            Height = 13
            Caption = 'Second Angle'
          end
          object Label77: TLabel
            Left = 99
            Top = 41
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label78: TLabel
            Left = 183
            Top = 14
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object Label81: TLabel
            Left = 183
            Top = 41
            Width = 18
            Height = 13
            Caption = 'deg'
          end
          object cbxFirstGyroAngelsGuidance: TComboBox
            Left = 109
            Top = 10
            Width = 68
            Height = 21
            TabOrder = 0
          end
          object cbxSecondGyroAngelsGuidance: TComboBox
            Left = 109
            Top = 37
            Width = 68
            Height = 21
            TabOrder = 1
          end
        end
        object cbxrealtiveGyroAnglesGuidance: TCheckBox
          Left = 242
          Top = 297
          Width = 170
          Height = 17
          Caption = 'Relative Gyro Angles Required'
          TabOrder = 11
        end
        object edtDefaultCruiseGuidance: TEdit
          Left = 340
          Top = 383
          Width = 52
          Height = 21
          TabOrder = 12
        end
        object edtWireAngleGuidance: TEdit
          Left = 340
          Top = 410
          Width = 52
          Height = 21
          TabOrder = 13
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Notes'
        ImageIndex = 5
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 456
          Height = 558
          TabOrder = 0
        end
      end
    end
  end
end
