object fSettingCoordinate: TfSettingCoordinate
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ' Options'
  ClientHeight = 284
  ClientWidth = 398
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 312
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btnCloseClick
  end
  object pnl2: TPanel
    Left = 8
    Top = 8
    Width = 381
    Height = 232
    BevelOuter = bvNone
    TabOrder = 0
    object pnlContentSettingCoord: TPanel
      Left = 0
      Top = 25
      Width = 381
      Height = 207
      Align = alClient
      Color = 16775920
      ParentBackground = False
      TabOrder = 1
      object pnlContentOther: TPanel
        Left = 1
        Top = 1
        Width = 379
        Height = 205
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 3
        object chk1: TCheckBox
          Left = 16
          Top = 10
          Width = 177
          Height = 17
          Caption = 'Enable weapon filtering'
          TabOrder = 0
        end
      end
      object pnlContentTrackLabels: TPanel
        Left = 1
        Top = 1
        Width = 379
        Height = 205
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 2
        object rb4: TRadioButton
          Left = 16
          Top = 10
          Width = 113
          Height = 17
          Caption = 'Number'
          TabOrder = 0
        end
        object rbController: TRadioButton
          Left = 32
          Top = 33
          Width = 113
          Height = 17
          Caption = 'Controller'
          TabOrder = 1
        end
        object rbCubicle: TRadioButton
          Left = 32
          Top = 56
          Width = 113
          Height = 17
          Caption = 'Cubicle'
          TabOrder = 2
        end
        object rbIdentifier: TRadioButton
          Left = 16
          Top = 83
          Width = 113
          Height = 17
          Caption = 'Identifier'
          TabOrder = 3
        end
      end
      object pnlContentTrackSymbols: TPanel
        Left = 1
        Top = 1
        Width = 379
        Height = 205
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        object btn1: TSpeedButton
          Tag = 1
          Left = 233
          Top = 64
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
        object lb1: TLabel
          Left = 16
          Top = 38
          Width = 101
          Height = 16
          Caption = 'Force affiliation : '
        end
        object lb2: TLabel
          Left = 16
          Top = 65
          Width = 103
          Height = 16
          Caption = 'Color scheme    : '
        end
        object btnWeapon: TSpeedButton
          Tag = 1
          Left = 233
          Top = 36
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
        object chkShowFormation: TCheckBox
          Left = 16
          Top = 10
          Width = 169
          Height = 17
          Caption = 'Show formation leaders'
          TabOrder = 0
        end
        object edtForceAffiliation: TEdit
          Left = 106
          Top = 36
          Width = 121
          Height = 24
          ReadOnly = True
          TabOrder = 1
        end
        object edtColorScheme: TEdit
          Left = 106
          Top = 63
          Width = 121
          Height = 24
          ReadOnly = True
          TabOrder = 2
        end
      end
      object pnlContentCoordinateSystem: TPanel
        Left = 1
        Top = 1
        Width = 379
        Height = 205
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object pnl1: TPanel
          Left = -4
          Top = 1
          Width = 373
          Height = 198
          BevelOuter = bvNone
          ParentColor = True
          TabOrder = 0
          object rbLongLat: TRadioButton
            Tag = 1
            Left = 16
            Top = 10
            Width = 140
            Height = 30
            Caption = 'Latitude / Longitude'
            TabOrder = 0
            OnClick = rbLongLatClick
          end
          object rbCartesianGrid: TRadioButton
            Tag = 2
            Left = 16
            Top = 35
            Width = 113
            Height = 30
            Caption = 'Cartesian Grid'
            TabOrder = 1
            OnClick = rbLongLatClick
          end
          object rbGeoref: TRadioButton
            Tag = 3
            Left = 16
            Top = 62
            Width = 289
            Height = 30
            Caption = 'World Geographyc Reference System (GEOREF)'
            TabOrder = 2
            OnClick = rbLongLatClick
          end
          object rbUTM: TRadioButton
            Tag = 4
            Left = 16
            Top = 91
            Width = 265
            Height = 30
            Caption = 'Universal Transverse Mercator (UTM)'
            TabOrder = 3
            OnClick = rbLongLatClick
          end
          object rbMGRS: TRadioButton
            Tag = 5
            Left = 16
            Top = 123
            Width = 257
            Height = 30
            Caption = 'Military Grid Reference System (MGRS)'
            TabOrder = 4
            OnClick = rbLongLatClick
          end
          object rbKarvak: TRadioButton
            Tag = 6
            Left = 16
            Top = 152
            Width = 113
            Height = 30
            Caption = 'Karvak'
            TabOrder = 5
            OnClick = rbLongLatClick
          end
        end
      end
    end
    object pnlTabSettingCoord: TPanel
      Left = 0
      Top = 0
      Width = 381
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      Color = 5980694
      ParentBackground = False
      TabOrder = 0
      object pnlTabCoordinateSystem: TPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 125
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Coordinate System'
        Color = 10583852
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = TabSetCoordinateClick
      end
      object pnlTabTrackLabels: TPanel
        Left = 215
        Top = 0
        Width = 90
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Track Labels'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        OnClick = TabSetCoordinateClick
      end
      object pnlTabOther: TPanel
        Left = 305
        Top = 0
        Width = 55
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Other'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = TabSetCoordinateClick
      end
      object pnlTabTrackSymbols: TPanel
        Left = 125
        Top = 0
        Width = 90
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Track Symbols'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        Visible = False
        OnClick = TabSetCoordinateClick
      end
    end
  end
end
