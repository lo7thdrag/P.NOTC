object fCommunicationChannelDefinition: TfCommunicationChannelDefinition
  Left = 0
  Top = 0
  Caption = 'Communication Channel Definition'
  ClientHeight = 676
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbCommunicationsChannelDefinition: TPanel
    Left = 0
    Top = 0
    Width = 806
    Height = 676
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 6
    ExplicitTop = -46
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 804
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Communications Channel Definition'
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
    object Panel24: TPanel
      Left = 1
      Top = 39
      Width = 804
      Height = 636
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitLeft = 0
      ExplicitTop = 79
      ExplicitWidth = 798
      ExplicitHeight = 680
      object StringGrid8: TStringGrid
        Left = 4
        Top = 4
        Width = 796
        Height = 628
        Align = alClient
        ColCount = 7
        FixedCols = 0
        RowCount = 100
        TabOrder = 0
        ExplicitLeft = 0
        ExplicitTop = 44
        ExplicitWidth = 790
        ExplicitHeight = 672
        ColWidths = (
          116
          98
          103
          116
          112
          135
          360)
      end
    end
  end
end
