object fSurfaceToAir: TfSurfaceToAir
  Left = 0
  Top = 0
  Caption = 'Surface To Air'
  ClientHeight = 592
  ClientWidth = 944
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbSurfaceToAir: TPanel
    Left = 0
    Top = 0
    Width = 944
    Height = 592
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 40
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 942
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Surface-to-Air Missile Engagements'
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
    object Panel27: TPanel
      Left = 1
      Top = 39
      Width = 942
      Height = 555
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      object Panel89: TPanel
        Left = 4
        Top = 524
        Width = 934
        Height = 27
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitWidth = 790
        object btAbort: TButton
          Left = 854
          Top = 0
          Width = 80
          Height = 27
          Align = alRight
          Caption = 'Abort'
          TabOrder = 0
          ExplicitLeft = 710
        end
      end
      object sgSurfacetoAir: TStringGrid
        Left = 4
        Top = 4
        Width = 934
        Height = 520
        Align = alClient
        ColCount = 8
        FixedCols = 0
        RowCount = 10
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
