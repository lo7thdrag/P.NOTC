object frmGunCIWS: TfrmGunCIWS
  Left = 0
  Top = 0
  Caption = 'frmGunCIWS'
  ClientHeight = 359
  ClientWidth = 307
  Color = 16775920
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grbGunEngagementCIWS: TGroupBox
    Left = 0
    Top = 0
    Width = 307
    Height = 359
    Align = alClient
    TabOrder = 0
    object ScrollBox8: TScrollBox
      Left = 2
      Top = 15
      Width = 303
      Height = 342
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object Label468: TLabel
        Left = 3
        Top = 1
        Width = 31
        Height = 13
        Caption = 'Status'
      end
      object lblCIWSStatus: TLabel
        Left = 35
        Top = 19
        Width = 43
        Height = 13
        Caption = 'Available'
      end
      object Label474: TLabel
        Left = 108
        Top = 19
        Width = 49
        Height = 13
        Caption = 'Quantity :'
      end
      object lbCIWSQuantity: TLabel
        Left = 164
        Top = 17
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label477: TLabel
        Left = 3
        Top = 42
        Width = 35
        Height = 13
        Caption = 'Control'
      end
      object Bevel99: TBevel
        Left = 40
        Top = 49
        Width = 190
        Height = 2
      end
      object Label478: TLabel
        Left = 35
        Top = 137
        Width = 55
        Height = 13
        Caption = 'Salvo Size :'
      end
      object Label479: TLabel
        Left = 3
        Top = 157
        Width = 32
        Height = 13
        Caption = 'Target'
      end
      object Bevel100: TBevel
        Left = 40
        Top = 163
        Width = 260
        Height = 3
      end
      object Label480: TLabel
        Left = 3
        Top = 206
        Width = 34
        Height = 13
        Caption = 'Display'
      end
      object Bevel101: TBevel
        Left = 40
        Top = 214
        Width = 260
        Height = 3
      end
      object Label481: TLabel
        Left = 60
        Top = 218
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object Label482: TLabel
        Left = 174
        Top = 219
        Width = 54
        Height = 13
        Caption = 'Blind Zones'
      end
      object Label483: TLabel
        Left = 35
        Top = 178
        Width = 33
        Height = 13
        Caption = 'Track :'
      end
      object Label488: TLabel
        Left = 61
        Top = 59
        Width = 26
        Height = 13
        Caption = 'Mode'
      end
      object Label489: TLabel
        Left = 165
        Top = 58
        Width = 55
        Height = 13
        Caption = 'Salvo Mode'
      end
      object Bevel103: TBevel
        Left = 40
        Top = 8
        Width = 260
        Height = 3
      end
      object sbCIWSControlModeAuto: TSpeedButton
        Tag = 1
        Left = 32
        Top = 75
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 4
        Down = True
        Caption = 'Automatic'
        OnClick = sbCIWSControlModeAutoClick
      end
      object sbCIWSControlModeManual: TSpeedButton
        Tag = 2
        Left = 32
        Top = 98
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 4
        Caption = 'Manual'
        OnClick = sbCIWSControlModeAutoClick
      end
      object sbCIWSControlSalvoCont: TSpeedButton
        Tag = 3
        Left = 150
        Top = 75
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 3
        Down = True
        Caption = 'Continous'
        OnClick = SalvoMode
      end
      object sbCIWSControlSalvoSalvo: TSpeedButton
        Tag = 4
        Left = 150
        Top = 98
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 3
        Caption = 'Salvo'
        OnClick = SalvoMode
      end
      object sbCIWSControlDisplayRangeShow: TSpeedButton
        Tag = 1
        Left = 33
        Top = 237
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Show'
        OnClick = btnRangeClick
      end
      object sbCIWSControlDisplayRangeHide: TSpeedButton
        Tag = 2
        Left = 33
        Top = 260
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 1
        Down = True
        Caption = 'Hide'
        OnClick = btnRangeClick
      end
      object sbCIWSControlDisplayBlindZonesShow: TSpeedButton
        Tag = 1
        Left = 159
        Top = 237
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 2
        Caption = 'Show'
        OnClick = btnBlindZone
      end
      object sbCIWSControlDisplayBlindZonesHide: TSpeedButton
        Tag = 2
        Left = 159
        Top = 260
        Width = 83
        Height = 24
        AllowAllUp = True
        GroupIndex = 2
        Down = True
        Caption = 'Hide'
        OnClick = btnBlindZone
      end
      object btnTargetSearch: TSpeedButton
        Tag = 10
        Left = 217
        Top = 173
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
      object editCIWSControlSalvoSize: TEdit
        Left = 161
        Top = 133
        Width = 53
        Height = 21
        MaxLength = 5
        NumbersOnly = True
        TabOrder = 0
        Text = '1'
        OnExit = editCIWSControlSalvoSizeExit
        OnKeyPress = editCIWSControlSalvoSizeKeyPress
      end
      object btnCIWSCease: TButton
        Tag = 2
        Left = 217
        Top = 309
        Width = 81
        Height = 24
        Caption = 'Cease Fire'
        TabOrder = 1
        OnClick = btnCIWSCeaseClick
      end
      object editCIWSTargetTrack: TEdit
        Left = 161
        Top = 174
        Width = 53
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object btnCIWSFire: TButton
        Tag = 1
        Left = 131
        Top = 309
        Width = 81
        Height = 24
        Caption = 'Fire'
        TabOrder = 3
        OnClick = btnCIWSFireClick
      end
    end
  end
end
