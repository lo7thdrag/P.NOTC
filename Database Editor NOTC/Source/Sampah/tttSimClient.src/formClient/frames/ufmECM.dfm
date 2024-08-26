inherited fmCounterMeasure: TfmCounterMeasure
  Width = 328
  Height = 486
  ExplicitWidth = 328
  ExplicitHeight = 486
  object PanelCounterMeasureSpace: TPanel
    Left = 0
    Top = 100
    Width = 328
    Height = 15
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
  end
  object PanelCounterMeasureChoice: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object lvECM: TListView
      Left = 0
      Top = 0
      Width = 328
      Height = 100
      Align = alClient
      Columns = <
        item
          Caption = 'Name'
          Width = 150
        end
        item
          Caption = 'Status'
          Width = 60
        end>
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvECMSelectItem
    end
  end
  object PanelCounterMeasure: TPanel
    Left = 0
    Top = 115
    Width = 328
    Height = 371
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object grbOnBoardSelfDefenseJammer: TGroupBox
      Left = 0
      Top = 0
      Width = 328
      Height = 371
      Align = alClient
      TabOrder = 1
      object Label542: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Label543: TLabel
        Left = 155
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Targeting'
      end
      object Label544: TLabel
        Left = 53
        Top = 24
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Bevel112: TBevel
        Left = 41
        Top = 10
        Width = 260
        Height = 3
      end
      object Label546: TLabel
        Left = 28
        Top = 169
        Width = 69
        Height = 13
        Caption = 'Spot Number :'
      end
      object Label547: TLabel
        Left = 28
        Top = 144
        Width = 43
        Height = 13
        Caption = 'Bearing :'
      end
      object Label549: TLabel
        Left = 172
        Top = 144
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton
        Left = 28
        Top = 43
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Automatic'
      end
      object sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton
        Left = 28
        Top = 66
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Manual'
      end
      object sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton
        Left = 140
        Top = 43
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Spot'
      end
      object sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton
        Left = 140
        Top = 68
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Track'
      end
      object sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton
        Left = 28
        Top = 89
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Off'
      end
      object edtOnBoardSelfDefenseJammerBearing: TEdit
        Left = 103
        Top = 142
        Width = 63
        Height = 21
        TabOrder = 0
        Text = '000'
      end
      object edtOnBoardSelfDefenseJammerSpotNumber: TEdit
        Left = 103
        Top = 166
        Width = 63
        Height = 21
        TabOrder = 1
        Text = '---'
      end
    end
    object grbTowedJammerDecoy: TGroupBox
      Left = 0
      Top = 241
      Width = 329
      Height = 495
      TabOrder = 2
      object Label501: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Label503: TLabel
        Left = 45
        Top = 22
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Label506: TLabel
        Left = 18
        Top = 131
        Width = 43
        Height = 13
        Caption = 'Bearing :'
      end
      object Bevel111: TBevel
        Left = 44
        Top = 10
        Width = 260
        Height = 3
      end
      object Label504: TLabel
        Left = 18
        Top = 154
        Width = 69
        Height = 13
        Caption = 'Spot Number :'
      end
      object Label559: TLabel
        Left = 3
        Top = 188
        Width = 57
        Height = 13
        Caption = 'Deployment'
      end
      object Bevel118: TBevel
        Left = 60
        Top = 195
        Width = 245
        Height = 3
      end
      object Label505: TLabel
        Left = 150
        Top = 19
        Width = 46
        Height = 13
        Caption = 'Targeting'
      end
      object Label507: TLabel
        Left = 189
        Top = 133
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label508: TLabel
        Left = 41
        Top = 212
        Width = 30
        Height = 13
        Caption = 'Action'
      end
      object Label509: TLabel
        Left = 130
        Top = 212
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object Label512: TLabel
        Left = 130
        Top = 235
        Width = 56
        Height = 13
        Caption = 'Tow Length'
      end
      object Label560: TLabel
        Left = 130
        Top = 259
        Width = 47
        Height = 13
        Caption = 'Ordered :'
      end
      object Label561: TLabel
        Left = 130
        Top = 283
        Width = 37
        Height = 13
        Caption = 'Actual :'
      end
      object Bevel109: TBevel
        Left = 212
        Top = 241
        Width = 90
        Height = 2
      end
      object lblTowedJammerDecoyActual: TLabel
        Left = 212
        Top = 283
        Width = 12
        Height = 13
        Caption = '75'
      end
      object Label563: TLabel
        Left = 260
        Top = 283
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label564: TLabel
        Left = 260
        Top = 259
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object lblTowedJammerDecoyQuantity: TLabel
        Left = 212
        Top = 212
        Width = 6
        Height = 13
        Caption = '1'
      end
      object sbTowedJammerDecoyModeAuto: TSpeedButton
        Left = 18
        Top = 34
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Automatic'
      end
      object sbTowedJammerDecoyModeManual: TSpeedButton
        Left = 18
        Top = 57
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Manual'
      end
      object sbTowedJammerDecoyActionDeploy: TSpeedButton
        Left = 18
        Top = 228
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'Deploy'
      end
      object sbTowedJammerDecoyActionStow: TSpeedButton
        Left = 18
        Top = 253
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Stow'
      end
      object sbTowedJammerDecoyTargetingSpot: TSpeedButton
        Left = 130
        Top = 34
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Spot'
      end
      object sbTowedJammerDecoyTargetingTrack: TSpeedButton
        Left = 130
        Top = 59
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Track'
      end
      object sbTowedJammerDecoyModeOff: TSpeedButton
        Left = 18
        Top = 80
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Off'
      end
      object edtTowedJammerDecoyBearing: TEdit
        Left = 93
        Top = 131
        Width = 88
        Height = 21
        TabOrder = 0
        Text = '000'
      end
      object edtTowedJammerDecoySpotNumb: TEdit
        Left = 93
        Top = 155
        Width = 88
        Height = 21
        TabOrder = 1
        Text = '---'
      end
      object editTowedJammerDecoyOrdered: TEdit
        Left = 212
        Top = 255
        Width = 40
        Height = 21
        TabOrder = 2
        Text = '775'
      end
    end
    object grbFloatingDecoy: TGroupBox
      Left = 0
      Top = 0
      Width = 328
      Height = 371
      Align = alClient
      TabOrder = 5
      object Label502: TLabel
        Left = 3
        Top = 3
        Width = 57
        Height = 13
        Caption = 'Deployment'
      end
      object Bevel114: TBevel
        Left = 65
        Top = 10
        Width = 240
        Height = 3
      end
      object Label550: TLabel
        Left = 22
        Top = 22
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbFloatingDecoyQuantity: TLabel
        Left = 84
        Top = 22
        Width = 6
        Height = 13
        Caption = '2'
      end
      object btnFloatingDecoyDeploy: TButton
        Left = 226
        Top = 19
        Width = 80
        Height = 25
        Caption = 'Deploy'
        TabOrder = 0
      end
    end
    object grbAirborneChaff: TGroupBox
      Left = 0
      Top = 0
      Width = 328
      Height = 371
      Align = alClient
      TabOrder = 0
      object Label510: TLabel
        Left = 7
        Top = 5
        Width = 57
        Height = 13
        Caption = 'Deployment'
      end
      object Label511: TLabel
        Left = 18
        Top = 56
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object Label516: TLabel
        Left = 18
        Top = 33
        Width = 31
        Height = 13
        Caption = 'Type :'
      end
      object Bevel110: TBevel
        Left = 67
        Top = 12
        Width = 240
        Height = 3
      end
      object lbChaffAirboneQuantity: TLabel
        Left = 97
        Top = 56
        Width = 18
        Height = 13
        Caption = '100'
      end
      object btnAirboneChaffType: TSpeedButton
        Left = 284
        Top = 28
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
      object editChaffAirboneType: TEdit
        Left = 97
        Top = 29
        Width = 175
        Height = 21
        TabOrder = 0
        Text = 'Barrier'
      end
      object btnChaffAirboneDeploy: TButton
        Left = 18
        Top = 100
        Width = 80
        Height = 25
        Caption = 'Deploy'
        TabOrder = 1
      end
    end
    object grbAcousticDecoy: TGroupBox
      Left = 0
      Top = 0
      Width = 328
      Height = 371
      Align = alClient
      TabOrder = 3
      object Label513: TLabel
        Left = 3
        Top = 3
        Width = 57
        Height = 13
        Caption = 'Deployment'
      end
      object Bevel115: TBevel
        Left = 65
        Top = 10
        Width = 240
        Height = 3
      end
      object Label545: TLabel
        Left = 20
        Top = 209
        Width = 33
        Height = 13
        Caption = 'Mode :'
      end
      object Label548: TLabel
        Left = 92
        Top = 209
        Width = 3
        Height = 13
      end
      object Label551: TLabel
        Left = 43
        Top = 22
        Width = 30
        Height = 13
        Caption = 'Action'
      end
      object Label552: TLabel
        Left = 3
        Top = 98
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel116: TBevel
        Left = 43
        Top = 105
        Width = 260
        Height = 3
      end
      object Label553: TLabel
        Left = 35
        Top = 117
        Width = 48
        Height = 13
        Caption = 'Activation'
      end
      object Label554: TLabel
        Left = 145
        Top = 117
        Width = 55
        Height = 13
        Caption = 'Cycle Timer'
      end
      object Label555: TLabel
        Left = 20
        Top = 233
        Width = 68
        Height = 13
        Caption = 'Filter Setting :'
      end
      object Label556: TLabel
        Left = 92
        Top = 233
        Width = 3
        Height = 13
      end
      object btnComboAcousticDecoyMode: TSpeedButton
        Left = 278
        Top = 204
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
      object btnComboAcousticDecoyFilter: TSpeedButton
        Left = 278
        Top = 228
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
      object sbAcousticDecoyActionDeploy: TSpeedButton
        Left = 20
        Top = 41
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Deploy'
      end
      object sbAcousticDecoyActionStow: TSpeedButton
        Left = 20
        Top = 66
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Stow'
      end
      object sbAcousticDecoyActivationOn: TSpeedButton
        Left = 21
        Top = 136
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'On'
      end
      object sbAcousticDecoyActivationOff: TSpeedButton
        Left = 21
        Top = 161
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Off'
      end
      object sbAcousticDecoyCycleTimerOn: TSpeedButton
        Left = 133
        Top = 136
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'On'
      end
      object sbAcousticDecoyCycleTimerOff: TSpeedButton
        Left = 133
        Top = 161
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Off'
      end
      object edtAcousticDecoyMode: TEdit
        Left = 101
        Top = 205
        Width = 171
        Height = 21
        TabOrder = 0
        Text = 'Pulsed noise'
      end
      object edtAcousticDecoyFilter: TEdit
        Left = 101
        Top = 229
        Width = 171
        Height = 21
        TabOrder = 1
        Text = '2'
      end
    end
    object PanelRadarJamming: TPanel
      Left = 0
      Top = 0
      Width = 328
      Height = 371
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      object Label532: TLabel
        Left = 11
        Top = 104
        Width = 33
        Height = 13
        Caption = 'Mode :'
      end
      object Label558: TLabel
        Left = 24
        Top = 20
        Width = 48
        Height = 13
        Caption = 'Activation'
      end
      object Label557: TLabel
        Left = 3
        Top = 3
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel117: TBevel
        Left = 44
        Top = 12
        Width = 260
        Height = 3
      end
      object btnComboRadarJammingControlMode: TSpeedButton
        Left = 300
        Top = 99
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
      object sbRadarJammingControlActivationOn: TSpeedButton
        Left = 11
        Top = 39
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'On'
      end
      object sbRadarJammingControlActivationOff: TSpeedButton
        Left = 11
        Top = 64
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Off'
      end
      object PanelRadarJammingMode: TPanel
        Left = 0
        Top = 162
        Width = 329
        Height = 276
        BevelOuter = bvNone
        TabOrder = 0
        object gbRadarJammingSelectedTrackMode: TGroupBox
          Left = 0
          Top = 0
          Width = 329
          Height = 276
          Align = alClient
          TabOrder = 0
          object Label518: TLabel
            Left = 10
            Top = 36
            Width = 43
            Height = 13
            Caption = 'Bearing :'
          end
          object Label528: TLabel
            Left = 200
            Top = 36
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object Label530: TLabel
            Left = 200
            Top = 60
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object Label535: TLabel
            Left = 10
            Top = 60
            Width = 94
            Height = 13
            Caption = 'Center Frequency :'
          end
          object Label539: TLabel
            Left = 10
            Top = 84
            Width = 57
            Height = 13
            Caption = 'Bandwidth :'
          end
          object Label540: TLabel
            Left = 200
            Top = 84
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object Label541: TLabel
            Left = 10
            Top = 13
            Width = 33
            Height = 13
            Caption = 'Track :'
          end
          object btnRadarJammingModeSelectedTrackTrack: TSpeedButton
            Left = 200
            Top = 8
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
          object editRadarJammingModeSelectedTrackCenterFreq: TEdit
            Left = 126
            Top = 56
            Width = 53
            Height = 21
            TabOrder = 0
            Text = '10.0'
          end
          object editRadarJammingModeSelectedTrackBearing: TEdit
            Left = 126
            Top = 32
            Width = 53
            Height = 21
            TabOrder = 1
            Text = '000'
          end
          object editRadarJammingModeSelectedTrackBandwidth: TEdit
            Left = 126
            Top = 80
            Width = 53
            Height = 21
            TabOrder = 2
            Text = '2.0'
          end
          object editRadarJammingSelectedTrackModeTrack: TEdit
            Left = 126
            Top = 9
            Width = 53
            Height = 21
            TabOrder = 3
            Text = '1022'
          end
        end
        object gbRadarJammingSpotNumberMode: TGroupBox
          Left = 0
          Top = 0
          Width = 329
          Height = 276
          Align = alClient
          TabOrder = 1
          object Label519: TLabel
            Left = 14
            Top = 37
            Width = 43
            Height = 13
            Caption = 'Bearing :'
          end
          object Label521: TLabel
            Left = 193
            Top = 37
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object Label522: TLabel
            Left = 193
            Top = 60
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object Label523: TLabel
            Left = 14
            Top = 60
            Width = 94
            Height = 13
            Caption = 'Center Frequency :'
          end
          object Label524: TLabel
            Left = 14
            Top = 84
            Width = 57
            Height = 13
            Caption = 'Bandwidth :'
          end
          object Label525: TLabel
            Left = 193
            Top = 84
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object Label517: TLabel
            Left = 14
            Top = 13
            Width = 69
            Height = 13
            Caption = 'Spot Number :'
          end
          object editRadarJammingSpotNumberCenter: TEdit
            Left = 126
            Top = 56
            Width = 53
            Height = 21
            TabOrder = 0
            Text = '10.0'
          end
          object editRadarJammingSpotNumberBearing: TEdit
            Left = 126
            Top = 33
            Width = 53
            Height = 21
            TabOrder = 1
            Text = '000'
          end
          object editRadarJammingSpotNumberBandwidth: TEdit
            Left = 126
            Top = 80
            Width = 53
            Height = 21
            TabOrder = 2
            Text = '2.0'
          end
          object editRadarJammingSpotNumberSpot: TEdit
            Left = 126
            Top = 9
            Width = 53
            Height = 21
            TabOrder = 3
            Text = '---'
          end
        end
        object gbRadarJammingBarrageMode: TGroupBox
          Left = 0
          Top = 0
          Width = 329
          Height = 276
          Align = alClient
          TabOrder = 2
          object Label531: TLabel
            Left = 14
            Top = 18
            Width = 43
            Height = 13
            Caption = 'Bearing :'
          end
          object Label533: TLabel
            Left = 193
            Top = 18
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object Label534: TLabel
            Left = 193
            Top = 41
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object Label536: TLabel
            Left = 14
            Top = 41
            Width = 94
            Height = 13
            Caption = 'Center Frequency :'
          end
          object Label537: TLabel
            Left = 14
            Top = 65
            Width = 57
            Height = 13
            Caption = 'Bandwidth :'
          end
          object Label538: TLabel
            Left = 193
            Top = 65
            Width = 19
            Height = 13
            Caption = 'Mhz'
          end
          object editRadarJammingBarrageCenter: TEdit
            Left = 126
            Top = 37
            Width = 53
            Height = 21
            TabOrder = 0
            Text = '---'
          end
          object editRadarJammingBarrageBearing: TEdit
            Left = 126
            Top = 14
            Width = 53
            Height = 21
            TabOrder = 1
            Text = '000'
          end
          object editRadarJammingBarrageBandwidth: TEdit
            Left = 126
            Top = 61
            Width = 53
            Height = 21
            TabOrder = 2
            Text = '---'
          end
        end
      end
      object cbRadarJammingControlMode: TComboBox
        Left = 126
        Top = 100
        Width = 168
        Height = 21
        ItemIndex = 0
        TabOrder = 1
        Text = 'Barrage'
        Items.Strings = (
          'Barrage'
          'Spot Jamming - Frequency'
          'Spot Jamming - Spot Number'
          'Spot Jamming - Selected Track')
      end
    end
  end
end
