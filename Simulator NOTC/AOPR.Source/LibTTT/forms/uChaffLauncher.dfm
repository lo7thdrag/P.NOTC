object fChaffLauncher: TfChaffLauncher
  Left = 0
  Top = 0
  Caption = 'Chaff Launcher'
  ClientHeight = 277
  ClientWidth = 377
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
    Top = 0
    Width = 377
    Height = 278
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 13
      Width = 74
      Height = 13
      Caption = 'Launcher Kind :'
    end
    object lbl2: TLabel
      Left = 24
      Top = 62
      Width = 40
      Height = 13
      Caption = 'Forward'
    end
    object bvl1: TBevel
      Left = 96
      Top = 62
      Width = 2
      Height = 107
    end
    object lbl3: TLabel
      Left = 108
      Top = 43
      Width = 104
      Height = 13
      Caption = 'Operator Deployment'
    end
    object lbl4: TLabel
      Left = 120
      Top = 68
      Width = 96
      Height = 13
      Caption = 'Minimum Range      :'
    end
    object lbl5: TLabel
      Left = 120
      Top = 93
      Width = 97
      Height = 13
      Caption = 'Maximum Range     :'
    end
    object lbl6: TLabel
      Left = 120
      Top = 118
      Width = 97
      Height = 13
      Caption = 'Minimum Elevation  :'
    end
    object lbl7: TLabel
      Left = 120
      Top = 143
      Width = 98
      Height = 13
      Caption = 'Maximum Elevation :'
    end
    object lbl8: TLabel
      Left = 319
      Top = 68
      Width = 14
      Height = 13
      Caption = 'nm'
    end
    object lbl9: TLabel
      Left = 319
      Top = 93
      Width = 14
      Height = 13
      Caption = 'nm'
    end
    object lbl10: TLabel
      Left = 319
      Top = 118
      Width = 20
      Height = 13
      Caption = 'feet'
    end
    object lbl11: TLabel
      Left = 319
      Top = 142
      Width = 20
      Height = 13
      Caption = 'feet'
    end
    object lbl12: TLabel
      Left = 8
      Top = 200
      Width = 209
      Height = 13
      Caption = 'Average Speed of Launched Chaff Rocket :'
    end
    object lbl13: TLabel
      Left = 319
      Top = 200
      Width = 14
      Height = 13
      Caption = 'kts'
    end
    object bvl2: TBevel
      Left = 360
      Top = 62
      Width = 2
      Height = 107
    end
    object cbbLauncherKind: TComboBox
      Left = 88
      Top = 10
      Width = 81
      Height = 21
      TabOrder = 0
      Items.Strings = (
        'Fixed'
        'Trainable')
    end
    object pnlForward: TPanel
      Left = 13
      Top = 81
      Width = 66
      Height = 65
      TabOrder = 1
    end
    object edtMinRange: TEdit
      Left = 247
      Top = 65
      Width = 66
      Height = 21
      TabOrder = 2
    end
    object edtMaxRange: TEdit
      Left = 247
      Top = 90
      Width = 66
      Height = 21
      TabOrder = 3
    end
    object edtMinElevation: TEdit
      Left = 247
      Top = 115
      Width = 66
      Height = 21
      TabOrder = 4
    end
    object edtMaxElevation: TEdit
      Left = 247
      Top = 139
      Width = 66
      Height = 21
      TabOrder = 5
    end
    object edtForward: TEdit
      Left = 21
      Top = 152
      Width = 58
      Height = 21
      Alignment = taRightJustify
      TabOrder = 6
    end
    object btnCancel: TButton
      Left = 203
      Top = 239
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 7
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 287
      Top = 239
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 8
      OnClick = btnApplyClick
    end
    object btnOK: TButton
      Left = 120
      Top = 239
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 9
      OnClick = btnOKClick
    end
  end
  object edtAverageSpeed: TEdit
    Left = 247
    Top = 197
    Width = 66
    Height = 21
    TabOrder = 1
  end
end
