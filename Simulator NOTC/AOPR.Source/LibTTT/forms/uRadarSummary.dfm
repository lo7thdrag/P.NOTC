object fRadarSummary: TfRadarSummary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radar'
  ClientHeight = 547
  ClientWidth = 466
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
    Width = 466
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
    Top = 506
    Width = 466
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
    Width = 466
    Height = 457
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 6
      Width = 441
      Height = 451
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Label1: TLabel
          Left = 11
          Top = 11
          Width = 56
          Height = 13
          Caption = 'Radar Type'
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
          Width = 55
          Height = 13
          Caption = 'ECCM Type'
        end
        object Label4: TLabel
          Left = 90
          Top = 38
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label5: TLabel
          Left = 11
          Top = 65
          Width = 61
          Height = 13
          Caption = 'Emitter Type'
        end
        object Label6: TLabel
          Left = 90
          Top = 65
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label7: TLabel
          Left = 11
          Top = 105
          Width = 122
          Height = 13
          Caption = 'Baseline Detection Range'
        end
        object Label8: TLabel
          Left = 200
          Top = 105
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 11
          Top = 132
          Width = 121
          Height = 13
          Caption = 'Associated Cross-Section'
        end
        object Label10: TLabel
          Left = 200
          Top = 132
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label11: TLabel
          Left = 11
          Top = 159
          Width = 188
          Height = 13
          Caption = 'Maximum Unambigous Detection Range'
        end
        object Label12: TLabel
          Left = 200
          Top = 159
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label13: TLabel
          Left = 11
          Top = 186
          Width = 173
          Height = 13
          Caption = 'Number of FCR Channels Supported'
        end
        object Label14: TLabel
          Left = 200
          Top = 186
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label15: TLabel
          Left = 11
          Top = 213
          Width = 62
          Height = 13
          Caption = 'Spot Number'
        end
        object Label16: TLabel
          Left = 200
          Top = 213
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label17: TLabel
          Left = 11
          Top = 240
          Width = 87
          Height = 13
          Caption = 'OTH Radar Factor'
        end
        object Label18: TLabel
          Left = 200
          Top = 240
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label19: TLabel
          Left = 11
          Top = 267
          Width = 72
          Height = 13
          Caption = 'Main Lobe Gain'
        end
        object Label20: TLabel
          Left = 200
          Top = 267
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label21: TLabel
          Left = 351
          Top = 104
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label22: TLabel
          Left = 351
          Top = 155
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label23: TLabel
          Left = 351
          Top = 266
          Width = 12
          Height = 13
          Caption = 'dB'
        end
        object cbRadarTypeGeneral: TComboBox
          Left = 100
          Top = 7
          Width = 245
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Search radar'
            'Fire Control radar'
            'Search and Fire Control radar')
        end
        object cbECCMTypeGeneral: TComboBox
          Left = 100
          Top = 34
          Width = 245
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'A'
            'B'
            'C')
        end
        object edtEmitterTypeGeneral: TEdit
          Left = 100
          Top = 61
          Width = 245
          Height = 21
          TabOrder = 2
        end
        object edtBaselineDetectionGeneral: TEdit
          Left = 272
          Top = 101
          Width = 73
          Height = 21
          TabOrder = 3
        end
        object edtAssociatedCrossGeneral: TEdit
          Left = 272
          Top = 128
          Width = 73
          Height = 21
          TabOrder = 4
        end
        object edtMaxUnambigousGeneral: TEdit
          Left = 272
          Top = 155
          Width = 73
          Height = 21
          TabOrder = 5
        end
        object edtNumbOfFCRGeneral: TEdit
          Left = 272
          Top = 182
          Width = 73
          Height = 21
          TabOrder = 6
        end
        object edtSpotNumberGeneral: TEdit
          Left = 272
          Top = 209
          Width = 73
          Height = 21
          TabOrder = 7
        end
        object edtOTHRadarGeneral: TEdit
          Left = 272
          Top = 236
          Width = 73
          Height = 21
          TabOrder = 8
        end
        object edtMainLobeGeneral: TEdit
          Left = 272
          Top = 263
          Width = 73
          Height = 21
          TabOrder = 9
        end
        object cbxAssociatedCross: TComboBox
          Left = 351
          Top = 128
          Width = 72
          Height = 21
          Enabled = False
          TabOrder = 10
          Text = 'dB m'#178
        end
        object grbCapabilities: TGroupBox
          Left = 11
          Top = 296
          Width = 398
          Height = 105
          Caption = 'Capabilities'
          TabOrder = 11
          object cbxAltitudeData: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Altitude Data'
            TabOrder = 0
          end
          object cbxPlatformType: TCheckBox
            Left = 224
            Top = 24
            Width = 145
            Height = 17
            Caption = 'Platform Type Recognition'
            TabOrder = 1
          end
          object cbxGroundSpeed: TCheckBox
            Left = 16
            Top = 47
            Width = 121
            Height = 17
            Caption = 'Ground Speed Data'
            TabOrder = 2
          end
          object cbxPlatformClass: TCheckBox
            Left = 224
            Top = 47
            Width = 145
            Height = 17
            Caption = 'Platform Class Recognition'
            TabOrder = 3
          end
          object cbxHeadingData: TCheckBox
            Left = 16
            Top = 70
            Width = 97
            Height = 17
            Caption = 'Heading Data'
            TabOrder = 4
          end
          object cbxSectorscan: TCheckBox
            Left = 224
            Top = 70
            Width = 97
            Height = 17
            Caption = 'Sector Scan'
            TabOrder = 5
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Characteristics'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label24: TLabel
          Left = 3
          Top = 9
          Width = 51
          Height = 13
          Caption = 'Frequency'
        end
        object Label25: TLabel
          Left = 152
          Top = 8
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label26: TLabel
          Left = 3
          Top = 36
          Width = 49
          Height = 13
          Caption = 'Scan Rate'
        end
        object Label27: TLabel
          Left = 152
          Top = 35
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label28: TLabel
          Left = 3
          Top = 63
          Width = 131
          Height = 13
          Caption = 'Pulse Repetition Frequency'
        end
        object Label29: TLabel
          Left = 152
          Top = 62
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label30: TLabel
          Left = 3
          Top = 90
          Width = 56
          Height = 13
          Caption = 'Pulse Width'
        end
        object Label31: TLabel
          Left = 152
          Top = 89
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label32: TLabel
          Left = 152
          Top = 116
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label34: TLabel
          Left = 152
          Top = 143
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label35: TLabel
          Left = 152
          Top = 170
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label36: TLabel
          Left = 255
          Top = 9
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label37: TLabel
          Left = 255
          Top = 60
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label38: TLabel
          Left = 255
          Top = 171
          Width = 12
          Height = 13
          Caption = 'dB'
        end
        object Label39: TLabel
          Left = 255
          Top = 36
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label40: TLabel
          Left = 255
          Top = 90
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label41: TLabel
          Left = 255
          Top = 144
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label42: TLabel
          Left = 255
          Top = 119
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label33: TLabel
          Left = 3
          Top = 116
          Width = 30
          Height = 13
          Caption = 'Power'
        end
        object Label43: TLabel
          Left = 3
          Top = 143
          Width = 81
          Height = 13
          Caption = 'Clutter Rejection'
        end
        object Label44: TLabel
          Left = 3
          Top = 170
          Width = 57
          Height = 13
          Caption = 'Beam Width'
        end
        object sbSearchSignalToNoise: TSpeedButton
          Left = 402
          Top = 329
          Width = 23
          Height = 22
          Caption = '...'
        end
        object edtFreqCharacteristic: TEdit
          Left = 176
          Top = 6
          Width = 73
          Height = 21
          TabOrder = 0
        end
        object edtScanRateCharacteristic: TEdit
          Left = 176
          Top = 33
          Width = 73
          Height = 21
          TabOrder = 1
        end
        object edtPulseRepetitionCharacteristic: TEdit
          Left = 176
          Top = 60
          Width = 73
          Height = 21
          TabOrder = 2
        end
        object edtPulseWidthCharacteristic: TEdit
          Left = 176
          Top = 87
          Width = 73
          Height = 21
          TabOrder = 3
        end
        object edtPowerCharacteristic: TEdit
          Left = 176
          Top = 114
          Width = 73
          Height = 21
          TabOrder = 4
        end
        object edtClutterCharacteristic: TEdit
          Left = 176
          Top = 141
          Width = 73
          Height = 21
          TabOrder = 5
        end
        object edtBeamCharacteristic: TEdit
          Left = 176
          Top = 168
          Width = 73
          Height = 21
          TabOrder = 6
        end
        object grbVerticalCoverage1: TGroupBox
          Left = 3
          Top = 203
          Width = 206
          Height = 105
          BiDiMode = bdLeftToRight
          Caption = ' Vertical Coverage Curve 1'
          ParentBiDiMode = False
          TabOrder = 7
          object btnEdt1: TButton
            Left = 66
            Top = 32
            Width = 75
            Height = 25
            Caption = 'Edit...'
            TabOrder = 0
          end
        end
        object grbVerticalCoverage2: TGroupBox
          Left = 215
          Top = 203
          Width = 206
          Height = 105
          BiDiMode = bdLeftToRight
          Caption = ' Vertical Coverage Curve 2'
          ParentBiDiMode = False
          TabOrder = 8
          object btnEdt2: TButton
            Left = 119
            Top = 28
            Width = 75
            Height = 25
            Caption = 'Edit...'
            TabOrder = 0
          end
          object cbxValid: TCheckBox
            Left = 16
            Top = 32
            Width = 97
            Height = 17
            Caption = 'Valid'
            TabOrder = 1
          end
        end
        object StaticText1: TStaticText
          Left = 3
          Top = 314
          Width = 280
          Height = 17
          Caption = 'Signal-To-Noise Ration vs Probability of Detection Curve :'
          TabOrder = 9
        end
        object edtSignalToNoise: TEdit
          Left = 3
          Top = 329
          Width = 393
          Height = 21
          Enabled = False
          TabOrder = 10
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Anti Jamming'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbBasicCapabilities: TGroupBox
          Left = 3
          Top = 3
          Width = 342
          Height = 182
          Caption = 'Basic Capabilities'
          TabOrder = 0
          object Label45: TLabel
            Left = 9
            Top = 104
            Width = 231
            Height = 13
            Caption = 'Jammer Strength Reduction per Off-Axis Beam :'
          end
          object Label46: TLabel
            Left = 11
            Top = 155
            Width = 6
            Height = 13
            Caption = '1'
          end
          object Label47: TLabel
            Left = 239
            Top = 155
            Width = 18
            Height = 13
            Caption = '600'
          end
          object Label48: TLabel
            Left = 111
            Top = 155
            Width = 68
            Height = 13
            Caption = 'dB/beamwidth'
          end
          object cbxTypeA: TCheckBox
            Left = 19
            Top = 24
            Width = 160
            Height = 17
            Caption = 'Type A Jamming Resistant'
            TabOrder = 0
          end
          object cbxTypeB: TCheckBox
            Left = 19
            Top = 47
            Width = 152
            Height = 17
            Caption = 'Type B Jamming Resistant'
            TabOrder = 1
          end
          object cbxTypeC: TCheckBox
            Left = 19
            Top = 70
            Width = 152
            Height = 17
            Caption = 'Type C Jamming Resistant'
            TabOrder = 2
          end
          object TrackBarJammerReduction: TTrackBar
            Left = 3
            Top = 123
            Width = 254
            Height = 30
            Max = 6
            Min = 1
            Position = 1
            TabOrder = 3
            OnChange = TrackBarJammerReductionChange
          end
          object edtJammerStrength: TEdit
            Left = 263
            Top = 123
            Width = 50
            Height = 21
            TabOrder = 4
          end
        end
        object grbAntiJamming: TGroupBox
          Left = 3
          Top = 199
          Width = 342
          Height = 202
          TabOrder = 1
          object Label49: TLabel
            Left = 9
            Top = 104
            Width = 213
            Height = 26
            Caption = 
              'Percentage of Maximum Unambigous Range with Anti Jamming Active ' +
              ':'
            WordWrap = True
          end
          object Label50: TLabel
            Left = 11
            Top = 179
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label51: TLabel
            Left = 239
            Top = 179
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object cbxCancelTypeA: TCheckBox
            Left = 19
            Top = 24
            Width = 190
            Height = 17
            Caption = 'Cancel Effects of Type A Jamming'
            TabOrder = 0
          end
          object cbxCancelTypeB: TCheckBox
            Left = 19
            Top = 47
            Width = 190
            Height = 17
            Caption = 'Cancel Effects of Type B Jamming'
            TabOrder = 1
          end
          object cbxCancelTypeC: TCheckBox
            Left = 19
            Top = 70
            Width = 190
            Height = 17
            Caption = 'Cancel Effects of Type C Jamming'
            TabOrder = 2
          end
          object TrackBarPercenrageMaxUnambigous: TTrackBar
            Left = 3
            Top = 147
            Width = 254
            Height = 30
            Max = 5
            TabOrder = 3
            OnChange = TrackBarPercenrageMaxUnambigousChange
          end
          object edtPercentage: TEdit
            Left = 263
            Top = 147
            Width = 50
            Height = 21
            TabOrder = 4
          end
        end
        object cbxAntiJamming: TCheckBox
          Left = 14
          Top = 197
          Width = 131
          Height = 17
          Caption = 'Anti Jamming Capable'
          TabOrder = 2
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
            ''
            '')
          TabOrder = 0
        end
      end
    end
  end
end
