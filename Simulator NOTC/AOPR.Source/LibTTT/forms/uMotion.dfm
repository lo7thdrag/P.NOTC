object MotionHorizontalForm: TMotionHorizontalForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Motion'
  ClientHeight = 521
  ClientWidth = 397
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 397
    Height = 83
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 16
      Top = 24
      Width = 369
      Height = 21
      TabOrder = 1
    end
    object lblType: TStaticText
      Left = 16
      Top = 51
      Width = 35
      Height = 17
      Caption = 'Type :'
      TabOrder = 2
    end
    object cbxType: TComboBox
      Left = 80
      Top = 51
      Width = 105
      Height = 21
      TabOrder = 3
      Items.Strings = (
        'Mobile'
        'Fixed'
        'Drift-Current')
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 83
    Width = 397
    Height = 397
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 16
      Top = 1
      Width = 369
      Height = 392
      ActivePage = Endurance
      TabOrder = 0
      object Horizontal: TTabSheet
        Caption = 'Horizontal'
        object lblMinGroundSpeed: TStaticText
          Left = 3
          Top = 16
          Width = 122
          Height = 17
          Caption = 'Minimum Ground Speed :'
          TabOrder = 0
        end
        object edtMinGroundSpeed: TEdit
          Left = 224
          Top = 14
          Width = 57
          Height = 21
          TabOrder = 1
        end
        object lblKnotsMinGroundSpeed: TStaticText
          Left = 287
          Top = 16
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 2
        end
        object lblCruiseGroundSpeed: TStaticText
          Left = 3
          Top = 41
          Width = 112
          Height = 17
          Caption = 'Cruise Ground Speed :'
          TabOrder = 3
        end
        object edtCruiseGroundSpeed: TEdit
          Left = 224
          Top = 39
          Width = 57
          Height = 21
          TabOrder = 4
        end
        object lblKnotsCruiseGroundSpeed: TStaticText
          Left = 286
          Top = 41
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 5
        end
        object lblHighGroundSpeed: TStaticText
          Left = 3
          Top = 66
          Width = 103
          Height = 17
          Caption = 'High Ground Speed :'
          TabOrder = 6
        end
        object edtHighGroundSpeed: TEdit
          Left = 224
          Top = 64
          Width = 57
          Height = 21
          TabOrder = 7
        end
        object lblKnotsHighgroundSpeed: TStaticText
          Left = 286
          Top = 66
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 8
        end
        object lblMaxGroundSpeed: TStaticText
          Left = 3
          Top = 91
          Width = 126
          Height = 17
          Caption = 'Maximum Ground Speed :'
          TabOrder = 9
        end
        object edtMaxGroundSpeed: TEdit
          Left = 224
          Top = 89
          Width = 57
          Height = 21
          TabOrder = 10
        end
        object lblKnotsMaxGroundSpeed: TStaticText
          Left = 286
          Top = 91
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 11
        end
        object lblAcceleration: TStaticText
          Left = 3
          Top = 116
          Width = 70
          Height = 17
          Caption = 'Acceleration :'
          TabOrder = 12
        end
        object edtAcceleration: TEdit
          Left = 224
          Top = 114
          Width = 57
          Height = 21
          TabOrder = 13
        end
        object lblKnotsAcceleration: TStaticText
          Left = 286
          Top = 116
          Width = 50
          Height = 17
          Caption = 'knots/sec'
          TabOrder = 14
        end
        object lblDeceleration: TStaticText
          Left = 3
          Top = 141
          Width = 71
          Height = 17
          Caption = 'Deceleration :'
          TabOrder = 15
        end
        object edtDeceleration: TEdit
          Left = 224
          Top = 139
          Width = 57
          Height = 21
          TabOrder = 16
        end
        object lblKnotsDeceleration: TStaticText
          Left = 286
          Top = 141
          Width = 50
          Height = 17
          Caption = 'knots/sec'
          TabOrder = 17
        end
        object lblStandardTurnRate: TStaticText
          Left = 3
          Top = 166
          Width = 106
          Height = 17
          Caption = 'Standard Turn Rate :'
          TabOrder = 18
        end
        object edtStandardTurnRate: TEdit
          Left = 224
          Top = 164
          Width = 57
          Height = 21
          TabOrder = 19
        end
        object lblDegStandardTurnRate: TStaticText
          Left = 286
          Top = 166
          Width = 42
          Height = 17
          Caption = 'deg/sec'
          TabOrder = 20
        end
        object lblTightTurnRate: TStaticText
          Left = 3
          Top = 191
          Width = 86
          Height = 17
          Caption = 'Tight Turn Rate :'
          TabOrder = 21
        end
        object edtTightTurnRate: TEdit
          Left = 224
          Top = 189
          Width = 57
          Height = 21
          TabOrder = 22
        end
        object lblDegTightTurnRate: TStaticText
          Left = 286
          Top = 191
          Width = 42
          Height = 17
          Caption = 'deg/sec'
          TabOrder = 23
        end
        object lblMaxHelmAngle: TStaticText
          Left = 3
          Top = 216
          Width = 111
          Height = 17
          Caption = 'Maximum Helm Angle :'
          TabOrder = 24
        end
        object edtMaxHelmAngle: TEdit
          Left = 224
          Top = 214
          Width = 57
          Height = 21
          TabOrder = 25
        end
        object lblDegreesMaxHelmAngle: TStaticText
          Left = 286
          Top = 216
          Width = 43
          Height = 17
          Caption = 'degrees'
          TabOrder = 26
        end
        object lblHelmAngleRate: TStaticText
          Left = 3
          Top = 241
          Width = 90
          Height = 17
          Caption = 'Helm Angle Rate :'
          TabOrder = 27
        end
        object edtHelmAngleRate: TEdit
          Left = 224
          Top = 239
          Width = 57
          Height = 21
          TabOrder = 28
        end
        object lblDegHelmAngleRate: TStaticText
          Left = 286
          Top = 241
          Width = 42
          Height = 17
          Caption = 'deg/sec'
          TabOrder = 29
        end
      end
      object Vertical: TTabSheet
        Caption = 'Vertical'
        ImageIndex = 1
        object lblMaxAltitude: TStaticText
          Left = 3
          Top = 16
          Width = 95
          Height = 17
          Caption = 'Maximum Altitude :'
          TabOrder = 0
        end
        object edtMaxAltitude: TEdit
          Left = 152
          Top = 14
          Width = 57
          Height = 21
          TabOrder = 1
        end
        object lblMetresMaxAltitude: TStaticText
          Left = 215
          Top = 16
          Width = 37
          Height = 17
          Caption = 'metres'
          TabOrder = 2
        end
        object lblMaxDepth: TStaticText
          Left = 3
          Top = 41
          Width = 87
          Height = 17
          Caption = 'Maximum Depth :'
          TabOrder = 3
        end
        object edtMaxDepth: TEdit
          Left = 152
          Top = 39
          Width = 57
          Height = 21
          TabOrder = 4
        end
        object lblMetresMaxDepth: TStaticText
          Left = 214
          Top = 41
          Width = 37
          Height = 17
          Caption = 'metres'
          TabOrder = 5
        end
        object lblNormalClimbRate: TStaticText
          Left = 3
          Top = 66
          Width = 98
          Height = 17
          Caption = 'Normal Climb Rate :'
          TabOrder = 6
        end
        object edtNormalClimbRate: TEdit
          Left = 152
          Top = 64
          Width = 57
          Height = 21
          TabOrder = 7
        end
        object lblFeetNormalClimbRate: TStaticText
          Left = 214
          Top = 66
          Width = 44
          Height = 17
          Caption = 'feet/min'
          TabOrder = 8
        end
        object lblMaxClimbRate: TStaticText
          Left = 3
          Top = 91
          Width = 109
          Height = 17
          Caption = 'Maximum Climb Rate :'
          TabOrder = 9
        end
        object edtMaxClimbRate: TEdit
          Left = 152
          Top = 90
          Width = 57
          Height = 21
          TabOrder = 10
        end
        object lblFeetMaxClimbRate: TStaticText
          Left = 214
          Top = 92
          Width = 44
          Height = 17
          Caption = 'feet/min'
          TabOrder = 11
        end
        object lblNormalDescentRate: TStaticText
          Left = 3
          Top = 116
          Width = 112
          Height = 17
          Caption = 'Normal Descent Rate :'
          TabOrder = 12
        end
        object edtNormalDescentRate: TEdit
          Left = 152
          Top = 115
          Width = 57
          Height = 21
          TabOrder = 13
        end
        object lblFeetNormalDescentRate: TStaticText
          Left = 214
          Top = 117
          Width = 44
          Height = 17
          Caption = 'feet/min'
          TabOrder = 14
        end
        object lblMaxDescentRate: TStaticText
          Left = 3
          Top = 141
          Width = 123
          Height = 17
          Caption = 'Maximum Descent Rate :'
          TabOrder = 15
        end
        object edtMaxDescentRate: TEdit
          Left = 152
          Top = 140
          Width = 57
          Height = 21
          TabOrder = 16
        end
        object lblFeetMaxDescentRate: TStaticText
          Left = 214
          Top = 142
          Width = 44
          Height = 17
          Caption = 'feet/min'
          TabOrder = 17
        end
        object lblVerticalAcceleration: TStaticText
          Left = 3
          Top = 166
          Width = 108
          Height = 17
          Caption = 'Vertical Acceleration :'
          TabOrder = 18
        end
        object edtVerticalAcceleration: TEdit
          Left = 152
          Top = 166
          Width = 57
          Height = 21
          TabOrder = 19
        end
        object lblFeetVerticalAcceleration: TStaticText
          Left = 214
          Top = 168
          Width = 64
          Height = 17
          Caption = 'feet/min/sec'
          TabOrder = 20
        end
      end
      object Endurance: TTabSheet
        Caption = 'Endurance'
        ImageIndex = 2
        object lblEnduranceType: TStaticText
          Left = 13
          Top = 18
          Width = 35
          Height = 17
          Caption = 'Type :'
          TabOrder = 0
        end
        object cbxEnduranceType: TComboBox
          Left = 78
          Top = 16
          Width = 107
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'Fuel'
            'Time'
            'Range'
            'Unlimited')
        end
        object grbFuel: TGroupBox
          Left = 3
          Top = 41
          Width = 350
          Height = 200
          Caption = 'Fuel'
          TabOrder = 2
          object lblUnits: TStaticText
            Left = 10
            Top = 24
            Width = 35
            Height = 17
            Caption = 'Units :'
            TabOrder = 0
          end
          object cbxUnits: TComboBox
            Left = 75
            Top = 22
            Width = 107
            Height = 21
            TabOrder = 1
            Items.Strings = (
              'cubic metres'
              'US gallons'
              'pounds'
              'kilograms'
              'litres'
              'metric tonnes')
          end
          object lblMaxFuelCapacity: TStaticText
            Left = 10
            Top = 56
            Width = 123
            Height = 17
            Caption = 'Maximum Fuel Capacity :'
            TabOrder = 2
          end
          object edtMaxFuelCapacity: TEdit
            Left = 91
            Top = 72
            Width = 54
            Height = 21
            TabOrder = 3
          end
          object lblFuelConsumptionPerHour: TStaticText
            Left = 10
            Top = 104
            Width = 141
            Height = 17
            Caption = 'Fuel Consumption per Hour :'
            TabOrder = 4
          end
          object lblMinimum: TStaticText
            Left = 10
            Top = 136
            Width = 51
            Height = 17
            Caption = 'Minimum :'
            TabOrder = 5
          end
          object edtMinimum: TEdit
            Left = 91
            Top = 134
            Width = 54
            Height = 21
            TabOrder = 6
          end
          object lblCruise: TStaticText
            Left = 10
            Top = 168
            Width = 41
            Height = 17
            Caption = 'Cruise :'
            TabOrder = 7
          end
          object edtCruise: TEdit
            Left = 91
            Top = 166
            Width = 54
            Height = 21
            TabOrder = 8
          end
          object lblHigh: TStaticText
            Left = 178
            Top = 136
            Width = 32
            Height = 17
            Caption = 'High :'
            TabOrder = 9
          end
          object edtHigh: TEdit
            Left = 259
            Top = 134
            Width = 54
            Height = 21
            TabOrder = 10
          end
          object lblMaximum: TStaticText
            Left = 178
            Top = 168
            Width = 55
            Height = 17
            Caption = 'Maximum :'
            TabOrder = 11
          end
          object edtMaximum: TEdit
            Left = 259
            Top = 166
            Width = 54
            Height = 21
            TabOrder = 12
          end
        end
        object grbEnduranceTime: TGroupBox
          Left = 3
          Top = 247
          Width = 172
          Height = 58
          Caption = 'Endurance Time'
          TabOrder = 3
          object edtEnduranceTime: TEdit
            Left = 10
            Top = 26
            Width = 79
            Height = 21
            TabOrder = 0
          end
          object lblEnduranceTime: TStaticText
            Left = 95
            Top = 28
            Width = 50
            Height = 17
            Caption = 'hh:mm:ss'
            TabOrder = 1
          end
        end
        object grbMaxEffectiveRange: TGroupBox
          Left = 181
          Top = 247
          Width = 172
          Height = 58
          Caption = 'Maximum Effective Range'
          TabOrder = 4
          object edtMaxEffectiveRange: TEdit
            Left = 10
            Top = 26
            Width = 79
            Height = 21
            TabOrder = 0
          end
          object lblnmMaxEffectiveRange: TStaticText
            Left = 95
            Top = 28
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 1
          end
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 480
    Width = 397
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnApply: TButton
      Left = 310
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 231
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 152
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
end
