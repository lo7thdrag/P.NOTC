object EventsWindowForm: TEventsWindowForm
  Left = 0
  Top = 0
  Caption = 'Events'
  ClientHeight = 296
  ClientWidth = 462
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
    Top = 255
    Width = 462
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnApply: TButton
      Left = 371
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 288
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 205
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 127
    Top = 0
    Width = 335
    Height = 255
    Align = alRight
    TabOrder = 1
    object grbSonobuoy: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Sonobuoy'
      TabOrder = 1
      object lblNameSonobuoy: TLabel
        Left = 16
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lblSpacingSonobuoy: TLabel
        Left = 16
        Top = 51
        Width = 44
        Height = 13
        Caption = 'Spacing :'
      end
      object lblNumberSonobuoy: TLabel
        Left = 16
        Top = 82
        Width = 44
        Height = 13
        Caption = 'Number :'
      end
      object lblDepthSonobuoy: TLabel
        Left = 16
        Top = 113
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object lblKingpin1: TLabel
        Left = 123
        Top = 186
        Width = 3
        Height = 13
      end
      object lblKingpin2: TLabel
        Left = 200
        Top = 186
        Width = 3
        Height = 13
      end
      object cbxNameSonobuoy: TComboBox
        Left = 71
        Top = 18
        Width = 239
        Height = 21
        TabOrder = 0
      end
      object edtSpacingSonobuoy: TEdit
        Left = 71
        Top = 48
        Width = 50
        Height = 21
        TabOrder = 1
      end
      object edtNumberSonobuoy: TEdit
        Left = 71
        Top = 78
        Width = 210
        Height = 21
        TabOrder = 2
      end
      object edtDepthSonobuoy: TEdit
        Left = 71
        Top = 109
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object nmSpacingSonobuoy: TStaticText
        Left = 136
        Top = 50
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 4
      end
      object feetDepthSonobuoy: TStaticText
        Left = 136
        Top = 105
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 5
      end
      object KingpinPositionSonobuoy: TStaticText
        Left = 16
        Top = 184
        Width = 88
        Height = 17
        Caption = 'Kingpin Position : '
        TabOrder = 6
      end
    end
    object grbChaff: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Chaff'
      TabOrder = 3
      object lblNameChaff: TLabel
        Left = 16
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lblSpacingChaff: TLabel
        Left = 16
        Top = 51
        Width = 44
        Height = 13
        Caption = 'Spacing :'
      end
      object lblNumberChaff: TLabel
        Left = 16
        Top = 82
        Width = 44
        Height = 13
        Caption = 'Number :'
      end
      object cbxNameChaff: TComboBox
        Left = 71
        Top = 18
        Width = 239
        Height = 21
        TabOrder = 0
      end
      object edtSpacingChaff: TEdit
        Left = 71
        Top = 48
        Width = 50
        Height = 21
        TabOrder = 1
      end
      object edtNumberChaff: TEdit
        Left = 71
        Top = 78
        Width = 50
        Height = 21
        TabOrder = 2
      end
      object nmChaff: TStaticText
        Left = 136
        Top = 50
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 3
      end
      object cbDeployChaff: TCheckBox
        Left = 16
        Top = 120
        Width = 153
        Height = 17
        Caption = 'Deploy until next Waypoint'
        TabOrder = 4
      end
    end
    object grbCommLink: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Comm/Link'
      TabOrder = 4
      object lblHFCommLink: TLabel
        Left = 16
        Top = 21
        Width = 20
        Height = 13
        Caption = 'HF :'
      end
      object lblUHFCommLink: TLabel
        Left = 16
        Top = 53
        Width = 27
        Height = 13
        Caption = 'UHF :'
      end
      object cbxHFCommLink: TComboBox
        Left = 71
        Top = 18
        Width = 154
        Height = 21
        TabOrder = 0
      end
      object cbxUHFCommLink: TComboBox
        Left = 71
        Top = 50
        Width = 154
        Height = 21
        TabOrder = 1
      end
    end
    object grbIFF: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'IFF'
      TabOrder = 6
      object lblInterrogatorIFF: TLabel
        Left = 16
        Top = 53
        Width = 100
        Height = 13
        Caption = 'Interrogator Action :'
      end
      object lblTransponderIFF: TLabel
        Left = 16
        Top = 85
        Width = 101
        Height = 13
        Caption = 'Transponder Action :'
      end
      object lblNameIFF: TLabel
        Left = 16
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object cbxInterrogatorIFF: TComboBox
        Left = 135
        Top = 47
        Width = 106
        Height = 21
        TabOrder = 0
      end
      object cbxTransponderIFF: TComboBox
        Left = 135
        Top = 79
        Width = 106
        Height = 21
        TabOrder = 1
      end
      object edtNameIFF: TEdit
        Left = 71
        Top = 20
        Width = 247
        Height = 21
        TabOrder = 2
      end
    end
    object grbJammer: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Jammer'
      TabOrder = 7
      object lblActionJammer: TLabel
        Left = 16
        Top = 55
        Width = 37
        Height = 13
        Caption = 'Action :'
      end
      object lblNameJammer: TLabel
        Left = 16
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object cbxActionJammer: TComboBox
        Left = 71
        Top = 47
        Width = 106
        Height = 21
        TabOrder = 0
      end
      object edtNameJammer: TEdit
        Left = 71
        Top = 20
        Width = 247
        Height = 21
        TabOrder = 1
      end
    end
    object grbMine: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Mine'
      TabOrder = 2
      object lblNameMine: TLabel
        Left = 16
        Top = 21
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lblSpacingMine: TLabel
        Left = 16
        Top = 51
        Width = 44
        Height = 13
        Caption = 'Spacing :'
      end
      object lblNumberMine: TLabel
        Left = 16
        Top = 82
        Width = 44
        Height = 13
        Caption = 'Number :'
      end
      object lblDepthMine: TLabel
        Left = 16
        Top = 113
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object cbxNameMine: TComboBox
        Left = 71
        Top = 18
        Width = 239
        Height = 21
        TabOrder = 0
      end
      object edtSpacingMine: TEdit
        Left = 71
        Top = 48
        Width = 50
        Height = 21
        TabOrder = 1
      end
      object edtNumberMine: TEdit
        Left = 71
        Top = 78
        Width = 50
        Height = 21
        TabOrder = 2
      end
      object edtDepthMine: TEdit
        Left = 71
        Top = 109
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object nmMine: TStaticText
        Left = 136
        Top = 50
        Width = 18
        Height = 17
        Caption = 'nm'
        TabOrder = 4
      end
      object feetMine: TStaticText
        Left = 136
        Top = 105
        Width = 24
        Height = 17
        Caption = 'feet'
        TabOrder = 5
      end
    end
    object grbWeapon: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Weapon'
      TabOrder = 0
      object lblEvents: TLabel
        Left = 16
        Top = 25
        Width = 35
        Height = 13
        Caption = 'Event :'
      end
      object lblName: TLabel
        Left = 16
        Top = 54
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lblSalvoSize: TLabel
        Left = 16
        Top = 84
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object lblTarget: TLabel
        Left = 16
        Top = 114
        Width = 39
        Height = 13
        Caption = 'Target :'
      end
      object btnSearchTargetWeapon: TSpeedButton
        Left = 287
        Top = 109
        Width = 23
        Height = 22
      end
      object edtEventWeapon: TEdit
        Left = 71
        Top = 21
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object cbxNameWeapon: TComboBox
        Left = 71
        Top = 50
        Width = 239
        Height = 21
        TabOrder = 1
      end
      object edtSalvoSizeWeapon: TEdit
        Left = 71
        Top = 80
        Width = 50
        Height = 21
        TabOrder = 2
      end
      object edtTargetWeapon: TEdit
        Left = 71
        Top = 110
        Width = 210
        Height = 21
        TabOrder = 3
      end
      object updownEventweapon: TUpDown
        Left = 127
        Top = 23
        Width = 17
        Height = 17
        Orientation = udHorizontal
        TabOrder = 4
      end
    end
    object grbRadar: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Radar'
      TabOrder = 5
      object lblNameRadar: TLabel
        Left = 16
        Top = 53
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lblActionRadar: TLabel
        Left = 16
        Top = 85
        Width = 37
        Height = 13
        Caption = 'Action :'
      end
      object lblEventRadar: TLabel
        Left = 16
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Event :'
      end
      object cbxNameRadar: TComboBox
        Left = 71
        Top = 50
        Width = 247
        Height = 21
        TabOrder = 0
      end
      object cbxActionRadar: TComboBox
        Left = 71
        Top = 82
        Width = 81
        Height = 21
        TabOrder = 1
      end
      object edtEventRadar: TEdit
        Left = 71
        Top = 20
        Width = 58
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object updownEventRadar: TUpDown
        Left = 135
        Top = 22
        Width = 17
        Height = 17
        Orientation = udHorizontal
        TabOrder = 3
      end
    end
    object grbSonar: TGroupBox
      Left = 8
      Top = 8
      Width = 321
      Height = 241
      Caption = 'Sonar'
      TabOrder = 8
      object Label1: TLabel
        Left = 16
        Top = 53
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object Label2: TLabel
        Left = 16
        Top = 85
        Width = 37
        Height = 13
        Caption = 'Action :'
      end
      object Label3: TLabel
        Left = 16
        Top = 24
        Width = 35
        Height = 13
        Caption = 'Event :'
      end
      object ComboBox1: TComboBox
        Left = 71
        Top = 50
        Width = 247
        Height = 21
        TabOrder = 0
      end
      object ComboBox2: TComboBox
        Left = 71
        Top = 82
        Width = 81
        Height = 21
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 71
        Top = 20
        Width = 58
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object UpDown1: TUpDown
        Left = 135
        Top = 22
        Width = 17
        Height = 17
        Orientation = udHorizontal
        TabOrder = 3
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 255
    Align = alLeft
    TabOrder = 2
    object lstEvents: TListBox
      Left = 8
      Top = 8
      Width = 113
      Height = 241
      ItemHeight = 13
      Items.Strings = (
        'Radar'
        'Sonar'
        'Weapon'
        'Mine'
        'Sunobuoys'
        'Chaff'
        'IFFs'
        'Comm/Link'
        'Jammer')
      TabOrder = 0
      OnClick = lstEventsClick
    end
  end
end
