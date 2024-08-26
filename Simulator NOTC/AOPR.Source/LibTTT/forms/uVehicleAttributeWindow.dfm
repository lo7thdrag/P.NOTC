object fVehicleAttributeWindow: TfVehicleAttributeWindow
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Vehicle'
  ClientHeight = 719
  ClientWidth = 510
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 510
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
    object edtClass: TEdit
      Left = 10
      Top = 22
      Width = 513
      Height = 21
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 678
    Width = 510
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnApply: TButton
      Left = 430
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 349
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 268
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
    Top = 49
    Width = 510
    Height = 629
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pgc: TPageControl
      Left = 10
      Top = 6
      Width = 495
      Height = 617
      ActivePage = tsGeneral
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'General'
        object lbl2: TLabel
          Left = 5
          Top = 0
          Width = 34
          Height = 13
          Caption = 'Name :'
        end
        object lbl3: TLabel
          Left = 3
          Top = 149
          Width = 35
          Height = 13
          Caption = 'Domain'
        end
        object lbl4: TLabel
          Left = 1
          Top = 174
          Width = 45
          Height = 13
          Caption = 'Category'
        end
        object lbl5: TLabel
          Left = 1
          Top = 199
          Width = 24
          Height = 13
          Caption = 'Type'
        end
        object lbl6: TLabel
          Left = 1
          Top = 222
          Width = 87
          Height = 13
          Caption = 'Detectability Type'
        end
        object Label134: TLabel
          Left = 119
          Top = 172
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label135: TLabel
          Left = 119
          Top = 196
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label136: TLabel
          Left = 119
          Top = 221
          Width = 4
          Height = 13
          Caption = ':'
        end
        object lbl12: TLabel
          Left = 120
          Top = 150
          Width = 4
          Height = 13
          Caption = ':'
        end
        object edtName: TEdit
          Left = 3
          Top = 19
          Width = 401
          Height = 21
          TabOrder = 0
        end
        object btnAdd: TButton
          Left = 410
          Top = 17
          Width = 74
          Height = 25
          Caption = 'Add'
          TabOrder = 1
          OnClick = btnAddClick
        end
        object btnRemove: TButton
          Left = 410
          Top = 48
          Width = 74
          Height = 25
          Caption = 'Remove'
          TabOrder = 2
          OnClick = btnRemoveClick
        end
        object cbbCategory: TComboBox
          Left = 129
          Top = 169
          Width = 273
          Height = 21
          TabOrder = 3
        end
        object cbbType: TComboBox
          Left = 129
          Top = 194
          Width = 273
          Height = 21
          TabOrder = 4
        end
        object cbbDetectabilityType: TComboBox
          Left = 129
          Top = 219
          Width = 273
          Height = 21
          TabOrder = 5
          Items.Strings = (
            'Normal Detection'
            'Undetectable'
            'Passive Detection'
            'Always Visible')
        end
        object grbCapabilities: TGroupBox
          Left = 3
          Top = 252
          Width = 481
          Height = 45
          Caption = 'Capabilities'
          TabOrder = 6
          object cbxNavigation: TCheckBox
            Left = 126
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Navigation Lights'
            TabOrder = 0
          end
          object cbxBarrier: TCheckBox
            Left = 7
            Top = 16
            Width = 97
            Height = 17
            Caption = 'Barrier Chaff'
            TabOrder = 1
          end
        end
        object grbCommunication: TGroupBox
          Left = 3
          Top = 303
          Width = 481
          Height = 192
          Caption = 'Communications'
          TabOrder = 7
          object lbl7: TLabel
            Left = 8
            Top = 107
            Width = 75
            Height = 13
            Caption = 'Antenna Height'
          end
          object lbl8: TLabel
            Left = 8
            Top = 133
            Width = 230
            Height = 13
            Caption = 'Antenna Height Above Water When Submerged'
          end
          object lbl9: TLabel
            Left = 8
            Top = 159
            Width = 202
            Height = 13
            Caption = 'Maximum Communication Operating Depth'
          end
          object Label1: TLabel
            Left = 272
            Top = 107
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label2: TLabel
            Left = 272
            Top = 133
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label3: TLabel
            Left = 272
            Top = 159
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label4: TLabel
            Left = 351
            Top = 104
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label5: TLabel
            Left = 351
            Top = 130
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label6: TLabel
            Left = 351
            Top = 156
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object cbxHFLink: TCheckBox
            Left = 7
            Top = 16
            Width = 97
            Height = 17
            Caption = 'HF Link'
            TabOrder = 0
          end
          object cbxUHFLink: TCheckBox
            Left = 7
            Top = 39
            Width = 97
            Height = 17
            Caption = 'UHF Link'
            TabOrder = 1
          end
          object cbxHFVoice: TCheckBox
            Left = 126
            Top = 16
            Width = 97
            Height = 17
            Caption = 'HF Voice'
            TabOrder = 2
          end
          object cbxUHFVoice: TCheckBox
            Left = 126
            Top = 39
            Width = 97
            Height = 17
            Caption = 'UHF/VHF Voice'
            TabOrder = 3
          end
          object cbxSatcom: TCheckBox
            Left = 126
            Top = 62
            Width = 97
            Height = 17
            Caption = 'SATCOM Voice'
            TabOrder = 4
          end
          object cbxUnderwater: TCheckBox
            Left = 126
            Top = 85
            Width = 120
            Height = 17
            Caption = 'Underwater Voice'
            TabOrder = 5
          end
          object cbxHFMessageHandling: TCheckBox
            Left = 251
            Top = 16
            Width = 130
            Height = 17
            Caption = 'HF Message Handling'
            TabOrder = 6
          end
          object cbxUHFMessageHandling: TCheckBox
            Left = 251
            Top = 39
            Width = 130
            Height = 17
            Caption = 'UHF Message Handling'
            TabOrder = 7
          end
          object cbxSATCOMMessageHAndling: TCheckBox
            Left = 251
            Top = 62
            Width = 162
            Height = 17
            Caption = 'SATCOM Message Handling'
            TabOrder = 8
          end
          object edtAntennaHeight: TEdit
            Left = 282
            Top = 103
            Width = 63
            Height = 21
            TabOrder = 9
          end
          object edtAntennaAboveWater: TEdit
            Left = 282
            Top = 129
            Width = 63
            Height = 21
            TabOrder = 10
          end
          object edtMaxCom: TEdit
            Left = 282
            Top = 155
            Width = 63
            Height = 21
            TabOrder = 11
          end
        end
        object grpDamage: TGroupBox
          Left = 3
          Top = 501
          Width = 481
          Height = 85
          Caption = 'Damage Sustainability'
          TabOrder = 8
          object lbl10: TLabel
            Left = 8
            Top = 61
            Width = 6
            Height = 13
            Caption = '0'
          end
          object lbl11: TLabel
            Left = 376
            Top = 61
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object trckbDamage: TTrackBar
            Left = 0
            Top = 24
            Width = 416
            Height = 31
            Max = 100000
            Frequency = 20000
            TabOrder = 0
            OnChange = trckbDamageChange
          end
          object edtDamage: TEdit
            Left = 422
            Top = 21
            Width = 56
            Height = 21
            TabOrder = 1
          end
        end
        object lstName: TListBox
          Left = 3
          Top = 47
          Width = 401
          Height = 97
          ItemHeight = 13
          TabOrder = 9
        end
        object cbbDomain: TComboBox
          Left = 129
          Top = 145
          Width = 273
          Height = 21
          TabOrder = 10
          OnChange = cbbDomainChange
          Items.Strings = (
            'Surface'
            'Subsurface'
            'Air'
            'Land'
            'Amphibious')
        end
        object lbNameId: TListBox
          Left = 3
          Top = 47
          Width = 401
          Height = 97
          ItemHeight = 13
          TabOrder = 11
          Visible = False
        end
      end
      object tsPhysical: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
        object Label7: TLabel
          Left = 3
          Top = 3
          Width = 53
          Height = 13
          Caption = 'Dimensions'
        end
        object Label8: TLabel
          Left = 3
          Top = 31
          Width = 33
          Height = 13
          Caption = 'Length'
        end
        object Label9: TLabel
          Left = 91
          Top = 31
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label10: TLabel
          Left = 159
          Top = 31
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label11: TLabel
          Left = 3
          Top = 63
          Width = 28
          Height = 13
          Caption = 'Width'
        end
        object Label12: TLabel
          Left = 91
          Top = 63
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label13: TLabel
          Left = 159
          Top = 63
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label14: TLabel
          Left = 3
          Top = 95
          Width = 31
          Height = 13
          Caption = 'Height'
        end
        object Label15: TLabel
          Left = 91
          Top = 95
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label16: TLabel
          Left = 159
          Top = 95
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label17: TLabel
          Left = 254
          Top = 31
          Width = 60
          Height = 26
          Caption = 'Engagement Range '
          WordWrap = True
        end
        object Label18: TLabel
          Left = 339
          Top = 31
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label19: TLabel
          Left = 407
          Top = 31
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label23: TLabel
          Left = 254
          Top = 94
          Width = 25
          Height = 13
          Caption = 'Draft'
        end
        object Label24: TLabel
          Left = 339
          Top = 95
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label25: TLabel
          Left = 407
          Top = 95
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Bevel1: TBevel
          Left = 3
          Top = 128
          Width = 481
          Height = 3
        end
        object Label20: TLabel
          Left = 3
          Top = 137
          Width = 113
          Height = 13
          Caption = 'Motion Characteristics :'
        end
        object sbSearchMotion: TSpeedButton
          Left = 433
          Top = 155
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = sbSearchMotionClick
        end
        object Bevel2: TBevel
          Left = 3
          Top = 187
          Width = 481
          Height = 3
        end
        object Label21: TLabel
          Left = 3
          Top = 196
          Width = 72
          Height = 13
          Caption = 'Cross Section :'
        end
        object Bevel3: TBevel
          Left = 3
          Top = 431
          Width = 481
          Height = 3
        end
        object edtLengthDimension: TEdit
          Left = 101
          Top = 27
          Width = 52
          Height = 21
          TabOrder = 0
        end
        object edtWidthDimension: TEdit
          Left = 101
          Top = 59
          Width = 52
          Height = 21
          TabOrder = 1
        end
        object edtHeightDimension: TEdit
          Left = 101
          Top = 91
          Width = 52
          Height = 21
          TabOrder = 2
        end
        object edtEngagementRangeDimension: TEdit
          Left = 349
          Top = 27
          Width = 52
          Height = 21
          TabOrder = 3
        end
        object edtDraftDimension: TEdit
          Left = 349
          Top = 91
          Width = 52
          Height = 21
          TabOrder = 4
        end
        object edtMotionCharacterictic: TEdit
          Left = 3
          Top = 156
          Width = 424
          Height = 21
          TabOrder = 5
        end
        object grbRadarPhysical: TGroupBox
          Left = 3
          Top = 215
          Width = 238
          Height = 74
          Caption = 'Radar'
          TabOrder = 6
          object Label22: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label26: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object edtFrontRadarPhysical: TEdit
            Left = 98
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object cbFrontRadarPhysical: TComboBox
            Left = 156
            Top = 16
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 1
            Text = 'dB m'#178
          end
          object edtSideRadarPhysical: TEdit
            Left = 98
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object cbSideRadarPhysical: TComboBox
            Left = 156
            Top = 43
            Width = 67
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = 'dB m'#178
          end
        end
        object grbAcousticPhysical: TGroupBox
          Left = 247
          Top = 215
          Width = 238
          Height = 74
          Caption = 'Acoustic'
          TabOrder = 7
          object Label27: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label28: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object Label29: TLabel
            Left = 156
            Top = 21
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object Label30: TLabel
            Left = 156
            Top = 45
            Width = 28
            Height = 13
            Caption = 'dB m'#178
          end
          object edtFrontAcousticPhysical: TEdit
            Left = 98
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtFrontSidePhysical: TEdit
            Left = 98
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbVisualPhysical: TGroupBox
          Left = 3
          Top = 295
          Width = 238
          Height = 74
          Caption = 'Visual/Electro-Optical'
          TabOrder = 8
          object Label31: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label32: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object Label35: TLabel
            Left = 156
            Top = 21
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label36: TLabel
            Left = 156
            Top = 45
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object edtFrontVisualPhysical: TEdit
            Left = 98
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideVisualPhysical: TEdit
            Left = 98
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbInfraredPhysical: TGroupBox
          Left = 247
          Top = 295
          Width = 238
          Height = 74
          Caption = 'Infrared'
          TabOrder = 9
          object Label33: TLabel
            Left = 9
            Top = 20
            Width = 33
            Height = 13
            Caption = 'Front :'
          end
          object Label34: TLabel
            Left = 9
            Top = 47
            Width = 27
            Height = 13
            Caption = 'Side :'
          end
          object Label37: TLabel
            Left = 156
            Top = 21
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object Label38: TLabel
            Left = 156
            Top = 45
            Width = 38
            Height = 13
            Caption = 'metres'#178
          end
          object edtFrontInfraredPhysical: TEdit
            Left = 98
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtSideInfraredPhysical: TEdit
            Left = 98
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
        end
        object grbMagneticPhysical: TGroupBox
          Left = 3
          Top = 375
          Width = 238
          Height = 50
          Caption = 'Magnetic'
          TabOrder = 10
          object edtMagneticPhysical: TEdit
            Left = 98
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
        end
        object grbAcousticIntensityPhysical: TGroupBox
          Left = 3
          Top = 440
          Width = 481
          Height = 146
          Caption = 'Acoustic Intensity'
          TabOrder = 11
          object Label39: TLabel
            Left = 9
            Top = 20
            Width = 73
            Height = 13
            Caption = 'Minimum Speed'
          end
          object Label40: TLabel
            Left = 9
            Top = 47
            Width = 80
            Height = 13
            Caption = 'Below Cavitation'
          end
          object Label41: TLabel
            Left = 9
            Top = 74
            Width = 83
            Height = 13
            Caption = 'Above Cavitation'
          end
          object Label42: TLabel
            Left = 9
            Top = 101
            Width = 77
            Height = 13
            Caption = 'Maximum Speed'
          end
          object Label43: TLabel
            Left = 172
            Top = 20
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label44: TLabel
            Left = 172
            Top = 47
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label45: TLabel
            Left = 172
            Top = 74
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label46: TLabel
            Left = 172
            Top = 101
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label47: TLabel
            Left = 104
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label48: TLabel
            Left = 104
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label49: TLabel
            Left = 104
            Top = 74
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label50: TLabel
            Left = 104
            Top = 101
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label51: TLabel
            Left = 250
            Top = 20
            Width = 82
            Height = 13
            Caption = 'Cavitation Speed'
          end
          object Label52: TLabel
            Left = 413
            Top = 20
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object Label53: TLabel
            Left = 345
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object edtMinSpeedAcousticPhysical: TEdit
            Left = 114
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 0
          end
          object edtBelowCavitationAcousticPhysical: TEdit
            Left = 114
            Top = 43
            Width = 52
            Height = 21
            TabOrder = 1
          end
          object edtAboveCavitationAcousticPhysical: TEdit
            Left = 114
            Top = 70
            Width = 52
            Height = 21
            TabOrder = 2
          end
          object edtMaxSpeedAcousticPhysical: TEdit
            Left = 114
            Top = 97
            Width = 52
            Height = 21
            TabOrder = 3
          end
          object edtCavitationSpeedAcousticPhysical: TEdit
            Left = 355
            Top = 16
            Width = 52
            Height = 21
            TabOrder = 4
          end
        end
      end
      object tsCharacteristic: TTabSheet
        Caption = 'Characteristic'
        ImageIndex = 2
        object grbAirDropLimitation: TGroupBox
          Left = 3
          Top = 3
          Width = 446
          Height = 102
          Caption = 'Air Drop Torpedo Limitations'
          TabOrder = 0
          object Label76: TLabel
            Left = 9
            Top = 20
            Width = 110
            Height = 13
            Caption = 'Maximum Drop Altitude'
          end
          object Label77: TLabel
            Left = 9
            Top = 47
            Width = 106
            Height = 13
            Caption = 'Minimum Drop Altitude'
          end
          object Label78: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label79: TLabel
            Left = 160
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label80: TLabel
            Left = 9
            Top = 75
            Width = 103
            Height = 13
            Caption = 'Maximum Drop Speed'
          end
          object Label81: TLabel
            Left = 160
            Top = 75
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label82: TLabel
            Left = 367
            Top = 20
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label83: TLabel
            Left = 367
            Top = 45
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label84: TLabel
            Left = 367
            Top = 76
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object edtMaxDropAltitude: TEdit
            Left = 290
            Top = 16
            Width = 71
            Height = 21
            TabOrder = 0
          end
          object edtMinDropAltitude: TEdit
            Left = 290
            Top = 43
            Width = 71
            Height = 21
            TabOrder = 1
          end
          object edtMaxDropSpeed: TEdit
            Left = 290
            Top = 71
            Width = 71
            Height = 21
            TabOrder = 2
          end
        end
        object grbFlowNoiseFactors: TGroupBox
          Left = 3
          Top = 119
          Width = 446
          Height = 82
          Caption = 'Flow Noise Factors'
          TabOrder = 1
          object Label85: TLabel
            Left = 9
            Top = 20
            Width = 93
            Height = 13
            Caption = 'Hull Mounted Sonar'
          end
          object Label86: TLabel
            Left = 9
            Top = 47
            Width = 93
            Height = 13
            Caption = 'Towed Array Sonar'
          end
          object Label87: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label88: TLabel
            Left = 160
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label91: TLabel
            Left = 367
            Top = 20
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object Label92: TLabel
            Left = 367
            Top = 45
            Width = 12
            Height = 13
            Caption = 'dB'
          end
          object edtHullMounted: TEdit
            Left = 290
            Top = 16
            Width = 71
            Height = 21
            TabOrder = 0
          end
          object edtTowedArray: TEdit
            Left = 290
            Top = 43
            Width = 71
            Height = 21
            TabOrder = 1
          end
        end
        object grbSonobuoyCapable: TGroupBox
          Left = 3
          Top = 218
          Width = 446
          Height = 135
          TabOrder = 2
          object Label94: TLabel
            Left = 9
            Top = 20
            Width = 138
            Height = 13
            Caption = 'Maximum Number To Monitor'
          end
          object Label95: TLabel
            Left = 9
            Top = 47
            Width = 120
            Height = 13
            Caption = 'Maximum Deploy Altitude'
          end
          object Label96: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label97: TLabel
            Left = 160
            Top = 47
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label98: TLabel
            Left = 9
            Top = 75
            Width = 116
            Height = 13
            Caption = 'Minimum Deploy Altitude'
          end
          object Label99: TLabel
            Left = 160
            Top = 75
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label101: TLabel
            Left = 367
            Top = 45
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label102: TLabel
            Left = 367
            Top = 76
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label89: TLabel
            Left = 9
            Top = 102
            Width = 113
            Height = 13
            Caption = 'Maximum Deploy Speed'
          end
          object Label90: TLabel
            Left = 160
            Top = 102
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label93: TLabel
            Left = 367
            Top = 103
            Width = 26
            Height = 13
            Caption = 'knots'
          end
          object edtMaxNumbToMOnitor: TEdit
            Left = 290
            Top = 16
            Width = 71
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object edtMaxDeployAltitude: TEdit
            Left = 290
            Top = 43
            Width = 71
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object edtMinDeployAltitude: TEdit
            Left = 290
            Top = 71
            Width = 71
            Height = 21
            Enabled = False
            TabOrder = 2
          end
          object edtMaxDeploySpeed: TEdit
            Left = 290
            Top = 98
            Width = 71
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
        object cbxSonobuoyCapable: TCheckBox
          Left = 12
          Top = 210
          Width = 110
          Height = 17
          Caption = 'Sonobuoy Capable'
          TabOrder = 3
          OnClick = cbxSonobuoyCapableClick
        end
      end
      object tsPOH: TTabSheet
        Caption = 'POH Modifier'
        ImageIndex = 3
        object grbMissile: TGroupBox
          Left = 3
          Top = 3
          Width = 470
          Height = 174
          Caption = 'Missile'
          TabOrder = 0
          object Label100: TLabel
            Left = 9
            Top = 20
            Width = 106
            Height = 13
            Caption = 'Anti-Radiation Homing'
          end
          object Label103: TLabel
            Left = 9
            Top = 57
            Width = 78
            Height = 13
            Caption = 'Infrared Homing'
          end
          object Label104: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label105: TLabel
            Left = 160
            Top = 57
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label106: TLabel
            Left = 9
            Top = 95
            Width = 126
            Height = 13
            Caption = 'Semi-Active Radar Homing'
          end
          object Label107: TLabel
            Left = 160
            Top = 95
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label108: TLabel
            Left = 9
            Top = 132
            Width = 143
            Height = 13
            Caption = 'Terminal Active Radar Homing'
          end
          object Label109: TLabel
            Left = 160
            Top = 132
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label110: TLabel
            Left = 170
            Top = 155
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label128: TLabel
            Left = 385
            Top = 155
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtAntiRadiationMissile: TEdit
            Left = 408
            Top = 16
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object edtInfraredHomingMissile: TEdit
            Left = 408
            Top = 53
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object edtSemiActiveMissile: TEdit
            Left = 408
            Top = 90
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object edtTerminalActiveMissile: TEdit
            Left = 408
            Top = 126
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object TrackBarAntiRadiationMissile: TTrackBar
            Left = 170
            Top = 18
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 4
            ThumbLength = 15
            OnChange = TrackBarAntiRadiationMissileChange
          end
          object TrackBarInfraredHomingMissile: TTrackBar
            Left = 170
            Top = 55
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarInfraredHomingMissileChange
          end
          object TrackBarSemiActiveMissile: TTrackBar
            Left = 170
            Top = 91
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 6
            ThumbLength = 15
            OnChange = TrackBarSemiActiveMissileChange
          end
          object TrackBarTerminalActiveMissile: TTrackBar
            Left = 170
            Top = 126
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 7
            ThumbLength = 15
            OnChange = TrackBarTerminalActiveMissileChange
          end
        end
        object grbTorpedo: TGroupBox
          Left = 3
          Top = 191
          Width = 470
          Height = 202
          Caption = 'Torpedo'
          TabOrder = 1
          object Label111: TLabel
            Left = 9
            Top = 20
            Width = 111
            Height = 13
            Caption = 'Active Acoustic Homing'
          end
          object Label112: TLabel
            Left = 9
            Top = 57
            Width = 117
            Height = 13
            Caption = 'Passive Acoustic Homing'
          end
          object Label113: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label114: TLabel
            Left = 160
            Top = 57
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label115: TLabel
            Left = 9
            Top = 95
            Width = 151
            Height = 13
            Caption = 'Active/Passive Acoustic Homing'
          end
          object Label116: TLabel
            Left = 160
            Top = 95
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label117: TLabel
            Left = 9
            Top = 164
            Width = 59
            Height = 13
            Caption = 'Wire-Guided'
          end
          object Label118: TLabel
            Left = 160
            Top = 164
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label119: TLabel
            Left = 170
            Top = 187
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label120: TLabel
            Left = 385
            Top = 187
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object Label132: TLabel
            Left = 9
            Top = 131
            Width = 65
            Height = 13
            Caption = 'Wake Homing'
          end
          object Label133: TLabel
            Left = 160
            Top = 131
            Width = 4
            Height = 13
            Caption = ':'
          end
          object edtActiveAcousticTorpedo: TEdit
            Left = 408
            Top = 16
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object edtPassiveAcousticTorpedo: TEdit
            Left = 408
            Top = 53
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object edtActivePassiveAcousticTorpedo: TEdit
            Left = 408
            Top = 90
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object edtWireGuidedTorpedo: TEdit
            Left = 408
            Top = 158
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object TrackBarActiveAcousticTorpedo: TTrackBar
            Left = 170
            Top = 18
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 4
            ThumbLength = 15
            OnChange = TrackBarActiveAcousticTorpedoChange
          end
          object TrackBarPassiveAcousticTorpedo: TTrackBar
            Left = 170
            Top = 55
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarPassiveAcousticTorpedoChange
          end
          object TrackBarActivePassiveAcousticTorpedo: TTrackBar
            Left = 170
            Top = 91
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 6
            ThumbLength = 15
            OnChange = TrackBarActivePassiveAcousticTorpedoChange
          end
          object TrackBarWireGuidedTorpedo: TTrackBar
            Left = 170
            Top = 158
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 7
            ThumbLength = 15
            OnChange = TrackBarWireGuidedTorpedoChange
          end
          object edtWakeHomingTorpedo: TEdit
            Left = 408
            Top = 126
            Width = 49
            Height = 21
            TabOrder = 8
          end
          object TrackBarWakeHomingTorpedo: TTrackBar
            Left = 170
            Top = 127
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 9
            ThumbLength = 15
            OnChange = TrackBarWakeHomingTorpedoChange
          end
        end
        object grbMine: TGroupBox
          Left = 3
          Top = 408
          Width = 470
          Height = 174
          Caption = 'Mine'
          TabOrder = 2
          object Label121: TLabel
            Left = 9
            Top = 20
            Width = 40
            Height = 13
            Caption = 'Acoustic'
          end
          object Label122: TLabel
            Left = 9
            Top = 57
            Width = 33
            Height = 13
            Caption = 'Impact'
          end
          object Label123: TLabel
            Left = 160
            Top = 20
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label124: TLabel
            Left = 160
            Top = 57
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label125: TLabel
            Left = 9
            Top = 95
            Width = 43
            Height = 13
            Caption = 'Magnetic'
          end
          object Label126: TLabel
            Left = 160
            Top = 95
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label127: TLabel
            Left = 9
            Top = 132
            Width = 42
            Height = 13
            Caption = 'Pressure'
          end
          object Label129: TLabel
            Left = 160
            Top = 132
            Width = 4
            Height = 13
            Caption = ':'
          end
          object Label130: TLabel
            Left = 170
            Top = 155
            Width = 17
            Height = 13
            Caption = '0%'
          end
          object Label131: TLabel
            Left = 385
            Top = 155
            Width = 29
            Height = 13
            Caption = '100%'
          end
          object edtAcousticMine: TEdit
            Left = 408
            Top = 16
            Width = 49
            Height = 21
            TabOrder = 0
          end
          object edtImpactMine: TEdit
            Left = 408
            Top = 53
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object edtMagneticMine: TEdit
            Left = 408
            Top = 90
            Width = 49
            Height = 21
            TabOrder = 2
          end
          object edtPressureMine: TEdit
            Left = 408
            Top = 126
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object TrackBarAcousticMine: TTrackBar
            Left = 170
            Top = 18
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 4
            ThumbLength = 15
            OnChange = TrackBarAcousticMineChange
          end
          object TrackBarImpactMine: TTrackBar
            Left = 170
            Top = 55
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 5
            ThumbLength = 15
            OnChange = TrackBarImpactMineChange
          end
          object TrackBarMagneticMine: TTrackBar
            Left = 170
            Top = 91
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 6
            ThumbLength = 15
            OnChange = TrackBarMagneticMineChange
          end
          object TrackBarPressureMine: TTrackBar
            Left = 170
            Top = 126
            Width = 232
            Height = 29
            Max = 5
            Frequency = 20
            TabOrder = 7
            ThumbLength = 15
            OnChange = TrackBarPressureMineChange
          end
        end
      end
      object tsAssets: TTabSheet
        Caption = 'Assets'
        ImageIndex = 4
        object grpSensor: TGroupBox
          Left = 3
          Top = 3
          Width = 470
          Height = 126
          Caption = 'Sensors'
          TabOrder = 0
          object btnRadar: TButton
            Left = 3
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Radar'
            TabOrder = 0
            OnClick = btnRadarClick
          end
          object btnMAD: TButton
            Left = 158
            Top = 24
            Width = 149
            Height = 25
            Caption = 'MAD...'
            TabOrder = 1
            OnClick = btnMADClick
          end
          object btnESM: TButton
            Left = 313
            Top = 24
            Width = 149
            Height = 25
            Caption = 'ESM...'
            TabOrder = 2
            OnClick = btnESMClick
          end
          object btnSonar: TButton
            Left = 3
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Sonar...'
            TabOrder = 3
            OnClick = btnSonarClick
          end
          object btnElectroOpticalDetector: TButton
            Left = 158
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Electro-Optical Detector...'
            TabOrder = 4
            OnClick = btnElectroOpticalDetectorClick
          end
          object btnIFF: TButton
            Left = 313
            Top = 55
            Width = 149
            Height = 25
            Caption = 'IFF...'
            TabOrder = 5
            OnClick = btnIFFClick
          end
          object btnVisualDetector: TButton
            Left = 3
            Top = 86
            Width = 149
            Height = 25
            Caption = 'Visual Detector...'
            TabOrder = 6
            OnClick = btnVisualDetectorClick
          end
          object btnSonobuoy: TButton
            Left = 158
            Top = 86
            Width = 149
            Height = 25
            Caption = 'Sonobuoy...'
            TabOrder = 7
            OnClick = btnSonobuoyClick
          end
        end
        object grpWeapons: TGroupBox
          Left = 3
          Top = 135
          Width = 470
          Height = 90
          Caption = 'Weapons'
          TabOrder = 1
          object btnMissiles: TButton
            Left = 3
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Missiles...'
            TabOrder = 0
            OnClick = btnMissilesClick
          end
          object btnTorpedos: TButton
            Left = 158
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Torpedoes...'
            TabOrder = 1
            OnClick = btnTorpedosClick
          end
          object btnMines: TButton
            Left = 313
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Mines...'
            TabOrder = 2
            OnClick = btnMinesClick
          end
          object btnGuns: TButton
            Left = 3
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Guns...'
            TabOrder = 3
            OnClick = btnGunsClick
          end
          object btnBomb_DepthCharges: TButton
            Left = 158
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Bombs/Depth Charges...'
            TabOrder = 4
            OnClick = btnBomb_DepthChargesClick
          end
        end
        object grpCountermeasures: TGroupBox
          Left = 3
          Top = 231
          Width = 470
          Height = 126
          Caption = 'Countermeasures'
          TabOrder = 2
          object btnRadarJummer: TButton
            Left = 3
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Radar Jammer...'
            TabOrder = 0
            OnClick = btnRadarJummerClick
          end
          object btnAirBubble: TButton
            Left = 158
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Air Bubble...'
            TabOrder = 1
            OnClick = btnAirBubbleClick
          end
          object btnAccousticDecoy: TButton
            Left = 313
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Accoustic Decoy...'
            TabOrder = 2
            OnClick = btnAccousticDecoyClick
          end
          object btnDefensiveJummer: TButton
            Left = 3
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Defensive Jammer...'
            TabOrder = 3
            OnClick = btnDefensiveJummerClick
          end
          object btnTowedJummer_Decoy: TButton
            Left = 158
            Top = 54
            Width = 149
            Height = 25
            Caption = 'Towed Jammer/Decoy...'
            TabOrder = 4
            OnClick = btnTowedJummer_DecoyClick
          end
          object btnFloatingDecoy: TButton
            Left = 313
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Floating Decoy...'
            TabOrder = 5
            OnClick = btnFloatingDecoyClick
          end
          object btnChaff: TButton
            Left = 1
            Top = 86
            Width = 149
            Height = 25
            Caption = 'Chaff...'
            TabOrder = 6
            OnClick = btnChaffClick
          end
        end
        object grpBasing: TGroupBox
          Left = 3
          Top = 363
          Width = 470
          Height = 103
          Caption = 'Basing'
          TabOrder = 3
          object btnEmbarkedPlatforms: TButton
            Left = 313
            Top = 24
            Width = 149
            Height = 25
            Caption = 'Embarked Platforms...'
            TabOrder = 0
            OnClick = btnEmbarkedPlatformsClick
          end
          object btnHelicopterLimitations: TButton
            Left = 313
            Top = 55
            Width = 149
            Height = 25
            Caption = 'Helicopter Limitations...'
            TabOrder = 1
          end
          object cmbBasingType: TComboBox
            Left = 3
            Top = 24
            Width = 304
            Height = 21
            TabOrder = 2
            Items.Strings = (
              'None'
              'Rotary'
              'Rotary and Fixed'
              'Surface and Subsurface'
              'Surface, Subsurface, and Rotary'
              'All')
          end
        end
        object grpReadyingTime: TGroupBox
          Left = 3
          Top = 472
          Width = 470
          Height = 92
          Caption = 'ReadyingTime'
          TabOrder = 4
          object labelRefuel: TLabel
            Left = 11
            Top = 24
            Width = 102
            Height = 13
            Caption = 'Refuel/Re-arm Time :'
          end
          object Label54: TLabel
            Left = 11
            Top = 51
            Width = 92
            Height = 13
            Caption = 'Launch Alert Time :'
          end
          object Label55: TLabel
            Left = 285
            Top = 24
            Width = 46
            Height = 13
            Caption = 'hh:mm:ss'
          end
          object Label56: TLabel
            Left = 285
            Top = 51
            Width = 46
            Height = 13
            Caption = 'hh:mm:ss'
          end
          object edtRefuelTime: TEdit
            Left = 158
            Top = 21
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edtLaunchAlertTime: TEdit
            Left = 158
            Top = 48
            Width = 121
            Height = 21
            TabOrder = 1
          end
        end
      end
      object tsPeriscope: TTabSheet
        Caption = 'Periscope'
        ImageIndex = 5
        object Bevel4: TBevel
          Left = 3
          Top = 110
          Width = 470
          Height = 3
        end
        object Label61: TLabel
          Left = 14
          Top = 119
          Width = 186
          Height = 13
          Caption = 'Periscope/Radar Mast Cross-Sections :'
        end
        object grpPeriscope: TGroupBox
          Left = 3
          Top = 3
          Width = 470
          Height = 92
          Caption = 'Persicope'
          TabOrder = 0
          object Label57: TLabel
            Left = 11
            Top = 27
            Width = 131
            Height = 13
            Caption = 'Maximum Operating Depth:'
          end
          object Label59: TLabel
            Left = 383
            Top = 27
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label60: TLabel
            Left = 383
            Top = 54
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object Label58: TLabel
            Left = 11
            Top = 54
            Width = 96
            Height = 13
            Caption = 'Hight Above Water:'
          end
          object edtMaxOperatPeriscope: TEdit
            Left = 313
            Top = 24
            Width = 64
            Height = 21
            TabOrder = 0
          end
          object edtHighAbovePeriscope: TEdit
            Left = 313
            Top = 51
            Width = 64
            Height = 21
            TabOrder = 1
          end
        end
        object grpRadar: TGroupBox
          Left = 3
          Top = 138
          Width = 230
          Height = 92
          Caption = 'Radar'
          TabOrder = 1
          object Label62: TLabel
            Left = 11
            Top = 27
            Width = 30
            Height = 13
            Caption = 'Front:'
          end
          object Label65: TLabel
            Left = 11
            Top = 54
            Width = 24
            Height = 13
            Caption = 'Side:'
          end
          object edtFontRadar: TEdit
            Left = 77
            Top = 24
            Width = 61
            Height = 21
            TabOrder = 0
          end
          object edtSideRadar: TEdit
            Left = 77
            Top = 51
            Width = 61
            Height = 21
            TabOrder = 1
          end
          object cbxFontRadar: TComboBox
            Left = 144
            Top = 24
            Width = 65
            Height = 21
            TabOrder = 2
            Items.Strings = (
              'dB m2')
          end
          object cbxSideRadar: TComboBox
            Left = 144
            Top = 51
            Width = 65
            Height = 21
            TabOrder = 3
            Items.Strings = (
              'dB m2')
          end
        end
        object grpInfrared: TGroupBox
          Left = 239
          Top = 138
          Width = 234
          Height = 92
          Caption = 'Infrared'
          TabOrder = 2
          object Label63: TLabel
            Left = 11
            Top = 27
            Width = 30
            Height = 13
            Caption = 'Front:'
          end
          object Label64: TLabel
            Left = 11
            Top = 54
            Width = 24
            Height = 13
            Caption = 'Side:'
          end
          object Label70: TLabel
            Left = 143
            Top = 54
            Width = 33
            Height = 13
            Caption = 'meters'
          end
          object Label71: TLabel
            Left = 143
            Top = 27
            Width = 33
            Height = 13
            Caption = 'meters'
          end
          object Label74: TLabel
            Left = 176
            Top = 53
            Width = 4
            Height = 10
            Caption = '2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label75: TLabel
            Left = 176
            Top = 26
            Width = 4
            Height = 10
            Caption = '2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtFontInfrared: TEdit
            Left = 77
            Top = 24
            Width = 60
            Height = 21
            TabOrder = 0
          end
          object edtSideInfrared: TEdit
            Left = 77
            Top = 51
            Width = 60
            Height = 21
            TabOrder = 1
          end
        end
        object grpVisual: TGroupBox
          Left = 3
          Top = 236
          Width = 230
          Height = 92
          Caption = 'Visual'
          TabOrder = 3
          object Label66: TLabel
            Left = 11
            Top = 27
            Width = 30
            Height = 13
            Caption = 'Front:'
          end
          object Label67: TLabel
            Left = 11
            Top = 54
            Width = 24
            Height = 13
            Caption = 'Side:'
          end
          object Label68: TLabel
            Left = 144
            Top = 27
            Width = 33
            Height = 13
            Caption = 'meters'
          end
          object Label69: TLabel
            Left = 144
            Top = 54
            Width = 33
            Height = 13
            Caption = 'meters'
          end
          object Label72: TLabel
            Left = 176
            Top = 26
            Width = 4
            Height = 10
            Caption = '2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label73: TLabel
            Left = 177
            Top = 53
            Width = 4
            Height = 10
            Caption = '2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtFontVisual: TEdit
            Left = 77
            Top = 24
            Width = 61
            Height = 21
            TabOrder = 0
          end
          object edtSideVisual: TEdit
            Left = 77
            Top = 51
            Width = 61
            Height = 21
            TabOrder = 1
          end
        end
      end
      object tsNotes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 6
        object grpNotes: TGroupBox
          Left = 3
          Top = 3
          Width = 481
          Height = 583
          Caption = 'Notes'
          TabOrder = 0
          object redtNotes: TRichEdit
            Left = 16
            Top = 24
            Width = 449
            Height = 545
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Lines.Strings = (
              '')
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
  end
end
