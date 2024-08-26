object fTowedjammerDecoy: TfTowedjammerDecoy
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Towed Jammer/Decoy'
  ClientHeight = 658
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 617
    Width = 443
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 358
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 276
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 190
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 10
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClassTowedJammer: TEdit
      Left = 10
      Top = 24
      Width = 423
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 443
    Height = 560
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 423
      Height = 554
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Bevel1: TBevel
          Left = 3
          Top = 271
          Width = 405
          Height = 2
        end
        object Label18: TLabel
          Left = 5
          Top = 283
          Width = 48
          Height = 13
          Caption = 'ECM Type'
        end
        object Label19: TLabel
          Left = 282
          Top = 279
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label20: TLabel
          Left = 5
          Top = 310
          Width = 116
          Height = 13
          Caption = 'Activation Control Delay'
        end
        object Label21: TLabel
          Left = 282
          Top = 310
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label27: TLabel
          Left = 357
          Top = 310
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label28: TLabel
          Left = 5
          Top = 337
          Width = 56
          Height = 13
          Caption = 'Tow Length'
        end
        object Label29: TLabel
          Left = 282
          Top = 337
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label30: TLabel
          Left = 357
          Top = 337
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object grbRadarCross: TGroupBox
          Left = 199
          Top = 27
          Width = 210
          Height = 81
          Caption = 'Radar Cross-Section'
          TabOrder = 0
          object Label1: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label3: TLabel
            Left = 11
            Top = 50
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label4: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label6: TLabel
            Left = 12
            Top = 23
            Width = 26
            Height = 13
            Caption = 'Front'
          end
          object edtFrontRadarCross: TEdit
            Left = 93
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideRadarCross: TEdit
            Left = 93
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object cbFrontRadarCross: TComboBox
            Left = 151
            Top = 19
            Width = 50
            Height = 21
            Enabled = False
            TabOrder = 2
            Text = 'dB m'#178
          end
          object cbSideRadarCross: TComboBox
            Left = 151
            Top = 46
            Width = 50
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = 'dB m'#178
          end
        end
        object grbDimensions: TGroupBox
          Left = 3
          Top = 3
          Width = 190
          Height = 106
          Caption = 'Dimensions'
          TabOrder = 1
          object Label53: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label54: TLabel
            Left = 151
            Top = 23
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label55: TLabel
            Left = 11
            Top = 50
            Width = 28
            Height = 13
            Caption = 'Width'
          end
          object Label56: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label57: TLabel
            Left = 151
            Top = 50
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label61: TLabel
            Left = 12
            Top = 23
            Width = 33
            Height = 13
            Caption = 'Length'
          end
          object Label48: TLabel
            Left = 11
            Top = 77
            Width = 31
            Height = 13
            Caption = 'Height'
          end
          object Label50: TLabel
            Left = 83
            Top = 77
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label122: TLabel
            Left = 151
            Top = 77
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object edtLengthDimensions: TEdit
            Left = 93
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtWidththDimensions: TEdit
            Left = 93
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtHeigthDimensions: TEdit
            Left = 93
            Top = 73
            Width = 52
            Height = 21
            TabOrder = 2
          end
        end
        object grbAcousticCross: TGroupBox
          Left = 3
          Top = 121
          Width = 190
          Height = 81
          Caption = 'Acoustic Cross-Section'
          TabOrder = 2
          object Label2: TLabel
            Left = 151
            Top = 24
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label5: TLabel
            Left = 151
            Top = 49
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label7: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label8: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label9: TLabel
            Left = 11
            Top = 50
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label10: TLabel
            Left = 12
            Top = 23
            Width = 26
            Height = 13
            Caption = 'Front'
          end
          object edtFrontAcousticCross: TEdit
            Left = 93
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideAcousticCross: TEdit
            Left = 93
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbVisualCross: TGroupBox
          Left = 199
          Top = 121
          Width = 210
          Height = 81
          Caption = 'Visual Cross-Section'
          TabOrder = 3
          object Label11: TLabel
            Left = 151
            Top = 24
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label13: TLabel
            Left = 151
            Top = 49
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label14: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label15: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label16: TLabel
            Left = 11
            Top = 50
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label17: TLabel
            Left = 12
            Top = 23
            Width = 26
            Height = 13
            Caption = 'Front'
          end
          object edtFrontVisualCross: TEdit
            Left = 93
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideVisualCross: TEdit
            Left = 93
            Top = 46
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbTargetSelection: TGroupBox
          Left = 3
          Top = 208
          Width = 406
          Height = 49
          Caption = 'Target Selection'
          TabOrder = 4
          object cbxTARHMissiles: TCheckBox
            Left = 12
            Top = 20
            Width = 97
            Height = 17
            Caption = 'TARH Missiles'
            TabOrder = 0
          end
          object cbxFireControlRadars: TCheckBox
            Left = 211
            Top = 21
            Width = 123
            Height = 17
            Caption = 'Fire Control Radars'
            TabOrder = 1
          end
        end
        object cbECMType: TComboBox
          Left = 292
          Top = 279
          Width = 59
          Height = 21
          TabOrder = 5
          Items.Strings = (
            'A'
            'B'
            'C')
        end
        object edtActivationControl: TEdit
          Left = 292
          Top = 306
          Width = 59
          Height = 21
          TabOrder = 6
        end
        object edtTowLength: TEdit
          Left = 292
          Top = 333
          Width = 59
          Height = 21
          TabOrder = 7
        end
        object grbProbOfSuccess: TGroupBox
          Left = 3
          Top = 360
          Width = 406
          Height = 159
          Caption = 'Probability of Success vs. ECCM Type'
          TabOrder = 8
          object Label12: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label22: TLabel
            Left = 12
            Top = 23
            Width = 34
            Height = 13
            Caption = 'Type A'
          end
          object Label159: TLabel
            Left = 107
            Top = 36
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label160: TLabel
            Left = 306
            Top = 36
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label23: TLabel
            Left = 83
            Top = 71
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label24: TLabel
            Left = 12
            Top = 71
            Width = 33
            Height = 13
            Caption = 'Type B'
          end
          object Label25: TLabel
            Left = 107
            Top = 84
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label26: TLabel
            Left = 306
            Top = 92
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label31: TLabel
            Left = 83
            Top = 117
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label32: TLabel
            Left = 12
            Top = 117
            Width = 34
            Height = 13
            Caption = 'Type C'
          end
          object Label33: TLabel
            Left = 107
            Top = 135
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label34: TLabel
            Left = 306
            Top = 135
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtTypeA: TEdit
            Left = 341
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object TrackBarTypeA: TTrackBar
            Left = 93
            Top = 17
            Width = 242
            Height = 24
            Max = 100
            Frequency = 25
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarTypeAChange
          end
          object edtTypeB: TEdit
            Left = 341
            Top = 67
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object TrackBarTypeB: TTrackBar
            Left = 93
            Top = 65
            Width = 242
            Height = 21
            Max = 100
            Frequency = 25
            TabOrder = 3
            ThumbLength = 15
            OnChange = TrackBarTypeBChange
          end
          object edtTypeC: TEdit
            Left = 341
            Top = 113
            Width = 52
            Height = 21
            TabOrder = 4
          end
          object TrackBarTypeC: TTrackBar
            Left = 93
            Top = 111
            Width = 241
            Height = 23
            Max = 100
            Frequency = 25
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarTypeCChange
          end
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object mmNotes: TMemo
          Left = 3
          Top = 0
          Width = 409
          Height = 523
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
