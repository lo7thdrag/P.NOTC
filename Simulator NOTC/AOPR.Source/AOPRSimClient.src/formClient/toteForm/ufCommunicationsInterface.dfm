object fCommunicationsInterface: TfCommunicationsInterface
  Left = 0
  Top = 0
  Caption = 'Communication Interface'
  ClientHeight = 686
  ClientWidth = 769
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbCommunicationsInterference: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 90
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 767
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Communcations Interference'
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
    object Panel32: TPanel
      Left = 1
      Top = 39
      Width = 767
      Height = 646
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      ExplicitHeight = 680
      object PageControl1: TPageControl
        Left = 4
        Top = 4
        Width = 759
        Height = 638
        ActivePage = TabSheet4
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 790
        ExplicitHeight = 672
        object TabSheet4: TTabSheet
          Caption = 'Injection'
          ExplicitWidth = 782
          ExplicitHeight = 644
          object Panel53: TPanel
            Left = 0
            Top = 0
            Width = 751
            Height = 610
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 0
            ExplicitWidth = 782
            ExplicitHeight = 644
            object StringGrid11: TStringGrid
              Left = 10
              Top = 10
              Width = 731
              Height = 590
              Align = alClient
              ColCount = 4
              FixedCols = 0
              TabOrder = 0
              ExplicitWidth = 762
              ExplicitHeight = 624
              ColWidths = (
                120
                202
                120
                235)
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = 'Volume'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label133: TLabel
            Left = 12
            Top = 17
            Width = 67
            Height = 13
            Caption = 'Sound effects'
          end
          object Bevel11: TBevel
            Left = 96
            Top = 23
            Width = 333
            Height = 5
          end
          object Label134: TLabel
            Left = 16
            Top = 44
            Width = 44
            Height = 13
            Caption = 'Maximum'
          end
          object Label135: TLabel
            Left = 20
            Top = 488
            Width = 40
            Height = 13
            Caption = 'Minimum'
          end
          object Label136: TLabel
            Left = 390
            Top = 487
            Width = 40
            Height = 13
            Caption = 'Minimum'
          end
          object Label137: TLabel
            Left = 392
            Top = 47
            Width = 44
            Height = 13
            Caption = 'Maximum'
          end
          object Label138: TLabel
            Left = 65
            Top = 514
            Width = 26
            Height = 13
            Caption = 'Noise'
          end
          object Label139: TLabel
            Left = 199
            Top = 514
            Width = 41
            Height = 13
            Caption = 'Jamming'
          end
          object Label140: TLabel
            Left = 345
            Top = 514
            Width = 51
            Height = 13
            Caption = 'MHS tones'
          end
          object TrackBar10: TTrackBar
            Left = 66
            Top = 46
            Width = 60
            Height = 462
            Orientation = trVertical
            Position = 10
            TabOrder = 0
            TickMarks = tmTopLeft
          end
          object TrackBar11: TTrackBar
            Left = 200
            Top = 46
            Width = 60
            Height = 462
            Orientation = trVertical
            Position = 10
            TabOrder = 1
            TickMarks = tmTopLeft
          end
          object TrackBar12: TTrackBar
            Left = 347
            Top = 46
            Width = 39
            Height = 462
            Orientation = trVertical
            Position = 10
            TabOrder = 2
            TickMarks = tmTopLeft
          end
        end
      end
    end
  end
end
