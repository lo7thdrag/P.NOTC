object fEmbarkedSelect: TfEmbarkedSelect
  Left = 0
  Top = 0
  Caption = 'Vehicle'
  ClientHeight = 712
  ClientWidth = 623
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
  object shp1: TShape
    Left = 8
    Top = 368
    Width = 605
    Height = 2
  end
  object lbRAVehicle: TListBox
    Left = 350
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 6
    OnClick = lbRAVehicleClick
  end
  object btnAdd: TButton
    Left = 279
    Top = 152
    Width = 65
    Height = 25
    Caption = 'Add ->'
    Enabled = False
    TabOrder = 2
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 459
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Remove'
    Enabled = False
    TabOrder = 7
    OnClick = btnRemoveClick
  end
  object btnOk: TButton
    Left = 456
    Top = 376
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 10
    OnClick = btnOkClick
  end
  object btnClose: TButton
    Left = 540
    Top = 376
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object lbTempIdAll: TListBox
    Left = 8
    Top = 373
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 13
    Visible = False
  end
  object lbTempIdSel: TListBox
    Left = 135
    Top = 373
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 14
    Visible = False
  end
  object lbAllVehicle: TListBox
    Left = 8
    Top = 8
    Width = 265
    Height = 321
    ItemHeight = 13
    TabOrder = 1
    OnClick = lbAllVehicleClick
  end
  object btnEdit: TButton
    Left = 176
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 5
    OnClick = btnEditClick
  end
  object btnCopy: TButton
    Left = 92
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Copy...'
    Enabled = False
    TabOrder = 4
    OnClick = btnCopyClick
  end
  object btnNew: TButton
    Left = 8
    Top = 335
    Width = 75
    Height = 25
    Caption = 'New...'
    TabOrder = 3
    OnClick = btnNewClick
  end
  object btnEditTrack: TButton
    Left = 540
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 8
    OnClick = btnEditTrackClick
  end
  object grpFilter: TGroupBox
    Left = 8
    Top = 407
    Width = 325
    Height = 297
    Caption = 'Filter'
    TabOrder = 12
    object lbl1: TLabel
      Left = 29
      Top = 93
      Width = 67
      Height = 13
      Caption = 'Sensor Type :'
    end
    object lbl2: TLabel
      Left = 235
      Top = 118
      Width = 43
      Height = 13
      Caption = 'on Board'
    end
    object lbl3: TLabel
      Left = 29
      Top = 161
      Width = 74
      Height = 13
      Caption = 'Weapon Type :'
    end
    object lbl4: TLabel
      Left = 235
      Top = 192
      Width = 43
      Height = 13
      Caption = 'on Board'
    end
    object lbl5: TLabel
      Left = 11
      Top = 267
      Width = 40
      Height = 13
      Caption = 'Search :'
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
      Left = 108
      Top = 16
      Width = 205
      Height = 21
      TabOrder = 1
      OnChange = cbbFilterDomainChange
      Items.Strings = (
        'Surface'
        'Subsurface'
        'Air'
        'Land'
        'Amphibious')
    end
    object chkType: TCheckBox
      Left = 11
      Top = 43
      Width = 78
      Height = 17
      Caption = 'Type'
      TabOrder = 2
      OnClick = chkDomainClick
    end
    object chkSensor: TCheckBox
      Left = 11
      Top = 73
      Width = 126
      Height = 17
      Caption = 'Sensor Complement'
      TabOrder = 4
      OnClick = chkDomainClick
    end
    object chkWeapon: TCheckBox
      Left = 11
      Top = 141
      Width = 142
      Height = 14
      Caption = 'Weapon Complement'
      TabOrder = 8
      OnClick = chkDomainClick
    end
    object chkEmbarked: TCheckBox
      Left = 11
      Top = 208
      Width = 149
      Height = 17
      Caption = 'Embarked Platform Class'
      TabOrder = 12
      OnClick = chkDomainClick
    end
    object cbbFilterType: TComboBox
      Left = 108
      Top = 43
      Width = 205
      Height = 21
      TabOrder = 3
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
      Left = 108
      Top = 90
      Width = 205
      Height = 21
      Enabled = False
      TabOrder = 5
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
      Left = 109
      Top = 160
      Width = 204
      Height = 21
      Enabled = False
      TabOrder = 9
      OnChange = cbbFilterWeaponTypeChange
      Items.Strings = (
        'Mine'
        'Missile'
        'Torpedo')
    end
    object edtFilterWeaponOnBoar: TEdit
      Left = 108
      Top = 187
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 10
    end
    object btn2: TButton
      Left = 284
      Top = 187
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      TabOrder = 11
      OnClick = btn2Click
    end
    object edtFilterEmbarkedPlatform: TEdit
      Left = 108
      Top = 226
      Width = 170
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 13
    end
    object btn3: TButton
      Left = 284
      Top = 224
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      TabOrder = 14
      OnClick = btn3Click
    end
    object edtFiltersensorOnBoard: TEdit
      Left = 108
      Top = 117
      Width = 121
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 6
    end
    object btn1: TButton
      Left = 284
      Top = 117
      Width = 25
      Height = 25
      Caption = '...'
      Enabled = False
      TabOrder = 7
      OnClick = btn1Click
    end
    object edtSearch: TEdit
      Left = 108
      Top = 262
      Width = 189
      Height = 21
      TabOrder = 15
      OnKeyPress = edtSearchKeyPress
    end
  end
  object btnFilter: TButton
    Left = 8
    Top = 376
    Width = 75
    Height = 25
    Caption = '>> Filter'
    TabOrder = 11
    OnClick = btnFilterClick
  end
  object btnUsage: TButton
    Left = 378
    Top = 335
    Width = 75
    Height = 25
    Caption = 'Usage...'
    Enabled = False
    TabOrder = 9
    OnClick = btnUsageClick
  end
  object lbQuantity: TListBox
    Left = 143
    Top = 381
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 15
    Visible = False
  end
end
