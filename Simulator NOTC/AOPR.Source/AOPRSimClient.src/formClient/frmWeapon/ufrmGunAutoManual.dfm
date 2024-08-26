object frmGunAutoManual: TfrmGunAutoManual
  Left = 0
  Top = 0
  Caption = 'Gun Auto Manual'
  ClientHeight = 359
  ClientWidth = 308
  Color = 16775920
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grbGunEngagementAutomaticManualMode: TGroupBox
    Left = 0
    Top = 0
    Width = 308
    Height = 359
    Align = alClient
    TabOrder = 0
    object ScrollBox2: TScrollBox
      Left = 2
      Top = 15
      Width = 304
      Height = 342
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object Label12: TLabel
        Left = 3
        Top = -1
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblGunEngagementStatus: TLabel
        Left = 22
        Top = 14
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label13: TLabel
        Left = 116
        Top = 14
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbGunEngagementQuantity: TLabel
        Left = 172
        Top = 14
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label14: TLabel
        Left = 3
        Top = 31
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel3: TBevel
        Left = 40
        Top = 36
        Width = 260
        Height = 2
      end
      object Label25: TLabel
        Left = 47
        Top = 40
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object lblSalvoMode: TLabel
        Left = 146
        Top = 40
        Width = 55
        Height = 13
        Caption = 'Salvo Mode'
      end
      object Bevel6: TBevel
        Left = 40
        Top = 6
        Width = 260
        Height = 3
      end
      object sbControlModeAuto: TSpeedButton
        Tag = 1
        Left = 22
        Top = 53
        Width = 81
        Height = 22
        AllowAllUp = True
        GroupIndex = 4
        Caption = 'Automatic'
        OnClick = btnGunModeClick
      end
      object sbControlModeManual: TSpeedButton
        Tag = 2
        Left = 22
        Top = 73
        Width = 81
        Height = 22
        AllowAllUp = True
        GroupIndex = 4
        Caption = 'Manual'
        OnClick = btnGunModeClick
      end
      object sbControlModeChaff: TSpeedButton
        Tag = 3
        Left = 22
        Top = 93
        Width = 81
        Height = 22
        AllowAllUp = True
        GroupIndex = 4
        Caption = 'Chaff'
        Enabled = False
        Visible = False
        OnClick = btnGunModeClick
      end
      object sbControlSalvoModeCont: TSpeedButton
        Tag = 4
        Left = 136
        Top = 59
        Width = 80
        Height = 22
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Continous'
        OnClick = btnGunSalvoClick
      end
      object sbControlSalvoModeSalvo: TSpeedButton
        Tag = 5
        Left = 136
        Top = 87
        Width = 80
        Height = 22
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Salvo'
        OnClick = btnGunSalvoClick
      end
      object Label15: TLabel
        Left = 3
        Top = 248
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel4: TBevel
        Left = 45
        Top = 255
        Width = 255
        Height = 3
      end
      object Label16: TLabel
        Left = 47
        Top = 260
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label17: TLabel
        Left = 126
        Top = 260
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object lblIntercept: TLabel
        Left = 205
        Top = 260
        Width = 79
        Height = 13
        Caption = 'Intercept Range'
        Visible = False
      end
      object sbGunEngagementDisplayRangeShow: TSpeedButton
        Tag = 6
        Left = 24
        Top = 273
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
        OnClick = btnRangeClick
      end
      object sbGunEngagementDisplayRangeHide: TSpeedButton
        Tag = 7
        Left = 24
        Top = 293
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
        OnClick = btnRangeClick
      end
      object sbGunEngagementDisplayBlindShow: TSpeedButton
        Tag = 8
        Left = 113
        Top = 273
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 8
        Caption = 'Show'
        OnClick = btnBlindZoneClick
      end
      object sbGunEngagementDisplayBlindHide: TSpeedButton
        Tag = 9
        Left = 113
        Top = 293
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 8
        Down = True
        Caption = 'Hide'
        OnClick = btnBlindZoneClick
      end
      object sbGunEngagementDisplayInterceptShow: TSpeedButton
        Tag = 10
        Left = 203
        Top = 273
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
        Visible = False
        OnClick = btnInterceptClick
      end
      object sbGunEngagementDisplayInterceptHide: TSpeedButton
        Tag = 11
        Left = 203
        Top = 293
        Width = 82
        Height = 22
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
        Visible = False
        OnClick = btnInterceptClick
      end
      object sbControlModeNGS: TSpeedButton
        Tag = 14
        Left = 22
        Top = 113
        Width = 81
        Height = 22
        AllowAllUp = True
        GroupIndex = 4
        Caption = 'NGS'
        OnClick = btnGunModeClick
      end
      object ScrollBox1: TScrollBox
        Left = 2
        Top = 136
        Width = 295
        Height = 113
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 18
          Width = 61
          Height = 13
          Caption = 'Chaff Type :'
        end
        object Label2: TLabel
          Left = 24
          Top = 38
          Width = 49
          Height = 13
          Caption = 'Quantity :'
        end
        object Label3: TLabel
          Left = 24
          Top = 58
          Width = 75
          Height = 13
          Caption = 'Bloom Position :'
        end
        object Label4: TLabel
          Left = 24
          Top = 83
          Width = 75
          Height = 13
          Caption = 'Bloom Altitude :'
        end
        object lblQuantityChaff: TLabel
          Left = 112
          Top = 38
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label6: TLabel
          Left = 166
          Top = 83
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object btnChaffType: TSpeedButton
          Left = 195
          Top = 13
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
          OnClick = btnChaffTypeClick
        end
        object btnPosition: TSpeedButton
          Left = 195
          Top = 53
          Width = 23
          Height = 22
          Caption = '+'
          OnClick = btnPositionClick
        end
        object edtChaffType: TEdit
          Left = 112
          Top = 14
          Width = 75
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtBloomPosition: TEdit
          Left = 112
          Top = 54
          Width = 75
          Height = 21
          ReadOnly = True
          TabOrder = 1
          Text = '0.00'
        end
        object edtBloomAltitude: TEdit
          Left = 112
          Top = 79
          Width = 47
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '100'
        end
      end
      object ScrollBox3: TScrollBox
        Left = 2
        Top = 137
        Width = 298
        Height = 111
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 1
        object Label10: TLabel
          Left = 26
          Top = 16
          Width = 55
          Height = 13
          Caption = 'Salvo Size :'
        end
        object Label11: TLabel
          Left = 1
          Top = 36
          Width = 32
          Height = 13
          Caption = 'Target'
        end
        object Bevel2: TBevel
          Left = 43
          Top = 44
          Width = 251
          Height = 3
        end
        object Label18: TLabel
          Left = 25
          Top = 58
          Width = 33
          Height = 13
          Caption = 'Track :'
        end
        object Label19: TLabel
          Left = 1
          Top = 102
          Width = 97
          Height = 13
          Caption = 'Autofire Parameters'
          Visible = False
        end
        object Label20: TLabel
          Left = 25
          Top = 118
          Width = 86
          Height = 13
          Caption = 'Intercept Range :'
          Visible = False
        end
        object Label21: TLabel
          Left = 25
          Top = 139
          Width = 87
          Height = 13
          Caption = 'Threshold Speed :'
          Visible = False
        end
        object Label22: TLabel
          Left = 205
          Top = 139
          Width = 26
          Height = 13
          Caption = 'knots'
          Visible = False
        end
        object Bevel5: TBevel
          Left = 107
          Top = 108
          Width = 187
          Height = 3
          Visible = False
        end
        object Label23: TLabel
          Left = 205
          Top = 118
          Width = 14
          Height = 13
          Caption = 'nm'
          Visible = False
        end
        object btnTargetSearch: TSpeedButton
          Tag = 10
          Left = 205
          Top = 54
          Width = 29
          Height = 24
          Glyph.Data = {
            1E060000424D1E06000000000000360000002800000017000000150000000100
            180000000000E805000000000000000000000000000000000000C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D41111111111111111111212
            121212121A1A1AC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
            0000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D44D4D4D5454545F5F5F656565
            6262620000004747476565656363634D4D4D4D4D4D797979C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D469696929292929
            2929868686C8D0D4C8D0D40000007D7D7DC8D0D4C8D0D4292929292929545454
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D43D3D
            3D3B3B3BC8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000007D7D7DC8D0D4C8D0D4C8
            D0D4C8D0D46A6A6A0E0E0EC8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
            C8D0D41616166F6F6FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000007D7D
            7DC8D0D4C8D0D4C8D0D4C8D0D4C8D0D49494941313138A8A8AC8D0D4C8D0D400
            0000C8D0D4C8D0D4C8D0D4030303757575C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D40000007D7D7DC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4A4A4A40000008686
            86C8D0D4C8D0D4000000C8D0D4C8D0D48B8B8B2C2C2C838383C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D40000007F7F7FC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            A7A7A7272727727272C8D0D4C8D0D4000000C8D0D47B7B7B000000C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000888888C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D4C8D0D42C2C2C4C4C4CC8D0D4000000C8D0D47B7B7B
            000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D43030304C4C4CC8D0D400
            0000C8D0D47B7B7B0000004F4F4F515151515151515151585858535353737373
            C8D0D4C8D0D4C8D0D48D8D8D5151515151515151515151515252525858581616
            164C4C4CC8D0D4000000C8D0D47B7B7B00000024242425252525252525252525
            2525252525575757C8D0D4C8D0D4C8D0D47D7D7D252525252525252525252525
            2525252525250909094C4C4CC8D0D4000000C8D0D47B7B7B000000C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D4C8D0D42C2C2C4C4C4CC8D0D4000000C8D0D47B7B7B
            000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D41717178484
            84C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D42C2C2C4C4C4CC8D0D400
            0000C8D0D4C8D0D45F5F5F5A5A5A949494C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D40000007D7D7DC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D45353535C5C
            5C828282C8D0D4000000C8D0D4C8D0D4C8D0D4030303757575C8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D40000007D7D7DC8D0D4C8D0D4C8D0D4C8D0D4C8D0D4
            C8D0D4000000868686C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D40303037575
            75C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000007D7D7DC8D0D4C8D0D4C8
            D0D4C8D0D4C8D0D4C8D0D4000000868686C8D0D4C8D0D4000000C8D0D4C8D0D4
            C8D0D4C8D0D44545454B4B4BC8D0D4C8D0D4C8D0D4C8D0D4C8D0D40000007D7D
            7DC8D0D4C8D0D4C8D0D4C8D0D4747474232323999999C8D0D4C8D0D4C8D0D400
            0000C8D0D4C8D0D4C8D0D4C8D0D47A7A7A5A5A5A555555555555C8D0D4C8D0D4
            C8D0D4000000838383C8D0D4C8D0D4555555555555585858646464C8D0D4C8D0
            D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0D482828221212121
            21216D6D6DC8D0D4C8D0D40000006E6E6EC8D0D4C8D0D42121212121215B5B5B
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4C8D0D4C8D0D4C8D0
            D4C8D0D4C8D0D4C8D0D4393939000000000000000000000000000000090909C8
            D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4000000C8D0D4C8D0D4
            C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D49797979797979797979797
            97979797C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D4C8D0D400
            0000}
          Layout = blGlyphTop
          OnClick = btnTargetSearchClick
        end
        object editControlSalvoSize: TEdit
          Left = 138
          Top = 16
          Width = 64
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '1'
          OnExit = editControlSalvoSizeExit
          OnKeyPress = editControlSalvoSizeKeyPress
        end
        object editGunEngagementTargetTrack: TEdit
          Left = 137
          Top = 56
          Width = 64
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 1
          Text = '---'
        end
        object editAutofireIntercept: TEdit
          Left = 137
          Top = 114
          Width = 64
          Height = 21
          Enabled = False
          TabOrder = 2
          Text = '0.00'
          Visible = False
          OnExit = editAutofireInterceptExit
          OnKeyPress = editAutofireInterceptKeyPress
        end
        object editAutofireThreshold: TEdit
          Left = 137
          Top = 135
          Width = 64
          Height = 21
          Enabled = False
          TabOrder = 3
          Text = '0.0'
          Visible = False
          OnExit = editAutofireThresholdExit
          OnKeyPress = editAutofireThresholdKeyPress
        end
      end
      object btnGunEngagementAssign: TButton
        Tag = 1
        Left = 21
        Top = 319
        Width = 68
        Height = 23
        Caption = 'Assign'
        Enabled = False
        TabOrder = 2
        OnClick = btnGunEngagementAssignClick
      end
      object btnGunEngagementCease: TButton
        Tag = 4
        Left = 222
        Top = 319
        Width = 68
        Height = 23
        Caption = 'Cease Fire'
        Enabled = False
        TabOrder = 3
        OnClick = btnGunEngagementCeaseClick
      end
      object btnGunEngagementBreak: TButton
        Tag = 2
        Left = 88
        Top = 319
        Width = 68
        Height = 23
        Caption = 'Break'
        Enabled = False
        TabOrder = 4
        OnClick = btnGunEngagementBreakClick
      end
      object btnGunEngagementFire: TButton
        Tag = 3
        Left = 155
        Top = 319
        Width = 68
        Height = 23
        Caption = 'Fire'
        Enabled = False
        TabOrder = 5
        OnClick = btnGunEngagementFireClick
      end
      object btnFireALL: TButton
        Tag = 3
        Left = 136
        Top = 115
        Width = 80
        Height = 23
        Caption = 'Fire ALL'
        TabOrder = 7
        Visible = False
        OnClick = btnFireALLClick
      end
      object ScrollBox4: TScrollBox
        Left = 2
        Top = 136
        Width = 299
        Height = 113
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 6
        object Label5: TLabel
          Left = 27
          Top = 16
          Width = 55
          Height = 13
          Caption = 'Salvo Size :'
        end
        object Label7: TLabel
          Left = 5
          Top = 37
          Width = 55
          Height = 13
          Caption = 'Corrections'
        end
        object Bevel1: TBevel
          Left = 76
          Top = 44
          Width = 219
          Height = 3
        end
        object Label9: TLabel
          Left = 19
          Top = 64
          Width = 60
          Height = 13
          Caption = 'Engagement'
        end
        object Edit1: TEdit
          Left = 138
          Top = 13
          Width = 62
          Height = 21
          MaxLength = 5
          NumbersOnly = True
          TabOrder = 0
          Text = '1'
          OnExit = editControlSalvoSizeExit
          OnKeyPress = editControlSalvoSizeKeyPress
        end
        object btnSetup: TButton
          Left = 134
          Top = 60
          Width = 80
          Height = 20
          Caption = 'Setup NGS'
          TabOrder = 1
          OnClick = btnSetupClick
        end
        object GroupBox1: TGroupBox
          Left = 25
          Top = 101
          Width = 160
          Height = 67
          Caption = 'Spotter Correction'
          TabOrder = 2
          Visible = False
          object Label8: TLabel
            Left = 65
            Top = 39
            Width = 33
            Height = 13
            Caption = 'metres'
          end
          object Label29: TLabel
            Left = 65
            Top = 18
            Width = 33
            Height = 13
            Caption = 'metres'
          end
          object Spot1: TEdit
            AlignWithMargins = True
            Left = 6
            Top = 14
            Width = 53
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            Text = '0.0'
            OnKeyPress = Spot1KeyPress
          end
          object Spot2: TEdit
            Left = 6
            Top = 36
            Width = 53
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxLength = 7
            ParentFont = False
            TabOrder = 1
            Text = '0.0'
            OnKeyPress = Spot1KeyPress
          end
          object Button1: TButton
            Tag = 5
            Left = 106
            Top = 15
            Width = 25
            Height = 22
            Caption = 'L'
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button2: TButton
            Tag = 6
            Left = 131
            Top = 15
            Width = 25
            Height = 22
            Caption = 'R'
            TabOrder = 3
            OnClick = Button2Click
          end
          object Button3: TButton
            Tag = 7
            Left = 106
            Top = 36
            Width = 25
            Height = 21
            Caption = 'D'
            TabOrder = 4
            OnClick = Button3Click
          end
          object Button4: TButton
            Tag = 8
            Left = 131
            Top = 36
            Width = 25
            Height = 21
            Caption = 'A'
            TabOrder = 5
            OnClick = Button4Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 191
          Top = 105
          Width = 105
          Height = 63
          Caption = 'Gunner Correction'
          Enabled = False
          TabOrder = 3
          Visible = False
          object lblDA: TLabel
            Left = 8
            Top = 30
            Width = 12
            Height = 13
            Alignment = taCenter
            Caption = '---'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLR: TLabel
            Left = 8
            Top = 15
            Width = 12
            Height = 13
            Alignment = taCenter
            Caption = '---'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label27: TLabel
            Left = 45
            Top = 13
            Width = 42
            Height = 13
            Caption = 'mils right'
          end
          object Label28: TLabel
            Left = 45
            Top = 28
            Width = 54
            Height = 13
            Caption = 'metres add'
          end
          object btnConvert: TButton
            Left = 26
            Top = 43
            Width = 75
            Height = 19
            Caption = 'Convert'
            TabOrder = 0
            OnClick = btnConvertClick
          end
        end
      end
    end
  end
  object pmenuChaffType: TPopupMenu
    Left = 272
    Top = 80
  end
end
