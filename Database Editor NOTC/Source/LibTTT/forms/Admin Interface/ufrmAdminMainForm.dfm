object frmAdminMainForm: TfrmAdminMainForm
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsToolWindow
  Caption = 'Database Editor'
  ClientHeight = 1251
  ClientWidth = 1665
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl20: TLabel
    Left = 1309
    Top = 3
    Width = 26
    Height = 13
    Caption = 'Skin :'
    Visible = False
  end
  object lbl22: TLabel
    Left = 44
    Top = 161
    Width = 65
    Height = 13
    Caption = 'Map Mode 1 :'
  end
  object Map1: TMap
    Left = 665
    Top = 0
    Width = 1000
    Height = 1167
    ParentColor = False
    Align = alClient
    TabOrder = 0
    OnMouseUp = Map1MouseUp
    OnMouseMove = Map1MouseMove
    OnMouseDown = Map1MouseDown
    OnMapViewChanged = Map1MapViewChanged
    ExplicitLeft = 522
    ExplicitTop = -2
    ExplicitWidth = 1004
    ExplicitHeight = 843
    ControlData = {
      8A1A06005A6700009D780000010000000F0000FF0D47656F44696374696F6E61
      727905456D70747900E8030000000000000000000002000E001E000000000000
      0000000000000000000000000000000000000000000600010000000000500001
      010000640000000001F4010000050000800C000000000000000000000000FFFF
      FF000100000000000000000000000000000000000000000000000352E30B918F
      CE119DE300AA004BB85101000000900184130E0005417269616C000352E30B91
      8FCE119DE300AA004BB8510100000090015C790C0005417269616C0000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
      8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
      918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
      6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
      0100011801000090937C04010000004803A64C1C000000000000000000000000
      01000118010000805ED408010000000CCE28001C000000000000000000000000
      010001180100000813EA1701000000000000001C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8076C000000000008056C0000000000080764000000000008056400100000018
      01000090937C040100000084DF97001C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000EAC0000050EE810400
      98072888DD97003404687798118B040000B00000000000000000000000000000
      000088B3400000000000408F400000000000}
  end
  object btnDeploy: TButton
    Left = 532
    Top = 678
    Width = 97
    Height = 25
    Caption = 'Deploy...'
    TabOrder = 1
    Visible = False
    OnClick = btnDeployClick
  end
  object pnlEnvi: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 400
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object btnOkEnvi: TButton
      Left = 7
      Top = 401
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkEnviClick
    end
  end
  object btnIdentIndex: TButton
    Left = 532
    Top = 709
    Width = 75
    Height = 25
    Caption = 'Ident Index'
    TabOrder = 3
    Visible = False
    OnClick = btnIdentIndexClick
  end
  object cbbThemes: TComboBox
    Left = 1353
    Top = 0
    Width = 161
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 4
    Visible = False
    OnChange = cbbThemesChange
    Items.Strings = (
      'Calcium'
      'GrayPlastic'
      'LongHorn'
      'Lucky'
      'MacMetal'
      'Neutral'
      'Neutral2'
      'Neutral4'
      'Office2007 Black'
      'Opus'
      'Snow Leopard'
      'Steam'
      'Topaz'
      'TV-b'
      'Vienna'
      'WLM')
  end
  object btn4: TButton
    Left = 332
    Top = 161
    Width = 151
    Height = 25
    Caption = 'Map Mode 1'
    TabOrder = 5
    OnClick = btnMapMode1Click
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 665
    Height = 1167
    Align = alLeft
    Color = clSilver
    ParentBackground = False
    TabOrder = 6
    Visible = False
    object grpDeployAndFormation: TGroupBox
      Left = 239
      Top = 398
      Width = 268
      Height = 433
      TabOrder = 0
      object lvPlatform: TListView
        Left = 7
        Top = 13
        Width = 254
        Height = 377
        Columns = <
          item
            Caption = 'No'
            Width = 30
          end
          item
            Caption = 'Instance Name'
            Width = 125
          end
          item
            Caption = 'Track ID'
            Width = 47
          end
          item
            Caption = 'Force'
            Width = 47
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = lvPlatformClick
        OnCustomDrawItem = lvPlatformCustomDrawItem
      end
      object btnFormation: TButton
        Left = 7
        Top = 397
        Width = 254
        Height = 25
        Caption = 'Formation'
        Enabled = False
        TabOrder = 1
        OnClick = btnFormationClick
      end
      object btnLogistics: TButton
        Left = 15
        Top = 357
        Width = 124
        Height = 25
        Caption = 'Logistics'
        TabOrder = 2
        Visible = False
        OnClick = btnLogisticsClick
      end
    end
    object grpForcePlatforms: TGroupBox
      Left = 10
      Top = 229
      Width = 118
      Height = 163
      Caption = 'Force'
      TabOrder = 1
      object rbRedPlatforms: TRadioButton
        Left = 17
        Top = 52
        Width = 92
        Height = 17
        Caption = 'Red'
        TabOrder = 0
      end
      object rbAmberPlatforms: TRadioButton
        Left = 17
        Top = 75
        Width = 93
        Height = 17
        Caption = 'Yellow'
        TabOrder = 1
      end
      object rbBluePlatforms: TRadioButton
        Left = 17
        Top = 28
        Width = 91
        Height = 17
        Caption = 'Blue'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object rbGreenPlatforms: TRadioButton
        Left = 17
        Top = 98
        Width = 84
        Height = 17
        Caption = 'Green'
        TabOrder = 3
      end
      object rbNoPlatforms: TRadioButton
        Left = 17
        Top = 121
        Width = 83
        Height = 17
        Caption = 'No Force'
        TabOrder = 4
      end
    end
    object grpGroup: TGroupBox
      Left = 8
      Top = 653
      Width = 225
      Height = 178
      TabOrder = 2
      object rgforce: TRadioGroup
        Left = 13
        Top = 12
        Width = 85
        Height = 155
        Caption = 'Force'
        ItemIndex = 0
        Items.Strings = (
          'Blue'
          'Red'
          'Yellow'
          'Green'
          'No Force')
        TabOrder = 0
      end
      object btn1: TButton
        Left = 118
        Top = 24
        Width = 90
        Height = 27
        Caption = 'New Group'
        TabOrder = 1
        Visible = False
        OnClick = btn1Click
      end
      object btn2: TButton
        Left = 118
        Top = 63
        Width = 90
        Height = 27
        Caption = 'Edit Group'
        TabOrder = 2
        Visible = False
      end
      object btnGroups: TButton
        Left = 112
        Top = 142
        Width = 96
        Height = 25
        Caption = 'Groups...'
        TabOrder = 3
        OnClick = btnGroupsClick
      end
    end
    object grpPlatforms: TGroupBox
      Left = 140
      Top = 231
      Width = 365
      Height = 161
      Caption = 'Platforms'
      TabOrder = 3
      object btnVehicle: TButton
        Left = 18
        Top = 26
        Width = 151
        Height = 25
        Caption = 'Vehicle...'
        TabOrder = 0
        OnClick = btnVehicleClick
      end
      object btnWaypoint: TButton
        Left = 188
        Top = 57
        Width = 151
        Height = 25
        Caption = 'Waypoint...'
        TabOrder = 1
        OnClick = btnWaypointClick
      end
      object btnOverlay: TButton
        Left = 18
        Top = 122
        Width = 151
        Height = 25
        Caption = 'Overlay...'
        TabOrder = 2
        OnClick = btnOverlayClick
      end
      object btnBase: TButton
        Left = 18
        Top = 60
        Width = 151
        Height = 25
        Caption = 'Base...'
        TabOrder = 3
        OnClick = btnBaseClick
      end
      object btnRuntimePlatformLibraries: TButton
        Left = 188
        Top = 26
        Width = 151
        Height = 25
        Caption = 'Runtime Platform...'
        TabOrder = 4
        OnClick = btnRuntimePlatformLibrariesClick
      end
      object btn3: TButton
        Left = 18
        Top = 91
        Width = 151
        Height = 25
        Caption = 'Plotting...'
        TabOrder = 5
        OnClick = btn3Click
      end
      object btnTarget: TButton
        Left = 190
        Top = 149
        Width = 151
        Height = 25
        Caption = 'Target...'
        TabOrder = 6
        OnClick = btnTargetClick
      end
    end
    object grpSce: TGroupBox
      Left = 7
      Top = 2
      Width = 585
      Height = 223
      Caption = 'Scenario'
      TabOrder = 4
      object lbl5: TLabel
        Left = 14
        Top = 26
        Width = 77
        Height = 13
        Caption = 'Scenario name :'
      end
      object lbl7: TLabel
        Left = 37
        Top = 54
        Width = 54
        Height = 13
        Caption = 'Start time :'
      end
      object lbl6: TLabel
        Left = 482
        Top = 18
        Width = 27
        Height = 13
        Caption = 'port :'
        Visible = False
      end
      object lbl9: TLabel
        Left = 37
        Top = 126
        Width = 65
        Height = 13
        Caption = 'Map Mode 1 :'
      end
      object lbl21: TLabel
        Left = 36
        Top = 158
        Width = 65
        Height = 13
        Caption = 'Map Mode 2 :'
      end
      object lbl23: TLabel
        Left = 35
        Top = 95
        Width = 438
        Height = 13
        Caption = 
          '________________________________________________________________' +
          '_________'
      end
      object lbl24: TLabel
        Left = 36
        Top = 190
        Width = 65
        Height = 13
        Caption = 'Map Mode 3 :'
      end
      object Label1: TLabel
        Left = 37
        Top = 83
        Width = 54
        Height = 13
        Caption = 'D Day       :'
      end
      object edtScenarioName: TEdit
        Left = 108
        Top = 23
        Width = 193
        Height = 21
        TabOrder = 0
      end
      object edtStartTime: TEdit
        Left = 69
        Top = 3
        Width = 163
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object btnEnvi: TButton
        Left = 322
        Top = 48
        Width = 151
        Height = 25
        Caption = 'Environment'
        TabOrder = 2
        OnClick = btnEnviClick
      end
      object btnEditScenario: TButton
        Left = 322
        Top = 19
        Width = 151
        Height = 25
        Caption = 'Edit Scenario'
        TabOrder = 3
        OnClick = btnEditScenarioClick
      end
      object btnMapMode1: TButton
        Tag = 1
        Left = 322
        Top = 120
        Width = 151
        Height = 25
        Caption = 'Map Mode 1'
        TabOrder = 4
        OnClick = btnMapMode1Click
      end
      object cbbPort: TComboBox
        Left = 479
        Top = 37
        Width = 173
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 5
        Visible = False
        OnChange = cbbPortChange
        Items.Strings = (
          'Sangatta ENC'
          'Situbondo ENC'
          'Sangatta Vector'
          'Situbondo Vector'
          'Other')
      end
      object edtMapMode1: TEdit
        Tag = 1
        Left = 108
        Top = 122
        Width = 193
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object dtpDate: TDateTimePicker
        Left = 108
        Top = 50
        Width = 92
        Height = 21
        Date = 42159.000000000000000000
        Time = 0.391244918981101400
        TabOrder = 7
      end
      object dtpTime: TDateTimePicker
        Left = 209
        Top = 50
        Width = 92
        Height = 21
        Date = 42159.000000000000000000
        Time = 0.391244918981101400
        Kind = dtkTime
        TabOrder = 8
      end
      object edtMapMode2: TEdit
        Tag = 2
        Left = 107
        Top = 154
        Width = 193
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object btnMapMode2: TButton
        Tag = 2
        Left = 322
        Top = 152
        Width = 151
        Height = 25
        Caption = 'Map Mode 2'
        TabOrder = 10
        OnClick = btnMapMode1Click
      end
      object edtMapMode3: TEdit
        Tag = 3
        Left = 107
        Top = 186
        Width = 193
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object btnMapMode3: TButton
        Tag = 3
        Left = 322
        Top = 184
        Width = 151
        Height = 25
        Caption = 'Map Mode 3'
        TabOrder = 12
        OnClick = btnMapMode1Click
      end
      object dtpDDay: TDateTimePicker
        Left = 108
        Top = 77
        Width = 92
        Height = 21
        Date = 42159.000000000000000000
        Time = 42159.000000000000000000
        TabOrder = 13
      end
      object dtpJamJ: TDateTimePicker
        Left = 209
        Top = 77
        Width = 92
        Height = 21
        Date = 42159.000000000000000000
        Time = 42159.000000000000000000
        Kind = dtkTime
        TabOrder = 14
      end
    end
    object grpSelect: TGroupBox
      Left = 9
      Top = 398
      Width = 225
      Height = 249
      Enabled = False
      TabOrder = 5
      object lbl2: TLabel
        Left = 13
        Top = 90
        Width = 15
        Height = 13
        Caption = 'Lat'
      end
      object lbl3: TLabel
        Left = 12
        Top = 57
        Width = 23
        Height = 13
        Caption = 'Long'
      end
      object lbl1: TLabel
        Left = 13
        Top = 110
        Width = 192
        Height = 13
        Caption = '________________________________'
      end
      object lblPlatformName: TLabel
        Left = 15
        Top = 22
        Width = 194
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'No Ship Selected'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl14: TLabel
        Left = 12
        Top = 142
        Width = 34
        Height = 13
        Caption = 'Course'
      end
      object lbl15: TLabel
        Left = 12
        Top = 168
        Width = 68
        Height = 13
        Caption = 'Ground Speed'
      end
      object lbl16: TLabel
        Left = 12
        Top = 193
        Width = 70
        Height = 13
        Caption = 'Altitude/Depth'
      end
      object lbl17: TLabel
        Left = 67
        Top = 57
        Width = 4
        Height = 13
        Caption = ':'
      end
      object lbl18: TLabel
        Left = 67
        Top = 90
        Width = 4
        Height = 13
        Caption = ':'
      end
      object lbl10: TLabel
        Left = 93
        Top = 142
        Width = 4
        Height = 13
        Caption = ':'
      end
      object lbl19: TLabel
        Left = 93
        Top = 193
        Width = 4
        Height = 13
        Caption = ':'
      end
      object lbl13: TLabel
        Left = 93
        Top = 168
        Width = 4
        Height = 13
        Caption = ':'
      end
      object lblShowActivation: TLabel
        Left = 133
        Top = 225
        Width = 72
        Height = 13
        Cursor = crHandPoint
        Caption = 'Show details...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        OnClick = lblShowActivationClick
      end
      object edtLatPosition: TEdit
        Left = 87
        Top = 86
        Width = 118
        Height = 21
        TabOrder = 0
        OnKeyPress = edtLongPositionKeyPress
      end
      object edtLongPosition: TEdit
        Left = 87
        Top = 53
        Width = 118
        Height = 21
        TabOrder = 1
        OnKeyPress = edtLongPositionKeyPress
      end
      object edtCourse: TEdit
        Left = 115
        Top = 138
        Width = 90
        Height = 21
        TabOrder = 2
        Text = '0'
        OnKeyPress = edtCourseKeyPress
      end
      object edtAltitude: TEdit
        Left = 115
        Top = 189
        Width = 90
        Height = 21
        TabOrder = 3
        Text = '0'
        OnKeyPress = edtAltitudeKeyPress
      end
      object cbbGroundSpeed: TComboBox
        Left = 115
        Top = 163
        Width = 90
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        TabOrder = 4
        OnChange = cbbGroundSpeedChange
        Items.Strings = (
          'Minimum'
          'Cruise'
          'High'
          'Maximum')
      end
    end
    object ScrollBar1: TScrollBar
      Left = 648
      Top = 1
      Width = 16
      Height = 1165
      Align = alRight
      Kind = sbVertical
      PageSize = 20
      TabOrder = 6
      Visible = False
      OnScroll = ScrollBar1Scroll
    end
    object pnlDetailActivation: TPanel
      Left = 384
      Top = 380
      Width = 293
      Height = 434
      BevelOuter = bvNone
      Color = clGradientActiveCaption
      ParentBackground = False
      TabOrder = 7
      object lblHideActivation: TLabel
        Left = 161
        Top = 420
        Width = 67
        Height = 13
        Cursor = crHandPoint
        Caption = 'Hide details...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
        OnClick = lblHideActivationClick
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 0
        Width = 225
        Height = 409
        Enabled = False
        TabOrder = 0
        object Label5: TLabel
          Left = 13
          Top = 90
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label6: TLabel
          Left = 12
          Top = 57
          Width = 23
          Height = 13
          Caption = 'Long'
        end
        object Label7: TLabel
          Left = 13
          Top = 109
          Width = 192
          Height = 15
          AutoSize = False
          Caption = '________________________________'
          Color = clGradientActiveCaption
          ParentColor = False
        end
        object lblPlatformNameDetail: TLabel
          Left = 16
          Top = 22
          Width = 194
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'No Ship Selected'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 12
          Top = 142
          Width = 34
          Height = 13
          Caption = 'Course'
        end
        object Label9: TLabel
          Left = 12
          Top = 167
          Width = 68
          Height = 13
          Caption = 'Ground Speed'
        end
        object Label32: TLabel
          Left = 12
          Top = 193
          Width = 70
          Height = 13
          Caption = 'Altitude/Depth'
        end
        object Label10: TLabel
          Left = 67
          Top = 57
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label11: TLabel
          Left = 67
          Top = 90
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label12: TLabel
          Left = 93
          Top = 142
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label13: TLabel
          Left = 93
          Top = 193
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label14: TLabel
          Left = 93
          Top = 167
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label17: TLabel
          Left = 12
          Top = 237
          Width = 20
          Height = 13
          Caption = 'Fuel'
        end
        object Label18: TLabel
          Left = 191
          Top = 237
          Width = 14
          Height = 13
          Caption = 'm3'
        end
        object Label19: TLabel
          Left = 12
          Top = 262
          Width = 49
          Height = 13
          Caption = 'Lubricants'
        end
        object Label20: TLabel
          Left = 191
          Top = 262
          Width = 14
          Height = 13
          Caption = 'm3'
        end
        object Label21: TLabel
          Left = 12
          Top = 287
          Width = 60
          Height = 13
          Caption = 'Fresh Water'
        end
        object Label23: TLabel
          Left = 12
          Top = 312
          Width = 30
          Height = 13
          Caption = 'Water'
        end
        object Label25: TLabel
          Left = 191
          Top = 337
          Width = 16
          Height = 13
          Caption = 'ton'
        end
        object Label29: TLabel
          Left = 191
          Top = 287
          Width = 14
          Height = 13
          Caption = 'm3'
        end
        object Label33: TLabel
          Left = 191
          Top = 312
          Width = 14
          Height = 13
          Caption = 'm3'
        end
        object Label37: TLabel
          Left = 12
          Top = 337
          Width = 24
          Height = 13
          Caption = 'Food'
        end
        object Label36: TLabel
          Left = 13
          Top = 210
          Width = 192
          Height = 15
          AutoSize = False
          Caption = '________________________________'
          Color = clGradientActiveCaption
          ParentColor = False
        end
        object Label15: TLabel
          Left = 92
          Top = 337
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label16: TLabel
          Left = 92
          Top = 262
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label22: TLabel
          Left = 92
          Top = 237
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label24: TLabel
          Left = 92
          Top = 287
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label26: TLabel
          Left = 92
          Top = 312
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label2: TLabel
          Left = 167
          Top = 358
          Width = 40
          Height = 13
          Caption = 'Reset...'
          DragCursor = crHandPoint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsItalic]
          ParentFont = False
          OnClick = Label2Click
        end
        object edtLatPositionDetail: TEdit
          Left = 87
          Top = 86
          Width = 118
          Height = 21
          TabOrder = 1
          OnKeyPress = edtLongPositionDetailKeyPress
        end
        object edtLongPositionDetail: TEdit
          Left = 87
          Top = 53
          Width = 118
          Height = 21
          TabOrder = 0
          OnKeyPress = edtLongPositionDetailKeyPress
        end
        object edtCourseDetail: TEdit
          Left = 115
          Top = 138
          Width = 90
          Height = 21
          TabOrder = 2
          Text = '0'
          OnKeyPress = edtCourseKeyPress
        end
        object edtAltitudeDetail: TEdit
          Left = 115
          Top = 189
          Width = 90
          Height = 21
          TabOrder = 3
          Text = '0'
          OnKeyPress = edtAltitudeKeyPress
        end
        object cbbGroundSpeedDetail: TComboBox
          Left = 115
          Top = 163
          Width = 90
          Height = 22
          Style = csOwnerDrawFixed
          Enabled = False
          TabOrder = 4
          OnChange = cbbGroundSpeedDetailChange
          Items.Strings = (
            'Minimum'
            'Cruise'
            'High'
            'Maximum')
        end
        object edtFuelRemaining: TEdit
          Left = 115
          Top = 233
          Width = 70
          Height = 21
          Alignment = taRightJustify
          TabOrder = 5
          OnKeyPress = edtFuelRemainingKeyPress
        end
        object edtLubricantsRemaining: TEdit
          Left = 115
          Top = 258
          Width = 70
          Height = 21
          Alignment = taRightJustify
          TabOrder = 6
          OnKeyPress = edtLubricantsRemainingKeyPress
        end
        object edtFreshwaterRemaining: TEdit
          Left = 115
          Top = 283
          Width = 70
          Height = 21
          Alignment = taRightJustify
          TabOrder = 7
          OnKeyPress = edtFreshwaterRemainingKeyPress
        end
        object edtWaterRemaining: TEdit
          Left = 115
          Top = 308
          Width = 70
          Height = 21
          Alignment = taRightJustify
          TabOrder = 8
          OnKeyPress = edtWaterRemainingKeyPress
        end
        object edtFoodRemaining: TEdit
          Left = 115
          Top = 333
          Width = 70
          Height = 21
          Alignment = taRightJustify
          TabOrder = 9
          OnKeyPress = edtFoodRemainingKeyPress
        end
        object btnDetailEmbarkPlatform: TButton
          Left = 13
          Top = 375
          Width = 199
          Height = 25
          Caption = 'Show Embark Platform'
          TabOrder = 10
          Visible = False
          OnClick = btnDetailEmbarkPlatformClick
        end
      end
      object GroupBox2: TGroupBox
        Left = 233
        Top = 0
        Width = 268
        Height = 409
        Enabled = False
        TabOrder = 1
        object Label40: TLabel
          Left = 9
          Top = 12
          Width = 97
          Height = 13
          Caption = 'Air Platform Carried '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label41: TLabel
          Left = 9
          Top = 134
          Width = 182
          Height = 13
          Caption = 'Amphibious and Land Platform Carried'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label42: TLabel
          Left = 9
          Top = 288
          Width = 79
          Height = 13
          Caption = 'Personel Carried'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lvEmbarkPlatformSelected: TListView
          Left = 9
          Top = 30
          Width = 250
          Height = 89
          Columns = <
            item
              Caption = 'Name'
              Width = 175
            end
            item
              Alignment = taCenter
              Caption = 'Track ID'
              Width = 60
            end>
          GridLines = True
          TabOrder = 0
          ViewStyle = vsReport
        end
        object ListView1: TListView
          Left = 9
          Top = 152
          Width = 250
          Height = 121
          Columns = <
            item
              Caption = 'Name'
              Width = 175
            end
            item
              Alignment = taCenter
              Caption = 'Track ID'
              Width = 60
            end>
          GridLines = True
          TabOrder = 1
          ViewStyle = vsReport
        end
        object tvPersonel: TTreeView
          Left = 9
          Top = 305
          Width = 176
          Height = 93
          DoubleBuffered = True
          Indent = 19
          ParentDoubleBuffered = False
          ReadOnly = True
          TabOrder = 2
        end
        object btnAddEmbarkDetail: TButton
          Left = 192
          Top = 373
          Width = 68
          Height = 25
          Caption = 'Add'
          TabOrder = 3
          OnClick = btnAddEmbarkDetailClick
        end
      end
    end
  end
  object pnlButtom: TPanel
    Left = 0
    Top = 1167
    Width = 1665
    Height = 84
    Align = alBottom
    Color = clSilver
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 7
    Visible = False
    object lbl_Zoom: TLabel
      Left = 513
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Zoom :'
    end
    object lbl_ZoomValue: TLabel
      Left = 510
      Top = 38
      Width = 34
      Height = 13
      Caption = '000.00'
    end
    object btnCancel: TButton
      Left = 120
      Top = 17
      Width = 96
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 10
      Top = 17
      Width = 94
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object grpInfo: TGroupBox
      Left = 576
      Top = 4
      Width = 505
      Height = 57
      DoubleBuffered = False
      ParentDoubleBuffered = False
      TabOrder = 2
      object bvl1: TBevel
        Left = 183
        Top = 11
        Width = 2
        Height = 41
      end
      object lbl4: TLabel
        Left = 15
        Top = 14
        Width = 54
        Height = 13
        Caption = 'Longitude :'
      end
      object lbl8: TLabel
        Left = 17
        Top = 35
        Width = 52
        Height = 13
        Caption = 'Latitude   :'
      end
      object lblLongitude: TLabel
        Left = 120
        Top = 14
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000.00'
      end
      object lblLatitude: TLabel
        Left = 120
        Top = 35
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000.00'
      end
      object lbl11: TLabel
        Left = 201
        Top = 14
        Width = 28
        Height = 13
        Caption = 'X      :'
      end
      object lbl12: TLabel
        Left = 201
        Top = 35
        Width = 28
        Height = 13
        Caption = 'Y      :'
      end
      object lblX: TLabel
        Left = 270
        Top = 14
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000.00'
      end
      object lblY: TLabel
        Left = 270
        Top = 35
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = '000.00'
      end
      object lblUTM: TLabel
        Left = 393
        Top = 14
        Width = 8
        Height = 13
        Caption = '--'
      end
      object lblMGRS: TLabel
        Left = 393
        Top = 33
        Width = 8
        Height = 13
        Caption = '--'
      end
      object bvlX: TBevel
        Left = 329
        Top = 13
        Width = 1
        Height = 36
      end
      object lbl25: TLabel
        Left = 341
        Top = 16
        Width = 37
        Height = 13
        Caption = 'UTM    :'
      end
      object lbl26: TLabel
        Left = 341
        Top = 33
        Width = 38
        Height = 13
        Caption = 'MGRS  :'
      end
    end
    object grpTool: TGroupBox
      Left = 1087
      Top = 3
      Width = 530
      Height = 57
      TabOrder = 3
      object btnAirMap: TSpeedButtonImage
        Left = 409
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Template 1'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = btnAirMapClick
      end
      object btnArrow: TSpeedButtonImage
        Left = 55
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Arrow'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnCenter: TSpeedButtonImage
        Left = 143
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Center'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnHand: TSpeedButtonImage
        Left = 15
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Hand'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnLandMap: TSpeedButtonImage
        Left = 448
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Template 2'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = btnLandMapClick
      end
      object btnMulti: TSpeedButtonImage
        Left = 303
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Multi Select'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnPlatformView: TSpeedButtonImage
        Left = 343
        Top = 17
        Width = 30
        Height = 30
        Hint = 'Static View'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnRuler: TSpeedButtonImage
        Left = 263
        Top = 17
        Width = 30
        Height = 30
        Hint = 'show ruler'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnSeaMap: TSpeedButtonImage
        Left = 484
        Top = 24
        Width = 30
        Height = 30
        Hint = 'Template 3'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSeaMapClick
      end
      object btnZoomIn: TSpeedButtonImage
        Left = 183
        Top = 17
        Width = 30
        Height = 30
        Hint = 'ZoomIn'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object btnZoomOut: TSpeedButtonImage
        Left = 224
        Top = 17
        Width = 30
        Height = 30
        Hint = 'ZoomOut'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object bvl3: TBevel
        Left = 390
        Top = 17
        Width = 2
        Height = 30
      end
      object btnMove: TSpeedButtonImage
        Left = 98
        Top = 17
        Width = 30
        Height = 30
        Hint = 'move platform'
        Caption = ''
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
    end
    object ScrollBar2: TScrollBar
      Left = 1
      Top = 67
      Width = 1663
      Height = 16
      Align = alBottom
      PageSize = 40
      TabOrder = 4
      Visible = False
      OnScroll = ScrollBar2Scroll
    end
    object grp_Long: TGroupBox
      Left = 284
      Top = 6
      Width = 194
      Height = 55
      TabOrder = 5
      object lbl_CenterX: TLabel
        Left = 13
        Top = 13
        Width = 49
        Height = 13
        Caption = 'Center X :'
      end
      object lbl_CenterY: TLabel
        Left = 13
        Top = 34
        Width = 49
        Height = 13
        Caption = 'Center Y :'
      end
      object lbl_ValueCenterX: TLabel
        Left = 99
        Top = 13
        Width = 34
        Height = 13
        Caption = '000.00'
      end
      object lbl_ValueCenterY: TLabel
        Left = 99
        Top = 33
        Width = 34
        Height = 13
        Caption = '000.00'
      end
    end
  end
  object Panel1: TPanel
    Left = 665
    Top = 0
    Width = 1000
    Height = 1167
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 8
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 65527
    object Exercise1: TMenuItem
      Caption = 'Exercise'
      Visible = False
      object Scenario1: TMenuItem
        Caption = 'Scenario'#8230
        OnClick = Scenario1Click
      end
      object ResourceAllocation1: TMenuItem
        Caption = 'Resource Allocation'#8230
        OnClick = ResourceAllocation1Click
      end
      object Environment1: TMenuItem
        Caption = 'Environment'#8230
        OnClick = Environment1Click
      end
      object GameArea1: TMenuItem
        Caption = 'Game Area'#8230
        OnClick = GameArea1Click
      end
    end
    object Platforms1: TMenuItem
      Caption = 'Platforms'
      object Vehicle1: TMenuItem
        Caption = 'Vehicle'#8230
        OnClick = Vehicle1Click
      end
      object Personel1: TMenuItem
        Caption = 'Personel'
        Visible = False
        OnClick = Personel1Click
      end
      object Motion1: TMenuItem
        Caption = 'Motion'#8230
        OnClick = Motion1Click
      end
    end
    object mniRegion1: TMenuItem
      Caption = 'Region'
      Visible = False
      object mniPort2: TMenuItem
        Caption = 'Port'
        OnClick = mniPort2Click
      end
      object mniBeach1: TMenuItem
        Caption = 'Beach'
        OnClick = mniBeach1Click
      end
      object mnibay1: TMenuItem
        Caption = 'Bay'
        OnClick = mnibay1Click
      end
    end
    object Sensors1: TMenuItem
      Caption = 'Sensors'
      object Radar1: TMenuItem
        Caption = 'Radar'#8230
        OnClick = Radar1Click
      end
      object Sonar1: TMenuItem
        Caption = 'Sonar'#8230
        OnClick = Sonar1Click
      end
      object ESM1: TMenuItem
        Caption = 'ESM'#8230
        OnClick = ESM1Click
      end
      object ElectroOpticalDetector1: TMenuItem
        Caption = 'Electro Optical Detector'#8230
        OnClick = ElectroOpticalDetector1Click
      end
      object Sonobuoy1: TMenuItem
        Caption = 'Sonobuoy'#8230
        OnClick = Sonobuoy1Click
      end
      object MAD1: TMenuItem
        Caption = 'MAD'#8230
        OnClick = MAD1Click
      end
    end
    object Weapons1: TMenuItem
      Caption = 'Weapons'
      object Missile1: TMenuItem
        Caption = 'Missile'#8230
        OnClick = Missile1Click
      end
      object orpedo1: TMenuItem
        Caption = 'Torpedo'#8230
        OnClick = orpedo1Click
      end
      object Mine1: TMenuItem
        Caption = 'Mine'#8230
        OnClick = Mine1Click
      end
      object Gun1: TMenuItem
        Caption = 'Gun'#8230
        OnClick = Gun1Click
      end
      object Bomb1: TMenuItem
        Caption = 'Bomb'#8230
        OnClick = Bomb1Click
      end
    end
    object Countermeasures1: TMenuItem
      Caption = 'Countermeasures'
      object AcousticDecoy1: TMenuItem
        Caption = 'Acoustic Decoy'#8230
        OnClick = AcousticDecoy1Click
      end
      object AirBubble1: TMenuItem
        Caption = 'Air Bubble'#8230
        OnClick = AirBubble1Click
      end
      object Chaff1: TMenuItem
        Caption = 'Chaff'#8230
        OnClick = Chaff1Click
      end
      object InfraredDecoy1: TMenuItem
        Caption = 'Infrared Decoy...'
        OnClick = InfraredDecoy1Click
      end
      object FloatingDecoy1: TMenuItem
        Caption = 'Floating Decoy'#8230
        OnClick = FloatingDecoy1Click
      end
      object SelfDefensiveJammer1: TMenuItem
        Caption = 'Self Defensive Jammer'#8230
        OnClick = SelfDefensiveJammer1Click
      end
      object owedJammerDecoy1: TMenuItem
        Caption = 'Towed Jammer/Decoy'#8230
        OnClick = owedJammerDecoy1Click
      end
      object RadarNoiseJammer1: TMenuItem
        Caption = 'Radar Noise Jammer'#8230
        OnClick = RadarNoiseJammer1Click
      end
    end
    object Other1: TMenuItem
      Caption = 'Other'
      object GameArea2: TMenuItem
        Caption = 'Game Area...'
        OnClick = GameArea2Click
      end
      object RuntimePlatformLibrary1: TMenuItem
        Caption = 'Runtime Platform Library'#8230
        OnClick = RuntimePlatformLibrary1Click
      end
      object x1: TMenuItem
        Caption = 'Student Roles'#8230
        Visible = False
        OnClick = x1Click
      end
      object GameDefaults1: TMenuItem
        Caption = 'Game Defaults'#8230
        Visible = False
        OnClick = GameDefaults1Click
      end
      object SNRvsPODCurve1: TMenuItem
        Caption = 'SNR vs. POD Curve'#8230
        Visible = False
        OnClick = SNRvsPODCurve1Click
      end
      object EmbarkLibrary1: TMenuItem
        Caption = 'Bases...'
        OnClick = EmbarkLibrary1Click
      end
      object GraphicalOverlays1: TMenuItem
        Caption = 'Overlays'#8230
        OnClick = GraphicalOverlays1Click
      end
      object Plotting1: TMenuItem
        Caption = 'Plotting...'
        Visible = False
        OnClick = Plotting1Click
      end
      object mniWaypoint1: TMenuItem
        Caption = 'Waypoint...'
        OnClick = mniWaypoint1Click
      end
      object mniLogistics1: TMenuItem
        Caption = 'Logistics'
      end
      object mniTransport1: TMenuItem
        Caption = 'Transport'
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      Visible = False
      object DisplayDimensionsinfeet1: TMenuItem
        Caption = 'Display Dimensions in feet'
        OnClick = DisplayDimensionsinfeet1Click
      end
      object DisplayDimensionsinmetres1: TMenuItem
        Caption = 'Display Dimensions in metres'
        OnClick = DisplayDimensionsinmetres1Click
      end
    end
    object mniAdministrator1: TMenuItem
      Caption = 'Administrator'
      object mniUserAdministrator1: TMenuItem
        Caption = 'User Administrator'
        OnClick = mniUserAdministrator1Click
      end
      object GameReport1: TMenuItem
        Caption = 'Game Report'
        OnClick = GameReport1Click
      end
    end
    object mniView1: TMenuItem
      Caption = 'View Mode'
      object mniStaticSymbolMode1: TMenuItem
        Caption = 'Static Symbol Mode'
        Checked = True
        OnClick = mniStaticSymbolMode1Click
      end
      object mniDinamicViewMode1: TMenuItem
        Tag = 1
        Caption = 'Dinamic Symbol Mode'
        OnClick = mniStaticSymbolMode1Click
      end
      object mniDimensionSymbolMode1: TMenuItem
        Tag = 2
        Caption = 'Dimension Symbol Mode'
        OnClick = mniStaticSymbolMode1Click
      end
    end
    object Shutdown1: TMenuItem
      Caption = 'Shutdown'
      object ShutdownDatabaseEditor1: TMenuItem
        Caption = 'Shutdown Database Editor'#8230
        OnClick = ShutdownDatabaseEditor1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      Visible = False
      object AboutDatabaseEditor1: TMenuItem
        Caption = 'Help Database Editor'#8230
        OnClick = AboutDatabaseEditor1Click
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 616
    Top = 16
    object Hand1: TMenuItem
      Caption = 'Hand'
      ImageIndex = 0
      OnClick = Hand1Click
    end
    object Arrow1: TMenuItem
      Caption = 'Arrow'
      ImageIndex = 1
      OnClick = Arrow1Click
    end
    object Move1: TMenuItem
      Caption = 'Move'
      ImageIndex = 8
      OnClick = Move1Click
    end
    object Center1: TMenuItem
      Caption = 'Center'
      ImageIndex = 2
      OnClick = Center1Click
    end
    object ZoomIn1: TMenuItem
      Caption = 'Zoom In'
      ImageIndex = 3
      OnClick = ZoomIn1Click
    end
    object ZoomOut1: TMenuItem
      Caption = 'Zoom Out'
      ImageIndex = 4
      OnClick = ZoomOut1Click
    end
    object Ruler1: TMenuItem
      Caption = 'Ruler'
      ImageIndex = 5
      OnClick = Ruler1Click
    end
    object MultiSelect1: TMenuItem
      Caption = 'Multi Select'
      ImageIndex = 6
      OnClick = MultiSelect1Click
    end
    object TacticalView1: TMenuItem
      Caption = 'Tactical View'
      ImageIndex = 7
      OnClick = TacticalView1Click
    end
  end
  object ImageList1: TImageList
    Height = 24
    Width = 24
    Left = 752
    Top = 552
    Bitmap = {
      494C010109007400040018001800FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000060000000480000000100200000000000006C
      0000000000000000000000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C7674005E5856005853
      500056514F0057524F0057524F0057524F0057524F0057524F0057524F005752
      4F00554E4C006864630055504C0057524F0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400605B57005A55
      53005A5452005A5452005A5452005A5452005A5452005A5452005A5452005A54
      5200544F4D0092929100524C4A005A5453005A5452005A5452005A5452005A54
      52005B555300605B57007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400635C59005D57
      55005C5655005C5755005C5755005D5755005B5553005D5755005C5654005751
      4F00524C4A009190900050494700585350005C5654005C5755005C5755005C56
      55005D575500635C59007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400645E5C00605A
      57005E5A57005F5A57005F5A57005E595600615C5A00554F4C00605B58008A88
      88008A888800A1A0A0008A888700888686005D5855005E5957005F5A57005E5A
      5700605A5700645E5B007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C76740068625E00655F
      5C00645F5C00645F5C00645F5C005E575500A7A6A500C0C1C100999796006862
      6100554D4A00A9A7A80058524F00645D5B00645E5C00645F5C00645F5C00645F
      5C00655F5C0069615F007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C7674006A6361006762
      600067615F0067615F0067615F0060595800B2B0B000C7C7C600C8C9C900C6C6
      C6008B888800B3B2B2005B53520067615F0067615F0067615F0067615F006761
      5F00676160006A6361007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C7674006B6663006965
      62006A6461006A6461006A646100635E5A00C0BFBF00D2D2D200CECECE00CECF
      CF00D8D8D800DFE0E1005F5956006A6562006A6461006A6461006A6461006A64
      6100696462006C6663007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C7674006E6765006C66
      63006B6763006B6763006B66630065605E00CCCBCB00DBDCDC00D8D8D800DCDC
      DC00DFE0E0009F9D9B006B6663006C6764006B6764006B6764006B6764006B67
      64006B6663006D6763007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400716A6800706B
      6800706A68006F6A68006E6966006C666500E4E4E400EFEFEF00C9C7C7006761
      5E00686360006F6A67006F6A67006F6A67006F6A67006F6A67006F6A68006F6A
      6800716A6800716B67007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400726D6A00716C
      6A00726C6900716C69006F696800706A6800F2F3F300FFFFFF00686160006D67
      6600716B6A00716B6900716B6900716B6900716B6900716B6900716A6900706C
      6900716B6900726B69007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C767400746F6C00736E
      6C00726D6B00736D6B006F6A68007A747300F3F2F300908C8A00706B6900726C
      6A00716C6A00716C6A00716C6A00716C6A00716C6A00716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007C75740076716F007470
      6E00756F6C00746E6D00736D6B0076706F006F6966006B666300746E6C00746E
      6C00746E6C00746E6C00746E6C00746E6C00746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007B7573007A7573007974
      72007772700077716F0076716F0076706E0076706F0076706E0076706E007670
      6E0076706E0076706E0076706E0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007B7573007D7977007B77
      7600797472007874720077737100777270007772700077727000777270007772
      7000777270007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000766E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00000000000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00827D7B00847F
      7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F
      7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F7D00837F
      7D00847F7D00827E7B00766F6C0000000000766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00524D4A00534E4B00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D777500625C59005751
      4F0056504E0056504E0056504E0056504E0056504E0056504E0056504E005650
      4E0056504E0056504E0056504E0056504E0056504E0056504E0056504E005650
      4E0057514F00615A57007F7A7700766F6B00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004C47450054504E004C4846004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007E7876005C5653004F4B
      49004E4A48004E4A48004E4A48004E4A48004E4A48004E4A48004E4A48004E4A
      48004E4A48004E4A48004E4A48004E4A48004E4A48004E4A48004E4A48004E4A
      48004F4B48005A545200807B7900766F6B00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B4800504B49004F4B48004F4A48004F4B
      4800504B49004F4B48004F4B48004F4B48004F4B48004F4B48004E4947004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4C48004C4745004E4A47004F4B48004F4B48004F4B
      48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      48004F4B48004F4A4800797676005F5B5A004E4946004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C00766F6C007E7876005D575400514C
      4A00504C4900504C4900504C4900504C4900504C4900504C4900504C4900504C
      4900504C4900504C4900504C4900504C4900504C4900504C4900504C4900504C
      4900514C4A005B565300807B7900766F6B00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00524C4A004E4846004D484500504B49004F49
      47004D474500514C4A00534E4C00534E4C00534E4C00504A48005C5756004E49
      4700534E4C005B5452007D767500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00504B4A006E6A69005D595800504B4900534E4C00534E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00524C4A00534E
      4C004F494700686664007573720056515000524D4B00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C00766F6C007E7876005E585600544F
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C004D4846004E49
      47004F4A48004E494700534E4C00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005D575400807B7800766F6B00766F6C007C7674005E5856005853
      500056514F0056514F00696664009A9A9A009E9E9E009E9E9E009E9EA0009D9E
      9E009E9F9F009B9B9B004D4644004F4946006F6D6B009D9D9D009A9A9A009696
      960056504D005E5855007D767400766F6C00766F6C007C7674005E5856005853
      500056514F00554F4D0057525000544F4D00544F4D0066626000534E4C005752
      4F0057524F0057524F0057524F0057524F0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C00766F6C007C7674005E5856005853
      500056514F0057524F0057524F0057524F0057524F00504A47008D8C8B005A55
      53005A5653007A777600645F5E00554F4D0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C00766F6C007E787600625C59005853
      510057525000575250005752500057525000524D4A00726E6C00E2E3E300BDBC
      BB00B1AFAF00E1E1E100817E7C00524C4A005852500057525000575250005752
      500058535100615B5800807B7900766F6B00766F6C007C767400605B57005A55
      53005A545200534D4A00A8A9A900A1A2A200A1A1A1008D8C8B007C7977008886
      8500A0A1A000A2A3A3008B89880089878600A7A7A8009D9D9D00A3A2A2006762
      600057525000605B58007C767400766F6C00766F6C007C767400605B57005B55
      530056504E0078757400686462005D5855005953510055504E00676360005751
      4F005A5453005A5452005A5452005A5452005A5452005A5452005A5452005A54
      52005B555300605B57007C767400766F6C00766F6C007C767400605B57005A55
      53005A5452005A5452005A5452005A5452005A555300534D4B005B5653008D8B
      8A0083818000655F5D004D464300544E4C00534D4A00595452005A5452005A54
      52005B555300605B57007C767400766F6C00766F6C007E787600635D5B005B56
      53005A5553005A5553005A5553005B555300524D4A00A9A7A600DFDFDF00C6C5
      C500C1C0BF00E0E0E000BCBABA00554F4D005A5452005A5553005A5553005A55
      53005B555300625C5A00807B7800766F6B00766F6C007C767400635C59005D58
      550056504E0079767500A9A9A9009797970065605E0058524F0058514F005751
      4F00605B59008E8C8C00A6A7A700A6A7A700A5A5A600ABACAC00615C5A005852
      50005D585600635C59007C767400766F6C00766F6C007C767400635C59005D58
      55005B555300645F5D00716D6B00676260005D5856005C5654006B6766006A65
      6300595351005D5755005C5755005C5755005C5755005C5755005C5755005C56
      55005D575500635C59007C767400766F6C00766F6C007C767400635C59005D57
      55005C5655005C5755005C5755005C5755005D575500554F4D005E5957005952
      50008D8B89006D696800797675007F7D7C009391900066625F005C5755005C56
      55005D575500635C59007C767400766F6C00766F6C007E787600655F5C005D58
      55005D5855005D5855005D5855005A55520065605E00D0D0D000DCDCDC00D6D5
      D500D3D2D200DCDCDC00DADADA00726E6C00585250005D5855005D5855005D58
      55005D585600645E5B00807B7800766F6B00766F6C007C767400645E5C005F59
      570058524F00AFB0B000ACABAC0057514D005B5653005E5A57005F5A57005F5A
      57005C57540057514E00B1B2B200ABABAB00A7A7A7007F7B7A005C5654005F5A
      5700605A5700645E5B007C767400766F6C00766F6C007C767400645E5C00605A
      57005F5A57005B5753007E7B79006C6967006E6968005B5653005C565300716C
      6A006C6765005C5653005F5A57005F5A57005F5A57005F5A57005F5A57005E5A
      5700605A5700645E5B007C767400766F6C00766F6C007C767400645E5C00605A
      57005E5A57005F5A57005F5A57005F5A57005F5A570058535000635E5C005E58
      550059534F006963610067626000797472009693930058524E005F5A57005E5A
      5700605A5700645E5B007C767400766F6C00766F6C007E78760067605E00605A
      58005F5A57005F5A5700605A580057524F009B989700E2E2E300DBDBDB00DCDC
      DC00DCDCDC00DBDBDB00E2E2E200ACA9A900595250005F5A57005F5A57005F5A
      5700605A580066605D00807B7800766F6B00766F6C007C76740068625E00605A
      5700A19F9E00C3C4C4005E575500645E5C00645E5C00635C5A00615B5900625C
      5900645E5C00655F5D009E9C9C00C3C4C400B8B7B8005A535000645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007C76740068625E00655F
      5C00645F5C00645F5C00625C59006E6967008A87850079757300665F5D00645E
      5C00615B580077727000605A5800655F5D00645F5C00645F5C00645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007C76740068625E00655F
      5C00645F5C00645F5C00645F5C00645F5C00655F5D005D56530068636100645E
      5B00655F5D00635D5B00A4A3A20066605E00635D5B00655F5D00645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007E7876006B6461006660
      5D00655F5D00655F5D005E585500A8A6A500E3E3E300DBDBDB00DBDBDB00DBDB
      DB00DBDBDB00DCDCDC00D9D8D800D7D7D700B0AEAD00625C5A00655F5D00655F
      5D0066605D006A636000807B7800766F6B00766F6C007C7674006A636100645D
      5B00B4B3B300CDCECE005D57550067615F00635C5A009A979600BFBEBE00B0AE
      AF005D565300676260008D8A8800CBCCCC00C9CACA00605A580067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007C7674006A6361006762
      600067615F0067615F0067615F00635D5B00736E6C008A85850077727000645F
      5C0067606000635C5A0076707000635D5B0067615F0067615F0067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007C7674006A6361006762
      600067615F0067615F0067615F0067615F00676160005F5856006C6563006660
      5E0067615F005E5856006D686600635D5C0067615F0067615F0067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007E7875006D6764006863
      60006861600068616000807C7B00DEDEDE00DCDDDD00DBDBDB00DBDBDB00DBDB
      DB00DDDDDD00D0CFCF00A6A3A200A4A1A000DAD9D900928E8D00686160006861
      6000686260006C656300807B7800766F6B00766F6C007C7674006B6662006560
      5D00BDBCBB00D8D9D900605957006A656100655F5C0098959500BDBCBB00AEAC
      AA00605A57006A656200938F8E00D6D6D600D3D4D400635C5A006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007C7674006B6663006965
      62006A6461006A6461006A6461006A65610066615E00716C6A00797572008D89
      87006A64610069636000807C7A007C777500655F5D006A6561006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007C7674006B6663006965
      62006A6461006A6461006A6461006A6461006A656200615B58006F6967006963
      6000615B5800A4A2A000645E5B006A6561006A6461006A6461006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007E7875006E6865006A65
      62006A6462006A64620087838100CCCCCB00E1E1E100E0E0E000DBDBDB00DBDB
      DB00DDDDDD00CFCECE00CCCBCB00E0E0E000D3D3D200938F8D006A6462006A64
      62006A6562006D676400807A7800766F6B00766F6C007C7674006E6664006560
      5D00B6B4B300DFDFDF00635C5A006B6663006B6663006962600066615E006762
      5E006B6663006C676400B3B0B000DFDFDF00D0D1D0005E5855006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007C7674006E6765006C66
      63006B6763006B6763006B6764006B6764006C67640067625F009A9695008582
      8000797472006C67640067625F00807C7A007F7A770067625F006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007C7674006E6765006C66
      63006B6763006B6763006B6764006B6764006C676400625D5900706C6900615B
      58009A979500908D8C006C6764006B6764006B6764006B6764006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007E787500706966006C67
      64006C6764006C676400686260006D68660096929100BDBCBB00E1E1E100E0E0
      E000DFDFDF00E2E2E200C2C1C1009B989600706B680067615F006C6764006C67
      64006C6764006F696600807A7800766F6B00766F6C007C767400716A68006F69
      6700665F5C00EEEEEF00E5E5E600615A5900696360006F6A67006F6A67006F6A
      67006B666300625C5900F1F1F100EDEDEE007E7A78006B6663006F6A68006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400716A6800706B
      6800706A68006F6A68006F6A67006F6A67006F6A67006F6A67006B6663007773
      70009D9B980084807D006D6865006E69660068625F00898584006A6462006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400716A6800706B
      6800706A68006F6A68006F6A67006F6A67006F6B6800655F5C0088838100B9B7
      B7005F5956006F6A67006F6A67006F6A67006F6A67006F6A67006F6A68006F6A
      6800716A6800716B67007C767400766F6C00766F6C007D787500726C6A00706B
      6900706B68006F6A68006F6A67006C6764007F7B7800D9D8D900B5B3B2009793
      920097939200B6B5B400DBDADB00847F7D006B6663006F6A67006F6A68006F6A
      6800706B6800726B6900807A7800766F6B00766F6C007C767400726D6A00726D
      6B0067615F00A3A09F00F6F6F600D8D6D600807B7A0067615F0068626000665F
      5E0076716F00C7C5C400FAFBFB00B9B6B600665F5D00716B6A00716A6900706C
      6900716B6900726B69007C767400766F6C00766F6C007C767400726D6A00716C
      6A00726C6900716C6900716B6900716B6900716B6900716B6900716B6A006C66
      64007E797800A7A3A300817C7A00726D6B006F6968006C666400858180006E68
      6600716C6900726B69007C767400766F6C00766F6C007C767400726D6A00716C
      6A00726C6900716C6900716B6A00716B6900716B6A00645E5D00C0BDBD006E68
      650070696800716B6900716B6900716B6900716B6900716B6900716A6900706C
      6900716B6900726B69007C767400766F6C00766F6C007D787500746E6C00726D
      6B00726C6A00716C6900716B6A006D676500928E8D00DCDCDC00D1D0D000C3C2
      C200C3C1C100D3D2D200DEDEDE00969392006D676500716B6A00716B6A00716C
      6900726C6A00736D6A00807A7800766F6B00766F6C007C767400746F6C00736E
      6C00726D6B0065605D00FFFFFF00FBFBFB00F8F8F900D4D3D300B1ADAC00C8C7
      C600F6F5F500FCFDFD00D8D7D6006B666400706A6800716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B00736D6B00716C6A00716C6A00716C6A00716C6A00716C6A00726C
      6A006C676500807A79008782800087838100736D6B00706967009C9997006D67
      6500726E6B00736E6B007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B00736D6B00716C6900706B69006C6764005F5956007C7775006D68
      6600726C6A00716C6A00716C6A00716C6A00716C6A00716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007D78750076706E00746F
      6C00736D6C00726D6B00726D6B006F6A6800938F8E00A4A1A000DFDEDF00E4E5
      E500E4E4E400E1E1E100A3A09F0095929100706A6800726C6B00726D6A00736D
      6B00736E6C00746F6C00807A7800766E6B00766F6C007C75740076716F007470
      6E00756F6C00746E6C0096929000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005F595600726C6900746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6D00746E6B00746E6C00746E6C00746E6C00746E6C00746E
      6C00746E6C006E696600A9A6A4008E898800918C8A00716C6A006F6A6800746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6D00716C6900807C7A00A7A4A4009B9896006F686600746E
      6C00746E6C00746E6C00746E6C00746E6C00746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007D787500787270007670
      6E00746F6D00746E6D00736E6C00746E6C006F6A67006B666300ACAAA800BFBD
      BC00BFBEBD00AFACAB006B6562006F696700746E6C00736E6C00746F6C00746E
      6D00756F6D0076706E00807A7800766E6B00766F6C007B7573007A7573007974
      72007772700077716F0076716F00736D6B006B6562006B656300746F6D006D67
      65006A636100716C690076706F0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007A7573007974
      72007772700077716F0076716F0076706E0076706E0076706E0076706E007670
      6E0076706E0076706E00716C690085807F00A39E9D00726E6C0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007A7573007974
      72007772700077716F00706A6900C3C1C000FFFFFF00FFFFFF00726C69007670
      6E0076706E0076706E0076706E0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007D7775007C7775007974
      7200787371007772700076716F0076716F0076716F0076716F0075706E007974
      72007975720075706E0076716F0076716F0076716F0076716F0077716F007772
      700078737100797472007F7A7800766E6B00766F6C007B7573007D7977007B77
      760079747200787472007773710077727000787371007772700076716F007772
      7000787371007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B7573007D7977007B77
      7600797472007874720077737100777270007772700077727000777270007772
      700077727000777270007872700075706D00716B690077737100787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B7573007D7977007B77
      76007974720078747200736E6C00918C8C00A5A3A100D2D1D00076716F007772
      7000777270007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007D7774007F7B79007C77
      75007A7573007974720078737100787371007873710078737100787371007772
      7000777270007873710078737100787371007873710078737100787472007974
      72007A7674007C7775007F7A7800766E6B00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007D7876007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B77750073706D007B7675007B7775007C77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007D77740084807E00807C
      7A007E7A78007C7877007C7876007C7876007C7876007C7876007C7876007C78
      76007C7876007C7876007C7876007C7876007C7876007C7877007D7977007D79
      78007F7B7900807C7A007F7A7700766E6B00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00837F7E0084817E00837F7D0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007B7472008B8887008884
      8300868381008582810085828100868281008682810086828100878382008783
      82008784830087848300878483008884840088858400898584008A8785008A87
      85008A878600898785007D777500766F6C0000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C00000000000000000000000000797370007A74
      71007A7471007A7471007A7471007A7471007A7471007A7471007A7471007A74
      71007A7471007A7471007A7471007A7471007A7471007A7471007A7471007A74
      71007A7471007A73700000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B0000000000000000000000000000000000756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E6B00756E
      6B00756E6B00756E6B00000000000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C000000000000000000766F6C00807B7800817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C7A00817C
      7A00817C7A00807B7800766F6C0000000000766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D7774005D565400554F
      4D00534E4B00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E
      4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00544E4C00534E
      4B00554F4D005D5654007D777400766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D767500585350004F4A
      48004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004E4947004E4947004E4947004E4947004E4947004E4947004E4947004E49
      47004F4A480058534F007D767500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B4800504B
      4900504B4900504B49004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B48004F4B4800504C4900484340004843
      40004843400048434000504C49004F4B48004F4B48004F4B48004F4B48004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D76750058535100514C
      4A004F4B48004F4B48004F4B48004F4B4800504B49004F4B48004F4A48004F4B
      4800504B49004F4B48004F4B48004F4B48004F4B48004F4B48004E4947004F4B
      4800514C4A00585350007D777500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4B004E49
      46004D4846004D484600514C4A00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00534E4C00524E
      4B00524D4B004F494700534E4C00534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00534E4C00534E4C004F4A4800807E7E007D7B
      7A007D7B7A007F7E7E004F494800534E4C00534E4C00534E4C00534E4C00534E
      4C00534E4C005B5452007D767500766F6C00766F6C007D7675005B555200544E
      4C00534E4C00534E4C00534E4C00524C4A004E4846004D484500504B49004F49
      47004D474500514C4A00534E4C00534E4C00534E4C00504A48005B5755004F49
      4800534E4C005B5452007D767500766F6C00766F6C007C7674005E5856005853
      500056514F0057524F0057524F0057524F0057524F0057524F005D5856009D9D
      9D009A9B9B009A9A9A0076757300524D4A0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C00766F6C007C7674005E5856005853
      500056514F0057524F0057524F0057524F0056514E0057524F0056524F005049
      47009B9C9C009393930056514E0057524F0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C00766F6C007C7674005E5856005853
      500056514F0057524F0057524F0057524F0057524F00514C49009D9D9D009999
      9900989898009E9E9E00514B480057524F0057524F0057524F0057524F005651
      4F00585350005E5856007D767400766F6C00766F6C007C7674005E5856005853
      500056514F0057524F00696664009A9A9A009E9E9E009E9E9E009E9EA0009D9E
      9E009E9F9F009B9B9B004D4644004F4946006F6D6B009D9D9D009A9A9A009696
      960056504D005E5855007D767400766F6C00766F6C007C767400605B57005A55
      53005A5452005A5452005A5452005A5452005A5452005A545200858382009FA0
      A0009A9A9A009A9A9A008C8A8A0056504E005A5452005A5452005A5452005A54
      52005B555300605B57007C767400766F6C00766F6C007C767400605B57005A55
      53005A5452005A5452005A5452005A5452005C56540057514F0056504F006B67
      6600ADAFAF00726E6D005A5553005A5452005A5452005A5452005A5452005A54
      52005B555300605B57007C767400766F6C00766F6C007C767400605B57005A55
      53005A5452005A5452005A5452005A5452005A545300544E4B00A3A4A4009F9F
      9F009F9F9F00A4A5A500534D4B005A5553005A5452005A5452005A5452005A54
      52005B555300605B57007C767400766F6C00766F6C007C767400605B57005A55
      53005A545200534D4A00A8A9A900A1A2A200A1A1A1008D8C8B007C7977008886
      8500A0A1A000A2A3A3008B89880089878600A7A7A8009D9D9D00A3A2A2006762
      600057525000605B58007C767400766F6C00766F6C007C767400635C59005D57
      55005C5655005C5755005C5755005C5755005C5755005A545200A4A4A400A1A1
      A100A1A1A100A1A1A1009D9D9D005B5654005C5654005C5755005C5755005C56
      55005D575500635C59007C767400766F6C00766F6C007C767400635C59005D57
      55005C5655005C5755005C57550056504E0083807F0074706F00585350008F8D
      8C00A6A6A7005E5957005C5755005C5755005C5755005C5755005C5755005C56
      55005D575500635C59007C767400766F6C00766F6C007C767400635C59005D57
      55005C5655005C5755005D5755005D5755005D575500574F4D00A9A9AA00A5A5
      A500A5A4A400AAABAB00554F4D005D5755005D5755005D5755005C5755005C56
      55005D575500635C59007C767400766F6C00766F6C007C767400635C59005D58
      550056504E0079767500A9A9A9009797970065605E0058524F0058524F005751
      4F00605B59008E8C8C00A6A7A700A6A7A700A5A5A600ABACAC00615C5A005852
      50005D585600635C59007C767400766F6C00766F6C007C767400645E5C00605A
      57005E5A57005F5A57005F5A57005F5A57005F5A5700544D4B00ADADAD00A8A8
      A800A8A8A800A8A8A800ACACAC00676260005D5754005F5A57005F5A57005E5A
      5700605A5700645E5B007C767400766F6C00766F6C007C767400645E5C00605A
      57005E5A57005F5A57005F5A570058524F0089878600B9B9B9005A545200AFB0
      B000918F8E00595350005D5855005E5A57005F5A57005F5A57005F5A57005E5A
      5700605A5700645E5B007C767400766F6C00766F6C007C767400645E5C00605A
      57005F5A57005B55520057514E0057514E0057514E004F494600B6B7B700B0B1
      B100B0B1B100B6B7B7004F48450057514E0057514E0057514E005B5552005F5A
      5700605A5700645E5B007C767400766F6C00766F6C007C767400645E5C005F59
      570058524F00AFB0B000ACABAC0057514D005B5653005F5A570058524E005F5A
      57005C57540057514E00B1B2B200ABABAB00A7A7A7007F7B7A005C5654005F5A
      5700605A5700645E5B007C767400766F6C00766F6C007C76740068625E00655F
      5C00645F5C00645F5C00645F5C00645F5C005E58560095929100BCBCBC00BABA
      BA00BABABA00BABABA00C2C2C200979493005C565400655F5D00645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007C76740068625E00655F
      5C00645F5C00645F5C00655F5D005C56540093908F00C2C2C200BFBFBF00BBBA
      BA00A2A19F00AEAEAD00A09E9D00635C5A00645E5C00645F5C00645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007C76740068625E00655F
      5C005C5553009B989800C1C2C200C1C2C200C1C2C200C5C5C7005A5351005F58
      5600605856005A535100C6C7C700C1C2C200C1C2C200C1C2C2009B9898005C55
      5300655F5C0069615F007C767400766F6C00766F6C007C76740068625E00605A
      5700A19F9E00C3C4C4005E575500655E5D00635D5B00574F4D00A3A2A100564F
      4C00625C5A00655F5D009E9C9C00C3C4C400B8B7B8005A535000645F5C00645F
      5C00655F5C0069615F007C767400766F6C00766F6C007C7674006A6361006762
      600067615F0067615F0067615F0067615F00625B5A00B8B7B700B7B7B600C5C5
      C600C3C3C300C3C3C300CCCECE00999696005E58560067615F0067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007C7674006A6361006762
      600067615F0067615F0067615F005E58560098969500CACBCB00C2C2C200C2C2
      C200C7C7C700CACACA005D57550066605E0067615F0067615F0067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007C7674006A6361006762
      60005E5654009E9B9B00C3C3C300C3C3C300C3C3C300C7C8C800615B59006761
      5F0067615F00615B5900C8C8C800C3C3C300C3C3C300C3C3C3009E9B9B005E56
      5400676260006A6361007C767400766F6C00766F6C007C7674006A636100645D
      5B00B4B3B300CDCECE005D575500655E5D00756F6E00A4A1A100BBBABA00A6A4
      A3007A757300645E5C008D8A8800CBCCCC00C9CACA00605A580067615F006761
      5F00676160006A6361007C767400766F6C00766F6C007C7674006B6663006965
      62006A6461006A6461006A64610067625E0076706E00E2E4E400B0AEAD00D6D7
      D700CFCFCF00D5D5D600CAC9C9009C999800615B58006A6562006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007C7674006B6663006965
      62006A6461006A6461006A656200615B5800A09D9C00D4D4D400CCCCCC00CBCB
      CB00D0D0D000CACACA0067615F006A6561006A6461006A6461006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007C7674006B6663006A65
      62005F595600A4A1A100CDCDCD00CDCDCD00CDCDCD00D2D2D200635D5B006964
      610069646100645D5A00D2D2D200CDCDCD00CDCDCD00CDCDCD00A4A1A1005F59
      56006A6462006C6663007C767400766F6C00766F6C007C7674006B6662006560
      5D00BDBCBB00D8D9D9006059570067625E007A757300B6B6B500C7C7C600B9B8
      B700827D7C0067615D00938F8E00D6D6D600D3D4D400635C5A006A6461006A64
      6100696462006C6663007C767400766F6C00766F6C007C7674006E6765006C66
      63006B6763006B6763006C676400645E5C0095929100E7E8E900C2C2C2009490
      8E00D7D6D700979392009E9C9B00A7A4A300615C59006C6764006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007C7674006E6765006C66
      63006B6763006B6763006C676400625D5900A4A2A100DCDDDE00D3D3D300D5D5
      D500D8DAD9007D7876006C6764006B6764006B6764006B6764006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007C7674006E6765006C66
      6400605A5800ADABAA00DBDCDC00DCDCDC00DCDCDC00E1E1E1005F595600645F
      5D00645F5D005F5A5600E1E1E200DCDCDC00DCDCDC00DBDCDC00ADABAA00605A
      58006B6763006D6763007C767400766F6C00766F6C007C7674006E6664006560
      5D00B6B4B300DFDFDF00635C5A006B666300696461005C565300B8B6B5005B54
      5000696461006C676400B3B0B000DFDFDF00D0D1D0005E5855006B6764006B67
      64006B6663006D6763007C767400766F6C00766F6C007C767400716A6800706B
      6800706A68006F6A68006F6A67006F6A67006E6966006D686500D5D4D4008F8C
      8A00E8E8E8008782800076726F007B7674006C6764006F6A67006F6A68006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400716A6800706B
      6800706A68006F6A68006F6A6800645E5B00B0ADAC00EFF0F000F0F1F100A6A4
      A2005F5956006F6B68006F6A67006F6A67006F6A67006F6A67006F6A68006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400716A6800706B
      6800706B68006A65630067625F0067625F0068625F005D575400EFF0F000E8E8
      E800E8E8E800F0F1F1005C55520068625F0067625F0067625F006B6563006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400716A68006F69
      6700665F5C00EEEEEF00E5E5E600615A5900696360006F6A6700665F5D006F6A
      68006B666300625C5900F1F1F100EDEDEE007E7A78006B6663006F6A68006F6A
      6800716A6800716B67007C767400766F6C00766F6C007C767400726D6A00716C
      6A00726C6900716C6900716B6900716B6900716B6900716B6900DBDADA00928E
      8D00F8F9FA00827D7C006A6462006E686600716B6A00716B6900716A6900706C
      6900716B6900726B69007C767400766F6C00766F6C007C767400726D6A00716C
      6A00726C6900716C6900716B6A00645E5D00B4B2B200F5F5F600BFBDBC00655F
      5E00706A6900716B6900716B6900716B6900716B6900716B6900716A6900706C
      6900716B6900726B69007C767400766F6C00766F6C007C767400726D6A00716C
      6A00726C6900716C6900716B6A00716B6A00716B6A0067605F00F2F3F300EBEB
      EB00EAEAEA00F3F3F400655F5E00716B6A00716B6A00716B6A00716B6A00706C
      6900716B6900726B69007C767400766F6C00766F6C007C767400726D6A00726D
      6B0067615F00A3A09F00F6F6F600D8D6D600807B7A0067615F0068626000665F
      5E0076716F00C7C5C400FAFBFB00B9B6B600665F5D00716B6A00716A6900706C
      6900716B6900726B69007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B00736D6B00716C6A00716C6A00716C6A00716C6A00E1E0E0009C97
      9600A7A2A10076706E00726C6A00716C6A00716C6A00716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B00736D6B00726C6A00655F5D00B9B6B500FFFFFF006B6563006F69
      6800716C6A00716C6A00716C6A00716C6A00716C6A00716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B00736D6B00716C6A00716C6A00726C6A0067615E00F8F9F900F0F0
      F000F0F0F000F9FAFA0065605E00726C6A00716C6A00716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007C767400746F6C00736E
      6C00726D6B0065605D00FFFFFF00FBFBFB00F8F8F900D4D3D300B1ADAC00C8C7
      C600F6F5F500FCFDFD00D8D7D6006B666400706A6800716C6A00716D6A00726D
      6B00726E6B00736E6B007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6D00746E6B00746E6C00746E6C00746E6C00EDEDEC00A9A5
      A400625C5A00726C6A00746E6C00746E6C00746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6D00746E6C0067605E00C2BFBE00FEFEFE00706A6800746E
      6C00746E6C00746E6C00746E6C00746E6C00746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6D00746E6B00746E6C00746E6C0069615F00FEFFFF00F6F6
      F600F6F6F600FFFFFF0067615F00746E6C00746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007C75740076716F007470
      6E00756F6C00746E6C0096929000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF005F595600726C6900746E6C00746E6B00736F6D00746E
      6C00756F6E00756F6C007C767400766F6C00766F6C007B7573007A7573007974
      72007772700077716F0076716F0076706E0076706E0076706E00726C6A00746E
      6C0076706F0076706E0076706E0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007A7573007974
      72007772700077716F0076716F00756F6D0079737200726B690076706E007670
      6E0076706E0076706E0076706E0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007A7573007974
      72007772700077716F0076716F0076706E0076706F006F6A6700C9C6C500C4C1
      C100C4C1C100C9C6C6006F68660076706F0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007A7573007974
      72007772700077716F0076716F00736D6B006B6562006B656300746F6D006D67
      65006A636100716C690076706F0076706E0076706E0076706E0076716F007771
      6F0078737100787371007C777300766F6C00766F6C007B7573007D7977007B77
      7600797472007874720077737100777270007772700077727000777270007772
      7000777270007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B7573007D7977007B77
      76007974720078747200777371007772700077716F0077727000777270007772
      7000777270007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B7573007D7977007B77
      7600797472007874720077737100777270007772700078747200696462006964
      6200696462006964620078747200777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B7573007D7977007B77
      760079747200787472007773710077727000787371007772700076716F007772
      7000787371007772700077727000777270007772700077727000787371007874
      72007A7574007A7674007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007C7876007C78
      76007C7876007C7876007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007B767300827E7D007F7B
      7A007D7877007C7876007B7775007B7775007B7775007B7775007B7775007B77
      76007B7775007B7775007B7775007C7775007C7776007B7776007C7876007C79
      77007F7A79007F7B7A007B767300766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C00766F6C007A757100878483008682
      810084817F0084807E00837F7E00847F7E0083817E0083807E0085807F008581
      7F00858180008581800085818000868281008783810086838100888483008885
      830089858300868382007A757100766F6C0000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C000000000000000000766F6C0078726F007973
      6F0079736F0079736F0079736F0079736F0079736F0079736F0079726F007972
      6F0079726F0079726F0079726F0079726F0079726F0079726F0079726F007872
      6F0079726F0078726F00766F6C00000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C0000000000000000000000000000000000766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F6C00766F
      6C00766F6C00766F6C000000000000000000424D3E000000000000003E000000
      2800000060000000480000000100010000000000600300000000000000000000
      000000000000000000000000FFFFFF00C0000300000000000000000080000100
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000010000000000
      00000000C00003000000000000000000C00003C00003C00003C0000380000180
      0001800001800001000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000018000018000
      01C00003C00003C00003C00003C00003C00003C00003C00003C0000380000180
      0001800001800001000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000018000018000
      01800001C00003C00003C00003C0000300000000000000000000000000000000
      000000000000}
  end
end
