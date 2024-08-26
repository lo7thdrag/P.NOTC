inherited fmEMCON: TfmEMCON
  Width = 336
  Height = 412
  Color = 15131105
  Font.Height = -13
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  ExplicitWidth = 336
  ExplicitHeight = 412
  object PanelEmconChoices: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 97
    Align = alTop
    Color = 16775920
    ParentBackground = False
    TabOrder = 0
    object LvEmcon: TListView
      Left = 1
      Top = 1
      Width = 334
      Height = 95
      Align = alClient
      Color = clWhite
      Columns = <
        item
          Caption = 'Name'
          Width = 150
        end
        item
          Caption = 'Status'
        end>
      TabOrder = 0
      ViewStyle = vsReport
    end
  end
  object PaneALL: TPanel
    Left = 0
    Top = 97
    Width = 336
    Height = 315
    Align = alClient
    BevelOuter = bvNone
    Color = 16775920
    ParentBackground = False
    TabOrder = 1
    object PanelEmcon: TPanel
      Left = 0
      Top = 0
      Width = 336
      Height = 315
      Align = alClient
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object ScrollBox2: TScrollBox
        Left = 1
        Top = 1
        Width = 334
        Height = 313
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Bevel17: TBevel
          Left = 131
          Top = 13
          Width = 187
          Height = 3
        end
        object Bevel18: TBevel
          Left = 85
          Top = 238
          Width = 65
          Height = 3
        end
        object Label562: TLabel
          Left = 10
          Top = 230
          Width = 66
          Height = 16
          Caption = 'All Systems'
        end
        object sbEmconAllSystemsAllSilent: TSpeedButton
          Left = 26
          Top = 250
          Width = 80
          Height = 25
          HelpContext = 1
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'All Silent'
          OnClick = sbEmconAllClick
        end
        object sbEmconAllSystemsClearAll: TSpeedButton
          Left = 26
          Top = 275
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Clear All'
          OnClick = sbEmconAllClick
        end
        object btnEmconDistributeToGroup: TButton
          Left = 190
          Top = 26
          Width = 130
          Height = 25
          Caption = 'Distribute to Group'
          Enabled = False
          TabOrder = 0
          Visible = False
        end
        object cbEmconAcousticDecoys: TCheckBox
          Left = 10
          Top = 206
          Width = 175
          Height = 17
          Caption = 'Acoustic Decoys'
          TabOrder = 1
        end
        object cbEmconActiveSonar: TCheckBox
          Left = 10
          Top = 190
          Width = 175
          Height = 17
          Caption = 'Active Sonar'
          TabOrder = 2
          OnClick = cbEmconSearchRadarClick
        end
        object cbEmconFireControl: TCheckBox
          Left = 10
          Top = 46
          Width = 175
          Height = 17
          Caption = 'Fire Control Radar'
          TabOrder = 3
          OnClick = cbEmconSearchRadarClick
        end
        object cbEmconHFComm: TCheckBox
          Left = 10
          Top = 110
          Width = 175
          Height = 17
          Caption = 'HF Communications'
          TabOrder = 4
        end
        object cbEmconHFDatalink: TCheckBox
          Left = 10
          Top = 142
          Width = 175
          Height = 17
          Caption = 'HF Datalink'
          TabOrder = 5
          OnClick = cbEmconSearchRadarClick
        end
        object cbEmconIFF: TCheckBox
          Left = 10
          Top = 62
          Width = 175
          Height = 17
          Caption = 'IFF'
          TabOrder = 6
          OnClick = cbEmconSearchRadarClick
        end
        object cbEmconJammingSystems: TCheckBox
          Left = 10
          Top = 78
          Width = 175
          Height = 17
          Caption = 'Jamming Systems'
          TabOrder = 7
        end
        object cbEmconLasers: TCheckBox
          Left = 10
          Top = 94
          Width = 175
          Height = 17
          Caption = 'Lasers'
          TabOrder = 8
        end
        object cbEmconSearchRadar: TCheckBox
          Left = 10
          Top = 30
          Width = 175
          Height = 17
          Caption = 'Search Radar'
          TabOrder = 9
          OnClick = cbEmconSearchRadarClick
        end
        object cbEmconUWT: TCheckBox
          Left = 10
          Top = 174
          Width = 175
          Height = 17
          Caption = 'UWT'
          TabOrder = 10
        end
        object cbEmconVHFUHFComm: TCheckBox
          Left = 10
          Top = 126
          Width = 175
          Height = 17
          Caption = 'VHF/UHF Communications'
          TabOrder = 11
        end
        object cbEmconVHFUHFDatalink: TCheckBox
          Left = 10
          Top = 158
          Width = 175
          Height = 17
          Caption = 'VHF/UHF Datalink'
          TabOrder = 12
          OnClick = cbEmconSearchRadarClick
        end
        object cbxEmcon: TComboBox
          Left = 10
          Top = 3
          Width = 112
          Height = 24
          TabOrder = 13
          Text = 'EMCON inhibit'
        end
        object pnlGroupAirbone: TPanel
          Left = 150
          Top = 210
          Width = 168
          Height = 91
          BevelOuter = bvNone
          TabOrder = 14
          Visible = False
          object Label87: TLabel
            Left = 12
            Top = 20
            Width = 120
            Height = 16
            Caption = 'Group Airbone Radar'
            Color = 4012086
            Enabled = False
            ParentColor = False
            Transparent = True
          end
          object Bevel22: TBevel
            Left = 140
            Top = 28
            Width = 25
            Height = 3
          end
          object sbEmconGroupAirboneEMCON: TSpeedButton
            Left = 30
            Top = 65
            Width = 80
            Height = 25
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'EMCON'
            Enabled = False
          end
          object sbEmconGroupAirboneClear: TSpeedButton
            Left = 30
            Top = 40
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Clear'
            Enabled = False
          end
        end
      end
    end
  end
end
