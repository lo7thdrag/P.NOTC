object fDefensiveJammer: TfDefensiveJammer
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Defensive Jammer'
  ClientHeight = 382
  ClientWidth = 403
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
    Top = 341
    Width = 403
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 318
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 236
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 150
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
    Width = 403
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
    object edtClassDefensiveJammer: TEdit
      Left = 10
      Top = 24
      Width = 383
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 403
    Height = 284
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 383
      Height = 281
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Label74: TLabel
          Left = 19
          Top = 58
          Width = 48
          Height = 13
          Caption = 'ECM Type'
        end
        object Label75: TLabel
          Left = 209
          Top = 59
          Width = 4
          Height = 13
          Caption = ':'
        end
        object grbTargetSelection: TGroupBox
          Left = 3
          Top = 3
          Width = 369
          Height = 46
          Caption = 'Target Selection'
          TabOrder = 0
          object cbxTARHMissiles: TCheckBox
            Left = 16
            Top = 18
            Width = 97
            Height = 17
            Caption = 'TARH Missiles'
            TabOrder = 0
          end
          object cbxFireControlRadar: TCheckBox
            Left = 216
            Top = 18
            Width = 113
            Height = 17
            Caption = 'Fire Control Radars'
            TabOrder = 1
          end
        end
        object cbECMType: TComboBox
          Left = 219
          Top = 55
          Width = 97
          Height = 21
          TabOrder = 1
          Items.Strings = (
            'A'
            'B'
            'C')
        end
        object grbProbOfSuccess: TGroupBox
          Left = 3
          Top = 82
          Width = 369
          Height = 159
          Caption = 'Probability of Success vs. ECCM Type'
          TabOrder = 2
          object Label53: TLabel
            Left = 83
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label61: TLabel
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
            Left = 269
            Top = 36
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label1: TLabel
            Left = 83
            Top = 71
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label2: TLabel
            Left = 12
            Top = 71
            Width = 33
            Height = 13
            Caption = 'Type B'
          end
          object Label3: TLabel
            Left = 107
            Top = 84
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label4: TLabel
            Left = 269
            Top = 92
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label5: TLabel
            Left = 83
            Top = 117
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label6: TLabel
            Left = 12
            Top = 117
            Width = 34
            Height = 13
            Caption = 'Type C'
          end
          object Label7: TLabel
            Left = 107
            Top = 135
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label8: TLabel
            Left = 269
            Top = 135
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtTypeA: TEdit
            Left = 301
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object TrackBarTypeA: TTrackBar
            Left = 93
            Top = 17
            Width = 205
            Height = 24
            Max = 100
            Frequency = 25
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarTypeAChange
          end
          object edtTypeB: TEdit
            Left = 301
            Top = 67
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object TrackBarTypeB: TTrackBar
            Left = 93
            Top = 65
            Width = 205
            Height = 21
            Max = 100
            Frequency = 25
            TabOrder = 3
            ThumbLength = 15
            OnChange = TrackBarTypeBChange
          end
          object edtTypeC: TEdit
            Left = 301
            Top = 113
            Width = 52
            Height = 21
            TabOrder = 4
          end
          object TrackBarTypeC: TTrackBar
            Left = 93
            Top = 111
            Width = 205
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
          Top = 3
          Width = 422
          Height = 222
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
