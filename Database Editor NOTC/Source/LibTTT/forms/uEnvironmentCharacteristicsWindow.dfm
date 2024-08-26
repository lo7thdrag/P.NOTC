object EnvironmentCharacteristicsWindowForm: TEnvironmentCharacteristicsWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Global Environment Characteristics'
  ClientHeight = 655
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 54
    Top = 282
    Width = 185
    Height = 25
    Caption = 'Panel4'
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 620
    Width = 533
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 448
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 367
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 286
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
    Top = 0
    Width = 533
    Height = 73
    Align = alTop
    TabOrder = 1
    object lblName: TStaticText
      Left = 8
      Top = 7
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 8
      Top = 30
      Width = 504
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 533
    Height = 547
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 8
      Top = 0
      Width = 519
      Height = 547
      ActivePage = AboveWater
      TabOrder = 0
      object AboveWater: TTabSheet
        Caption = 'Above Water'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grp2: TGroupBox
          Left = 3
          Top = 117
          Width = 505
          Height = 206
          Caption = 'Visibility factors'
          TabOrder = 0
          object lbl5: TLabel
            Left = 16
            Top = 20
            Width = 73
            Height = 13
            Caption = 'Daytime visual:'
          end
          object lbl6: TLabel
            Left = 14
            Top = 93
            Width = 84
            Height = 13
            Caption = 'Daytime infrared:'
          end
          object lbl7: TLabel
            Left = 14
            Top = 130
            Width = 88
            Height = 13
            Caption = 'Nighttme infrared:'
          end
          object lbl8: TLabel
            Left = 14
            Top = 56
            Width = 75
            Height = 13
            Caption = 'Nightime visual:'
          end
          object lbl9: TLabel
            Left = 14
            Top = 158
            Width = 39
            Height = 13
            Caption = 'Sunrise:'
          end
          object lbl10: TLabel
            Left = 14
            Top = 180
            Width = 37
            Height = 13
            Caption = 'Sunset:'
          end
          object lbl11: TLabel
            Left = 238
            Top = 182
            Width = 84
            Height = 13
            Caption = 'Period of twilight:'
          end
          object edtDayVis: TEdit
            Left = 422
            Top = 17
            Width = 73
            Height = 21
            TabOrder = 0
            OnChange = edtDayVisChange
            OnKeyPress = edtDayVisKeyPress
            OnKeyUp = edtDayVisKeyUp
          end
          object edtNightVis: TEdit
            Left = 422
            Top = 56
            Width = 73
            Height = 21
            TabOrder = 1
            OnChange = edtNightVisChange
            OnKeyPress = edtNightVisKeyPress
            OnKeyUp = edtNightVisKeyUp
          end
          object trbDaytimeVisual: TTrackBar
            Left = 106
            Top = 18
            Width = 313
            Height = 34
            LineSize = 5
            Max = 100
            PageSize = 20
            Frequency = 20
            TabOrder = 2
            OnChange = trbDaytimeVisualChange
          end
          object trbNighttimeVisual: TTrackBar
            Left = 104
            Top = 55
            Width = 313
            Height = 34
            LineSize = 5
            Max = 100
            PageSize = 20
            Frequency = 20
            TabOrder = 3
            OnChange = trbNighttimeVisualChange
          end
          object trbDaytimeInfra: TTrackBar
            Left = 104
            Top = 88
            Width = 313
            Height = 34
            LineSize = 5
            Max = 100
            PageSize = 20
            Frequency = 20
            TabOrder = 4
            OnChange = trbDaytimeInfraChange
          end
          object trbNighttimeInfra: TTrackBar
            Left = 106
            Top = 124
            Width = 313
            Height = 34
            LineSize = 5
            Max = 100
            PageSize = 20
            Frequency = 20
            TabOrder = 5
            OnChange = trbNighttimeInfraChange
          end
          object edtNightInfra: TEdit
            Left = 422
            Top = 129
            Width = 73
            Height = 21
            TabOrder = 6
            OnChange = edtNightInfraChange
            OnKeyPress = edtNightInfraKeyPress
            OnKeyUp = edtNightInfraKeyUp
          end
          object edtDayInfra: TEdit
            Left = 422
            Top = 92
            Width = 73
            Height = 21
            TabOrder = 7
            OnChange = edtDayInfraChange
            OnKeyPress = edtDayInfraKeyPress
            OnKeyUp = edtDayInfraKeyUp
          end
          object edtSunrise: TEdit
            Left = 106
            Top = 155
            Width = 73
            Height = 21
            TabOrder = 8
          end
          object edtSunset: TEdit
            Left = 106
            Top = 178
            Width = 73
            Height = 21
            TabOrder = 9
          end
          object edtTwilight: TEdit
            Left = 328
            Top = 178
            Width = 73
            Height = 21
            TabOrder = 10
          end
        end
        object grp3: TGroupBox
          Left = 3
          Top = 329
          Width = 505
          Height = 188
          Caption = 'Attenuation factors'
          TabOrder = 1
          object lbl12: TLabel
            Left = 14
            Top = 16
            Width = 48
            Height = 13
            Caption = 'Rain rate:'
          end
          object lbl13: TLabel
            Left = 12
            Top = 93
            Width = 100
            Height = 13
            Caption = 'Barometric pressure:'
          end
          object lbl14: TLabel
            Left = 12
            Top = 121
            Width = 80
            Height = 13
            Caption = 'Air temperature:'
          end
          object lbl15: TLabel
            Left = 12
            Top = 57
            Width = 93
            Height = 13
            Caption = 'Cloud attenuation :'
          end
          object lbl16: TLabel
            Left = 12
            Top = 150
            Width = 90
            Height = 13
            Caption = 'Cloud base height:'
          end
          object lbl17: TLabel
            Left = 195
            Top = 97
            Width = 35
            Height = 13
            Caption = 'milibars'
          end
          object lbl18: TLabel
            Left = 197
            Top = 123
            Width = 7
            Height = 13
            Caption = 'C'
          end
          object lbl19: TLabel
            Left = 195
            Top = 150
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object edtAttenRainRate: TEdit
            Left = 422
            Top = 17
            Width = 73
            Height = 21
            TabOrder = 0
            OnChange = edtAttenRainRateChange
            OnKeyPress = edtAttenRainRateKeyPress
            OnKeyUp = edtAttenRainRateKeyUp
          end
          object edtAttenCloud: TEdit
            Left = 422
            Top = 57
            Width = 73
            Height = 21
            TabOrder = 1
            OnChange = edtAttenCloudChange
            OnKeyPress = edtAttenCloudKeyPress
            OnKeyUp = edtAttenCloudKeyUp
          end
          object trckbrAttenRainRate: TTrackBar
            Left = 106
            Top = 17
            Width = 313
            Height = 34
            LineSize = 5
            Max = 6
            PageSize = 1
            TabOrder = 5
            OnChange = trckbrAttenRainRateChange
          end
          object trckbrAttenCloud: TTrackBar
            Left = 106
            Top = 57
            Width = 313
            Height = 34
            LineSize = 2
            Max = 6
            PageSize = 1
            TabOrder = 2
            OnChange = trckbrAttenCloudChange
          end
          object edtAirTemp: TEdit
            Left = 118
            Top = 118
            Width = 71
            Height = 21
            TabOrder = 3
            OnKeyPress = edtAirTempKeyPress
            OnKeyUp = edtAirTempKeyUp
          end
          object edtBarometricPressure: TEdit
            Left = 116
            Top = 91
            Width = 73
            Height = 21
            TabOrder = 4
            OnKeyPress = edtBarometricPressureKeyPress
            OnKeyUp = edtBarometricPressureKeyUp
          end
          object edtCloudBaseHeight: TEdit
            Left = 116
            Top = 145
            Width = 73
            Height = 21
            TabOrder = 6
            OnKeyPress = edtCloudBaseHeightKeyPress
            OnKeyUp = edtCloudBaseHeightKeyUp
          end
        end
        object grp1: TGroupBox
          Left = 3
          Top = 6
          Width = 286
          Height = 105
          Caption = 'Wind'
          TabOrder = 2
          object txt1: TStaticText
            Left = 112
            Top = 24
            Width = 41
            Height = 17
            Caption = 'Speed :'
            TabOrder = 0
          end
          object txt2: TStaticText
            Left = 112
            Top = 53
            Width = 53
            Height = 17
            Caption = 'Direction :'
            TabOrder = 1
          end
          object edtAboveSpeed: TEdit
            Left = 186
            Top = 22
            Width = 55
            Height = 21
            TabOrder = 2
            OnKeyPress = edtAboveSpeedKeyPress
            OnKeyUp = edtAboveSpeedKeyUp
          end
          object edtAboveDirection: TEdit
            Left = 186
            Top = 51
            Width = 55
            Height = 21
            TabOrder = 3
            OnExit = edtAboveDirectionExit
            OnKeyPress = edtAboveDirectionKeyPress
            OnKeyUp = edtAboveDirectionKeyUp
          end
          object txt3: TStaticText
            Left = 248
            Top = 24
            Width = 30
            Height = 17
            Caption = 'knots'
            TabOrder = 4
          end
          object txt4: TStaticText
            Left = 248
            Top = 53
            Width = 22
            Height = 17
            Caption = 'deg'
            TabOrder = 5
          end
          object pnWheel: TPanel
            Left = 9
            Top = 16
            Width = 73
            Height = 73
            TabOrder = 6
          end
        end
        object grp4: TGroupBox
          Left = 295
          Top = 6
          Width = 213
          Height = 105
          Caption = 'HF Range Gap'
          TabOrder = 3
          object txt5: TStaticText
            Left = 16
            Top = 24
            Width = 35
            Height = 17
            Caption = 'Start :'
            TabOrder = 0
          end
          object txt6: TStaticText
            Left = 21
            Top = 53
            Width = 29
            Height = 17
            Caption = 'End :'
            TabOrder = 1
          end
          object edtAboveHFStart: TEdit
            Left = 57
            Top = 22
            Width = 55
            Height = 21
            TabOrder = 2
            OnKeyPress = edtAboveHFStartKeyPress
            OnKeyUp = edtAboveHFStartKeyUp
          end
          object edtAboveHFEnd: TEdit
            Left = 57
            Top = 49
            Width = 55
            Height = 21
            TabOrder = 3
            OnKeyPress = edtAboveHFEndKeyPress
            OnKeyUp = edtAboveHFEndKeyUp
          end
          object txt7: TStaticText
            Left = 248
            Top = 24
            Width = 30
            Height = 17
            Caption = 'knots'
            TabOrder = 4
          end
          object txt8: TStaticText
            Left = 248
            Top = 53
            Width = 22
            Height = 17
            Caption = 'deg'
            TabOrder = 5
          end
          object txt9: TStaticText
            Left = 120
            Top = 24
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 6
          end
          object txt10: TStaticText
            Left = 118
            Top = 53
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 7
          end
        end
      end
      object SurfaceAndSubsurface: TTabSheet
        Caption = 'Surface and Subsurface'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbOceanCurrent: TGroupBox
          Left = 3
          Top = 6
          Width = 286
          Height = 105
          Caption = 'Ocean Current'
          TabOrder = 0
          object lblSpeed: TStaticText
            Left = 112
            Top = 24
            Width = 41
            Height = 17
            Caption = 'Speed :'
            TabOrder = 0
          end
          object lblDirection: TStaticText
            Left = 112
            Top = 53
            Width = 53
            Height = 17
            Caption = 'Direction :'
            TabOrder = 1
          end
          object edtSpeed: TEdit
            Left = 186
            Top = 22
            Width = 55
            Height = 21
            TabOrder = 2
            OnKeyPress = edtSpeedKeyPress
            OnKeyUp = edtSpeedKeyUp
          end
          object edtDirection: TEdit
            Left = 186
            Top = 51
            Width = 55
            Height = 21
            TabOrder = 3
            OnExit = edtDirectionExit
            OnKeyPress = edtDirectionKeyPress
            OnKeyUp = edtDirectionKeyUp
          end
          object lblKnots: TStaticText
            Left = 248
            Top = 24
            Width = 30
            Height = 17
            Caption = 'knots'
            TabOrder = 4
          end
          object lblDeg: TStaticText
            Left = 248
            Top = 53
            Width = 22
            Height = 17
            Caption = 'deg'
            TabOrder = 5
          end
          object pnlOC: TPanel
            Left = 9
            Top = 16
            Width = 73
            Height = 73
            TabOrder = 6
          end
        end
        object grbSoundVelocity: TGroupBox
          Left = 3
          Top = 114
          Width = 286
          Height = 105
          Caption = 'Sound Velocity Profile Type'
          TabOrder = 1
          object Button1: TButton
            AlignWithMargins = True
            Left = 39
            Top = 23
            Width = 43
            Height = 42
            Caption = '\'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = Button1Click
          end
          object Button2: TButton
            Tag = 1
            AlignWithMargins = True
            Left = 88
            Top = 23
            Width = 43
            Height = 42
            Caption = '/'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button3: TButton
            Tag = 2
            AlignWithMargins = True
            Left = 137
            Top = 23
            Width = 43
            Height = 42
            Caption = '>'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = Button1Click
          end
          object Button4: TButton
            Tag = 3
            AlignWithMargins = True
            Left = 186
            Top = 23
            Width = 43
            Height = 42
            Caption = '<'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = Button1Click
          end
          object lbSoundVelocity: TStaticText
            Left = 39
            Top = 71
            Width = 41
            Height = 17
            Alignment = taCenter
            Caption = 'Positive'
            Color = clWhite
            ParentColor = False
            TabOrder = 0
          end
        end
        object grbSurfaceDucting: TGroupBox
          Left = 3
          Top = 231
          Width = 241
          Height = 82
          TabOrder = 4
          object lblUpperLimitSurface: TStaticText
            Left = 9
            Top = 24
            Width = 64
            Height = 17
            Caption = 'Upper Limit :'
            TabOrder = 0
          end
          object lblLowerLimitSurface: TStaticText
            Left = 9
            Top = 51
            Width = 64
            Height = 17
            Caption = 'Lower Limit :'
            TabOrder = 1
          end
          object edtUpperLimitSurfaceDucting: TEdit
            Left = 88
            Top = 22
            Width = 63
            Height = 21
            TabOrder = 2
            OnKeyPress = edtUpperLimitSurfaceDuctingKeyPress
            OnKeyUp = edtUpperLimitSurfaceDuctingKeyUp
          end
          object edtLowerLimitSurfaceDucting: TEdit
            Left = 88
            Top = 49
            Width = 63
            Height = 21
            TabOrder = 3
            OnKeyPress = edtLowerLimitSurfaceDuctingKeyPress
            OnKeyUp = edtLowerLimitSurfaceDuctingKeyUp
          end
          object lblFeetUpperSurfaceDucting: TStaticText
            Left = 168
            Top = 24
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 4
          end
          object lblFeetLowerSurfaceDucting: TStaticText
            Left = 168
            Top = 51
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 5
          end
        end
        object grbSubsurfaceDucting: TGroupBox
          Left = 259
          Top = 231
          Width = 241
          Height = 82
          TabOrder = 5
          object lblUpperLimitSubsurface: TStaticText
            Left = 9
            Top = 24
            Width = 64
            Height = 17
            Caption = 'Upper Limit :'
            TabOrder = 0
          end
          object lblLowerLimitSubsurface: TStaticText
            Left = 9
            Top = 51
            Width = 64
            Height = 17
            Caption = 'Lower Limit :'
            TabOrder = 1
          end
          object edtUpperLimitSubsurfaceDucting: TEdit
            Left = 88
            Top = 22
            Width = 63
            Height = 21
            TabOrder = 2
            OnKeyPress = edtUpperLimitSubsurfaceDuctingKeyPress
            OnKeyUp = edtUpperLimitSubsurfaceDuctingKeyUp
          end
          object edtLowerLimitSubsurfaceDucting: TEdit
            Left = 88
            Top = 49
            Width = 63
            Height = 21
            TabOrder = 3
            OnKeyPress = edtLowerLimitSubsurfaceDuctingKeyPress
            OnKeyUp = edtLowerLimitSubsurfaceDuctingKeyUp
          end
          object lblFeetUpperSubsurfaceDucting: TStaticText
            Left = 168
            Top = 24
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 4
          end
          object lblFeetLowerSubsurfaceDucting: TStaticText
            Left = 168
            Top = 51
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 5
          end
        end
        object grbSpeedOfSound: TGroupBox
          Left = 312
          Top = 117
          Width = 188
          Height = 105
          Caption = 'Speed of Sound'
          TabOrder = 6
          object lblSurface: TStaticText
            Left = 6
            Top = 24
            Width = 48
            Height = 17
            Caption = 'Surface :'
            TabOrder = 0
          end
          object edtSurface: TEdit
            Left = 71
            Top = 22
            Width = 58
            Height = 21
            TabOrder = 1
            OnKeyPress = edtSurfaceKeyPress
            OnKeyUp = edtSurfaceKeyUp
          end
          object lblFeetPerSec1: TStaticText
            Left = 135
            Top = 24
            Width = 32
            Height = 17
            Caption = 'ft/sec'
            TabOrder = 2
          end
          object lblLayer: TStaticText
            Left = 6
            Top = 51
            Width = 38
            Height = 17
            Caption = 'Layer :'
            TabOrder = 3
          end
          object edtLayer: TEdit
            Left = 71
            Top = 49
            Width = 58
            Height = 21
            TabOrder = 4
            OnKeyPress = edtLayerKeyPress
            OnKeyUp = edtLayerKeyUp
          end
          object lblFeetPerSec2: TStaticText
            Left = 135
            Top = 51
            Width = 32
            Height = 17
            Caption = 'ft/sec'
            TabOrder = 5
          end
          object lblBottom: TStaticText
            Left = 6
            Top = 76
            Width = 45
            Height = 17
            Caption = 'Bottom :'
            TabOrder = 6
          end
          object edtBottom: TEdit
            Left = 71
            Top = 74
            Width = 58
            Height = 21
            TabOrder = 7
            OnKeyPress = edtBottomKeyPress
            OnKeyUp = edtBottomKeyUp
          end
          object lblFeetPerSec3: TStaticText
            Left = 135
            Top = 76
            Width = 32
            Height = 17
            Caption = 'ft/sec'
            TabOrder = 8
          end
        end
        object lblShippingRate: TStaticText
          Left = 304
          Top = 6
          Width = 77
          Height = 17
          Caption = 'Shipping Rate :'
          TabOrder = 7
        end
        object cbxShippingRate: TComboBox
          Left = 304
          Top = 28
          Width = 196
          Height = 21
          TabOrder = 8
          Items.Strings = (
            'Distant'
            'Low'
            'Medium'
            'High')
        end
        object lblDepthOfThermalLayer: TStaticText
          Left = 304
          Top = 72
          Width = 124
          Height = 17
          Caption = 'Depth of Thermal Layer :'
          TabOrder = 9
        end
        object edtDepthOfThermalLayer: TEdit
          Left = 304
          Top = 90
          Width = 65
          Height = 21
          TabOrder = 10
          OnKeyPress = edtDepthOfThermalLayerKeyPress
          OnKeyUp = edtDepthOfThermalLayerKeyUp
        end
        object lblFeet: TStaticText
          Left = 375
          Top = 92
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 11
        end
        object lblSeaState: TStaticText
          Left = 3
          Top = 344
          Width = 58
          Height = 17
          Caption = 'Sea State :'
          TabOrder = 12
        end
        object trackSeaState: TTrackBar
          Left = 133
          Top = 344
          Width = 309
          Height = 45
          Max = 9
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 2
          OnChange = trackSeaStateChange
        end
        object edtSeaState: TEdit
          Left = 448
          Top = 344
          Width = 52
          Height = 21
          TabOrder = 13
          Text = '0'
          OnChange = edtSeaStateChange
          OnKeyPress = edtSeaStateKeyPress
          OnKeyUp = edtSeaStateKeyUp
        end
        object lblStillSeaState: TStaticText
          Left = 136
          Top = 369
          Width = 20
          Height = 17
          Caption = 'Still'
          TabOrder = 14
        end
        object lblHeavySeaState: TStaticText
          Left = 416
          Top = 369
          Width = 35
          Height = 17
          Caption = 'Heavy'
          TabOrder = 15
        end
        object lblBottomLossCoeff: TStaticText
          Left = 3
          Top = 392
          Width = 124
          Height = 17
          Caption = 'Bottom Loss Coefficient :'
          TabOrder = 16
        end
        object trackBottomLossCoeff: TTrackBar
          Left = 133
          Top = 392
          Width = 309
          Height = 45
          Max = 9
          Min = 1
          PageSize = 1
          Position = 1
          TabOrder = 3
          OnChange = trackBottomLossCoeffChange
        end
        object edtBottomLossCoeff: TEdit
          Left = 448
          Top = 392
          Width = 52
          Height = 21
          TabOrder = 17
          OnChange = edtBottomLossCoeffChange
          OnKeyPress = edtBottomLossCoeffKeyPress
          OnKeyUp = edtBottomLossCoeffKeyUp
        end
        object lbl1BottomLossCoeff: TStaticText
          Left = 140
          Top = 419
          Width = 10
          Height = 17
          Caption = '1'
          TabOrder = 18
        end
        object lbl9BottomLossCoeff: TStaticText
          Left = 429
          Top = 419
          Width = 10
          Height = 17
          Caption = '9'
          TabOrder = 19
        end
        object lblSurfaceTemperature: TStaticText
          Left = 3
          Top = 445
          Width = 113
          Height = 17
          Caption = 'Surface Temperature :'
          TabOrder = 20
        end
        object edtSurfaceTemperature: TEdit
          Left = 235
          Top = 443
          Width = 62
          Height = 21
          TabOrder = 21
          OnKeyPress = edtSurfaceTemperatureKeyPress
          OnKeyUp = edtSurfaceTemperatureKeyUp
        end
        object lblDegC: TStaticText
          Left = 304
          Top = 445
          Width = 32
          Height = 17
          Caption = 'deg C'
          TabOrder = 22
        end
        object lblAverageOceanDepth: TStaticText
          Left = 3
          Top = 468
          Width = 118
          Height = 17
          Caption = 'Average Ocean Depth :'
          TabOrder = 23
        end
        object edtAverageOceanDepth: TEdit
          Left = 235
          Top = 466
          Width = 62
          Height = 21
          TabOrder = 24
          OnKeyPress = edtAverageOceanDepthKeyPress
          OnKeyUp = edtAverageOceanDepthKeyUp
        end
        object lblFeetAverageOceanDepth: TStaticText
          Left = 303
          Top = 468
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 25
        end
        object lblShadowZone: TStaticText
          Left = 3
          Top = 491
          Width = 164
          Height = 17
          Caption = 'Shadow Zone Transmission Loss :'
          TabOrder = 26
        end
        object edtShadowZone: TEdit
          Left = 235
          Top = 491
          Width = 62
          Height = 21
          TabOrder = 27
          OnKeyPress = edtShadowZoneKeyPress
          OnKeyUp = edtShadowZoneKeyUp
        end
        object lblDBShadowZone: TStaticText
          Left = 303
          Top = 491
          Width = 16
          Height = 17
          Caption = 'dB'
          TabOrder = 28
        end
        object cbSurfaceDucting: TCheckBox
          Left = 12
          Top = 225
          Width = 97
          Height = 17
          Caption = 'Surface Ducting'
          TabOrder = 29
        end
        object cbSubsurfaceDucting: TCheckBox
          Left = 268
          Top = 225
          Width = 113
          Height = 17
          Caption = 'Subsurface Ducting'
          TabOrder = 30
        end
      end
      object ConvergenceZones: TTabSheet
        Caption = 'Convergence Zones'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbCoverageZones: TGroupBox
          Left = 3
          Top = 32
          Width = 497
          Height = 170
          TabOrder = 0
          object lblRangeInterval: TStaticText
            Left = 9
            Top = 24
            Width = 83
            Height = 17
            Caption = 'Range Interval :'
            TabOrder = 0
          end
          object lblWidthOfFirstCZ: TStaticText
            Left = 9
            Top = 51
            Width = 92
            Height = 17
            Caption = 'Width of First CZ :'
            TabOrder = 1
          end
          object edtRangeInterval: TEdit
            Left = 291
            Top = 22
            Width = 63
            Height = 21
            Color = clMenuBar
            Enabled = False
            TabOrder = 2
            Text = '30'
            OnKeyPress = edtRangeIntervalKeyPress
            OnKeyUp = edtRangeIntervalKeyUp
          end
          object edtWidthOfFirstCZ: TEdit
            Left = 291
            Top = 49
            Width = 63
            Height = 21
            Color = clMenuBar
            Enabled = False
            TabOrder = 3
            Text = '3'
            OnKeyPress = edtWidthOfFirstCZKeyPress
            OnKeyUp = edtWidthOfFirstCZKeyUp
          end
          object lbnmRange: TStaticText
            Left = 360
            Top = 24
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 4
          end
          object lblnmWidth: TStaticText
            Left = 360
            Top = 51
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 5
          end
          object lblFirstCZSignal: TStaticText
            Left = 9
            Top = 78
            Width = 124
            Height = 17
            Caption = 'First CZ Signal Increase :'
            TabOrder = 6
          end
          object lblAttenuation: TStaticText
            Left = 9
            Top = 105
            Width = 165
            Height = 17
            Caption = 'Attenuation Loss per CZ Bounce :'
            TabOrder = 7
          end
          object edtFirstCZSignalIncrease: TEdit
            Left = 291
            Top = 76
            Width = 63
            Height = 21
            Color = clMenuBar
            Enabled = False
            TabOrder = 8
            Text = '0000'
            OnKeyPress = edtFirstCZSignalIncreaseKeyPress
            OnKeyUp = edtFirstCZSignalIncreaseKeyUp
          end
          object edtAttenuation: TEdit
            Left = 291
            Top = 103
            Width = 63
            Height = 21
            Color = clMenuBar
            Enabled = False
            TabOrder = 9
            Text = '0000'
            OnKeyPress = edtAttenuationKeyPress
            OnKeyUp = edtAttenuationKeyUp
          end
          object lbdBFirstCZ: TStaticText
            Left = 360
            Top = 78
            Width = 16
            Height = 17
            Caption = 'dB'
            TabOrder = 10
          end
          object lbldBAttenuation: TStaticText
            Left = 360
            Top = 105
            Width = 16
            Height = 17
            Caption = 'dB'
            TabOrder = 11
          end
          object lblMaxSonarTarget: TStaticText
            Left = 9
            Top = 132
            Width = 280
            Height = 17
            Caption = 'Maximum Sonar/Target Depth to Apply CZ Signal Excess :'
            TabOrder = 12
          end
          object edtMaxSonarTarget: TEdit
            Left = 291
            Top = 130
            Width = 63
            Height = 21
            Color = clMenuBar
            Enabled = False
            TabOrder = 13
            Text = '300'
            OnKeyPress = edtMaxSonarTargetKeyPress
            OnKeyUp = edtMaxSonarTargetKeyUp
          end
          object lblFeetMaxSonarTarget: TStaticText
            Left = 360
            Top = 131
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 14
          end
        end
        object cbCoverageZones: TCheckBox
          Left = 12
          Top = 9
          Width = 97
          Height = 17
          Caption = 'Coverage Zones'
          TabOrder = 1
          OnClick = cbCoverageZonesClick
        end
      end
      object Boundaries: TTabSheet
        Caption = 'Boundaries'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbTopLeft: TGroupBox
          Left = 3
          Top = 3
          Width = 310
          Height = 78
          Caption = 'Top-Left'
          TabOrder = 0
          object lblPositionTopLeft: TStaticText
            Left = 8
            Top = 16
            Width = 48
            Height = 17
            Caption = 'Position :'
            TabOrder = 0
          end
          object edtPositionTopLeft1: TEdit
            Left = 96
            Top = 14
            Width = 82
            Height = 21
            TabOrder = 1
          end
          object edtPositionTopLeft2: TEdit
            Left = 184
            Top = 14
            Width = 89
            Height = 21
            TabOrder = 2
          end
          object lblGridTopLeft: TStaticText
            Left = 8
            Top = 47
            Width = 30
            Height = 17
            Caption = 'Grid :'
            TabOrder = 3
          end
          object edtGridTopLeft1: TEdit
            Left = 96
            Top = 45
            Width = 82
            Height = 21
            TabOrder = 4
          end
          object edtGridTopLeft2: TEdit
            Left = 184
            Top = 45
            Width = 89
            Height = 21
            TabOrder = 5
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 87
          Width = 310
          Height = 78
          Caption = 'Bottom Right'
          TabOrder = 1
          object lblPositionBottomRight: TStaticText
            Left = 8
            Top = 16
            Width = 48
            Height = 17
            Caption = 'Position :'
            TabOrder = 0
          end
          object edtPositionBottomRight1: TEdit
            Left = 96
            Top = 14
            Width = 82
            Height = 21
            TabOrder = 1
          end
          object edtPositionBottomRight2: TEdit
            Left = 184
            Top = 14
            Width = 89
            Height = 21
            TabOrder = 2
          end
          object lblGridBottomRight: TStaticText
            Left = 8
            Top = 47
            Width = 30
            Height = 17
            Caption = 'Grid :'
            TabOrder = 3
          end
          object edtGridBottomRight1: TEdit
            Left = 96
            Top = 45
            Width = 82
            Height = 21
            TabOrder = 4
          end
          object edtGridBottomRight2: TEdit
            Left = 184
            Top = 45
            Width = 89
            Height = 21
            TabOrder = 5
          end
        end
        object grbAtmospheric: TGroupBox
          Left = 3
          Top = 171
          Width = 454
          Height = 182
          Caption = 'Atmospheric Sub/Super Refreaction Modifier'
          TabOrder = 2
          object trackAtmospheric: TTrackBar
            Left = 3
            Top = 24
            Width = 382
            Height = 45
            Max = 1000
            PageSize = 20
            Frequency = 20
            TabOrder = 2
            OnChange = trackAtmosphericChange
          end
          object edtAtmospheric: TEdit
            Left = 391
            Top = 24
            Width = 52
            Height = 21
            TabOrder = 0
            OnChange = edtAtmosphericChange
            OnKeyPress = edtAtmosphericKeyPress
            OnKeyUp = edtAtmosphericKeyUp
          end
          object lbl1Atmospheric: TStaticText
            Left = 12
            Top = 53
            Width = 21
            Height = 17
            Caption = '1%'
            TabOrder = 1
          end
          object lbl100Atmospheric: TStaticText
            Left = 358
            Top = 51
            Width = 39
            Height = 17
            Caption = '1000%'
            TabOrder = 3
          end
          object grbLegendTrackAtmospheric: TGroupBox
            Left = 12
            Top = 75
            Width = 166
            Height = 94
            Caption = 'Legend'
            TabOrder = 4
            object lblLegend1: TStaticText
              Left = 16
              Top = 24
              Width = 119
              Height = 17
              Caption = '< 100% Sub-Refrection'
              TabOrder = 0
            end
            object lblLegend2: TStaticText
              Left = 16
              Top = 47
              Width = 102
              Height = 17
              Caption = '100% No Refrection'
              TabOrder = 1
            end
            object lblLegend3: TStaticText
              Left = 16
              Top = 70
              Width = 129
              Height = 17
              Caption = '> 100% Super-Refrection'
              TabOrder = 2
            end
          end
        end
        object grbCommunicationEffects: TGroupBox
          Left = 3
          Top = 359
          Width = 454
          Height = 74
          Caption = 'Communication Effects'
          TabOrder = 3
          object cbHFTransmission: TCheckBox
            Left = 28
            Top = 24
            Width = 150
            Height = 33
            Caption = 'HF Transmission Black Hole'
            TabOrder = 0
          end
        end
      end
    end
  end
end
