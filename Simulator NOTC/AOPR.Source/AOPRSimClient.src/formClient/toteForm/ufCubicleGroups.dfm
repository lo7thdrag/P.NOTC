object fCubicleGroups: TfCubicleGroups
  Left = 0
  Top = 0
  Caption = 'Cubicle Groups'
  ClientHeight = 686
  ClientWidth = 1025
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
  object gbCubicleGroups: TPanel
    Left = 0
    Top = 0
    Width = 1025
    Height = 686
    Align = alClient
    TabOrder = 0
    object Panel15: TPanel
      Left = 1
      Top = 1
      Width = 1023
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Cubicle Groups'
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
    object Panel39: TPanel
      Left = 426
      Top = 39
      Width = 597
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      object PageControl3: TPageControl
        Left = 4
        Top = 4
        Width = 589
        Height = 638
        ActivePage = TabSheet8
        Align = alClient
        TabOrder = 0
        object TabSheet8: TTabSheet
          Caption = 'Platform'
          object Panel63: TPanel
            Left = 0
            Top = 0
            Width = 581
            Height = 610
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 15
            TabOrder = 0
            object tvCubicleGroups: TTreeView
              Left = 15
              Top = 15
              Width = 551
              Height = 580
              Align = alClient
              Indent = 19
              TabOrder = 0
              Items.NodeData = {
                03010000003A0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
                0000000000010E630075006200690063006C0065002000670072006F00750070
                007300}
            end
          end
        end
        object TabSheet9: TTabSheet
          Caption = 'Responsibility'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitHeight = 0
          object Label157: TLabel
            Left = 9
            Top = 13
            Width = 52
            Height = 13
            Caption = 'Controllers'
          end
          object StringGrid23: TStringGrid
            Left = 9
            Top = 32
            Width = 558
            Height = 448
            ColCount = 10
            FixedCols = 0
            TabOrder = 0
            ColWidths = (
              144
              36
              30
              28
              24
              25
              27
              64
              64
              64)
          end
          object Button36: TButton
            Left = 414
            Top = 486
            Width = 75
            Height = 25
            Caption = 'Assume All'
            TabOrder = 1
          end
          object Button37: TButton
            Left = 495
            Top = 486
            Width = 75
            Height = 25
            Caption = 'Revoke All'
            TabOrder = 2
          end
        end
      end
    end
    object Panel38: TPanel
      Left = 1
      Top = 39
      Width = 425
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      object Panel64: TPanel
        Left = 4
        Top = 4
        Width = 417
        Height = 551
        Align = alTop
        BevelOuter = bvNone
        BorderWidth = 8
        TabOrder = 0
        object lvCubicle: TListView
          Left = 18
          Top = 6
          Width = 260
          Height = 156
          Columns = <
            item
              Caption = 'Name'
            end
            item
              Caption = 'Number'
            end
            item
              Caption = 'ID'
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
end
