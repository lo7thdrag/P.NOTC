inherited fmSensor: TfmSensor
  Width = 323
  Height = 442
  ExplicitWidth = 323
  ExplicitHeight = 442
  object PanelSpace: TPanel
    Left = 0
    Top = 115
    Width = 323
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    Color = 16775920
    ParentBackground = False
    TabOrder = 1
  end
  object PanelSensorChoices: TPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 115
    Align = alTop
    Color = 16775920
    ParentBackground = False
    TabOrder = 0
    object lstSensor: TListView
      Left = 1
      Top = 1
      Width = 321
      Height = 113
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clWhite
      Columns = <
        item
          AutoSize = True
          Caption = 'Name'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Status'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lstSensorSelectItem
    end
  end
  object PanelALL: TPanel
    Left = 0
    Top = 120
    Width = 323
    Height = 322
    Align = alClient
    BevelOuter = bvNone
    Color = 16775920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object PanelSensorControl: TPanel
      Left = 0
      Top = 0
      Width = 323
      Height = 322
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 3
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object grbElectroOpticalSensor: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 4
        object btnElectroOpticalSensorExecuteSingleScan: TButton
          Left = 145
          Top = 367
          Width = 153
          Height = 25
          Caption = 'Execute Single Scan'
          TabOrder = 0
        end
        object ScrollBox3: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 1
          object Label1: TLabel
            Left = 5
            Top = 3
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Bevel1: TBevel
            Left = 55
            Top = 10
            Width = 255
            Height = 3
          end
          object Label2: TLabel
            Left = 35
            Top = 30
            Width = 55
            Height = 16
            Caption = 'Periscope'
          end
          object Label3: TLabel
            Left = 5
            Top = 105
            Width = 40
            Height = 16
            Caption = 'Display'
          end
          object Bevel2: TBevel
            Left = 55
            Top = 113
            Width = 255
            Height = 3
          end
          object Label4: TLabel
            Left = 175
            Top = 130
            Width = 69
            Height = 16
            Caption = 'Blind Zones '
          end
          object Label5: TLabel
            Left = 75
            Top = 130
            Width = 36
            Height = 16
            Caption = 'Range'
          end
          object sbElectroOpticalSensorDisplayRangeShow: TSpeedButton
            Left = 53
            Top = 150
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
          object sbElectroOpticalSensorDisplayRangeHide: TSpeedButton
            Left = 53
            Top = 173
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
          object sbElectroOpticalSensorBlindZoneShow: TSpeedButton
            Left = 170
            Top = 150
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
          object sbElectroOpticalSensorBlindZoneHide: TSpeedButton
            Left = 170
            Top = 173
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
          object sbElectroOpticalSensorControlModeOn: TSpeedButton
            Left = 25
            Top = 50
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Up'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
          object sbElectroOpticalSensorControlModeOff: TSpeedButton
            Left = 25
            Top = 73
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Down'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbElectroOpticalSensorOnClick
          end
        end
      end
      object grbESMSensorControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 2
        object ScrollBox4: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Label6: TLabel
            Left = 5
            Top = 3
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Bevel3: TBevel
            Left = 55
            Top = 10
            Width = 255
            Height = 3
          end
          object Label7: TLabel
            Left = 35
            Top = 30
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label8: TLabel
            Left = 5
            Top = 105
            Width = 40
            Height = 16
            Caption = 'Display'
          end
          object Bevel4: TBevel
            Left = 55
            Top = 112
            Width = 255
            Height = 3
          end
          object Label9: TLabel
            Left = 25
            Top = 132
            Width = 69
            Height = 16
            Caption = 'Blind Zones '
          end
          object sbESMSensorControlModeOn: TSpeedButton
            Tag = 1
            Left = 14
            Top = 50
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'On'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbESMSensorControlModeClick
          end
          object sbESMSensorControlModeOff: TSpeedButton
            Tag = 2
            Left = 14
            Top = 73
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Off'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbESMSensorControlModeClick
          end
          object sbESMSensorDisplayBlindZoneShow: TSpeedButton
            Tag = 3
            Left = 20
            Top = 152
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbESMSensorControlModeClick
          end
          object sbESMSensorDisplayBlindZoneHide: TSpeedButton
            Tag = 4
            Left = 20
            Top = 175
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbESMSensorControlModeClick
          end
        end
      end
      object grbIFFTransponderControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 8
        object ScrollBox6: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel8: TBevel
            Left = 55
            Top = 10
            Width = 255
            Height = 3
          end
          object Bevel9: TBevel
            Left = 135
            Top = 113
            Width = 175
            Height = 3
          end
          object Label14: TLabel
            Left = 5
            Top = 3
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label15: TLabel
            Left = 35
            Top = 30
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label16: TLabel
            Left = 5
            Top = 105
            Width = 121
            Height = 16
            Caption = 'Mode/Code Selection'
          end
          object sbIFFTransponderControlModeOff: TSpeedButton
            Left = 14
            Top = 73
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Off'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object sbIFFTransponderControlModeOn: TSpeedButton
            Left = 14
            Top = 50
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'On'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object cbIFFTransponderControlMode1: TCheckBox
            Left = 15
            Top = 132
            Width = 80
            Height = 17
            Caption = 'Mode 1   :'
            TabOrder = 0
            OnClick = OnIFFCheckedClick
          end
          object cbIFFTransponderControlMode2: TCheckBox
            Left = 15
            Top = 162
            Width = 80
            Height = 17
            Caption = 'Mode 2   :'
            TabOrder = 1
            OnClick = OnIFFCheckedClick
          end
          object cbIFFTransponderControlMode3: TCheckBox
            Left = 15
            Top = 192
            Width = 80
            Height = 17
            Caption = 'Mode 3   :'
            TabOrder = 2
            OnClick = OnIFFCheckedClick
          end
          object cbIFFTransponderControlMode3C: TCheckBox
            Left = 15
            Top = 222
            Width = 80
            Height = 17
            Caption = 'Mode 3C :'
            TabOrder = 3
            OnClick = OnIFFCheckedClick
          end
          object cbIFFTransponderControlMode4: TCheckBox
            Left = 15
            Top = 252
            Width = 80
            Height = 17
            Caption = 'Mode 4   :'
            TabOrder = 4
            OnClick = OnIFFCheckedClick
          end
          object edtIFFTransponderControlMode1: TEdit
            Tag = 1
            Left = 105
            Top = 131
            Width = 27
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 5
            Text = '00'
            OnKeyPress = edtTransponderOnKeyPressed
          end
          object edtIFFTransponderControlMode2: TEdit
            Tag = 2
            Left = 105
            Top = 161
            Width = 85
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 6
            Text = '0000'
            OnKeyPress = edtTransponderOnKeyPressed
          end
          object edtIFFTransponderControlMode3: TEdit
            Tag = 3
            Left = 105
            Top = 191
            Width = 85
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 7
            Text = '0000'
            OnKeyPress = edtTransponderOnKeyPressed
          end
        end
      end
      object grbSearchRadarControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 0
        object ScrollBox1: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Label189: TLabel
            Left = 5
            Top = 0
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Bevel28: TBevel
            Left = 55
            Top = 7
            Width = 255
            Height = 3
          end
          object Label193: TLabel
            Left = 44
            Top = 15
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label194: TLabel
            Left = 243
            Top = 15
            Width = 33
            Height = 16
            Caption = 'ECCM'
          end
          object Label261: TLabel
            Left = 5
            Top = 192
            Width = 40
            Height = 16
            Caption = 'Display'
          end
          object Bevel31: TBevel
            Left = 55
            Top = 199
            Width = 255
            Height = 3
          end
          object Label262: TLabel
            Left = 42
            Top = 210
            Width = 36
            Height = 16
            Caption = 'Range'
          end
          object Label263: TLabel
            Left = 126
            Top = 210
            Width = 65
            Height = 16
            Caption = 'Blind Zones'
          end
          object Label264: TLabel
            Left = 219
            Top = 210
            Width = 69
            Height = 16
            Caption = 'Scan Sector'
            Visible = False
          end
          object btnControlComboInterval: TSpeedButton
            Left = 278
            Top = 96
            Width = 23
            Height = 22
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000017000000140000000100
              180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            ParentFont = False
          end
          object sbControlEccmOn: TSpeedButton
            Tag = 12
            Left = 220
            Top = 31
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'On'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbControlEccmOff: TSpeedButton
            Tag = 13
            Left = 220
            Top = 51
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Off'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbRangeShow: TSpeedButton
            Tag = 1
            Left = 22
            Top = 227
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 4
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbRangeHide: TSpeedButton
            Tag = 2
            Left = 22
            Top = 247
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 4
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbBlindShow: TSpeedButton
            Tag = 3
            Left = 120
            Top = 227
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 5
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbBlindHide: TSpeedButton
            Tag = 4
            Left = 120
            Top = 247
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 5
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSearchRadarClick
          end
          object sbScanShow: TSpeedButton
            Tag = 5
            Left = 215
            Top = 227
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 6
            Caption = 'Show'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
            OnClick = sbSearchRadarClick
          end
          object sbScanHide: TSpeedButton
            Tag = 6
            Left = 215
            Top = 247
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 6
            Down = True
            Caption = 'Hide'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
            OnClick = sbSearchRadarClick
          end
          object pnlScanSector: TPanel
            Left = 3
            Top = 118
            Width = 350
            Height = 75
            BevelOuter = bvNone
            TabOrder = 6
            Visible = False
            object Bevel30: TBevel
              Left = 83
              Top = 6
              Width = 225
              Height = 3
            end
            object Label200: TLabel
              Left = 3
              Top = -1
              Width = 69
              Height = 16
              Caption = 'Scan Sector'
            end
            object Label201: TLabel
              Left = 44
              Top = 15
              Width = 31
              Height = 16
              Caption = 'Mode'
            end
            object sbScanModePartial: TSpeedButton
              Tag = 8
              Left = 20
              Top = 30
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Partial'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = sbSearchRadarClick
            end
            object sbScanModeFull: TSpeedButton
              Tag = 7
              Left = 20
              Top = 50
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Full'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = sbSearchRadarClick
            end
            object Label202: TLabel
              Left = 132
              Top = 28
              Width = 37
              Height = 16
              Caption = 'Start :'
            end
            object Label203: TLabel
              Left = 132
              Top = 51
              Width = 38
              Height = 16
              Caption = 'End   :'
            end
            object Label205: TLabel
              Left = 211
              Top = 28
              Width = 58
              Height = 16
              Caption = 'degrees T'
            end
            object Label204: TLabel
              Left = 211
              Top = 51
              Width = 58
              Height = 16
              Caption = 'degrees T'
            end
            object btnComboScanStrart: TSpeedButton
              Left = 275
              Top = 25
              Width = 23
              Height = 22
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
              ParentFont = False
            end
            object editScanStart: TEdit
              Left = 175
              Top = 27
              Width = 30
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '000'
            end
            object editScanEnd: TEdit
              Left = 175
              Top = 50
              Width = 30
              Height = 21
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Text = '000'
            end
          end
          object cbActivationInterval: TCheckBox
            Left = 20
            Top = 98
            Width = 150
            Height = 17
            Caption = 'Activation Interval'
            Enabled = False
            TabOrder = 0
          end
          object editComboInterval: TEdit
            Left = 145
            Top = 96
            Width = 120
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'None'
          end
          object btShowRangeAltitude: TButton
            Left = 22
            Top = 270
            Width = 145
            Height = 25
            Caption = 'Show Range Altitude..'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btExecuteSingleScan: TButton
            Left = 166
            Top = 270
            Width = 125
            Height = 25
            Caption = 'Execute Single Scan'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object pnlControlRadar: TPanel
            Left = 14
            Top = 29
            Width = 93
            Height = 68
            BevelOuter = bvNone
            TabOrder = 4
            object btnControlModeOff2: TSpeedButton
              Tag = 11
              Left = 5
              Top = 22
              Width = 81
              Height = 23
              AllowAllUp = True
              GroupIndex = 7
              Down = True
              Caption = 'Off'
              OnClick = sbSearchRadarClick
            end
            object btnControlModeOn: TSpeedButton
              Tag = 9
              Left = 5
              Top = 2
              Width = 81
              Height = 22
              AllowAllUp = True
              GroupIndex = 7
              Caption = 'On'
              OnClick = sbSearchRadarClick
            end
          end
          object pnlControlModeRadar2: TPanel
            Left = 14
            Top = 32
            Width = 90
            Height = 65
            BevelOuter = bvNone
            TabOrder = 5
            object sbControlModeSearch: TSpeedButton
              Tag = 9
              Left = 8
              Top = -1
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 7
              Caption = 'Search / Track'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = sbSearchRadarClick
            end
            object sbControlModeTrack: TSpeedButton
              Tag = 10
              Left = 8
              Top = 19
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 7
              Caption = 'Track'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = sbSearchRadarClick
            end
            object sbControlModeOff: TSpeedButton
              Tag = 11
              Left = 8
              Top = 39
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 7
              Down = True
              Caption = 'Off'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              OnClick = sbSearchRadarClick
            end
          end
        end
      end
      object grbSonobuoyControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 5
        object ScrollBox7: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel10: TBevel
            Left = 55
            Top = 10
            Width = 255
            Height = 3
          end
          object Bevel11: TBevel
            Left = 55
            Top = 62
            Width = 255
            Height = 3
          end
          object Bevel12: TBevel
            Left = 55
            Top = 178
            Width = 255
            Height = 3
          end
          object btnSonobuoyControlCombo: TSpeedButton
            Left = 280
            Top = 82
            Width = 26
            Height = 26
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000017000000140000000100
              180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            OnClick = btnSonobuoyControlComboClick
          end
          object Label17: TLabel
            Left = 5
            Top = 3
            Width = 36
            Height = 16
            Caption = 'Status'
          end
          object Label18: TLabel
            Left = 5
            Top = 55
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label19: TLabel
            Left = 35
            Top = 85
            Width = 40
            Height = 16
            Caption = 'Mode :'
          end
          object Label20: TLabel
            Left = 107
            Top = 30
            Width = 56
            Height = 16
            Caption = 'Quantity :'
          end
          object Label21: TLabel
            Left = 35
            Top = 115
            Width = 42
            Height = 16
            Caption = 'Depth :'
          end
          object Label22: TLabel
            Left = 165
            Top = 115
            Width = 40
            Height = 16
            Caption = 'metres'
          end
          object Label23: TLabel
            Left = 5
            Top = 170
            Width = 43
            Height = 16
            Caption = 'Monitor'
          end
          object Label24: TLabel
            Left = 25
            Top = 200
            Width = 160
            Height = 16
            Caption = 'Platform Monitor Capacity  :'
          end
          object Label25: TLabel
            Left = 25
            Top = 230
            Width = 161
            Height = 16
            Caption = 'Currently Monitoring          :'
          end
          object Label26: TLabel
            Left = 230
            Top = 200
            Width = 63
            Height = 16
            Caption = 'sonobuy(s)'
          end
          object Label27: TLabel
            Left = 230
            Top = 230
            Width = 63
            Height = 16
            Caption = 'sonobuy(s)'
          end
          object lblSonobuoyMonitorCurrently: TLabel
            Left = 205
            Top = 230
            Width = 7
            Height = 16
            Caption = '0'
          end
          object lblSonobuoyMonitorPlatform: TLabel
            Left = 205
            Top = 200
            Width = 14
            Height = 16
            Caption = '50'
          end
          object lblStatusSonobuoy: TLabel
            Left = 35
            Top = 30
            Width = 51
            Height = 16
            Caption = 'Available'
          end
          object lbStatusQuantity: TLabel
            Left = 170
            Top = 30
            Width = 21
            Height = 16
            Caption = '100'
          end
          object btnSonobuoyControlDeploy: TButton
            Left = 230
            Top = 140
            Width = 75
            Height = 25
            Caption = 'Deploy'
            TabOrder = 0
            OnClick = btnSonobuoyControlDeployClick
          end
          object editControlDepth: TEdit
            Left = 85
            Top = 112
            Width = 73
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '1'
          end
          object editControlMode: TEdit
            Left = 85
            Top = 83
            Width = 194
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Text = 'Passive'
          end
        end
      end
      object grbVisualDetectorSensor: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 6
        object Label257: TLabel
          Left = 5
          Top = 3
          Width = 40
          Height = 16
          Caption = 'Display'
        end
        object Bevel51: TBevel
          Left = 55
          Top = 10
          Width = 255
          Height = 3
        end
        object Label258: TLabel
          Left = 195
          Top = 30
          Width = 69
          Height = 16
          Caption = 'Blind Zones '
        end
        object Label259: TLabel
          Left = 75
          Top = 30
          Width = 36
          Height = 16
          Caption = 'Range'
        end
        object sbVisualDetectorDisplayRangeShow: TSpeedButton
          Tag = 1
          Left = 56
          Top = 50
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'Show'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbVisualSensorClick
        end
        object sbVisualDetectorDisplayRangeHide: TSpeedButton
          Tag = 2
          Left = 56
          Top = 75
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Hide'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbVisualSensorClick
        end
        object sbVisualDetectorDisplayBlindZonesShow: TSpeedButton
          Tag = 3
          Left = 190
          Top = 50
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Show'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbVisualSensorClick
        end
        object sbVisualDetectorDisplayBlindZonesHide: TSpeedButton
          Tag = 4
          Left = 190
          Top = 75
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Hide'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbVisualSensorClick
        end
      end
      object grbAnomalyDetectorSensor: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 3
        object Label225: TLabel
          Left = 5
          Top = 3
          Width = 41
          Height = 16
          Caption = 'Control'
        end
        object Bevel47: TBevel
          Left = 55
          Top = 10
          Width = 255
          Height = 3
        end
        object Label230: TLabel
          Left = 35
          Top = 30
          Width = 31
          Height = 16
          Caption = 'Mode'
        end
        object sbAnomalyDetectorControlModeOn: TSpeedButton
          Left = 15
          Top = 50
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'On'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbAnomalyDetectorOnClick
        end
        object sbAnomalyDetectorControlModeOff: TSpeedButton
          Left = 15
          Top = 73
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Off'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          OnClick = sbAnomalyDetectorOnClick
        end
      end
      object grbSonarControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 1
        object ScrollBox2: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel37: TBevel
            Left = 55
            Top = 5
            Width = 255
            Height = 3
          end
          object Bevel43: TBevel
            Left = 55
            Top = 220
            Width = 255
            Height = 3
          end
          object Label213: TLabel
            Left = 5
            Top = -2
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label214: TLabel
            Left = 44
            Top = 13
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label237: TLabel
            Left = 5
            Top = 212
            Width = 40
            Height = 16
            Caption = 'Display'
          end
          object Label238: TLabel
            Left = 43
            Top = 231
            Width = 36
            Height = 16
            Caption = 'Range'
          end
          object Label239: TLabel
            Left = 145
            Top = 231
            Width = 65
            Height = 16
            Caption = 'Blind Zones'
          end
          object sbDisplayBlindHide: TSpeedButton
            Tag = 8
            Left = 140
            Top = 266
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 4
            Down = True
            Caption = 'Hide'
            OnClick = sbSonarClick
          end
          object sbDisplayBlindShow: TSpeedButton
            Tag = 9
            Left = 140
            Top = 246
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 4
            Caption = 'Show'
            OnClick = sbSonarClick
          end
          object sbDisplayRangeHide: TSpeedButton
            Tag = 6
            Left = 26
            Top = 266
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Hide'
            OnClick = sbSonarClick
          end
          object sbDisplayRangeShow: TSpeedButton
            Tag = 7
            Left = 26
            Top = 246
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Show'
            OnClick = sbSonarClick
          end
          object sbSonarControlModeActive: TSpeedButton
            Tag = 1
            Left = 22
            Top = 30
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Active'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = sbSonarClick
          end
          object sbSonarControlModeOff: TSpeedButton
            Tag = 3
            Left = 22
            Top = 70
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Off'
            OnClick = sbSonarClick
          end
          object sbSonarControlModePassive: TSpeedButton
            Tag = 2
            Left = 22
            Top = 50
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Passive'
            OnClick = sbSonarClick
          end
          object lblRangeTIOW: TLabel
            Left = 140
            Top = 13
            Width = 75
            Height = 16
            Caption = 'Range (kyds)'
            Visible = False
          end
          object btnRange1: TSpeedButton
            Tag = 10
            Left = 139
            Top = 30
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Short'
            Visible = False
            OnClick = sbSonarClick
          end
          object btnRAnge2: TSpeedButton
            Tag = 11
            Left = 139
            Top = 50
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Medium'
            Visible = False
            OnClick = sbSonarClick
          end
          object btnRange3: TSpeedButton
            Tag = 12
            Left = 139
            Top = 70
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Long'
            Visible = False
            OnClick = sbSonarClick
          end
          object pnlDeployment: TPanel
            Left = -1
            Top = 90
            Width = 311
            Height = 126
            BevelOuter = bvNone
            TabOrder = 0
            object Bevel39: TBevel
              Left = 85
              Top = 11
              Width = 225
              Height = 3
            end
            object Bevel41: TBevel
              Left = 215
              Top = 26
              Width = 95
              Height = 3
            end
            object Bevel42: TBevel
              Left = 175
              Top = 95
              Width = 135
              Height = 3
            end
            object Label215: TLabel
              Left = 43
              Top = 22
              Width = 35
              Height = 16
              Caption = 'Action'
            end
            object Label216: TLabel
              Left = 6
              Top = 3
              Width = 67
              Height = 16
              Caption = 'Deployment'
            end
            object Label221: TLabel
              Left = 132
              Top = 43
              Width = 56
              Height = 16
              Caption = 'Ordered :'
            end
            object Label222: TLabel
              Left = 132
              Top = 66
              Width = 56
              Height = 16
              Caption = 'Actual    :'
            end
            object Label223: TLabel
              Left = 250
              Top = 43
              Width = 40
              Height = 16
              Caption = 'metres'
            end
            object Label224: TLabel
              Left = 250
              Top = 66
              Width = 40
              Height = 16
              Caption = 'metres'
            end
            object Label226: TLabel
              Left = 10
              Top = 92
              Width = 49
              Height = 16
              Caption = 'Status : '
            end
            object Label228: TLabel
              Left = 132
              Top = 109
              Width = 57
              Height = 16
              Caption = 'Settled   :'
            end
            object Label229: TLabel
              Left = 132
              Top = 129
              Width = 56
              Height = 16
              Caption = 'Actual    :'
            end
            object Label232: TLabel
              Left = 250
              Top = 109
              Width = 40
              Height = 16
              Caption = 'metres'
            end
            object Label233: TLabel
              Left = 250
              Top = 129
              Width = 40
              Height = 16
              Caption = 'metres'
            end
            object Label234: TLabel
              Left = 132
              Top = 149
              Width = 74
              Height = 16
              Caption = 'Tow Speed :'
            end
            object Label236: TLabel
              Left = 250
              Top = 149
              Width = 30
              Height = 16
              Caption = 'knots'
            end
            object LabelCablePayout: TLabel
              Left = 132
              Top = 19
              Width = 74
              Height = 16
              Caption = 'Cable Payout'
            end
            object LabelDepth: TLabel
              Left = 132
              Top = 89
              Width = 33
              Height = 16
              Caption = 'Depth'
            end
            object lbCableActual: TLabel
              Left = 195
              Top = 66
              Width = 15
              Height = 16
              Caption = '---'
            end
            object lbDepthActual: TLabel
              Left = 200
              Top = 129
              Width = 15
              Height = 16
              Caption = '---'
            end
            object lbDepthSettled: TLabel
              Left = 200
              Top = 109
              Width = 15
              Height = 16
              Caption = '---'
            end
            object lbDepthTow: TLabel
              Left = 215
              Top = 149
              Width = 15
              Height = 16
              Caption = '---'
            end
            object lblStatusDeployment: TLabel
              Left = 60
              Top = 92
              Width = 52
              Height = 16
              Caption = 'Deployed'
            end
            object sbDeploymentActiondeploy: TSpeedButton
              Tag = 4
              Left = 22
              Top = 40
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              Caption = 'Deploy'
              OnClick = sbSonarClick
            end
            object sbDeploymentActionShow: TSpeedButton
              Tag = 5
              Left = 22
              Top = 60
              Width = 76
              Height = 22
              AllowAllUp = True
              Caption = 'Stow'
              OnClick = sbSonarClick
            end
            object editCableOrdered: TEdit
              Left = 195
              Top = 42
              Width = 41
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = '000'
            end
          end
        end
      end
      object grbIFFInterrogatorControl: TGroupBox
        Left = 3
        Top = 3
        Width = 317
        Height = 316
        Align = alClient
        TabOrder = 7
        object ScrollBox5: TScrollBox
          Left = 2
          Top = 18
          Width = 313
          Height = 296
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel5: TBevel
            Left = 55
            Top = 5
            Width = 255
            Height = 3
          end
          object Bevel6: TBevel
            Left = 135
            Top = 147
            Width = 175
            Height = 3
          end
          object Bevel7: TBevel
            Left = 55
            Top = 95
            Width = 255
            Height = 3
          end
          object btnIFFInterrogatorTrackSearch: TSpeedButton
            Left = 95
            Top = 109
            Width = 23
            Height = 23
            Glyph.Data = {
              56080000424D560800000000000036000000280000001A0000001A0000000100
              18000000000020080000C40E0000C40E00000000000000000000E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1E6E1E18F8C8C7370707370707370707370707370707370707370707370
              70737070737070737070737070737070737070737070737070ADA9A9E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1817F7F9E9B9BE6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1ACA8A8817F7FE6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              ACA9A9ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E19E9A9A90
              8D8DE6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1C9C5C55654542B2A2A0000000000001D1C1C656262ADA9A9E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1E6E1E1D7D3D36462621D1C1C908D8DBBB6B68F8C
              8C908C8CC9C5C57270700E0E0E656363D8D3D3E6E1E1E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1D7D3D32B
              2A2A646363D8D3D3E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1D8D3D3555454
              2B2A2AD8D3D3E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1646262565454E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1646262656363E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1ACA9A90E0E0ED8
              D3D3E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              D8D3D31C1C1CC9C5C5E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1646262737070E6E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C8C565454E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E11C1C1CCAC5C5E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1ACA8A8ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1BBB6B62B2A2AE6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1000000908C8C908C8C908C8C908C8C908C8CACA9A9E6E1
              E1E6E1E1ACA9A9908C8C908C8C908C8C908C8C908C8C000000E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E10000008F8C8C8F
              8C8C8F8C8C8F8C8C8F8C8CACA9A9E6E1E1E6E1E1ACA9A98F8C8C8F8C8C8F8C8C
              8F8C8C8F8C8C000000E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E12B2A2ABBB7B7E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1ADA9
              A9ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1C9C5C51D1C1CE6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1565454908D8DE6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1737070656262E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1C9C5C51D1C1CD8D3D3E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1D7D3D30E0E0EACA9A9E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E164626265
              6363E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              555454646363E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1D8D3D32B2A2A565454D8D3D3E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1D7D3D36462622B2A2AD8D3D3E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1E6E1E1D8
              D3D36462620E0E0E737171CAC5C58F8C8C908C8CBBB7B78F8C8C1C1C1C646363
              D8D3D3E6E1E1E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1ACA8A86562621C1C1C0000
              000000002B2A2A565454C9C5C5E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E18F8C8C9F9B9BE6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1ACA9A9ACA9A9E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1817E7EADA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E19E9B9B817E7EE6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1ACA8A873707073707073
              7070737070737070737070737070737070737070737070737070737070737070
              737070737070737070908D8DE6E1E1E6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E10000}
            OnClick = btnIFFInterrogatorTrackSearchClick
          end
          object Label10: TLabel
            Left = 5
            Top = -2
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label11: TLabel
            Left = 35
            Top = 20
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label12: TLabel
            Left = 5
            Top = 140
            Width = 121
            Height = 16
            Caption = 'Mode/Code Selection'
          end
          object Label13: TLabel
            Left = 5
            Top = 88
            Width = 32
            Height = 16
            Caption = 'Track'
          end
          object sbIFFInterrogatorControlModeOff: TSpeedButton
            Left = 12
            Top = 62
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Off'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnIFFOnClick
          end
          object sbIFFInterrogatorControlModeOn: TSpeedButton
            Left = 12
            Top = 40
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'On'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnIFFOnClick
          end
          object btnManual: TSpeedButton
            Left = 130
            Top = 63
            Width = 76
            Height = 22
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Manual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnIFFOnClick
          end
          object btnAutomatic: TSpeedButton
            Left = 130
            Top = 40
            Width = 76
            Height = 22
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Continuous'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = btnIFFOnClick
          end
          object lblInterrogation: TLabel
            Left = 130
            Top = 20
            Width = 74
            Height = 16
            Caption = 'Interrogation'
          end
          object cbbtnIFFInterrogatorMode1: TCheckBox
            Left = 15
            Top = 165
            Width = 57
            Height = 17
            Caption = 'Mode 1 :'
            TabOrder = 0
            OnClick = OnIFFCheckedClick
          end
          object cbbtnIFFInterrogatorMode2: TCheckBox
            Left = 15
            Top = 190
            Width = 57
            Height = 17
            Caption = 'Mode 2 :'
            TabOrder = 1
            OnClick = OnIFFCheckedClick
          end
          object cbbtnIFFInterrogatorMode3: TCheckBox
            Left = 15
            Top = 215
            Width = 57
            Height = 17
            Caption = 'Mode 3 :'
            TabOrder = 2
            OnClick = OnIFFCheckedClick
          end
          object cbbtnIFFInterrogatorMode3C: TCheckBox
            Left = 15
            Top = 240
            Width = 57
            Height = 17
            Caption = 'Mode 3C :'
            TabOrder = 3
            OnClick = OnIFFCheckedClick
          end
          object cbbtnIFFInterrogatorMode4: TCheckBox
            Left = 15
            Top = 265
            Width = 57
            Height = 17
            Caption = 'Mode 4 :'
            TabOrder = 4
            OnClick = OnIFFCheckedClick
          end
          object editbtnIFFInterrogatorTrack: TEdit
            Left = 15
            Top = 110
            Width = 73
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object edtIFFInterrogatorMode1: TEdit
            Tag = 1
            Left = 90
            Top = 162
            Width = 27
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 6
            Text = '00'
            Visible = False
            OnKeyPress = edtInterrogatorOnKeyPress
          end
          object edtIFFInterrogatorMode2: TEdit
            Tag = 2
            Left = 90
            Top = 187
            Width = 85
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 7
            Text = '0000'
            Visible = False
            OnKeyPress = edtInterrogatorOnKeyPress
          end
          object edtIFFInterrogatorMode3: TEdit
            Tag = 3
            Left = 90
            Top = 212
            Width = 85
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 4
            ParentFont = False
            TabOrder = 8
            Text = '0000'
            Visible = False
            OnKeyPress = edtInterrogatorOnKeyPress
          end
        end
      end
    end
  end
  object pmModeSonobuoy: TPopupMenu
    Left = 272
    Top = 88
  end
end
