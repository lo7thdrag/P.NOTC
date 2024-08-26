object fGunSummary: TfGunSummary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Gun'
  ClientHeight = 549
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 494
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 10
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClassGun: TEdit
      Left = 10
      Top = 20
      Width = 463
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 508
    Width = 494
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnApply: TButton
      Left = 415
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 330
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 245
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 494
    Height = 459
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 6
      Width = 480
      Height = 451
      ActivePage = TabSheet1
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'General'
        object Label2: TLabel
          Left = 3
          Top = 14
          Width = 45
          Height = 13
          Caption = 'Category'
        end
        object Label3: TLabel
          Left = 129
          Top = 15
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label4: TLabel
          Left = 317
          Top = 39
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label5: TLabel
          Left = 3
          Top = 42
          Width = 281
          Height = 13
          Caption = 'Maximum Altitude Difference between Platform and Target'
        end
        object Label7: TLabel
          Left = 317
          Top = 66
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label8: TLabel
          Left = 3
          Top = 69
          Width = 106
          Height = 13
          Caption = 'Average Shell Velocity'
        end
        object Label1: TLabel
          Left = 317
          Top = 15
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label6: TLabel
          Left = 381
          Top = 16
          Width = 53
          Height = 13
          Caption = 'rounds/min'
        end
        object Label12: TLabel
          Left = 246
          Top = 15
          Width = 57
          Height = 13
          Caption = 'Rate of Fire'
        end
        object Label9: TLabel
          Left = 381
          Top = 43
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label13: TLabel
          Left = 381
          Top = 70
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object cbCategory: TComboBox
          Left = 139
          Top = 12
          Width = 74
          Height = 21
          TabOrder = 0
          Items.Strings = (
            'Close-In_Weapon System'
            'Gun'
            'Rocket')
        end
        object grbLethality: TGroupBox
          Left = 3
          Top = 351
          Width = 450
          Height = 58
          Caption = 'Lethality'
          TabOrder = 1
          object Label10: TLabel
            Left = 332
            Top = 42
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object Label11: TLabel
            Left = 19
            Top = 42
            Width = 6
            Height = 13
            Caption = '0'
          end
          object edtLethality: TEdit
            Left = 378
            Top = 15
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object TrackBarLethality: TTrackBar
            Left = 12
            Top = 13
            Width = 360
            Height = 23
            Max = 4
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarLethalityChange
          end
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 271
          Width = 456
          Height = 74
          Caption = 'Capabilities'
          TabOrder = 2
          object cbxAntiSurface: TCheckBox
            Left = 11
            Top = 16
            Width = 91
            Height = 17
            Caption = 'Anti-Surface'
            TabOrder = 0
          end
          object cbxDeployingChaff: TCheckBox
            Left = 11
            Top = 44
            Width = 117
            Height = 17
            Caption = 'Deploying Chaff'
            TabOrder = 1
          end
          object cbxAntiLand: TCheckBox
            Left = 179
            Top = 16
            Width = 91
            Height = 17
            Caption = 'Anti-Land'
            TabOrder = 2
          end
          object cbxAutofireMode: TCheckBox
            Left = 179
            Top = 44
            Width = 117
            Height = 17
            Caption = 'Autofire Mode'
            TabOrder = 3
          end
          object cbxAntiAir: TCheckBox
            Left = 339
            Top = 16
            Width = 91
            Height = 17
            Caption = 'Anti-Air'
            TabOrder = 4
          end
        end
        object grbRange: TGroupBox
          Left = 3
          Top = 120
          Width = 246
          Height = 145
          Caption = 'Range'
          TabOrder = 3
          object Label16: TLabel
            Left = 148
            Top = 23
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label17: TLabel
            Left = 216
            Top = 23
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label18: TLabel
            Left = 11
            Top = 55
            Width = 112
            Height = 13
            Caption = 'Maximum for Air Target'
          end
          object Label19: TLabel
            Left = 148
            Top = 55
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label20: TLabel
            Left = 216
            Top = 55
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label21: TLabel
            Left = 11
            Top = 87
            Width = 124
            Height = 13
            Caption = 'Minimum for Surface/Land'
          end
          object Label22: TLabel
            Left = 148
            Top = 87
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label23: TLabel
            Left = 216
            Top = 87
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Label27: TLabel
            Left = 11
            Top = 23
            Width = 108
            Height = 13
            Caption = 'Minimum for Air Target'
          end
          object Label14: TLabel
            Left = 11
            Top = 119
            Width = 128
            Height = 13
            Caption = 'Maximum for Surface/Land'
          end
          object Label15: TLabel
            Left = 148
            Top = 119
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label24: TLabel
            Left = 216
            Top = 119
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object edtMinforAirTargetRange: TEdit
            Left = 158
            Top = 19
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtMaxforAirTargetRange: TEdit
            Left = 158
            Top = 51
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtMinforSurfaceRange: TEdit
            Left = 158
            Top = 83
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object edtMaxforSurfaceRange: TEdit
            Left = 158
            Top = 115
            Width = 52
            Height = 21
            TabOrder = 3
          end
        end
        object grbProbOfHitCurve: TGroupBox
          Left = 264
          Top = 120
          Width = 195
          Height = 145
          Caption = 'Prob of Hit Curve'
          TabOrder = 4
          object btnEditAirTargetCurve: TButton
            Left = 32
            Top = 24
            Width = 137
            Height = 25
            Caption = 'Edit Air Target Curve...'
            TabOrder = 0
          end
          object btnEditSurfaceLandTargetCurve: TButton
            Left = 32
            Top = 63
            Width = 137
            Height = 63
            Caption = 'Edit Surface/Land Target Curve...'
            TabOrder = 1
            WordWrap = True
          end
        end
        object edtRateOfFire: TEdit
          Left = 323
          Top = 12
          Width = 52
          Height = 21
          TabOrder = 5
        end
        object edtMaxAltitude: TEdit
          Left = 323
          Top = 39
          Width = 52
          Height = 21
          TabOrder = 6
        end
        object edtAverageShell: TEdit
          Left = 323
          Top = 66
          Width = 52
          Height = 21
          TabOrder = 7
        end
        object cbxFireControl: TCheckBox
          Left = 3
          Top = 97
          Width = 161
          Height = 17
          Caption = 'Fire-Control Director Required'
          TabOrder = 8
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Notes'
        ImageIndex = 5
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 456
          Height = 406
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
