object fGameDefault: TfGameDefault
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Game Defaults'
  ClientHeight = 713
  ClientWidth = 511
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 49
    TabOrder = 0
    object lbl1: TLabel
      Left = 15
      Top = 5
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object edtName: TEdit
      Left = 15
      Top = 22
      Width = 482
      Height = 21
      TabOrder = 0
    end
  end
  object pgc1: TPageControl
    Left = 0
    Top = 49
    Width = 513
    Height = 624
    ActivePage = ts1
    TabOrder = 1
    object ts1: TTabSheet
      Caption = 'Above Water'
      object grp1: TGroupBox
        Left = 3
        Top = 3
        Width = 158
        Height = 126
        Caption = 'Edit Radar Effects'
        TabOrder = 0
        object btnEditRadarCloudCover: TButton
          Left = 25
          Top = 51
          Width = 105
          Height = 25
          Caption = 'Cloud Cover..'
          TabOrder = 0
        end
        object btnEditRadarSeaState: TButton
          Left = 25
          Top = 82
          Width = 105
          Height = 25
          Caption = 'Sea State..'
          TabOrder = 1
        end
      end
      object grp2: TGroupBox
        Left = 199
        Top = 3
        Width = 154
        Height = 126
        Caption = 'Edit ESM Effects'
        TabOrder = 1
        object btnEditESMCloud: TButton
          Left = 25
          Top = 51
          Width = 105
          Height = 25
          Caption = 'Cloud Cover..'
          TabOrder = 0
        end
        object btnEditESMRainfall: TButton
          Left = 24
          Top = 20
          Width = 105
          Height = 25
          Caption = 'Rainfall Rate..'
          TabOrder = 1
        end
      end
      object grp3: TGroupBox
        Left = 3
        Top = 135
        Width = 499
        Height = 122
        Caption = 'Visual/Electro-Optical Factors'
        TabOrder = 2
        object lbl2: TLabel
          Left = 8
          Top = 20
          Width = 74
          Height = 13
          Caption = 'Detection        :'
        end
        object lbl3: TLabel
          Left = 8
          Top = 61
          Width = 73
          Height = 13
          Caption = 'Identification  :'
        end
        object lbl4: TLabel
          Left = 94
          Top = 101
          Width = 17
          Height = 13
          Caption = '0%'
        end
        object lbl5: TLabel
          Left = 405
          Top = 105
          Width = 29
          Height = 13
          Caption = '100%'
        end
        object trckbrIdentification: TTrackBar
          Left = 87
          Top = 61
          Width = 346
          Height = 38
          Max = 100
          Frequency = 25
          TabOrder = 0
          OnChange = trckbrIdentificationChange
        end
        object trckbrDetection: TTrackBar
          Left = 88
          Top = 17
          Width = 346
          Height = 38
          Max = 100
          Frequency = 25
          TabOrder = 1
          OnChange = trckbrDetectionChange
        end
        object edtVisualFactorIdentification: TEdit
          Left = 434
          Top = 61
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtVisualFactorDetection: TEdit
          Left = 434
          Top = 21
          Width = 56
          Height = 21
          TabOrder = 3
        end
      end
      object grp4: TGroupBox
        Left = 3
        Top = 263
        Width = 246
        Height = 105
        Caption = 'Visual Detector'
        TabOrder = 3
        object lbl6: TLabel
          Left = 8
          Top = 20
          Width = 129
          Height = 13
          Caption = 'Detection Range               :'
        end
        object lbl7: TLabel
          Left = 8
          Top = 48
          Width = 128
          Height = 13
          Caption = 'Associated Cross-Section :'
        end
        object lbl8: TLabel
          Left = 8
          Top = 76
          Width = 127
          Height = 13
          Caption = 'Maximum Range               :'
        end
        object lbl13: TLabel
          Left = 204
          Top = 20
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl14: TLabel
          Left = 204
          Top = 48
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object lbl15: TLabel
          Left = 204
          Top = 75
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtVisualCrossSection: TEdit
          Left = 142
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtVisualDetection: TEdit
          Left = 142
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtVisualMaxRange: TEdit
          Left = 142
          Top = 72
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object grp5: TGroupBox
        Left = 255
        Top = 263
        Width = 247
        Height = 105
        Caption = 'Chaff'
        TabOrder = 4
        object lbl9: TLabel
          Left = 8
          Top = 20
          Width = 127
          Height = 13
          Caption = 'Altitude Threshold            :'
        end
        object lbl10: TLabel
          Left = 8
          Top = 48
          Width = 125
          Height = 13
          Caption = 'Seduction Bloom Altitude :'
        end
        object lbl11: TLabel
          Left = 8
          Top = 76
          Width = 125
          Height = 13
          Caption = 'Seduction Bloom Range   :'
        end
        object lbl16: TLabel
          Left = 204
          Top = 20
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object lbl17: TLabel
          Left = 204
          Top = 48
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object lbl18: TLabel
          Left = 204
          Top = 75
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtChaffSeductionAltitude: TEdit
          Left = 145
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtChaffAltitude: TEdit
          Left = 145
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtChaffSeductionRange: TEdit
          Left = 145
          Top = 72
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object grp6: TGroupBox
        Left = 3
        Top = 374
        Width = 499
        Height = 51
        Caption = 'Auto Gun'
        TabOrder = 5
        object lbl12: TLabel
          Left = 8
          Top = 20
          Width = 124
          Height = 13
          Caption = 'Interception Range         :'
        end
        object lbl19: TLabel
          Left = 204
          Top = 22
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl20: TLabel
          Left = 264
          Top = 20
          Width = 117
          Height = 13
          Caption = 'Threshold Speed           :'
        end
        object lbl21: TLabel
          Left = 456
          Top = 22
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object edtAutogunInterception: TEdit
          Left = 142
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtAutogunThreshold: TEdit
          Left = 397
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp7: TGroupBox
        Left = 3
        Top = 431
        Width = 499
        Height = 105
        Caption = 'Missile'
        TabOrder = 6
        object lbl22: TLabel
          Left = 8
          Top = 20
          Width = 194
          Height = 13
          Caption = 'Reacquisition Time                                  :'
        end
        object lbl23: TLabel
          Left = 8
          Top = 48
          Width = 192
          Height = 13
          Caption = 'High Altitude Fly Out Minimum Range    :'
        end
        object lbl24: TLabel
          Left = 8
          Top = 76
          Width = 193
          Height = 13
          Caption = 'High Altitude Fly Out Maximum Range   :'
        end
        object lbl25: TLabel
          Left = 450
          Top = 20
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl26: TLabel
          Left = 450
          Top = 48
          Width = 27
          Height = 13
          Caption = 'yards'
        end
        object lbl27: TLabel
          Left = 450
          Top = 75
          Width = 27
          Height = 13
          Caption = 'yards'
        end
        object edtMissileMinRange: TEdit
          Left = 388
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtMissileReacquisition: TEdit
          Left = 388
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtMissileMaxRange: TEdit
          Left = 388
          Top = 72
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object grp8: TGroupBox
        Left = 3
        Top = 542
        Width = 499
        Height = 51
        Caption = 'Defensive Jammer'
        TabOrder = 7
        object lbl28: TLabel
          Left = 8
          Top = 20
          Width = 190
          Height = 13
          Caption = 'Break Lock Interval Time                       :'
        end
        object lbl29: TLabel
          Left = 450
          Top = 20
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtDefensiveInterval: TEdit
          Left = 388
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 0
        end
      end
      object btnEditRadarRainfallRate: TButton
        Left = 28
        Top = 23
        Width = 105
        Height = 25
        Caption = 'Rainfall Rate..'
        TabOrder = 8
      end
    end
    object ts2: TTabSheet
      Caption = 'Under Water'
      ImageIndex = 1
      object lbl30: TLabel
        Left = 179
        Top = 10
        Width = 48
        Height = 13
        Caption = 'Sonobuoy'
      end
      object lbl43: TLabel
        Left = 3
        Top = 196
        Width = 28
        Height = 13
        Caption = 'Sonar'
      end
      object grp9: TGroupBox
        Left = 3
        Top = 3
        Width = 158
        Height = 126
        Caption = 'Edit Ambient NoiseEffects'
        TabOrder = 0
        object btn1: TButton
          Left = 25
          Top = 51
          Width = 105
          Height = 25
          Caption = 'Cloud Cover..'
          TabOrder = 0
        end
        object btn2: TButton
          Left = 25
          Top = 82
          Width = 105
          Height = 25
          Caption = 'Sea State..'
          TabOrder = 1
        end
        object btn3: TButton
          Left = 25
          Top = 20
          Width = 105
          Height = 25
          Caption = 'Rainfall Rate ..'
          TabOrder = 2
        end
      end
      object grp10: TGroupBox
        Left = 179
        Top = 29
        Width = 323
        Height = 100
        Caption = 'Area of Probability'
        TabOrder = 1
        object lbl31: TLabel
          Left = 8
          Top = 20
          Width = 128
          Height = 13
          Caption = 'Initial Radius Delay           :'
        end
        object lbl32: TLabel
          Left = 8
          Top = 48
          Width = 128
          Height = 13
          Caption = 'Radius Decrease Rate      :'
        end
        object lbl33: TLabel
          Left = 8
          Top = 76
          Width = 127
          Height = 13
          Caption = 'Initial Radius Modifier       :'
        end
        object lbl34: TLabel
          Left = 268
          Top = 20
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl35: TLabel
          Left = 268
          Top = 48
          Width = 34
          Height = 13
          Caption = 'nm/min'
        end
        object edtProbabilityDecreaseRate: TEdit
          Left = 209
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtProbabilityRadiusDelay: TEdit
          Left = 209
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtProbabilityModifier: TEdit
          Left = 209
          Top = 72
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object grp11: TGroupBox
        Left = 3
        Top = 135
        Width = 499
        Height = 51
        Caption = 'Mine'
        TabOrder = 2
        object lbl36: TLabel
          Left = 8
          Top = 20
          Width = 210
          Height = 13
          Caption = 'Time Interval of POD Checks                       :'
        end
        object lbl37: TLabel
          Left = 444
          Top = 20
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtMineTimeInterval: TEdit
          Left = 385
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 0
        end
      end
      object grp12: TGroupBox
        Left = 3
        Top = 216
        Width = 499
        Height = 161
        Caption = 'TMA'
        TabOrder = 3
        object lbl38: TLabel
          Left = 8
          Top = 20
          Width = 207
          Height = 13
          Caption = 'Passive TMA Range Seduction Rate           :'
        end
        object lbl39: TLabel
          Left = 8
          Top = 48
          Width = 208
          Height = 13
          Caption = 'TMA Relative Bearing Rate Change            :'
        end
        object lbl40: TLabel
          Left = 8
          Top = 76
          Width = 207
          Height = 13
          Caption = 'Maximum Reported Cause Error                 :'
        end
        object lbl41: TLabel
          Left = 444
          Top = 20
          Width = 34
          Height = 13
          Caption = 'nm/min'
        end
        object lbl42: TLabel
          Left = 444
          Top = 48
          Width = 38
          Height = 13
          Caption = 'deg/sec'
        end
        object lbl44: TLabel
          Left = 444
          Top = 75
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object lbl45: TLabel
          Left = 8
          Top = 106
          Width = 207
          Height = 13
          Caption = 'Maximum Reported Speed Error                 :'
        end
        object lbl46: TLabel
          Left = 232
          Top = 135
          Width = 17
          Height = 13
          Caption = '0%'
        end
        object lbl47: TLabel
          Left = 361
          Top = 135
          Width = 29
          Height = 13
          Caption = '100%'
        end
        object edtSonarTMABearing: TEdit
          Left = 385
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtSonarTMASeduction: TEdit
          Left = 385
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtSonarTMAMaxCauseEror: TEdit
          Left = 385
          Top = 72
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object trckbrSonarMaxSpeedEror: TTrackBar
          Left = 224
          Top = 99
          Width = 155
          Height = 38
          Max = 100
          Frequency = 25
          TabOrder = 3
          OnChange = trckbrSonarMaxSpeedErorChange
        end
        object edtSonarTMAMaxSpeedEror: TEdit
          Left = 385
          Top = 99
          Width = 56
          Height = 21
          TabOrder = 4
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'Tracks'
      ImageIndex = 2
      object lbl81: TLabel
        Left = 8
        Top = 380
        Width = 176
        Height = 13
        Caption = 'Task Group Clutter Reduction Scale :'
      end
      object lbl82: TLabel
        Left = 250
        Top = 381
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object grp13: TGroupBox
        Left = 8
        Top = 3
        Width = 238
        Height = 166
        Caption = 'Time to Make Stale Track a Lost Contact'
        TabOrder = 0
        object lbl48: TLabel
          Left = 8
          Top = 20
          Width = 110
          Height = 13
          Caption = 'Air                               :'
        end
        object lbl49: TLabel
          Left = 8
          Top = 48
          Width = 110
          Height = 13
          Caption = 'Surface                       :'
        end
        object lbl50: TLabel
          Left = 8
          Top = 76
          Width = 109
          Height = 13
          Caption = 'Subsurface                 :'
        end
        object lbl51: TLabel
          Left = 184
          Top = 22
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl52: TLabel
          Left = 184
          Top = 50
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl53: TLabel
          Left = 8
          Top = 104
          Width = 109
          Height = 13
          Caption = 'ESM Bearing Line        :'
        end
        object lbl54: TLabel
          Left = 8
          Top = 132
          Width = 108
          Height = 13
          Caption = 'Sonar Bearing Line     :'
        end
        object lbl55: TLabel
          Left = 184
          Top = 106
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl56: TLabel
          Left = 184
          Top = 78
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl57: TLabel
          Left = 184
          Top = 133
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtMakeStaleSurface: TEdit
          Left = 124
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtMakeStaleAir: TEdit
          Left = 124
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtMakeStaleSubsurface: TEdit
          Left = 124
          Top = 74
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtMakeStaleESM: TEdit
          Left = 124
          Top = 103
          Width = 56
          Height = 21
          TabOrder = 3
        end
        object edtMakeStaleSonar: TEdit
          Left = 124
          Top = 130
          Width = 56
          Height = 21
          TabOrder = 4
        end
      end
      object grp14: TGroupBox
        Left = 256
        Top = 3
        Width = 238
        Height = 166
        Caption = 'Time to Remove Stale Track'
        TabOrder = 1
        object lbl58: TLabel
          Left = 8
          Top = 20
          Width = 110
          Height = 13
          Caption = 'Air                               :'
        end
        object lbl59: TLabel
          Left = 8
          Top = 48
          Width = 110
          Height = 13
          Caption = 'Surface                       :'
        end
        object lbl60: TLabel
          Left = 8
          Top = 76
          Width = 109
          Height = 13
          Caption = 'Subsurface                 :'
        end
        object lbl61: TLabel
          Left = 184
          Top = 22
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl62: TLabel
          Left = 184
          Top = 50
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl63: TLabel
          Left = 8
          Top = 104
          Width = 109
          Height = 13
          Caption = 'ESM Bearing Line        :'
        end
        object lbl64: TLabel
          Left = 8
          Top = 132
          Width = 108
          Height = 13
          Caption = 'Sonar Bearing Line     :'
        end
        object lbl65: TLabel
          Left = 184
          Top = 106
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl66: TLabel
          Left = 184
          Top = 78
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl67: TLabel
          Left = 184
          Top = 133
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtRemoveStaleSurface: TEdit
          Left = 124
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtRemoveStaleAir: TEdit
          Left = 124
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtRemoveStaleSubsurface: TEdit
          Left = 124
          Top = 74
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtRemoveStaleESM: TEdit
          Left = 124
          Top = 103
          Width = 56
          Height = 21
          TabOrder = 3
        end
        object edtRemoveStaleSonar: TEdit
          Left = 124
          Top = 130
          Width = 56
          Height = 21
          TabOrder = 4
        end
      end
      object grp15: TGroupBox
        Left = 8
        Top = 174
        Width = 238
        Height = 81
        Caption = 'Track History Sample Rate'
        TabOrder = 2
        object lbl68: TLabel
          Left = 8
          Top = 20
          Width = 110
          Height = 13
          Caption = 'Air Platforms               :'
        end
        object lbl69: TLabel
          Left = 8
          Top = 48
          Width = 110
          Height = 13
          Caption = 'Surface  Platforms      :'
        end
        object lbl71: TLabel
          Left = 184
          Top = 22
          Width = 39
          Height = 13
          Caption = 'seconds'
        end
        object lbl72: TLabel
          Left = 184
          Top = 50
          Width = 39
          Height = 13
          Caption = 'seconds'
        end
        object edtSampleRateSurface: TEdit
          Left = 124
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtSampleRateAir: TEdit
          Left = 124
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp16: TGroupBox
        Left = 256
        Top = 174
        Width = 238
        Height = 81
        Caption = 'Track History Maximum Number of Points'
        TabOrder = 3
        object lbl70: TLabel
          Left = 8
          Top = 20
          Width = 110
          Height = 13
          Caption = 'Air Platforms               :'
        end
        object lbl73: TLabel
          Left = 8
          Top = 48
          Width = 110
          Height = 13
          Caption = 'Surface  Platforms      :'
        end
        object lbl74: TLabel
          Left = 184
          Top = 22
          Width = 29
          Height = 13
          Caption = 'points'
        end
        object lbl75: TLabel
          Left = 184
          Top = 50
          Width = 29
          Height = 13
          Caption = 'points'
        end
        object edtMaxNumSurface: TEdit
          Left = 124
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtMaxNumAir: TEdit
          Left = 124
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp17: TGroupBox
        Left = 8
        Top = 260
        Width = 485
        Height = 109
        Caption = 'Straight Line Guidance Reversion Time'
        TabOrder = 4
        object lbl76: TLabel
          Left = 8
          Top = 20
          Width = 144
          Height = 13
          Caption = 'Engangement Guidance         :'
        end
        object lbl77: TLabel
          Left = 8
          Top = 48
          Width = 142
          Height = 13
          Caption = 'Outrun Guidance                   :'
        end
        object lbl78: TLabel
          Left = 8
          Top = 76
          Width = 143
          Height = 13
          Caption = 'Shadow Guidance                  :'
        end
        object lbl79: TLabel
          Left = 432
          Top = 22
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl80: TLabel
          Left = 432
          Top = 50
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl84: TLabel
          Left = 432
          Top = 78
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtGuideOutrun: TEdit
          Left = 372
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtGuideEngangement: TEdit
          Left = 372
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtGuideShadow: TEdit
          Left = 372
          Top = 74
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object edtClutterReduction: TEdit
        Left = 190
        Top = 377
        Width = 56
        Height = 21
        TabOrder = 5
      end
    end
    object ts4: TTabSheet
      Caption = 'Guidance'
      ImageIndex = 3
      object lbl88: TLabel
        Left = 3
        Top = 90
        Width = 115
        Height = 13
        Caption = 'Zig Zag Predefined Legs'
      end
      object grp18: TGroupBox
        Left = 3
        Top = 3
        Width = 182
        Height = 81
        Caption = 'Sinuation'
        TabOrder = 0
        object lbl83: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Period            :'
        end
        object lbl85: TLabel
          Left = 8
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Amplitude      :'
        end
        object lbl86: TLabel
          Left = 146
          Top = 20
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl87: TLabel
          Left = 146
          Top = 48
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtGuidanceSinuationAmplitude: TEdit
          Left = 83
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtGuidanceSinuationPeriod: TEdit
          Left = 84
          Top = 16
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp19: TGroupBox
        Left = 3
        Top = 109
        Width = 164
        Height = 81
        Caption = 'Short'
        TabOrder = 1
        object lbl89: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Period            :'
        end
        object lbl90: TLabel
          Left = 8
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Amplitude      :'
        end
        object lbl91: TLabel
          Left = 146
          Top = 20
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl92: TLabel
          Left = 146
          Top = 48
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtZigzagShortAmplitude: TEdit
          Left = 83
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtZigzagShortPeriod: TEdit
          Left = 84
          Top = 16
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp20: TGroupBox
        Left = 170
        Top = 109
        Width = 164
        Height = 81
        Caption = 'Long'
        TabOrder = 2
        object lbl93: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Period            :'
        end
        object lbl94: TLabel
          Left = 8
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Amplitude      :'
        end
        object lbl95: TLabel
          Left = 146
          Top = 20
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl96: TLabel
          Left = 146
          Top = 48
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtZigzagLongAmplitude: TEdit
          Left = 83
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtZigzagLongPeriod: TEdit
          Left = 84
          Top = 16
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object grp21: TGroupBox
        Left = 338
        Top = 109
        Width = 164
        Height = 81
        Caption = 'Very Long'
        TabOrder = 3
        object lbl97: TLabel
          Left = 8
          Top = 20
          Width = 70
          Height = 13
          Caption = 'Period            :'
        end
        object lbl98: TLabel
          Left = 8
          Top = 48
          Width = 69
          Height = 13
          Caption = 'Amplitude      :'
        end
        object lbl99: TLabel
          Left = 146
          Top = 20
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl100: TLabel
          Left = 146
          Top = 48
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtZigzagVeryLongAmplitude: TEdit
          Left = 83
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtZigzagVeryLongPeriod: TEdit
          Left = 84
          Top = 16
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
    end
    object ts5: TTabSheet
      Caption = 'ESM/IFF'
      ImageIndex = 4
      object lbl103: TLabel
        Left = 5
        Top = 97
        Width = 259
        Height = 13
        Caption = 'ESM Bearing Error Correction Rate                              :'
      end
      object lbl106: TLabel
        Left = 330
        Top = 97
        Width = 19
        Height = 13
        Caption = 'Mhz'
      end
      object lbl107: TLabel
        Left = 5
        Top = 129
        Width = 257
        Height = 13
        Caption = 
          'Maximum IFF Range                                               ' +
          '     :'
      end
      object lbl108: TLabel
        Left = 330
        Top = 129
        Width = 19
        Height = 13
        Caption = 'Mhz'
      end
      object grp22: TGroupBox
        Left = 3
        Top = 6
        Width = 490
        Height = 78
        Caption = 'Detection Modelling'
        TabOrder = 0
        object lbl101: TLabel
          Left = 8
          Top = 20
          Width = 252
          Height = 13
          Caption = 'HF Band Datalink/MHS Transmission Frequency        :'
        end
        object lbl104: TLabel
          Left = 327
          Top = 21
          Width = 19
          Height = 13
          Caption = 'Mhz'
        end
        object lbl102: TLabel
          Left = 9
          Top = 48
          Width = 250
          Height = 13
          Caption = 'UHF Band Datalink/MHS Transmission Frequency     :'
        end
        object lbl105: TLabel
          Left = 327
          Top = 48
          Width = 19
          Height = 13
          Caption = 'Mhz'
        end
        object edtDetectionUHF: TEdit
          Left = 267
          Top = 46
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtDetectionHF: TEdit
          Left = 267
          Top = 17
          Width = 56
          Height = 21
          TabOrder = 1
        end
      end
      object edtESMBEaring: TEdit
        Left = 270
        Top = 94
        Width = 56
        Height = 21
        TabOrder = 1
      end
      object edtESMMaxIFF: TEdit
        Left = 270
        Top = 125
        Width = 56
        Height = 21
        TabOrder = 2
      end
      object grp23: TGroupBox
        Left = 3
        Top = 152
        Width = 490
        Height = 49
        Caption = 'IFF Modes/Codes'
        TabOrder = 3
        object btnEditESM: TButton
          Left = 208
          Top = 15
          Width = 75
          Height = 25
          Caption = 'Edit'
          TabOrder = 0
        end
      end
    end
    object ts6: TTabSheet
      Caption = 'Allocation Maximums'
      ImageIndex = 5
    end
    object ts7: TTabSheet
      Caption = 'Communication'
      ImageIndex = 6
      object grp24: TGroupBox
        Left = 8
        Top = 3
        Width = 313
        Height = 134
        Caption = 'MHS Delay Time'
        TabOrder = 0
        object lbl109: TLabel
          Left = 8
          Top = 21
          Width = 170
          Height = 13
          Caption = 'Flash                                               :'
        end
        object lbl110: TLabel
          Left = 8
          Top = 48
          Width = 171
          Height = 13
          Caption = 'Immediate                                       :'
        end
        object lbl111: TLabel
          Left = 8
          Top = 76
          Width = 170
          Height = 13
          Caption = 'Priority                                            :'
        end
        object lbl112: TLabel
          Left = 245
          Top = 22
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl113: TLabel
          Left = 245
          Top = 50
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl114: TLabel
          Left = 8
          Top = 104
          Width = 170
          Height = 13
          Caption = 'Routine                                           :'
        end
        object lbl116: TLabel
          Left = 245
          Top = 106
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object lbl117: TLabel
          Left = 245
          Top = 78
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object edtMHSImmediate: TEdit
          Left = 185
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtMHSFlash: TEdit
          Left = 185
          Top = 18
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtMHSPriority: TEdit
          Left = 185
          Top = 74
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtMHSRoutine: TEdit
          Left = 185
          Top = 103
          Width = 56
          Height = 21
          TabOrder = 3
        end
      end
      object grp25: TGroupBox
        Left = 8
        Top = 143
        Width = 313
        Height = 106
        Caption = 'Maximum Ranges'
        TabOrder = 1
        object lbl115: TLabel
          Left = 8
          Top = 21
          Width = 171
          Height = 13
          Caption = 'Underwater Telephone Reception  :'
        end
        object lbl118: TLabel
          Left = 8
          Top = 48
          Width = 171
          Height = 13
          Caption = 'HF Transmission                              :'
        end
        object lbl119: TLabel
          Left = 8
          Top = 76
          Width = 171
          Height = 13
          Caption = 'UHF/VHF Transmission                    :'
        end
        object lbl120: TLabel
          Left = 245
          Top = 22
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl121: TLabel
          Left = 245
          Top = 50
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl124: TLabel
          Left = 245
          Top = 78
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object edtMaxRangeHF: TEdit
          Left = 185
          Top = 47
          Width = 56
          Height = 21
          TabOrder = 0
        end
        object edtMaxRangeUnderwater: TEdit
          Left = 185
          Top = 20
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtMaxRangeUHF: TEdit
          Left = 185
          Top = 74
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 672
    Width = 512
    Height = 41
    TabOrder = 2
    object btnApply: TButton
      Left = 441
      Top = 7
      Width = 65
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 368
      Top = 7
      Width = 67
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 295
      Top = 7
      Width = 67
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnSaveAsTrainer: TButton
      Left = 7
      Top = 7
      Width = 137
      Height = 25
      Caption = 'Save As Trainer Defaults'
      TabOrder = 3
    end
  end
end
