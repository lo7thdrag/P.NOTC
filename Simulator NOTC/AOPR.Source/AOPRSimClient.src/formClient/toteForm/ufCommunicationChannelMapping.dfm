object fCommunicationChannelMapping: TfCommunicationChannelMapping
  Left = 0
  Top = 0
  Caption = 'Communication Channel Mapping'
  ClientHeight = 686
  ClientWidth = 827
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbCommunicationsChannelMapping: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 825
    ExplicitHeight = 720
    object Panel10: TPanel
      Left = 1
      Top = 1
      Width = 825
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Communications Channel Mapping'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitLeft = -15
      ExplicitTop = 17
      ExplicitWidth = 798
    end
    object Panel35: TPanel
      Left = 1
      Top = 39
      Width = 472
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitHeight = 680
      object Panel57: TPanel
        Left = 4
        Top = 60
        Width = 464
        Height = 582
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 10
        Caption = 'Panel57'
        TabOrder = 0
        ExplicitHeight = 616
        object StringGrid9: TStringGrid
          AlignWithMargins = True
          Left = 13
          Top = 13
          Width = 438
          Height = 556
          Align = alClient
          ColCount = 3
          FixedCols = 0
          TabOrder = 0
          ExplicitWidth = 420
          ColWidths = (
            108
            72
            129)
        end
      end
      object Panel58: TPanel
        Left = 4
        Top = 4
        Width = 464
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label129: TLabel
          Left = 6
          Top = 11
          Width = 33
          Height = 13
          Caption = 'Group:'
        end
        object SpeedButton13: TSpeedButton
          Left = 230
          Top = 8
          Width = 25
          Height = 22
        end
        object Edit2: TEdit
          Left = 45
          Top = 9
          Width = 179
          Height = 21
          TabOrder = 0
        end
      end
      object Panel59: TPanel
        Left = 4
        Top = 37
        Width = 464
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label130: TLabel
          Left = 6
          Top = 6
          Width = 92
          Height = 13
          Caption = 'Available channels:'
        end
      end
    end
    object Panel36: TPanel
      Left = 473
      Top = 39
      Width = 90
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      ExplicitLeft = 471
      ExplicitTop = 34
      ExplicitHeight = 680
      object Button25: TButton
        Left = 6
        Top = 124
        Width = 75
        Height = 25
        Caption = 'Add >'
        TabOrder = 0
      end
      object Button26: TButton
        Left = 6
        Top = 156
        Width = 75
        Height = 25
        Caption = '< Remove'
        TabOrder = 1
      end
    end
    object Panel37: TPanel
      Left = 563
      Top = 39
      Width = 263
      Height = 646
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 3
      ExplicitWidth = 236
      ExplicitHeight = 680
      object Panel60: TPanel
        Left = 4
        Top = 4
        Width = 255
        Height = 58
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 228
        object Label131: TLabel
          Left = 6
          Top = 38
          Width = 87
          Height = 13
          Caption = 'Mapped channels:'
        end
      end
      object Panel62: TPanel
        Left = 4
        Top = 62
        Width = 255
        Height = 545
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 1
        ExplicitWidth = 228
        object StringGrid10: TStringGrid
          Left = 10
          Top = 10
          Width = 235
          Height = 525
          Align = alClient
          ColCount = 4
          FixedCols = 0
          TabOrder = 0
          ExplicitWidth = 208
          ColWidths = (
            69
            94
            64
            64)
        end
      end
      object Panel61: TPanel
        Left = 4
        Top = 607
        Width = 255
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 2
        ExplicitWidth = 228
        object Label132: TLabel
          Left = 14
          Top = 6
          Width = 50
          Height = 13
          Caption = 'Copy from'
        end
        object SpeedButton14: TSpeedButton
          Left = 70
          Top = 1
          Width = 23
          Height = 22
        end
        object SpeedButton17: TSpeedButton
          Left = 420
          Top = 1
          Width = 23
          Height = 22
        end
        object SpeedButton29: TSpeedButton
          Left = 391
          Top = 1
          Width = 23
          Height = 22
        end
        object BitBtn1: TBitBtn
          Left = 557
          Top = 25
          Width = 25
          Height = 25
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
        end
        object BitBtn2: TBitBtn
          Left = 526
          Top = 25
          Width = 25
          Height = 25
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
        end
      end
    end
  end
end
