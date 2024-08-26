object fMineSummary: TfMineSummary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Mine'
  ClientHeight = 593
  ClientWidth = 496
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
    Width = 496
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 10
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClassMine: TEdit
      Left = 10
      Top = 20
      Width = 463
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 552
    Width = 496
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnApply: TButton
      Left = 415
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 330
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 245
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
    Width = 496
    Height = 503
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 6
      Width = 480
      Height = 499
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label2: TLabel
          Left = 3
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Category'
        end
        object Label3: TLabel
          Left = 129
          Top = 15
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label4: TLabel
          Left = 129
          Top = 43
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label5: TLabel
          Left = 3
          Top = 42
          Width = 65
          Height = 13
          Caption = 'Mooring Type'
        end
        object Label7: TLabel
          Left = 129
          Top = 70
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label8: TLabel
          Left = 3
          Top = 69
          Width = 87
          Height = 13
          Caption = 'Detectability Type'
        end
        object Label9: TLabel
          Left = 129
          Top = 96
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label14: TLabel
          Left = 193
          Top = 97
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label15: TLabel
          Left = 3
          Top = 96
          Width = 110
          Height = 13
          Caption = 'Maximum Laying Depth'
        end
        object cbCategory: TComboBox
          Left = 135
          Top = 11
          Width = 273
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Acoustic'
            'Impact'
            'Magnetic'
            'Pressure')
        end
        object cbMooringType: TComboBox
          Left = 135
          Top = 39
          Width = 273
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'Fixed'
            'Floating')
        end
        object grbLethality: TGroupBox
          Left = 3
          Top = 395
          Width = 450
          Height = 58
          Caption = 'Lethality'
          TabOrder = 2
          object Label10: TLabel
            Left = 332
            Top = 42
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object Label11: TLabel
            Left = 19
            Top = 42
            Width = 6
            Height = 13
            Caption = '0'
          end
          object edtLethality: TEdit
            Left = 378
            Top = 15
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarLethality: TTrackBar
            Left = 12
            Top = 13
            Width = 360
            Height = 23
            Max = 4
            TabOrder = 1
            ThumbLength = 15
          end
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 324
          Width = 222
          Height = 65
          Caption = 'Capabilities'
          TabOrder = 3
          object cbxAntiSurface: TCheckBox
            Left = 11
            Top = 16
            Width = 91
            Height = 17
            Caption = 'Anti-Surface'
            TabOrder = 0
          end
          object cbxAntiSubSurface: TCheckBox
            Left = 11
            Top = 39
            Width = 117
            Height = 17
            Caption = 'Anti-Subsurface'
            TabOrder = 1
          end
        end
        object cbDetectabilityType: TComboBox
          Left = 135
          Top = 66
          Width = 273
          Height = 21
          TabOrder = 4
          Items.Strings = (
            'Normal Detection'
            'Undetectable'
            'Passive Detection'
            'Always Visible')
        end
        object edtMaxLayingDepth: TEdit
          Left = 135
          Top = 93
          Width = 52
          Height = 21
          TabOrder = 5
        end
        object grbDimensions: TGroupBox
          Left = 3
          Top = 120
          Width = 450
          Height = 118
          Caption = 'Dimensions'
          TabOrder = 6
          object Label16: TLabel
            Left = 99
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label17: TLabel
            Left = 167
            Top = 23
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label18: TLabel
            Left = 11
            Top = 55
            Width = 28
            Height = 13
            Caption = 'Width'
          end
          object Label19: TLabel
            Left = 99
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label20: TLabel
            Left = 167
            Top = 55
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label21: TLabel
            Left = 11
            Top = 87
            Width = 31
            Height = 13
            Caption = 'Height'
          end
          object Label22: TLabel
            Left = 99
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 167
            Top = 87
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label24: TLabel
            Left = 247
            Top = 22
            Width = 94
            Height = 13
            Caption = 'Engagement Range '
            WordWrap = True
          end
          object Label25: TLabel
            Left = 347
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label26: TLabel
            Left = 415
            Top = 23
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label27: TLabel
            Left = 11
            Top = 23
            Width = 33
            Height = 13
            Caption = 'Length'
          end
          object edtLengthDimension: TEdit
            Left = 109
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtWidthDimension: TEdit
            Left = 109
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtHeightDimension: TEdit
            Left = 109
            Top = 83
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object edtEngagementRangeDimension: TEdit
            Left = 357
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 3
          end
        end
        object grbAcousticCrossSection: TGroupBox
          Left = 3
          Top = 244
          Width = 222
          Height = 74
          Caption = 'Acoustic Cross-Section'
          TabOrder = 7
          object Label37: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label38: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object edtFrontRadarPhysical: TEdit
            Left = 82
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbFrontRadarPhysical: TComboBox
            Left = 140
            Top = 16
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = 'dB m'#178
          end
          object edtSideRadarPhysical: TEdit
            Left = 82
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object cbSideRadarPhysical: TComboBox
            Left = 140
            Top = 43
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = 'dB m'#178
          end
        end
        object grbProbOfDetonationCurve: TGroupBox
          Left = 231
          Top = 244
          Width = 222
          Height = 74
          Caption = 'Prob of Detonation Curve'
          TabOrder = 8
          object btnEditProbOfDetonanationCurve: TButton
            Left = 80
            Top = 24
            Width = 75
            Height = 25
            Caption = 'Edit...'
            TabOrder = 0
          end
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Notes'
        ImageIndex = 5
        object Memo1: TMemo
          Left = 3
          Top = 3
          Width = 456
          Height = 558
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
      end
    end
  end
end
