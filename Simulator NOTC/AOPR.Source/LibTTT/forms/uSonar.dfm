object fSonar: TfSonar
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sonar'
  ClientHeight = 591
  ClientWidth = 467
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
    Width = 467
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 33
      Height = 17
      Caption = 'Class:'
      TabOrder = 0
    end
    object edtClass: TEdit
      Left = 16
      Top = 23
      Width = 437
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 550
    Width = 467
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnApply: TButton
      Left = 382
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 300
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 218
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
    Width = 467
    Height = 501
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 4
      Width = 441
      Height = 491
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Label1: TLabel
          Left = 11
          Top = 11
          Width = 45
          Height = 13
          Caption = 'Category'
        end
        object Label2: TLabel
          Left = 90
          Top = 11
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label3: TLabel
          Left = 11
          Top = 38
          Width = 77
          Height = 13
          Caption = 'Operating Mode'
        end
        object Label4: TLabel
          Left = 90
          Top = 38
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label7: TLabel
          Left = 11
          Top = 153
          Width = 113
          Height = 13
          Caption = 'Active Detection Range'
        end
        object Label8: TLabel
          Left = 265
          Top = 153
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 11
          Top = 180
          Width = 121
          Height = 13
          Caption = 'Associated Cross-Section'
        end
        object Label10: TLabel
          Left = 265
          Top = 180
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label11: TLabel
          Left = 11
          Top = 207
          Width = 119
          Height = 13
          Caption = 'Passive Detection Range'
        end
        object Label12: TLabel
          Left = 265
          Top = 207
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label13: TLabel
          Left = 11
          Top = 234
          Width = 147
          Height = 13
          Caption = 'Associated Signal Source Level'
        end
        object Label14: TLabel
          Left = 265
          Top = 234
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label15: TLabel
          Left = 11
          Top = 261
          Width = 127
          Height = 13
          Caption = 'Maximum Detection Range'
        end
        object Label16: TLabel
          Left = 265
          Top = 261
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label17: TLabel
          Left = 11
          Top = 288
          Width = 145
          Height = 13
          Caption = 'Active Sonar Operating Power'
        end
        object Label18: TLabel
          Left = 265
          Top = 288
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label19: TLabel
          Left = 11
          Top = 315
          Width = 148
          Height = 13
          Caption = 'Active Frequency of Operation'
        end
        object Label20: TLabel
          Left = 265
          Top = 315
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label21: TLabel
          Left = 351
          Top = 152
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label22: TLabel
          Left = 351
          Top = 203
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label23: TLabel
          Left = 351
          Top = 314
          Width = 17
          Height = 13
          Caption = 'kHz'
        end
        object Label5: TLabel
          Left = 11
          Top = 343
          Width = 154
          Height = 13
          Caption = 'Passive Frequency of Operation'
        end
        object Label6: TLabel
          Left = 265
          Top = 343
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label52: TLabel
          Left = 11
          Top = 370
          Width = 127
          Height = 13
          Caption = 'Maximum Operating Depth'
        end
        object Label53: TLabel
          Left = 265
          Top = 370
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label54: TLabel
          Left = 11
          Top = 397
          Width = 253
          Height = 13
          Caption = 'Ownship Noise Increase due to Sonar in Active Mode'
        end
        object Label55: TLabel
          Left = 265
          Top = 396
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label56: TLabel
          Left = 11
          Top = 424
          Width = 108
          Height = 13
          Caption = 'Maximum Sonar Speed'
        end
        object Label57: TLabel
          Left = 265
          Top = 424
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label60: TLabel
          Left = 351
          Top = 339
          Width = 17
          Height = 13
          Caption = 'kHz'
        end
        object Label58: TLabel
          Left = 351
          Top = 233
          Width = 12
          Height = 13
          Caption = 'dB'
        end
        object Label59: TLabel
          Left = 351
          Top = 258
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label61: TLabel
          Left = 351
          Top = 287
          Width = 15
          Height = 13
          Caption = 'kW'
        end
        object Label62: TLabel
          Left = 351
          Top = 393
          Width = 12
          Height = 13
          Caption = 'dB'
        end
        object Label63: TLabel
          Left = 351
          Top = 423
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object Label64: TLabel
          Left = 351
          Top = 366
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object cbCategoryGeneralSonar: TComboBox
          Left = 100
          Top = 7
          Width = 117
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Hull-Mounted'
            'Variable Depth'
            'Towed Array'
            'Sonobuoy'
            'Dipping')
        end
        object cbOperatignMOdeGeneralSonar: TComboBox
          Left = 100
          Top = 34
          Width = 117
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'Active'
            'Passive'
            'Active/Passive'
            'Passive Intercept')
        end
        object edtActiveDetectionRangeGeneral: TEdit
          Left = 272
          Top = 149
          Width = 73
          Height = 21
          TabOrder = 2
        end
        object edtAssociatedCrossGeneral: TEdit
          Left = 272
          Top = 176
          Width = 73
          Height = 21
          TabOrder = 3
        end
        object edtPassiveDetectionGeneral: TEdit
          Left = 272
          Top = 203
          Width = 73
          Height = 21
          TabOrder = 4
        end
        object edtAssociatedSignalGeneral: TEdit
          Left = 272
          Top = 230
          Width = 73
          Height = 21
          TabOrder = 5
        end
        object edtMaxDetectionGeneral: TEdit
          Left = 272
          Top = 257
          Width = 73
          Height = 21
          TabOrder = 6
        end
        object edtActiveSonarGeneral: TEdit
          Left = 272
          Top = 284
          Width = 73
          Height = 21
          TabOrder = 7
        end
        object edtActiveFreqGeneral: TEdit
          Left = 272
          Top = 311
          Width = 73
          Height = 21
          TabOrder = 8
        end
        object cbxAssociatedCross: TComboBox
          Left = 351
          Top = 176
          Width = 72
          Height = 21
          Enabled = False
          TabOrder = 9
          Text = 'dB m'#178
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 61
          Width = 398
          Height = 76
          Caption = 'Active Detection Capabilities'
          TabOrder = 10
          object cbxSurfaceDetecting: TCheckBox
            Left = 16
            Top = 24
            Width = 113
            Height = 17
            Caption = 'Surface Detecting'
            TabOrder = 0
          end
          object cbxTorpedoDetecting: TCheckBox
            Left = 224
            Top = 24
            Width = 145
            Height = 17
            Caption = 'Torpedo Detecting'
            TabOrder = 1
          end
          object cbxSubSurfaceDetecting: TCheckBox
            Left = 16
            Top = 47
            Width = 121
            Height = 17
            Caption = 'Subsurface Detecting'
            TabOrder = 2
          end
          object cbxMineClass: TCheckBox
            Left = 224
            Top = 47
            Width = 145
            Height = 17
            Caption = 'Mine Detecting'
            TabOrder = 3
          end
        end
        object edtPassiveFreqGeneral: TEdit
          Left = 272
          Top = 339
          Width = 73
          Height = 21
          TabOrder = 11
        end
        object edtMaxOperatingGeneral: TEdit
          Left = 272
          Top = 366
          Width = 73
          Height = 21
          TabOrder = 12
        end
        object edtOwnshipNoiseGeneral: TEdit
          Left = 272
          Top = 393
          Width = 73
          Height = 21
          TabOrder = 13
        end
        object edtMaxSonarSpeedGeneral: TEdit
          Left = 272
          Top = 420
          Width = 73
          Height = 21
          TabOrder = 14
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Characteristics'
        ImageIndex = 1
        object sbSearchSignalToNoise: TSpeedButton
          Left = 402
          Top = 265
          Width = 23
          Height = 22
          Caption = '...'
        end
        object Label39: TLabel
          Left = 191
          Top = 215
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label40: TLabel
          Left = 14
          Top = 215
          Width = 157
          Height = 13
          Caption = 'Time Required to Identify Target'
        end
        object Label41: TLabel
          Left = 277
          Top = 215
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label42: TLabel
          Left = 191
          Top = 297
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label43: TLabel
          Left = 14
          Top = 297
          Width = 63
          Height = 13
          Caption = 'Coble Length'
        end
        object Label44: TLabel
          Left = 277
          Top = 297
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label65: TLabel
          Left = 191
          Top = 324
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label66: TLabel
          Left = 14
          Top = 324
          Width = 90
          Height = 13
          Caption = 'Coble Payout Rate'
        end
        object Label67: TLabel
          Left = 277
          Top = 324
          Width = 40
          Height = 13
          Caption = 'feet/sec'
        end
        object StaticText1: TStaticText
          Left = 3
          Top = 250
          Width = 280
          Height = 17
          Caption = 'Signal-To-Noise Ration vs Probability of Detection Curve :'
          TabOrder = 0
        end
        object edtSignalToNoise: TEdit
          Left = 3
          Top = 265
          Width = 393
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 3
          Width = 393
          Height = 78
          Caption = 'Integration Period'
          TabOrder = 2
          object Label25: TLabel
            Left = 188
            Top = 25
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label26: TLabel
            Left = 11
            Top = 25
            Width = 30
            Height = 13
            Caption = 'Active'
          end
          object Label28: TLabel
            Left = 274
            Top = 25
            Width = 46
            Height = 13
            Caption = 'hh:mm:ss'
          end
          object Label24: TLabel
            Left = 188
            Top = 52
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label27: TLabel
            Left = 11
            Top = 52
            Width = 36
            Height = 13
            Caption = 'Passive'
          end
          object Label29: TLabel
            Left = 274
            Top = 52
            Width = 46
            Height = 13
            Caption = 'hh:mm:ss'
          end
          object edtActiveIntegrationPeriodCharacteristic: TEdit
            Left = 195
            Top = 21
            Width = 73
            Height = 21
            TabOrder = 0
          end
          object edtPassiveIntegrationPeriodCharacteristic: TEdit
            Left = 195
            Top = 48
            Width = 73
            Height = 21
            TabOrder = 1
          end
        end
        object GroupBox2: TGroupBox
          Left = 3
          Top = 87
          Width = 393
          Height = 105
          Caption = 'Time Interval of Watch Setting'
          TabOrder = 3
          object Label30: TLabel
            Left = 188
            Top = 25
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label31: TLabel
            Left = 11
            Top = 25
            Width = 60
            Height = 13
            Caption = 'Short Range'
          end
          object Label32: TLabel
            Left = 274
            Top = 25
            Width = 32
            Height = 13
            Caption = 'kyards'
          end
          object Label33: TLabel
            Left = 188
            Top = 52
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label34: TLabel
            Left = 11
            Top = 52
            Width = 70
            Height = 13
            Caption = 'Medium Range'
          end
          object Label35: TLabel
            Left = 274
            Top = 52
            Width = 32
            Height = 13
            Caption = 'kyards'
          end
          object Label36: TLabel
            Left = 188
            Top = 79
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label37: TLabel
            Left = 11
            Top = 79
            Width = 57
            Height = 13
            Caption = 'Long Range'
          end
          object Label38: TLabel
            Left = 274
            Top = 79
            Width = 32
            Height = 13
            Caption = 'kyards'
          end
          object edtShortRangeTimeInterval: TEdit
            Left = 195
            Top = 21
            Width = 73
            Height = 21
            TabOrder = 0
          end
          object edtMediumRangeTimeInterval: TEdit
            Left = 195
            Top = 48
            Width = 73
            Height = 21
            TabOrder = 1
          end
          object edtLongRangeTimeInterval: TEdit
            Left = 195
            Top = 75
            Width = 73
            Height = 21
            TabOrder = 2
          end
        end
        object edtTimeRequired: TEdit
          Left = 198
          Top = 211
          Width = 73
          Height = 21
          TabOrder = 4
        end
        object edtCobleLength: TEdit
          Left = 198
          Top = 293
          Width = 73
          Height = 21
          TabOrder = 5
        end
        object edtCoblePayoutRate: TEdit
          Left = 198
          Top = 320
          Width = 73
          Height = 21
          TabOrder = 6
        end
        object cbxPassiveTarget: TCheckBox
          Left = 14
          Top = 360
          Width = 157
          Height = 17
          Caption = 'Passive Target Investigation'
          TabOrder = 7
        end
        object cbxPassiveInvestigating: TCheckBox
          Left = 14
          Top = 383
          Width = 157
          Height = 17
          Caption = 'Passive TMA Investigating'
          TabOrder = 8
        end
        object cbxTracking: TCheckBox
          Left = 14
          Top = 431
          Width = 121
          Height = 17
          Caption = 'Tracking'
          TabOrder = 9
        end
        object cbxDepthFinding: TCheckBox
          Left = 14
          Top = 408
          Width = 113
          Height = 17
          Caption = 'Depth Finding'
          TabOrder = 10
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Towed Array'
        ImageIndex = 2
        object Label49: TLabel
          Left = 207
          Top = 114
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label50: TLabel
          Left = 14
          Top = 113
          Width = 96
          Height = 13
          Caption = 'Minimum Tow Speed'
        end
        object Label51: TLabel
          Left = 293
          Top = 114
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object Label70: TLabel
          Left = 207
          Top = 141
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label71: TLabel
          Left = 14
          Top = 140
          Width = 72
          Height = 13
          Caption = 'Minimum Depth'
        end
        object Label72: TLabel
          Left = 293
          Top = 141
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label73: TLabel
          Left = 207
          Top = 168
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label74: TLabel
          Left = 14
          Top = 167
          Width = 158
          Height = 13
          Caption = 'Maximum Bearing Reported Error'
        end
        object Label75: TLabel
          Left = 293
          Top = 168
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object Label76: TLabel
          Left = 207
          Top = 195
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label77: TLabel
          Left = 14
          Top = 194
          Width = 101
          Height = 13
          Caption = 'Average Beam Width'
        end
        object Label78: TLabel
          Left = 293
          Top = 195
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object grbBasicCapabilities: TGroupBox
          Left = 3
          Top = 11
          Width = 398
          Height = 86
          TabOrder = 0
          object Label45: TLabel
            Left = 204
            Top = 25
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label46: TLabel
            Left = 11
            Top = 25
            Width = 113
            Height = 13
            Caption = 'Turn Rate to Kink Array'
          end
          object Label47: TLabel
            Left = 290
            Top = 25
            Width = 38
            Height = 13
            Caption = 'deg/sec'
          end
          object Label48: TLabel
            Left = 204
            Top = 52
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label68: TLabel
            Left = 11
            Top = 52
            Width = 176
            Height = 13
            Caption = 'Time Required to Settle Kinked Array'
          end
          object Label69: TLabel
            Left = 290
            Top = 52
            Width = 46
            Height = 13
            Caption = 'hh:mm:ss'
          end
          object edtTurnRateToKink: TEdit
            Left = 211
            Top = 21
            Width = 73
            Height = 21
            TabOrder = 0
          end
          object edtTimeRequiredToSettle: TEdit
            Left = 211
            Top = 48
            Width = 73
            Height = 21
            TabOrder = 1
          end
        end
        object cbxArrayKinking: TCheckBox
          Left = 14
          Top = 0
          Width = 83
          Height = 17
          Caption = 'Array Kinking'
          TabOrder = 1
        end
        object edtMinimumTowSpeed: TEdit
          Left = 214
          Top = 110
          Width = 73
          Height = 21
          TabOrder = 2
        end
        object edtMinDepth: TEdit
          Left = 214
          Top = 137
          Width = 73
          Height = 21
          TabOrder = 3
        end
        object edtmaxBearingReported: TEdit
          Left = 214
          Top = 164
          Width = 73
          Height = 21
          TabOrder = 4
        end
        object edtMaxAverageBeamWidth: TEdit
          Left = 214
          Top = 191
          Width = 73
          Height = 21
          TabOrder = 5
        end
        object cbxBearingAmbiguity: TCheckBox
          Left = 14
          Top = 232
          Width = 176
          Height = 17
          Caption = 'Bearing Ambiguity Processing'
          TabOrder = 6
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Notes'
        ImageIndex = 3
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 422
          Height = 374
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
