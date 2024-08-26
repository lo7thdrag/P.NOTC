object fSurfaceToSurface: TfSurfaceToSurface
  Left = 0
  Top = 0
  Caption = 'Surface To Surface'
  ClientHeight = 596
  ClientWidth = 945
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbSurfaceToSurface: TPanel
    Left = 0
    Top = 0
    Width = 945
    Height = 596
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 50
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 943
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Surface-to-Surface MIssile Engagements'
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
    object Panel26: TPanel
      Left = 1
      Top = 39
      Width = 943
      Height = 556
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      object Panel87: TPanel
        Left = 4
        Top = 519
        Width = 935
        Height = 33
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 790
        object btnAbortSurfaceToSurface: TButton
          AlignWithMargins = True
          Left = 845
          Top = 3
          Width = 80
          Height = 27
          Margins.Right = 10
          Align = alRight
          Caption = 'Abort'
          TabOrder = 0
          ExplicitLeft = 700
        end
      end
      object sgSurfacetoSurface: TStringGrid
        Left = 4
        Top = 4
        Width = 935
        Height = 515
        Align = alClient
        ColCount = 8
        FixedCols = 0
        TabOrder = 1
        ExplicitWidth = 790
        ColWidths = (
          102
          95
          93
          121
          110
          64
          64
          64)
      end
    end
  end
end
