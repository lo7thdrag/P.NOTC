inherited fmFireControl: TfmFireControl
  Height = 526
  Color = 15131105
  Font.Height = -13
  ParentBackground = False
  ParentColor = False
  ParentFont = False
  OnEnter = FrameEnter
  ExplicitHeight = 526
  object PanelFCChoices: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Color = 16775920
    ParentBackground = False
    TabOrder = 0
    object lstAssetsChoices: TListView
      Left = 0
      Top = 0
      Width = 316
      Height = 97
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clWhite
      Columns = <
        item
          AutoSize = True
          Caption = 'Name'
        end
        item
          Alignment = taCenter
          AutoSize = True
          Caption = 'Status'
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lstAssetsChoicesSelectItem
    end
  end
  object PaneFCSpace: TPanel
    Left = 0
    Top = 97
    Width = 320
    Height = 12
    Align = alTop
    BevelOuter = bvNone
    Color = 16775920
    ParentBackground = False
    TabOrder = 1
  end
  object PanelALL: TPanel
    Left = 0
    Top = 109
    Width = 320
    Height = 417
    Align = alClient
    BevelOuter = bvNone
    Color = 16775920
    ParentBackground = False
    TabOrder = 2
    object PanelFC: TPanel
      Left = 0
      Top = 0
      Width = 320
      Height = 417
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object ScrollBox3: TScrollBox
        Left = 0
        Top = 0
        Width = 320
        Height = 417
        Align = alClient
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object grbFireControl: TGroupBox
          Left = 0
          Top = 0
          Width = 320
          Height = 417
          Align = alClient
          TabOrder = 0
          object Bevel27: TBevel
            Left = 60
            Top = 17
            Width = 245
            Height = 3
          end
          object Bevel52: TBevel
            Left = 60
            Top = 137
            Width = 245
            Height = 3
          end
          object Bevel53: TBevel
            Left = 60
            Top = 317
            Width = 245
            Height = 3
          end
          object btnSearchFireControlAssetsTarget: TSpeedButton
            Left = 110
            Top = 156
            Width = 23
            Height = 23
            Glyph.Data = {
              56080000424D560800000000000036000000280000001A0000001A0000000100
              18000000000020080000C40E0000C40E00000000000000000000E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1E6E1E18F8C8C7370707370707370707370707370707370707370707370
              70737070737070737070737070737070737070737070737070ADA9A9E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1817F7F9E9B9BE6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1ACA8A8817F7FE6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              ACA9A9ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E19E9A9A90
              8D8DE6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1C9C5C55654542B2A2A0000000000001D1C1C656262ADA9A9E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1E6E1E1D7D3D36462621D1C1C908D8DBBB6B68F8C
              8C908C8CC9C5C57270700E0E0E656363D8D3D3E6E1E1E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1D7D3D32B
              2A2A646363D8D3D3E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1D8D3D3555454
              2B2A2AD8D3D3E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1646262565454E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1646262656363E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1ACA9A90E0E0ED8
              D3D3E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              D8D3D31C1C1CC9C5C5E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1646262737070E6E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C8C565454E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E11C1C1CCAC5C5E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1ACA8A8ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1BBB6B62B2A2AE6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1000000908C8C908C8C908C8C908C8C908C8CACA9A9E6E1
              E1E6E1E1ACA9A9908C8C908C8C908C8C908C8C908C8C000000E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E10000008F8C8C8F
              8C8C8F8C8C8F8C8C8F8C8CACA9A9E6E1E1E6E1E1ACA9A98F8C8C8F8C8C8F8C8C
              8F8C8C8F8C8C000000E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E12B2A2ABBB7B7E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1ADA9
              A9ACA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1C9C5C51D1C1CE6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1565454908D8DE6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1737070656262E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1C9C5C51D1C1CD8D3D3E6E1E1E6E1E1E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1D7D3D30E0E0EACA9A9E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E164626265
              6363E6E1E1E6E1E1E6E1E1E6E1E18F8C8C908C8CE6E1E1E6E1E1E6E1E1E6E1E1
              555454646363E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1D8D3D32B2A2A565454D8D3D3E6E1E1E6E1E18F8C
              8C908C8CE6E1E1E6E1E1D7D3D36462622B2A2AD8D3D3E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E1737070E6E1E1E6E1E1E6E1E1E6E1E1D8
              D3D36462620E0E0E737171CAC5C58F8C8C908C8CBBB7B78F8C8C1C1C1C646363
              D8D3D3E6E1E1E6E1E1E6E1E1E6E1E1737070E6E1E1E6E1E10000E6E1E1E6E1E1
              737070E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1ACA8A86562621C1C1C0000
              000000002B2A2A565454C9C5C5E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E173
              7070E6E1E1E6E1E10000E6E1E1E6E1E18F8C8C9F9B9BE6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1ACA9A9ACA9A9E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1817E7EADA9A9E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E19E9B9B817E7EE6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1ACA8A873707073707073
              7070737070737070737070737070737070737070737070737070737070737070
              737070737070737070908D8DE6E1E1E6E1E1E6E1E1E6E1E10000E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1
              E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E10000E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6
              E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1
              E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E1E6E1E10000}
            OnClick = btnSearchFireControlAssetsTargetClick
          end
          object Label265: TLabel
            Left = 60
            Top = 30
            Width = 31
            Height = 16
            Caption = 'Mode'
          end
          object Label266: TLabel
            Left = 145
            Top = 30
            Width = 116
            Height = 16
            Caption = 'Channels Available :'
          end
          object Label267: TLabel
            Left = 10
            Top = 10
            Width = 41
            Height = 16
            Caption = 'Control'
          end
          object Label268: TLabel
            Left = 10
            Top = 130
            Width = 38
            Height = 16
            Caption = 'Target'
          end
          object Label514: TLabel
            Left = 10
            Top = 310
            Width = 40
            Height = 16
            Caption = 'Display'
          end
          object Label515: TLabel
            Left = 72
            Top = 330
            Width = 36
            Height = 16
            Caption = 'Range'
          end
          object Label527: TLabel
            Left = 180
            Top = 330
            Width = 65
            Height = 16
            Caption = 'Blind Zones'
          end
          object lbControlChannel: TLabel
            Left = 270
            Top = 30
            Width = 10
            Height = 16
            Caption = '--'
          end
          object sbFireControlAssetsBlindZonesHide: TSpeedButton
            Tag = 10
            Left = 174
            Top = 375
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 2
            Down = True
            Caption = 'Hide'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsBlindZonesShow: TSpeedButton
            Tag = 9
            Left = 174
            Top = 350
            Width = 80
            Height = 25
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 2
            Caption = 'Show'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsDisplayHide: TSpeedButton
            Tag = 8
            Left = 50
            Top = 375
            Width = 80
            Height = 25
            AllowAllUp = True
            GroupIndex = 3
            Down = True
            Caption = 'Hide'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsDisplayShow: TSpeedButton
            Tag = 7
            Left = 50
            Top = 350
            Width = 80
            Height = 25
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 3
            Caption = 'Show'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsModeOff: TSpeedButton
            Tag = 3
            Left = 25
            Top = 100
            Width = 100
            Height = 25
            AllowAllUp = True
            GroupIndex = 1
            Down = True
            Caption = 'Off'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsModeSearch: TSpeedButton
            Tag = 1
            Left = 25
            Top = 50
            Width = 100
            Height = 25
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Search / Track'
            OnClick = btnFCROnClick
          end
          object sbFireControlAssetsModeTrackOnly: TSpeedButton
            Tag = 2
            Left = 25
            Top = 75
            Width = 100
            Height = 25
            HelpContext = 1
            AllowAllUp = True
            GroupIndex = 1
            Caption = 'Track Only'
            OnClick = btnFCROnClick
          end
          object btnFireControlAssetsTargetAssign: TButton
            Tag = 4
            Left = 170
            Top = 155
            Width = 80
            Height = 25
            Caption = 'Assign'
            TabOrder = 0
            OnClick = btnFCROnClick
          end
          object btnFireControlAssetsTargetBreak: TButton
            Tag = 5
            Left = 170
            Top = 180
            Width = 80
            Height = 25
            Caption = 'Break'
            TabOrder = 1
            OnClick = btnFCROnClick
          end
          object btnFireControlAssetsTargetBreakAll: TButton
            Tag = 6
            Left = 170
            Top = 205
            Width = 80
            Height = 25
            Caption = 'Break All'
            TabOrder = 2
            OnClick = btnFCROnClick
          end
          object edtFireControlAssetsTarget: TEdit
            Left = 25
            Top = 155
            Width = 75
            Height = 24
            ReadOnly = True
            TabOrder = 3
          end
          object lstFireControlAssetsAssignedTracks: TListView
            Left = 25
            Top = 185
            Width = 114
            Height = 118
            Columns = <
              item
                Caption = 'Assigned Tracks'
                MaxWidth = 200
                MinWidth = 100
                Width = 100
              end>
            TabOrder = 4
            ViewStyle = vsReport
            OnSelectItem = lstFireControlAssetsAssignedTracksSelectItem
          end
        end
      end
    end
  end
end
