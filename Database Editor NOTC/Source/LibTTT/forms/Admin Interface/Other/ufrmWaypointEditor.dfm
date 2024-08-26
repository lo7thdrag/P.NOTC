object frmWaypointEditor: TfrmWaypointEditor
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'frmWaypointEditor'
  ClientHeight = 846
  ClientWidth = 1432
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzToolButton1: TRzToolButton
    Left = 664
    Top = 376
  end
  object pnlMainBackground: TPanel
    Left = 0
    Top = 0
    Width = 1432
    Height = 846
    Align = alClient
    BevelOuter = bvNone
    Color = 3683636
    ParentBackground = False
    TabOrder = 0
    object pnlLeft: TPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 798
      ParentCustomHint = False
      Align = alLeft
      BiDiMode = bdLeftToRight
      Color = 5980694
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentBackground = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object lbl7: TLabel
        Left = 20
        Top = 596
        Width = 63
        Height = 15
        Caption = 'Termination'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object bvl2: TBevel
        Left = 91
        Top = 604
        Width = 213
        Height = 3
      end
      object lbl8: TLabel
        Left = 35
        Top = 630
        Width = 43
        Height = 15
        Caption = 'Action : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
      end
      object btnAction: TSpeedButton
        Left = 280
        Top = 626
        Width = 24
        Height = 23
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
        OnClick = btnActionClick
      end
      object edtTermination: TEdit
        Left = 84
        Top = 626
        Width = 190
        Height = 23
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object GroupBox8: TGroupBox
        Left = 15
        Top = 20
        Width = 314
        Height = 386
        TabOrder = 1
        object btnAdd: TSpeedButton
          Tag = 1
          Left = 197
          Top = 331
          Width = 30
          Height = 30
          Hint = 'Add Waypoint'
          AllowAllUp = True
          GroupIndex = 1
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333FF33333333FF333993333333300033377F3333333777333993333333
            300033F77FFF3333377739999993333333333777777F3333333F399999933333
            33003777777333333377333993333333330033377F3333333377333993333333
            3333333773333333333F333333333333330033333333F33333773333333C3333
            330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
            333333333337733333FF3333333C333330003333333733333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnWaypointHadleClick
        end
        object btnDelete: TSpeedButton
          Tag = 2
          Left = 233
          Top = 331
          Width = 30
          Height = 30
          Hint = 'Delete Selected Waypoint'
          AllowAllUp = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            300033FFFFFF3333377739999993333333333777777F3333333F399999933333
            3300377777733333337733333333333333003333333333333377333333333333
            3333333333333333333F333333333333330033333F33333333773333C3333333
            330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
            993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
            333333377F33333333FF3333C333333330003333733333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnWaypointHadleClick
        end
        object btnDeleteAll: TSpeedButton
          Tag = 3
          Left = 269
          Top = 331
          Width = 30
          Height = 30
          Hint = 'Delete All Waypoints'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
            33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
            993337777F777F3377F3393999707333993337F77737333337FF993399933333
            399377F3777FF333377F993339903333399377F33737FF33377F993333707333
            399377F333377FF3377F993333101933399377F333777FFF377F993333000993
            399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
            99333773FF777F777733339993707339933333773FF7FFF77333333999999999
            3333333777333777333333333999993333333333377777333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnWaypointHadleClick
        end
      end
      object pnlWPGuidance: TGroupBox
        Left = 17
        Top = 412
        Width = 314
        Height = 165
        Caption = '                   '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Visible = False
        object btnControlComboInterval: TSpeedButton
          Left = 265
          Top = 11
          Width = 24
          Height = 62
          Caption = '+'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnControlComboIntervalClick
        end
        object lbl3: TLabel
          Left = 10
          Top = 74
          Width = 81
          Height = 15
          Caption = 'Ground Speed :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 195
          Top = 74
          Width = 29
          Height = 15
          Caption = 'knots'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object lbl6: TLabel
          Left = 10
          Top = 105
          Width = 87
          Height = 15
          Caption = 'Altitude/ Depth :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 195
          Top = 105
          Width = 20
          Height = 15
          Caption = 'feet'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object btnUpdate: TSpeedButton
          Left = 221
          Top = 121
          Width = 86
          Height = 30
          Caption = 'Update'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnUpdateClick
        end
        object Label1: TLabel
          Left = 12
          Top = 0
          Width = 49
          Height = 15
          Caption = 'Guidance'
        end
        object lbl2: TLabel
          Left = 10
          Top = 20
          Width = 50
          Height = 15
          Caption = 'Latitude :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object lbl1: TLabel
          Left = 10
          Top = 47
          Width = 60
          Height = 15
          Caption = 'Longitude :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
        end
        object edtSpeed: TEdit
          Left = 103
          Top = 70
          Width = 63
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtAltitude: TEdit
          Left = 103
          Top = 101
          Width = 63
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object chk1: TCheckBox
          Left = 22
          Top = 167
          Width = 80
          Height = 17
          Caption = 'Arrival Time'
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object edtArivalTime: TEdit
          Left = 114
          Top = 165
          Width = 95
          Height = 23
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object rgStartTime: TRadioGroup
          Left = 20
          Top = 194
          Width = 253
          Height = 54
          Caption = ' Start Time '
          Columns = 2
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          Items.Strings = (
            'Now'
            'Start at :')
          ParentFont = False
          TabOrder = 4
        end
        object edtLat: TEdit
          Left = 103
          Top = 16
          Width = 156
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edtLong: TEdit
          Left = 103
          Top = 43
          Width = 156
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
      end
    end
    object pnlMap: TPanel
      Left = 342
      Top = 0
      Width = 1090
      Height = 798
      Align = alClient
      Color = 3683636
      ParentBackground = False
      TabOrder = 1
      object Map1: TMap
        Left = 1
        Top = 36
        Width = 1088
        Height = 664
        ParentColor = False
        Align = alClient
        TabOrder = 0
        OnMouseUp = Map1MouseUp
        OnMouseMove = Map1MouseMove
        OnMouseDown = Map1MouseDown
        OnMapViewChanged = Map1MapViewChanged
        OnDrawUserLayer = Map1DrawUserLayer
        ExplicitTop = 35
        ExplicitWidth = 850
        ExplicitHeight = 649
        ControlData = {
          8A1A060073700000A0440000010000000F0000FF0D47656F44696374696F6E61
          727905456D70747900E8030000000000000000000002000E001E000000000000
          0000000000000000000000000000000000000000000600010000000002202050
          00010100000A0000000001F4010000050000800C000000000000000000000000
          FFFFFF000100000000000000000000000000000000000000000000000352E30B
          918FCE119DE300AA004BB8510100000090014495080005417269616C000352E3
          0B918FCE119DE300AA004BB8510100000090015C790C0005417269616C000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFFFFF000000000000000001370000000000FFFFFF000000000000000352E3
          0B918FCE119DE300AA004BB851010000009001DC7C010005417269616C000352
          E30B918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D
          626F6C730000000000000001000100FFFFFF000200FFFFFF0000000000000100
          000001000118010000789DBB2A010000001D5309751C00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0002000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00008076C000000000008056C000000000008076400000000000805640010000
          0018010000789DBB2A01000000000000001C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000645C90040000000004000000E85C90040000000000000000000000
          0000000088B3400000000000408F400001000001}
      end
      object pnlToolBar: TPanel
        Left = 1
        Top = 1
        Width = 1088
        Height = 35
        Align = alTop
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 1
        object pnlAlignToolBar: TPanel
          Left = 0
          Top = 0
          Width = 25
          Height = 35
          Align = alLeft
          BevelOuter = bvNone
          Color = 5980694
          ParentBackground = False
          TabOrder = 0
        end
        object ToolBar1: TToolBar
          Left = 25
          Top = 0
          Width = 1063
          Height = 35
          Align = alClient
          ButtonHeight = 36
          ButtonWidth = 42
          Caption = 'ToolBar1'
          Color = 5980694
          Images = ImageList1
          ParentColor = False
          TabOrder = 1
          object btnDecrease: TToolButton
            Left = 0
            Top = 0
            Hint = 'Decrease Scale'
            Caption = 'btnDecrease'
            ImageIndex = 1
            ParentShowHint = False
            ShowHint = True
            OnClick = btnDecreaseClick
          end
          object cbSetScale: TComboBox
            Left = 42
            Top = 0
            Width = 95
            Height = 21
            Hint = 'Map Scales'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnChange = cbSetScaleChange
            Items.Strings = (
              '0.125'
              '0.25'
              '0.5'
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
              '1024'
              '2048'
              '2500')
          end
          object btnIncrease: TToolButton
            Left = 137
            Top = 0
            Hint = 'Increase Scale'
            Caption = 'btnIncrease'
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            OnClick = btnIncreaseClick
          end
          object btnSelect: TToolButton
            Left = 179
            Top = 0
            Hint = 'Select'
            Caption = 'btnSelect'
            ImageIndex = 5
            OnClick = btnSelectClick
          end
          object btnZoom: TToolButton
            Left = 221
            Top = 0
            Hint = 'Zoom In / Out'
            Caption = 'btnZoom'
            ImageIndex = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnZoomClick
          end
          object btnPan: TToolButton
            Left = 263
            Top = 0
            Hint = 'Pan'
            Caption = 'btnPan'
            ImageIndex = 3
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPanClick
          end
          object btnCenterGame: TToolButton
            Left = 305
            Top = 0
            Hint = 'Center On Game Center'
            Caption = 'btnCenterGame'
            ImageIndex = 4
            ParentShowHint = False
            ShowHint = True
            OnClick = btnCenterGameClick
          end
          object btngamearea1: TToolButton
            Left = 347
            Top = 0
            Caption = 'btngamearea1'
            ImageIndex = 10
            OnClick = btngamearea1Click
          end
          object btnruler: TToolButton
            Left = 389
            Top = 0
            Caption = 'btnruler'
            ImageIndex = 12
            OnClick = btnrulerClick
          end
        end
      end
      object pnlCursorPosition: TPanel
        Left = 1
        Top = 700
        Width = 1088
        Height = 97
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 3
        Color = 5980694
        ParentBackground = False
        TabOrder = 2
        object grbCursorPosition: TGroupBox
          Left = 3
          Top = 3
          Width = 1082
          Height = 91
          Align = alClient
          Caption = '                             '
          Color = 5980694
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Berlin Sans FB'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          object lblBearing: TLabel
            Left = 149
            Top = 28
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lblDistance: TLabel
            Left = 149
            Top = 54
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lbSlPosition: TLabel
            Left = 570
            Top = 28
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lblnmSGrid: TLabel
            Left = 570
            Top = 54
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lblWPosition: TLabel
            Left = 652
            Top = 28
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lblnmWGrid: TLabel
            Left = 652
            Top = 54
            Width = 15
            Height = 15
            Caption = '---'
          end
          object lbl47: TLabel
            Left = 21
            Top = 28
            Width = 116
            Height = 15
            Caption = 'Bearing from Centre  :'
          end
          object Label67: TLabel
            Left = 21
            Top = 54
            Width = 116
            Height = 15
            Caption = 'Distance from Centre :'
          end
          object Label68: TLabel
            Left = 493
            Top = 28
            Width = 47
            Height = 15
            Caption = 'Position :'
          end
          object Label69: TLabel
            Left = 493
            Top = 54
            Width = 48
            Height = 15
            Caption = 'Grid        :'
          end
          object Label70: TLabel
            Left = 193
            Top = 28
            Width = 48
            Height = 15
            Caption = 'degress T'
          end
          object Label71: TLabel
            Left = 193
            Top = 54
            Width = 17
            Height = 15
            Caption = 'nm'
          end
          object Label2: TLabel
            Left = 11
            Top = 0
            Width = 78
            Height = 15
            Caption = 'Cursor Position'
          end
        end
      end
    end
    object pnlSparatorHor1: TPanel
      Left = 0
      Top = 798
      Width = 1432
      Height = 5
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      object Image2: TImage
        Left = 0
        Top = 0
        Width = 1432
        Height = 5
        Cursor = crHandPoint
        Align = alClient
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000003FB0000
          001408020000005DE0BAA7000000097048597300000B1300000B1301009A9C18
          000000824944415478DAEDD6410900300CC0C0D6BFE9AA188370A720CFEC0000
          005DFB3B00000078C8F103004099E307008032C70F0000658E1F0000CA1C3F00
          0094397E00002873FC000050E6F80100A0CCF103004099E307008032C70F0000
          658E1F0000CA1C3F000094397E00002873FC000050E6F80100A0CCF103004099
          E3070080B203BC0200156C14659F0000000049454E44AE426082}
        Stretch = True
        ExplicitLeft = -2
        ExplicitTop = -2
        ExplicitWidth = 8
        ExplicitHeight = 637
      end
    end
    object pnlButtom: TPanel
      Left = 0
      Top = 803
      Width = 1432
      Height = 43
      Align = alBottom
      BevelOuter = bvNone
      Color = 5980694
      ParentBackground = False
      TabOrder = 3
      object Panel4: TPanel
        Left = 1247
        Top = 0
        Width = 185
        Height = 43
        Align = alRight
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 0
        object btnSave: TSpeedButton
          Left = 0
          Top = 6
          Width = 86
          Height = 30
          Caption = 'Save'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          OnClick = btnSaveClick
        end
        object btnClose: TButton
          Tag = 3
          Left = 92
          Top = 6
          Width = 86
          Height = 30
          Caption = 'Cancel'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnCloseClick
        end
      end
      object Button2: TButton
        Left = 20
        Top = 8
        Width = 145
        Height = 28
        Caption = 'Screen Capture'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Visible = False
      end
    end
    object pnlSparatorVer1: TPanel
      Left = 337
      Top = 0
      Width = 5
      Height = 798
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      object Image3: TImage
        Left = 0
        Top = 0
        Width = 5
        Height = 798
        Cursor = crHandPoint
        Align = alClient
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000003FB0000
          001408020000005DE0BAA7000000097048597300000B1300000B1301009A9C18
          000000824944415478DAEDD6410900300CC0C0D6BFE9AA188370A720CFEC0000
          005DFB3B00000078C8F103004099E307008032C70F0000658E1F0000CA1C3F00
          0094397E00002873FC000050E6F80100A0CCF103004099E307008032C70F0000
          658E1F0000CA1C3F000094397E00002873FC000050E6F80100A0CCF103004099
          E3070080B203BC0200156C14659F0000000049454E44AE426082}
        Stretch = True
        ExplicitLeft = -2
        ExplicitTop = -2
        ExplicitWidth = 8
        ExplicitHeight = 637
      end
    end
  end
  object lvWaypoint: TListView
    Left = 17
    Top = 32
    Width = 309
    Height = 313
    Columns = <
      item
        Caption = 'No'
        Width = 30
      end
      item
        Alignment = taCenter
        Caption = 'Latitude'
        Width = 85
      end
      item
        Alignment = taCenter
        Caption = 'Longitude'
        Width = 85
      end
      item
        Alignment = taCenter
        Caption = 'Speed'
        Width = 55
      end
      item
        Alignment = taCenter
        Caption = 'Altitude'
        MaxWidth = 100
        MinWidth = 5
        Width = 55
      end>
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Berlin Sans FB'
    Font.Style = []
    GridLines = True
    RowSelect = True
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = lvWaypointClick
  end
  object ImageList1: TImageList
    BkColor = 14215660
    Height = 30
    Width = 35
    Left = 848
    Top = 72
    Bitmap = {
      494C01010E001800040023001E00ECE9D800FF10FFFFFFFFFFFFFFFF424D3600
      00000000000036000000280000008C0000007800000001002000000000008006
      010000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00F7F6
      F600DDDCDB00D0CDCD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00CECC
      CB00D1CFCE00DFDEDD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00F7F6F600DDDCDB00D0CDCD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00CECCCB00D1CFCE00DFDEDD00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00F7F6F600D2D0CF00D0CECD00CCC9C700C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00CDCAC800D0CECD00D4D2D100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F7F6F600D2D0CF00D0CE
      CD00CDCBC900C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6
      C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6
      C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300CDCB
      CA00D0CECD00D4D2D100D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00DEDDDC00D0CE
      CD00A79D8000544516004F3F10004F3F10004F3F10004F3F10004F3F10004F3F
      10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F
      10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F
      100057471A00AEA58D00D0CECD00DFDEDD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00DEDDDC00D0CECD00BEB9AE0079746200746F5D00746F5D00746F
      5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F
      5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F
      5D00746F5D00746F5D00746F5D007B766500C1BEB400D0CECD00DFDEDD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D1CFCE00CBC7C0008F741F00705A1600604D1300604D
      1300604D1300604D1300604D1300604D1300604D1300604D1300604D1300604D
      1300604D1300604D1300604D1300604D1300604D1300604D1300604D1300604D
      1300604D1300604D1300604D1300604D1300725B160091772500CECBC800D1CF
      CE00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D1CFCE00D0CDCA00D1C8
      A800A7A086008D8771008D8771008D8771008D8771008D8771008D8771008D87
      71008D8771008D8771008D8771008D8771008D8771008D8771008D8771008D87
      71008D8771008D8771008D8771008D8771008D8771008D8771008D877100AAA2
      8800D2C9AA00D0CDCC00D1CFCE00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00CECCCB00C5BF
      AF0090741D0091751D0095771D0095781D0095781D0095781D0095781D009578
      1D0095781D0095781D0095781D0095781D0095781D0095781D0095781D009578
      1D0095781D0095781D0095781D0095781D0095781D0095781D0095781D009577
      1D0091741D0090741D00CAC6BE00CECCCB00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00CECCCB00D0CDC700D4CBAA00D6CCAB00DBD2B000DCD2B000DCD2
      B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2
      B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2
      B000DCD2B000DCD2B000DBD1B000D5CCAB00D4CBAA00D0CDCA00CECCCB00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E009E812C00ECE6D600BEAB730097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200D6CCAD007371
      6B00ADA69100DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E00E5DE
      C700FFFFFF00FFFFFF00BEAB730097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B2007B7970005B5B5B005B5B5B00ADA69100DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E00D8CDAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB
      730097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B2008C887B005B5B5B005B5B
      5B005B5B5B005B5B5B00ADA69100DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E00D8CDAB00FFFFFF00FFFF
      FF00ECE6D600F2EFE400FFFFFF00FFFFFF00BEAB730097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B2008C887B005B5B5B005B5B5B0073716B006B6A66005B5B5B005B5B5B00ADA6
      9100DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E00D8CDAB00FFFFFF00FFFFFF00ECE6D600B19B5600F9F7F200FFFFFF00FFFF
      FF00FFFFFF00BEAB730097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B2008C887B005B5B5B005B5B5B0073716B00BDB6
      9C00636260005B5B5B005B5B5B005B5B5B00ADA69100DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E00D8CDAB00FFFFFF00FFFFFF00ECE6D600B19B
      5600F9F7F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB73009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B1008C887B005B5B
      5B005B5B5B0073716B00BDB69C00636260005B5B5B005B5B5B005B5B5B005B5B
      5B005B5B5B00ADA69100DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E00D8CD
      AB00FFFFFF00ECE6D600B19B5600F9F7F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00BEAB730097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B1008C887B005B5B5B0073716B00BDB69C00636260005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B00ADA69100DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E00C5B48100B19B5600F9F7F200FFFF
      FF00FFFFFF00D8CDAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BEAB730097791E0097791E0097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200A49F
      8C00BDB69C00636260005B5B5B005B5B5B008C887B005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B005B5B5B00ADA69100DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E00D2C59D00FFFFFF00FFFFFF00C5B48100ECE6D600FFFFFF00FFFF
      FF00FFFFFF00DFD5B900F9F7F200FFFFFF00FFFFFF00BEAB730097791E009779
      1E0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200949081005B5B5B005B5B5B00A49F
      8C0073716B005B5B5B005B5B5B005B5B5B0084807600636260005B5B5B005B5B
      5B00ADA69100DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E00D2C59D00BEAB
      7300D8CDAB00FFFFFF00FFFFFF00FFFFFF00D8CDAB00BEAB7300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BEAB730097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B20094908100ADA691008C887B005B5B5B005B5B5B005B5B5B008C88
      7B00ADA691005B5B5B005B5B5B005B5B5B005B5B5B00ADA69100DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E00B19B5600FFFFFF00FFFFFF00FFFFFF00D8CD
      AB00BEAB7300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB
      730097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200BDB69C005B5B
      5B005B5B5B005B5B5B008C887B00ADA691005B5B5B005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B00ADA69100DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E009779
      1E00BEAB7300FFFFFF00ECE6D600BEAB7300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEAB730097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B200DED4B200ADA691005B5B5B0073716B00ADA691005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B00ADA6
      9100DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E0097791E0097791E00B8A36500C5B48100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F7F200FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BEAB730097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200B5AE9700A49F8C005B5B5B005B5B5B005B5B5B005B5B5B00636260005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B00ADA69100DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E00BEAB7300FFFFFF00FFFFFF00FFFFFF00DFD5B900ECE6
      D600FFFFFF00FFFFFF00FFFFFF00F2EFE400FFFFFF00FFFFFF00C5B481009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200ADA691005B5B5B005B5B
      5B005B5B5B008480760073716B005B5B5B005B5B5B005B5B5B006B6A66005B5B
      5B005B5B5B00A49F8C00DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E00BEAB
      7300FFFFFF00D8CDAB00DFD5B900FFFFFF00FFFFFF00FFFFFF00D2C59D00C5B4
      8100FFFFFF00FFFFFF00D8CDAB0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200ADA691005B5B5B008C887B00848076005B5B5B005B5B
      5B005B5B5B0094908100A49F8C005B5B5B005B5B5B008C887B00DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E00B19B5600D8CDAB00FFFFFF00FFFF
      FF00FFFFFF00D8CDAB00BEAB7300FFFFFF00FFFFFF00D8CDAB0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200BDB6
      9C008C887B005B5B5B005B5B5B005B5B5B008C887B00ADA691005B5B5B005B5B
      5B008C887B00DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E00BEAB7300FFFFFF00FFFFFF00D8CDAB00BEAB7300FFFFFF00FFFF
      FF00D8CDAB0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200ADA691005B5B5B005B5B5B008C88
      7B00ADA691005B5B5B005B5B5B008C887B00DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E00BEAB7300D8CD
      AB00BEAB7300FFFFFF00FFFFFF00ECE6D60097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200ADA691008C887B00ADA691005B5B5B005B5B5B0073716B00DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0096791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E00A48A3A00FFFFFF00FFFFFF00ECE6D6009E81
      2C0097791E0097791E0097791E0096781E0091751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200CEC5A7005B5B
      5B005B5B5B0073716B00D6CCAD00DED4B200DED4B200DED4B200DDD3B100D6CD
      AB00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00C5BF
      AF0090741D0092751D0096791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E00BEAB7300ECE6D6009E812C0097791E0097791E0097791E0097791E009678
      1E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00DDD3B100DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200ADA6910073716B00D6CCAD00DED4B200DED4
      B200DED4B200DED4B200DDD3B100D6CDAB00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D0092751D0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0092751D0090741D00CAC6BE00D0CE
      CD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00DDD4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B200D6CD
      AC00D4CBAA00D0CDCA00D0CECD00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D0CECD00CAC6
      BD0092761F00A48B3D00AF985200AF985200AF985200AF985200AF985200AF98
      5200AF985200AF985200AF985200AF985200AF985200AF985200AF985200AF98
      5200AF985200AF985200AF985200AF985200AF985200AF985200AF985200AF98
      5200A3893B0093782300CECBC700D0CDCD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC900D5CCAB00E1D8BB00E5DEC400E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E0D7BA00D5CCAC00D0CDCB00D0CDCD00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00DCDBDA00D0CECD00BBAE8700B8A46600B9A56700B9A5
      6700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A5
      6700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A5
      6700B9A56700B9A56700B9A56700B9A56700B8A46600BEB29100D0CECD00DDDC
      DB00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DCDBDA00D0CECD00D8D3
      C400E8E1CA00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2
      CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2
      CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E7E1
      CA00D7D2C500D0CECD00DDDCDB00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00F5F5F400D0CD
      CD00D0CECD00CECAC400CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7
      BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7
      BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7
      BC00CECAC500D0CECD00D2D0CF00F7F6F600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00F5F5F400D0CDCD00D0CECD00D2CFCC00D4D1CC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D1CFCC00D0CECD00D2D0CF00F7F6F600D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00F5F5F400DCDBDA00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00CECCCB00D1CFCE00DEDDDC00F7F6F600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F5F5F400DCDB
      DA00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00CECCCB00D1CF
      CE00DEDDDC00F7F6F600D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001C1C1C4E4444
      44BE575757F45B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF575757F4444444BE1B1B1B4D00000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F7F6F600DDDCDB00D0CD
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00CECCCB00D1CFCE00DFDE
      DD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F7F6F600DDDC
      DB00D0CDCD00D0CDCD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00CECCCB00D1CFCE00DFDEDD00DFDEDD00D8E9EC00D8E9EC00D8E9
      EC0000000000333333965B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF33323288D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00F7F6F600D2D0CF00D0CECD00CCC9C700C5C2BD00C5C2BD00C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2BD00C5C2
      BD00C5C2BD00C5C2BD00CDCAC800D0CECD00D4D2D100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00F7F6F600D2D0CF00D0CECD00CDCBC900CDCBC900C8C6C300C8C6
      C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6
      C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6
      C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300C8C6C300CDCBCA00D0CE
      CD00D0CECD00D4D2D100D8E9EC00D8E9EC001B1B1B4D5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DEDDDC00D0CECD00A79D80005445
      16004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F
      10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F
      10004F3F10004F3F10004F3F10004F3F10004F3F10004F3F100057471A00AEA5
      8D00D0CECD00DFDEDD00D8E9EC00D8E9EC00D8E9EC00DEDDDC00D0CECD00BEB9
      AE007974620079746200746F5D00746F5D00746F5D00746F5D00746F5D00746F
      5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F
      5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F5D00746F
      5D00746F5D00746F5D007B766500C1BEB400C1BEB400D0CECD00DFDEDD00D8E9
      EC00444444BE5B5B5BFF5B5B5BFF504F4DFF37352EFF5D594BFF6E6958FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF777260FFA39B83FFCCC3
      A6FF827F76FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D1CFCE00CBC7C0008F741F00705A1600604D1300604D1300604D1300604D
      1300604D1300604D1300604D1300604D1300604D1300604D1300604D1300604D
      1300604D1300604D1300604D1300604D1300604D1300604D1300604D1300604D
      1300604D1300604D1300725B160091772500CECBC800D1CFCE00D8E9EC00D8E9
      EC00D8E9EC00D1CFCE00D0CDCA00D1C8A800A7A08600A7A086008D8771008D87
      71008D8771008D8771008D8771008D8771008D8771008D8771008D8771008D87
      71008D8771008D8771008D8771008D8771008D8771008D8771008D8771008D87
      71008D8771008D8771008D8771008D8771008D8771008D877100AAA28800D2C9
      AA00D2C9AA00D0CDCC00D1CFCE00D8E9EC00565656F25B5B5BFF5B5B5BFF3735
      2EFF333129FF403E34FF686454FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF837E69FFBDB497FFE0D6B6FFD5CDB2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CECCCB00C5BFAF0090741D009175
      1D0095771D0095781D0095781D0095781D0095781D0095781D0095781D009578
      1D0095781D0095781D0095781D0095781D0095781D0095781D0095781D009578
      1D0095781D0095781D0095781D0095781D0095781D0095771D0091741D009074
      1D00CAC6BE00CECCCB00D8E9EC00D8E9EC00D8E9EC00CECCCB00D0CDC700D4CB
      AA00D6CCAB00D6CCAB00DBD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2
      B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2
      B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2B000DCD2
      B000DCD2B000DBD1B000D5CCAB00D4CBAA00D4CBAA00D0CDCA00CECCCB00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF37342CFF333129FF555144FF948D77FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFB2AA8EFFE0D7B7FFE5DD
      C3FFE8E1C9FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3533
      2BFF34322AFF76715FFFCEC5A5FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDFD5B3FFE6DFC5FFEAE4CFFFEBE5D1FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FF60605EFF5B5B5BFFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFD5CBACFF5B5B
      5BFF5B5B5BFFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFC6BEA2FFDBD2
      B0FFDBD2B0FFDBD2B0FF7D7B72FF5B5B5BFF61605FFFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E00C2B07C00AB92480097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B200A8A18E00C5BDA200C5BDA200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF646461FFAEA792FFDBD2B0FFCFC6A8FF5B5B5BFF5B5B
      5BFF7D7B72FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E0097791E00F9F7F200A48A
      3A0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E00C0AD7600A48A3A00C5B4800096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4
      B20063626000CEC5A700CEC5A700DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200AAA49000CEC5
      A700A49F8C00DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5B5B5BFF5D5C
      5CFFC1B99FFF838075FF5B5B5BFF5E5D5DFFCCC3A6FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E00F2EFE400ECE6D6009E812C0097791E0097791E00ECE6
      D600BCA96F009E812C0097791E0097791E00A48A3A00FFFFFF00FFFFFF00BEAB
      7300A489390096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B2006B6A660073716B0073716B00D6CC
      AD00DED4B200DED4B20073716B00AFA99300D6CCAD00DED4B200DED4B200DED4
      B200CEC5A7005B5B5B005B5B5B00ADA69100CEC5A800DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF5C5C5CFF5B5B5BFF62615FFF5E5D5DFF5B5B5BFF6262
      60FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E00AB924800FFFFFF00FFFF
      FF00BEAB730097791E0097791E00FFFFFF00EEE9DB00BEAB730097791E009779
      1E00A4893900DAD0AF00FAF8F400AF9953009E812C0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200C5BD
      A2005B5B5B005B5B5B005B5B5B00ADA69100DED4B200DED4B2005B5B5B00706E
      6900ADA69100DED4B200DED4B200DED4B200CEC5A80089877A0062615F00C0B8
      9D00D6CCAD00DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5D5D5CFF999484FF868277FF8E8A7DFFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E00C5B48100FFFFFF00E9E2CE00AB924800A48A3A00BEAB7300FFFF
      FF00FFFFFF00AB92480097791E00A4893900E5DDC700E5DDC600C2B07C00BEAB
      730097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200A49F8C005B5B5B0077756E0077756E00C5BD
      A200CEC5A700ADA691005B5B5B005B5B5B00C5BDA200DED4B200CEC5A800CEC5
      A8007D7970007D797000A8A18E00ADA69200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF716F69FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E00C5B48100DFD6BB00D7CBA7009779
      1E0097791E00E5DEC700FFFFFF00FFFFFF00FFFFFF00DFD5B900CBBC8F00D5C9
      A300FAF9F400CFC1950097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200A49F8C008380
      75008E8B7D00DED4B200DED4B200DED4B2007B7970005B5B5B005B5B5B005B5B
      5B00848076009C978600908D7F00908D7F0061615F0098958400DED4B200DED4
      B200DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF868277FFCFC6A8FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E00CBBC
      8F00FFFFFF00EEE9DB009E812C0097791E0097791E00CBBC8F00FFFFFF00F9F7
      F200FAF8F400FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1D9BE00A48A3A009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B20079776F005B5B5B005B5B5B00817E7400C0B89D00C0B89D00DED4
      B200C5BDA200626260005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B009B968500DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFFD8CFAEFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E00E7E0CB00FFFFFF00FFFFFF00E1D8BD00AF99
      530097791E00AB924800F9F8F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00CDBE910097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B1009F9B8900A59F8C00676663005B5B5B006B6A
      66005B5B5B00A39D8A00A39D8A00DED4B200CEC5A70073726C005B5B5B005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B00908C7E00B5AE
      9700DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF938F80FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E00C9B98900C5B48000F5F3
      EB00FFFFFF00F2EFE400FFFFFF00C6B6850097791E00A48A3A00ECE6D400FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5C9A400B8A3
      650097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B1009C97
      86005B5B5B005B5B5B0061615F006867630069686300908C7F00908C7F008480
      7600A39D8B00B5AE97005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B
      5B005B5B5B005B5B5B005B5B5B005B5B5B00BDB69C00DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5C5C5CFF9893
      84FFDAD0AFFFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E00CBBC8F00FFFFFF00FFFFFF00FAF9F400F5F2E900F5F0E800D5C8
      A300DFD5B900C7B58300B8A36500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B19B560096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200C5BDA200DED4B2007A776F006B69
      65007B78700073716B0073716B005B5B5B0098938300D6CCAD00A09B8800DED4
      B200949081008C887B0067666400676664009C9786008D897C00C5BDA200CEC5
      A800DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5C5B5BFF5B5B
      5BFF5B5B5BFF62615FFFAEA792FFDAD0AFFFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E00AB9248009779
      1E00E7E0CB00F4EFE400E6DFC900ECE6D600FFFFFF00CEC096009E812C00C9B9
      890097791E00D2C59D00D8CDAB00F5F3EA00CBBC8F00D7CCA900AB924800A489
      390097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200CEC5A800908C7E009E9887009E9887008985
      79009C978600D6CCAD00C0B89D00DED4B200DED4B200CEC5A800C7BEA300C7BE
      A300DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF5C5C5CFF5B5B5BFF6F6D68FFC6BEA2FFDBD1B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E00A4893900D4C8A300CABB
      8D00DAD0B000CBBC8F009E812C00AF99530097791E0097791E00A4893900AA90
      450097791E0097791E0097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5B5B5BFF7270
      6AFFD3CAABFFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6
      D2FFECE6D2FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF3331
      29FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FF75736CFFD0C7A8FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFE0D7B7FFE8E1CAFFECE7D4FFECE6D3FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD3B100DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DDD3B100D6CDAB00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC005B5B5BFF5B5B5BFF5B5B5BFF333129FF403E34FF8A836EFFDAD0AFFFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFE0D7B7FFE6DEC4FFECE6D2FFEEE9
      D7FFEDE7D5FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0096791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0096781E0091751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC700D4CBAA00D6CDAC00D6CDAC00DDD3B100DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DDD3B100D6CDAB00D4CB
      AA00D4CBAA00D0CDCA00D0CECD00D8E9EC005B5B5BFF5B5B5BFF5B5B5BFF514D
      41FF76705EFFB3AB90FFE1D8B9FFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE5DDC1FFEAE4CEFFEDE8D6FFEEE9D7FFEEE9D7FF5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00C5BFAF0090741D009275
      1D0096791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0096781E0091751D009074
      1D00CAC6BE00D0CECD00D8E9EC00D8E9EC00D8E9EC00D0CECD00D0CDC700D4CB
      AA00D6CDAC00D6CDAC00DDD4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4B200DED4
      B200DED4B200DDD3B200D6CDAC00D4CBAA00D4CBAA00D0CDCA00D0CECD00D8E9
      EC00565656F25B5B5BFF5B5B5BFF8E8874FFACA48AFFD2C8A8FFE3DABDFFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE6DEC5FFEBE5D0FFEDE8D6FFEEE8
      D7FFDFDAC9FF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D0CECD00C5BFAF0090741D0092751D0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0097791E0097791E0097791E0097791E0097791E009779
      1E0097791E0097791E0092751D0090741D00CAC6BE00D0CECD00D8E9EC00D8E9
      EC00D8E9EC00D0CECD00D0CDC900D5CCAB00E1D8BB00E1D8BB00E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DE
      C400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E5DEC400E0D7BA00D5CC
      AC00D5CCAC00D0CDCB00D0CDCD00D8E9EC00444444BE5B5B5BFF5B5B5BFF7875
      6DFFBAB297FFE0D6B6FFE4DCC0FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE5DDC2FFE8E1CAFFEDE7D4FFDFDAC9FF82817CFE5B5B5BFF5B5B5BFFD8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D0CECD00CAC6BD0092761F00A48B
      3D00AF985200AF985200AF985200AF985200AF985200AF985200AF985200AF98
      5200AF985200AF985200AF985200AF985200AF985200AF985200AF985200AF98
      5200AF985200AF985200AF985200AF985200AF985200AF985200A3893B009378
      2300CECBC700D0CDCD00D8E9EC00D8E9EC00D8E9EC00DCDBDA00D0CECD00D8D3
      C400E8E1CA00E8E1CA00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2
      CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2
      CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2CB00E9E2
      CB00E9E2CB00E9E2CB00E7E1CA00D7D2C500D7D2C500D0CECD00DDDCDB00D8E9
      EC001B1B1B4C5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFFD8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00DCDBDA00D0CECD00BBAE8700B8A46600B9A56700B9A56700B9A56700B9A5
      6700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A5
      6700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A56700B9A5
      6700B9A56700B9A56700B8A46600BEB29100D0CECD00DDDCDB00D8E9EC00D8E9
      EC00D8E9EC00F5F5F400D0CDCD00D0CECD00D2CFCC00D2CFCC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1
      CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D4D1CC00D1CFCC00D0CE
      CD00D0CECD00D2D0CF00F7F6F600D8E9EC0000000000484743A85B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF2F2F2F84D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00F5F5F400D0CDCD00D0CECD00CECA
      C400CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7
      BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7
      BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CCC7BC00CECAC500D0CE
      CD00D2D0CF00F7F6F600D8E9EC00D8E9EC00D8E9EC00D8E9EC00F5F5F400DCDB
      DA00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00CECCCB00D1CFCE00DEDDDC00DEDDDC00F7F6F600D8E9EC00D8E9
      EC0000000000000000001B1B1B4D444444BE575757F35B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5757
      57F3444444BE1B1B1B4C00000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00F5F5F400DCDBDA00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CECD00D0CE
      CD00D0CECD00CECCCB00D1CFCE00DEDDDC00F7F6F600D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000003F3F3F4E9999
      99BEC4C4C4F4CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFC4C4C4F4999999BE3E3E3E4D000000000000
      0000000000003F3F3F4E999999BEC4C4C4F4CDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC4C4C4F49999
      99BE3E3E3E4D0000000000000000000000001C1C1C4E444444BE575757F45B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF575757F4444444BE1B1B1B4D0000000000000000000000001C1C
      1C4E444444BE575757F45B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF575757F4444444BE1B1B1B4D0000
      0000000000006A6A6A84CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF78756E9A000000006A6A6A84CDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF78756E9A000000003333
      33965B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF403E369E00000000333333965B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF403E369E3E3E3E4DCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF3E3E
      3E4DCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF1B1B1B4D5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF1B1B1B4D5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF999999BECDCDCDFFCDCDCDFFA09D94FC332D1AFF231C07FF3E320CFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF514110FF6E5816FF9980
      30FFBFB79EFFCDCDCDFFCDCDCDFF999999BECDCDCDFFCDCDCDFFA09D94FC332D
      1AFF231C07FF3E320CFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF514110FF6E5816FF998030FFBFB79EFFCDCDCDFFCDCDCDFF444444BE5B5B
      5BFF5B5B5BFF504F4DFF37352EFF5D594BFF6E6958FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF777260FFA39B83FFCCC3A6FF827F76FF5B5B
      5BFF5B5B5BFF444444BE5B5B5BFF5B5B5BFF504F4DFF37352EFF5D594BFF6E69
      58FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF777260FFA39B
      83FFCCC3A6FF827F76FF5B5B5BFF5B5B5BFFC3C3C3F2CDCDCDFFCDCDCDFF342D
      1AFF231C07FF231C07FF2B2208FF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF594712FF7F6619FF9C8029FFA89048FFCDCDCDFFCDCDCDFFC3C3
      C3F2CDCDCDFFCDCDCDFF342D1AFF231C07FF231C07FF2B2208FF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF594712FF7F6619FF9C8029FFA890
      48FFCDCDCDFFCDCDCDFF565656F25B5B5BFF5B5B5BFF37352EFF333129FF403E
      34FF686454FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF837E
      69FFBDB497FFE0D6B6FFD5CDB2FF5B5B5BFF5B5B5BFF565656F25B5B5BFF5B5B
      5BFF37352EFF333129FF403E34FF686454FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A59FF6F6A
      59FF6F6A59FF6F6A59FF837E69FFBDB497FFE0D6B6FFD5CDB2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF231C07FF3C300CFF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF796118FF9D812BFFAE97
      50FFB6A162FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF231C07FF3C300CFF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF796118FF9D812BFFAE9750FFB6A162FFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF37342CFF333129FF555144FF948D77FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFB2AA8EFFE0D7B7FFE5DDC3FFE8E1C9FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF37342CFF333129FF555144FF948D
      77FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F
      85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFA69F85FFB2AA8EFFE0D7
      B7FFE5DDC3FFE8E1C9FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF251E
      07FF231C07FF34290AFF635014FF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FFA08431FFA99044FFA38938FFA18633FFA085
      32FF9E822DFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF997B22FFB19B56FFBFAC74FFC1B07AFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF251E07FF231C07FF34290AFF635014FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF997B22FFB19B56FFBFAC74FFC1B0
      7AFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF35332BFF34322AFF7671
      5FFFCEC5A5FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDFD5
      B3FFE6DFC5FFEAE4CFFFEBE5D1FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF35332BFF34322AFF76715FFFCEC5A5FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDFD5B3FFE6DFC5FFEAE4CFFFEBE5D1FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF241D07FF241C07FF4F4010FF8B6F1CFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FFC9B9
      8AFFFEFEFDFFFEFDFCFFFEFDFCFFFEFDFCFFE0D7BBFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF241D07FF241C
      07FF4F4010FF8B6F1CFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FFFBFAF6FFFFFF
      FFFF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FF8C897CFF5B5B5BFF5B5B
      5BFFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFB5AF97FF5E5D5DFF5C5B5BFF5C5C5CFF5B5B5BFFD8CFAEFFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FFCEBF94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDBD0B0FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF9E822EFFFFFFFFFFFFFFFFFF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FF928E80FF5B5B5BFF5B5B5BFF5B5B5BFFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFBEB79DFF5D5C5CFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF6C6B67FFD6CCADFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FFD1C4
      9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFAA9147FF997C22FF997C22FF997C22FFE4DCC4FFFFFFFFFFFBF9
      F5FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFD7CEAEFFD3CA
      ABFFD6CCADFFDED4B2FFDED4B2FF959081FF5B5B5BFF5B5B5BFF5B5B5BFF605F
      5EFFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFC5BD
      A1FF5C5C5CFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF8E8A
      7DFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FFB7A364FFFFFFFFFFFFFFFFFFFFFFFFFFF8F7
      F1FF9A7D25FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFF8F6EFFFBDAA71FF997C
      22FFA38938FFFFFFFFFFFFFFFFFFE4DCC4FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFD0C7A8FF696865FF5B5B5BFF5C5B5BFF5B5B5BFF7F7D73FFD0C7A9FF5B5B
      5BFF5B5B5BFF5B5B5BFF7C7971FFD7CDADFFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FF6C6B66FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5E5D5DFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FFBAA66AFFFFFFFFFFFDFCFBFFA38838FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFFFFFFFEFDFCFFAE9750FFE0D7BBFFFFFFFFFFFDFCFBFFA58B
      3DFF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FF5B5B5BFF5B5B5BFF5D5D5CFF6A69
      65FF5E5D5DFF5C5C5CFF5B5B5BFF5B5B5BFF5B5B5BFF7B7870FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDAD1B0FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FFC1AF
      79FFBCA86DFFB29C58FF997C22FF997C22FF997C22FFB6A060FFB09A55FF997C
      22FF997C22FF9D802AFFE4DCC4FFE0D7BBFFE0D8BDFFB39D5AFF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFFEFEFDFFFFFFFFFFFAF8
      F4FFFDFCFBFFFFFFFFFFF9F8F3FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FF8480
      76FF5D5D5CFFC0B89EFFDDD3B1FFDED4B2FFDAD1B0FFBCB59BFF5E5D5DFF5B5B
      5BFF898579FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFB5AF97FF5D5C5CFF5D5C5CFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5C5C5CFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FFFFFFFFFFFFFFFFFFFFFFFFFFAF9953FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FFF8F7F1FFFFFFFFFFFFFF
      FFFFFFFFFFFFDFD5B9FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFBFFCEBF
      94FFDDD3B6FFD6CAA7FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFC0B89EFF5C5B5BFFD6CCADFFDED4B2FFC8C0A3FFDBD2
      B0FFDED4B2FFDED4B2FFD6CCADFF5B5B5BFFC2BA9FFFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FF5C5B5BFFC0B8
      9EFF838075FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5C5B
      5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBAA66AFF997C22FF997C22FF997C22FF997C
      22FFAD954EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7CCA9FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE9DAFF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDDD3B1FF61605FFF5C5B
      5BFFDED4B2FFDED4B2FFDBD2B0FF5B5B5BFFDDD4B2FFDED4B2FFDED4B2FF5C5C
      5CFF6D6C67FFDDD3B1FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFB7B098FFDBD2B0FF817E74FF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5C5B5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FFFFFFFFFFFFFEFEFFFFFFFFFFFEFDFCFFB09A
      55FF997C22FF997C22FF997C22FF997C22FFAF9852FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD4C8A2FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDDD3B6FFA38938FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDBD1B0FF5B5B5BFF6B6A66FFC4BCA1FFD5CCACFFCDC4A6FF5B5B
      5BFFC3BBA0FFCEC5A7FFDDD4B2FF6A6965FF60605EFFC5BDA1FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FF7A776FFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5C5B
      5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FFFFFF
      FFFFFFFFFFFFFFFFFFFFA58B3DFF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD1B2FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B7F28FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFCAC1A5FF5B5B5BFF8380
      75FF9E9987FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFFD9CFAFFF8380
      75FF61605FFFB5AF97FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FF79776FFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5F5E5DFF5B5B5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FFB6A162FFBAA66AFFC5B482FF997C22FF997C
      22FF997C22FFA78E41FFBAA66AFF997C22FF997C22FFB49F5EFFC3B27DFFB49F
      5EFFB49E5CFFA99045FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6
      9FFF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFD6CDADFF5B5B5BFF61615FFFDAD0AFFFC6BEA2FFC1B99FFF5B5B
      5BFFBAB29AFFCAC2A5FFDED4B2FF62615FFF5F5E5DFFCAC2A5FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FF6F6E68FF61605FFF878378FF5C5B5BFF7A776FFF5C5B5BFF8D8A7CFF5B5B
      5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF9D812BFFFDFCFBFFFFFFFFFFAF98
      52FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFFFFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFDFFCEC096FF9A7D25FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFD6CDADFF676663FF5B5B
      5BFFDED4B2FFDED4B2FFBAB29AFF5C5B5BFFDDD3B1FFDED4B2FFDED4B2FF5B5B
      5BFF686764FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FF6A6965FF686764FFBCB59BFF5E5E
      5DFFC3BBA0FF5E5E5DFF848076FF5B5B5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF9F84
      30FFF6F3ECFFFFFFFFFFFFFFFFFFFDFCFAFF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFEFEFFFFFFFFFFFFFFFFFFFAF8F4FFBDAA71FF9A7D25FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFD8CFAEFF5E5E5DFFA8A28EFFDED4B2FFDDD4B2FFCBC2
      A5FFDED4B2FFDED4B2FFC6BEA2FF5B5B5BFFC0B89EFFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FF6C6B66FF676663FFB0A993FF5E5D5DFFB3AD96FF5E5D5DFF7B7870FF5B5B
      5BFFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FFD3C7A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB59F5EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFFEFEFDFFFFFFFFFFF0EB
      DDFFAA9147FF997C23FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFAFA8
      93FF5B5B5BFF8C897CFFDAD0AFFFDED4B2FFDBD1B0FF827F75FF5C5B5BFF827F
      75FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FF626260FF60605EFFB3AD96FF5E5D
      5DFFB5AF97FF5D5C5CFFC2BA9FFF868277FFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FFCEBF
      94FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E3D0FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FFFFFFFFFFEDE8D8FFA08431FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FF5D5D5CFF5B5B5BFF5E5D5DFF6564
      61FF62615FFF5B5B5BFF605F5EFFDDD4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0C7FFECE6D2FFECE6D2FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E69FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFBAB39AFFBCB59BFFA7A18DFF5D5D5CFFB5AF97FF5B5B5BFFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE7E0
      C7FFECE6D2FFECE6D2FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FFD3C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF1EDE0FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF997C22FF997C22FFEBE5D3FFA28837FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF333129FF837E
      69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFD2C9AAFF7D7B72FF6C6B67FF6F6D68FF6E6D68FF74726BFFDCD2B1FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFE0D7
      B7FFE8E1CAFFECE7D4FFECE6D3FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF333129FF333129FF837E69FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFAEA792FF5D5D
      5CFFC0B89EFFC9C1A4FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4
      B2FFDED4B2FFDED4B2FFE0D7B7FFE8E1CAFFECE7D4FFECE6D3FF5B5B5BFF5B5B
      5BFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF2C2309FF5E4B13FF94771DFF9779
      1EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF9D812BFFB8A365FFC4B3
      80FFC3B27DFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF2C23
      09FF5E4B13FF94771DFF97791EFF97791EFF97791EFF97791EFF97791EFF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF9D812BFFB8A365FFC4B380FFC3B27DFFCDCDCDFFCDCDCDFF5B5B5BFF5B5B
      5BFF5B5B5BFF333129FF403E34FF8A836EFFDAD0AFFFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDED4
      B2FFDED4B2FFDED4B2FFE0D7B7FFE6DEC4FFECE6D2FFEEE9D7FFEDE7D5FF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF333129FF403E34FF8A836EFFDAD0
      AFFFDED4B2FFDED4B2FFDED4B2FFDED4B2FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2B0FFDBD2
      B0FFDBD2B0FFDBD2B0FFDBD2B0FFDED4B2FFDED4B2FFE0D7B7FFE6DEC4FFECE6
      D2FFEEE9D7FFEDE7D5FF5B5B5BFF5B5B5BFFCDCDCDFFCDCDCDFFCDCDCDFF372C
      0BFF504010FF7A6218FFA08532FFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFAC944BFFBFAD75FFCABA8BFFC5B583FFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF372C0BFF504010FF7A6218FFA08532FFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFAC944BFFBFAD75FFCABA8BFFC5B5
      83FFCDCDCDFFCDCDCDFF5B5B5BFF5B5B5BFF5B5B5BFF514D41FF76705EFFB3AB
      90FFE1D8B9FFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE5DDC1FFEAE4
      CEFFEDE8D6FFEEE9D7FFEEE9D7FF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF514D41FF76705EFFB3AB90FFE1D8B9FFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DABDFFE3DA
      BDFFE3DABDFFE5DDC1FFEAE4CEFFEDE8D6FFEEE9D7FFEEE9D7FF5B5B5BFF5B5B
      5BFFC3C3C3F2CDCDCDFFCDCDCDFF6F5D26FF755D17FF8F721CFFA68C3FFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFB09A55FFC0AE76FFC8B8
      88FFC9BB91FFCDCDCDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCDCDFF6F5D26FF755D
      17FF8F721CFFA68C3FFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFB09A55FFC0AE76FFC8B888FFC9BB91FFCDCDCDFFCDCDCDFF565656F25B5B
      5BFF5B5B5BFF8E8874FFACA48AFFD2C8A8FFE3DABDFFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE6DEC5FFEBE5D0FFEDE8D6FFEEE8D7FFDFDAC9FF5B5B
      5BFF5B5B5BFF565656F25B5B5BFF5B5B5BFF8E8874FFACA48AFFD2C8A8FFE3DA
      BDFFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE6DEC5FFEBE5D0FFEDE8
      D6FFEEE8D7FFDFDAC9FF5B5B5BFF5B5B5BFF999999BECDCDCDFFCDCDCDFFB8B0
      9AFF8C752CFF9C8029FFA99146FFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAD954EFFB7A263FFC6B689FFCBC7B8FFCDCDCDFFCDCDCDFF9999
      99BECDCDCDFFCDCDCDFFB8B09AFF8C752CFF9C8029FFA99146FFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAD954EFFB7A263FFC6B689FFCBC7
      B8FFCDCDCDFFCDCDCDFF444444BE5B5B5BFF5B5B5BFF78756DFFBAB297FFE0D6
      B6FFE4DCC0FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE5DDC2FFE8E1
      CAFFEDE7D4FFDFDAC9FF83827CFF5B5B5BFF5B5B5BFF444444BE5B5B5BFF5B5B
      5BFF78756DFFBAB297FFE0D6B6FFE4DCC0FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DCC1FFE4DC
      C1FFE4DCC1FFE5DDC2FFE8E1CAFFEDE7D4FFDFDAC9FF83827CFF5B5B5BFF5B5B
      5BFF3D3D3D4CCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF3D3D3D4CCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF1B1B1B4C5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF1B1B1B4C5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF0000000077756C9FCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF7A7874980000
      000077756C9FCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF7A78749800000000514E45BB5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF3F3D399800000000514E45BB5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF3F3D
      399800000000000000003E3E3E4D999999BEC3C3C3F3CDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC3C3
      C3F3999999BE3D3D3D4C0000000000000000000000003E3E3E4D999999BEC3C3
      C3F3CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFC3C3C3F3999999BE3D3D3D4C00000000000000000000
      00001B1B1B4D444444BE575757F35B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF575757F3444444BE1B1B
      1B4C0000000000000000000000001B1B1B4D444444BE575757F35B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B5BFF5B5B
      5BFF575757F3444444BE1B1B1B4C0000000000000000000000003F3F3F4E9999
      99BEC4C4C4F4CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFC4C4C4F4999999BE3E3E3E4D000000000000
      0000000000003F3F3F4E999999BEC4C4C4F4CDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC4C4C4F49999
      99BE3E3E3E4D0000000000000000000000003F3F3F4E999999BEC4C4C4F4CDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFC4C4C4F4999999BE3E3E3E4D0000000000000000000000003F3F
      3F4E999999BEC4C4C4F4CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC4C4C4F4999999BE3E3E3E4D0000
      0000000000006A6A6A84CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF78756E9A000000006A6A6A84CDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF78756E9A000000006A6A
      6A84CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF78756E9A000000006A6A6A84CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF78756E9A3E3E3E4DCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF3E3E
      3E4DCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF3E3E3E4DCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF3E3E3E4DCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF999999BECDCDCDFFCDCDCDFFA09D94FC332D1AFF231C07FF3E320CFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF514110FF6E5816FF9980
      30FFBFB79EFFCDCDCDFFCDCDCDFF999999BECDCDCDFFCDCDCDFFA09D94FC332D
      1AFF231C07FF3E320CFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF514110FF6E5816FF998030FFBFB79EFFCDCDCDFFCDCDCDFF999999BECDCD
      CDFFCDCDCDFFA09D94FC332D1AFF231C07FF3E320CFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF514110FF6E5816FF998030FFBFB79EFFCDCD
      CDFFCDCDCDFF999999BECDCDCDFFCDCDCDFFA09D94FC332D1AFF231C07FF3E32
      0CFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF514110FF6E58
      16FF998030FFBFB79EFFCDCDCDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCDCDFF342D
      1AFF231C07FF231C07FF2B2208FF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF594712FF7F6619FF9C8029FFA89048FFCDCDCDFFCDCDCDFFC3C3
      C3F2CDCDCDFFCDCDCDFF342D1AFF231C07FF231C07FF2B2208FF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF594712FF7F6619FF9C8029FFA890
      48FFCDCDCDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCDCDFF342D1AFF231C07FF231C
      07FF2B2208FF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF5947
      12FF7F6619FF9C8029FFA89048FFCDCDCDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCD
      CDFF342D1AFF231C07FF231C07FF2B2208FF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C0FFF4B3C
      0FFF4B3C0FFF4B3C0FFF594712FF7F6619FF9C8029FFA89048FFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF231C07FF3C300CFF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF796118FF9D812BFFAE97
      50FFB6A162FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF231C07FF3C300CFF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF796118FF9D812BFFAE9750FFB6A162FFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF231C07FF3C300CFF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF796118FF9D812BFFAE9750FFB6A162FFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF231C07FF3C30
      0CFF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B
      16FF715B16FF715B16FF715B16FF715B16FF715B16FF715B16FF796118FF9D81
      2BFFAE9750FFB6A162FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF251E
      07FF231C07FF34290AFF635014FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF997B22FFB19B56FFBFAC74FFC1B07AFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF251E07FF231C07FF34290AFF635014FF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C23FFD1C39AFF997C23FF997C22FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF997B22FFB19B56FFBFAC74FFC1B0
      7AFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF251E07FF231C07FF3429
      0AFF635014FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF997B
      22FFB19B56FFBFAC74FFC1B07AFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF251E07FF231C07FF34290AFF635014FF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF997B22FFB19B56FFBFAC74FFC1B07AFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF241D07FF241C07FF4F4010FF8B6F1CFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFDACFAFFFFFFEFEFFFFFEFEFFFFFEFEFFDACFAFFF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF241D07FF241C
      07FF4F4010FF8B6F1CFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FFD7CCA9FFFFFFFFFFE0D7BBFF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF241D07FF241C07FF4F4010FF8B6F1CFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFFD8CDAAFFFFFFFFFFFFFF
      FFFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF241D07FF241C07FF4F4010FF8B6F
      1CFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FF997C22FFB7A364FFFDFCFBFFFFFEFEFFFEFEFDFFFFFFFFFF9B7F28FF997C
      22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFE1D9BFFFFFFFFFFFFFFFFFFFFFFF
      FFFFE1D9BFFF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FFB09A
      55FFFFFFFFFFFFFFFFFFFFFFFFFFCFC298FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFD3C7A1FFFFFFFFFFFFFFFFFFFFFFFFFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFB09A55FFFEFDFCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF1EDE1FF9E812CFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FFAA9247FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFB
      F9FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9C8029FFA084
      31FF9E812CFF97791EFF97791EFFD1C49CFFFFFFFFFFFFFFFFFFFFFFFFFFFBFA
      F7FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FFAB93
      49FFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6CA
      A7FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFF
      FFFFDFD5B9FF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FFF6F3ECFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFA28837FFF4F0E6FFFFFFFFFFFFFEFEFFFFFFFFFFE2DAC0FFA28736FFFFFF
      FFFFFFFFFFFFFFFFFFFFE5DDC7FF9D802AFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FFF2EEE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FFD5C9A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFDCD2B4FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFFFFFFFFFFFFFFFFFFDFDFBFFF3F0
      E5FFFDFCFBFFFEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFE6DEC8FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF9A7D24FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFF
      FFFFDFD5B9FF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD4C8A2FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFFDFD5
      B9FFFDFDFBFFAF9852FF987A20FF97791EFF9A7D24FFB29C58FFFDFCFBFFFFFF
      FFFFDBD0B0FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FFB7A364FFFEFDFCFFFEFDFCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FFA18634FFF9F8F3FFF8F6EFFFFEFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
      FCFFF9F8F3FFEFEBDDFF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFFAF9852FFFFFEFEFF9E812CFF97791EFFA99044FF997C
      22FF97791EFF97791EFF9E812CFFFFFFFFFFAD964FFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FFFFFEFEFFAF98
      52FFE0D7BBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFDDD3B6FFFFFFFFFFFFFFFFFFFFFF
      FFFFDDD3B6FF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF9F832FFF9A7D25FF997C22FFE1D9
      BFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D9BFFF9B7E27FF9D802AFF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF987A20FFFBF9F5FFFFFE
      FEFF97791EFF97791EFF997C22FFFFFFFFFF977A1FFF97791EFF97791EFFFEFE
      FDFFF1EDE0FF987A20FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FFB6A060FF997C22FFE1D9BFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF9B7E27FF997C
      22FFE1D9BFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D9BFFF9A7D25FF9C7F29FF9F83
      2FFF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FFDDD3B6FFFFFFFFFFFFFFFFFFFFFFFFFFDDD3
      B6FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF997C23FFFFFFFFFFF2EFE4FFAB934AFF9E822DFFA58B3CFFFFFF
      FFFFAD954DFFA48A3AFF977A1FFFF3F0E5FFFBFAF6FFAB9349FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFE7DFCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FFF9F8F3FFF8F6EFFFFEFDFCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFCFFF9F8F3FFF6F3ECFFA18634FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FFDFD5
      B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFFA78D40FFFFFFFFFFE0D7
      BBFFCABB8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B7E27FFE0D7
      BBFFFBF9F5FFB7A364FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFE7E1CCFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFBF9FFFFFFFFFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4B8FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5
      B9FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF9D812BFFFFFFFFFFFAF9F4FF9A7D25FFAA9247FFAE964FFFFFFF
      FFFFB49E5DFFA68D40FF97791EFFFAF8F4FFFCFBF9FFA68D40FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFEFEBDDFFFBF9F5FFDCD2B4FFFFFEFEFFE7DFCAFFFFFEFEFFD7CCA9FFFFFF
      FFFF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FFDCD2B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD5C9A5FF997C23FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FFDFD5
      B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF9D812BFFF5F2EAFFFFFF
      FFFF97791EFF97791EFFB49E5DFFFFFEFEFF987A20FF97791EFF97791EFFFFFF
      FFFFF5F2E9FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFF3F0E5FFF5F2E9FFB29C58FFFDFC
      FAFFAC944CFFFDFCFAFFDFD5B9FFFFFFFFFF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FFF6F3
      EBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FFDFD5B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5
      B9FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF9B7F28FFFDFCFAFFC2B07BFF97791EFF977A1FFFA68C
      3FFF97791EFF97791EFFAA9147FFFFFFFFFFAF9852FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFF2EEE2FFF6F3EBFFBCA86DFFFDFCFBFFB9A567FFFDFCFBFFE6DEC8FFFFFF
      FFFF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF9D812BFFFCFBF9FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FFDFD5
      B9FFFFFFFFFFFFFFFFFFFFFFFFFFDFD5B9FF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFFBDA9
      6FFFFFFFFFFFD8CDAAFF9A7D25FF97791EFF997C23FFE0D8BDFFFFFEFEFFE0D8
      BDFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FFF9F8F3FFFBFAF6FFB9A567FFFDFC
      FBFFB7A364FFFEFDFCFFAD964FFFDDD3B6FF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFCFC298FFFFFFFFFFFFFFFFFFFFFFFFFFB09A55FF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B1
      7CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C
      07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FFE1D9BFFFFFFFFFFFFFFFFFFFFFFFFFFFE1D9
      BFFF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFFDFDFBFFFFFFFFFFFDFCFBFFF7F5
      EEFFFAF8F4FFFFFFFFFFFBFAF7FF977A1FFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FFB49E5CFFB29C58FFC3B27DFFFDFDFBFFB7A364FFFFFFFFFF997C22FF997C
      22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF97791EFFB39D
      5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C
      07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FF997C22FFE0D7BBFFFFFFFFFFD7CC
      A9FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF97791EFF9779
      1EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF231C07FF231C07FF594812FF97791EFF97791EFF9779
      1EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C22FF997C22FFDACF
      AFFFFFFEFEFFFFFEFEFFFFFEFEFFDACFAFFF997C22FF997C22FF997C22FF997C
      22FF97791EFF97791EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B1
      7CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF231C07FF5948
      12FF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFA18633FFE4DCC4FFF1EDE1FFF0EBDDFFF0ECDEFFEBE6D5FF997B22FF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF231C07FF231C07FF594812FF97791EFF97791EFF97791EFF97791EFF9779
      1EFF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FFBDAA71FFFDFD
      FBFFAF9852FFA88F42FF997C22FF997C22FF997C22FF997C22FF997C22FF9779
      1EFF97791EFF97791EFF97791EFFB39D5BFFC3B17CFFC3B17CFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF2C2309FF5E4B13FF94771DFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C23FFD1C39AFF997C23FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF97791EFF97791EFF97791EFF9D812BFFB8A365FFC4B3
      80FFC3B27DFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF2C23
      09FF5E4B13FF94771DFF97791EFF97791EFF97791EFF97791EFF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9779
      1EFF9D812BFFB8A365FFC4B380FFC3B27DFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF231C07FF2C2309FF5E4B13FF94771DFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF97791EFF9779
      1EFF97791EFF97791EFF97791EFF9D812BFFB8A365FFC4B380FFC3B27DFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF231C07FF2C2309FF5E4B13FF9477
      1DFF97791EFF97791EFF97791EFF97791EFF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C22FF997C
      22FF997C22FF997C22FF997C22FF97791EFF97791EFF97791EFF9D812BFFB8A3
      65FFC4B380FFC3B27DFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF372C
      0BFF504010FF7A6218FFA08532FFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFAC944BFFBFAD75FFCABA8BFFC5B583FFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFF372C0BFF504010FF7A6218FFA08532FFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFAC944BFFBFAD75FFCABA8BFFC5B5
      83FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF372C0BFF504010FF7A62
      18FFA08532FFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFAC94
      4BFFBFAD75FFCABA8BFFC5B583FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFF372C0BFF504010FF7A6218FFA08532FFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C3EFFA68C
      3EFFA68C3EFFA68C3EFFAC944BFFBFAD75FFCABA8BFFC5B583FFCDCDCDFFCDCD
      CDFFC3C3C3F2CDCDCDFFCDCDCDFF6F5D26FF755D17FF8F721CFFA68C3FFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFB09A55FFC0AE76FFC8B8
      88FFC9BB91FFCDCDCDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCDCDFF6F5D26FF755D
      17FF8F721CFFA68C3FFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFB09A55FFC0AE76FFC8B888FFC9BB91FFCDCDCDFFCDCDCDFFC3C3C3F2CDCD
      CDFFCDCDCDFF6F5D26FF755D17FF8F721CFFA68C3FFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFB09A55FFC0AE76FFC8B888FFC9BB91FFCDCD
      CDFFCDCDCDFFC3C3C3F2CDCDCDFFCDCDCDFF6F5D26FF755D17FF8F721CFFA68C
      3FFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFB09A55FFC0AE
      76FFC8B888FFC9BB91FFCDCDCDFFCDCDCDFF999999BECDCDCDFFCDCDCDFFB8B0
      9AFF8C752CFF9C8029FFA99146FFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAD954EFFB7A263FFC6B689FFCBC7B8FFCDCDCDFFCDCDCDFF9999
      99BECDCDCDFFCDCDCDFFB8B09AFF8C752CFF9C8029FFA99146FFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAD954EFFB7A263FFC6B689FFCBC7
      B8FFCDCDCDFFCDCDCDFF999999BECDCDCDFFCDCDCDFFB8B09AFF8C752CFF9C80
      29FFA99146FFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAD95
      4EFFB7A263FFC6B689FFCBC7B8FFCDCDCDFFCDCDCDFF999999BECDCDCDFFCDCD
      CDFFB8B09AFF8C752CFF9C8029FFA99146FFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB934AFFAB93
      4AFFAB934AFFAB934AFFAD954EFFB7A263FFC6B689FFCBC7B8FFCDCDCDFFCDCD
      CDFF3D3D3D4CCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFF3D3D3D4CCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF3D3D3D4CCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF3D3D3D4CCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF0000000077756C9FCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF7A7874980000
      000077756C9FCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFF7A7874980000000077756C9FCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF7A7874980000000077756C9FCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF7A78
      749800000000000000003E3E3E4D999999BEC3C3C3F3CDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC3C3
      C3F3999999BE3D3D3D4C0000000000000000000000003E3E3E4D999999BEC3C3
      C3F3CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFC3C3C3F3999999BE3D3D3D4C00000000000000000000
      00003E3E3E4D999999BEC3C3C3F3CDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFC3C3C3F3999999BE3D3D
      3D4C0000000000000000000000003E3E3E4D999999BEC3C3C3F3CDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
      CDFFC3C3C3F3999999BE3D3D3D4C00000000424D3E000000000000003E000000
      280000008C000000780000000100010000000000600900000000000000000000
      000000000000000000000000FFFFFF00E0000003FC0000007C00000000000000
      00000000C0000001F80000003C0000000000000000000000C0000000F8000000
      1C0000000000000000000000C0000000F80000001C0000000000000000000000
      C0000000F80000001C0000000000000000000000C0000000F80000001C000000
      0000000000000000C0000000F80000001C0000000000000000000000C0000000
      F80000001C0000000000000000000000C0000000F80000001C00000000000000
      00000000C0000000F80000001C0000000000000000000000C0000000F8000000
      1C0000000000000000000000C0000000F80000001C0000000000000000000000
      C0000000F80000001C0000000000000000000000C0000000F80000001C000000
      0000000000000000C0000000F80000001C0000000000000000000000C0000000
      F80000001C0000000000000000000000C0000000F80000001C00000000000000
      00000000C0000000F80000001C0000000000000000000000C0000000F8000000
      1C0000000000000000000000C0000000F80000001C0000000000000000000000
      C0000000F80000001C0000000000000000000000C0000000F80000001C000000
      0000000000000000C0000000F80000001C0000000000000000000000C0000000
      F80000001C0000000000000000000000C0000000F80000001C00000000000000
      00000000C0000000F80000001C0000000000000000000000C0000000F8000000
      1C0000000000000000000000C0000000F80000001C0000000000000000000000
      C0000000F80000001C0000000000000000000000E0000001FC0000003C000000
      0000000000000000000000001FFFFFFFFF8000000FC000000070000000000000
      1FFFFFFFFF0000000780000000300000000000001FFFFFFFFF00000003800000
      00100000000000001FFFFFFFFF0000000380000000100000000000001FFFFFFF
      FF0000000380000000100000000000001FFFFFFFFF0000000380000000100000
      000000001FFFFFFFFF0000000380000000100000000000001FFFFFFFFF000000
      0380000000100000000000001FFFFFFFFF000000038000000010000000000000
      1FFFFFFFFF0000000380000000100000000000001FFFFFFFFF00000003800000
      00100000000000001FFFFFFFFF0000000380000000100000000000001FFFFFFF
      FF0000000380000000100000000000001FFFFFFFFF0000000380000000100000
      000000001FFFFFFFFF0000000380000000100000000000001FFFFFFFFF000000
      0380000000100000000000001FFFFFFFFF000000038000000010000000000000
      1FFFFFFFFF0000000380000000100000000000001FFFFFFFFF00000003800000
      00100000000000001FFFFFFFFF0000000380000000100000000000001FFFFFFF
      FF0000000380000000100000000000001FFFFFFFFF0000000380000000100000
      000000001FFFFFFFFF0000000380000000100000000000001FFFFFFFFF000000
      0380000000100000000000001FFFFFFFFF000000038000000010000000000000
      1FFFFFFFFF0000000380000000100000000000001FFFFFFFFF00000003800000
      00100000000000001FFFFFFFFF0000000380000000100000000000001FFFFFFF
      FF00000003C0000000300000000000001FFFFFFFFF80000007FFFFFFFFF00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object pmenuAction: TPopupMenu
    Left = 279
    Top = 703
    object mniContinueonlastheadingandgroundspeed1: TMenuItem
      Caption = 'Continue on last heading and ground speed '
      OnClick = MenuItemOnClick
    end
    object mniContinueonterminalheading1: TMenuItem
      Tag = 1
      Caption = 'Continue on terminal heading'
      OnClick = MenuItemOnClick
    end
    object mniRepeatthepatternusingthecurrentpositionastheanchorpoint1: TMenuItem
      Tag = 2
      Caption = 
        'Repeat the pattern, using the current position as the anchor poi' +
        'nt'
      OnClick = MenuItemOnClick
    end
    object mniRepeatthepatternreusingtheexistingwaypointpositions1: TMenuItem
      Tag = 3
      Caption = 'Repeat the pattern, reusing the existing waypoint positions'
      OnClick = MenuItemOnClick
    end
    object mniReturntolaunchingbase1: TMenuItem
      Tag = 4
      Caption = 'Return to launching base'
      Enabled = False
      OnClick = MenuItemOnClick
    end
    object mniRemoveplatformfromexercise1: TMenuItem
      Tag = 5
      Caption = 'Remove platform from exercise'
      Enabled = False
      OnClick = MenuItemOnClick
    end
    object mniStoponlastwaypoint1: TMenuItem
      Tag = 6
      Caption = 'Stop on last waypoint'
      OnClick = MenuItemOnClick
    end
  end
end
