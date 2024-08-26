object fFloatingDecoy: TfFloatingDecoy
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Floating Decoy'
  ClientHeight = 552
  ClientWidth = 464
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
    Top = 511
    Width = 464
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 371
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 289
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 203
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
    Width = 464
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
    object edtClassFloatingDecoy: TEdit
      Left = 10
      Top = 24
      Width = 436
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 464
    Height = 454
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 447
      Height = 448
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Bevel1: TBevel
          Left = 3
          Top = 115
          Width = 421
          Height = 3
        end
        object Label9: TLabel
          Left = 3
          Top = 124
          Width = 78
          Height = 13
          Caption = 'Cross-Sections :'
        end
        object Bevel2: TBevel
          Left = 3
          Top = 331
          Width = 421
          Height = 3
        end
        object Label16: TLabel
          Left = 14
          Top = 344
          Width = 81
          Height = 13
          Caption = 'Lifetime Duration'
        end
        object Label17: TLabel
          Left = 302
          Top = 344
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label18: TLabel
          Left = 370
          Top = 344
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object grbAcousticCross: TGroupBox
          Left = 219
          Top = 147
          Width = 210
          Height = 81
          Caption = 'Acoustic Cross-Section'
          TabOrder = 0
          object Label23: TLabel
            Left = 151
            Top = 24
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label26: TLabel
            Left = 151
            Top = 49
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label2: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label7: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label5: TLabel
            Left = 11
            Top = 50
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label8: TLabel
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
        object grbRadarCross: TGroupBox
          Left = 3
          Top = 147
          Width = 210
          Height = 81
          Caption = 'Radar Cross-Section'
          TabOrder = 2
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
        object grbVisualCross: TGroupBox
          Left = 3
          Top = 234
          Width = 210
          Height = 81
          Caption = 'Visual Cross-Section'
          TabOrder = 3
          object Label10: TLabel
            Left = 151
            Top = 24
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label11: TLabel
            Left = 151
            Top = 49
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label12: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label14: TLabel
            Left = 83
            Top = 50
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label13: TLabel
            Left = 11
            Top = 50
            Width = 20
            Height = 13
            Caption = 'Side'
          end
          object Label15: TLabel
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
        object edtLifetimeDuration: TEdit
          Left = 312
          Top = 340
          Width = 52
          Height = 21
          TabOrder = 4
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 433
          Height = 406
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
