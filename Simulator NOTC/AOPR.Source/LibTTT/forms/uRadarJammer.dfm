object fRadarJammer: TfRadarJammer
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radar Jammer'
  ClientHeight = 339
  ClientWidth = 426
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
    Top = 298
    Width = 426
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 342
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 260
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 174
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 426
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
    object edtClassRadarJammer: TEdit
      Left = 10
      Top = 24
      Width = 407
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 426
    Height = 241
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 407
      Height = 241
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object Label10: TLabel
          Left = 11
          Top = 7
          Width = 76
          Height = 13
          Caption = 'Power Density :'
        end
        object Label1: TLabel
          Left = 92
          Top = 29
          Width = 39
          Height = 13
          Caption = 'kW/MHz'
        end
        object Label2: TLabel
          Left = 219
          Top = 7
          Width = 131
          Height = 13
          Caption = 'Maximum Effective Range :'
        end
        object Label3: TLabel
          Left = 300
          Top = 29
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label4: TLabel
          Left = 12
          Top = 63
          Width = 71
          Height = 13
          Caption = 'Jammer Type :'
        end
        object Label5: TLabel
          Left = 219
          Top = 63
          Width = 116
          Height = 13
          Caption = 'Maximum Sector Width :'
        end
        object Label6: TLabel
          Left = 300
          Top = 85
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object edtPowerDensity: TEdit
          Left = 11
          Top = 26
          Width = 75
          Height = 21
          TabOrder = 0
        end
        object grbFreqOperatingLimits: TGroupBox
          Left = 12
          Top = 120
          Width = 174
          Height = 81
          Caption = 'Frequency Operating Limits'
          TabOrder = 1
          object Label12: TLabel
            Left = 8
            Top = 28
            Width = 29
            Height = 13
            Caption = 'Lower'
          end
          object Label22: TLabel
            Left = 61
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 126
            Top = 28
            Width = 19
            Height = 13
            Caption = 'GHz'
          end
          object Label24: TLabel
            Left = 8
            Top = 55
            Width = 29
            Height = 13
            Caption = 'Upper'
          end
          object Label25: TLabel
            Left = 61
            Top = 28
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label26: TLabel
            Left = 126
            Top = 55
            Width = 19
            Height = 13
            Caption = 'GHz'
          end
          object edtLowerLimit: TEdit
            Left = 67
            Top = 24
            Width = 53
            Height = 21
            TabOrder = 0
          end
          object edtUpperLimit: TEdit
            Left = 67
            Top = 51
            Width = 53
            Height = 21
            TabOrder = 1
          end
        end
        object edtMaxEffectiveRange: TEdit
          Left = 219
          Top = 26
          Width = 75
          Height = 21
          TabOrder = 2
        end
        object cbJammerType: TComboBox
          Left = 12
          Top = 82
          Width = 119
          Height = 21
          TabOrder = 3
        end
        object edtMaxSectorWidth: TEdit
          Left = 219
          Top = 82
          Width = 75
          Height = 21
          TabOrder = 4
        end
        object grbVerticalCoverageLimits: TGroupBox
          Left = 205
          Top = 120
          Width = 180
          Height = 81
          Caption = 'Vertical Coverage Limits'
          TabOrder = 5
          object Label7: TLabel
            Left = 8
            Top = 28
            Width = 29
            Height = 13
            Caption = 'Lower'
          end
          object Label8: TLabel
            Left = 61
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label9: TLabel
            Left = 126
            Top = 28
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object Label11: TLabel
            Left = 8
            Top = 55
            Width = 29
            Height = 13
            Caption = 'Upper'
          end
          object Label13: TLabel
            Left = 61
            Top = 28
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label14: TLabel
            Left = 126
            Top = 55
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object edtLowerVerticalLimits: TEdit
            Left = 67
            Top = 24
            Width = 53
            Height = 21
            TabOrder = 0
          end
          object edtUpperVerticalLimits: TEdit
            Left = 67
            Top = 51
            Width = 53
            Height = 21
            TabOrder = 1
          end
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object Memo1: TMemo
          Left = 3
          Top = 3
          Width = 393
          Height = 207
          Lines.Strings = (
            'Memo1')
          TabOrder = 0
        end
      end
    end
  end
end
