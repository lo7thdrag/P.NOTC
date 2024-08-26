object SatellitePlatformForm: TSatellitePlatformForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Satellite'
  ClientHeight = 311
  ClientWidth = 500
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
    Width = 500
    Height = 49
    Align = alTop
    TabOrder = 0
    object lbl5: TLabel
      Left = 16
      Top = 7
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClass: TEdit
      Left = 16
      Top = 23
      Width = 473
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 270
    Width = 500
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 414
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 252
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
    Width = 500
    Height = 221
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 1
      Width = 473
      Height = 216
      ActivePage = Physical
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lbl1: TLabel
          Left = 19
          Top = 85
          Width = 122
          Height = 13
          Caption = 'Detection Range Radius :'
        end
        object lbl2: TLabel
          Left = 19
          Top = 133
          Width = 44
          Height = 13
          Caption = 'Altitude :'
        end
        object lbl3: TLabel
          Left = 267
          Top = 85
          Width = 139
          Height = 13
          Caption = 'Game Area Re-entry Period :'
        end
        object lbl4: TLabel
          Left = 267
          Top = 133
          Width = 75
          Height = 13
          Caption = 'Ground Speed :'
        end
        object lbl14: TLabel
          Left = 95
          Top = 107
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl15: TLabel
          Left = 95
          Top = 155
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object lbl16: TLabel
          Left = 343
          Top = 107
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl17: TLabel
          Left = 343
          Top = 155
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object grbRecognition: TGroupBox
          Left = 3
          Top = 19
          Width = 446
          Height = 54
          Caption = 'Recognition Capabilties'
          TabOrder = 0
          object cbPlatformType: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Platform Type'
            TabOrder = 0
          end
          object cbPlatformClass: TCheckBox
            Left = 264
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Platform Class'
            TabOrder = 1
          end
        end
        object edtDetectionRangeRadius: TEdit
          Left = 19
          Top = 104
          Width = 70
          Height = 21
          TabOrder = 1
          OnKeyPress = edtDetectionRangeRadiusKeyPress
          OnKeyUp = edtDetectionRangeRadiusKeyUp
        end
        object edtAltitude: TEdit
          Left = 19
          Top = 152
          Width = 70
          Height = 21
          TabOrder = 2
          OnKeyPress = edtAltitudeKeyPress
          OnKeyUp = edtAltitudeKeyUp
        end
        object edtGameArea: TEdit
          Left = 267
          Top = 104
          Width = 70
          Height = 21
          TabOrder = 3
          OnKeyPress = edtGameAreaKeyPress
          OnKeyUp = edtGameAreaKeyUp
        end
        object edtGroundSpeed: TEdit
          Left = 267
          Top = 152
          Width = 70
          Height = 21
          TabOrder = 4
          OnKeyPress = edtGroundSpeedKeyPress
          OnKeyUp = edtGroundSpeedKeyUp
        end
      end
      object Physical: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
        object grbDimensions: TGroupBox
          Left = 3
          Top = 16
          Width = 214
          Height = 105
          Caption = 'Dimensions'
          TabOrder = 0
          object lbl6: TLabel
            Left = 11
            Top = 25
            Width = 40
            Height = 13
            Caption = 'Length :'
          end
          object lbl7: TLabel
            Left = 11
            Top = 48
            Width = 35
            Height = 13
            Caption = 'Width :'
          end
          object lbl8: TLabel
            Left = 11
            Top = 75
            Width = 38
            Height = 13
            Caption = 'Height :'
          end
          object lbl11: TLabel
            Left = 153
            Top = 25
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object lbl12: TLabel
            Left = 153
            Top = 48
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object lbl13: TLabel
            Left = 153
            Top = 75
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object edtLength: TEdit
            Left = 88
            Top = 22
            Width = 49
            Height = 21
            TabOrder = 0
            OnKeyPress = edtLengthKeyPress
            OnKeyUp = edtLengthKeyUp
          end
          object edtWidth: TEdit
            Left = 88
            Top = 45
            Width = 49
            Height = 21
            TabOrder = 1
            OnKeyPress = edtWidthKeyPress
            OnKeyUp = edtWidthKeyUp
          end
          object edtHeight: TEdit
            Left = 88
            Top = 72
            Width = 49
            Height = 21
            TabOrder = 2
            OnKeyPress = edtHeightKeyPress
            OnKeyUp = edtHeightKeyUp
          end
        end
        object grbRadarCrossSection: TGroupBox
          Left = 240
          Top = 16
          Width = 209
          Height = 105
          Caption = 'Radar Cross-Section'
          TabOrder = 1
          object lbl9: TLabel
            Left = 11
            Top = 25
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object lbl10: TLabel
            Left = 11
            Top = 48
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object edtFront: TEdit
            Left = 88
            Top = 22
            Width = 49
            Height = 21
            TabOrder = 0
            OnKeyPress = edtFrontKeyPress
            OnKeyUp = edtFrontKeyUp
          end
          object edtSide: TEdit
            Left = 88
            Top = 45
            Width = 49
            Height = 21
            TabOrder = 1
            OnKeyPress = edtSideKeyPress
            OnKeyUp = edtSideKeyUp
          end
          object cbxDbm2Front: TComboBox
            Left = 143
            Top = 22
            Width = 56
            Height = 21
            Enabled = False
            TabOrder = 2
            Text = 'dB'
          end
          object cbxDbm2Side: TComboBox
            Left = 143
            Top = 45
            Width = 56
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = 'dB'
          end
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 2
        object mmNotes: TMemo
          Left = 0
          Top = 0
          Width = 462
          Height = 185
          Lines.Strings = (
            ''
            '')
          TabOrder = 0
        end
      end
    end
  end
end
