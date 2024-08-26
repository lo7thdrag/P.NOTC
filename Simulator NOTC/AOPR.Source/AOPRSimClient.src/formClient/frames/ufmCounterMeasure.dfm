inherited fmCounterMeasure: TfmCounterMeasure
  Width = 328
  Height = 526
  Color = 16775920
  ParentBackground = False
  ParentColor = False
  ExplicitWidth = 328
  ExplicitHeight = 526
  object PanelALL: TPanel
    Left = 0
    Top = 114
    Width = 328
    Height = 412
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
    TabOrder = 0
    object PanelCounterMeasure: TPanel
      Left = 0
      Top = 0
      Width = 328
      Height = 412
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object grbAcousticDecoy: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 3
        object ScrollBox1: TScrollBox
          Left = 2
          Top = 18
          Width = 324
          Height = 392
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Label1: TLabel
            Left = 10
            Top = -3
            Width = 67
            Height = 16
            Caption = 'Deployment'
          end
          object Bevel1: TBevel
            Left = 90
            Top = 4
            Width = 220
            Height = 3
          end
          object Label2: TLabel
            Left = 25
            Top = 195
            Width = 84
            Height = 16
            Caption = 'Mode            :'
          end
          object Label3: TLabel
            Left = 110
            Top = 230
            Width = 4
            Height = 16
          end
          object Label4: TLabel
            Left = 48
            Top = 20
            Width = 35
            Height = 16
            Caption = 'Action'
          end
          object Label5: TLabel
            Left = 10
            Top = 95
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Bevel2: TBevel
            Left = 65
            Top = 103
            Width = 245
            Height = 3
          end
          object Label6: TLabel
            Left = 37
            Top = 120
            Width = 55
            Height = 16
            Caption = 'Activation'
          end
          object Label7: TLabel
            Left = 145
            Top = 120
            Width = 68
            Height = 16
            Caption = 'Cycle Timer'
          end
          object Label8: TLabel
            Left = 25
            Top = 230
            Width = 82
            Height = 16
            Caption = 'Filter Setting :'
          end
          object Label9: TLabel
            Left = 110
            Top = 260
            Width = 4
            Height = 16
          end
          object btnComboAcousticDecoyMode: TSpeedButton
            Tag = 7
            Left = 290
            Top = 194
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
            OnClick = btnECMAcousticDecoyOnClick
          end
          object btnComboAcousticDecoyFilter: TSpeedButton
            Tag = 8
            Left = 290
            Top = 229
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
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyActionDeploy: TSpeedButton
            Tag = 1
            Left = 25
            Top = 40
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Deploy'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyActionStow: TSpeedButton
            Tag = 2
            Left = 25
            Top = 64
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Stow'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyActivationOn: TSpeedButton
            Tag = 3
            Left = 25
            Top = 140
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'On'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyActivationOff: TSpeedButton
            Tag = 4
            Left = 25
            Top = 163
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Off'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyCycleTimerOn: TSpeedButton
            Tag = 5
            Left = 140
            Top = 140
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'On'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object sbAcousticDecoyCycleTimerOff: TSpeedButton
            Tag = 6
            Left = 140
            Top = 163
            Width = 80
            Height = 24
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Off'
            Enabled = False
            OnClick = btnECMAcousticDecoyOnClick
          end
          object edtAcousticDecoyMode: TEdit
            Left = 115
            Top = 193
            Width = 171
            Height = 24
            ReadOnly = True
            TabOrder = 0
            Text = 'Pulsed noise'
          end
          object edtAcousticDecoyFilter: TEdit
            Left = 115
            Top = 228
            Width = 170
            Height = 24
            ReadOnly = True
            TabOrder = 1
            Text = '2'
          end
        end
      end
      object grbAirborneChaff: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 0
        object Label510: TLabel
          Left = 10
          Top = 5
          Width = 67
          Height = 16
          Caption = 'Deployment'
        end
        object Label511: TLabel
          Left = 25
          Top = 60
          Width = 64
          Height = 16
          Caption = 'Quantity   :'
        end
        object Label516: TLabel
          Left = 25
          Top = 33
          Width = 65
          Height = 16
          Caption = 'Type        :'
        end
        object Bevel110: TBevel
          Left = 90
          Top = 12
          Width = 220
          Height = 3
        end
        object lbChaffAirboneQuantity: TLabel
          Left = 105
          Top = 60
          Width = 15
          Height = 16
          Caption = '---'
        end
        object btnAirboneChaffType: TSpeedButton
          Left = 288
          Top = 30
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
          OnClick = btnAirboneChaffTypeClick
        end
        object editChaffAirboneType: TEdit
          Left = 105
          Top = 29
          Width = 175
          Height = 24
          ReadOnly = True
          TabOrder = 0
          Text = 'Barrier'
        end
        object btnChaffAirboneDeploy: TButton
          Left = 25
          Top = 100
          Width = 80
          Height = 25
          Caption = 'Deploy'
          TabOrder = 1
          OnClick = btnChaffAirboneDeployClick
        end
      end
      object grbFloatingDecoy: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 4
        object Label502: TLabel
          Left = 10
          Top = 3
          Width = 67
          Height = 16
          Caption = 'Deployment'
        end
        object Bevel114: TBevel
          Left = 90
          Top = 10
          Width = 220
          Height = 3
        end
        object Label550: TLabel
          Left = 22
          Top = 35
          Width = 64
          Height = 16
          Caption = 'Quantity   :'
        end
        object lbFloatingDecoyQuantity: TLabel
          Left = 100
          Top = 35
          Width = 10
          Height = 16
          Caption = '--'
        end
        object btnFloatingDecoyDeploy: TButton
          Left = 228
          Top = 35
          Width = 80
          Height = 25
          Caption = 'Deploy'
          TabOrder = 0
          OnClick = btnFloatingDecoyDeployClick
        end
      end
      object grbOnBoardSelfDefenseJammer: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 1
        object ScrollBox5: TScrollBox
          Left = 2
          Top = 18
          Width = 324
          Height = 392
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel112: TBevel
            Left = 65
            Top = 10
            Width = 245
            Height = 3
          end
          object Label542: TLabel
            Left = 10
            Top = 3
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label543: TLabel
            Left = 163
            Top = 25
            Width = 55
            Height = 16
            Caption = 'Targeting'
          end
          object Label544: TLabel
            Left = 50
            Top = 25
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton
            Tag = 1
            Left = 25
            Top = 45
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Automatic'
            OnClick = sbOnBoardSelfDefenseJammerControlModeAutoClick
          end
          object sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton
            Tag = 2
            Left = 25
            Top = 70
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Manual'
            OnClick = sbOnBoardSelfDefenseJammerControlModeAutoClick
          end
          object sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton
            Tag = 3
            Left = 25
            Top = 95
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Off'
            OnClick = sbOnBoardSelfDefenseJammerControlModeAutoClick
          end
          object sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton
            Tag = 4
            Left = 150
            Top = 45
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Spot'
            OnClick = sbOnBoardSelfDefenseJammerControlModeAutoClick
          end
          object sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton
            Tag = 5
            Left = 150
            Top = 70
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Track'
            OnClick = sbOnBoardSelfDefenseJammerControlModeAutoClick
          end
          object grbManualTrack: TGroupBox
            Left = 15
            Top = 130
            Width = 283
            Height = 62
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 1
            Visible = False
            object Label24: TLabel
              Left = 15
              Top = 15
              Width = 77
              Height = 16
              Caption = 'Track          :'
            end
            object btnSDJammerTarget: TSpeedButton
              Left = 160
              Top = 12
              Width = 24
              Height = 24
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
              OnClick = btnSDJammerTargetClick
            end
            object edtSDJammerTarget: TEdit
              Left = 80
              Top = 12
              Width = 75
              Height = 24
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
          end
          object grbManualSpot: TGroupBox
            Left = 15
            Top = 130
            Width = 283
            Height = 63
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            Visible = False
            object Label547: TLabel
              Left = 13
              Top = 10
              Width = 88
              Height = 16
              Caption = 'Bearing          :'
            end
            object Label546: TLabel
              Left = 13
              Top = 37
              Width = 88
              Height = 16
              Caption = 'Spot Number  :'
            end
            object Label549: TLabel
              Left = 195
              Top = 10
              Width = 58
              Height = 16
              Caption = 'degrees T'
            end
            object edtOnBoardSelfDefenseJammerSpotNumber: TEdit
              Tag = 2
              Left = 115
              Top = 34
              Width = 63
              Height = 24
              Enabled = False
              TabOrder = 0
              Text = '0'
              OnKeyPress = edtOnBoardSelfDefenseText
            end
            object edtOnBoardSelfDefenseJammerBearing: TEdit
              Tag = 1
              Left = 115
              Top = 8
              Width = 63
              Height = 24
              Enabled = False
              TabOrder = 1
              Text = '000'
              OnKeyPress = edtOnBoardSelfDefenseText
            end
          end
        end
      end
      object grbRadarNoiseJammer: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 7
        object ScrollBox3: TScrollBox
          Left = 2
          Top = 18
          Width = 324
          Height = 392
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel117: TBevel
            Left = 65
            Top = 6
            Width = 245
            Height = 3
          end
          object btnComboRadarJammingControlMode: TSpeedButton
            Tag = 3
            Left = 290
            Top = 107
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
            Visible = False
            OnClick = btnRadarNoiseJammerOnClick
          end
          object Label532: TLabel
            Left = 25
            Top = 110
            Width = 44
            Height = 16
            Caption = 'Mode  :'
          end
          object Label557: TLabel
            Left = 10
            Top = -3
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label558: TLabel
            Left = 38
            Top = 20
            Width = 55
            Height = 16
            Caption = 'Activation'
          end
          object sbRadarJammingControlActivationOff: TSpeedButton
            Tag = 2
            Left = 25
            Top = 65
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Off'
            OnClick = btnRadarNoiseJammerOnClick
          end
          object sbRadarJammingControlActivationOn: TSpeedButton
            Tag = 1
            Left = 25
            Top = 40
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'On'
            OnClick = btnRadarNoiseJammerOnClick
          end
          object cbRadarJammingControlMode: TComboBox
            Left = 78
            Top = 107
            Width = 208
            Height = 24
            ItemIndex = 0
            TabOrder = 0
            Text = 'Barrage'
            OnChange = cbRadarJammingControlModeChange
            Items.Strings = (
              'Barrage'
              'Spot Jamming - Frequency'
              'Spot Jamming - Spot Number'
              'Spot Jamming - Selected Track')
          end
          object PanelRadarJammingMode: TPanel
            Left = 11
            Top = 145
            Width = 290
            Height = 106
            BevelOuter = bvNone
            TabOrder = 1
            object gbRadarJammingBarrageMode: TGroupBox
              Left = 0
              Top = 0
              Width = 290
              Height = 106
              Align = alClient
              TabOrder = 2
              object Label531: TLabel
                Left = 15
                Top = 10
                Width = 43
                Height = 16
                Caption = 'Bearing'
              end
              object Label533: TLabel
                Left = 205
                Top = 9
                Width = 58
                Height = 16
                Caption = 'degrees T'
              end
              object Label534: TLabel
                Left = 205
                Top = 31
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label536: TLabel
                Left = 15
                Top = 33
                Width = 101
                Height = 16
                Caption = 'Center Frequency'
              end
              object Label537: TLabel
                Left = 15
                Top = 56
                Width = 59
                Height = 16
                Caption = 'Bandwidth'
              end
              object Label538: TLabel
                Left = 205
                Top = 53
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label29: TLabel
                Left = 125
                Top = 10
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label30: TLabel
                Left = 125
                Top = 33
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label31: TLabel
                Left = 125
                Top = 56
                Width = 5
                Height = 16
                Caption = ':'
              end
              object editRadarJammingBarrageCenter: TEdit
                Tag = 2
                Left = 140
                Top = 31
                Width = 53
                Height = 24
                TabOrder = 0
                Text = '---'
                OnKeyPress = editRadarJammingBarrageBearingKeyPress
              end
              object editRadarJammingBarrageBearing: TEdit
                Tag = 1
                Left = 140
                Top = 8
                Width = 53
                Height = 24
                TabOrder = 1
                Text = '000'
                OnKeyPress = editRadarJammingBarrageBearingKeyPress
              end
              object editRadarJammingBarrageBandwidth: TEdit
                Tag = 3
                Left = 140
                Top = 54
                Width = 53
                Height = 24
                TabOrder = 2
                Text = '---'
                OnKeyPress = editRadarJammingBarrageBearingKeyPress
              end
            end
            object gbRadarJammingSelectedTrackMode: TGroupBox
              Left = 0
              Top = 0
              Width = 290
              Height = 106
              Align = alClient
              TabOrder = 0
              object Label518: TLabel
                Left = 15
                Top = 33
                Width = 43
                Height = 16
                Caption = 'Bearing'
              end
              object Label528: TLabel
                Left = 205
                Top = 33
                Width = 58
                Height = 16
                Caption = 'degrees T'
              end
              object Label530: TLabel
                Left = 205
                Top = 56
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label535: TLabel
                Left = 15
                Top = 56
                Width = 101
                Height = 16
                Caption = 'Center Frequency'
              end
              object Label539: TLabel
                Left = 15
                Top = 79
                Width = 59
                Height = 16
                Caption = 'Bandwidth'
              end
              object Label540: TLabel
                Left = 205
                Top = 79
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label541: TLabel
                Left = 15
                Top = 10
                Width = 32
                Height = 16
                Caption = 'Track'
              end
              object btnRadarJammingModeSelectedTrackTrack: TSpeedButton
                Left = 205
                Top = 8
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
                OnClick = btnRadarJammingModeSelectedTrackTrackClick
              end
              object Label32: TLabel
                Left = 125
                Top = 10
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label33: TLabel
                Left = 125
                Top = 33
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label34: TLabel
                Left = 125
                Top = 56
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label35: TLabel
                Left = 125
                Top = 79
                Width = 5
                Height = 16
                Caption = ':'
              end
              object editRadarJammingModeSelectedTrackCenterFreq: TEdit
                Left = 140
                Top = 54
                Width = 53
                Height = 24
                TabOrder = 0
                Text = '10.0'
              end
              object editRadarJammingModeSelectedTrackBearing: TEdit
                Left = 140
                Top = 31
                Width = 53
                Height = 24
                TabOrder = 1
                Text = '000'
              end
              object editRadarJammingModeSelectedTrackBandwidth: TEdit
                Left = 140
                Top = 77
                Width = 53
                Height = 24
                TabOrder = 2
                Text = '2.0'
              end
              object editRadarJammingSelectedTrackModeTrack: TEdit
                Left = 140
                Top = 8
                Width = 53
                Height = 24
                Enabled = False
                TabOrder = 3
                Text = '1022'
              end
            end
            object gbRadarJammingSpotNumberMode: TGroupBox
              Left = 0
              Top = 0
              Width = 290
              Height = 106
              TabOrder = 1
              object Label519: TLabel
                Left = 15
                Top = 33
                Width = 43
                Height = 16
                Caption = 'Bearing'
              end
              object Label521: TLabel
                Left = 205
                Top = 33
                Width = 58
                Height = 16
                Caption = 'degrees T'
              end
              object Label522: TLabel
                Left = 205
                Top = 56
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label523: TLabel
                Left = 15
                Top = 56
                Width = 101
                Height = 16
                Caption = 'Center Frequency'
              end
              object Label524: TLabel
                Left = 15
                Top = 79
                Width = 59
                Height = 16
                Caption = 'Bandwidth'
              end
              object Label525: TLabel
                Left = 205
                Top = 79
                Width = 23
                Height = 16
                Caption = 'Mhz'
              end
              object Label517: TLabel
                Left = 15
                Top = 10
                Width = 75
                Height = 16
                Caption = 'Spot Number'
              end
              object Label25: TLabel
                Left = 125
                Top = 10
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label26: TLabel
                Left = 125
                Top = 33
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label27: TLabel
                Left = 125
                Top = 56
                Width = 5
                Height = 16
                Caption = ':'
              end
              object Label28: TLabel
                Left = 125
                Top = 79
                Width = 5
                Height = 16
                Caption = ':'
              end
              object editRadarJammingSpotNumberCenter: TEdit
                Tag = 3
                Left = 140
                Top = 54
                Width = 53
                Height = 24
                TabOrder = 0
                Text = '10.0'
              end
              object editRadarJammingSpotNumberBearing: TEdit
                Tag = 2
                Left = 140
                Top = 31
                Width = 53
                Height = 24
                TabOrder = 1
                Text = '000'
                OnKeyPress = editRadarJammingSpotNumberSpotKeyPress
              end
              object editRadarJammingSpotNumberBandwidth: TEdit
                Tag = 4
                Left = 140
                Top = 78
                Width = 53
                Height = 24
                TabOrder = 2
                Text = '2.0'
              end
              object editRadarJammingSpotNumberSpot: TEdit
                Tag = 1
                Left = 140
                Top = 8
                Width = 53
                Height = 24
                TabOrder = 3
                Text = '---'
                OnKeyPress = editRadarJammingSpotNumberSpotKeyPress
              end
            end
          end
        end
      end
      object grbSurfaceChaffDeployment: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 5
        object ScrollBox2: TScrollBox
          Left = 2
          Top = 18
          Width = 324
          Height = 392
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel3: TBevel
            Left = 80
            Top = 7
            Width = 225
            Height = 3
          end
          object Label10: TLabel
            Left = 10
            Top = 0
            Width = 60
            Height = 16
            Caption = 'Distraction'
          end
          object Label11: TLabel
            Left = 14
            Top = 20
            Width = 52
            Height = 16
            Caption = 'Launcher'
          end
          object Label12: TLabel
            Left = 14
            Top = 45
            Width = 43
            Height = 16
            Caption = 'Bearing'
          end
          object Label13: TLabel
            Left = 14
            Top = 100
            Width = 62
            Height = 16
            Caption = 'Chaff Type'
          end
          object Label14: TLabel
            Left = 14
            Top = 125
            Width = 47
            Height = 16
            Caption = 'Quantity'
          end
          object Label15: TLabel
            Left = 14
            Top = 150
            Width = 75
            Height = 16
            Caption = 'Bloom Range'
          end
          object Label16: TLabel
            Left = 14
            Top = 175
            Width = 82
            Height = 16
            Caption = 'Bloom Altitude'
          end
          object Label17: TLabel
            Left = 14
            Top = 200
            Width = 59
            Height = 16
            Caption = 'Salvo Size'
          end
          object Label18: TLabel
            Left = 14
            Top = 225
            Width = 31
            Height = 16
            Caption = 'Delay'
          end
          object lblSurfaceChaffQuantity: TLabel
            Left = 120
            Top = 125
            Width = 15
            Height = 16
            Caption = '---'
          end
          object btnSurfaceChaffLauncher: TSpeedButton
            Tag = 1
            Left = 285
            Top = 17
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
            OnClick = btnSurfaceChaffOnClick
          end
          object btnSurfaceChaffType: TSpeedButton
            Tag = 2
            Left = 285
            Top = 97
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
            OnClick = btnSurfaceChaffOnClick
          end
          object btnSurfaceChaffCopy: TSpeedButton
            Tag = 3
            Left = 15
            Top = 260
            Width = 135
            Height = 28
            Caption = 'Copy to All Launchers'
            OnClick = btnSurfaceChaffOnClick
          end
          object btnSurfaceChaffLaunch: TSpeedButton
            Tag = 4
            Left = 170
            Top = 260
            Width = 135
            Height = 28
            Caption = 'Launch Distraction'
            OnClick = btnSurfaceChaffOnClick
          end
          object btnSurfaceChaffAbort: TSpeedButton
            Tag = 5
            Left = 170
            Top = 290
            Width = 135
            Height = 28
            Caption = 'Abort Salvo'
            OnClick = btnSurfaceChaffOnClick
          end
          object Label19: TLabel
            Left = 10
            Top = 325
            Width = 56
            Height = 16
            Caption = 'Seduction'
          end
          object Bevel4: TBevel
            Left = 80
            Top = 332
            Width = 225
            Height = 3
          end
          object Label20: TLabel
            Left = 210
            Top = 150
            Width = 18
            Height = 16
            Caption = 'nm'
          end
          object Label21: TLabel
            Left = 210
            Top = 175
            Width = 22
            Height = 16
            Caption = 'feet'
          end
          object Label22: TLabel
            Left = 210
            Top = 225
            Width = 46
            Height = 16
            Caption = 'seconds'
          end
          object Label23: TLabel
            Left = 210
            Top = 45
            Width = 58
            Height = 16
            Caption = 'degrees R'
          end
          object edtSurfaceChaffLauncher: TEdit
            Left = 120
            Top = 16
            Width = 160
            Height = 24
            ReadOnly = True
            TabOrder = 0
          end
          object edtSurfaceChaffBearing: TEdit
            Tag = 1
            Left = 120
            Top = 41
            Width = 75
            Height = 24
            TabOrder = 1
            OnKeyPress = OnSurfaceChaffKeyPress
          end
          object edtSurfaceChaffType: TEdit
            Left = 120
            Top = 96
            Width = 160
            Height = 24
            ReadOnly = True
            TabOrder = 2
          end
          object edtSurfaceChaffBloomRange: TEdit
            Tag = 2
            Left = 120
            Top = 146
            Width = 75
            Height = 24
            TabOrder = 3
            OnKeyPress = OnSurfaceChaffKeyPress
          end
          object edtSurfaceChaffBloomAltitude: TEdit
            Tag = 3
            Left = 120
            Top = 171
            Width = 75
            Height = 24
            TabOrder = 4
            OnKeyPress = OnSurfaceChaffKeyPress
          end
          object edtSurfaceChaffSalvoSize: TEdit
            Tag = 4
            Left = 120
            Top = 196
            Width = 75
            Height = 24
            TabOrder = 5
            OnKeyPress = OnSurfaceChaffKeyPress
          end
          object edtSurfaceChaffDelay: TEdit
            Tag = 5
            Left = 120
            Top = 221
            Width = 75
            Height = 24
            TabOrder = 6
            OnKeyPress = OnSurfaceChaffKeyPress
          end
          object ckSurfaceChaffEnabled: TCheckBox
            Left = 14
            Top = 70
            Width = 97
            Height = 17
            Caption = 'Enabled'
            TabOrder = 7
            OnClick = ckSurfaceChaffEnabledClick
          end
          object ckSurfaceChaffSeductionEnabled: TCheckBox
            Left = 14
            Top = 350
            Width = 97
            Height = 17
            Caption = 'Enabled'
            TabOrder = 8
          end
        end
      end
      object grbTowedJammerDecoy: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 2
        object ScrollBox4: TScrollBox
          Left = 2
          Top = 18
          Width = 324
          Height = 392
          Align = alClient
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
          object Bevel109: TBevel
            Left = 215
            Top = 242
            Width = 90
            Height = 2
          end
          object Bevel111: TBevel
            Left = 65
            Top = 7
            Width = 245
            Height = 3
          end
          object Bevel118: TBevel
            Left = 90
            Top = 197
            Width = 220
            Height = 3
          end
          object Label501: TLabel
            Left = 10
            Top = 0
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label503: TLabel
            Left = 45
            Top = 25
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label504: TLabel
            Left = 20
            Top = 155
            Width = 84
            Height = 16
            Caption = 'Spot Number :'
          end
          object Label505: TLabel
            Left = 150
            Top = 25
            Width = 55
            Height = 16
            Caption = 'Targeting'
          end
          object Label506: TLabel
            Left = 20
            Top = 130
            Width = 52
            Height = 16
            Caption = 'Bearing :'
          end
          object Label507: TLabel
            Left = 210
            Top = 130
            Width = 58
            Height = 16
            Caption = 'degrees T'
          end
          object Label508: TLabel
            Left = 41
            Top = 215
            Width = 35
            Height = 16
            Caption = 'Action'
          end
          object Label509: TLabel
            Left = 130
            Top = 215
            Width = 56
            Height = 16
            Caption = 'Quantity :'
          end
          object Label512: TLabel
            Left = 130
            Top = 235
            Width = 67
            Height = 16
            Caption = 'Tow Length'
          end
          object Label559: TLabel
            Left = 10
            Top = 190
            Width = 67
            Height = 16
            Caption = 'Deployment'
          end
          object Label560: TLabel
            Left = 130
            Top = 255
            Width = 56
            Height = 16
            Caption = 'Ordered :'
          end
          object Label561: TLabel
            Left = 130
            Top = 275
            Width = 44
            Height = 16
            Caption = 'Actual :'
          end
          object Label563: TLabel
            Left = 265
            Top = 275
            Width = 40
            Height = 16
            Caption = 'metres'
          end
          object Label564: TLabel
            Left = 265
            Top = 255
            Width = 40
            Height = 16
            Caption = 'metres'
          end
          object lblTowedJammerDecoyActual: TLabel
            Left = 215
            Top = 275
            Width = 10
            Height = 16
            Caption = '--'
          end
          object lblTowedJammerDecoyQuantity: TLabel
            Left = 215
            Top = 215
            Width = 7
            Height = 16
            Caption = '1'
          end
          object sbTowedJammerDecoyActionDeploy: TSpeedButton
            Left = 18
            Top = 235
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Deploy'
            Enabled = False
          end
          object sbTowedJammerDecoyActionStow: TSpeedButton
            Left = 18
            Top = 260
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Stow'
            Enabled = False
          end
          object sbTowedJammerDecoyModeAuto: TSpeedButton
            Left = 20
            Top = 45
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Automatic'
            Enabled = False
          end
          object sbTowedJammerDecoyModeManual: TSpeedButton
            Left = 20
            Top = 70
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Manual'
            Enabled = False
          end
          object sbTowedJammerDecoyModeOff: TSpeedButton
            Left = 20
            Top = 95
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Off'
            Enabled = False
          end
          object sbTowedJammerDecoyTargetingSpot: TSpeedButton
            Left = 138
            Top = 45
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Spot'
            Enabled = False
          end
          object sbTowedJammerDecoyTargetingTrack: TSpeedButton
            Left = 138
            Top = 70
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Track'
            Enabled = False
          end
          object editTowedJammerDecoyOrdered: TEdit
            Left = 215
            Top = 251
            Width = 40
            Height = 24
            Enabled = False
            TabOrder = 0
          end
          object edtTowedJammerDecoyBearing: TEdit
            Left = 110
            Top = 126
            Width = 88
            Height = 24
            Enabled = False
            TabOrder = 1
            Text = '000'
          end
          object edtTowedJammerDecoySpotNumb: TEdit
            Left = 110
            Top = 151
            Width = 88
            Height = 24
            Enabled = False
            TabOrder = 2
            Text = '---'
          end
        end
      end
      object grpAirBubble: TGroupBox
        Left = 0
        Top = 0
        Width = 328
        Height = 412
        Align = alClient
        TabOrder = 6
        object lblDeploy: TLabel
          Left = 10
          Top = 5
          Width = 67
          Height = 16
          Caption = 'Deployment'
        end
        object lblQuant: TLabel
          Left = 20
          Top = 60
          Width = 56
          Height = 16
          Caption = 'Quantity :'
        end
        object lblType: TLabel
          Left = 20
          Top = 35
          Width = 37
          Height = 16
          Caption = 'Type :'
        end
        object bvl1: TBevel
          Left = 90
          Top = 12
          Width = 220
          Height = 3
        end
        object lblBubblelQuantity: TLabel
          Left = 97
          Top = 60
          Width = 15
          Height = 16
          Caption = '---'
        end
        object btnType: TSpeedButton
          Left = 284
          Top = 32
          Width = 23
          Height = 22
          Enabled = False
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
          Visible = False
          OnClick = btnAirboneChaffTypeClick
        end
        object edtBubble: TEdit
          Left = 97
          Top = 31
          Width = 175
          Height = 24
          ReadOnly = True
          TabOrder = 0
          Text = 'Air Bubble'
        end
        object btnAirBubbleDeploy: TButton
          Left = 20
          Top = 100
          Width = 80
          Height = 25
          Caption = 'Deploy'
          TabOrder = 1
          OnClick = btnAirBubbleDeployClick
        end
      end
    end
  end
  object PanelCounterMeasureSpace: TPanel
    Left = 0
    Top = 100
    Width = 328
    Height = 14
    Align = alTop
    BevelOuter = bvNone
    Color = 16775920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object PanelCounterMeasureChoice: TPanel
    Left = 0
    Top = 0
    Width = 328
    Height = 100
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    TabOrder = 2
    object lvECM: TListView
      Left = 0
      Top = 0
      Width = 324
      Height = 96
      Align = alClient
      Color = clWhite
      Columns = <
        item
          Caption = 'Name'
          Width = 243
        end
        item
          Caption = 'Status'
          Width = 80
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
      OnSelectItem = lvECMSelectItem
    end
  end
  object pmChaffType: TPopupMenu
    Left = 248
    Top = 464
  end
  object pmChaffLauncher: TPopupMenu
    Left = 284
    Top = 472
  end
  object pmNoiseJammerMode: TPopupMenu
    Left = 162
    Top = 470
    object mniJammBarrage: TMenuItem
      Caption = 'Barrage'
    end
    object mniJammFreq: TMenuItem
      Caption = 'Spot Jamming - Frequency'
    end
    object mniJammSpotNumber: TMenuItem
      Caption = 'Spot Jamming - Spot Number'
    end
    object mniJammSelectedTrack: TMenuItem
      Caption = 'Spot Jamming - Selected Track'
    end
  end
end
