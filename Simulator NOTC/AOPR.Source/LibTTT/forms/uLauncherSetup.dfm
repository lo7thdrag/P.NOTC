object LauncherSetupForm: TLauncherSetupForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Chaff Launcher 1'
  ClientHeight = 289
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 381
    Height = 248
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -8
    ExplicitTop = 8
    ExplicitWidth = 428
    ExplicitHeight = 294
    object imgForward: TImage
      Left = 10
      Top = 78
      Width = 72
      Height = 72
    end
    object lblLauncherKnot: TStaticText
      Left = 10
      Top = 22
      Width = 80
      Height = 17
      Caption = 'Launcher Knot :'
      TabOrder = 0
    end
    object cbxLauncherKnot: TComboBox
      Left = 96
      Top = 20
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object grbOperatorDeployment: TGroupBox
      Left = 90
      Top = 56
      Width = 281
      Height = 121
      Caption = 'Operator Deployment'
      TabOrder = 2
      object lblMinimumRange: TStaticText
        Left = 16
        Top = 22
        Width = 85
        Height = 17
        Caption = 'Minimum Range :'
        TabOrder = 0
      end
      object edtMinRange: TEdit
        Left = 168
        Top = 20
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object lblnmMinRange: TStaticText
        Left = 239
        Top = 22
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 2
      end
      object lblMaximumRange: TStaticText
        Left = 16
        Top = 45
        Width = 89
        Height = 17
        Caption = 'Maximum Range :'
        TabOrder = 3
      end
      object edtMaxRange: TEdit
        Left = 168
        Top = 43
        Width = 65
        Height = 21
        TabOrder = 4
      end
      object lblnmMaxRange: TStaticText
        Left = 239
        Top = 45
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 5
      end
      object lblMinimumElevation: TStaticText
        Left = 16
        Top = 68
        Width = 98
        Height = 17
        Caption = 'Minimum Elevation :'
        TabOrder = 6
      end
      object edtMinElevation: TEdit
        Left = 168
        Top = 66
        Width = 65
        Height = 21
        TabOrder = 7
      end
      object lblFeetMinElevation: TStaticText
        Left = 239
        Top = 68
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 8
      end
      object lblMaximumElevation: TStaticText
        Left = 16
        Top = 91
        Width = 95
        Height = 17
        Caption = 'Maximum Elevation'
        TabOrder = 9
      end
      object edtMaxElevation: TEdit
        Left = 168
        Top = 89
        Width = 65
        Height = 21
        TabOrder = 10
      end
      object lblMaxElevation: TStaticText
        Left = 239
        Top = 91
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 11
      end
    end
    object lblForward: TStaticText
      Left = 26
      Top = 55
      Width = 44
      Height = 17
      Caption = 'Forward'
      TabOrder = 3
    end
    object edtForward: TEdit
      Left = 34
      Top = 156
      Width = 50
      Height = 21
      TabOrder = 4
    end
    object lblAvgSpeed: TStaticText
      Left = 10
      Top = 200
      Width = 213
      Height = 17
      Caption = 'Average Speed of Launched Chaff Rocket :'
      TabOrder = 5
    end
    object edtAvgSpeed: TEdit
      Left = 258
      Top = 198
      Width = 65
      Height = 21
      TabOrder = 6
    end
    object lblKnotsAvgSpeed: TStaticText
      Left = 329
      Top = 200
      Width = 18
      Height = 17
      Caption = 'kts'
      TabOrder = 7
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 248
    Width = 381
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 136
    ExplicitTop = 176
    ExplicitWidth = 185
    object btnApply: TButton
      Left = 302
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 221
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 140
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
end
