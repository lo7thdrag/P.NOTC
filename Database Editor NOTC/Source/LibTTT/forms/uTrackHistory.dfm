object fTrackHistory: TfTrackHistory
  Left = 0
  Top = 0
  Caption = 'Track History'
  ClientHeight = 539
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 16
    Width = 393
    Height = 465
    ActivePage = tsAll
    TabOrder = 0
    object tsAll: TTabSheet
      Caption = 'All'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object sgTrackAll: TStringGrid
        Left = 0
        Top = 16
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 0
        ColWidths = (
          155
          231)
      end
      object btShowALll: TButton
        Left = 8
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 1
      end
      object btHideAll: TButton
        Left = 89
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btClearSelected: TButton
        Left = 208
        Top = 408
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 3
      end
      object btClearAll: TButton
        Left = 297
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 4
      end
    end
    object tsAir: TTabSheet
      Caption = 'Air'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object btClearAllAir: TButton
        Left = 297
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 0
      end
      object btClearSelectedAir: TButton
        Left = 208
        Top = 408
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 1
      end
      object btHideAllAir: TButton
        Left = 89
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btShowAll: TButton
        Left = 8
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 3
      end
      object sgTrackAir: TStringGrid
        Left = 0
        Top = 16
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 4
        ColWidths = (
          155
          231)
      end
    end
    object tsSurface: TTabSheet
      Caption = 'Surface'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object btClearAllSurface: TButton
        Left = 297
        Top = 402
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 0
      end
      object btClearSelectedSurface: TButton
        Left = 208
        Top = 403
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 1
      end
      object btHideALlSurface: TButton
        Left = 89
        Top = 403
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btShowALlSurface: TButton
        Left = 8
        Top = 403
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 3
      end
      object sgTrackSurface: TStringGrid
        Left = 0
        Top = 11
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 4
        ColWidths = (
          155
          231)
      end
    end
    object tsSubsurface: TTabSheet
      Caption = 'Subsurface'
      ImageIndex = 3
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object btClearAllSubsurface: TButton
        Left = 297
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 0
      end
      object btClearSelectedSubsurface: TButton
        Left = 208
        Top = 408
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 1
      end
      object btHideAllSubsurface: TButton
        Left = 89
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btShowAllSubsurface: TButton
        Left = 8
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 3
      end
      object sgTrackSubsurface: TStringGrid
        Left = 0
        Top = 16
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 4
        ColWidths = (
          155
          231)
      end
    end
    object tsLand: TTabSheet
      Caption = 'Land'
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object btClearAllLand: TButton
        Left = 297
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 0
      end
      object btClearSelectedLand: TButton
        Left = 208
        Top = 408
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 1
      end
      object btHideAllLand: TButton
        Left = 89
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btShowAllLand: TButton
        Left = 8
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 3
      end
      object sgTrackLand: TStringGrid
        Left = 0
        Top = 16
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 4
        ColWidths = (
          155
          231)
      end
    end
    object tsGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 305
      ExplicitHeight = 393
      object btClearAllGeneral: TButton
        Left = 297
        Top = 407
        Width = 75
        Height = 25
        Caption = 'Clear All'
        TabOrder = 0
      end
      object btClearSelectedGeneral: TButton
        Left = 208
        Top = 408
        Width = 83
        Height = 25
        Caption = 'Clear Selected'
        TabOrder = 1
      end
      object btHideAllGeneral: TButton
        Left = 89
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Hide All'
        TabOrder = 2
      end
      object btShowAllGeneral: TButton
        Left = 8
        Top = 408
        Width = 75
        Height = 25
        Caption = 'Show All'
        TabOrder = 3
      end
      object sgTrackGeneral: TStringGrid
        Left = 0
        Top = 16
        Width = 369
        Height = 385
        ColCount = 2
        FixedCols = 0
        ScrollBars = ssNone
        TabOrder = 4
        ColWidths = (
          155
          231)
      end
    end
  end
  object btClose: TButton
    Left = 312
    Top = 496
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = btCloseClick
  end
end
