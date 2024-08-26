object ChaffForm: TChaffForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Chaff'
  ClientHeight = 273
  ClientWidth = 422
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
    Width = 422
    Height = 232
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 168
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object PageControl1: TPageControl
      Left = 11
      Top = 8
      Width = 397
      Height = 208
      ActivePage = Bloom
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        ExplicitWidth = 281
        ExplicitHeight = 165
        object grbChaffMounts: TGroupBox
          Left = 3
          Top = 3
          Width = 368
          Height = 70
          Caption = 'Chaff Mounts'
          TabOrder = 0
          object btnEditChaff: TButton
            Left = 120
            Top = 24
            Width = 145
            Height = 25
            Caption = 'Edit...'
            TabOrder = 0
          end
        end
        object lblMinDelay: TStaticText
          Left = 3
          Top = 96
          Width = 158
          Height = 34
          Caption = 'Minimum Delay Between Rounds in a Chaff Salvo :'
          TabOrder = 1
        end
        object edtMinDelay: TEdit
          Left = 191
          Top = 103
          Width = 58
          Height = 21
          TabOrder = 2
        end
        object lblHoursMinDelay: TStaticText
          Left = 255
          Top = 105
          Width = 50
          Height = 17
          Caption = 'hh:mm:ss'
          TabOrder = 3
        end
        object lblMaxNumber: TStaticText
          Left = 3
          Top = 136
          Width = 166
          Height = 25
          Caption = 'Maximum Number of Chaff Blooms Fired in a Single Salvo :'
          TabOrder = 4
        end
        object edtMaxNumber: TEdit
          Left = 191
          Top = 138
          Width = 58
          Height = 21
          TabOrder = 5
        end
      end
      object Launchers: TTabSheet
        Caption = 'Launchers'
        ImageIndex = 1
        ExplicitWidth = 281
        ExplicitHeight = 165
        object grbChaffLauncher1: TGroupBox
          Left = 3
          Top = 3
          Width = 185
          Height = 70
          Caption = 'Chaff Launcher 1'
          TabOrder = 0
          object cbValidLauncher1: TCheckBox
            Left = 16
            Top = 32
            Width = 57
            Height = 17
            Caption = 'Valid'
            TabOrder = 0
          end
          object btnEditLauncher1: TButton
            Left = 95
            Top = 28
            Width = 66
            Height = 25
            Caption = 'Edit...'
            TabOrder = 1
          end
        end
        object grbChaffLauncher3: TGroupBox
          Left = 3
          Top = 91
          Width = 185
          Height = 70
          Caption = 'Chaff Launcher 3'
          TabOrder = 1
          object cbValidlauncher3: TCheckBox
            Left = 16
            Top = 32
            Width = 57
            Height = 17
            Caption = 'Valid'
            TabOrder = 0
          end
          object btnEditLauncher3: TButton
            Left = 95
            Top = 28
            Width = 66
            Height = 25
            Caption = 'Edit...'
            TabOrder = 1
          end
        end
        object grbChaffLauncher2: TGroupBox
          Left = 201
          Top = 3
          Width = 185
          Height = 70
          Caption = 'Chaff Launcher 2'
          TabOrder = 2
          object cbValidLauncher2: TCheckBox
            Left = 16
            Top = 32
            Width = 57
            Height = 17
            Caption = 'Valid'
            TabOrder = 0
          end
          object btnEditLauncher2: TButton
            Left = 95
            Top = 28
            Width = 66
            Height = 25
            Caption = 'Edit...'
            TabOrder = 1
          end
        end
        object grbChaffLauncher4: TGroupBox
          Left = 201
          Top = 91
          Width = 185
          Height = 70
          Caption = 'Chaff Launcher 4'
          TabOrder = 3
          object cbValidLauncher4: TCheckBox
            Left = 16
            Top = 32
            Width = 57
            Height = 17
            Caption = 'Valid'
            TabOrder = 0
          end
          object btnEditLauncher4: TButton
            Left = 95
            Top = 28
            Width = 66
            Height = 25
            Caption = 'Edit...'
            TabOrder = 1
          end
        end
      end
      object Seduction: TTabSheet
        Caption = 'Seduction'
        ImageIndex = 2
        ExplicitWidth = 281
        ExplicitHeight = 165
        object cbCapable: TCheckBox
          Left = 16
          Top = 16
          Width = 97
          Height = 17
          Caption = 'Capable'
          TabOrder = 0
        end
        object lblTimeToWeapon: TStaticText
          Left = 16
          Top = 48
          Width = 161
          Height = 34
          Caption = 'Time to Weapon Impact for Seduction Deployment :'
          TabOrder = 1
        end
        object edtTimeToWeapon: TEdit
          Left = 208
          Top = 55
          Width = 73
          Height = 21
          TabOrder = 2
        end
        object lblHoursTimeToWeapon: TStaticText
          Left = 296
          Top = 57
          Width = 50
          Height = 17
          Caption = 'hh:mm:ss'
          TabOrder = 3
        end
        object grbProbabilityOfSuccess: TGroupBox
          Left = 16
          Top = 88
          Width = 370
          Height = 80
          Caption = 'Probability of Success'
          TabOrder = 4
          object TrackProbability: TTrackBar
            Left = 3
            Top = 24
            Width = 326
            Height = 45
            Max = 5
            Min = 1
            Position = 1
            TabOrder = 0
          end
          object edtProbability: TEdit
            Left = 326
            Top = 24
            Width = 41
            Height = 21
            TabOrder = 1
          end
          object lbl0Percent: TStaticText
            Left = 11
            Top = 48
            Width = 21
            Height = 17
            Caption = '0%'
            TabOrder = 2
          end
          object lbl100percent: TStaticText
            Left = 302
            Top = 51
            Width = 33
            Height = 17
            Caption = '100%'
            TabOrder = 3
          end
        end
      end
      object Bloom: TTabSheet
        Caption = 'Bloom'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 32
        ExplicitWidth = 281
        ExplicitHeight = 165
        object lblDefaultRange: TStaticText
          Left = 16
          Top = 22
          Width = 80
          Height = 17
          Caption = 'Default Range :'
          TabOrder = 0
        end
        object edtDefaultRange: TEdit
          Left = 168
          Top = 20
          Width = 65
          Height = 21
          TabOrder = 1
        end
        object lblnmDefaultRange: TStaticText
          Left = 239
          Top = 22
          Width = 18
          Height = 17
          Caption = 'nm'
          TabOrder = 2
        end
        object lblDefaultAltitude: TStaticText
          Left = 16
          Top = 45
          Width = 86
          Height = 17
          Caption = 'Default Altitude :'
          TabOrder = 3
        end
        object edtDefaultAltitude: TEdit
          Left = 168
          Top = 43
          Width = 65
          Height = 21
          TabOrder = 4
        end
        object lblFeetDefaultAltitude: TStaticText
          Left = 239
          Top = 45
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 5
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 232
    Width = 422
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 222
    ExplicitWidth = 423
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
end
