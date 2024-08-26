inherited fmSensor: TfmSensor
  Width = 323
  Height = 470
  ExplicitWidth = 323
  ExplicitHeight = 470
  object PanelSensorChoices: TPanel
    Left = 0
    Top = 0
    Width = 323
    Height = 120
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lstSensor: TListView
      Left = 1
      Top = 1
      Width = 321
      Height = 118
      Align = alClient
      Color = clMenu
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
      GridLines = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lstSensorSelectItem
    end
  end
  object PanelSensorControl: TPanel
    Left = 0
    Top = 125
    Width = 323
    Height = 345
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 3
    ParentBackground = False
    TabOrder = 1
    object grbIFFTransponderControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 8
      object Label108: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel23: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label110: TLabel
        Left = 35
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Label112: TLabel
        Left = 3
        Top = 96
        Width = 101
        Height = 13
        Caption = 'Mode/Code Selection'
      end
      object Bevel24: TBevel
        Left = 105
        Top = 104
        Width = 200
        Height = 3
      end
      object sbIFFTransponderControlModeOn: TSpeedButton
        Left = 14
        Top = 41
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'On'
      end
      object sbIFFTransponderControlModeOff: TSpeedButton
        Left = 14
        Top = 60
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Off'
      end
      object cbIFFTransponderControlMode1: TCheckBox
        Left = 14
        Top = 122
        Width = 57
        Height = 17
        Caption = 'Mode 1 :'
        TabOrder = 0
      end
      object cbIFFTransponderControlMode2: TCheckBox
        Left = 14
        Top = 153
        Width = 57
        Height = 17
        Caption = 'Mode 2 :'
        TabOrder = 1
      end
      object cbIFFTransponderControlMode3: TCheckBox
        Left = 14
        Top = 184
        Width = 57
        Height = 17
        Caption = 'Mode 3 :'
        TabOrder = 2
      end
      object cbIFFTransponderControlMode3C: TCheckBox
        Left = 14
        Top = 215
        Width = 57
        Height = 17
        Caption = 'Mode 3C :'
        TabOrder = 3
      end
      object cbIFFTransponderControlMode4: TCheckBox
        Left = 14
        Top = 246
        Width = 57
        Height = 17
        Caption = 'Mode 4 :'
        TabOrder = 4
      end
      object edtIFFTransponderControlMode1: TEdit
        Left = 88
        Top = 120
        Width = 85
        Height = 21
        TabOrder = 5
        Text = '00'
      end
      object edtIFFTransponderControlMode2: TEdit
        Left = 88
        Top = 151
        Width = 85
        Height = 21
        TabOrder = 6
        Text = '0000'
      end
      object edtIFFTransponderControlMode3: TEdit
        Left = 88
        Top = 182
        Width = 85
        Height = 21
        TabOrder = 7
        Text = '0000'
      end
    end
    object grbAnomalyDetectorSensor: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 3
      object Label225: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel47: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label230: TLabel
        Left = 35
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object sbAnomalyDetectorControlModeOn: TSpeedButton
        Left = 14
        Top = 38
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'On'
      end
      object sbAnomalyDetectorControlModeOff: TSpeedButton
        Left = 14
        Top = 59
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'Off'
      end
    end
    object grbElectroOpticalSensor: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 4
      object Label231: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel48: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label235: TLabel
        Left = 54
        Top = 22
        Width = 46
        Height = 13
        Caption = 'Periscope'
      end
      object Label245: TLabel
        Left = 3
        Top = 90
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel49: TBevel
        Left = 45
        Top = 97
        Width = 260
        Height = 3
      end
      object Label251: TLabel
        Left = 153
        Top = 115
        Width = 57
        Height = 13
        Caption = 'Blind Zones '
      end
      object Label252: TLabel
        Left = 56
        Top = 115
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object sbElectroOpticalSensorDisplayRangeShow: TSpeedButton
        Left = 38
        Top = 134
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbElectroOpticalSensorDisplayRangeHide: TSpeedButton
        Left = 38
        Top = 155
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object sbElectroOpticalSensorBlindZoneShow: TSpeedButton
        Left = 142
        Top = 134
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbElectroOpticalSensorBlindZoneHide: TSpeedButton
        Left = 142
        Top = 155
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbElectroOpticalSensorControlModeOn: TSpeedButton
        Left = 38
        Top = 38
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Up'
      end
      object sbElectroOpticalSensorControlModeOff: TSpeedButton
        Left = 38
        Top = 59
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'Down'
      end
      object btnElectroOpticalSensorExecuteSingleScan: TButton
        Left = 145
        Top = 367
        Width = 153
        Height = 25
        Caption = 'Execute Single Scan'
        TabOrder = 0
      end
    end
    object grbVisualDetectorSensor: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 6
      object Label257: TLabel
        Left = 5
        Top = 3
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel51: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label258: TLabel
        Left = 145
        Top = 28
        Width = 57
        Height = 13
        Caption = 'Blind Zones '
      end
      object Label259: TLabel
        Left = 51
        Top = 28
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object sbVisualDetectorDisplayRangeShow: TSpeedButton
        Tag = 1
        Left = 30
        Top = 44
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
        OnClick = sbVisualSensorClick
      end
      object sbVisualDetectorDisplayRangeHide: TSpeedButton
        Tag = 2
        Left = 30
        Top = 64
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
        OnClick = sbVisualSensorClick
      end
      object sbVisualDetectorDisplayBlindZonesShow: TSpeedButton
        Tag = 3
        Left = 132
        Top = 44
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
        OnClick = sbVisualSensorClick
      end
      object sbVisualDetectorDisplayBlindZonesHide: TSpeedButton
        Tag = 4
        Left = 132
        Top = 64
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
        OnClick = sbVisualSensorClick
      end
    end
    object grbSearchRadarControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 0
      object ScrollBox1: TScrollBox
        Left = 2
        Top = 15
        Width = 313
        Height = 322
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label189: TLabel
          Left = 3
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Bevel28: TBevel
          Left = 43
          Top = 10
          Width = 190
          Height = 3
        end
        object Label193: TLabel
          Left = 43
          Top = 22
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label194: TLabel
          Left = 243
          Top = 22
          Width = 28
          Height = 13
          Caption = 'ECCM'
        end
        object Label200: TLabel
          Left = 3
          Top = 130
          Width = 57
          Height = 13
          Caption = 'Scan Sector'
        end
        object Bevel30: TBevel
          Left = 74
          Top = 138
          Width = 175
          Height = 3
        end
        object Label201: TLabel
          Left = 43
          Top = 149
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label202: TLabel
          Left = 132
          Top = 170
          Width = 31
          Height = 13
          Caption = 'Start :'
        end
        object Label203: TLabel
          Left = 132
          Top = 193
          Width = 25
          Height = 13
          Caption = 'End :'
        end
        object Label204: TLabel
          Left = 205
          Top = 170
          Width = 48
          Height = 13
          Caption = 'degrees T'
        end
        object Label205: TLabel
          Left = 206
          Top = 193
          Width = 48
          Height = 13
          Caption = 'degrees T'
        end
        object Label261: TLabel
          Left = 3
          Top = 222
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Bevel31: TBevel
          Left = 51
          Top = 230
          Width = 192
          Height = 3
        end
        object Label262: TLabel
          Left = 43
          Top = 241
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label263: TLabel
          Left = 132
          Top = 241
          Width = 54
          Height = 13
          Caption = 'Blind Zones'
        end
        object Label264: TLabel
          Left = 230
          Top = 241
          Width = 57
          Height = 13
          Caption = 'Scan Sector'
        end
        object btnControlComboInterval: TSpeedButton
          Left = 270
          Top = 100
          Width = 23
          Height = 22
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
        end
        object btnComboScanStrart: TSpeedButton
          Left = 266
          Top = 165
          Width = 23
          Height = 22
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
        end
        object sbControlModeSearch: TSpeedButton
          Tag = 9
          Left = 19
          Top = 39
          Width = 81
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 7
          Caption = 'Search / Track'
          OnClick = sbSearchRadarClick
        end
        object sbControlModeTrack: TSpeedButton
          Tag = 10
          Left = 19
          Top = 59
          Width = 81
          Height = 22
          AllowAllUp = True
          GroupIndex = 7
          Caption = 'Track'
          OnClick = sbSearchRadarClick
        end
        object sbControlModeOff: TSpeedButton
          Tag = 11
          Left = 19
          Top = 77
          Width = 81
          Height = 22
          AllowAllUp = True
          GroupIndex = 7
          Down = True
          Caption = 'Off'
          OnClick = sbSearchRadarClick
        end
        object sbControlEccmOn: TSpeedButton
          Tag = 12
          Left = 220
          Top = 39
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'On'
          OnClick = sbSearchRadarClick
        end
        object sbControlEccmOff: TSpeedButton
          Tag = 13
          Left = 220
          Top = 59
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Off'
          OnClick = sbSearchRadarClick
        end
        object sbScanModeFull: TSpeedButton
          Tag = 7
          Left = 19
          Top = 168
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Full'
          OnClick = sbSearchRadarClick
        end
        object sbScanModePartial: TSpeedButton
          Tag = 8
          Left = 19
          Top = 188
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Partial'
          OnClick = sbSearchRadarClick
        end
        object sbRangeShow: TSpeedButton
          Tag = 1
          Left = 22
          Top = 258
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Show'
          OnClick = sbSearchRadarClick
        end
        object sbRangeHide: TSpeedButton
          Tag = 2
          Left = 22
          Top = 278
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = 'Hide'
          OnClick = sbSearchRadarClick
        end
        object sbBlindShow: TSpeedButton
          Tag = 3
          Left = 120
          Top = 258
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 5
          Caption = 'Show'
          OnClick = sbSearchRadarClick
        end
        object sbBlindHide: TSpeedButton
          Tag = 4
          Left = 120
          Top = 278
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 5
          Down = True
          Caption = 'Hide'
          OnClick = sbSearchRadarClick
        end
        object sbScanShow: TSpeedButton
          Tag = 5
          Left = 215
          Top = 258
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 6
          Caption = 'Show'
          OnClick = sbSearchRadarClick
        end
        object sbScanHide: TSpeedButton
          Tag = 6
          Left = 215
          Top = 278
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 6
          Down = True
          Caption = 'Hide'
          OnClick = sbSearchRadarClick
        end
        object cbActivationInterval: TCheckBox
          Left = 24
          Top = 103
          Width = 106
          Height = 17
          Caption = 'Activation Interval'
          TabOrder = 0
        end
        object editComboInterval: TEdit
          Left = 136
          Top = 101
          Width = 128
          Height = 21
          TabOrder = 1
          Text = 'None'
        end
        object editScanStart: TEdit
          Left = 169
          Top = 166
          Width = 30
          Height = 21
          TabOrder = 2
          Text = '000'
        end
        object editScanEnd: TEdit
          Left = 169
          Top = 189
          Width = 30
          Height = 21
          TabOrder = 3
          Text = '000'
        end
        object btShowRangeAltitude: TButton
          Left = 22
          Top = 328
          Width = 117
          Height = 20
          Caption = 'Show Range Altitude..'
          TabOrder = 4
        end
        object btExecuteSingleScan: TButton
          Left = 183
          Top = 328
          Width = 106
          Height = 20
          Caption = 'Execute Single Scan'
          TabOrder = 5
        end
      end
    end
    object grbIFFInterrogatorControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 7
      object Label208: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel34: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label210: TLabel
        Left = 35
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Label211: TLabel
        Left = 3
        Top = 154
        Width = 101
        Height = 13
        Caption = 'Mode/Code Selection'
      end
      object Bevel35: TBevel
        Left = 105
        Top = 162
        Width = 200
        Height = 3
      end
      object Label212: TLabel
        Left = 3
        Top = 90
        Width = 26
        Height = 13
        Caption = 'Track'
      end
      object Bevel36: TBevel
        Left = 35
        Top = 98
        Width = 265
        Height = 3
      end
      object btnbtnIFFInterrogatorTrackSearch: TSpeedButton
        Left = 96
        Top = 110
        Width = 23
        Height = 22
        Glyph.Data = {
          36090000424D360900000000000036000000280000001F000000180000000100
          18000000000000090000000000000000000000000000000000006161613E3E3E
          3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
          3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
          41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
          7474747F7F7F7878787777778080808080807878787878788080807474747C7C
          7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
          80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
          491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
          5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
          86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
          13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
          27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
          B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
          BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
          53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
          58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
          25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
          25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
          53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
          9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
          94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
          6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
          39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
          A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
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
      end
      object sbIFFInterrogatorControlModeOff: TSpeedButton
        Left = 12
        Top = 60
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Off'
      end
      object cbbtnIFFInterrogatorMode1: TCheckBox
        Left = 14
        Top = 180
        Width = 57
        Height = 17
        Caption = 'Mode 1 :'
        TabOrder = 0
      end
      object cbbtnIFFInterrogatorMode2: TCheckBox
        Left = 14
        Top = 211
        Width = 57
        Height = 17
        Caption = 'Mode 2 :'
        TabOrder = 1
      end
      object cbbtnIFFInterrogatorMode3: TCheckBox
        Left = 14
        Top = 242
        Width = 57
        Height = 17
        Caption = 'Mode 3 :'
        TabOrder = 2
      end
      object cbbtnIFFInterrogatorMode3C: TCheckBox
        Left = 14
        Top = 273
        Width = 57
        Height = 17
        Caption = 'Mode 3C :'
        TabOrder = 3
      end
      object cbbtnIFFInterrogatorMode4: TCheckBox
        Left = 14
        Top = 304
        Width = 57
        Height = 17
        Caption = 'Mode 4 :'
        TabOrder = 4
      end
      object edtIFFInterrogatorMode1: TEdit
        Left = 88
        Top = 178
        Width = 85
        Height = 21
        TabOrder = 5
        Text = '00'
      end
      object edtIFFInterrogatorMode2: TEdit
        Left = 88
        Top = 209
        Width = 85
        Height = 21
        TabOrder = 6
        Text = '0000'
      end
      object edtIFFInterrogatorMode3: TEdit
        Left = 88
        Top = 240
        Width = 85
        Height = 21
        TabOrder = 7
        Text = '0000'
      end
      object editbtnIFFInterrogatorTrack: TEdit
        Left = 14
        Top = 111
        Width = 73
        Height = 21
        TabOrder = 8
        Text = '1004'
      end
    end
    object grbSonobuoyControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 5
      object Label240: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Bevel44: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object lblStatusSonobuoy: TLabel
        Left = 35
        Top = 22
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label243: TLabel
        Left = 35
        Top = 72
        Width = 33
        Height = 13
        Caption = 'Mode :'
      end
      object Label244: TLabel
        Left = 107
        Top = 22
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbStatusQuantity: TLabel
        Left = 162
        Top = 22
        Width = 18
        Height = 13
        Caption = '100'
      end
      object Label242: TLabel
        Left = 3
        Top = 49
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel45: TBevel
        Left = 45
        Top = 56
        Width = 260
        Height = 3
      end
      object Label246: TLabel
        Left = 35
        Top = 103
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object Label247: TLabel
        Left = 159
        Top = 103
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label248: TLabel
        Left = 3
        Top = 161
        Width = 36
        Height = 13
        Caption = 'Monitor'
      end
      object Bevel46: TBevel
        Left = 41
        Top = 169
        Width = 260
        Height = 3
      end
      object Label249: TLabel
        Left = 35
        Top = 186
        Width = 128
        Height = 13
        Caption = 'Platform Monitor Capacity:'
      end
      object Label250: TLabel
        Left = 35
        Top = 215
        Width = 105
        Height = 13
        Caption = 'Currently Monitoring :'
      end
      object lblSonobuoyMonitorCurrently: TLabel
        Left = 190
        Top = 215
        Width = 6
        Height = 13
        Caption = '0'
      end
      object lblSonobuoyMonitorPlatform: TLabel
        Left = 188
        Top = 186
        Width = 12
        Height = 13
        Caption = '50'
      end
      object Label253: TLabel
        Left = 208
        Top = 186
        Width = 54
        Height = 13
        Caption = 'sonobuy(s)'
      end
      object Label254: TLabel
        Left = 208
        Top = 215
        Width = 54
        Height = 13
        Caption = 'sonobuy(s)'
      end
      object btnSonobuoyControlCombo: TSpeedButton
        Left = 280
        Top = 67
        Width = 23
        Height = 22
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
      end
      object editControlMode: TEdit
        Left = 80
        Top = 68
        Width = 194
        Height = 21
        TabOrder = 0
        Text = 'Passive'
      end
      object editControlDepth: TEdit
        Left = 80
        Top = 99
        Width = 73
        Height = 21
        TabOrder = 1
        Text = '100'
      end
      object btnSonobuoyControlDeploy: TButton
        Left = 228
        Top = 134
        Width = 75
        Height = 25
        Caption = 'Deploy'
        TabOrder = 2
      end
    end
    object grbESMSensorControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 2
      object Label217: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel38: TBevel
        Left = 43
        Top = 10
        Width = 260
        Height = 3
      end
      object Label218: TLabel
        Left = 35
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Label219: TLabel
        Left = 3
        Top = 90
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel40: TBevel
        Left = 45
        Top = 97
        Width = 260
        Height = 3
      end
      object Label220: TLabel
        Left = 25
        Top = 115
        Width = 57
        Height = 13
        Caption = 'Blind Zones '
      end
      object sbESMSensorControlModeOn: TSpeedButton
        Tag = 1
        Left = 14
        Top = 40
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'On'
        OnClick = sbESMSensorControlModeClick
      end
      object sbESMSensorControlModeOff: TSpeedButton
        Tag = 2
        Left = 14
        Top = 60
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'Off'
        OnClick = sbESMSensorControlModeClick
      end
      object sbESMSensorDisplayBlindZoneShow: TSpeedButton
        Tag = 3
        Left = 14
        Top = 129
        Width = 76
        Height = 22
        HelpContext = 1
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
        OnClick = sbESMSensorControlModeClick
      end
      object sbESMSensorDisplayBlindZoneHide: TSpeedButton
        Tag = 4
        Left = 14
        Top = 149
        Width = 76
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
        OnClick = sbESMSensorControlModeClick
      end
    end
    object grbSonarControl: TGroupBox
      Left = 3
      Top = 3
      Width = 317
      Height = 339
      Align = alClient
      TabOrder = 1
      object ScrollBox2: TScrollBox
        Left = 2
        Top = 15
        Width = 313
        Height = 322
        VertScrollBar.Position = 37
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Bevel37: TBevel
          Left = 44
          Top = -33
          Width = 262
          Height = 3
        end
        object Bevel39: TBevel
          Left = 65
          Top = 70
          Width = 245
          Height = 3
        end
        object Bevel41: TBevel
          Left = 202
          Top = 88
          Width = 105
          Height = 3
        end
        object Bevel42: TBevel
          Left = 170
          Top = 157
          Width = 140
          Height = 3
        end
        object Bevel43: TBevel
          Left = 45
          Top = 237
          Width = 265
          Height = 3
        end
        object Label213: TLabel
          Left = 3
          Top = -39
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Label214: TLabel
          Left = 43
          Top = -27
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label215: TLabel
          Left = 43
          Top = 81
          Width = 30
          Height = 13
          Caption = 'Action'
        end
        object Label216: TLabel
          Left = 3
          Top = 62
          Width = 57
          Height = 13
          Caption = 'Deployment'
        end
        object Label221: TLabel
          Left = 132
          Top = 105
          Width = 47
          Height = 13
          Caption = 'Ordered :'
        end
        object Label222: TLabel
          Left = 132
          Top = 128
          Width = 37
          Height = 13
          Caption = 'Actual :'
        end
        object Label223: TLabel
          Left = 250
          Top = 105
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object Label224: TLabel
          Left = 250
          Top = 128
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object Label226: TLabel
          Left = 22
          Top = 151
          Width = 41
          Height = 13
          Caption = 'Status : '
        end
        object Label228: TLabel
          Left = 132
          Top = 171
          Width = 41
          Height = 13
          Caption = 'Settled :'
        end
        object Label229: TLabel
          Left = 132
          Top = 191
          Width = 37
          Height = 13
          Caption = 'Actual :'
        end
        object Label232: TLabel
          Left = 250
          Top = 171
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object Label233: TLabel
          Left = 250
          Top = 191
          Width = 33
          Height = 13
          Caption = 'metres'
        end
        object Label234: TLabel
          Left = 132
          Top = 210
          Width = 60
          Height = 13
          Caption = 'Tow Speed :'
        end
        object Label236: TLabel
          Left = 250
          Top = 210
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object Label237: TLabel
          Left = 3
          Top = 229
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Label238: TLabel
          Left = 43
          Top = 248
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label239: TLabel
          Left = 145
          Top = 248
          Width = 54
          Height = 13
          Caption = 'Blind Zones'
        end
        object LabelCablePayout: TLabel
          Left = 132
          Top = 81
          Width = 64
          Height = 13
          Caption = 'Cable Payout'
        end
        object LabelDepth: TLabel
          Left = 132
          Top = 151
          Width = 29
          Height = 13
          Caption = 'Depth'
        end
        object lbCableActual: TLabel
          Left = 187
          Top = 128
          Width = 18
          Height = 13
          Caption = '124'
        end
        object lbDepthActual: TLabel
          Left = 212
          Top = 191
          Width = 6
          Height = 13
          Caption = '6'
        end
        object lbDepthSettled: TLabel
          Left = 212
          Top = 171
          Width = 6
          Height = 13
          Caption = '6'
        end
        object lbDepthTow: TLabel
          Left = 212
          Top = 210
          Width = 22
          Height = 13
          Caption = '29.0'
        end
        object lblStatusDeployment: TLabel
          Left = 62
          Top = 151
          Width = 45
          Height = 13
          Caption = 'Deployed'
        end
        object sbDeploymentActiondeploy: TSpeedButton
          Tag = 4
          Left = 22
          Top = 100
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'Deploy'
          OnClick = sbSonarClick
        end
        object sbDeploymentActionShow: TSpeedButton
          Tag = 5
          Left = 22
          Top = 120
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Stow'
          OnClick = sbSonarClick
        end
        object sbDisplayBlindHide: TSpeedButton
          Tag = 8
          Left = 133
          Top = 284
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
          Left = 133
          Top = 263
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
          Top = 284
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
          Top = 263
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
          Top = -8
          Width = 76
          Height = 22
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Active'
          OnClick = sbSonarClick
        end
        object sbSonarControlModeOff: TSpeedButton
          Tag = 3
          Left = 22
          Top = 31
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
          Top = 12
          Width = 76
          Height = 22
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Passive'
          OnClick = sbSonarClick
        end
        object editCableOrdered: TEdit
          Left = 187
          Top = 101
          Width = 41
          Height = 21
          TabOrder = 0
          Text = '124'
        end
      end
    end
  end
  object PanelSpace: TPanel
    Left = 0
    Top = 120
    Width = 323
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
  end
end
