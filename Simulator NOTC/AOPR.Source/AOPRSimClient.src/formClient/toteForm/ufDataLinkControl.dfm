object fDataLinkControl: TfDataLinkControl
  Left = 0
  Top = 0
  Caption = 'Data Link Control'
  ClientHeight = 686
  ClientWidth = 929
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbDatalinkControl: TPanel
    Left = 0
    Top = 0
    Width = 929
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 100
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel12: TPanel
      Left = 1
      Top = 1
      Width = 927
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Datalink Control'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 798
    end
    object Panel29: TPanel
      Left = 1
      Top = 39
      Width = 463
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitHeight = 680
      object StringGrid12: TStringGrid
        Left = 4
        Top = 141
        Width = 455
        Height = 461
        Align = alClient
        ColCount = 2
        FixedCols = 0
        TabOrder = 0
        ExplicitHeight = 495
        ColWidths = (
          250
          72)
      end
      object Panel93: TPanel
        Left = 4
        Top = 4
        Width = 455
        Height = 106
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 20
        TabOrder = 1
        object Label141: TLabel
          Left = 11
          Top = 6
          Width = 38
          Height = 13
          Caption = 'Datalink'
        end
        object SpeedButton15: TSpeedButton
          Left = 251
          Top = 3
          Width = 25
          Height = 22
        end
        object SpeedButton16: TSpeedButton
          Left = 171
          Top = 43
          Width = 25
          Height = 22
        end
        object Label144: TLabel
          Left = 11
          Top = 46
          Width = 31
          Height = 13
          Caption = 'Force:'
        end
        object SpeedButton18: TSpeedButton
          Left = 171
          Top = 76
          Width = 25
          Height = 22
        end
        object Label148: TLabel
          Left = 11
          Top = 79
          Width = 28
          Height = 13
          Caption = 'Band:'
        end
        object Edit3: TEdit
          Left = 66
          Top = 4
          Width = 179
          Height = 21
          TabOrder = 0
        end
        object Edit5: TEdit
          Left = 66
          Top = 44
          Width = 99
          Height = 21
          TabOrder = 1
        end
        object Edit6: TEdit
          Left = 66
          Top = 77
          Width = 99
          Height = 21
          TabOrder = 2
        end
      end
      object Panel94: TPanel
        Left = 4
        Top = 110
        Width = 455
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 20
        TabOrder = 2
        object Label142: TLabel
          Left = 11
          Top = 10
          Width = 62
          Height = 13
          Caption = 'Eligible units:'
        end
      end
      object Panel95: TPanel
        Left = 4
        Top = 602
        Width = 455
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        ExplicitTop = 636
      end
    end
    object Panel30: TPanel
      Left = 464
      Top = 39
      Width = 90
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      ExplicitHeight = 680
      object Button27: TButton
        Left = 6
        Top = 299
        Width = 75
        Height = 25
        Caption = 'Add >'
        TabOrder = 0
      end
      object Button28: TButton
        Left = 6
        Top = 331
        Width = 75
        Height = 25
        Caption = '< Remove'
        TabOrder = 1
      end
    end
    object Panel31: TPanel
      Left = 554
      Top = 39
      Width = 374
      Height = 646
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 3
      ExplicitWidth = 245
      ExplicitHeight = 680
      object StringGrid13: TStringGrid
        Left = 4
        Top = 141
        Width = 366
        Height = 461
        Align = alClient
        ColCount = 3
        FixedCols = 0
        TabOrder = 0
        ExplicitWidth = 237
        ExplicitHeight = 495
        ColWidths = (
          69
          192
          64)
      end
      object Panel96: TPanel
        Left = 4
        Top = 602
        Width = 366
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 30
        TabOrder = 1
        ExplicitTop = 636
        ExplicitWidth = 237
        object BitBtn3: TBitBtn
          Left = 400
          Top = 6
          Width = 25
          Height = 25
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
        end
        object BitBtn4: TBitBtn
          Left = 369
          Top = 6
          Width = 25
          Height = 25
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object Button31: TButton
          Left = 0
          Top = 6
          Width = 85
          Height = 25
          Caption = 'Designate NCS'
          TabOrder = 2
        end
      end
      object Panel97: TPanel
        Left = 4
        Top = 4
        Width = 366
        Height = 137
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 237
        object Label143: TLabel
          Left = 11
          Top = 114
          Width = 89
          Height = 13
          Caption = 'Participating units:'
        end
      end
    end
  end
end
