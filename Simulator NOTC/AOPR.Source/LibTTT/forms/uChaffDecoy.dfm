object fChaff: TfChaff
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Chaff'
  ClientHeight = 428
  ClientWidth = 457
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
    Top = 387
    Width = 457
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
    Width = 457
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
    object edtClassChaff: TEdit
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
    Width = 457
    Height = 330
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 436
      Height = 329
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Label7: TLabel
          Left = 11
          Top = 88
          Width = 147
          Height = 13
          Caption = 'Dissipation Time in 100 kt Wind'
        end
        object Label8: TLabel
          Left = 224
          Top = 88
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 311
          Top = 88
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label1: TLabel
          Left = 11
          Top = 117
          Width = 65
          Height = 13
          Caption = 'Descent Rate'
        end
        object Label2: TLabel
          Left = 224
          Top = 117
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label3: TLabel
          Left = 311
          Top = 117
          Width = 40
          Height = 13
          Caption = 'feet/min'
        end
        object Label4: TLabel
          Left = 11
          Top = 144
          Width = 110
          Height = 13
          Caption = 'Maximum Bloom Radius'
        end
        object Label5: TLabel
          Left = 224
          Top = 144
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label6: TLabel
          Left = 311
          Top = 144
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label10: TLabel
          Left = 11
          Top = 7
          Width = 144
          Height = 13
          Caption = 'Maximum Radar Cross Section'
        end
        object Label11: TLabel
          Left = 224
          Top = 7
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label13: TLabel
          Left = 11
          Top = 34
          Width = 53
          Height = 13
          Caption = 'Bloom Time'
        end
        object Label14: TLabel
          Left = 224
          Top = 34
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label15: TLabel
          Left = 311
          Top = 34
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label16: TLabel
          Left = 11
          Top = 61
          Width = 122
          Height = 13
          Caption = 'Dissipation Time in Still Air'
        end
        object Label17: TLabel
          Left = 224
          Top = 61
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label18: TLabel
          Left = 311
          Top = 61
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label19: TLabel
          Left = 11
          Top = 171
          Width = 136
          Height = 13
          Caption = 'Maximum Radar Attenuation'
        end
        object Label20: TLabel
          Left = 224
          Top = 171
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label21: TLabel
          Left = 311
          Top = 171
          Width = 30
          Height = 13
          Caption = 'dB/nm'
        end
        object edtDissipationTimein100kt: TEdit
          Left = 230
          Top = 84
          Width = 75
          Height = 21
          TabOrder = 0
        end
        object edtDescentRate: TEdit
          Left = 230
          Top = 113
          Width = 75
          Height = 21
          TabOrder = 1
        end
        object edtMaxBloom: TEdit
          Left = 230
          Top = 140
          Width = 75
          Height = 21
          TabOrder = 2
        end
        object edtMaxRadarCross: TEdit
          Left = 230
          Top = 3
          Width = 75
          Height = 21
          TabOrder = 3
        end
        object edtBloomTime: TEdit
          Left = 230
          Top = 30
          Width = 75
          Height = 21
          TabOrder = 4
        end
        object edtDissipationTimeinStillAir: TEdit
          Left = 230
          Top = 57
          Width = 75
          Height = 21
          TabOrder = 5
        end
        object edtMaxRadarAttenuation: TEdit
          Left = 230
          Top = 167
          Width = 75
          Height = 21
          TabOrder = 6
        end
        object cbMaxRadar: TComboBox
          Left = 311
          Top = 3
          Width = 59
          Height = 21
          Enabled = False
          TabOrder = 7
          Text = 'dB m'#178
        end
        object grbRadarFreq: TGroupBox
          Left = 3
          Top = 208
          Width = 406
          Height = 81
          Caption = 'Radar Frequencies Affected'
          TabOrder = 8
          object Label12: TLabel
            Left = 8
            Top = 20
            Width = 53
            Height = 13
            Caption = 'Lower Limit'
          end
          object Label22: TLabel
            Left = 221
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 308
            Top = 20
            Width = 19
            Height = 13
            Caption = 'GHz'
          end
          object Label24: TLabel
            Left = 8
            Top = 47
            Width = 53
            Height = 13
            Caption = 'Upper Limit'
          end
          object Label25: TLabel
            Left = 221
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label26: TLabel
            Left = 308
            Top = 43
            Width = 19
            Height = 13
            Caption = 'GHz'
          end
          object edtLowerLimit: TEdit
            Left = 227
            Top = 16
            Width = 75
            Height = 21
            TabOrder = 0
          end
          object edtUpperLimit: TEdit
            Left = 227
            Top = 43
            Width = 75
            Height = 21
            TabOrder = 1
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
          Height = 286
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
