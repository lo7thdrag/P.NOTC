object fVehiclePicklistFilter: TfVehiclePicklistFilter
  Left = 0
  Top = 0
  Caption = 'Vehicle'
  ClientHeight = 616
  ClientWidth = 333
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
    Width = 333
    Height = 616
    Align = alClient
    TabOrder = 0
    object lbTempId: TListBox
      Left = 8
      Top = 8
      Width = 321
      Height = 283
      ItemHeight = 13
      TabOrder = 0
      Visible = False
    end
    object lbTempIdAll: TListBox
      Left = 8
      Top = 8
      Width = 321
      Height = 283
      ItemHeight = 13
      TabOrder = 1
      Visible = False
    end
    object lbAllVehicle: TListBox
      Left = 8
      Top = 8
      Width = 321
      Height = 283
      ItemHeight = 13
      TabOrder = 2
    end
    object btnClose: TButton
      Left = 257
      Top = 327
      Width = 72
      Height = 25
      Caption = 'Close'
      TabOrder = 3
      OnClick = btnCloseClick
    end
    object btnEdit: TButton
      Left = 176
      Top = 297
      Width = 75
      Height = 25
      Caption = 'Edit..'
      TabOrder = 4
      OnClick = btnEditClick
    end
    object btnCopy: TButton
      Left = 92
      Top = 297
      Width = 75
      Height = 25
      Caption = 'Copy..'
      TabOrder = 5
      OnClick = btnCopyClick
    end
    object btnNew: TButton
      Left = 8
      Top = 297
      Width = 75
      Height = 25
      Caption = 'New..'
      TabOrder = 6
      OnClick = btnNewClick
    end
    object btnRemove: TButton
      Left = 257
      Top = 297
      Width = 72
      Height = 25
      Caption = 'Remove'
      TabOrder = 7
      OnClick = btnRemoveClick
    end
    object btnUsage: TButton
      Left = 176
      Top = 327
      Width = 75
      Height = 25
      Caption = 'Usage..'
      TabOrder = 8
    end
    object grpFilter: TGroupBox
      Left = 4
      Top = 355
      Width = 325
      Height = 253
      Caption = 'Filter'
      TabOrder = 9
      object lbl1: TLabel
        Left = 95
        Top = 93
        Width = 67
        Height = 13
        Caption = 'Sensor Type :'
      end
      object lbl2: TLabel
        Left = 216
        Top = 118
        Width = 43
        Height = 13
        Caption = 'on Board'
      end
      object lbl3: TLabel
        Left = 94
        Top = 163
        Width = 74
        Height = 13
        Caption = 'Weapon Type :'
      end
      object lbl4: TLabel
        Left = 216
        Top = 192
        Width = 43
        Height = 13
        Caption = 'on Board'
      end
      object chkDomain: TCheckBox
        Left = 11
        Top = 20
        Width = 78
        Height = 17
        Caption = 'Domain'
        TabOrder = 0
        OnClick = chkDomainClick
      end
      object cbbFilterDomain: TComboBox
        Left = 95
        Top = 16
        Width = 218
        Height = 21
        TabOrder = 1
        OnChange = cbbFilterDomainChange
        Items.Strings = (
          'Air'
          'Amphibious'
          'Land'
          'Subsurface'
          'Surface')
      end
      object chkType: TCheckBox
        Left = 11
        Top = 43
        Width = 78
        Height = 17
        Caption = 'Type'
        TabOrder = 2
        OnClick = chkTypeClick
      end
      object chkSensor: TCheckBox
        Left = 11
        Top = 73
        Width = 126
        Height = 17
        Caption = 'Sensor Complement'
        TabOrder = 3
        OnClick = chkSensorClick
      end
      object chkWeapon: TCheckBox
        Left = 11
        Top = 141
        Width = 142
        Height = 14
        Caption = 'Weapon Complement'
        TabOrder = 4
        OnClick = chkWeaponClick
      end
      object chkEmbarked: TCheckBox
        Left = 11
        Top = 208
        Width = 149
        Height = 17
        Caption = 'Embarked Platform Class'
        TabOrder = 5
        OnClick = chkEmbarkedClick
      end
      object cbbFilterType: TComboBox
        Left = 95
        Top = 43
        Width = 218
        Height = 21
        TabOrder = 6
        OnChange = cbbFilterTypeChange
        Items.Strings = (
          'Frigate, Guided Missile (FFG)'
          'Destroyer, Guided Missile (DDG)'
          'Cruiser, Guided Missile (CG/CGN)'
          'Aircraft Carrier (CV/CVN)'
          'Patrol Craft (PT/PTG)'
          'Mine Warfare'
          'Auxiliary'
          'Merchant'
          'Utility Vessel'
          'Destroyer (DD)'
          'Frigate (FF)'
          'Amphibious Warfare'
          'Other'
          'Diesel, Attack (SSK)'
          'Nuclear, Attack (SSN)'
          'Nuclear, Guided Missile (SSGN)'
          'Diesel, Guided Missile (SSG)'
          'Nuclear, Ballistic Missile (SSBN)'
          'Fixed Wing, Fighter'
          'Fixed Wing, Strike/Bomber'
          'Fixed Wing, ASW/MP'
          'Rotary Wing, ASW'
          'Rotary Wing, Attack'
          'Fixed Wing, EW'
          'Fixed - Surveillance/AEW'
          'Fixed - Reconnaissance'
          'Rotary Wing - Surveillance/AEW'
          'Rotary Wing - Reconnaissance'
          'Seaplane'
          'Missile'
          'Platoon, Armour'
          'Platoon, Infantry'
          'Battery, Anti-aircraft Artillery'
          'Battery, Surface-to-Air Missile'
          'Battery, Coastal Defence Missile'
          'Battery, Coastal Defence Gun'
          'Airfield'
          'Port'
          'Special Craft'
          'Other'
          ''
          ''
          '')
      end
      object cbbFilterSensorType: TComboBox
        Left = 184
        Top = 90
        Width = 129
        Height = 21
        TabOrder = 7
        OnChange = cbbFilterSensorTypeChange
        Items.Strings = (
          'Electro-Optical Detector'
          'Electronic Support Measures'
          'IFF Detector'
          'Magnetic Anomaly Detector'
          'Radar'
          'Sonar'
          'Sonobuoy'
          'Visual Detector')
      end
      object cbbFilterWeaponType: TComboBox
        Left = 183
        Top = 160
        Width = 129
        Height = 21
        TabOrder = 8
        OnChange = cbbFilterWeaponTypeChange
        Items.Strings = (
          'Mine'
          'Missile'
          'Torpedo')
      end
      object edtFilterWeaponOnBoar: TEdit
        Left = 89
        Top = 187
        Width = 121
        Height = 21
        TabOrder = 9
      end
      object btn2: TButton
        Left = 265
        Top = 187
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 10
        OnClick = btn2Click
      end
      object edtFilterEmbarkedPlatform: TEdit
        Left = 89
        Top = 226
        Width = 170
        Height = 21
        TabOrder = 11
      end
      object btn3: TButton
        Left = 265
        Top = 225
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 12
        OnClick = btn3Click
      end
      object edtFiltersensorOnBoard: TEdit
        Left = 89
        Top = 117
        Width = 121
        Height = 21
        TabOrder = 13
      end
      object btn1: TButton
        Left = 265
        Top = 117
        Width = 25
        Height = 25
        Caption = '...'
        TabOrder = 14
        OnClick = btn1Click
      end
    end
    object btnFilter: TButton
      Left = 8
      Top = 327
      Width = 75
      Height = 25
      Caption = '>> Filter'
      TabOrder = 10
      OnClick = btnFilterClick
    end
  end
end
