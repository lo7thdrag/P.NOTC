object ChaffAssets: TChaffAssets
  Left = 0
  Top = 0
  Caption = 'Chaff'
  ClientHeight = 308
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = -4
    Width = 457
    Height = 313
    TabOrder = 0
    object pgc1: TPageControl
      Left = 8
      Top = 8
      Width = 441
      Height = 265
      ActivePage = ts1
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        object lbl1: TLabel
          Left = 13
          Top = 11
          Width = 65
          Height = 13
          Caption = 'Chaff Mounts'
        end
        object bvl1: TBevel
          Left = 3
          Top = 72
          Width = 427
          Height = 3
        end
        object lbl2: TLabel
          Left = 3
          Top = 88
          Width = 240
          Height = 13
          Caption = 'Minimum Delay Between Rounds in a Chaff Salvo :'
        end
        object lbl3: TLabel
          Left = 3
          Top = 118
          Width = 277
          Height = 13
          Caption = 'Maximum Number of Chaff Blooms Fired in a Single Salvo :'
        end
        object lbl4: TLabel
          Left = 367
          Top = 88
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object btn1: TButton
          Left = 144
          Top = 32
          Width = 147
          Height = 25
          Caption = 'Edit...'
          TabOrder = 0
          OnClick = btn1Click
        end
        object edtMinDelay: TEdit
          Left = 296
          Top = 85
          Width = 65
          Height = 21
          TabOrder = 1
        end
        object edtMaxNumberChaff: TEdit
          Left = 296
          Top = 112
          Width = 65
          Height = 21
          TabOrder = 2
        end
      end
      object ts1: TTabSheet
        Caption = 'Launchers '
        ImageIndex = 1
        object lbl5: TLabel
          Left = 13
          Top = 11
          Width = 83
          Height = 13
          Caption = 'Chaff Launcher 1'
        end
        object lbl6: TLabel
          Left = 13
          Top = 118
          Width = 83
          Height = 13
          Caption = 'Chaff Launcher 2'
        end
        object lbl7: TLabel
          Left = 223
          Top = 11
          Width = 83
          Height = 13
          Caption = 'Chaff Launcher 3'
        end
        object lbl8: TLabel
          Left = 223
          Top = 118
          Width = 83
          Height = 13
          Caption = 'Chaff Launcher 4'
        end
        object bvl2: TBevel
          Left = 3
          Top = 30
          Width = 2
          Height = 75
        end
        object bvl3: TBevel
          Left = 3
          Top = 140
          Width = 2
          Height = 75
        end
        object bvl4: TBevel
          Left = 210
          Top = 140
          Width = 7
          Height = 75
        end
        object bvl5: TBevel
          Left = 210
          Top = 30
          Width = 7
          Height = 75
        end
        object bvl6: TBevel
          Left = 428
          Top = 30
          Width = 2
          Height = 75
        end
        object bvl7: TBevel
          Left = 428
          Top = 140
          Width = 2
          Height = 75
        end
        object chkLauncher1: TCheckBox
          Left = 11
          Top = 56
          Width = 54
          Height = 17
          Caption = 'Valid'
          TabOrder = 0
          OnClick = chkLauncher1Click
        end
        object chkLauncher2: TCheckBox
          Left = 11
          Top = 168
          Width = 54
          Height = 17
          Caption = 'Valid'
          TabOrder = 1
          OnClick = chkLauncher2Click
        end
        object chkLauncher3: TCheckBox
          Left = 223
          Top = 56
          Width = 54
          Height = 17
          Caption = 'Valid'
          TabOrder = 2
          OnClick = chkLauncher3Click
        end
        object chkLauncher4: TCheckBox
          Left = 223
          Top = 168
          Width = 54
          Height = 17
          Caption = 'Valid'
          TabOrder = 3
          OnClick = chkLauncher4Click
        end
        object btnLauncher1: TButton
          Left = 112
          Top = 52
          Width = 75
          Height = 25
          Caption = 'Edit'
          TabOrder = 4
          OnClick = btnLauncher1Click
        end
        object btnLauncher2: TButton
          Left = 112
          Top = 164
          Width = 75
          Height = 25
          Caption = 'Edit'
          TabOrder = 5
        end
        object btnLauncher3: TButton
          Left = 328
          Top = 52
          Width = 75
          Height = 25
          Caption = 'Edit'
          TabOrder = 6
        end
        object btnLauncher4: TButton
          Left = 328
          Top = 164
          Width = 74
          Height = 25
          Caption = 'Edit'
          TabOrder = 7
        end
      end
      object ts2: TTabSheet
        Caption = 'Seduction'
        ImageIndex = 2
        object lbl9: TLabel
          Left = 5
          Top = 48
          Width = 248
          Height = 13
          Caption = 'Time to Weapon Impact for Seduction Delpoyment :'
        end
        object lbl12: TLabel
          Left = 321
          Top = 48
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object chkCapable: TCheckBox
          Left = 5
          Top = 11
          Width = 60
          Height = 17
          Caption = 'Capable'
          TabOrder = 0
        end
        object grpDamage: TGroupBox
          Left = 3
          Top = 120
          Width = 427
          Height = 85
          Caption = 'Probability of Success'
          TabOrder = 1
          object lbl10: TLabel
            Left = 8
            Top = 61
            Width = 20
            Height = 13
            Caption = '0 %'
          end
          object lbl11: TLabel
            Left = 330
            Top = 61
            Width = 32
            Height = 13
            Caption = '100 %'
          end
          object trckbrDamage: TTrackBar
            Left = 0
            Top = 24
            Width = 362
            Height = 31
            Max = 100
            Frequency = 20000
            TabOrder = 0
            OnChange = trckbrDamageChange
          end
          object edtProbabilitySuccess: TEdit
            Left = 362
            Top = 25
            Width = 56
            Height = 21
            TabOrder = 1
          end
        end
        object edtTimeWeaponImpact: TEdit
          Left = 259
          Top = 45
          Width = 56
          Height = 21
          TabOrder = 2
        end
      end
      object ts3: TTabSheet
        Caption = 'Bloom'
        ImageIndex = 3
        object lbl13: TLabel
          Left = 3
          Top = 11
          Width = 85
          Height = 13
          Caption = 'Default Range    :'
        end
        object lbl14: TLabel
          Left = 3
          Top = 43
          Width = 82
          Height = 13
          Caption = 'Default Altitude :'
        end
        object lbl15: TLabel
          Left = 159
          Top = 11
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object lbl16: TLabel
          Left = 159
          Top = 43
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object edtDefaultRange: TEdit
          Left = 94
          Top = 8
          Width = 59
          Height = 21
          TabOrder = 0
        end
        object edtDefaultAltitude: TEdit
          Left = 94
          Top = 40
          Width = 59
          Height = 21
          TabOrder = 1
        end
      end
    end
    object btnApply: TButton
      Left = 374
      Top = 280
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 293
      Top = 279
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 212
      Top = 280
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 3
      OnClick = btnOKClick
    end
  end
end
