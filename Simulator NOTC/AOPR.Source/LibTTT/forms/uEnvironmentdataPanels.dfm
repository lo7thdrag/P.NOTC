object EnvironmentDataPanelsForm: TEnvironmentDataPanelsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'TestEnvironment'
  ClientHeight = 788
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 34
    Align = alTop
    TabOrder = 0
    object btnD: TSpeedButton
      Left = 79
      Top = 3
      Width = 23
      Height = 22
    end
    object btnF: TSpeedButton
      Left = 201
      Top = 3
      Width = 23
      Height = 22
    end
    object btnG: TSpeedButton
      Left = 222
      Top = 3
      Width = 23
      Height = 22
    end
    object btnH: TSpeedButton
      Left = 243
      Top = 3
      Width = 23
      Height = 22
    end
    object btnA: TSpeedButton
      Left = 0
      Top = 3
      Width = 23
      Height = 22
    end
    object btnB: TSpeedButton
      Left = 21
      Top = 3
      Width = 23
      Height = 22
    end
    object btnE: TSpeedButton
      Left = 172
      Top = 3
      Width = 23
      Height = 22
    end
    object btnC: TSpeedButton
      Left = 50
      Top = 3
      Width = 23
      Height = 22
    end
    object cbxTop: TComboBox
      Left = 101
      Top = 3
      Width = 68
      Height = 21
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 34
    Width = 429
    Height = 718
    Align = alBottom
    TabOrder = 1
    object grbCursorPosition: TGroupBox
      Left = 10
      Top = 9
      Width = 407
      Height = 129
      Caption = 'Cursor Position'
      TabOrder = 0
      object lblBearingCursor1: TLabel
        Left = 154
        Top = 24
        Width = 3
        Height = 13
      end
      object lblDistanceCursor1: TLabel
        Left = 154
        Top = 45
        Width = 3
        Height = 13
      end
      object lblPositionCursor1: TLabel
        Left = 154
        Top = 67
        Width = 3
        Height = 13
      end
      object lblGridCursor1: TLabel
        Left = 154
        Top = 89
        Width = 3
        Height = 13
      end
      object lbldegreesT: TLabel
        Left = 296
        Top = 24
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object lblnm: TLabel
        Left = 296
        Top = 45
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object lblPositionCursor2: TLabel
        Left = 296
        Top = 67
        Width = 3
        Height = 13
      end
      object lblGridCursor2: TLabel
        Left = 296
        Top = 89
        Width = 3
        Height = 13
      end
      object BearingCursor: TStaticText
        Left = 16
        Top = 24
        Width = 108
        Height = 17
        Caption = 'Bearing from Centre :'
        TabOrder = 0
      end
      object DistanceCursor: TStaticText
        Left = 16
        Top = 47
        Width = 87
        Height = 17
        Caption = 'Distance Cursor :'
        TabOrder = 1
      end
      object PositionCursor: TStaticText
        Left = 16
        Top = 70
        Width = 48
        Height = 17
        Caption = 'Position :'
        TabOrder = 2
      end
      object GridCursor: TStaticText
        Left = 16
        Top = 93
        Width = 30
        Height = 17
        Caption = 'Grid :'
        TabOrder = 3
      end
    end
    object grbSelectedSubArea: TGroupBox
      Left = 9
      Top = 144
      Width = 407
      Height = 249
      Caption = 'Selected Sub-Area'
      TabOrder = 1
      object lblIdentifierSelected: TLabel
        Left = 154
        Top = 20
        Width = 3
        Height = 13
      end
      object lblPositionTopSelected1: TLabel
        Left = 154
        Top = 74
        Width = 3
        Height = 13
      end
      object lbGridTopSelected1: TLabel
        Left = 154
        Top = 102
        Width = 3
        Height = 13
      end
      object lblPositionTopSelected2: TLabel
        Left = 296
        Top = 74
        Width = 3
        Height = 13
      end
      object lbGridTopSelected2: TLabel
        Left = 296
        Top = 102
        Width = 3
        Height = 13
      end
      object lblPositionBottomSelected1: TLabel
        Left = 155
        Top = 162
        Width = 3
        Height = 13
      end
      object lblGridBottomSelected1: TLabel
        Left = 155
        Top = 190
        Width = 3
        Height = 13
      end
      object lblPositionBottomSelected2: TLabel
        Left = 297
        Top = 162
        Width = 3
        Height = 13
      end
      object lblGridBottomSelected2: TLabel
        Left = 297
        Top = 190
        Width = 3
        Height = 13
      end
      object IdentifierSelected: TStaticText
        Left = 16
        Top = 18
        Width = 55
        Height = 17
        Caption = 'Identifier :'
        TabOrder = 0
      end
      object TopLeft: TStaticText
        Left = 16
        Top = 45
        Width = 45
        Height = 17
        Caption = 'Top-Left'
        TabOrder = 1
      end
      object PositionTopSelected: TStaticText
        Left = 16
        Top = 72
        Width = 48
        Height = 17
        Caption = 'Position :'
        TabOrder = 2
      end
      object GridTopSelected: TStaticText
        Left = 16
        Top = 100
        Width = 52
        Height = 17
        Caption = 'Selected :'
        TabOrder = 3
      end
      object btnEditSelectedSubArea: TButton
        Left = 16
        Top = 216
        Width = 75
        Height = 25
        Caption = 'Edit...'
        TabOrder = 4
      end
      object BottomRightSelected: TStaticText
        Left = 17
        Top = 133
        Width = 67
        Height = 17
        Caption = 'Bottom-Right'
        TabOrder = 5
      end
      object PositionBottomSelected: TStaticText
        Left = 17
        Top = 160
        Width = 48
        Height = 17
        Caption = 'Position :'
        TabOrder = 6
      end
      object GridBottomSelected: TStaticText
        Left = 17
        Top = 188
        Width = 30
        Height = 17
        Caption = 'Grid :'
        TabOrder = 7
      end
    end
    object grbSonarPrediction: TGroupBox
      Left = 10
      Top = 399
      Width = 407
      Height = 313
      Caption = 'Sonar Prediction'
      TabOrder = 2
      object SpeedButton4: TSpeedButton
        Left = 383
        Top = 40
        Width = 23
        Height = 22
      end
      object SpeedButton5: TSpeedButton
        Left = 383
        Top = 83
        Width = 23
        Height = 22
      end
      object DefaultsSonar: TStaticText
        Left = 16
        Top = 24
        Width = 46
        Height = 17
        Caption = 'Default :'
        TabOrder = 0
      end
      object edtDefaultsSonar: TEdit
        Left = 16
        Top = 40
        Width = 361
        Height = 21
        TabOrder = 1
      end
      object Sonar: TStaticText
        Left = 16
        Top = 67
        Width = 32
        Height = 17
        Caption = 'Sonar'
        TabOrder = 2
      end
      object edtSonar: TEdit
        Left = 16
        Top = 83
        Width = 361
        Height = 21
        TabOrder = 3
      end
      object SonarModeSonar: TStaticText
        Left = 16
        Top = 122
        Width = 68
        Height = 17
        Caption = 'Sonar Mode :'
        TabOrder = 4
      end
      object SonarDepthSonar: TStaticText
        Left = 16
        Top = 149
        Width = 71
        Height = 17
        Caption = 'Sonar Depth :'
        TabOrder = 5
      end
      object TargetSourceLevelSonar: TStaticText
        Left = 16
        Top = 176
        Width = 107
        Height = 17
        Caption = 'Target Source Level :'
        TabOrder = 6
      end
      object TargetCrossSectionSonar: TStaticText
        Left = 16
        Top = 203
        Width = 112
        Height = 17
        Caption = 'Target Cross-Section :'
        TabOrder = 7
      end
      object TargetDepthSonar: TStaticText
        Left = 16
        Top = 230
        Width = 75
        Height = 17
        Caption = 'Target Depth :'
        TabOrder = 8
      end
      object PredictionRangeSonar: TStaticText
        Left = 16
        Top = 258
        Width = 92
        Height = 17
        Caption = 'Prediction Range :'
        TabOrder = 9
      end
      object cbxSonarModeSonar: TComboBox
        Left = 154
        Top = 120
        Width = 145
        Height = 21
        TabOrder = 10
      end
      object edtSonarDepthSonar: TEdit
        Left = 154
        Top = 147
        Width = 121
        Height = 21
        TabOrder = 11
      end
      object edtTargetSourceLevelSonar: TEdit
        Left = 154
        Top = 174
        Width = 121
        Height = 21
        TabOrder = 12
      end
      object edtTargetCrossSectionSonar: TEdit
        Left = 154
        Top = 201
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object edtTrgetDepthSonar: TEdit
        Left = 154
        Top = 228
        Width = 121
        Height = 21
        TabOrder = 14
      end
      object edtPredictionRangeSonar: TEdit
        Left = 154
        Top = 256
        Width = 121
        Height = 21
        TabOrder = 15
      end
      object feetSonarMode: TStaticText
        Left = 281
        Top = 150
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 16
      end
      object dBSonar: TStaticText
        Left = 281
        Top = 177
        Width = 16
        Height = 17
        Caption = 'dB'
        TabOrder = 17
      end
      object dBmSonar: TStaticText
        Left = 281
        Top = 204
        Width = 33
        Height = 17
        Caption = 'dB m2'
        TabOrder = 18
      end
      object feetTargetDepth: TStaticText
        Left = 281
        Top = 231
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 19
      end
      object nmPrediction: TStaticText
        Left = 281
        Top = 258
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 20
      end
      object btnCalculateSonar: TButton
        Left = 15
        Top = 281
        Width = 75
        Height = 25
        Caption = 'Calculate...'
        TabOrder = 21
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 752
    Width = 429
    Height = 36
    Align = alBottom
    Caption = 'Panel3'
    TabOrder = 2
    object btnClose: TButton
      Left = 341
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
    end
  end
end
