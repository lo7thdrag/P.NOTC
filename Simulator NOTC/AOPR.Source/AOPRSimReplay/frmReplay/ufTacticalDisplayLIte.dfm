object frmTacticalDisplay: TfrmTacticalDisplay
  Left = 0
  Top = 0
  Caption = 'Tactical Display'
  ClientHeight = 402
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 402
    Align = alLeft
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object HookContactInfoTraineeDisplay: TPageControl
      Left = 0
      Top = 0
      Width = 337
      Height = 222
      ActivePage = tsHook
      Align = alTop
      TabOrder = 0
      object tsHook: TTabSheet
        Caption = 'Hook'
        object lbTrackHook: TLabel
          Left = 100
          Top = 5
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label1: TLabel
          Left = 3
          Top = 20
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object lbNameHook: TLabel
          Left = 100
          Top = 21
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbClassHook: TLabel
          Left = 100
          Top = 38
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label2: TLabel
          Left = 3
          Top = 38
          Width = 25
          Height = 13
          Caption = 'Class'
        end
        object lbBearingHook: TLabel
          Left = 100
          Top = 56
          Width = 15
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 56
          Width = 36
          Height = 13
          Caption = 'Bearing'
        end
        object Label4: TLabel
          Left = 190
          Top = 56
          Width = 43
          Height = 13
          Caption = 'degree T'
        end
        object Label5: TLabel
          Left = 3
          Top = 73
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object lbRangeHook: TLabel
          Left = 100
          Top = 73
          Width = 15
          Height = 13
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 190
          Top = 73
          Width = 14
          Height = 13
          Caption = 'nm'
        end
        object Label7: TLabel
          Left = 140
          Top = 109
          Width = 3
          Height = 13
        end
        object lbPositionHook1: TLabel
          Left = 100
          Top = 90
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbCourseHook: TLabel
          Left = 100
          Top = 108
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbPositionHook2: TLabel
          Left = 190
          Top = 90
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbGround: TLabel
          Left = 100
          Top = 125
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbFormation: TLabel
          Left = 100
          Top = 160
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label8: TLabel
          Left = 190
          Top = 108
          Width = 43
          Height = 13
          Caption = 'degree T'
        end
        object Label9: TLabel
          Left = 190
          Top = 125
          Width = 21
          Height = 13
          Caption = 'knot'
        end
        object lbDamage: TLabel
          Left = 100
          Top = 144
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lb8: TLabel
          Left = 3
          Top = 142
          Width = 39
          Height = 13
          Caption = 'Damage'
        end
        object StaticText1: TStaticText
          Left = 3
          Top = 3
          Width = 30
          Height = 17
          Caption = 'Track'
          TabOrder = 0
        end
        object StaticText6: TStaticText
          Left = 3
          Top = 90
          Width = 41
          Height = 17
          Caption = 'Position'
          TabOrder = 1
        end
        object StaticText7: TStaticText
          Left = 3
          Top = 108
          Width = 38
          Height = 17
          Caption = 'Course'
          TabOrder = 2
        end
        object StaticText8: TStaticText
          Left = 3
          Top = 125
          Width = 72
          Height = 17
          Caption = 'Ground Speed'
          TabOrder = 3
        end
        object StaticText9: TStaticText
          Left = 3
          Top = 158
          Width = 74
          Height = 17
          Caption = 'Formation Size'
          TabOrder = 4
        end
        object StaticText10: TStaticText
          Left = 89
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 5
        end
        object StaticText16: TStaticText
          Left = 89
          Top = 19
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object StaticText21: TStaticText
          Left = 89
          Top = 36
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 15
        end
        object StaticText22: TStaticText
          Left = 89
          Top = 56
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText23: TStaticText
          Left = 89
          Top = 73
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText24: TStaticText
          Left = 89
          Top = 90
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object StaticText25: TStaticText
          Left = 89
          Top = 125
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 10
        end
        object StaticText26: TStaticText
          Left = 89
          Top = 108
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 11
        end
        object pnlDepth: TPanel
          Left = 3
          Top = 172
          Width = 329
          Height = 22
          BevelOuter = bvNone
          TabOrder = 12
          Visible = False
          object lbDepth: TLabel
            Left = 96
            Top = 5
            Width = 12
            Height = 13
            Caption = '---'
          end
          object lb2: TLabel
            Left = 187
            Top = 5
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object lbtext3: TStaticText
            Left = 0
            Top = 5
            Width = 33
            Height = 17
            Caption = 'Depth'
            TabOrder = 0
          end
          object lb1: TStaticText
            Left = 86
            Top = 5
            Width = 8
            Height = 17
            Caption = ':'
            TabOrder = 1
          end
        end
        object pnlAltitude: TPanel
          Left = 3
          Top = 172
          Width = 329
          Height = 22
          BevelOuter = bvNone
          TabOrder = 13
          Visible = False
          object lb4: TLabel
            Left = 187
            Top = 5
            Width = 20
            Height = 13
            Caption = 'feet'
          end
          object lbAltitude: TLabel
            Left = 97
            Top = 3
            Width = 12
            Height = 13
            Caption = '---'
          end
          object lb6: TStaticText
            Left = 86
            Top = 5
            Width = 8
            Height = 17
            Caption = ':'
            TabOrder = 0
          end
          object lb5: TStaticText
            Left = 3
            Top = 4
            Width = 41
            Height = 17
            Caption = 'Altitude'
            TabOrder = 1
          end
        end
        object lb7: TStaticText
          Left = 89
          Top = 160
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 14
        end
        object lb3: TStaticText
          Left = 89
          Top = 142
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 16
        end
      end
    end
  end
  object pnlMap: TPanel
    Left = 341
    Top = 0
    Width = 711
    Height = 402
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    inline fmMapWindow1: TfmMapWindow
      Left = 0
      Top = 0
      Width = 707
      Height = 398
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 707
      ExplicitHeight = 398
      inherited pnlTop: TPanel
        Width = 707
        Height = 20
        Visible = False
        ExplicitWidth = 707
        ExplicitHeight = 20
      end
      inherited pnlMap: TPanel
        Top = 20
        Width = 707
        Height = 378
        ExplicitTop = 20
        ExplicitWidth = 707
        ExplicitHeight = 378
        inherited Map: TMap
          Width = 705
          Height = 376
          ExplicitLeft = 1
          ExplicitTop = 1
          ExplicitWidth = 1006
          ExplicitHeight = 1226
          ControlData = {
            8B1A0600DD480000DC260000010000000F0000FF0D47656F44696374696F6E61
            727905456D70747900E8030000000000000000000002000E001E000000000000
            0000000000000000000000000000000000000000000600010000000000500001
            010000640000000001F4010000050000800C000000000000000000000000FFFF
            FF000100000000000000000000000000000000000000000000000352E30B918F
            CE119DE300AA004BB8510100000090011009050005417269616C000352E30B91
            8FCE119DE300AA004BB8510100000090015C790C0005417269616C0000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
            8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
            918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
            6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
            01000118010000A802250001000000060008001C000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000002
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            8076C000000000008056C0000000000080764000000000008056400100000018
            010000A80225000100000074E822001C00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000200000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000005DF92200BE
            00C00034EB22001800000000000000E8E8220040000000000000000000000000
            000088B3400000000000408F400001000001}
        end
      end
    end
  end
end
