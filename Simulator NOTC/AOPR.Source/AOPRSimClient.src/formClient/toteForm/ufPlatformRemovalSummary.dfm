object fPlatformRemovalSummary: TfPlatformRemovalSummary
  Left = 0
  Top = 0
  Caption = 'Platform Removal Summary'
  ClientHeight = 686
  ClientWidth = 936
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbPlatformRemovalSummary: TPanel
    Left = 0
    Top = 0
    Width = 936
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 30
    ExplicitTop = -34
    ExplicitWidth = 800
    ExplicitHeight = 720
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 934
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Platform Removal Summary'
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
    object Panel28: TPanel
      Left = 1
      Top = 39
      Width = 934
      Height = 1110
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitWidth = 798
      object Panel90: TPanel
        Left = 4
        Top = 4
        Width = 926
        Height = 649
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 10
        TabOrder = 0
        ExplicitWidth = 790
        object ListView1: TListView
          Left = 10
          Top = 10
          Width = 906
          Height = 629
          Align = alClient
          Columns = <
            item
              Caption = 'Class'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 150
            end
            item
              Caption = 'Track'
              Width = 100
            end
            item
              Caption = 'Force'
              Width = 80
            end>
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          ExplicitWidth = 770
        end
      end
    end
  end
end
