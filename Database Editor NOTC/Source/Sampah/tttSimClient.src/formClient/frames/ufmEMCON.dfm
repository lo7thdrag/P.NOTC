inherited fmEMCON: TfmEMCON
  Width = 336
  Height = 514
  ParentFont = False
  ExplicitWidth = 336
  ExplicitHeight = 514
  object PanelEmconChoices: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 97
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 329
    object ListView7: TListView
      Left = 1
      Top = 1
      Width = 334
      Height = 95
      Align = alClient
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
      ExplicitWidth = 327
    end
  end
  object PanelEmcon: TPanel
    Left = 0
    Top = 97
    Width = 336
    Height = 417
    Align = alClient
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 113
    ExplicitWidth = 329
    ExplicitHeight = 315
    object Label562: TLabel
      Left = 13
      Top = 334
      Width = 54
      Height = 13
      Caption = 'All Systems'
    end
    object Bevel120: TBevel
      Left = 41
      Top = 453
      Width = 15
      Height = 2
    end
    object Bevel17: TBevel
      Left = 131
      Top = 12
      Width = 187
      Height = 3
    end
    object Bevel18: TBevel
      Left = 73
      Top = 340
      Width = 80
      Height = 3
    end
    object Label87: TLabel
      Left = 178
      Top = 334
      Width = 101
      Height = 13
      Caption = 'Group Airbone Radar'
    end
    object Bevel21: TBevel
      Left = 208
      Top = 365
      Width = 15
      Height = 2
    end
    object Bevel22: TBevel
      Left = 282
      Top = 340
      Width = 40
      Height = 3
    end
    object sbEmconAllSystemsAllSilent: TSpeedButton
      Left = 26
      Top = 353
      Width = 80
      Height = 25
      HelpContext = 1
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'All Silent'
    end
    object sbEmconAllSystemsClearAll: TSpeedButton
      Left = 26
      Top = 377
      Width = 80
      Height = 25
      AllowAllUp = True
      GroupIndex = 3
      Down = True
      Caption = 'Clear All'
    end
    object sbEmconGroupAirboneEMCON: TSpeedButton
      Left = 200
      Top = 353
      Width = 80
      Height = 25
      HelpContext = 1
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'EMCON'
    end
    object sbEmconGroupAirboneClear: TSpeedButton
      Left = 200
      Top = 377
      Width = 80
      Height = 25
      AllowAllUp = True
      GroupIndex = 2
      Down = True
      Caption = 'Clear'
    end
    object cbxEmcon: TComboBox
      Left = 13
      Top = 6
      Width = 112
      Height = 21
      TabOrder = 0
      Text = 'EMCON inhibit'
    end
    object cbEmconSearchRadar: TCheckBox
      Left = 13
      Top = 30
      Width = 190
      Height = 17
      Caption = 'Search Radar'
      TabOrder = 1
    end
    object cbEmconFireControl: TCheckBox
      Left = 13
      Top = 54
      Width = 190
      Height = 17
      Caption = 'Fire Control Radar'
      TabOrder = 2
    end
    object cbEmconIFF: TCheckBox
      Left = 13
      Top = 78
      Width = 190
      Height = 17
      Caption = 'IFF'
      TabOrder = 3
    end
    object cbEmconJammingSystems: TCheckBox
      Left = 13
      Top = 102
      Width = 190
      Height = 17
      Caption = 'Jamming Systems'
      TabOrder = 4
    end
    object cbEmconLasers: TCheckBox
      Left = 13
      Top = 126
      Width = 190
      Height = 17
      Caption = 'Lasers'
      TabOrder = 5
    end
    object cbEmconHFComm: TCheckBox
      Left = 13
      Top = 150
      Width = 190
      Height = 17
      Caption = 'HF Communications'
      TabOrder = 6
    end
    object cbEmconVHFUHFComm: TCheckBox
      Left = 13
      Top = 174
      Width = 190
      Height = 17
      Caption = 'VHF/UHF Communications'
      TabOrder = 7
    end
    object cbEmconHFDatalink: TCheckBox
      Left = 13
      Top = 198
      Width = 190
      Height = 17
      Caption = 'HF Datalink'
      TabOrder = 8
    end
    object cbEmconUWT: TCheckBox
      Left = 13
      Top = 246
      Width = 190
      Height = 17
      Caption = 'UWT'
      TabOrder = 9
    end
    object cbEmconActiveSonar: TCheckBox
      Left = 13
      Top = 270
      Width = 190
      Height = 17
      Caption = 'Active Sonar'
      TabOrder = 10
    end
    object cbEmconAcousticDecoys: TCheckBox
      Left = 13
      Top = 295
      Width = 190
      Height = 17
      Caption = 'Acoustic Decoys'
      TabOrder = 11
    end
    object btnEmconDistributeToGroup: TButton
      Left = 208
      Top = 26
      Width = 110
      Height = 25
      Caption = 'Distribute to Group'
      TabOrder = 12
    end
    object cbEmconVHFUHFDatalink: TCheckBox
      Left = 13
      Top = 222
      Width = 190
      Height = 17
      Caption = 'VHF/UHF Datalink'
      TabOrder = 13
    end
  end
end
