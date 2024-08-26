object fAudioRecordTrack: TfAudioRecordTrack
  Left = 0
  Top = 0
  Caption = 'Audio Record Track'
  ClientHeight = 674
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbAudioRecordTracks: TPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 674
    Align = alClient
    TabOrder = 0
    object Panel14: TPanel
      Left = 1
      Top = 1
      Width = 876
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Audio Record Tracks'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel41: TPanel
      Left = 460
      Top = 39
      Width = 90
      Height = 634
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      object Button32: TButton
        Left = 9
        Top = 192
        Width = 75
        Height = 25
        Caption = 'Add >'
        TabOrder = 0
      end
      object Button33: TButton
        Left = 9
        Top = 224
        Width = 75
        Height = 25
        Caption = '< Remove'
        TabOrder = 1
      end
      object Button34: TButton
        Left = 9
        Top = 662
        Width = 75
        Height = 25
        Caption = '< Remove'
        TabOrder = 2
      end
      object Button35: TButton
        Left = 9
        Top = 630
        Width = 75
        Height = 25
        Caption = 'Add >'
        TabOrder = 3
      end
    end
    object Panel42: TPanel
      Left = 550
      Top = 39
      Width = 327
      Height = 634
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 3
      object Panel69: TPanel
        Left = 4
        Top = 4
        Width = 319
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label149: TLabel
          Left = 6
          Top = 6
          Width = 95
          Height = 13
          Caption = 'Audio record track :'
        end
        object SpeedButton19: TSpeedButton
          Left = 432
          Top = 4
          Width = 25
          Height = 22
        end
        object Edit7: TEdit
          Left = 128
          Top = 5
          Width = 290
          Height = 21
          TabOrder = 0
        end
      end
      object Panel70: TPanel
        Left = 4
        Top = 36
        Width = 319
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Label151: TLabel
          Left = 6
          Top = 11
          Width = 89
          Height = 13
          Caption = 'External channels:'
        end
      end
      object Panel71: TPanel
        Left = 4
        Top = 60
        Width = 319
        Height = 361
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 2
        object StringGrid17: TStringGrid
          Left = 10
          Top = 10
          Width = 299
          Height = 341
          Align = alClient
          ColCount = 4
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            69
            94
            64
            64)
        end
      end
      object Panel72: TPanel
        Left = 4
        Top = 421
        Width = 319
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object Label152: TLabel
          Left = 6
          Top = 16
          Width = 87
          Height = 13
          Caption = 'Internal channels:'
        end
      end
      object Panel73: TPanel
        Left = 4
        Top = 450
        Width = 319
        Height = 180
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 4
        object StringGrid16: TStringGrid
          Left = 10
          Top = 10
          Width = 299
          Height = 160
          Align = alClient
          ColCount = 3
          FixedCols = 0
          TabOrder = 0
          ColWidths = (
            108
            72
            129)
        end
      end
    end
    object Panel40: TPanel
      Left = 1
      Top = 39
      Width = 459
      Height = 634
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      object Panel65: TPanel
        Left = 4
        Top = 4
        Width = 451
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label150: TLabel
          Left = 16
          Top = 6
          Width = 92
          Height = 13
          Caption = 'Available channels:'
        end
      end
      object Panel66: TPanel
        Left = 4
        Top = 27
        Width = 451
        Height = 603
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 6
        TabOrder = 1
        object PageControl2: TPageControl
          Left = 6
          Top = 6
          Width = 439
          Height = 591
          ActivePage = TabSheet7
          Align = alClient
          TabOrder = 0
          object TabSheet6: TTabSheet
            Caption = 'External'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 609
            object Panel67: TPanel
              Left = 0
              Top = 0
              Width = 431
              Height = 563
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              TabOrder = 0
              ExplicitHeight = 609
              object StringGrid18: TStringGrid
                Left = 10
                Top = 10
                Width = 411
                Height = 543
                Align = alClient
                ColCount = 3
                FixedCols = 0
                TabOrder = 0
                ExplicitHeight = 589
              end
            end
          end
          object TabSheet7: TTabSheet
            Caption = 'Internal'
            ImageIndex = 1
            object Panel68: TPanel
              Left = 0
              Top = 0
              Width = 431
              Height = 563
              Align = alClient
              BevelOuter = bvNone
              BorderWidth = 10
              TabOrder = 0
              object StringGrid19: TStringGrid
                Left = 10
                Top = 10
                Width = 411
                Height = 543
                Align = alClient
                ColCount = 3
                FixedCols = 0
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
end
