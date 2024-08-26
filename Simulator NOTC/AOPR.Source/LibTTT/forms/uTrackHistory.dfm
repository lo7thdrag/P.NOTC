object fTrackHistory: TfTrackHistory
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ' Track History'
  ClientHeight = 546
  ClientWidth = 411
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btClose: TButton
    Left = 327
    Top = 507
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = btCloseClick
  end
  object chk1: TCheckBox
    Left = 13
    Top = 498
    Width = 156
    Height = 17
    Caption = 'Show history for new tracks'
    TabOrder = 1
  end
  object pnlPageControlPictureFilter: TPanel
    Left = 9
    Top = 14
    Width = 393
    Height = 474
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    object pnlTabPictureFilter: TPanel
      Left = 0
      Top = 0
      Width = 393
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object pnlTabAll: TPanel
        Tag = 1
        Left = 0
        Top = 0
        Width = 30
        Height = 26
        BevelOuter = bvLowered
        Caption = 'All'
        Color = 10583852
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = TabTrackHistoryClick
      end
      object pnlTabAir: TPanel
        Left = 30
        Top = 0
        Width = 30
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Air'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = TabTrackHistoryClick
      end
      object pnlTabSurface: TPanel
        Left = 60
        Top = 0
        Width = 60
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Surface'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        OnClick = TabTrackHistoryClick
      end
      object pnlTabSubsurface: TPanel
        Left = 120
        Top = 0
        Width = 80
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Subsurface'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        OnClick = TabTrackHistoryClick
      end
      object pnlTabLand: TPanel
        Left = 200
        Top = 0
        Width = 50
        Height = 26
        BevelOuter = bvLowered
        Caption = 'Land'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
        OnClick = TabTrackHistoryClick
      end
      object pnlTabGeneral: TPanel
        Left = 250
        Top = 0
        Width = 60
        Height = 26
        BevelOuter = bvLowered
        Caption = 'General'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 5
        OnClick = TabTrackHistoryClick
      end
    end
    object pnlContentPicutreFilter: TPanel
      Left = 0
      Top = 25
      Width = 393
      Height = 449
      Align = alClient
      Color = 16775920
      ParentBackground = False
      TabOrder = 1
      object pnlContentAir: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        object btClearAllAir: TButton
          Left = 297
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 0
          Visible = False
          OnClick = btClearAllClick
        end
        object btClearSelectedAir: TButton
          Left = 208
          Top = 409
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 1
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btHideAllAir: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 2
          OnClick = btHideAllClick
        end
        object btShowAll: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 3
          OnClick = btShowAllClick
        end
        object lvAir: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          RowSelect = True
          TabOrder = 4
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
      end
      object pnlContentSurface: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 2
        object lvSurface: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
        object btShowALlSurface: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 1
          OnClick = btShowAllClick
        end
        object btHideALlSurface: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 2
          OnClick = btHideAllClick
        end
        object btClearSelectedSurface: TButton
          Left = 208
          Top = 409
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 3
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btClearAllSurface: TButton
          Left = 297
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 4
          Visible = False
          OnClick = btClearAllClick
        end
      end
      object pnlContentGeneral: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 5
        object btClearAllGeneral: TButton
          Left = 297
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 0
          Visible = False
          OnClick = btClearAllClick
        end
        object btClearSelectedGeneral: TButton
          Left = 208
          Top = 409
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 1
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btHideAllGeneral: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 2
          OnClick = btHideAllClick
        end
        object btShowAllGeneral: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 3
          OnClick = btShowAllClick
        end
        object lvGeneral: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          RowSelect = True
          TabOrder = 4
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
      end
      object pnlContentLand: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 4
        object lvLand: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
        object btShowAllLand: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 1
          OnClick = btShowAllClick
        end
        object btHideAllLand: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 2
          OnClick = btHideAllClick
        end
        object btClearSelectedLand: TButton
          Left = 208
          Top = 409
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 3
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btClearAllLand: TButton
          Left = 297
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 4
          Visible = False
          OnClick = btClearAllClick
        end
      end
      object pnlContentSubsurface: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 3
        object btClearAllSubsurface: TButton
          Left = 297
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 0
          Visible = False
          OnClick = btClearAllClick
        end
        object btClearSelectedSubsurface: TButton
          Left = 208
          Top = 409
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 1
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btHideAllSubsurface: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 2
          OnClick = btHideAllClick
        end
        object btShowAllSubsurface: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 3
          OnClick = btShowAllClick
        end
        object lvSubsurface: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          RowSelect = True
          TabOrder = 4
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
      end
      object pnlContentAll: TPanel
        Left = 1
        Top = 1
        Width = 391
        Height = 447
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentColor = True
        ParentFont = False
        TabOrder = 0
        object lvAll: TListView
          Left = 8
          Top = 16
          Width = 364
          Height = 377
          Checkboxes = True
          Columns = <
            item
              Caption = 'Track'
              Width = 150
            end
            item
              Caption = 'Name'
              Width = 210
            end>
          ColumnClick = False
          ReadOnly = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
          OnItemChecked = lvAllItemChecked
        end
        object btClearAll: TButton
          Left = 297
          Top = 408
          Width = 75
          Height = 25
          Caption = 'Clear All'
          TabOrder = 1
          Visible = False
          OnClick = btClearAllClick
        end
        object btClearSelected: TButton
          Left = 208
          Top = 408
          Width = 83
          Height = 25
          Caption = 'Clear Selected'
          TabOrder = 2
          Visible = False
          OnClick = btClearSelectedClick
        end
        object btHideAll: TButton
          Left = 89
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Hide All'
          TabOrder = 3
          OnClick = btHideAllClick
        end
        object btShowALll: TButton
          Left = 8
          Top = 409
          Width = 75
          Height = 25
          Caption = 'Show All'
          TabOrder = 4
          OnClick = btShowAllClick
        end
      end
    end
  end
end
