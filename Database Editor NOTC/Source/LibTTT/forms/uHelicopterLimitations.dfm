object frmHelicopterLimitations: TfrmHelicopterLimitations
  Left = 0
  Top = 0
  Caption = 'Helicopter Launch/Landing Limits'
  ClientHeight = 432
  ClientWidth = 481
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
    Width = 481
    Height = 465
    TabOrder = 0
    object pgc1: TPageControl
      Left = 8
      Top = 8
      Width = 465
      Height = 377
      ActivePage = tsGeneral
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grp1: TGroupBox
          Left = 3
          Top = 3
          Width = 446
          Height = 169
          Caption = 'Launch/Landing Limits'
          TabOrder = 0
          object lbl1: TLabel
            Left = 16
            Top = 24
            Width = 177
            Height = 13
            Caption = 'Ship Maximum Turn Rate To Launch :'
          end
          object lbl2: TLabel
            Left = 16
            Top = 54
            Width = 166
            Height = 13
            Caption = 'Ship Maximum Turn Rate To Land :'
          end
          object lbl3: TLabel
            Left = 16
            Top = 84
            Width = 173
            Height = 13
            Caption = 'Maximum Relative Wind Magnitude :'
          end
          object lbl4: TLabel
            Left = 16
            Top = 115
            Width = 167
            Height = 13
            Caption = 'Maximum Relative Speed To Land :'
          end
          object lbl9: TLabel
            Left = 336
            Top = 24
            Width = 38
            Height = 13
            Caption = 'deg/min'
          end
          object lbl10: TLabel
            Left = 336
            Top = 54
            Width = 38
            Height = 13
            Caption = 'deg/min'
          end
          object lbl11: TLabel
            Left = 336
            Top = 84
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object lbl12: TLabel
            Left = 336
            Top = 115
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object edtShipMaxTurnRate_toLaunch: TEdit
            Left = 248
            Top = 21
            Width = 57
            Height = 21
            TabOrder = 0
            OnKeyPress = edtShipMaxTurnRate_toLaunchKeyPress
            OnKeyUp = edtShipMaxTurnRate_toLaunchKeyUp
          end
          object edtShipMaxTurnRate_toLand: TEdit
            Left = 248
            Top = 51
            Width = 57
            Height = 21
            TabOrder = 1
            OnKeyPress = edtShipMaxTurnRate_toLandKeyPress
            OnKeyUp = edtShipMaxTurnRate_toLandKeyUp
          end
          object edtMaxRelativeWindMagnitude: TEdit
            Left = 248
            Top = 81
            Width = 57
            Height = 21
            TabOrder = 2
            OnKeyPress = edtMaxRelativeWindMagnitudeKeyPress
            OnKeyUp = edtMaxRelativeWindMagnitudeKeyUp
          end
          object edtMaxRelativeSpeedToLand: TEdit
            Left = 248
            Top = 112
            Width = 57
            Height = 21
            TabOrder = 3
            OnKeyPress = edtMaxRelativeSpeedToLandKeyPress
            OnKeyUp = edtMaxRelativeSpeedToLandKeyUp
          end
        end
        object grp2: TGroupBox
          Left = 3
          Top = 178
          Width = 446
          Height = 159
          Caption = 'Landing Box Limits'
          TabOrder = 1
          object lbl5: TLabel
            Left = 16
            Top = 24
            Width = 128
            Height = 13
            Caption = 'Approach Center Bearing :'
          end
          object lbl6: TLabel
            Left = 16
            Top = 53
            Width = 118
            Height = 13
            Caption = 'Approach Sector Width :'
          end
          object lbl7: TLabel
            Left = 16
            Top = 84
            Width = 87
            Height = 13
            Caption = 'Approach Range :'
          end
          object lbl8: TLabel
            Left = 16
            Top = 116
            Width = 134
            Height = 13
            Caption = 'Maximum Landing Altitude : '
          end
          object lbl13: TLabel
            Left = 336
            Top = 24
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object lbl14: TLabel
            Left = 336
            Top = 53
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object lbl15: TLabel
            Left = 336
            Top = 84
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object lbl16: TLabel
            Left = 336
            Top = 116
            Width = 33
            Height = 13
            Caption = 'metres'
          end
          object edtApproachCentBearing: TEdit
            Left = 248
            Top = 21
            Width = 57
            Height = 21
            TabOrder = 0
            OnKeyPress = edtApproachCentBearingKeyPress
            OnKeyUp = edtApproachCentBearingKeyUp
          end
          object edtApproachSectorWidth: TEdit
            Left = 248
            Top = 50
            Width = 57
            Height = 21
            TabOrder = 1
            OnKeyPress = edtApproachSectorWidthKeyPress
            OnKeyUp = edtApproachSectorWidthKeyUp
          end
          object edtApproachRange: TEdit
            Left = 248
            Top = 81
            Width = 57
            Height = 21
            TabOrder = 2
            OnKeyPress = edtApproachRangeKeyPress
            OnKeyUp = edtApproachRangeKeyUp
          end
          object edtMaxLandingAltitude: TEdit
            Left = 248
            Top = 113
            Width = 57
            Height = 21
            TabOrder = 3
            OnKeyPress = edtMaxLandingAltitudeKeyPress
            OnKeyUp = edtMaxLandingAltitudeKeyUp
          end
        end
      end
    end
    object btnOk: TButton
      Left = 232
      Top = 397
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 313
      Top = 397
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 394
      Top = 397
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 3
      OnClick = btnApplyClick
    end
  end
end
