inherited fmWeapon: TfmWeapon
  Width = 346
  Height = 497
  ExplicitWidth = 346
  ExplicitHeight = 497
  object PanelTacticalWeapons: TPanel
    Left = 0
    Top = 22
    Width = 346
    Height = 475
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object grbWakeHomingTorpedos: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 7
      object Label400: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblWakeHomingStatus: TLabel
        Left = 22
        Top = 25
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label418: TLabel
        Left = 126
        Top = 25
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblWakeHomingQuantity: TLabel
        Left = 182
        Top = 25
        Width = 6
        Height = 13
        Caption = '8'
      end
      object Label420: TLabel
        Left = 3
        Top = 105
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel82: TBevel
        Left = 42
        Top = 112
        Width = 260
        Height = 3
      end
      object Label421: TLabel
        Left = 22
        Top = 131
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label422: TLabel
        Left = 3
        Top = 249
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel84: TBevel
        Left = 40
        Top = 258
        Width = 260
        Height = 3
      end
      object Label423: TLabel
        Left = 43
        Top = 268
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label425: TLabel
        Left = 150
        Top = 268
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label429: TLabel
        Left = 22
        Top = 153
        Width = 45
        Height = 13
        Caption = 'Identity :'
      end
      object lblWakeHomingTargetIdentity: TLabel
        Left = 127
        Top = 153
        Width = 38
        Height = 13
        Caption = 'Pending'
      end
      object Label431: TLabel
        Left = 22
        Top = 176
        Width = 78
        Height = 13
        Caption = 'Target Bearing :'
      end
      object Label435: TLabel
        Left = 22
        Top = 198
        Width = 80
        Height = 13
        Caption = 'Launch Bearing :'
      end
      object Label436: TLabel
        Left = 22
        Top = 221
        Width = 74
        Height = 13
        Caption = 'Seeker Range :'
      end
      object lbWakeHomingTargetTarget: TLabel
        Left = 127
        Top = 176
        Width = 18
        Height = 13
        Caption = '144'
      end
      object Label440: TLabel
        Left = 185
        Top = 176
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label441: TLabel
        Left = 185
        Top = 198
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label442: TLabel
        Left = 185
        Top = 221
        Width = 27
        Height = 13
        Caption = 'yards'
      end
      object Bevel86: TBevel
        Left = 40
        Top = 11
        Width = 260
        Height = 3
      end
      object Label443: TLabel
        Left = 3
        Top = 52
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel87: TBevel
        Left = 39
        Top = 60
        Width = 260
        Height = 3
      end
      object Label444: TLabel
        Left = 22
        Top = 76
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object btnWakeHomingTargetTrack: TSpeedButton
        Left = 185
        Top = 126
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
      object sbWakeHomingDisplayRangeShow: TSpeedButton
        Left = 24
        Top = 283
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbWakeHomingDisplayRangeHide: TSpeedButton
        Left = 24
        Top = 307
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbWakeHomingDisplayBlindShow: TSpeedButton
        Left = 138
        Top = 283
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbWakeHomingDisplayBlindHide: TSpeedButton
        Left = 138
        Top = 307
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object edtWakeHomingTargetTrack: TEdit
        Left = 126
        Top = 127
        Width = 53
        Height = 21
        TabOrder = 0
        Text = '1010'
      end
      object btnWakeHomingLaunch: TButton
        Left = 242
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
      object edtWakeHomingControlSalvo: TEdit
        Left = 126
        Top = 73
        Width = 53
        Height = 21
        TabOrder = 2
        Text = '1'
      end
      object editWakeHomingTargetLaunch: TEdit
        Left = 126
        Top = 194
        Width = 36
        Height = 21
        TabOrder = 3
        Text = '144'
      end
      object editWakeHomingTargetSeeker: TEdit
        Left = 126
        Top = 217
        Width = 36
        Height = 21
        TabOrder = 4
        Text = '6076'
      end
      object btnWakeHomingTargetSeekerDefault: TButton
        Left = 242
        Top = 217
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 5
      end
    end
    object grbWireGuidedTorpedo: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 8
      object Label326: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblWireGuidedTorpedoStatus: TLabel
        Left = 24
        Top = 31
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label372: TLabel
        Left = 117
        Top = 31
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblWireGuidedTorpedoQuantity: TLabel
        Left = 173
        Top = 31
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label401: TLabel
        Left = 3
        Top = 60
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel81: TBevel
        Left = 43
        Top = 69
        Width = 260
        Height = 3
      end
      object Label402: TLabel
        Left = 24
        Top = 83
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label404: TLabel
        Left = 3
        Top = 187
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel83: TBevel
        Left = 43
        Top = 195
        Width = 260
        Height = 3
      end
      object Label408: TLabel
        Left = 46
        Top = 199
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label417: TLabel
        Left = 153
        Top = 199
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label424: TLabel
        Left = 24
        Top = 103
        Width = 45
        Height = 13
        Caption = 'Identity :'
      end
      object lblWireGuidedTorpedoTargetIdentity: TLabel
        Left = 116
        Top = 103
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label426: TLabel
        Left = 24
        Top = 124
        Width = 41
        Height = 13
        Caption = 'Course :'
      end
      object Label427: TLabel
        Left = 24
        Top = 144
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object Label428: TLabel
        Left = 24
        Top = 165
        Width = 44
        Height = 13
        Caption = 'Altitude :'
      end
      object lblWireGuidedTorpedoTargetCourse: TLabel
        Left = 116
        Top = 124
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lblWireGuidedTorpedoTargetGround: TLabel
        Left = 116
        Top = 144
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lblWireGuidedTorpedoTargetDepth: TLabel
        Left = 116
        Top = 165
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label432: TLabel
        Left = 179
        Top = 124
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label433: TLabel
        Left = 179
        Top = 144
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label434: TLabel
        Left = 179
        Top = 165
        Width = 20
        Height = 13
        Caption = 'feet'
      end
      object Bevel85: TBevel
        Left = 40
        Top = 11
        Width = 260
        Height = 3
      end
      object btnlWireGuidedTorpedoTargetTrack: TSpeedButton
        Left = 179
        Top = 78
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
      object sblWireGuidedTorpedoDisplayRangeShow: TSpeedButton
        Left = 24
        Top = 221
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sblWireGuidedTorpedodDisplayRangeHide: TSpeedButton
        Left = 24
        Top = 245
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sblWireGuidedTorpedoDisplayBlindShow: TSpeedButton
        Left = 141
        Top = 221
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sblWireGuidedTorpedoDisplayBlindHide: TSpeedButton
        Left = 141
        Top = 245
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object editlWireGuidedTorpedoTargetTrack: TEdit
        Left = 117
        Top = 79
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnlWireGuidedTorpedoLaunch: TButton
        Left = 235
        Top = 465
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
    end
    object grbTacticalMissiles: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 4
      object Label289: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblTacticalMissileStatus: TLabel
        Left = 24
        Top = 25
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label294: TLabel
        Left = 116
        Top = 25
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblTacticalMissileStatusQuantity: TLabel
        Left = 172
        Top = 25
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label296: TLabel
        Left = 3
        Top = 181
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel59: TBevel
        Left = 40
        Top = 188
        Width = 190
        Height = 2
      end
      object Label302: TLabel
        Left = 22
        Top = 207
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object Label304: TLabel
        Left = 9
        Top = 363
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel62: TBevel
        Left = 46
        Top = 371
        Width = 190
        Height = 2
      end
      object Label486: TLabel
        Left = 45
        Top = 382
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label494: TLabel
        Left = 198
        Top = 382
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Bevel107: TBevel
        Left = 40
        Top = 10
        Width = 190
        Height = 2
      end
      object Label295: TLabel
        Left = 3
        Top = 52
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel60: TBevel
        Left = 40
        Top = 60
        Width = 190
        Height = 2
      end
      object Label303: TLabel
        Left = 176
        Top = 142
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label496: TLabel
        Left = 22
        Top = 237
        Width = 77
        Height = 13
        Caption = 'Cruise Altitude :'
      end
      object Label497: TLabel
        Left = 22
        Top = 268
        Width = 74
        Height = 13
        Caption = 'Seeker Range :'
      end
      object Label498: TLabel
        Left = 161
        Top = 237
        Width = 20
        Height = 13
        Caption = 'feet'
      end
      object Label499: TLabel
        Left = 161
        Top = 268
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object Label500: TLabel
        Left = 3
        Top = 298
        Width = 51
        Height = 13
        Caption = 'Waypoints'
      end
      object Bevel108: TBevel
        Left = 58
        Top = 312
        Width = 175
        Height = 2
      end
      object btnTacticalMissileTargetTrack: TSpeedButton
        Left = 179
        Top = 76
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
      object btnTacticalMissileTargetAimpoint: TSpeedButton
        Left = 287
        Top = 105
        Width = 23
        Height = 22
        Caption = '+'
      end
      object sbTacticalMissileDisplayRangeShow: TSpeedButton
        Left = 24
        Top = 401
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbTacticalMissileDisplayRangeHide: TSpeedButton
        Left = 24
        Top = 425
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbTacticalMissileDisplayBlindShow: TSpeedButton
        Left = 187
        Top = 401
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbTacticalMissileDisplayBlindHide: TSpeedButton
        Left = 187
        Top = 425
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object editTacticalMissileControlSalvo: TEdit
        Left = 102
        Top = 203
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnTacticalMissileLaunch: TButton
        Left = 230
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
      object rdoTacticalMissileTargetTrack: TRadioButton
        Left = 24
        Top = 79
        Width = 113
        Height = 17
        Caption = 'Track :'
        TabOrder = 2
      end
      object rdoTacticalMissileTargetAimpoint: TRadioButton
        Left = 24
        Top = 108
        Width = 113
        Height = 17
        Caption = 'Aimpoint :'
        TabOrder = 3
      end
      object rdoTacticalMissileTargetBearing: TRadioButton
        Left = 24
        Top = 140
        Width = 113
        Height = 17
        Caption = 'Bearing :'
        TabOrder = 4
      end
      object editTacticalMissileTargetTrack: TEdit
        Left = 116
        Top = 77
        Width = 57
        Height = 21
        TabOrder = 5
      end
      object editTacticalMissileTargetAimpoint: TEdit
        Left = 116
        Top = 106
        Width = 125
        Height = 21
        TabOrder = 6
      end
      object editTacticalMissileTargetBearing: TEdit
        Left = 116
        Top = 138
        Width = 57
        Height = 21
        TabOrder = 7
      end
      object btnTacticalMissileTargetBearing: TButton
        Left = 230
        Top = 136
        Width = 80
        Height = 25
        Caption = 'Brg to Hook'
        TabOrder = 8
      end
      object editTacticalMissileControlCruise: TEdit
        Left = 102
        Top = 233
        Width = 53
        Height = 21
        TabOrder = 9
      end
      object editTacticalMissileControlSeeker: TEdit
        Left = 102
        Top = 264
        Width = 53
        Height = 21
        TabOrder = 10
      end
      object btnTacticalMissileControlCruise: TButton
        Left = 187
        Top = 231
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 11
      end
      object btnTacticalMissileControlSeeker: TButton
        Left = 187
        Top = 262
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 12
      end
      object btnTacticalMissileWaypointEdit: TButton
        Left = 24
        Top = 327
        Width = 80
        Height = 25
        Caption = 'Edit'
        TabOrder = 13
      end
      object btnTacticalMissileWaypointAdd: TButton
        Left = 127
        Top = 327
        Width = 80
        Height = 25
        Caption = 'Add'
        TabOrder = 14
      end
      object btnTacticalMissileWaypointCancel: TButton
        Left = 230
        Top = 327
        Width = 80
        Height = 25
        Caption = 'Cancel'
        TabOrder = 15
      end
    end
    object grbTacticalAcousticTorpedos: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 12
      object Label439: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblTacticalAcousticTorpedosStatus: TLabel
        Left = 24
        Top = 30
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label455: TLabel
        Left = 126
        Top = 30
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbTacticalAcousticTorpedosQuantity: TLabel
        Left = 182
        Top = 30
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label460: TLabel
        Left = 3
        Top = 109
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel91: TBevel
        Left = 41
        Top = 117
        Width = 260
        Height = 3
      end
      object Label461: TLabel
        Left = 24
        Top = 131
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label462: TLabel
        Left = 2
        Top = 212
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel92: TBevel
        Left = 39
        Top = 221
        Width = 260
        Height = 3
      end
      object Label463: TLabel
        Left = 48
        Top = 225
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label464: TLabel
        Left = 149
        Top = 225
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label465: TLabel
        Left = 24
        Top = 161
        Width = 45
        Height = 13
        Caption = 'Identity :'
      end
      object lbTacticalAcousticTorpedosTargetIdentity: TLabel
        Left = 127
        Top = 161
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Bevel93: TBevel
        Left = 40
        Top = 11
        Width = 260
        Height = 3
      end
      object Label459: TLabel
        Left = 3
        Top = 57
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel94: TBevel
        Left = 39
        Top = 64
        Width = 260
        Height = 3
      end
      object Label476: TLabel
        Left = 24
        Top = 83
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object btnTacticalAcousticTorpedosTargetTrack: TSpeedButton
        Left = 185
        Top = 126
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
      object sbTacticalAcousticTorpedosDisplayRangeShow: TSpeedButton
        Left = 25
        Top = 245
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbTacticalAcousticTorpedosDisplayRangeHide: TSpeedButton
        Left = 25
        Top = 269
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbTacticalAcousticTorpedosDisplayBlindShow: TSpeedButton
        Left = 137
        Top = 245
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbTacticalAcousticTorpedosDisplayBlindHide: TSpeedButton
        Left = 137
        Top = 269
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object editTacticalAcousticTorpedosTargetTrack: TEdit
        Left = 126
        Top = 127
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnTacticalAcousticTorpedosLaunch: TButton
        Left = 242
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
      object editTacticalAcousticTorpedosSalvo: TEdit
        Left = 125
        Top = 79
        Width = 53
        Height = 21
        TabOrder = 2
      end
    end
    object grbStraightRunningTorpedos: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 6
      object Label430: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblStatusStraightRunningTorpedos: TLabel
        Left = 22
        Top = 31
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label438: TLabel
        Left = 125
        Top = 31
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbStraightRunningTorpedosQuantity: TLabel
        Left = 181
        Top = 31
        Width = 12
        Height = 13
        Caption = '12'
      end
      object Label445: TLabel
        Left = 3
        Top = 56
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel88: TBevel
        Left = 40
        Top = 64
        Width = 260
        Height = 3
      end
      object Label446: TLabel
        Left = 22
        Top = 84
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label447: TLabel
        Left = 3
        Top = 192
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel89: TBevel
        Left = 40
        Top = 199
        Width = 260
        Height = 3
      end
      object Label448: TLabel
        Left = 47
        Top = 203
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label449: TLabel
        Left = 150
        Top = 203
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label450: TLabel
        Left = 24
        Top = 104
        Width = 45
        Height = 13
        Caption = 'Identity :'
      end
      object lbStraightRunningTorpedosTargetIdentity: TLabel
        Left = 124
        Top = 104
        Width = 38
        Height = 13
        Caption = 'Pending'
      end
      object Label452: TLabel
        Left = 24
        Top = 123
        Width = 41
        Height = 13
        Caption = 'Course :'
      end
      object Label453: TLabel
        Left = 24
        Top = 141
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object Label454: TLabel
        Left = 24
        Top = 160
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object lbStraightRunningTorpedosTargetCourse: TLabel
        Left = 124
        Top = 123
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label456: TLabel
        Left = 184
        Top = 123
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label457: TLabel
        Left = 184
        Top = 141
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label458: TLabel
        Left = 184
        Top = 160
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Bevel90: TBevel
        Left = 40
        Top = 11
        Width = 260
        Height = 3
      end
      object lbStraightRunningTorpedosTargetGround: TLabel
        Left = 124
        Top = 141
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbStraightRunningTorpedosTargetDepth: TLabel
        Left = 124
        Top = 160
        Width = 12
        Height = 13
        Caption = '---'
      end
      object btnStraightRunningTorpedosTargetTrack: TSpeedButton
        Left = 184
        Top = 79
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
      object sbStraightRunningTorpedosDisplayRangeShow: TSpeedButton
        Left = 24
        Top = 223
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbStraightRunningTorpedosDisplayRangeHide: TSpeedButton
        Left = 24
        Top = 247
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbStraightRunningTorpedosDisplayBlindShow: TSpeedButton
        Left = 134
        Top = 223
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbStraightRunningTorpedosDisplayBlindHide: TSpeedButton
        Left = 134
        Top = 247
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object edtStraightRunningTorpedosTargetTrack: TEdit
        Left = 125
        Top = 80
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnStraightRunningTorpedosLaunch: TButton
        Left = 242
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
    end
    object grbMines: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 14
      object Label272: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblStatusMines: TLabel
        Left = 22
        Top = 31
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label288: TLabel
        Left = 94
        Top = 31
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbMinesQuantity: TLabel
        Left = 150
        Top = 31
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label291: TLabel
        Left = 3
        Top = 60
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel58: TBevel
        Left = 40
        Top = 67
        Width = 260
        Height = 3
      end
      object Label292: TLabel
        Left = 22
        Top = 90
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object Bevel61: TBevel
        Left = 40
        Top = 10
        Width = 260
        Height = 3
      end
      object editMinesControlSalvo: TEdit
        Left = 94
        Top = 86
        Width = 53
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object btnMinesDeploy: TButton
        Left = 236
        Top = 193
        Width = 80
        Height = 25
        Caption = 'Deploy'
        TabOrder = 1
      end
    end
    object grbHybridMissile: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 5
      object Label24: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblHybridMissileStatus: TLabel
        Left = 24
        Top = 25
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label38: TLabel
        Left = 116
        Top = 25
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblHybridMissileQuantity: TLabel
        Left = 172
        Top = 25
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label40: TLabel
        Left = 3
        Top = 181
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel7: TBevel
        Left = 40
        Top = 188
        Width = 190
        Height = 2
      end
      object Label41: TLabel
        Left = 22
        Top = 207
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object Label42: TLabel
        Left = 9
        Top = 363
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel8: TBevel
        Left = 46
        Top = 371
        Width = 190
        Height = 2
      end
      object Label43: TLabel
        Left = 45
        Top = 382
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label44: TLabel
        Left = 198
        Top = 382
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Bevel9: TBevel
        Left = 40
        Top = 10
        Width = 190
        Height = 2
      end
      object Label45: TLabel
        Left = 3
        Top = 52
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel10: TBevel
        Left = 40
        Top = 60
        Width = 190
        Height = 2
      end
      object Label48: TLabel
        Left = 176
        Top = 142
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label49: TLabel
        Left = 22
        Top = 237
        Width = 77
        Height = 13
        Caption = 'Cruise Altitude :'
      end
      object Label50: TLabel
        Left = 22
        Top = 268
        Width = 74
        Height = 13
        Caption = 'Seeker Range :'
      end
      object Label51: TLabel
        Left = 161
        Top = 237
        Width = 20
        Height = 13
        Caption = 'feet'
      end
      object Label52: TLabel
        Left = 161
        Top = 268
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object btnSearchHybridMissileTargetTrack: TSpeedButton
        Left = 179
        Top = 76
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
      object btnAddHybridMissileTargetAimpoint: TSpeedButton
        Left = 287
        Top = 105
        Width = 23
        Height = 22
        Caption = '+'
      end
      object sbHybridMissileDisplayRangeShow: TSpeedButton
        Left = 22
        Top = 402
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbHybridMissileDisplayRangeHide: TSpeedButton
        Left = 22
        Top = 426
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbHybridMissileDisplayBlindZonesShow: TSpeedButton
        Left = 187
        Top = 402
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbHybridMissileDisplayBlindZonesHide: TSpeedButton
        Left = 187
        Top = 426
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object edtHybridMissileControlSalvoSize: TEdit
        Left = 102
        Top = 203
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnHybridMissileLaunch: TButton
        Left = 230
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
      object rdoHybridMissileTargetTrack: TRadioButton
        Left = 24
        Top = 79
        Width = 113
        Height = 17
        Caption = 'Track :'
        TabOrder = 2
      end
      object rdoHybridMissileTargetAimpoint: TRadioButton
        Left = 24
        Top = 108
        Width = 113
        Height = 17
        Caption = 'Aimpoint :'
        TabOrder = 3
      end
      object rdoHybridMissileTargetBearing: TRadioButton
        Left = 24
        Top = 140
        Width = 113
        Height = 17
        Caption = 'Bearing :'
        TabOrder = 4
      end
      object edtHybridMissiletargetTrack: TEdit
        Left = 116
        Top = 77
        Width = 57
        Height = 21
        TabOrder = 5
      end
      object edtHybridMissiletargetAimpoint: TEdit
        Left = 116
        Top = 106
        Width = 125
        Height = 21
        TabOrder = 6
      end
      object edtHybridMissiletargetBearing: TEdit
        Left = 116
        Top = 138
        Width = 57
        Height = 21
        TabOrder = 7
      end
      object btnBringToHookHybridMissileTargetBearing: TButton
        Left = 230
        Top = 136
        Width = 80
        Height = 25
        Caption = 'Brg to Hook'
        TabOrder = 8
      end
      object edtHybridMissileControlCruiseAltitude: TEdit
        Left = 102
        Top = 233
        Width = 53
        Height = 21
        TabOrder = 9
      end
      object edtHybridMissileControlSeekerRange: TEdit
        Left = 102
        Top = 264
        Width = 53
        Height = 21
        TabOrder = 10
      end
      object btnDefaultHybridMissileControlCruiseAltitude: TButton
        Left = 187
        Top = 231
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 11
      end
      object btnDefaultHybridMissileControlSeekerRange: TButton
        Left = 187
        Top = 262
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 12
      end
    end
    object grbBombDepthCharge: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 3
      object Label475: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblBombStatus: TLabel
        Left = 22
        Top = 31
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label485: TLabel
        Left = 94
        Top = 31
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbBombQuantity: TLabel
        Left = 150
        Top = 31
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label487: TLabel
        Left = 3
        Top = 122
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel102: TBevel
        Left = 40
        Top = 129
        Width = 260
        Height = 3
      end
      object Label490: TLabel
        Left = 22
        Top = 154
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object Label491: TLabel
        Left = 3
        Top = 60
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel104: TBevel
        Left = 40
        Top = 68
        Width = 260
        Height = 3
      end
      object Label492: TLabel
        Left = 3
        Top = 192
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel105: TBevel
        Left = 40
        Top = 200
        Width = 260
        Height = 3
      end
      object Label493: TLabel
        Left = 38
        Top = 208
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label495: TLabel
        Left = 22
        Top = 90
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Bevel106: TBevel
        Left = 40
        Top = 10
        Width = 260
        Height = 3
      end
      object btnBombTarget: TSpeedButton
        Left = 172
        Top = 85
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
      object sbBombDisplayRangeShow: TSpeedButton
        Left = 22
        Top = 225
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbBombDisplayRangeHide: TSpeedButton
        Left = 22
        Top = 249
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object editBombControlSalvo: TEdit
        Left = 104
        Top = 150
        Width = 62
        Height = 21
        TabOrder = 0
      end
      object btnBombDrop: TButton
        Left = 222
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Drop'
        TabOrder = 1
      end
      object editBombTargetTrack: TEdit
        Left = 104
        Top = 86
        Width = 62
        Height = 21
        TabOrder = 2
      end
    end
    object grbAirDroppedVECTAC: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 15
      object Label367: TLabel
        Left = 3
        Top = 3
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel72: TBevel
        Left = 40
        Top = 10
        Width = 260
        Height = 3
      end
      object Label368: TLabel
        Left = 24
        Top = 33
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label369: TLabel
        Left = 3
        Top = 203
        Width = 76
        Height = 13
        Caption = 'Weapon Carrier'
      end
      object Bevel75: TBevel
        Left = 80
        Top = 210
        Width = 215
        Height = 3
      end
      object Label371: TLabel
        Left = 24
        Top = 230
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object Label375: TLabel
        Left = 24
        Top = 261
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object Label376: TLabel
        Left = 24
        Top = 292
        Width = 82
        Height = 13
        Caption = 'Adviced Course :'
      end
      object Label377: TLabel
        Left = 24
        Top = 323
        Width = 91
        Height = 13
        Caption = 'Drop Point Offset :'
      end
      object Label378: TLabel
        Left = 24
        Top = 355
        Width = 57
        Height = 13
        Caption = 'Time to go :'
      end
      object Label379: TLabel
        Left = 3
        Top = 378
        Width = 40
        Height = 13
        Caption = 'Weapon'
      end
      object Bevel76: TBevel
        Left = 45
        Top = 386
        Width = 260
        Height = 3
      end
      object Label380: TLabel
        Left = 24
        Top = 408
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lbVectacWeaponCarrierAdviced: TLabel
        Left = 125
        Top = 292
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacWeaponCarrierTime: TLabel
        Left = 125
        Top = 355
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label383: TLabel
        Left = 185
        Top = 128
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label384: TLabel
        Left = 185
        Top = 261
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label385: TLabel
        Left = 185
        Top = 323
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object Label386: TLabel
        Left = 24
        Top = 56
        Width = 45
        Height = 13
        Caption = 'Identity :'
      end
      object Label387: TLabel
        Left = 24
        Top = 80
        Width = 83
        Height = 13
        Caption = 'Propulsion Type :'
      end
      object Label388: TLabel
        Left = 24
        Top = 104
        Width = 44
        Height = 13
        Caption = 'Doppler :'
      end
      object Label389: TLabel
        Left = 24
        Top = 128
        Width = 41
        Height = 13
        Caption = 'Course :'
      end
      object Label390: TLabel
        Left = 24
        Top = 152
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object Label391: TLabel
        Left = 24
        Top = 176
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object Label392: TLabel
        Left = 185
        Top = 152
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label393: TLabel
        Left = 185
        Top = 177
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label394: TLabel
        Left = 185
        Top = 292
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label395: TLabel
        Left = 185
        Top = 355
        Width = 30
        Height = 13
        Caption = 'mm:ss'
      end
      object Label396: TLabel
        Left = 24
        Top = 430
        Width = 62
        Height = 13
        Caption = 'Expiry Time :'
      end
      object lbVectacWeaponExpiry: TLabel
        Left = 129
        Top = 430
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label398: TLabel
        Left = 184
        Top = 430
        Width = 30
        Height = 13
        Caption = 'mm:ss'
      end
      object lbVectacTargetIdentity: TLabel
        Left = 125
        Top = 56
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacTargetPropulsion: TLabel
        Left = 125
        Top = 80
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacTargetDoppler: TLabel
        Left = 125
        Top = 104
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacTargetCourse: TLabel
        Left = 125
        Top = 128
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacTargetGround: TLabel
        Left = 125
        Top = 152
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbVectacTargetDepth: TLabel
        Left = 125
        Top = 176
        Width = 12
        Height = 13
        Caption = '---'
      end
      object btnVectacTargetTrack: TSpeedButton
        Left = 185
        Top = 28
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
      object btnVectacWeaponCarrierName: TSpeedButton
        Left = 299
        Top = 224
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
      object btnVectacWeaponName: TSpeedButton
        Left = 299
        Top = 403
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
      object btnVectacPlan: TButton
        Left = 3
        Top = 469
        Width = 80
        Height = 25
        Caption = 'Plan'
        TabOrder = 0
      end
      object btnVectacConfirm: TButton
        Left = 202
        Top = 469
        Width = 120
        Height = 25
        Caption = 'Confirm Weapon Drop'
        TabOrder = 1
      end
      object btnVectacCancel: TButton
        Left = 99
        Top = 469
        Width = 80
        Height = 25
        Caption = 'Cancel'
        TabOrder = 2
      end
      object editVectacTargetTrack: TEdit
        Left = 125
        Top = 29
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object editVectacWeaponCarrierName: TEdit
        Left = 125
        Top = 226
        Width = 168
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object editVectacWeaponCarrierGround: TEdit
        Left = 125
        Top = 257
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object editVectacWeaponCarrierDrop: TEdit
        Left = 125
        Top = 319
        Width = 50
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object btnVectacWeaponCarrierGround: TButton
        Left = 242
        Top = 255
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 7
      end
      object btnVectacWeaponCarrierDrop: TButton
        Left = 242
        Top = 317
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 8
      end
      object editVectacWeaponName: TEdit
        Left = 125
        Top = 404
        Width = 168
        Height = 21
        Enabled = False
        TabOrder = 9
        Text = '(none)'
      end
    end
    object grbAirDroppedTorpedo: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 9
      object Label36: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblAirDroppedStatus: TLabel
        Left = 22
        Top = 25
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label53: TLabel
        Left = 130
        Top = 25
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblAirDroppedQuantity: TLabel
        Left = 195
        Top = 25
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label81: TLabel
        Left = 3
        Top = 158
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel11: TBevel
        Left = 41
        Top = 166
        Width = 260
        Height = 3
      end
      object Label82: TLabel
        Left = 24
        Top = 187
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label83: TLabel
        Left = 3
        Top = 383
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel12: TBevel
        Left = 39
        Top = 392
        Width = 260
        Height = 3
      end
      object Label84: TLabel
        Left = 45
        Top = 400
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label85: TLabel
        Left = 148
        Top = 400
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label86: TLabel
        Left = 23
        Top = 213
        Width = 34
        Height = 13
        Caption = 'Force :'
      end
      object lblAirDproppedTargetForce: TLabel
        Left = 130
        Top = 213
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Bevel13: TBevel
        Left = 40
        Top = 11
        Width = 260
        Height = 3
      end
      object Label89: TLabel
        Left = 3
        Top = 49
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel14: TBevel
        Left = 41
        Top = 60
        Width = 260
        Height = 3
      end
      object Label90: TLabel
        Left = 24
        Top = 78
        Width = 72
        Height = 13
        Caption = 'Search radius :'
      end
      object Label94: TLabel
        Left = 24
        Top = 106
        Width = 71
        Height = 13
        Caption = 'Search depth :'
      end
      object Label96: TLabel
        Left = 23
        Top = 135
        Width = 72
        Height = 13
        Caption = 'Search ceiling :'
      end
      object Label99: TLabel
        Left = 196
        Top = 78
        Width = 27
        Height = 13
        Caption = 'yards'
      end
      object Label100: TLabel
        Left = 196
        Top = 106
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label101: TLabel
        Left = 196
        Top = 135
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object btnAirDroppesTargetTrack: TSpeedButton
        Left = 187
        Top = 182
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
      object Label102: TLabel
        Left = 23
        Top = 237
        Width = 41
        Height = 13
        Caption = 'Course :'
      end
      object lblAirDproppedTargetCourse: TLabel
        Left = 130
        Top = 237
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label109: TLabel
        Left = 22
        Top = 261
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object lblAirDproppedTargetGroundSpeed: TLabel
        Left = 130
        Top = 261
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label111: TLabel
        Left = 22
        Top = 286
        Width = 36
        Height = 13
        Caption = 'Depth :'
      end
      object lblAirDproppedTargetDepth: TLabel
        Left = 130
        Top = 286
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label114: TLabel
        Left = 187
        Top = 237
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label115: TLabel
        Left = 187
        Top = 261
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label116: TLabel
        Left = 187
        Top = 286
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label113: TLabel
        Left = 3
        Top = 308
        Width = 73
        Height = 13
        Caption = 'Launch Bearing'
      end
      object Bevel15: TBevel
        Left = 82
        Top = 317
        Width = 222
        Height = 3
      end
      object Label117: TLabel
        Left = 24
        Top = 360
        Width = 43
        Height = 13
        Caption = 'Bearing :'
      end
      object Label118: TLabel
        Left = 196
        Top = 360
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object sbAirDroppesDisplayRangeShow: TSpeedButton
        Left = 24
        Top = 422
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbAirDroppesDisplayRangeHide: TSpeedButton
        Left = 24
        Top = 446
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbAirDroppesDisplayBilndZonesShow: TSpeedButton
        Left = 136
        Top = 422
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbAirDropeedBilndZonesHide: TSpeedButton
        Left = 136
        Top = 446
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object edtAirDroppedTargetTrack: TEdit
        Left = 130
        Top = 183
        Width = 53
        Height = 21
        TabOrder = 0
      end
      object btnAirDroppedLaunch: TButton
        Left = 242
        Top = 485
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 1
      end
      object edtAirDroppedControlSearchRadius: TEdit
        Left = 130
        Top = 74
        Width = 60
        Height = 21
        TabOrder = 2
      end
      object edtAirDroppedControlSearchDepth: TEdit
        Left = 130
        Top = 102
        Width = 60
        Height = 21
        TabOrder = 3
      end
      object edtAirDroppedControlSearchCeiling: TEdit
        Left = 130
        Top = 131
        Width = 60
        Height = 21
        TabOrder = 4
      end
      object btnDefaultAirDroppedControlSearchCeiling: TButton
        Left = 242
        Top = 129
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 5
      end
      object btnDefaultAirDroppedSearchDepth: TButton
        Left = 242
        Top = 98
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 6
      end
      object edtAirDroppedLaunchBearing: TEdit
        Left = 130
        Top = 356
        Width = 60
        Height = 21
        TabOrder = 7
      end
      object cbAirDroppedUseLaunchPlatformHeading: TCheckBox
        Left = 24
        Top = 335
        Width = 166
        Height = 17
        Caption = 'Use launch platform heading'
        TabOrder = 8
      end
      object btnPlanAirDroppedTorpedo: TButton
        Left = 13
        Top = 485
        Width = 80
        Height = 25
        Caption = 'Plan'
        TabOrder = 9
      end
      object btnCancelAirDroppedTorpedo: TButton
        Left = 99
        Top = 485
        Width = 80
        Height = 25
        Caption = 'Cancel'
        TabOrder = 10
      end
    end
    object grbAcousticTorpedo: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 11
      object Label325: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Bevel67: TBevel
        Left = 40
        Top = 10
        Width = 278
        Height = 3
      end
      object lblAcousticTorpedoStatus: TLabel
        Left = 25
        Top = 28
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label328: TLabel
        Left = 95
        Top = 28
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lblAcousticTorpedoQuantity: TLabel
        Left = 151
        Top = 28
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label330: TLabel
        Left = 3
        Top = 50
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel68: TBevel
        Left = 41
        Top = 57
        Width = 278
        Height = 3
      end
      object Label331: TLabel
        Left = 25
        Top = 79
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label332: TLabel
        Left = 3
        Top = 103
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel69: TBevel
        Left = 41
        Top = 110
        Width = 278
        Height = 3
      end
      object Label333: TLabel
        Left = 3
        Top = 344
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel70: TBevel
        Left = 43
        Top = 352
        Width = 190
        Height = 2
      end
      object Label336: TLabel
        Left = 25
        Top = 128
        Width = 31
        Height = 13
        Caption = 'Tube :'
      end
      object Label337: TLabel
        Left = 25
        Top = 154
        Width = 62
        Height = 13
        Caption = 'Firing Mode :'
      end
      object Label338: TLabel
        Left = 25
        Top = 180
        Width = 75
        Height = 13
        Caption = 'Run-out Mode :'
      end
      object Label339: TLabel
        Left = 25
        Top = 206
        Width = 75
        Height = 13
        Caption = 'Search Radius :'
      end
      object Label340: TLabel
        Left = 25
        Top = 233
        Width = 72
        Height = 13
        Caption = 'Search Depth :'
      end
      object Label341: TLabel
        Left = 25
        Top = 259
        Width = 73
        Height = 13
        Caption = 'Safety Ceiling :'
      end
      object Label342: TLabel
        Left = 25
        Top = 285
        Width = 74
        Height = 13
        Caption = 'Seeker Range :'
      end
      object Label343: TLabel
        Left = 25
        Top = 312
        Width = 60
        Height = 13
        Caption = 'Gyro Angle :'
      end
      object Label344: TLabel
        Left = 170
        Top = 201
        Width = 27
        Height = 13
        Caption = 'yards'
      end
      object Label345: TLabel
        Left = 171
        Top = 227
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label346: TLabel
        Left = 171
        Top = 254
        Width = 33
        Height = 13
        Caption = 'meters'
      end
      object Label347: TLabel
        Left = 171
        Top = 280
        Width = 27
        Height = 13
        Caption = 'yards'
      end
      object btnControlComboFiringMode: TSpeedButton
        Left = 171
        Top = 148
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
      object btnControlComboRunOut: TSpeedButton
        Left = 171
        Top = 174
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
      object btnControlComboGyro: TSpeedButton
        Left = 173
        Top = 307
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
      object Label21: TLabel
        Left = 48
        Top = 370
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object btnSearchTarget: TSpeedButton
        Left = 143
        Top = 74
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
      object Label39: TLabel
        Left = 161
        Top = 373
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object sbAccousticDisplayRangeShow: TSpeedButton
        Left = 25
        Top = 393
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbAccousticDisplayRangeHide: TSpeedButton
        Left = 25
        Top = 417
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbDisplayBlindZonesShow: TSpeedButton
        Left = 149
        Top = 393
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbDisplayBlindZonesHide: TSpeedButton
        Left = 149
        Top = 417
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object editTargetTrack: TEdit
        Left = 85
        Top = 75
        Width = 52
        Height = 21
        TabOrder = 0
        Text = '---'
      end
      object btnAcousticTorpedoPlan: TButton
        Left = 3
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Plan'
        TabOrder = 1
      end
      object btnAcousticTorpedoLaunch: TButton
        Left = 236
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 2
      end
      object btnAcousticTorpedoCancel: TButton
        Left = 89
        Top = 470
        Width = 80
        Height = 25
        Caption = 'Cancel'
        TabOrder = 3
      end
      object editControlFiring: TEdit
        Left = 103
        Top = 148
        Width = 62
        Height = 21
        TabOrder = 4
      end
      object editControlRunOut: TEdit
        Left = 103
        Top = 175
        Width = 62
        Height = 21
        TabOrder = 5
      end
      object editControlSearchRadius: TEdit
        Left = 103
        Top = 201
        Width = 38
        Height = 21
        TabOrder = 6
      end
      object editControlSearchDepth: TEdit
        Left = 103
        Top = 228
        Width = 38
        Height = 21
        TabOrder = 7
      end
      object editControlSafety: TEdit
        Left = 103
        Top = 254
        Width = 38
        Height = 21
        TabOrder = 8
      end
      object edittControlSeeker: TEdit
        Left = 103
        Top = 281
        Width = 38
        Height = 21
        TabOrder = 9
      end
      object editControlGyro: TEdit
        Left = 103
        Top = 308
        Width = 38
        Height = 21
        TabOrder = 10
      end
      object btnControlControlRunAdvised: TButton
        Left = 236
        Top = 174
        Width = 80
        Height = 25
        Caption = '< Advised'
        TabOrder = 11
      end
      object btnControlSearchRadius: TButton
        Left = 236
        Top = 200
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 12
      end
      object btnControlSearchDepth: TButton
        Left = 236
        Top = 226
        Width = 80
        Height = 25
        Caption = '< Advised'
        TabOrder = 13
      end
      object btnControlSafety: TButton
        Left = 236
        Top = 252
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 14
      end
      object btnControlSeeker: TButton
        Left = 236
        Top = 278
        Width = 80
        Height = 25
        Caption = '< Default'
        TabOrder = 15
      end
      object btntControlGyroAdvised: TButton
        Left = 236
        Top = 305
        Width = 80
        Height = 25
        Caption = '< Advised'
        TabOrder = 16
      end
      object btnControlTube1: TButton
        Left = 103
        Top = 122
        Width = 24
        Height = 24
        Caption = '1'
        TabOrder = 17
      end
      object btnControlTube2: TButton
        Left = 125
        Top = 122
        Width = 24
        Height = 24
        Caption = '2'
        TabOrder = 18
      end
      object btnControlTube3: TButton
        Left = 146
        Top = 122
        Width = 24
        Height = 24
        Caption = '3'
        TabOrder = 19
      end
      object btnControlTube4: TButton
        Left = 168
        Top = 122
        Width = 24
        Height = 24
        Caption = '4'
        TabOrder = 20
      end
      object btnTargetDetails: TButton
        Left = 236
        Top = 73
        Width = 80
        Height = 25
        Caption = 'Details...'
        TabOrder = 21
      end
    end
    object grbSurfaceToAirMissile: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 10
      object Label269: TLabel
        Left = 3
        Top = 3
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object Bevel54: TBevel
        Left = 40
        Top = 10
        Width = 260
        Height = 3
      end
      object lblSurfaceToAirStatus: TLabel
        Left = 23
        Top = 30
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label271: TLabel
        Left = 126
        Top = 30
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbSurfaceToAirStatusQuantity: TLabel
        Left = 182
        Top = 30
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label273: TLabel
        Left = 2
        Top = 59
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel55: TBevel
        Left = 39
        Top = 66
        Width = 190
        Height = 2
      end
      object Label274: TLabel
        Left = 25
        Top = 86
        Width = 54
        Height = 13
        Caption = 'Salvo size :'
      end
      object Label275: TLabel
        Left = 3
        Top = 112
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel56: TBevel
        Left = 40
        Top = 119
        Width = 260
        Height = 3
      end
      object Label276: TLabel
        Left = 24
        Top = 132
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label277: TLabel
        Left = 24
        Top = 156
        Width = 41
        Height = 13
        Caption = 'Course :'
      end
      object Label278: TLabel
        Left = 24
        Top = 180
        Width = 75
        Height = 13
        Caption = 'Ground Speed :'
      end
      object Label279: TLabel
        Left = 24
        Top = 204
        Width = 44
        Height = 13
        Caption = 'Altitude :'
      end
      object Label280: TLabel
        Left = 24
        Top = 229
        Width = 41
        Height = 13
        Caption = 'Priority :'
      end
      object Label281: TLabel
        Left = 24
        Top = 253
        Width = 38
        Height = 13
        Caption = 'Status :'
      end
      object Label282: TLabel
        Left = 24
        Top = 277
        Width = 65
        Height = 13
        Caption = 'Time to wait :'
      end
      object Label283: TLabel
        Left = 23
        Top = 302
        Width = 88
        Height = 13
        Caption = 'Time to intercept :'
      end
      object Label284: TLabel
        Left = 3
        Top = 333
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel57: TBevel
        Left = 40
        Top = 341
        Width = 260
        Height = 3
      end
      object Label285: TLabel
        Left = 43
        Top = 349
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label286: TLabel
        Left = 150
        Top = 349
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object lbSurfaceToAirCourse: TLabel
        Left = 126
        Top = 156
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSurfaceToAirGround: TLabel
        Left = 126
        Top = 179
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSurfaceToAirAltitude: TLabel
        Left = 126
        Top = 204
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSurfaceToAirStatus: TLabel
        Left = 126
        Top = 253
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSurfaceToAirTimeToWait: TLabel
        Left = 126
        Top = 277
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSurfaceToAirTimeToIntercept: TLabel
        Left = 126
        Top = 302
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label311: TLabel
        Left = 172
        Top = 156
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label312: TLabel
        Left = 172
        Top = 179
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object Label313: TLabel
        Left = 172
        Top = 204
        Width = 20
        Height = 13
        Caption = 'feet'
      end
      object Label316: TLabel
        Left = 172
        Top = 277
        Width = 30
        Height = 13
        Caption = 'mm:ss'
      end
      object Label317: TLabel
        Left = 172
        Top = 302
        Width = 30
        Height = 13
        Caption = 'mm:ss'
      end
      object btnSurfaceToAirTargetTrack: TSpeedButton
        Left = 172
        Top = 129
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
      object sbSurfaceToAirDisplayRangeShow: TSpeedButton
        Left = 23
        Top = 368
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
      end
      object sbSurfaceToAirDisplayRangeHide: TSpeedButton
        Left = 23
        Top = 392
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
      end
      object sbSurfaceToAirDisplayBlindShow: TSpeedButton
        Left = 138
        Top = 368
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
      end
      object sbSurfaceToAirDisplayBlindHide: TSpeedButton
        Left = 138
        Top = 392
        Width = 80
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
      end
      object ediSurfaceToAirSalvo: TEdit
        Left = 126
        Top = 82
        Width = 70
        Height = 21
        TabOrder = 0
      end
      object editSurfaceToAirTrack: TEdit
        Left = 126
        Top = 129
        Width = 39
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object btSurfaceToAirPlan: TButton
        Left = 3
        Top = 468
        Width = 80
        Height = 25
        Caption = 'Plan'
        TabOrder = 2
      end
      object btSurfaceToAirLaunch: TButton
        Left = 242
        Top = 468
        Width = 80
        Height = 25
        Caption = 'Launch'
        TabOrder = 3
      end
      object btSurfaceToAirCancel: TButton
        Left = 89
        Top = 468
        Width = 80
        Height = 25
        Caption = 'Cancel'
        TabOrder = 4
      end
    end
    object grbGunEngagementChaffMode: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 1
      object ScrollBox9: TScrollBox
        Left = 2
        Top = 15
        Width = 342
        Height = 458
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label348: TLabel
          Left = 3
          Top = 6
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Bevel97: TBevel
          Left = 40
          Top = 13
          Width = 260
          Height = 3
        end
        object Label364: TLabel
          Left = 50
          Top = 22
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label365: TLabel
          Left = 25
          Top = 121
          Width = 61
          Height = 13
          Caption = 'Chaff Type :'
        end
        object Label366: TLabel
          Left = 25
          Top = 149
          Width = 49
          Height = 13
          Caption = 'Quantity :'
        end
        object Label466: TLabel
          Left = 25
          Top = 177
          Width = 75
          Height = 13
          Caption = 'Bloom Position :'
        end
        object Label467: TLabel
          Left = 25
          Top = 206
          Width = 75
          Height = 13
          Caption = 'Bloom Altitude :'
        end
        object lbChaffControlQuantity: TLabel
          Left = 146
          Top = 149
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label469: TLabel
          Left = 200
          Top = 206
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object Label470: TLabel
          Left = 3
          Top = 233
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Bevel98: TBevel
          Left = 40
          Top = 241
          Width = 260
          Height = 3
        end
        object Label471: TLabel
          Left = 43
          Top = 259
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label472: TLabel
          Left = 158
          Top = 258
          Width = 49
          Height = 13
          Caption = 'Blind Zone'
        end
        object btnChaffType: TSpeedButton
          Left = 227
          Top = 116
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
          OnClick = btnChaffClick
        end
        object btnChaffBloomPosition: TSpeedButton
          Left = 278
          Top = 172
          Width = 23
          Height = 22
          Caption = '+'
        end
        object sbGunEngagementChaffContolAuto: TSpeedButton
          Tag = 1
          Left = 25
          Top = 39
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = 'Automatic'
          OnClick = btnChaffClick
        end
        object sbGunEngagementChaffContolManual: TSpeedButton
          Tag = 2
          Left = 25
          Top = 63
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Manual'
          OnClick = btnChaffClick
        end
        object sbChaffDisplayShow: TSpeedButton
          Tag = 4
          Left = 25
          Top = 280
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Show'
          OnClick = btnChaffClick
        end
        object sbChaffDisplayHide: TSpeedButton
          Tag = 5
          Left = 25
          Top = 304
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Hide'
          OnClick = btnChaffClick
        end
        object sbChaffBlindZoneShow: TSpeedButton
          Tag = 6
          Left = 146
          Top = 280
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'Show'
          OnClick = btnChaffClick
        end
        object sbChaffBlindZoneHide: TSpeedButton
          Tag = 7
          Left = 146
          Top = 304
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Hide'
          OnClick = btnChaffClick
        end
        object sbGunEngagementChaffContolChaff: TSpeedButton
          Tag = 3
          Left = 25
          Top = 87
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Chaff'
          OnClick = btnChaffClick
        end
        object editChaffControlChaff: TEdit
          Left = 146
          Top = 117
          Width = 75
          Height = 21
          TabOrder = 0
        end
        object editChaffControlBloomPosition: TEdit
          Left = 146
          Top = 173
          Width = 126
          Height = 21
          TabOrder = 1
        end
        object editChaffControlBloomAltitude: TEdit
          Left = 146
          Top = 202
          Width = 47
          Height = 21
          TabOrder = 2
        end
        object btnChaffFire: TButton
          Left = 122
          Top = 377
          Width = 80
          Height = 25
          Caption = 'Fire'
          Enabled = False
          TabOrder = 3
          OnClick = btnChaffClick
        end
        object btnChaffCeaseFire: TButton
          Left = 219
          Top = 377
          Width = 80
          Height = 25
          Caption = 'Cease Fire'
          TabOrder = 4
          OnClick = btnChaffClick
        end
      end
    end
    object grbGunEngagementAutomaticManualMode: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 0
      object ScrollBox7: TScrollBox
        Left = 2
        Top = 15
        Width = 342
        Height = 458
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label315: TLabel
          Left = 3
          Top = 3
          Width = 31
          Height = 13
          Caption = 'Status'
        end
        object lblGunEngagementStatus: TLabel
          Left = 22
          Top = 31
          Width = 43
          Height = 13
          Caption = 'Available'
        end
        object Label335: TLabel
          Left = 116
          Top = 31
          Width = 49
          Height = 13
          Caption = 'Quantity :'
        end
        object lbGunEngagementQuantity: TLabel
          Left = 172
          Top = 31
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label349: TLabel
          Left = 3
          Top = 60
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Bevel63: TBevel
          Left = 40
          Top = 67
          Width = 190
          Height = 2
        end
        object Label350: TLabel
          Left = 23
          Top = 176
          Width = 55
          Height = 13
          Caption = 'Salvo Size :'
        end
        object Label351: TLabel
          Left = 3
          Top = 199
          Width = 32
          Height = 13
          Caption = 'Target'
        end
        object Bevel71: TBevel
          Left = 40
          Top = 207
          Width = 260
          Height = 3
        end
        object Label352: TLabel
          Left = 3
          Top = 331
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Bevel73: TBevel
          Left = 40
          Top = 339
          Width = 260
          Height = 3
        end
        object Label353: TLabel
          Left = 42
          Top = 358
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label354: TLabel
          Left = 121
          Top = 356
          Width = 54
          Height = 13
          Caption = 'Blind Zones'
        end
        object Label355: TLabel
          Left = 22
          Top = 226
          Width = 33
          Height = 13
          Caption = 'Track :'
        end
        object Label356: TLabel
          Left = 3
          Top = 252
          Width = 97
          Height = 13
          Caption = 'Autofire Parameters'
        end
        object Label357: TLabel
          Left = 22
          Top = 278
          Width = 86
          Height = 13
          Caption = 'Intercept Range :'
        end
        object Label358: TLabel
          Left = 22
          Top = 301
          Width = 87
          Height = 13
          Caption = 'Threshold Speed :'
        end
        object Label363: TLabel
          Left = 202
          Top = 301
          Width = 26
          Height = 13
          Caption = 'knots'
        end
        object Label359: TLabel
          Left = 47
          Top = 84
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label360: TLabel
          Left = 146
          Top = 84
          Width = 55
          Height = 13
          Caption = 'Salvo Mode'
        end
        object Bevel95: TBevel
          Left = 98
          Top = 260
          Width = 204
          Height = 3
        end
        object Label361: TLabel
          Left = 202
          Top = 278
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label362: TLabel
          Left = 203
          Top = 356
          Width = 79
          Height = 13
          Caption = 'Intercept Range'
        end
        object Bevel96: TBevel
          Left = 40
          Top = 10
          Width = 260
          Height = 3
        end
        object btnTargetSearch: TSpeedButton
          Left = 202
          Top = 221
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
          OnClick = btnTargetSearchClick
        end
        object sbControlModeAuto: TSpeedButton
          Tag = 1
          Left = 22
          Top = 98
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = 'Automatic'
          OnClick = btnGunControlClick
        end
        object sbControlModeManual: TSpeedButton
          Tag = 2
          Left = 22
          Top = 122
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Manual'
          OnClick = btnGunControlClick
        end
        object sbControlModeChaff: TSpeedButton
          Tag = 3
          Left = 22
          Top = 146
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Chaff'
          OnClick = btnGunControlClick
        end
        object sbControlSalvoModeCont: TSpeedButton
          Tag = 4
          Left = 136
          Top = 98
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Continous'
          OnClick = btnGunControlClick
        end
        object sbControlSalvoModeSalvo: TSpeedButton
          Tag = 5
          Left = 136
          Top = 122
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'Salvo'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayRangeShow: TSpeedButton
          Tag = 6
          Left = 19
          Top = 377
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Show'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayRangeHide: TSpeedButton
          Tag = 7
          Left = 19
          Top = 401
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Hide'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayBlindShow: TSpeedButton
          Tag = 8
          Left = 108
          Top = 377
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 8
          Down = True
          Caption = 'Show'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayBlindHide: TSpeedButton
          Tag = 9
          Left = 108
          Top = 401
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 8
          Caption = 'Hide'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayInterceptShow: TSpeedButton
          Tag = 10
          Left = 198
          Top = 377
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'Show'
          OnClick = btnGunControlClick
        end
        object sbGunEngagementDisplayInterceptHide: TSpeedButton
          Tag = 11
          Left = 198
          Top = 401
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Hide'
          OnClick = btnGunControlClick
        end
        object editControlSalvoSize: TEdit
          Left = 134
          Top = 172
          Width = 62
          Height = 21
          TabOrder = 0
          Text = '1'
          OnKeyPress = editControlSalvoSizeKeyPress
        end
        object btnGunEngagementAssign: TButton
          Tag = 1
          Left = 9
          Top = 442
          Width = 63
          Height = 25
          Caption = 'Assign'
          Enabled = False
          TabOrder = 1
          OnClick = btnGunControlClick
        end
        object btnGunEngagementCease: TButton
          Tag = 4
          Left = 224
          Top = 441
          Width = 63
          Height = 25
          Caption = 'Cease Fire'
          Enabled = False
          TabOrder = 2
          OnClick = btnGunControlClick
        end
        object btnGunEngagementBreak: TButton
          Tag = 2
          Left = 82
          Top = 442
          Width = 63
          Height = 25
          Caption = 'Break'
          Enabled = False
          TabOrder = 3
          OnClick = btnGunControlClick
        end
        object editGunEngagementTargetTrack: TEdit
          Left = 134
          Top = 222
          Width = 62
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object editAutofireIntercept: TEdit
          Left = 134
          Top = 274
          Width = 62
          Height = 21
          TabOrder = 5
        end
        object editAutofireThreshold: TEdit
          Left = 134
          Top = 297
          Width = 61
          Height = 21
          TabOrder = 6
        end
        object btnGunEngagementFire: TButton
          Tag = 3
          Left = 155
          Top = 442
          Width = 63
          Height = 25
          Caption = 'Fire'
          Enabled = False
          TabOrder = 7
          OnClick = btnGunControlClick
        end
      end
    end
    object grbGunEngagementCIWS: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 2
      object ScrollBox8: TScrollBox
        Left = 2
        Top = 15
        Width = 342
        Height = 458
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label468: TLabel
          Left = 3
          Top = 3
          Width = 31
          Height = 13
          Caption = 'Status'
        end
        object lblCIWSStatus: TLabel
          Left = 35
          Top = 31
          Width = 43
          Height = 13
          Caption = 'Available'
        end
        object Label474: TLabel
          Left = 108
          Top = 31
          Width = 49
          Height = 13
          Caption = 'Quantity :'
        end
        object lbCIWSQuantity: TLabel
          Left = 164
          Top = 31
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label477: TLabel
          Left = 3
          Top = 64
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Bevel99: TBevel
          Left = 40
          Top = 71
          Width = 190
          Height = 2
        end
        object Label478: TLabel
          Left = 35
          Top = 161
          Width = 55
          Height = 13
          Caption = 'Salvo Size :'
        end
        object Label479: TLabel
          Left = 3
          Top = 192
          Width = 32
          Height = 13
          Caption = 'Target'
        end
        object Bevel100: TBevel
          Left = 40
          Top = 200
          Width = 260
          Height = 3
        end
        object Label480: TLabel
          Left = 3
          Top = 259
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Bevel101: TBevel
          Left = 40
          Top = 267
          Width = 260
          Height = 3
        end
        object Label481: TLabel
          Left = 60
          Top = 284
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label482: TLabel
          Left = 174
          Top = 285
          Width = 54
          Height = 13
          Caption = 'Blind Zones'
        end
        object Label483: TLabel
          Left = 35
          Top = 222
          Width = 33
          Height = 13
          Caption = 'Track :'
        end
        object Label488: TLabel
          Left = 61
          Top = 84
          Width = 26
          Height = 13
          Caption = 'Mode'
        end
        object Label489: TLabel
          Left = 165
          Top = 83
          Width = 55
          Height = 13
          Caption = 'Salvo Mode'
        end
        object Bevel103: TBevel
          Left = 40
          Top = 10
          Width = 260
          Height = 3
        end
        object btnCIWSTargetTrack: TSpeedButton
          Left = 220
          Top = 217
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
        object sbCIWSControlModeAuto: TSpeedButton
          Tag = 1
          Left = 35
          Top = 100
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Down = True
          Caption = 'Automatic'
        end
        object sbCIWSControlModeManual: TSpeedButton
          Tag = 2
          Left = 35
          Top = 124
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 4
          Caption = 'Manual'
        end
        object sbCIWSControlSalvoCont: TSpeedButton
          Tag = 3
          Left = 153
          Top = 100
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 3
          Down = True
          Caption = 'Continous'
        end
        object sbCIWSControlSalvoSalvo: TSpeedButton
          Tag = 4
          Left = 153
          Top = 124
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 3
          Caption = 'Salvo'
        end
        object sbCIWSControlDisplayRangeShow: TSpeedButton
          Tag = 5
          Left = 35
          Top = 303
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Show'
        end
        object sbCIWSControlDisplayRangeHide: TSpeedButton
          Tag = 6
          Left = 35
          Top = 327
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Hide'
        end
        object sbCIWSControlDisplayBlindZonesShow: TSpeedButton
          Tag = 7
          Left = 161
          Top = 303
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Caption = 'Show'
        end
        object sbCIWSControlDisplayBlindZonesHide: TSpeedButton
          Tag = 8
          Left = 161
          Top = 327
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 2
          Down = True
          Caption = 'Hide'
          OnClick = sbGunICWSClick
        end
        object editCIWSControlSalvoSize: TEdit
          Left = 161
          Top = 157
          Width = 53
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object btnCIWSCease: TButton
          Left = 220
          Top = 411
          Width = 80
          Height = 25
          Caption = 'Cease Fire'
          TabOrder = 1
        end
        object editCIWSTargetTrack: TEdit
          Left = 161
          Top = 218
          Width = 53
          Height = 21
          TabOrder = 2
        end
        object btnCIWSFire: TButton
          Left = 134
          Top = 411
          Width = 80
          Height = 25
          Caption = 'Fire'
          TabOrder = 3
        end
      end
    end
    object grbSurfaceToSurfaceMissile: TGroupBox
      Left = 0
      Top = 0
      Width = 346
      Height = 475
      Align = alClient
      TabOrder = 13
      object ScrollBox6: TScrollBox
        Left = 2
        Top = 15
        Width = 342
        Height = 458
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label67: TLabel
          Left = 3
          Top = -1
          Width = 31
          Height = 13
          Caption = 'Status'
        end
        object Bevel29: TBevel
          Left = 40
          Top = 6
          Width = 260
          Height = 3
        end
        object lblSurfaceToSurfaceMissileStatus: TLabel
          Left = 24
          Top = 26
          Width = 43
          Height = 13
          Caption = 'Available'
        end
        object Label69: TLabel
          Left = 126
          Top = 26
          Width = 49
          Height = 13
          Caption = 'Quantity :'
        end
        object lbSurfaceToSurfaceMissileQuantity: TLabel
          Left = 182
          Top = 26
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label75: TLabel
          Left = 3
          Top = 55
          Width = 32
          Height = 13
          Caption = 'Target'
        end
        object Bevel33: TBevel
          Left = 40
          Top = 62
          Width = 260
          Height = 3
        end
        object Label76: TLabel
          Left = 24
          Top = 81
          Width = 33
          Height = 13
          Caption = 'Track :'
        end
        object Label77: TLabel
          Left = 3
          Top = 109
          Width = 35
          Height = 13
          Caption = 'Control'
        end
        object Bevel74: TBevel
          Left = 40
          Top = 116
          Width = 190
          Height = 2
        end
        object Label78: TLabel
          Left = 3
          Top = 326
          Width = 34
          Height = 13
          Caption = 'Display'
        end
        object Bevel77: TBevel
          Left = 40
          Top = 334
          Width = 260
          Height = 3
        end
        object Label413: TLabel
          Left = 47
          Top = 342
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object Label414: TLabel
          Left = 24
          Top = 192
          Width = 51
          Height = 13
          Caption = 'Launcher :'
        end
        object Label415: TLabel
          Left = 24
          Top = 134
          Width = 62
          Height = 13
          Caption = 'Firing Mode :'
        end
        object Label416: TLabel
          Left = 24
          Top = 162
          Width = 73
          Height = 13
          Caption = 'Engangement :'
        end
        object btnSurfaceToSurfaceMissileFiring: TSpeedButton
          Left = 184
          Top = 129
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
        object btnSurfaceToSurfaceMissileEngagement: TSpeedButton
          Left = 184
          Top = 157
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
        object btnSurfaceToSurfaceMissileTargetTrack: TSpeedButton
          Tag = 3
          Left = 184
          Top = 76
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
          OnClick = btnSurfaceToSurfaceClick
        end
        object Label54: TLabel
          Left = 3
          Top = 269
          Width = 51
          Height = 13
          Caption = 'Waypoints'
        end
        object Bevel16: TBevel
          Left = 60
          Top = 276
          Width = 240
          Height = 3
        end
        object sbSurfaceToSurfaceMissileDisplayRangeShow: TSpeedButton
          Tag = 1
          Left = 25
          Top = 356
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Caption = 'Show'
          OnClick = btnSurfaceToSurfaceClick
        end
        object sbSurfaceToSurfaceMissileDisplayRangeHide: TSpeedButton
          Tag = 2
          Left = 25
          Top = 380
          Width = 80
          Height = 25
          AllowAllUp = True
          GroupIndex = 1
          Down = True
          Caption = 'Hide'
          OnClick = btnSurfaceToSurfaceClick
        end
        object editSurfaceToSurfaceMissileTargetTrack: TEdit
          Left = 126
          Top = 77
          Width = 52
          Height = 21
          TabOrder = 0
        end
        object btnSurfaceToSurfacePlan: TButton
          Tag = 1
          Left = 13
          Top = 421
          Width = 80
          Height = 25
          Caption = 'Plan'
          Enabled = False
          TabOrder = 1
          OnClick = btnSurfaceToSurfaceClick
        end
        object btnSurfaceToSurfaceLaunch: TButton
          Tag = 3
          Left = 242
          Top = 421
          Width = 80
          Height = 25
          Caption = 'Launch'
          TabOrder = 2
          OnClick = btnSurfaceToSurfaceClick
        end
        object btnSurfaceToSurfaceCancel: TButton
          Tag = 2
          Left = 99
          Top = 421
          Width = 80
          Height = 25
          Caption = 'Cancel'
          TabOrder = 3
          OnClick = btnSurfaceToSurfaceClick
        end
        object editSurfaceToSurfaceMissileFiring: TEdit
          Left = 126
          Top = 130
          Width = 53
          Height = 21
          TabOrder = 4
        end
        object editSurfaceToSurfaceMissileEngangement: TEdit
          Left = 126
          Top = 158
          Width = 52
          Height = 21
          TabOrder = 5
        end
        object btnSurfaceToSurfaceMissileLauncherMore: TButton
          Left = 236
          Top = 245
          Width = 80
          Height = 25
          Caption = 'More...'
          TabOrder = 6
        end
        object btnSurfaceToSurfaceMissileLauncher1: TButton
          Left = 125
          Top = 184
          Width = 30
          Height = 43
          Caption = '1'
          TabOrder = 7
        end
        object btnSurfaceToSurfaceMissileLauncher2: TButton
          Left = 154
          Top = 184
          Width = 30
          Height = 43
          Caption = '2'
          Enabled = False
          TabOrder = 8
        end
        object btnSurfaceToSurfaceMissileLauncher3: TButton
          Left = 183
          Top = 184
          Width = 30
          Height = 43
          Caption = '3'
          Enabled = False
          TabOrder = 9
        end
        object btnSurfaceToSurfaceMissileLauncher4: TButton
          Left = 213
          Top = 184
          Width = 30
          Height = 43
          Caption = '4'
          Enabled = False
          TabOrder = 10
        end
        object btnSurfaceToSurfaceMissileTargetTrackDetails: TButton
          Left = 236
          Top = 75
          Width = 80
          Height = 25
          Caption = 'Details...'
          TabOrder = 11
        end
        object btnSurfaceToSurfaceMissileWaypointsCancel: TButton
          Left = 262
          Top = 293
          Width = 58
          Height = 25
          Caption = 'Cancel'
          TabOrder = 12
        end
        object btnSurfaceToSurfaceMissileWaypointsApply: TButton
          Left = 202
          Top = 293
          Width = 58
          Height = 25
          Caption = 'Apply'
          TabOrder = 13
        end
        object btnSurfaceToSurfaceMissileWaypointsDelete: TButton
          Left = 143
          Top = 293
          Width = 58
          Height = 25
          Caption = 'Delete'
          TabOrder = 14
        end
        object btnSurfaceToSurfaceMissileWaypointsAdd: TButton
          Left = 84
          Top = 293
          Width = 58
          Height = 25
          Caption = 'Add'
          Enabled = False
          TabOrder = 15
        end
        object btnSurfaceToSurfaceMissileWaypointsEdit: TButton
          Left = 25
          Top = 293
          Width = 58
          Height = 25
          Caption = 'Edit'
          Enabled = False
          TabOrder = 16
        end
      end
    end
  end
  object PanelWeaponChoices: TPanel
    Left = 0
    Top = 0
    Width = 346
    Height = 22
    Align = alTop
    AutoSize = True
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnWeapon: TSpeedButton
      Tag = 1
      Left = 304
      Top = 0
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
      OnClick = btnWeaponClick
    end
    object edtWeaponName: TEdit
      Left = 6
      Top = 1
      Width = 294
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pmenuWeapon: TPopupMenu
    Left = 36
    Top = 27
  end
end
