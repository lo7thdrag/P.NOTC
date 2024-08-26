object fPlatformDeploytment: TfPlatformDeploytment
  Left = 0
  Top = 0
  Caption = 'Platform Deployment - Selected Scenario'
  ClientHeight = 746
  ClientWidth = 1351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelToolBar: TPanel
    Left = 1
    Top = -1
    Width = 377
    Height = 33
    TabOrder = 4
    object ToolBar1: TToolBar
      Left = 7
      Top = 1
      Width = 370
      Height = 29
      Align = alNone
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 0
      object ToolButton3: TToolButton
        Left = 0
        Top = 0
        Caption = 'ToolButton3'
        ImageIndex = 31
        OnClick = ToolButton3Click
      end
      object ToolButton1: TToolButton
        Left = 23
        Top = 0
        Hint = 'Select Point'
        Caption = 'ToolButton1'
        ImageIndex = 11
        OnClick = ToolButton1Click
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Hint = 'Add Point'
        Caption = 'ToolButton2'
        ImageIndex = 12
      end
      object ToolButton9: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object toolbtnDecreaseScale: TToolButton
        Left = 77
        Top = 0
        Hint = 'Decrease Scale'
        Caption = 'toolbtnDecreaseScale'
        ImageIndex = 1
        OnClick = toolbtnDecreaseScaleClick
      end
      object cbSetScale: TComboBox
        Left = 100
        Top = 0
        Width = 72
        Height = 21
        Hint = 'Map Scales'
        TabOrder = 0
        OnChange = cbSetScaleChange
        Items.Strings = (
          '1'
          '2'
          '4'
          '8'
          '16'
          '32'
          '64'
          '128'
          '256'
          '512'
          '1024')
      end
      object toolbtnIncreaseScale: TToolButton
        Left = 172
        Top = 0
        Hint = 'Increase Scale'
        Caption = 'toolbtnIncreaseScale'
        ImageIndex = 2
        OnClick = toolbtnIncreaseScaleClick
      end
      object ToolButton12: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Caption = 'ToolButton12'
        ImageIndex = 8
        Style = tbsSeparator
      end
      object ToolButton13: TToolButton
        Left = 203
        Top = 0
        Hint = 'Zoom In / Out'
        Caption = 'ToolButton13'
        ImageIndex = 3
        OnClick = ToolButton13Click
      end
      object ToolButton14: TToolButton
        Left = 226
        Top = 0
        Hint = 'move tool'
        Caption = 'ToolButton14'
        ImageIndex = 6
        OnClick = ToolButton14Click
      end
      object ToolButton10: TToolButton
        Left = 249
        Top = 0
        Hint = 'Center Hook'
        Caption = 'ToolButton10'
        ImageIndex = 5
        OnClick = ToolButton10Click
      end
    end
  end
  object platformPanel: TPanel
    Left = 1
    Top = 262
    Width = 377
    Height = 632
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 17
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object BitBtn1: TBitBtn
      Left = 323
      Top = 32
      Width = 33
      Height = 25
      Caption = '...'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object btnApply: TButton
      Left = 250
      Top = 388
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 169
      Top = 388
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnEditFormaions: TButton
      Left = 7
      Top = 419
      Width = 101
      Height = 25
      Caption = 'Edit Formations...'
      TabOrder = 3
      OnClick = btnEditFormaionsClick
    end
    object btnOK: TButton
      Left = 88
      Top = 388
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 4
      OnClick = btnOKClick
    end
    object btnRemove: TButton
      Left = 7
      Top = 388
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 5
      OnClick = btnRemoveClick
    end
    object btnScreenCapture: TButton
      Left = 114
      Top = 419
      Width = 111
      Height = 25
      Caption = 'Screen Capture ...'
      TabOrder = 6
      OnClick = btnScreenCaptureClick
    end
    object edPlatform: TEdit
      Left = 12
      Top = 34
      Width = 305
      Height = 21
      Enabled = False
      TabOrder = 7
    end
    object HookContactInfoTraineeDisplay: TPageControl
      Left = 7
      Top = 63
      Width = 361
      Height = 314
      ActivePage = tsHook
      TabOrder = 8
      object tsHook: TTabSheet
        Caption = 'Initial'
        object Label3: TLabel
          Left = 3
          Top = 30
          Width = 37
          Height = 13
          Caption = 'Position'
        end
        object Label4: TLabel
          Left = 3
          Top = 54
          Width = 19
          Height = 13
          Caption = 'Grid'
        end
        object Label7: TLabel
          Left = 0
          Top = 85
          Width = 104
          Height = 13
          Caption = 'Approximate Position '
        end
        object Label9: TLabel
          Left = 140
          Top = 109
          Width = 3
          Height = 13
        end
        object Label23: TLabel
          Left = 101
          Top = 30
          Width = 15
          Height = 13
          Caption = 'Lat'
        end
        object Label24: TLabel
          Left = 220
          Top = 30
          Width = 23
          Height = 13
          Caption = 'Long'
        end
        object Label6: TLabel
          Left = 220
          Top = 54
          Width = 21
          Height = 13
          Caption = 'horz'
        end
        object Label8: TLabel
          Left = 101
          Top = 54
          Width = 20
          Height = 13
          Caption = 'vert'
        end
        object btnApproximatePosition: TSpeedButton
          Left = 110
          Top = 80
          Width = 33
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
          OnClick = btnApproximatePositionClick
        end
        object StaticText1: TStaticText
          Left = 3
          Top = 3
          Width = 77
          Height = 17
          Caption = 'Activation Time'
          TabOrder = 0
        end
        object StaticText7: TStaticText
          Left = 3
          Top = 113
          Width = 38
          Height = 17
          Caption = 'Course'
          TabOrder = 1
        end
        object StaticText8: TStaticText
          Left = 3
          Top = 137
          Width = 57
          Height = 17
          Caption = 'Helm Angle'
          TabOrder = 2
        end
        object StaticText9: TStaticText
          Left = 3
          Top = 162
          Width = 72
          Height = 17
          Caption = 'Ground Speed'
          TabOrder = 3
        end
        object StaticText10: TStaticText
          Left = 3
          Top = 186
          Width = 74
          Height = 17
          Caption = 'Altitude/Depth'
          TabOrder = 4
        end
        object StaticText25: TStaticText
          Left = 89
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 5
        end
        object StaticText28: TStaticText
          Left = 89
          Top = 29
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object StaticText29: TStaticText
          Left = 89
          Top = 52
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText31: TStaticText
          Left = 103
          Top = 85
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText33: TStaticText
          Left = 89
          Top = 137
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object StaticText34: TStaticText
          Left = 89
          Top = 162
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 10
        end
        object StaticText35: TStaticText
          Left = 89
          Top = 186
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 11
        end
        object StaticText36: TStaticText
          Left = 89
          Top = 112
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 12
        end
        object dtpActivationTime: TDateTimePicker
          Left = 96
          Top = 0
          Width = 186
          Height = 21
          Date = 40492.082330000000000000
          Time = 40492.082330000000000000
          Kind = dtkTime
          TabOrder = 13
        end
        object edLatPosition: TEdit
          Left = 124
          Top = 27
          Width = 90
          Height = 21
          TabOrder = 14
        end
        object edLongPosition: TEdit
          Left = 249
          Top = 27
          Width = 90
          Height = 21
          TabOrder = 15
        end
        object edHorz: TEdit
          Left = 249
          Top = 51
          Width = 90
          Height = 21
          TabOrder = 16
        end
        object edVert: TEdit
          Left = 124
          Top = 51
          Width = 90
          Height = 21
          TabOrder = 17
        end
        object edCourse: TEdit
          Left = 103
          Top = 108
          Width = 90
          Height = 21
          TabOrder = 18
        end
        object edHelmAngle: TEdit
          Left = 103
          Top = 132
          Width = 90
          Height = 21
          TabOrder = 19
        end
        object cbGroundSpeed: TComboBox
          Left = 103
          Top = 159
          Width = 145
          Height = 21
          TabOrder = 20
          Items.Strings = (
            'Minimum'
            'Cruise'
            'High'
            'Maximum')
        end
        object edAltitude: TEdit
          Left = 103
          Top = 185
          Width = 90
          Height = 21
          TabOrder = 21
        end
        object cbVerticalSpeed: TComboBox
          Left = 103
          Top = 212
          Width = 145
          Height = 21
          TabOrder = 22
          Text = 'Level'
          Items.Strings = (
            'Maximum Climb'
            'Normal Climb'
            'Level'
            'Maximum Descent'
            'Normal Descent')
        end
        object StaticText6: TStaticText
          Left = 89
          Top = 215
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 23
        end
        object StaticText16: TStaticText
          Left = 3
          Top = 215
          Width = 72
          Height = 17
          Caption = 'Vertical Speed'
          TabOrder = 24
        end
        object btnIFFActivation: TButton
          Left = 249
          Top = 248
          Width = 89
          Height = 25
          Caption = 'IFF Activation'
          TabOrder = 25
        end
      end
      object tsDetails: TTabSheet
        Caption = 'Lateral'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 33
          Width = 353
          Height = 253
          Align = alClient
          TabOrder = 0
          object grbZigZagGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 12
            object Label35: TLabel
              Left = 16
              Top = 130
              Width = 84
              Height = 13
              Caption = 'Ground Speed   : '
            end
            object Label36: TLabel
              Left = 211
              Top = 75
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object lblAmplitude: TLabel
              Left = 17
              Top = 103
              Width = 81
              Height = 13
              Caption = 'Amplitude         : '
            end
            object lblPeriod: TLabel
              Left = 16
              Top = 75
              Width = 82
              Height = 13
              Caption = 'Period               : '
            end
            object lblLegLength: TLabel
              Left = 16
              Top = 21
              Width = 84
              Height = 13
              Caption = 'Leg Length        : '
            end
            object lblBaseCourse: TLabel
              Left = 17
              Top = 49
              Width = 82
              Height = 13
              Caption = 'Base Course     : '
            end
            object Label37: TLabel
              Left = 211
              Top = 103
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label38: TLabel
              Left = 211
              Top = 49
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object edtPeriod_ZigZagGuidance: TEdit
              Left = 106
              Top = 72
              Width = 90
              Height = 21
              TabOrder = 0
            end
            object cmbGroundSpeed_ZigZagGuidance: TComboBox
              Left = 106
              Top = 126
              Width = 221
              Height = 21
              TabOrder = 1
            end
            object edtAmplitude_ZigZagGuidance: TEdit
              Left = 106
              Top = 99
              Width = 90
              Height = 21
              TabOrder = 2
            end
            object edtBaseCourse_ZigZagGuidance: TEdit
              Left = 106
              Top = 45
              Width = 90
              Height = 21
              TabOrder = 3
            end
            object cmbLegLength_ZigZagGuidance: TComboBox
              Left = 105
              Top = 18
              Width = 222
              Height = 21
              TabOrder = 4
            end
          end
          object grbPatternOnPointGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 9
            object Label12: TLabel
              Left = 16
              Top = 18
              Width = 104
              Height = 13
              Caption = 'Predefined Pattern   :'
            end
            object spbtnPredefinedPattern_PatternOnPointGuidance: TSpeedButton
              Left = 301
              Top = 35
              Width = 26
              Height = 22
              Caption = '...'
            end
            object Label13: TLabel
              Left = 16
              Top = 77
              Width = 90
              Height = 13
              Caption = 'Angular Offset    : '
            end
            object Label14: TLabel
              Left = 208
              Top = 77
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object lbl1: TLabel
              Left = 16
              Top = 107
              Width = 87
              Height = 13
              Caption = 'Anchor Position   :'
            end
            object Label15: TLabel
              Left = 16
              Top = 134
              Width = 90
              Height = 13
              Caption = 'Anchor Grid         : '
            end
            object spbtnAnchorPosition_PatternOnPointGuidance: TSpeedButton
              Left = 304
              Top = 104
              Width = 23
              Height = 22
              Caption = '+'
            end
            object edtPredefinedPattern_PatternOnPointGuidance: TEdit
              Left = 16
              Top = 37
              Width = 279
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edtAngularOffset_PatternOnPointGuidance: TEdit
              Left = 112
              Top = 74
              Width = 90
              Height = 21
              TabOrder = 1
            end
            object edtLatAnchor_PatternOnPointGuidance: TEdit
              Left = 112
              Top = 104
              Width = 90
              Height = 21
              TabOrder = 2
            end
            object edtLongAnchor_PatternOnPointGuidance: TEdit
              Left = 208
              Top = 104
              Width = 90
              Height = 21
              TabOrder = 3
            end
            object edtYanchor_PatternOnPointGuidance: TEdit
              Left = 208
              Top = 131
              Width = 90
              Height = 21
              TabOrder = 4
            end
            object edtXanchor_PatternOnPointGuidance: TEdit
              Left = 112
              Top = 131
              Width = 90
              Height = 21
              TabOrder = 5
            end
          end
          object grbHelmGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 11
            object lblHelm: TLabel
              Left = 16
              Top = 18
              Width = 81
              Height = 13
              Caption = 'Helm Angle       : '
            end
            object Label16: TLabel
              Left = 16
              Top = 53
              Width = 81
              Height = 13
              Caption = 'Ground Speed  : '
            end
            object Label17: TLabel
              Left = 208
              Top = 18
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object edtHelmAngle_HelmGuidance: TEdit
              Left = 103
              Top = 15
              Width = 99
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object cmbGroundSpeed_HelmGuidance: TComboBox
              Left = 103
              Top = 50
              Width = 224
              Height = 21
              TabOrder = 1
            end
          end
          object grbStraightGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 7
            object lblCourse: TLabel
              Left = 16
              Top = 18
              Width = 80
              Height = 13
              Caption = 'Course              :'
            end
            object lblGroundSpeed: TLabel
              Left = 16
              Top = 53
              Width = 81
              Height = 13
              Caption = 'Ground Speed   :'
            end
            object Label57: TLabel
              Left = 279
              Top = 16
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object edtCourse_StraightGuidance: TEdit
              Left = 102
              Top = 15
              Width = 163
              Height = 21
              TabOrder = 0
            end
            object cmbGroundSpeed_StraightGuidance: TComboBox
              Left = 102
              Top = 50
              Width = 225
              Height = 21
              TabOrder = 1
            end
          end
          object grbDefaultKosong: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 17
          end
          object grbPatternOnSelfGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 8
            object lblPredefined: TLabel
              Left = 16
              Top = 18
              Width = 101
              Height = 13
              Caption = 'Predefined Pattern  :'
            end
            object lblAngular: TLabel
              Left = 16
              Top = 77
              Width = 84
              Height = 13
              Caption = 'Angular Offset  : '
            end
            object spbtnAngularOffset_PatternOnSelfGuidance: TSpeedButton
              Left = 301
              Top = 35
              Width = 26
              Height = 22
              Caption = '...'
            end
            object Label5: TLabel
              Left = 244
              Top = 77
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object edtPredefinedPattern_PatternOnSelfGuidance: TEdit
              Left = 16
              Top = 37
              Width = 274
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edtAngularOffset_PatternOnSelfGuidance: TEdit
              Left = 104
              Top = 74
              Width = 134
              Height = 21
              TabOrder = 1
            end
          end
          object grbPatternOnTargetGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 15
            object Label10: TLabel
              Left = 16
              Top = 18
              Width = 104
              Height = 13
              Caption = 'Predefined Pattern   :'
            end
            object Label11: TLabel
              Left = 16
              Top = 77
              Width = 51
              Height = 13
              Caption = 'Target    : '
            end
            object spbtnPredefinedPattern_PatternOnTargetGuidance: TSpeedButton
              Left = 301
              Top = 35
              Width = 26
              Height = 22
              Caption = '...'
            end
            object spbtnTarget_PatternOnTargetGuidance: TSpeedButton
              Left = 301
              Top = 71
              Width = 26
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
            object LblAngularOffset: TLabel
              Left = 16
              Top = 114
              Width = 105
              Height = 13
              Caption = 'Angular Offset         : '
            end
            object Label58: TLabel
              Left = 237
              Top = 114
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object edtPredefinedPattern_PatternOnTargetGuidance: TEdit
              Left = 16
              Top = 37
              Width = 276
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edtTarget_PatternOnTargetGuidance: TEdit
              Left = 73
              Top = 74
              Width = 219
              Height = 21
              Enabled = False
              TabOrder = 1
            end
            object edtAngularOffset_PatternOnTargetGuidance: TEdit
              Left = 127
              Top = 110
              Width = 104
              Height = 21
              TabOrder = 2
            end
          end
          object grbReturnToBaseGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 14
            object Label18: TLabel
              Left = 16
              Top = 18
              Width = 81
              Height = 13
              Caption = 'Ground Speed  : '
            end
            object lblBase: TLabel
              Left = 18
              Top = 55
              Width = 45
              Height = 13
              Caption = 'Base     : '
            end
            object spbtnBase_ReturnToBaseGuidance: TSpeedButton
              Left = 301
              Top = 50
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
            object edtBase_ReturnToBaseGuidance: TEdit
              Left = 69
              Top = 50
              Width = 226
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object cmbGroundSpeed_ReturnToBaseGuidance: TComboBox
              Left = 103
              Top = 15
              Width = 223
              Height = 21
              TabOrder = 1
            end
          end
          object grbStationKeepOnTrackGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 13
            object Label19: TLabel
              Left = 16
              Top = 21
              Width = 45
              Height = 13
              Caption = 'Target  : '
            end
            object SpeedButton1: TSpeedButton
              Left = 304
              Top = 18
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
            object lblNM: TLabel
              Left = 224
              Top = 53
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object lblDegrees: TLabel
              Left = 224
              Top = 80
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object lblTArgetRange: TLabel
              Left = 16
              Top = 53
              Width = 79
              Height = 13
              Caption = 'Target Range  : '
            end
            object lblAngleOffset: TLabel
              Left = 16
              Top = 80
              Width = 80
              Height = 13
              Caption = 'Angle Offset    : '
            end
            object edtTarget_StationKeepOnTrackGuidance: TEdit
              Left = 67
              Top = 18
              Width = 225
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edtTargetRange_StationKeepOnTrackGuidance: TEdit
              Left = 107
              Top = 50
              Width = 102
              Height = 21
              TabOrder = 1
            end
            object edtAngleOffset_StationKeepOnTrackGuidance: TEdit
              Left = 107
              Top = 77
              Width = 102
              Height = 21
              TabOrder = 2
            end
            object cbxAbsoluteOffsiteAngle_StationKeepOnTrackGuidance: TCheckBox
              Left = 16
              Top = 108
              Width = 129
              Height = 17
              Caption = 'Absolute Offsite Angle'
              TabOrder = 3
            end
          end
          object grbStationKeepOnPositionGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 16
            object Label20: TLabel
              Left = 16
              Top = 21
              Width = 84
              Height = 13
              Caption = 'Anchor Position : '
            end
            object Label21: TLabel
              Left = 16
              Top = 53
              Width = 84
              Height = 13
              Caption = 'Anchor  Grid      : '
            end
            object spbtnAnchorPosition_StationKeepOnPositionGuidance: TSpeedButton
              Left = 303
              Top = 18
              Width = 23
              Height = 22
              Caption = '+'
            end
            object edtAnchorLat_StationKeepOnPositionGuidance: TEdit
              Left = 101
              Top = 18
              Width = 96
              Height = 21
              TabOrder = 0
            end
            object cbxDriftsOnCurrent_StationKeepOnPositionGuidance: TCheckBox
              Left = 16
              Top = 85
              Width = 129
              Height = 17
              Caption = 'Drifts on Current'
              TabOrder = 1
            end
            object edtAnchorLong_StationKeepOnPositionGuidance: TEdit
              Left = 200
              Top = 18
              Width = 97
              Height = 21
              TabOrder = 2
            end
            object edtAnchorY_StationKeepOnPositionGuidance: TEdit
              Left = 200
              Top = 50
              Width = 96
              Height = 21
              TabOrder = 3
            end
            object edtAnchorX_StationKeepOnPositionGuidance: TEdit
              Left = 102
              Top = 50
              Width = 94
              Height = 21
              TabOrder = 4
            end
          end
          object grbCircleOnTrackGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 0
            object Label25: TLabel
              Left = 16
              Top = 18
              Width = 45
              Height = 13
              Caption = 'Target   :'
            end
            object Label26: TLabel
              Left = 17
              Top = 102
              Width = 78
              Height = 13
              Caption = 'Ground Speed : '
            end
            object spTarget_CircleOnTrackGuidance: TSpeedButton
              Left = 303
              Top = 14
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
            object lblRangeOffset: TLabel
              Left = 17
              Top = 131
              Width = 78
              Height = 13
              Caption = 'Range Offset  : '
            end
            object Label27: TLabel
              Left = 16
              Top = 158
              Width = 80
              Height = 13
              Caption = 'Angle Offset    : '
            end
            object Label28: TLabel
              Left = 160
              Top = 46
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object lblDirection: TLabel
              Left = 17
              Top = 73
              Width = 76
              Height = 13
              Caption = 'Direction         : '
            end
            object lblRadius: TLabel
              Left = 16
              Top = 46
              Width = 75
              Height = 13
              Caption = 'Radius            : '
            end
            object lblnmm: TLabel
              Left = 162
              Top = 129
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label29: TLabel
              Left = 162
              Top = 157
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object edtTarget_CircleOnTrackGuidance: TEdit
              Left = 67
              Top = 15
              Width = 230
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edtRadius_CircleOnTrackGuidance: TEdit
              Left = 100
              Top = 42
              Width = 54
              Height = 21
              TabOrder = 1
            end
            object cbxAbsoluteOffsetAngle_CircleOnTrackGuidance: TCheckBox
              Left = 16
              Top = 185
              Width = 129
              Height = 17
              Caption = 'Absolute Offset Angle'
              TabOrder = 2
            end
            object cmbDirection_CircleOnTrackGuidance: TComboBox
              Left = 100
              Top = 70
              Width = 226
              Height = 21
              TabOrder = 3
            end
            object cmbGroundSpeed_CircleOnTrackGuidance: TComboBox
              Left = 101
              Top = 98
              Width = 226
              Height = 21
              TabOrder = 4
            end
            object edtRangeOffset_CircleOnTrackGuidance: TEdit
              Left = 101
              Top = 126
              Width = 54
              Height = 21
              TabOrder = 5
            end
            object edtAngleOffset_CircleOnTrackGuidance: TEdit
              Left = 102
              Top = 154
              Width = 54
              Height = 21
              TabOrder = 6
            end
          end
          object grbCircleOnPointGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 10
            object Label30: TLabel
              Left = 16
              Top = 130
              Width = 84
              Height = 13
              Caption = 'Ground Speed   : '
            end
            object Label31: TLabel
              Left = 171
              Top = 75
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label32: TLabel
              Left = 17
              Top = 103
              Width = 82
              Height = 13
              Caption = 'Direction           : '
            end
            object Label33: TLabel
              Left = 16
              Top = 75
              Width = 84
              Height = 13
              Caption = 'Radius               : '
            end
            object Label34: TLabel
              Left = 16
              Top = 21
              Width = 83
              Height = 13
              Caption = 'Centre Position : '
            end
            object lblCentreGrid: TLabel
              Left = 17
              Top = 48
              Width = 83
              Height = 13
              Caption = 'Centre  Grid      : '
            end
            object spbtnCentrePosition_CircleOnPointGuidance: TSpeedButton
              Left = 303
              Top = 18
              Width = 24
              Height = 22
              Caption = '+'
            end
            object edtRadius_CircleOnPointGuidance: TEdit
              Left = 106
              Top = 72
              Width = 51
              Height = 21
              TabOrder = 0
            end
            object cmbDirection_CircleOnPointGuidance: TComboBox
              Left = 106
              Top = 99
              Width = 221
              Height = 21
              TabOrder = 1
            end
            object cmbGroundSpeed_CircleOnPointGuidance: TComboBox
              Left = 106
              Top = 126
              Width = 220
              Height = 21
              TabOrder = 2
            end
            object edtCentreLat_CircleOnPointGuidance: TEdit
              Left = 106
              Top = 18
              Width = 90
              Height = 21
              TabOrder = 3
            end
            object edtCentreLong_CircleOnPointGuidance: TEdit
              Left = 202
              Top = 18
              Width = 90
              Height = 21
              TabOrder = 4
            end
            object edtCentreY_CircleOnPointGuidance: TEdit
              Left = 202
              Top = 45
              Width = 90
              Height = 21
              TabOrder = 5
            end
            object edtCentreX_CircleOnPointGuidance: TEdit
              Left = 106
              Top = 45
              Width = 90
              Height = 21
              TabOrder = 6
            end
          end
          object grbSinuateGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 1
            object Label39: TLabel
              Left = 16
              Top = 98
              Width = 84
              Height = 13
              Caption = 'Ground Speed   : '
            end
            object Label40: TLabel
              Left = 211
              Top = 43
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label41: TLabel
              Left = 17
              Top = 71
              Width = 81
              Height = 13
              Caption = 'Amplitude         : '
            end
            object Label42: TLabel
              Left = 16
              Top = 43
              Width = 82
              Height = 13
              Caption = 'Period               : '
            end
            object Label43: TLabel
              Left = 17
              Top = 17
              Width = 82
              Height = 13
              Caption = 'Base Course     : '
            end
            object Label44: TLabel
              Left = 211
              Top = 71
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object lbldegreesT: TLabel
              Left = 211
              Top = 17
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object edtPeriod_SinuateGuidance: TEdit
              Left = 106
              Top = 40
              Width = 90
              Height = 21
              TabOrder = 0
            end
            object cmbGroundSpeed_SinuateGuidance: TComboBox
              Left = 106
              Top = 94
              Width = 209
              Height = 21
              TabOrder = 1
            end
            object edtAmplitude_SinuateGuidance: TEdit
              Left = 106
              Top = 67
              Width = 90
              Height = 21
              TabOrder = 2
            end
            object edtBaseCourse_SinuateGuidance: TEdit
              Left = 106
              Top = 13
              Width = 90
              Height = 21
              TabOrder = 3
            end
          end
          object grbShadowGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 2
            object Label45: TLabel
              Left = 200
              Top = 46
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label46: TLabel
              Left = 16
              Top = 46
              Width = 75
              Height = 13
              Caption = 'Target Range   '
            end
            object Label47: TLabel
              Left = 17
              Top = 17
              Width = 60
              Height = 13
              Caption = 'Target :       '
            end
            object spbtnTarget_ShadowGuidance: TSpeedButton
              Left = 304
              Top = 16
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
            object edtTargetRange_ShadowGuidance: TEdit
              Left = 104
              Top = 43
              Width = 90
              Height = 21
              TabOrder = 0
            end
            object edtTarget_ShadowGuidance: TEdit
              Left = 64
              Top = 16
              Width = 234
              Height = 21
              Enabled = False
              TabOrder = 1
            end
          end
          object grbEngagementGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 3
            object Label48: TLabel
              Left = 200
              Top = 46
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label49: TLabel
              Left = 16
              Top = 46
              Width = 75
              Height = 13
              Caption = 'Target Range   '
            end
            object Label50: TLabel
              Left = 17
              Top = 17
              Width = 60
              Height = 13
              Caption = 'Target :       '
            end
            object spbtnTarget_EngagementGuidance: TSpeedButton
              Left = 304
              Top = 16
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
            object edtTargetRange_EngagementGuidance: TEdit
              Left = 104
              Top = 43
              Width = 90
              Height = 21
              TabOrder = 0
            end
            object edtTarget_EngagementGuidance: TEdit
              Left = 64
              Top = 16
              Width = 234
              Height = 21
              Enabled = False
              TabOrder = 1
            end
          end
          object grbEvasionGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 4
            object Label51: TLabel
              Left = 17
              Top = 17
              Width = 60
              Height = 13
              Caption = 'Target :       '
            end
            object spbtnTarget_EvasionGuidance: TSpeedButton
              Left = 304
              Top = 16
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
            object edtTarget_EvasionGuidance: TEdit
              Left = 64
              Top = 16
              Width = 234
              Height = 21
              Enabled = False
              TabOrder = 0
            end
          end
          object grbOutRunGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 5
            object Label52: TLabel
              Left = 17
              Top = 17
              Width = 60
              Height = 13
              Caption = 'Target :       '
            end
            object spbtnTarget_OutRunGuidance: TSpeedButton
              Left = 304
              Top = 16
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
            object edtTarget_OutRunGuidance: TEdit
              Left = 64
              Top = 16
              Width = 234
              Height = 21
              Enabled = False
              TabOrder = 0
            end
          end
          object grbWayPointGuidance: TGroupBox
            Left = 1
            Top = 1
            Width = 351
            Height = 251
            Align = alClient
            TabOrder = 6
            object Bevel1: TBevel
              Left = 20
              Top = 21
              Width = 24
              Height = 3
            end
            object Label2: TLabel
              Left = 17
              Top = 93
              Width = 69
              Height = 13
              Caption = 'Target    :       '
            end
            object spbtnTarget_WayPointGuidance: TSpeedButton
              Left = 304
              Top = 89
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
            object Label53: TLabel
              Left = 17
              Top = 36
              Width = 52
              Height = 13
              Caption = 'Type       : '
            end
            object Label54: TLabel
              Left = 140
              Top = 66
              Width = 39
              Height = 13
              Caption = 'degrees'
            end
            object Label55: TLabel
              Left = 17
              Top = 66
              Width = 51
              Height = 13
              Caption = 'Radius    : '
            end
            object Label56: TLabel
              Left = 50
              Top = 16
              Width = 56
              Height = 13
              Caption = 'Termination'
            end
            object Bevel2: TBevel
              Left = 112
              Top = 21
              Width = 215
              Height = 3
            end
            object edtTarget_WayPointGuidance: TEdit
              Left = 74
              Top = 89
              Width = 224
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object cmbType_WayPointGuidance: TComboBox
              Left = 74
              Top = 35
              Width = 253
              Height = 21
              TabOrder = 1
            end
            object edtRadius_WayPointGuidance: TEdit
              Left = 74
              Top = 62
              Width = 60
              Height = 21
              TabOrder = 2
            end
            object btnEditWaypoints_WayPointGuidance: TButton
              Left = 14
              Top = 208
              Width = 89
              Height = 25
              Caption = 'Edit Waypoints'
              TabOrder = 3
              OnClick = btnEditWaypoints_WayPointGuidanceClick
            end
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 33
          Align = alTop
          Caption = 'Panel1'
          TabOrder = 1
          object cbLateralGuid: TComboBox
            Left = 13
            Top = 6
            Width = 324
            Height = 21
            TabOrder = 0
            OnChange = cbLateralGuidChange
            Items.Strings = (
              'Straight/Heading'
              'Pattern on Self'
              'Patter on Target '
              'Pattern on Point'
              'Helm Guidance'
              'Return to Base'
              'Station Keep on Track'
              'Station Keep on Position'
              'Circle on Track'
              'Circle on Point'
              'Zig-zag'
              'Sinuate'
              'Shadow'
              'Engagement'
              'Evasion'
              'Outrun'
              'Waypoint')
          end
        end
      end
      object tsDetection: TTabSheet
        Caption = 'Vertical'
        ImageIndex = 2
        object Label22: TLabel
          Left = 85
          Top = 114
          Width = 3
          Height = 13
        end
        object lAltitude: TLabel
          Left = 3
          Top = 18
          Width = 77
          Height = 13
          Caption = 'Altitude/Depth :'
        end
        object edAltitudeDepth: TEdit
          Left = 86
          Top = 15
          Width = 121
          Height = 21
          TabOrder = 0
        end
      end
    end
  end
  object Map1: TMap
    Left = 384
    Top = 0
    Width = 1008
    Height = 900
    ParentColor = False
    TabOrder = 1
    OnMouseUp = Map1MouseUp
    OnMouseMove = Map1MouseMove
    OnMouseDown = Map1MouseDown
    OnDblClick = Map1DblClick
    OnMapViewChanged = Map1MapViewChanged
    OnDrawUserLayer = Map1DrawUserLayer
    ControlData = {
      8A1A06002E680000055D0000010000000F0000FF0D47656F44696374696F6E61
      727905456D70747900E8030000000000000000000002000E001E000000000000
      0000000000000000000000000000000000000000000600010000000000500001
      0100000A0000000001F4010000050000800C000000000000000000000000FFFF
      FF000100000000000000000000000000000000000000000000000352E30B918F
      CE119DE300AA004BB85101000000900140D10C0005417269616C000352E30B91
      8FCE119DE300AA004BB8510100000090015C790C0005417269616C0000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
      8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
      918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
      6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
      00000118010000A80225000100000090D122001C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8076C000000000008056C0000000000080764000000000008056400100000018
      010000A802250001000000E392427E1C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000001CCF2200CEEF3E7748
      CF2200D98B417E00F0FD7F48CF22005A88417E08CF2200000000000000000000
      000088B3400000000000408F400000000000}
  end
  object currentCursor: TPanel
    Left = 1
    Top = 34
    Width = 377
    Height = 121
    TabOrder = 2
    object grpCursorPosition: TGroupBox
      Left = 12
      Top = 12
      Width = 345
      Height = 97
      Caption = 'Cursor Potition'
      TabOrder = 0
      object Label59: TLabel
        Left = 12
        Top = 20
        Width = 103
        Height = 13
        Caption = 'Bearing From Center:'
      end
      object Label60: TLabel
        Left = 12
        Top = 39
        Width = 108
        Height = 13
        Caption = 'Distance From Center:'
      end
      object Label61: TLabel
        Left = 12
        Top = 58
        Width = 41
        Height = 13
        Caption = 'Position:'
      end
      object Label62: TLabel
        Left = 12
        Top = 77
        Width = 23
        Height = 13
        Caption = 'Grid:'
      end
      object lBearingFCenter: TLabel
        Left = 124
        Top = 20
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lDistanceFCenter: TLabel
        Left = 124
        Top = 39
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lPosLat: TLabel
        Left = 124
        Top = 58
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lGridLat: TLabel
        Left = 124
        Top = 77
        Width = 4
        Height = 13
        Caption = '-'
      end
      object Label63: TLabel
        Left = 219
        Top = 20
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label64: TLabel
        Left = 219
        Top = 39
        Width = 14
        Height = 13
        Caption = 'nm'
      end
      object lPosLong: TLabel
        Left = 219
        Top = 58
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lGridLong: TLabel
        Left = 219
        Top = 77
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lbcenterx: TLabel
        Left = 299
        Top = 20
        Width = 3
        Height = 13
      end
      object lbcentery: TLabel
        Left = 299
        Top = 39
        Width = 3
        Height = 13
      end
    end
  end
  object Panel3: TPanel
    Left = 1
    Top = 155
    Width = 377
    Height = 102
    TabOrder = 3
    object GroupBox1: TGroupBox
      Left = 12
      Top = 4
      Width = 345
      Height = 85
      Caption = 'Hooked Platform'
      TabOrder = 0
      object Label65: TLabel
        Left = 12
        Top = 20
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object Label67: TLabel
        Left = 12
        Top = 39
        Width = 41
        Height = 13
        Caption = 'Position:'
      end
      object Label68: TLabel
        Left = 12
        Top = 58
        Width = 23
        Height = 13
        Caption = 'Grid:'
      end
      object lbHookedName: TLabel
        Left = 124
        Top = 20
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lbHookedPosLat: TLabel
        Left = 124
        Top = 39
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lbHookedGridLat: TLabel
        Left = 124
        Top = 58
        Width = 4
        Height = 13
        Caption = '-'
      end
      object Label73: TLabel
        Left = 219
        Top = 20
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object lbHookedPosLong: TLabel
        Left = 219
        Top = 39
        Width = 4
        Height = 13
        Caption = '-'
      end
      object lbHookedGridLong: TLabel
        Left = 219
        Top = 58
        Width = 4
        Height = 13
        Caption = '-'
      end
      object Label77: TLabel
        Left = 299
        Top = 20
        Width = 3
        Height = 13
      end
      object Label78: TLabel
        Left = 299
        Top = 39
        Width = 3
        Height = 13
      end
    end
  end
  object ImageList1: TImageList
    BkColor = 14215660
    Left = 848
    Top = 72
    Bitmap = {
      494C010123002400140010001000ECE9D800FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FCFC
      FC00FFFFFF00D6D6D600A5A5A500A8A8A800A7A7A700A6A6A600CECECE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FCFCFC00FFFFFF00FDFD
      FD00FBFBFB00BDBDBD005F5F5F00707070006F6F6F0074747400ADADAD00F6F6
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FEFEFE00FFFFFF00F8F8
      F800FDFDFD00ABABAB005D5D5D00727272006D6D6D006C6C6C00ACACAC00FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F4F4
      F400FFFFFF00B0B0B0005A5A5A006F6F6F006E6E6E0073737300B1B1B100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00000000000000000000000000D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F9F900FEFEFE00FFFFFF00F8F8
      F800FFFFFF00ACACAC005B5B5B00686868006565650072727200A3A3A300FDFD
      FD00FFFFFF00FFFFFF00FDFDFD00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C0C00047373500FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00F0F0F000FBFBFB00F0F0
      F000F4F4F400BBBBBB005A5A5A00717171006A6A6A006A6A6A009A9A9A00E7E7
      E700F9F9F900F9F9F900F7F7F700FCFCFC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00DBD9D900CDC9C8005D4F4D00DBDBDB00B9B3B200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009191910085858500909090008787
      87008E8E8E00717171006868680067676700696969006C6C6C00777777009797
      97008E8E8E008E8E8E008C8C8C0094949400D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F8F8F800DBD9D900ABA5A40056474500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A6A006A6A6A006F6F6F006565
      65006E6E6E006969690070707000666666006B6B6B006D6D6D00656565006767
      67006C6C6C006C6C6C006A6A6A0074747400D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FDFDFD00F8F8F800F1F1F100EAEAEA00E2E2E20055464400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6D00757575006B6B6B006868
      6800686868006F6F6F0069696900727272007070700069696900717171007272
      72006E6E6E006E6E6E006B6B6B0076767600D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FDFDFD00F8F8F800F1F1F10055464400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6C0072727200666666006A6A
      6A00696969006C6C6C006A6A6A006E6E6E006E6E6E006B6B6B006D6D6D006262
      62006F6F6F006E6E6E006C6C6C0076767600D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FDFDFD0055464400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007777770076767600777777007272
      7200848484005E5E5E006868680064646400646464006E6E6E00676767007979
      79006D6D6D006D6D6D00707070007F7F7F00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0055464400FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFD00B2B2B20057575700737373006E6E6E0068686800A6A6A600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0055464400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FEFEFE00FFFFFF00FBFBFB00FFFF
      FF00FEFEFE00AAAAAA005F5F5F00696969006C6C6C00676767009E9E9E00FAFA
      FA00FCFCFC00FCFCFC00FCFCFC00FAFAFA00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0055464400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD00FFFFFF00FEFEFE00FFFF
      FF00FFFFFF00B2B2B20060606000646464006E6E6E0070707000A1A1A100F9F9
      F900FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B4B4B4005A5A5A00737373006D6D6D0063636300A0A0A000FDFD
      FD00FEFEFE00FEFEFE00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FEFEFE00FEFEFE00FFFF
      FF00F8F8F800ACACAC0056565600717171006D6D6D006E6E6E00A4A4A400F8F8
      F800FEFEFE00FEFEFE00FDFDFD00FEFEFE00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100FFFFFF00707070007070700070707000FFFFFF00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FAFAFA00FFFFFF00FFFFFF00FAFA
      FA00FEFEFE00FFFFFF00FBFBFB00FFFFFF00E8E8E800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100FFFF
      FF00707070007070700060606000707070007070700060606000FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00FCFCFC00FFFF
      FF00FEFEFE00FEFEFE00FEFEFE00FBFBFB00A1A1A100C8C8C800F3F3F300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00707070007070
      70007070700060606000C1C1C100FFFFFF00FFFFFF007070700070707000FFFF
      FF00FFFFFF00C1C1C100D8E9EC00D8E9EC00FFFFFF00FCFCFC00FCFCFC00FFFF
      FF00FFFFFF00FAFAFA00FFFFFF00E6E6E6009999990097979700D5D5D500FDFD
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000060606000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000606060006060
      6000C1C1C100FFFFFF007070700070707000FFFFFF00FFFFFF00707070007070
      7000FFFFFF00FFFFFF00D8E9EC00D8E9EC00FFFFFF00FCFCFC00EAEAEA00CCCC
      CC00F9F9F900FFFFFF00FAFAFA00A2A2A200DEDEDE00F3F3F3008B8B8B00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00C1C1C1000000000000000000D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000001919
      190000000000C1C1C100D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000C1C1C100FFFF
      FF007070700070707000707070007070700070707000FFFFFF00FFFFFF007070
      700070707000FFFFFF00FFFFFF00D8E9EC00FFFFFF00F7F7F700EDEDED009898
      9800D9D9D900F3F3F300E0E0E000BCBCBC00EBEBEB00ABABAB00F9F9F900FCFC
      FC00FFFFFF00FEFEFE00FFFFFF00FFFFFF00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000606060000000000C1C1C10000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0070707000FFFFFF00707070007070
      7000707070007070700070707000707070007070700070707000FFFFFF00FFFF
      FF007070700070707000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00D9D9
      D9008F8F8F00EBEBEB0080808000DCDCDC00DADADA00A2A2A200FEFEFE00FFFF
      FF00FBFBFB00FFFFFF00F9F9F900FFFFFF00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000606060000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000707070007070
      700070707000707070007070700070707000707070007070700070707000FFFF
      FF00FFFFFF007070700070707000D8E9EC00FDFDFD00FFFFFF00E6E6E600DADA
      DA00E8E8E80085858500C6C6C600CFCFCF00B8B8B800FCFCFC00FAFAFA00F6F6
      F600FEFEFE00FFFFFF00FFFFFF00FFFFFF00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000C1C1C10000000000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000707070007070
      7000707070007070700070707000707070007070700070707000707070007070
      7000FFFFFF0070707000FFFFFF00D8E9EC00FFFFFF00FFFFFF00EEEEEE00DCDC
      DC00CCCCCC00DCDCDC00D4D4D400E0E0E00089898900B7B7B700BFBFBF00BFBF
      BF00EEEEEE00FFFFFF00FFFFFF00FAFAFA00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC0000000000D8E9EC00000000001919190000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC0060606000C1C1C100606060007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00D8E9EC00FFFFFF00FFFFFF00ECECEC00E0E0
      E000CFCFCF00D7D7D700CDCDCD00D4D4D400D7D7D700DADADA00DEDEDE008C8C
      8C00E6E6E600FEFEFE00FFFFFF00FBFBFB00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000C1C1C10000000000D8E9EC00000000001919190000000000C1C1C100D8E9
      EC00000000007070700000000000D8E9EC00D8E9EC0060606000C1C1C1007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00FFFFFF00FFFFFF00FFFFFF00EDEDED00E2E2
      E200CECECE00CECECE00CECECE00D1D1D100BFBFBF00DADADA0096969600FEFE
      FE00FFFFFF00FCFCFC00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000006060600000000000000
      0000000000007070700060606000D8E9EC00D8E9EC00D8E9EC0060606000C1C1
      C100606060007070700070707000707070007070700070707000707070007070
      7000707070007070700070707000FFFFFF00FFFFFF00FFFFFF00EDEDED00E5E5
      E500CBCBCB00CDCDCD00C5C5C500CBCBCB00D3D3D300A4A4A400FFFFFF00FFFF
      FF00FEFEFE00FFFFFF00FEFEFE00FEFEFE00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000007070
      7000707070000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C1006060
      6000D8E9EC007070700070707000707070007070700070707000707070007070
      7000707070006060600060606000D8E9EC00FFFFFF00FEFEFE00EEEEEE00E8E8
      E800C7C7C700C3C3C300CDCDCD00C7C7C700BEBEBE00FFFFFF00FFFFFF00F5F5
      F500FCFCFC00FAFAFA00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0060606000C1C1C10060606000707070007070700070707000707070007070
      700060606000C1C1C100D8E9EC00D8E9EC00FFFFFF00FFFFFF00F1F1F100E2E2
      E200C3C3C300BFBFBF00C7C7C700DEDEDE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C10060606000C1C1C10070707000707070006060600060606000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F9F9F900FFFFFF00ECECEC00EDED
      ED00B5B5B500B6B6B600FFFFFF00FAFAFA00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000007070700070707000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00606060007070700060606000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00E2E2E200FFFF
      FF00A8A8A800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF00F5F5F500B5B5
      B500F8F8F800FFFFFF00F7F7F700F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00C1C1C100D8E9EC00B9B9B900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060007070
      70007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00C1C1C100606060000000000038383800C1C1C100D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000060606000D8E9EC00C1C1C10000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10070707000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000000000007070700070707000707070000000000000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000707070007070700070707000707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00E1E1E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000070707000C1C1C10060606000686868007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000060606000D8E9EC00C1C1C100707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC000000000070707000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000C1C1C100D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF000000
      0000000000007070700070707000707070000000000000000000FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E1007070
      7000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC007070700000000000FFFFFF007F7F7F0060606000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100606060007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00606060000000000030303000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B6B6
      B600BDBDBD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B8B8B800D8D8D800FFFFFF00FFFF
      FF00FFFFFF00E5E5E500D8E9EC00B7B7B700D4D4D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC009292920060606000666666007070
      700087878700D8E9EC00D8E9EC00999999006565650070707000707070007070
      70006C6C6C00646464007F7F7F00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00B8B8B8009E9E9E009898
      9800E5E5E500B7B7B700BCBCBC00D8E9EC00B6B6B600AAAAAA00707070007070
      700095959500ECECEC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00949494008282
      8200D6D6D600FFFFFF00FFFFFF00FFFFFF00D4D4D40070707000707070007070
      700081818100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000D8E9EC00D8E9EC00C1C1C10000000000C1C1
      C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7B700A4A4
      A400707070006B6B6B00656565007070700070707000707070006C6C6C008A8A
      8A00EBEBEB00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950097979700E5E5E500D8E9EC00999999006565650070707000707070008282
      8200D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000007070700000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950081818100D6D6D600EBEBEB00A8A8A800707070006B6B6B008C8C8C00EAEA
      EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000000000000000000000000000C1C1C1000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC009696960095959500D1D1D10070707000707070007070700086868600BDBD
      BD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000060606000C1C1C10060606000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7
      B700A0A0A00080808000A7A7A700707070006B6B6B008E8E8E00EAEAEA00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C0070707000707070007070700083838300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C00707070006B6B6B0090909000E9E9E900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0097979700656565007070700084848400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00B7B7B700A2A2A20079797900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B9B9B900DBDBDB00F3F3
      F300F3F3F300F4F4F400F4F4F400D4D4D400B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20089898900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00FFFFFF00E7E7E700B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B20095959500838383008787
      87008787870087878700C3C3C300F9F9F900D4D4D400B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2008585850070707000707070007070
      700070707000707070009E9E9E00FFFFFF00E6E6E600B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009999990075757500707070007070
      700070707000707070007C7C7C00C2C2C200F9F9F900D4D4D400B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      7000707070007070700070707000A0A0A000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007171710070707000707070007070
      70007070700070707000707070007D7D7D00C2C2C200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200BCBCBC00E4E4E400B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006F6F6F0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B2008D8D8D00FFFFFF00E3E3E300B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006A6A6A0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700066666600FFFFFF00BBBBBB00E3E3E300E3E3
      E30070707000A5A5A500FFFFFF00E3E3E300D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006E6E6E0070707000707070007070
      70007070700070707000707070006A6A6A00ADADAD00DBDBDB00B7B7B700D3D3
      D300EEEEEE00EEEEEE00EEEEEE00EEEEEE007070700070707000707070007070
      70007070700070707000707070006A6A6A00CFCFCF0085858500A7A7A700A7A7
      A7007070700070707000A7A7A700FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC006B6B6B0070707000707070007070
      70007070700070707000707070006E6E6E0096969600BCBCBC009D9D9D008989
      8900919191009191910091919100BDBDBD007070700070707000707070007070
      700070707000707070006666660098989800BBBBBB006A6A6A00666666007070
      7000707070007070700066666600D0D0D000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000008484840070707000707070007070
      700070707000707070006A6A6A0082828200AAAAAA00B7B7B700959595006969
      69006B6B6B00696969006B6B6B008B8B8B009797970066666600666666007070
      700070707000666666009A9A9A00B2B2B200E6E6E60097979700919191009797
      9700666666007070700091919100B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00A8A8A8007F7F7F00646464006A6A
      6A00707070006A6A6A0086868600ADADAD00CDCDCD00D2D2D200ABABAB009F9F
      9F009F9F9F009F9F9F009F9F9F00A5A5A500B2B2B20090909000999999007070
      7000C3C3C30090909000C1C1C10082828200FFFFFF00B2B2B200B2B2B200BBBB
      BB006060600097979700B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00B2B2B200A6A6A600A2A2A2008A8A
      8A00A6A6A600BABABA00AEAEAE009C9C9C00B7B7B700DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B8B8B8006767
      6700FFFFFF00BBBBBB008A8A8A0069696900FFFFFF00B2B2B200B2B2B200B8B8
      B8008F8F8F00B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B4B4B4008B8B
      8B00B5B5B500DDDDDD009C9C9C0074747400B2B2B200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006969
      6900FFFFFF008B8B8B009696960070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008D8D
      8D00B8B8B800BCBCBC00909090008B8B8B00B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006767
      6700B1B1B1008D8D8D00B9B9B90067676700FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008989
      8900818181009A9A9A00A8A8A8008F8F8F00AEAEAE00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200BABABA006060
      600093939300B2B2B200BABABA0060606000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B7B7B7008B8B
      8B0080808000A8A8A800B7B7B7008F8F8F00ACACAC00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B9B9B9008B8B
      8B00B2B2B200B2B2B200B9B9B90060606000DEDEDE00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B5B5B500A6A6
      A600A5A5A500B2B2B200B4B4B4008D8D8D0098989800C5C5C500B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B2008A8A8A00B9B9B900B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B5B5B500D8E9EC00D8E9EC00D8E9EC00B5B5B500D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C2C2C200C2C2C200C2C2
      C200CECECE00C2C2C200C2C2C200C2C2C200CECECE00C2C2C200D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A5A5A500E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200FFFFFF00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0070707000707070000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E400FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000006060
      60007070700000000000C1C1C100D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00000000000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF000000
      000000000000FFFFFF00B2B2B20000000000B2B2B200FFFFFF00B2B2B2000000
      0000000000007070700000000000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00BFBFBF00B4B4B400D8E9EC00D8E9EC00C1C1C10000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000FFFFFF00B2B2B200FFFFFF0000000000FFFFFF00B2B2B200FFFFFF00FFFF
      FF00000000000000000000000000C1C1C1000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B400A8A8A800FFFFFF00CACACA00D8E9EC00D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000060606000C1C1C100FFFF
      FF0000000000FFFFFF00B2B2B200FFFFFF00B2B2B200FFFFFF00C1C1C1000000
      0000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062626200FFFFFF00BFBF
      BF006E6E6E00EBEBEB00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B200FFFFFF00C1C1C100FFFFFF00C1C1C100606060007070
      7000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00B4B4
      B4006262620070707000EBEBEB00F5F5F500000000000000000000000000D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00B2B2B200FFFFFF006060600070707000707070007070
      7000707070000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000707070006A6A6A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C1C1000000000000000000707070007070
      7000707070007070700070707000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B4000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00007070700070707000707070000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D00000000000000000061616100FFFFFF00D8E9
      EC0068686800D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000D8E9EC000000000000000000F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F30000000000000000006F6F6F00F9F9F900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC000000
      000000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000D8E9EC006F6F6F006F6F6F00707070007070
      70007070700070707000707070006F6F6F000000000066666600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000007F7F7F0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000D8E9EC000000000000000000757575000000
      00007070700000000000000000006565650074747400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000059595900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00007373730064646400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      000000000000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC0000000000FFFFFF0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B9B9
      B900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B4B4B400BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC009B9B9B000C0C0C006B6B
      6B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B3B3B300C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00A7A7A7000000000000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ABABAB00000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC0000000000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990019191900BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90007070700ADADAD000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00B3B3B300D8E9EC00A5A5A5000000000009090900D8E9EC00D8E9EC00AFAF
      AF0001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A7A7A700545454000000
      000000000000000000000D0D0D00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000D8E9EC0000000000D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00808080008080800080808000D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC008080800080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000808080000000
      000000000000D8E9EC00808080008080800080808000D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC000000
      000000000000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000808080000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000080808000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000008080
      8000000000008080800080808000D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC008080800000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC008080800000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00808080008080800080808000000000008080800080808000D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00000000000000000000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000080808000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC000000000080808000D8E9EC00808080000000000080808000D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC008080800080808000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D3C5C700D5C0C300D4BBBF00DDBD
      C200DCB8BE00E1BBC100D4AEB400E6C0C600F9D5DB00D4B2B800E1C1C600D1B3
      B800D7B9BE00D4B6BB00D2B7BB00CFB8BC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCB5B900280A0F0039171D002200
      0000360A110043141C00290000003F0E16002700000034080F003F151C002C03
      0A00381218002100030047272C0023080C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00B6B6B6007E7E7E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D9C2C60026030700FFF9FE00FFE4
      EE00FFF7FF00FBD4E300FFF4FF00FFD7F6003F173A00FFDCF800FFF4FF00F5D1
      E100FFF8FF00FFF3FC00F9DCE500300E1500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC008C8C8C000000000081818100B6B6B600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00CEBFC300320C0C00FFEAEC00FFF3
      FF00EFE6FB00FFF2FF00F5E3FF00200C59001F0F6300160C4E00ECE4FF00F2E6
      FF00F2E6FA00FFF9FF00F9E5F20031041400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B6B6B6008484840000000000000000000000000090909000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00000000000000000000000000D8E9EC00C4BCBD0023000000FFFAFC00F8F0
      FF00F2F6FF00E2E1FF0019184A0006035800030760000A13570000063800F2F4
      FF00F5F5FF00E3E5F700FFF8FF0027000800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0093939300000000000000000000000000000000000000000087878700B6B6
      B600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00BCB9B1003E1B1100FFE8E800DFD7
      EE00E3E8FF00F3F7FF00D6DDFE00E5F0FF000F215600E1F7FF00D6E9FF00E9EF
      FF00DADBF500F1F2FF00EFDFF00038051900D8E9EC00D8E9EC00D8E9EC008B8B
      8B00000000000000000000000000000000000000000000000000000000009696
      9600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C4C2C100411F1F00FFF7FF00DACF
      F7001F245100DEE3FF00ECF7FF00BCCFF40008244600BCDDF000D6F1FF00D7E0
      FF0022244700E9EBFF00F8E8F9003A071B00D8E9EC00D8E9EC00D8E9EC002424
      2400242424002424240000000000000000000000000024242400242424002424
      2400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00BAB9C90019000B00F4CDF3002819
      5D0007065000ECEEFF00D7E3FF00DDF7FF00B2D6F400D6FEFF00BCDAF700E4ED
      FF00100E49001A1C3A00F9E9FB003B071E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C9C0D500360B2600451440002710
      5A001D146400100A43001E214D00ACBFE400DDF9FF00C0E1F500162E4C001213
      50001E1754001413330039293B0027000A00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D7BFCB0034000A00FFD7F5003E18
      5200230C4A00FFF0FF00EFE4FF00F4F4FF00E6EEFF00EAF8FF00CDD4ED00EBDF
      FF001B0C3F001B173400FFF8FF0039051C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D5BEC200410A0D00FFF4FF00F4D3
      F8002F1B4600EDD8F800FFF0FF00E3DAFF000F0F3700DDE4FF00F4F8FF00D8CB
      F10034264A00E9E6FC00F5E5F6003C091D00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBB6B30039120A00FFE4E100FFF9
      FF00E1DFF500FDF9FF00DAD5F400F1EDFF000D104D00E8F3FF00CDD8F800F3F4
      FF00EBEAFE00F8FBFF00EBDDE90036041600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBC0BF002F130800FFFEF500F2EF
      F100F4FDFF00E9EAF800201F410006044A0017196700020D47000A173D00F3FA
      FF00DCE2ED00DCE1EA00FFFAFF0037061400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C3CAD3001F060200FFE7E200EBEC
      F000DDE7F100F8FAFF00D5D1FA001E186A000A076300131A5F00CCD7FF00E2E8
      FF00F2F7FF00F8FEFF00FFF6FC0027000100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000F0F0F000F0F0F000F0F0F00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B0AEB4003E1A1400FFFDF500FFF3
      F500FFFCFF00EDE1ED00FFF2FF00EBD9FF001F106100D2CBFF00F8F4FF00F0E7
      F400F9F4F600E3E8E700FBF0F2003B0D1300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DFC7C100450A00003E0000003B12
      0F001F000100280300002F060E002500230018001D0018001000250A0E00310C
      0800331710000C0A020029201C003B0E1100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF000000FFFF000000000000FFF300000000
      0000FFE9000000000000FFD1000000000000F823000000000000E78700000000
      0000C7C7000000000000DFEF000000000000BFF7000000000000B03700000000
      0000B037000000000000BFF7000000000000DFEF000000000000DFEF00000000
      0000E79F000000000000F87F00000000FFFFFFFFF01F0000FC1FDFFFC00F0000
      E00F1FCF80030000E003878F00030000C463C35F00010000CE71E0BF00000000
      9E71E17F000100008E71F87F00010000BE7DB47300010000FE7F021180000000
      FE7F0701C0000000FE7F6781C8010000FE7FC703F0030000FCBFC703F01F0000
      FDBFFC07FC3F0000FE7FFE1FFFFF0000FFFFD777FFFFD7FFFAFFC000FFFFC1FF
      B0579FFC9FF7C3FF0007BFFE8FFFC3FF0007BFFE87F7C1FF0007BFFEC3EFF0FF
      0007BFFCE38FF8FF04078EECF09FFC3F00078001F83FFE3F0007FF7FFC3FFF0F
      0007FF7FF03FFF8B904FFE3FF18FFFC0F87FF80F83CFFFE1FFFFFC1F87E7FFE0
      FFFFFE3F8FF7FFE1FFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
      FFFFFFFFFFFF0200F7FFFFFFF7F70601E7FFFFFFE1C38103E0FFEF7FE9D3C007
      E07FE71FE183C007E00FE11FE003E20FE007E007E823E00FE01FE10FE003F00F
      E07FE31FF007E01FE1FFE77FF9CFF83FE7FFFF7FF9CFF83FFFFFFFFFFFFFF87F
      FFFFFFFFFFFFF8FFFFFFFFFFFFFFFFFFFFFF00003C00FFFFC1FF00000000FFFF
      FEFF00000000FFFF7F7F00000000FFFF7F7F00000000E31F7F7B00000000E31F
      7F7B00000000E31F7F6100000000E31FBEE000000000E31FC1FB00000000E31F
      F77B00000000E31FF67F00000000E31FF57F00000000E31FF37F00000000FFFF
      F77F00000000FFFFFF7F00000000FFFFF77FFDBFFFFFFF7F803FF01FFFFFF80F
      001FF00F002FC007001FC00F7FEFC001001FC00F482F80010019800F7FEF8000
      0001800F682F00000000000F7FEF00000000100F7F6F00000001F00F6EAE0000
      0003F00F556400000017F01F6ABA8001001FF03F257C8001003FF87FFAFCC001
      007FFCFFFDFAE001E3FFFFFFFE04F811BFFDFFFFFFFFFFFFB7EDFFFFFFFFFFFF
      D7EBFFFFFFFF803FE7E7FFFFFFFF001F8421FFEF9FFF001FFBDFEFE78F9F001F
      F66FC1E71E07001EF5AFC3F73F07001CF5AFC7F73F870018F66FCAF71F070018
      FBDFDCE71467001C8421FF0781FF001EE7E7FFFFFFFF1B1FD7EBFFFFFFFF0A1F
      B7EDFFFFFFFF843F7FFEFFFFFFFFF1FF7FFD7FFDFFFFFFFF37D917D9FE7FF81F
      97D397D3FE1FF3CFC7C7C7C7FC1FEFF7844BA6CBFF7FDC3B844386C1CE739BD9
      F2BFFEFBC738F66DF4DFF02F8000B5ADF45FF01FCF79B5ADF2DFFEFFEE7BF66D
      E91BF6EFFF3FBBD9844386C3FC1FDC3BE7CFE64FFE3FEFF7D7D7D7D5FF7FF3CF
      B7DAB7DAFFFFF81F5FFD6DFDFFFFFFFF0000FFFFFFFFFFFF0000FCFFFFFFFFF3
      0000FC3FFF1FFFE90000F03FFF1FFFD10000F00FFF1FF8230000E00FFF1FE787
      0000E00FFF1FCFC70000FC7FFF1FDCEF0000FC7FFF1FBCF70000FC7FF803B037
      0000FC7FFC07B0370000FC7FFE0FBCF70000FC7FFF1FDCEF0000FC7FFFBFDFEF
      0000FFFFFFBFE79F0000FFFFFFFFF87F00000000000000000000000000000000
      000000000000}
  end
end
