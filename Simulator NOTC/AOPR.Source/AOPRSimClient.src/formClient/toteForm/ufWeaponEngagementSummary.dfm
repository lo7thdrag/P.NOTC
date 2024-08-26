object fWeaponEngagementSummary: TfWeaponEngagementSummary
  Left = 0
  Top = 0
  Caption = 'Weapon Engagement Summary'
  ClientHeight = 611
  ClientWidth = 940
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbWeaponEngagementsSUmmary: TPanel
    Left = 0
    Top = 0
    Width = 940
    Height = 611
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 20
    ExplicitTop = -109
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 938
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' Weapon Engagements Summary'
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
    object Panel1: TPanel
      Left = 1
      Top = 39
      Width = 938
      Height = 556
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      object lvWeaponEngagement: TListView
        Left = 4
        Top = 4
        Width = 930
        Height = 548
        Align = alClient
        Columns = <
          item
            Caption = 'Time'
            Width = 150
          end
          item
            Caption = 'Launching Platform'
            Width = 150
          end
          item
            Caption = 'Weapon Class'
            Width = 100
          end
          item
            Caption = 'Target Platform'
            Width = 80
          end
          item
            Caption = 'Engagement '
          end>
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        ExplicitWidth = 790
      end
    end
  end
end
