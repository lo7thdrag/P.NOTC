object fEnvironmentControl: TfEnvironmentControl
  Left = 0
  Top = 0
  Caption = 'Environment Control'
  ClientHeight = 746
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbEnvironmentControl: TPanel
    Left = 0
    Top = 0
    Width = 848
    Height = 746
    Align = alClient
    TabOrder = 0
    object Panel16: TPanel
      Left = 1
      Top = 1
      Width = 846
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Environment Control'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel22: TPanel
      Left = 1
      Top = 39
      Width = 282
      Height = 706
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      object Panel54: TPanel
        Left = 4
        Top = 4
        Width = 274
        Height = 355
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 0
        object lvEnviroArea: TListView
          Left = 10
          Top = 10
          Width = 254
          Height = 335
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
              Width = 200
            end>
          TabOrder = 0
          ViewStyle = vsReport
          OnSelectItem = lvEnviroAreaSelectItem
        end
      end
    end
    object Panel23: TPanel
      Left = 283
      Top = 39
      Width = 564
      Height = 706
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      object Panel55: TPanel
        Left = 4
        Top = 4
        Width = 556
        Height = 770
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel56: TPanel
          Left = 0
          Top = 730
          Width = 556
          Height = 40
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Button40: TButton
            Left = 360
            Top = 10
            Width = 93
            Height = 28
            Caption = 'Apply'
            TabOrder = 0
          end
          object Button41: TButton
            Left = 459
            Top = 10
            Width = 93
            Height = 28
            Caption = 'Cancel'
            TabOrder = 1
          end
        end
        object Panel92: TPanel
          Left = 0
          Top = 0
          Width = 556
          Height = 730
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel55'
          TabOrder = 1
          object pcEnvironmentControl: TPageControl
            Left = 0
            Top = 0
            Width = 551
            Height = 730
            ActivePage = tsAboveWater
            Align = alLeft
            TabOrder = 0
            object tsAboveWater: TTabSheet
              Caption = 'Above Water'
              object GroupBox6: TGroupBox
                Left = 10
                Top = 130
                Width = 526
                Height = 222
                Caption = 'Visibility factors'
                TabOrder = 0
                object Label167: TLabel
                  Left = 16
                  Top = 20
                  Width = 73
                  Height = 13
                  Caption = 'Daytime visual:'
                end
                object Label168: TLabel
                  Left = 14
                  Top = 93
                  Width = 84
                  Height = 13
                  Caption = 'Daytime infrared:'
                end
                object Label169: TLabel
                  Left = 14
                  Top = 130
                  Width = 88
                  Height = 13
                  Caption = 'Nighttme infrared:'
                end
                object Label170: TLabel
                  Left = 14
                  Top = 56
                  Width = 75
                  Height = 13
                  Caption = 'Nightime visual:'
                end
                object Label171: TLabel
                  Left = 14
                  Top = 162
                  Width = 39
                  Height = 13
                  Caption = 'Sunrise:'
                end
                object lblEnviCtrlSunrise: TLabel
                  Left = 108
                  Top = 162
                  Width = 44
                  Height = 13
                  Caption = '00:00:00'
                end
                object Label173: TLabel
                  Left = 14
                  Top = 184
                  Width = 37
                  Height = 13
                  Caption = 'Sunset:'
                end
                object lblEnviCtrlSunset: TLabel
                  Left = 108
                  Top = 184
                  Width = 44
                  Height = 13
                  Caption = '00:00:00'
                end
                object Label175: TLabel
                  Left = 14
                  Top = 206
                  Width = 84
                  Height = 13
                  Caption = 'Period of twilight:'
                end
                object lblEnviCtrlPeriodTwilight: TLabel
                  Left = 108
                  Top = 206
                  Width = 44
                  Height = 13
                  Caption = '00:00:00'
                end
                object edtDayVis: TEdit
                  Left = 433
                  Top = 20
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtNightVis: TEdit
                  Left = 433
                  Top = 56
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
                object trbDaytimeVisual: TTrackBar
                  Left = 104
                  Top = 18
                  Width = 313
                  Height = 34
                  LineSize = 5
                  Max = 100
                  PageSize = 5
                  Frequency = 20
                  TabOrder = 2
                end
                object trbNighttimeVisual: TTrackBar
                  Left = 106
                  Top = 55
                  Width = 313
                  Height = 34
                  LineSize = 5
                  Max = 100
                  PageSize = 5
                  Frequency = 20
                  TabOrder = 3
                end
                object trbDaytimeInfra: TTrackBar
                  Left = 104
                  Top = 88
                  Width = 313
                  Height = 34
                  LineSize = 5
                  Max = 100
                  PageSize = 5
                  Frequency = 20
                  TabOrder = 4
                end
                object trbNighttimeInfra: TTrackBar
                  Left = 108
                  Top = 124
                  Width = 313
                  Height = 34
                  LineSize = 5
                  Max = 100
                  PageSize = 5
                  Frequency = 20
                  TabOrder = 5
                end
                object edtNightInfra: TEdit
                  Left = 433
                  Top = 129
                  Width = 73
                  Height = 21
                  TabOrder = 6
                end
                object edtDayInfra: TEdit
                  Left = 433
                  Top = 92
                  Width = 73
                  Height = 21
                  TabOrder = 7
                end
              end
              object GroupBox7: TGroupBox
                Left = 10
                Top = 370
                Width = 526
                Height = 193
                Caption = 'Attenuation factors'
                TabOrder = 1
                object Label177: TLabel
                  Left = 14
                  Top = 16
                  Width = 48
                  Height = 13
                  Caption = 'Rain rate:'
                end
                object Label178: TLabel
                  Left = 12
                  Top = 93
                  Width = 100
                  Height = 13
                  Caption = 'Barometric pressure:'
                end
                object Label179: TLabel
                  Left = 12
                  Top = 121
                  Width = 80
                  Height = 13
                  Caption = 'Air temperature:'
                end
                object Label180: TLabel
                  Left = 12
                  Top = 57
                  Width = 93
                  Height = 13
                  Caption = 'Cloud attenuation :'
                end
                object Label181: TLabel
                  Left = 12
                  Top = 150
                  Width = 90
                  Height = 13
                  Caption = 'Cloud base height:'
                end
                object Label182: TLabel
                  Left = 195
                  Top = 97
                  Width = 35
                  Height = 13
                  Caption = 'milibars'
                end
                object Label183: TLabel
                  Left = 197
                  Top = 123
                  Width = 7
                  Height = 13
                  Caption = 'C'
                end
                object Label184: TLabel
                  Left = 195
                  Top = 150
                  Width = 20
                  Height = 13
                  Caption = 'feet'
                end
                object edtAttenRainRate: TEdit
                  Left = 431
                  Top = 17
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtAttenCloud: TEdit
                  Left = 429
                  Top = 57
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
                object trbAttenRainRate: TTrackBar
                  Left = 102
                  Top = 14
                  Width = 313
                  Height = 34
                  LineSize = 2
                  Max = 5
                  PageSize = 1
                  TabOrder = 2
                end
                object trbAttenCloud: TTrackBar
                  Left = 102
                  Top = 57
                  Width = 313
                  Height = 34
                  LineSize = 2
                  Max = 5
                  PageSize = 1
                  TabOrder = 3
                end
                object edtAirTemp: TEdit
                  Left = 116
                  Top = 118
                  Width = 73
                  Height = 21
                  TabOrder = 4
                end
                object edtBarometricPressure: TEdit
                  Left = 116
                  Top = 91
                  Width = 73
                  Height = 21
                  TabOrder = 5
                end
                object edtCloudBaseHeight: TEdit
                  Left = 116
                  Top = 145
                  Width = 73
                  Height = 21
                  TabOrder = 6
                end
              end
              object GroupBox8: TGroupBox
                Left = 10
                Top = 580
                Width = 526
                Height = 92
                Caption = 'Athmospheric sub/super refraction modifier'
                TabOrder = 2
                object Label185: TLabel
                  Left = 21
                  Top = 53
                  Width = 17
                  Height = 13
                  Caption = '1%'
                end
                object Label186: TLabel
                  Left = 203
                  Top = 49
                  Width = 29
                  Height = 13
                  Caption = '100%'
                end
                object Label187: TLabel
                  Left = 61
                  Top = 64
                  Width = 69
                  Height = 13
                  Caption = 'Sub-refraction'
                end
                object Label189: TLabel
                  Left = 187
                  Top = 64
                  Width = 63
                  Height = 13
                  Caption = 'No refraction'
                end
                object Label190: TLabel
                  Left = 378
                  Top = 48
                  Width = 29
                  Height = 13
                  Caption = '200%'
                end
                object Label192: TLabel
                  Left = 285
                  Top = 64
                  Width = 79
                  Height = 13
                  Caption = 'Super-refraction'
                end
                object edtAtmRefract: TEdit
                  Left = 422
                  Top = 17
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object trbAtmRefract: TTrackBar
                  Left = 16
                  Top = 14
                  Width = 390
                  Height = 34
                  LineSize = 2
                  Max = 200
                  PageSize = 5
                  Frequency = 20
                  TabOrder = 1
                end
              end
              object GroupBox5: TGroupBox
                Left = 10
                Top = 6
                Width = 279
                Height = 105
                Caption = 'Wind'
                TabOrder = 3
                object Label163: TLabel
                  Left = 101
                  Top = 31
                  Width = 46
                  Height = 13
                  Caption = 'Direction:'
                end
                object Label164: TLabel
                  Left = 231
                  Top = 31
                  Width = 39
                  Height = 13
                  Caption = 'degrees'
                end
                object Label165: TLabel
                  Left = 228
                  Top = 61
                  Width = 17
                  Height = 13
                  Caption = 'm/s'
                end
                object Label166: TLabel
                  Left = 101
                  Top = 61
                  Width = 34
                  Height = 13
                  Caption = 'Speed:'
                end
                object edtWindDir: TEdit
                  Left = 152
                  Top = 27
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtWindSpeed: TEdit
                  Left = 152
                  Top = 57
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
                object pnWheelAbove: TPanel
                  Left = 13
                  Top = 18
                  Width = 73
                  Height = 73
                  TabOrder = 2
                end
              end
            end
            object tsSurface: TTabSheet
              Caption = 'Surface and Subsurface'
              ImageIndex = 1
              object Label194: TLabel
                Left = 308
                Top = 12
                Width = 67
                Height = 13
                Caption = 'Shipping rate:'
              end
              object Label195: TLabel
                Left = 308
                Top = 62
                Width = 112
                Height = 13
                Caption = 'Depth of thermal layer:'
              end
              object Label188: TLabel
                Left = 387
                Top = 81
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label212: TLabel
                Left = 13
                Top = 378
                Width = 50
                Height = 13
                Caption = 'Sea state:'
              end
              object Label213: TLabel
                Left = 130
                Top = 399
                Width = 16
                Height = 13
                Caption = 'Still'
              end
              object Label214: TLabel
                Left = 413
                Top = 399
                Width = 31
                Height = 13
                Caption = 'Heavy'
              end
              object Label215: TLabel
                Left = 416
                Top = 463
                Width = 6
                Height = 13
                Caption = '9'
              end
              object Label216: TLabel
                Left = 136
                Top = 461
                Width = 6
                Height = 13
                Caption = '1'
              end
              object Label217: TLabel
                Left = 13
                Top = 439
                Width = 108
                Height = 13
                Caption = 'Botom loss coefficient:'
              end
              object Label218: TLabel
                Left = 248
                Top = 541
                Width = 15
                Height = 13
                Caption = 'dB '
              end
              object Label219: TLabel
                Left = 14
                Top = 546
                Width = 147
                Height = 13
                Caption = 'Shadow zone transmission loss'
              end
              object Label220: TLabel
                Left = 248
                Top = 517
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label221: TLabel
                Left = 14
                Top = 519
                Width = 108
                Height = 13
                Caption = 'Average ocean depth:'
              end
              object Label222: TLabel
                Left = 247
                Top = 489
                Width = 7
                Height = 13
                Caption = 'C'
              end
              object Label223: TLabel
                Left = 14
                Top = 491
                Width = 104
                Height = 13
                Caption = 'Surface temperature:'
              end
              object GroupBox11: TGroupBox
                Left = 12
                Top = 12
                Width = 277
                Height = 105
                Caption = 'Ocean current'
                TabOrder = 0
                object Label158: TLabel
                  Left = 99
                  Top = 30
                  Width = 46
                  Height = 13
                  Caption = 'Direction:'
                end
                object Label191: TLabel
                  Left = 229
                  Top = 58
                  Width = 26
                  Height = 13
                  Caption = 'knots'
                end
                object Label193: TLabel
                  Left = 99
                  Top = 60
                  Width = 34
                  Height = 13
                  Caption = 'Speed:'
                end
                object Label196: TLabel
                  Left = 229
                  Top = 30
                  Width = 39
                  Height = 13
                  Caption = 'degrees'
                end
                object edtOceanCurrentDirection: TEdit
                  Left = 150
                  Top = 26
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtOceanCurrentSpeed: TEdit
                  Left = 150
                  Top = 56
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
                object pnlWheelSurface: TPanel
                  Left = 13
                  Top = 18
                  Width = 73
                  Height = 73
                  TabOrder = 2
                end
              end
              object cbxShippingRate: TComboBox
                Left = 308
                Top = 31
                Width = 145
                Height = 21
                TabOrder = 1
                Text = 'Medium'
                Items.Strings = (
                  'Distant'
                  'Low'
                  'Medium'
                  'High')
              end
              object edtDepthTermalLayer: TEdit
                Left = 308
                Top = 81
                Width = 73
                Height = 21
                TabOrder = 2
              end
              object GroupBox12: TGroupBox
                Left = 272
                Top = 128
                Width = 254
                Height = 105
                Caption = 'Speed of sound'
                TabOrder = 3
                object Label197: TLabel
                  Left = 15
                  Top = 21
                  Width = 41
                  Height = 13
                  Caption = 'Surface:'
                end
                object Label198: TLabel
                  Left = 141
                  Top = 21
                  Width = 17
                  Height = 13
                  Caption = 'm/s'
                end
                object Label199: TLabel
                  Left = 15
                  Top = 49
                  Width = 31
                  Height = 13
                  Caption = 'Layer:'
                end
                object Label200: TLabel
                  Left = 15
                  Top = 76
                  Width = 38
                  Height = 13
                  Caption = 'Bottom:'
                end
                object Label201: TLabel
                  Left = 142
                  Top = 49
                  Width = 17
                  Height = 13
                  Caption = 'm/s'
                end
                object Label202: TLabel
                  Left = 142
                  Top = 73
                  Width = 17
                  Height = 13
                  Caption = 'm/s'
                end
                object edtSpeedOfSoundSurface: TEdit
                  Left = 63
                  Top = 19
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtSpeedOfSoundlayer: TEdit
                  Left = 63
                  Top = 46
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
                object edtSpeedOfSoundBottom: TEdit
                  Left = 63
                  Top = 73
                  Width = 73
                  Height = 21
                  TabOrder = 2
                end
              end
              object GroupBox2: TGroupBox
                Left = 12
                Top = 129
                Width = 254
                Height = 105
                Caption = 'Sound velocity profile'
                TabOrder = 4
                object Label203: TLabel
                  Left = 103
                  Top = 68
                  Width = 37
                  Height = 13
                  Caption = 'Positive'
                end
                object SpeedButton25: TSpeedButton
                  Left = 90
                  Top = 25
                  Width = 35
                  Height = 35
                  Caption = '/'
                end
                object SpeedButton24: TSpeedButton
                  Left = 42
                  Top = 25
                  Width = 35
                  Height = 35
                  Caption = '\'
                end
                object SpeedButton26: TSpeedButton
                  Left = 134
                  Top = 25
                  Width = 35
                  Height = 35
                  Caption = '>'
                end
                object SpeedButton27: TSpeedButton
                  Left = 178
                  Top = 25
                  Width = 35
                  Height = 35
                  Caption = '<'
                end
              end
              object GroupBox13: TGroupBox
                Left = 12
                Top = 251
                Width = 254
                Height = 101
                Caption = 'Surface Ducting'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 5
                object Label204: TLabel
                  Left = 154
                  Top = 76
                  Width = 33
                  Height = 13
                  Caption = 'metres'
                end
                object Label205: TLabel
                  Left = 15
                  Top = 72
                  Width = 54
                  Height = 13
                  Caption = 'Lower limit:'
                end
                object Label206: TLabel
                  Left = 154
                  Top = 44
                  Width = 33
                  Height = 13
                  Caption = 'metres'
                end
                object Label207: TLabel
                  Left = 15
                  Top = 44
                  Width = 54
                  Height = 13
                  Caption = 'Upper limit:'
                end
                object edtSurfaceDuctLow: TEdit
                  Left = 75
                  Top = 67
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtSurfaceDuctUp: TEdit
                  Left = 75
                  Top = 42
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
              end
              object GroupBox14: TGroupBox
                Left = 272
                Top = 251
                Width = 254
                Height = 100
                Caption = 'Sub Surface Ducting'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 6
                object Label208: TLabel
                  Left = 152
                  Top = 77
                  Width = 33
                  Height = 13
                  Caption = 'metres'
                end
                object Label209: TLabel
                  Left = 13
                  Top = 73
                  Width = 54
                  Height = 13
                  Caption = 'Lower limit:'
                end
                object Label210: TLabel
                  Left = 152
                  Top = 45
                  Width = 33
                  Height = 13
                  Caption = 'metres'
                end
                object Label211: TLabel
                  Left = 13
                  Top = 45
                  Width = 54
                  Height = 13
                  Caption = 'Upper limit:'
                end
                object edtSubSurfaceDuctLow: TEdit
                  Left = 73
                  Top = 68
                  Width = 73
                  Height = 21
                  TabOrder = 0
                end
                object edtSubSurfaceDuctUp: TEdit
                  Left = 73
                  Top = 43
                  Width = 73
                  Height = 21
                  TabOrder = 1
                end
              end
              object trbSeaState: TTrackBar
                Left = 127
                Top = 369
                Width = 305
                Height = 28
                TabOrder = 7
              end
              object edtSeaState: TEdit
                Left = 438
                Top = 372
                Width = 73
                Height = 21
                TabOrder = 8
              end
              object edtBottomLost: TEdit
                Left = 438
                Top = 427
                Width = 73
                Height = 21
                TabOrder = 9
              end
              object trbBottomLost: TTrackBar
                Left = 127
                Top = 430
                Width = 305
                Height = 27
                TabOrder = 10
              end
              object edtShadowZone: TEdit
                Left = 169
                Top = 541
                Width = 73
                Height = 21
                TabOrder = 11
              end
              object edtAvgOceanDepth: TEdit
                Left = 169
                Top = 514
                Width = 73
                Height = 21
                TabOrder = 12
              end
              object edtSurfaceTemperatur: TEdit
                Left = 168
                Top = 487
                Width = 73
                Height = 21
                TabOrder = 13
              end
              object cbxConvergenceZone: TCheckBox
                Left = 15
                Top = 582
                Width = 159
                Height = 17
                Caption = 'Convergence zones'
                TabOrder = 14
              end
            end
            object tsBoundary: TTabSheet
              Caption = 'Boundaries'
              ImageIndex = 2
              object GroupBox9: TGroupBox
                Left = 10
                Top = 3
                Width = 519
                Height = 83
                Caption = 'Top-left'
                TabOrder = 0
              end
              object GroupBox10: TGroupBox
                Left = 10
                Top = 97
                Width = 519
                Height = 67
                Caption = 'Bottom-right'
                TabOrder = 1
              end
            end
          end
        end
      end
    end
  end
end
