object EditEvents: TEditEvents
  Left = 0
  Top = 0
  Caption = 'Events'
  ClientHeight = 347
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 353
    TabOrder = 0
    object lbList: TListBox
      Left = 8
      Top = 8
      Width = 156
      Height = 273
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbListClick
    end
    object Panel2: TPanel
      Left = 170
      Top = 0
      Width = 383
      Height = 281
      TabOrder = 1
      object gbWeapon: TGroupBox
        Left = -2
        Top = 2
        Width = 385
        Height = 279
        Caption = 'Weapon'
        TabOrder = 2
        object Label7: TLabel
          Left = 16
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Event :'
        end
        object Label8: TLabel
          Left = 16
          Top = 74
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object Label9: TLabel
          Left = 16
          Top = 115
          Width = 55
          Height = 13
          Caption = 'Salvo Size :'
        end
        object weaponName: TComboBox
          Left = 77
          Top = 71
          Width = 305
          Height = 21
          TabOrder = 0
        end
        object Button5: TButton
          Left = 172
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 1
        end
        object Button6: TButton
          Left = 197
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 2
        end
        object weaponSalvoSize: TEdit
          Left = 77
          Top = 112
          Width = 90
          Height = 21
          TabOrder = 3
        end
        object weaponEvent: TEdit
          Left = 77
          Top = 29
          Width = 90
          Height = 21
          TabOrder = 4
        end
      end
      object gbIFF: TGroupBox
        Left = -2
        Top = 2
        Width = 385
        Height = 279
        Caption = 'IFF'
        TabOrder = 4
        object Label13: TLabel
          Left = 16
          Top = 32
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object Label14: TLabel
          Left = 16
          Top = 74
          Width = 100
          Height = 13
          Caption = 'Interrogator Action :'
        end
        object Label10: TLabel
          Left = 18
          Top = 115
          Width = 101
          Height = 13
          Caption = 'Transponder Action :'
        end
        object ComboBox3: TComboBox
          Left = 142
          Top = 112
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object TComboBox
          Left = 142
          Top = 71
          Width = 145
          Height = 21
          TabOrder = 1
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object IFFName: TEdit
          Left = 77
          Top = 29
          Width = 305
          Height = 21
          TabOrder = 2
        end
      end
      object gbJammers: TGroupBox
        Left = -2
        Top = 2
        Width = 385
        Height = 279
        Caption = 'Jammer'
        TabOrder = 3
        object Label11: TLabel
          Left = 16
          Top = 32
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object Label12: TLabel
          Left = 16
          Top = 74
          Width = 37
          Height = 13
          Caption = 'Action :'
        end
        object jammerAction: TComboBox
          Left = 77
          Top = 71
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object jammerName: TEdit
          Left = 77
          Top = 29
          Width = 305
          Height = 21
          TabOrder = 1
        end
      end
      object gbSonar: TGroupBox
        Left = -2
        Top = 2
        Width = 385
        Height = 279
        Caption = 'Sonar'
        TabOrder = 1
        object Label4: TLabel
          Left = 16
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Event :'
        end
        object Label5: TLabel
          Left = 16
          Top = 74
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object Label6: TLabel
          Left = 16
          Top = 115
          Width = 37
          Height = 13
          Caption = 'Action :'
        end
        object sonarAction: TComboBox
          Left = 70
          Top = 112
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object sonarName: TComboBox
          Left = 70
          Top = 71
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object Button1: TButton
          Left = 165
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 2
        end
        object Button2: TButton
          Left = 190
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 3
        end
        object sonarEvent: TEdit
          Left = 70
          Top = 29
          Width = 92
          Height = 21
          TabOrder = 4
        end
      end
      object gbCommLink: TGroupBox
        Left = -2
        Top = 2
        Width = 385
        Height = 279
        Caption = 'Comm / Link'
        TabOrder = 5
        object Label15: TLabel
          Left = 16
          Top = 32
          Width = 20
          Height = 13
          Caption = 'HF :'
        end
        object Label16: TLabel
          Left = 16
          Top = 74
          Width = 27
          Height = 13
          Caption = 'UHF :'
        end
        object ComboBox4: TComboBox
          Left = 77
          Top = 71
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object TComboBox
          Left = 77
          Top = 29
          Width = 145
          Height = 21
          TabOrder = 1
        end
      end
      object gbRadar: TGroupBox
        Left = 0
        Top = 2
        Width = 385
        Height = 279
        Caption = 'Radar'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 32
          Width = 35
          Height = 13
          Caption = 'Event :'
        end
        object Label2: TLabel
          Left = 16
          Top = 74
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object Label3: TLabel
          Left = 16
          Top = 115
          Width = 37
          Height = 13
          Caption = 'Action :'
        end
        object radarAction: TComboBox
          Left = 70
          Top = 112
          Width = 145
          Height = 21
          TabOrder = 0
          Text = 'On'
          Items.Strings = (
            'On'
            'Off'
            'No Change')
        end
        object radarName: TComboBox
          Left = 70
          Top = 71
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object Button3: TButton
          Left = 166
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 2
        end
        object Button4: TButton
          Left = 190
          Top = 27
          Width = 25
          Height = 25
          TabOrder = 3
        end
        object radarEvent: TEdit
          Left = 70
          Top = 29
          Width = 92
          Height = 21
          TabOrder = 4
        end
      end
    end
    object btnOk: TButton
      Left = 264
      Top = 304
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 345
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 426
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 4
      OnClick = btnApplyClick
    end
  end
end
