object frmMainDIsplay: TfrmMainDIsplay
  Left = 0
  Top = 0
  Caption = 'Main Display'
  ClientHeight = 730
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mnMain
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1052
    Height = 27
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 1048
      Height = 57
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 0
      object ToolButton5: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbtnFullScreen: TToolButton
        Left = 8
        Top = 0
        Hint = 'Full Screen'
        AutoSize = True
        Caption = 'Full Screen'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = tbtnFullScreenClick
      end
      object ToolButton4: TToolButton
        Left = 31
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 22
        Style = tbsDivider
      end
      object cbSetScale: TComboBox
        Left = 39
        Top = 0
        Width = 50
        Height = 21
        Hint = 'Select Scale'
        ItemIndex = 9
        TabOrder = 0
        Text = '64'
        OnChange = cbSetScaleChange
        Items.Strings = (
          '0.125'
          '0.25'
          '0.5'
          '1'
          '2'
          '4'
          '8'
          '16'
          '32'
          '64'
          '128'
          '256'
          '512'
          '1024'
          '2048'
          '2500')
      end
      object toolbtnDecreaseScale: TToolButton
        Left = 89
        Top = 0
        Hint = 'Decrease Scale'
        ImageIndex = 1
        OnClick = toolbtnIncreaseScaleClick
      end
      object toolbtnIncreaseScale: TToolButton
        Left = 112
        Top = 0
        Hint = 'Increase Scale'
        Caption = 'toolbtnIncreaseScale'
        ImageIndex = 2
        OnClick = toolbtnDecreaseScaleClick
      end
      object ToolButton1: TToolButton
        Left = 135
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 6
        Style = tbsDivider
      end
      object toolbtnZoom: TToolButton
        Left = 143
        Top = 0
        Hint = 'Zoom'
        Caption = 'toolbtnZoom'
        ImageIndex = 3
        OnClick = toolbtnZoomClick
      end
      object ToolBtnCentreOnHook: TToolButton
        Left = 166
        Top = 0
        Hint = 'Center On Hook'
        Caption = 'ToolBtnCentreOnHook'
        ImageIndex = 4
        OnClick = ToolBtnCentreOnHookClick
      end
      object ToolBtnCentreOnGameCentre: TToolButton
        Left = 189
        Top = 0
        Hint = 'Center On Game Center'
        Caption = 'ToolBtnCentreOnGameCentre'
        ImageIndex = 5
        OnClick = ToolBtnCentreOnGameCentreClick
      end
      object ToolBtnPan: TToolButton
        Left = 212
        Top = 0
        Hint = 'Pan'
        Caption = 'ToolBtnPan'
        ImageIndex = 6
        OnClick = ToolBtnPanClick
      end
      object toolBtnFilterRangeRings: TToolButton
        Left = 235
        Top = 0
        Hint = 'Filter Range Rings'
        AllowAllUp = True
        Caption = 'toolBtnFilterRangeRings'
        ImageIndex = 7
        Style = tbsCheck
        OnClick = toolBtnFilterRangeRingsClick
      end
      object ToolBtnRangeRingsOnHook: TToolButton
        Left = 258
        Top = 0
        Hint = 'Range Rings On Hook'
        AllowAllUp = True
        Caption = 'ToolBtnRangeRingsOnHook'
        ImageIndex = 8
        Style = tbsCheck
        OnClick = ToolBtnRangeRingsOnHookClick
      end
      object ToolButton2: TToolButton
        Left = 281
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ToolBtnHookPrevious: TToolButton
        Left = 289
        Top = 0
        Hint = 'Hook Previous Track'
        Caption = 'ToolBtnHookPrevious'
        ImageIndex = 9
        OnClick = ToolBtnHookPreviousClick
      end
      object ToolBtnHookNext: TToolButton
        Left = 312
        Top = 0
        Hint = 'Hooks Next Track'
        Caption = 'ToolBtnHookNext'
        ImageIndex = 10
        OnClick = ToolBtnHookNextClick
      end
      object ToolButton8: TToolButton
        Left = 335
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbAddTrack: TToolButton
        Left = 343
        Top = 0
        Caption = 'tbAddTrack'
        ImageIndex = 11
        Visible = False
        OnClick = tbAddTrackClick
      end
      object tbDeleteTrack: TToolButton
        Left = 366
        Top = 0
        Caption = 'tbDeleteTrack'
        ImageIndex = 12
        Visible = False
        OnClick = tbDeleteTrackClick
      end
      object ToolButton3: TToolButton
        Left = 389
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object tbHistory: TToolButton
        Left = 397
        Top = 0
        Caption = 'tbHistory'
        ImageIndex = 15
        OnClick = tbHistoryClick
      end
      object ToolButton10: TToolButton
        Left = 420
        Top = 0
        Width = 8
        Caption = 'ToolButton10'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object tbRewind: TToolButton
        Left = 428
        Top = 0
        Hint = 'Assume Control Of Hook'
        Caption = 'tbRewind'
        ImageIndex = 36
        OnClick = tbRewindClick
      end
      object tbtnStartGame: TToolButton
        Left = 451
        Top = 0
        Hint = 'Standard Speed'
        Caption = 'tbtnStartGame'
        ImageIndex = 20
        OnClick = tbtnStartGameClick
      end
      object tBtnGameFreeze: TToolButton
        Left = 474
        Top = 0
        Hint = 'Freeze'
        Caption = 'tBtnGameFreeze'
        ImageIndex = 19
        OnClick = tBtnGameFreezeClick
      end
      object tBtnDoubleSpeed: TToolButton
        Left = 497
        Top = 0
        Hint = 'Double Current Speed'
        Caption = 'tBtnDoubleSpeed'
        ImageIndex = 21
        OnClick = tBtnDoubleSpeedClick
      end
      object ToolButton11: TToolButton
        Left = 520
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object ToolBtnFilterCursor: TToolButton
        Left = 528
        Top = 0
        Caption = 'ToolBtnFilterCursor'
        ImageIndex = 27
        OnClick = ToolBtnFilterCursorClick
      end
      object tbAnchor: TToolButton
        Left = 551
        Top = 0
        Caption = 'tbAnchor'
        ImageIndex = 28
        OnClick = tbAnchorClick
      end
      object tbTools: TToolButton
        Left = 574
        Top = 0
        Caption = 'tbTools'
        ImageIndex = 29
      end
      object ToolButton15: TToolButton
        Left = 597
        Top = 0
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object tbAudio: TToolButton
        Left = 605
        Top = 0
        Caption = 'tbAudio'
        ImageIndex = 37
        Visible = False
      end
      object ToolButton17: TToolButton
        Left = 628
        Top = 0
        Width = 8
        Caption = 'ToolButton17'
        ImageIndex = 26
        Style = tbsSeparator
      end
      object tbHelp: TToolButton
        Left = 636
        Top = 0
        Caption = 'tbHelp'
        ImageIndex = 30
      end
      object btnPrint: TToolButton
        Left = 659
        Top = 0
        Caption = 'btnPrint'
        ImageIndex = 38
        Visible = False
        OnClick = btn1Click
      end
    end
  end
  object pnlContain: TPanel
    Left = 0
    Top = 27
    Width = 1052
    Height = 630
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlTote: TPanel
      Left = 0
      Top = 0
      Width = 1052
      Height = 630
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object CategoryPanelGroup1: TCategoryPanelGroup
        Left = 0
        Top = 0
        Width = 345
        Height = 630
        VertScrollBar.Tracking = True
        VertScrollBar.Visible = False
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clBtnShadow
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        TabOrder = 0
        object CategoryPanelStatusOp: TCategoryPanel
          Top = 0
          Height = 152
          Caption = 'Replay'
          Color = clGray
          TabOrder = 0
          object btnWeaponEngagement: TSpeedButton
            Left = 6
            Top = 8
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000014000000180000000100
              180000000000A005000000000000000000000000000000000000C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0
              000000C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0000000000000C0C0C0000000C0C0C0C0C0C0C0C0C000
              0000C0C0C0000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
              00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
              00C0C0C0C0C0C0000000000000C0C0C0000000000000C0C0C0C0C0C0000000C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0C0C0C0C0
              C0C0C0000000000000000000000000000000C0C0C0C0C0C0C0C0C0000000C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000000000
              00000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000C0C0C0
              000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C000
              0000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0000000000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000
              00000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0000000000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000
              000000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0000000C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C000
              0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
            Transparent = False
            OnClick = btnWeaponEngagementClick
          end
          object Label50: TLabel
            Left = 35
            Top = 11
            Width = 155
            Height = 13
            Caption = 'Weapon Engagements Summary'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            OnClick = Label50Click
          end
          object Label27: TLabel
            Left = 35
            Top = 45
            Width = 106
            Height = 13
            Caption = 'Audio Playback Tracks'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            OnClick = Label27Click
          end
          object btnAudioRecord: TSpeedButton
            Left = 6
            Top = 40
            Width = 23
            Height = 22
            Flat = True
            Glyph.Data = {
              56070000424D5607000000000000360000002800000019000000180000000100
              180000000000200700000000000000000000000000000000000099A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC000000000000000000000000
              00000000000000000000000000000000000000000000000000000099A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC000000
              C0C0C0C0C0C0C0C0C0FFFFFF99A8AC99A8AC99A8AC99A8AC99A8AC000000C0C0
              C0C0C0C0C0C0C000000099A8AC99A8AC99A8AC99A8ACFFFFFF0099A8AC99A8AC
              99A8AC99A8AC99A8AC000000FFFFFFC0C0C0C0C0C0C0C0C0FFFFFF99A8AC99A8
              AC99A8AC000000C0C0C0C0C0C0C0C0C0C0C0C000000099A8AC99A8AC99A8AC99
              A8ACFFFFFF0099A8AC99A8AC99A8AC99A8AC99A8AC000000FFFFFF99A8ACFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C000
              000099A8AC99A8AC99A8AC99A8ACFFFFFF0099A8AC99A8AC99A8AC99A8AC99A8
              AC000000FFFFFF99A8ACC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0FFFFFFC0C0C000000099A8AC99A8AC99A8AC99A8AC99A8AC0099A8
              AC99A8AC99A8AC99A8AC99A8AC000000FFFFFF99A8ACC0C0C0000000000000C0
              C0C0C0C0C0C0C0C0000000000000C0C0C0FFFFFFC0C0C000000099A8AC99A8AC
              99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC000000FFFFFF99
              A8ACC0C0C0000000000000C0C0C0C0C0C0C0C0C0000000000000C0C0C0FFFFFF
              C0C0C000000099A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99
              A8AC99A8AC000000FFFFFF99A8ACC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
              C0C0C0C0C0C0C0C0C0FFFFFFC0C0C000000099A8AC99A8AC99A8AC99A8AC99A8
              AC0099A8AC99A8AC99A8AC99A8AC99A8AC000000FFFFFF99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8ACC0C0C000000099A8
              AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC000000
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFF00000099A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC0000000000000000000000000000000000000000
              0000000000000000000000000000000000000099A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99
              A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC
              99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8
              AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC00}
            Transparent = False
            OnClick = btnAudioRecordClick
          end
        end
      end
      object gbAudioRecordTracks: TPanel
        Left = 345
        Top = 0
        Width = 707
        Height = 630
        Align = alClient
        TabOrder = 2
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 705
          Height = 38
          Align = alTop
          Alignment = taLeftJustify
          BorderWidth = 4
          Caption = 'Audio Record Tracks'
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
        object Panel5: TPanel
          Left = 460
          Top = 39
          Width = 90
          Height = 590
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 2
          object Button1: TButton
            Left = 9
            Top = 192
            Width = 75
            Height = 25
            Caption = 'Add >'
            TabOrder = 0
          end
          object Button2: TButton
            Left = 9
            Top = 224
            Width = 75
            Height = 25
            Caption = '< Remove'
            TabOrder = 1
          end
          object Button3: TButton
            Left = 9
            Top = 662
            Width = 75
            Height = 25
            Caption = '< Remove'
            TabOrder = 2
          end
          object Button4: TButton
            Left = 9
            Top = 630
            Width = 75
            Height = 25
            Caption = 'Add >'
            TabOrder = 3
          end
        end
        object Panel6: TPanel
          Left = 550
          Top = 39
          Width = 419
          Height = 590
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 3
          object Panel7: TPanel
            Left = 4
            Top = 4
            Width = 411
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label28: TLabel
              Left = 6
              Top = 6
              Width = 95
              Height = 13
              Caption = 'Audio record track :'
            end
            object Edit1: TEdit
              Left = 128
              Top = 5
              Width = 290
              Height = 21
              TabOrder = 0
            end
          end
          object Panel8: TPanel
            Left = 4
            Top = 36
            Width = 411
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label29: TLabel
              Left = 6
              Top = 11
              Width = 89
              Height = 13
              Caption = 'External channels:'
            end
          end
          object Panel9: TPanel
            Left = 4
            Top = 60
            Width = 411
            Height = 362
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 2
            object sgExChannel: TStringGrid
              Left = 10
              Top = 10
              Width = 391
              Height = 342
              Align = alClient
              ColCount = 4
              DrawingStyle = gdsGradient
              FixedCols = 0
              TabOrder = 0
              ColWidths = (
                69
                179
                104
                64)
            end
            object lvRecordOut: TListView
              Left = 10
              Top = 10
              Width = 391
              Height = 342
              Align = alClient
              Columns = <
                item
                  Caption = 'Channel'
                  MaxWidth = 205
                  Width = 70
                end
                item
                  Caption = 'Channel Name'
                  MaxWidth = 205
                  Width = 157
                end
                item
                  Caption = 'Channel Code'
                  Width = 80
                end>
              MultiSelect = True
              RowSelect = True
              TabOrder = 1
              ViewStyle = vsReport
            end
          end
          object Panel10: TPanel
            Left = 4
            Top = 422
            Width = 411
            Height = 28
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object Label30: TLabel
              Left = 6
              Top = 16
              Width = 87
              Height = 13
              Caption = 'Internal channels:'
            end
          end
          object Panel11: TPanel
            Left = 4
            Top = 450
            Width = 411
            Height = 136
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 10
            TabOrder = 4
            object sgInChannel: TStringGrid
              Left = 10
              Top = 10
              Width = 391
              Height = 116
              Align = alClient
              ColCount = 3
              DrawingStyle = gdsGradient
              FixedCols = 0
              TabOrder = 0
              ColWidths = (
                108
                72
                129)
            end
          end
        end
        object Panel12: TPanel
          Left = 1
          Top = 39
          Width = 459
          Height = 590
          Align = alLeft
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 1
          object Panel13: TPanel
            Left = 4
            Top = 4
            Width = 451
            Height = 23
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object Label31: TLabel
              Left = 16
              Top = 6
              Width = 92
              Height = 13
              Caption = 'Available channels:'
            end
          end
          object Panel14: TPanel
            Left = 4
            Top = 27
            Width = 451
            Height = 559
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 6
            TabOrder = 1
            object PageControl1: TPageControl
              Left = 6
              Top = 6
              Width = 439
              Height = 547
              ActivePage = TabSheet1
              Align = alClient
              TabOrder = 0
              object TabSheet1: TTabSheet
                Caption = 'External'
                object Panel15: TPanel
                  Left = 0
                  Top = 0
                  Width = 431
                  Height = 519
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 10
                  TabOrder = 0
                  object sgAvailableExChannel: TStringGrid
                    Left = 10
                    Top = 10
                    Width = 411
                    Height = 499
                    Align = alClient
                    ColCount = 3
                    DrawingStyle = gdsGradient
                    FixedCols = 0
                    TabOrder = 0
                    ColWidths = (
                      81
                      161
                      124)
                  end
                  object lvRecordIn: TListView
                    Left = 10
                    Top = 10
                    Width = 411
                    Height = 499
                    Align = alClient
                    Columns = <
                      item
                        Caption = 'Channel'
                        MaxWidth = 205
                        Width = 70
                      end
                      item
                        Caption = 'Channel Name'
                        MaxWidth = 205
                        Width = 157
                      end
                      item
                        Caption = 'Channel Code'
                        Width = 80
                      end>
                    MultiSelect = True
                    RowSelect = True
                    TabOrder = 1
                    ViewStyle = vsReport
                  end
                end
              end
              object TabSheet2: TTabSheet
                Caption = 'Internal'
                ImageIndex = 1
                object Panel16: TPanel
                  Left = 0
                  Top = 0
                  Width = 431
                  Height = 519
                  Align = alClient
                  BevelOuter = bvNone
                  BorderWidth = 10
                  TabOrder = 0
                  object sgAvailableInChannel: TStringGrid
                    Left = 10
                    Top = 10
                    Width = 411
                    Height = 499
                    Align = alClient
                    ColCount = 3
                    DrawingStyle = gdsGradient
                    FixedCols = 0
                    TabOrder = 0
                    ColWidths = (
                      166
                      156
                      64)
                  end
                end
              end
            end
          end
        end
      end
      object gbWeaponEngagementsSUmmary: TPanel
        Left = 345
        Top = 0
        Width = 707
        Height = 630
        Align = alClient
        TabOrder = 1
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 705
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
        end
        object Panel2: TPanel
          Left = 1
          Top = 39
          Width = 705
          Height = 590
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 1
          object lvWeaponEngagement: TListView
            Left = 4
            Top = 4
            Width = 697
            Height = 582
            Align = alClient
            Columns = <
              item
                Caption = 'Date/Time'
                Width = 150
              end
              item
                Caption = 'Launch Platform'
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
          end
        end
      end
    end
    object pnlTactical: TPanel
      Left = 0
      Top = 0
      Width = 1052
      Height = 630
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pnlLeft: TPanel
        Left = 0
        Top = 0
        Width = 332
        Height = 630
        Align = alLeft
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          328
          626)
        object lbl1: TLabel
          Left = 13
          Top = 589
          Width = 59
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = 'Jump To... :'
        end
        object lblMaxTime: TLabel
          Left = 196
          Top = 589
          Width = 34
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = '( Max )'
        end
        object HookContactInfoTraineeDisplay: TPageControl
          Left = 0
          Top = 151
          Width = 328
          Height = 222
          ActivePage = tsHook
          Align = alTop
          TabOrder = 0
          object tsHook: TTabSheet
            Caption = 'Hook'
            object lbTrackHook: TLabel
              Left = 100
              Top = 5
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label1: TLabel
              Left = 3
              Top = 20
              Width = 27
              Height = 13
              Caption = 'Name'
            end
            object lbNameHook: TLabel
              Left = 100
              Top = 21
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbClassHook: TLabel
              Left = 100
              Top = 38
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label2: TLabel
              Left = 3
              Top = 38
              Width = 25
              Height = 13
              Caption = 'Class'
            end
            object lbBearingHook: TLabel
              Left = 100
              Top = 56
              Width = 15
              Height = 13
              Caption = '---'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 3
              Top = 56
              Width = 36
              Height = 13
              Caption = 'Bearing'
            end
            object Label4: TLabel
              Left = 190
              Top = 56
              Width = 43
              Height = 13
              Caption = 'degree T'
            end
            object Label5: TLabel
              Left = 3
              Top = 73
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object lbRangeHook: TLabel
              Left = 100
              Top = 73
              Width = 15
              Height = 13
              Caption = '---'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 190
              Top = 73
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label7: TLabel
              Left = 140
              Top = 109
              Width = 3
              Height = 13
            end
            object lbPositionHook1: TLabel
              Left = 100
              Top = 90
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbCourseHook: TLabel
              Left = 100
              Top = 108
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbPositionHook2: TLabel
              Left = 190
              Top = 90
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbGround: TLabel
              Left = 100
              Top = 125
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbFormation: TLabel
              Left = 100
              Top = 160
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label8: TLabel
              Left = 190
              Top = 108
              Width = 43
              Height = 13
              Caption = 'degree T'
            end
            object Label9: TLabel
              Left = 190
              Top = 125
              Width = 21
              Height = 13
              Caption = 'knot'
            end
            object lbDamage: TLabel
              Left = 100
              Top = 144
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lb8: TLabel
              Left = 3
              Top = 142
              Width = 39
              Height = 13
              Caption = 'Damage'
            end
            object pnlAltitude: TPanel
              Left = 3
              Top = 172
              Width = 329
              Height = 22
              BevelOuter = bvNone
              TabOrder = 13
              Visible = False
              object lb4: TLabel
                Left = 187
                Top = 5
                Width = 20
                Height = 13
                Caption = 'feet'
              end
              object lbAltitude: TLabel
                Left = 97
                Top = 3
                Width = 12
                Height = 13
                Caption = '---'
              end
              object lb6: TStaticText
                Left = 86
                Top = 5
                Width = 8
                Height = 17
                Caption = ':'
                TabOrder = 0
              end
              object lb5: TStaticText
                Left = 3
                Top = 4
                Width = 41
                Height = 17
                Caption = 'Altitude'
                TabOrder = 1
              end
            end
            object StaticText1: TStaticText
              Left = 3
              Top = 3
              Width = 30
              Height = 17
              Caption = 'Track'
              TabOrder = 0
            end
            object StaticText2: TStaticText
              Left = 3
              Top = 90
              Width = 41
              Height = 17
              Caption = 'Position'
              TabOrder = 1
            end
            object StaticText3: TStaticText
              Left = 3
              Top = 108
              Width = 38
              Height = 17
              Caption = 'Course'
              TabOrder = 2
            end
            object StaticText4: TStaticText
              Left = 3
              Top = 125
              Width = 72
              Height = 17
              Caption = 'Ground Speed'
              TabOrder = 3
            end
            object StaticText5: TStaticText
              Left = 3
              Top = 158
              Width = 74
              Height = 17
              Caption = 'Formation Size'
              TabOrder = 4
            end
            object StaticText6: TStaticText
              Left = 89
              Top = 3
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 5
            end
            object StaticText7: TStaticText
              Left = 89
              Top = 19
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 6
            end
            object StaticText8: TStaticText
              Left = 89
              Top = 36
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 15
            end
            object StaticText9: TStaticText
              Left = 89
              Top = 56
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 7
            end
            object StaticText10: TStaticText
              Left = 89
              Top = 73
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 8
            end
            object StaticText11: TStaticText
              Left = 89
              Top = 90
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 9
            end
            object StaticText12: TStaticText
              Left = 89
              Top = 125
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 10
            end
            object StaticText13: TStaticText
              Left = 89
              Top = 108
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 11
            end
            object pnlDepth: TPanel
              Left = 3
              Top = 172
              Width = 329
              Height = 22
              BevelOuter = bvNone
              TabOrder = 12
              Visible = False
              object lbDepth: TLabel
                Left = 96
                Top = 5
                Width = 12
                Height = 13
                Caption = '---'
              end
              object lb2: TLabel
                Left = 187
                Top = 5
                Width = 20
                Height = 13
                Caption = 'feet'
              end
              object lbtext3: TStaticText
                Left = 0
                Top = 5
                Width = 33
                Height = 17
                Caption = 'Depth'
                TabOrder = 0
              end
              object lb1: TStaticText
                Left = 86
                Top = 5
                Width = 8
                Height = 17
                Caption = ':'
                TabOrder = 1
              end
            end
            object lb7: TStaticText
              Left = 89
              Top = 160
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 14
            end
            object lb3: TStaticText
              Left = 89
              Top = 142
              Width = 8
              Height = 17
              Caption = ':'
              TabOrder = 16
            end
          end
        end
        object lvTrackTable: TListView
          Left = 0
          Top = 0
          Width = 328
          Height = 151
          Align = alTop
          Columns = <
            item
              Caption = 'Domain'
            end
            item
              Caption = 'TrackNumber'
            end
            item
              Caption = 'Identity'
            end
            item
              Caption = 'Course'
            end
            item
              Caption = 'Speed'
            end
            item
              Caption = 'Altitude'
            end
            item
              Caption = 'Depth'
            end>
          MultiSelect = True
          ReadOnly = True
          RowSelect = True
          TabOrder = 1
          ViewStyle = vsReport
          OnSelectItem = lvTrackTableSelectItem
        end
        object medtedt1: TMaskEdit
          Left = 69
          Top = 585
          Width = 64
          Height = 21
          Alignment = taCenter
          Anchors = [akLeft, akBottom]
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 2
          Text = '00:05:00'
        end
        object btnJump: TButton
          Left = 140
          Top = 583
          Width = 50
          Height = 25
          Anchors = [akLeft, akBottom]
          Caption = 'Go..'
          TabOrder = 3
          OnClick = btnJumpClick
        end
      end
      object pnlMap: TPanel
        Left = 332
        Top = 0
        Width = 720
        Height = 630
        Align = alClient
        BevelKind = bkFlat
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 657
    Width = 1052
    Height = 73
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object Panel1: TPanel
      Left = 0
      Top = -2
      Width = 1326
      Height = 69
      TabOrder = 0
      object Label11: TLabel
        Left = 358
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Course'
      end
      object Label12: TLabel
        Left = 358
        Top = 26
        Width = 30
        Height = 13
        Caption = 'Speed'
      end
      object lbCourseHooked: TLabel
        Left = 407
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbSpeedHooked: TLabel
        Left = 407
        Top = 26
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label13: TLabel
        Left = 480
        Top = 26
        Width = 30
        Height = 13
        Caption = 'Speed'
      end
      object Label14: TLabel
        Left = 480
        Top = 8
        Width = 24
        Height = 13
        Caption = 'Wind'
      end
      object lbRangeRings: TLabel
        Left = 719
        Top = 26
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label15: TLabel
        Left = 630
        Top = 26
        Width = 60
        Height = 13
        Caption = 'Range Rings'
      end
      object lblRangeScale: TLabel
        Left = 719
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label16: TLabel
        Left = 630
        Top = 8
        Width = 59
        Height = 13
        Caption = 'Range Scale'
      end
      object lbRangeAnchor: TLabel
        Left = 830
        Top = 26
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label17: TLabel
        Left = 781
        Top = 26
        Width = 31
        Height = 13
        Caption = 'Range'
      end
      object lbBearingAnchor: TLabel
        Left = 830
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label18: TLabel
        Left = 781
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Bearing'
      end
      object Label19: TLabel
        Left = 974
        Top = 27
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label20: TLabel
        Left = 903
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Origin OCM'
      end
      object Label22: TLabel
        Left = 974
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label23: TLabel
        Left = 1032
        Top = 8
        Width = 22
        Height = 13
        Caption = 'OBM'
      end
      object lbLongitude: TLabel
        Left = 1064
        Top = 26
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbLatitude: TLabel
        Left = 1064
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbY: TLabel
        Left = 1276
        Top = 22
        Width = 12
        Height = 13
        Alignment = taRightJustify
        Caption = '---'
      end
      object lbX: TLabel
        Left = 1276
        Top = 8
        Width = 12
        Height = 13
        Alignment = taRightJustify
        Caption = '---'
      end
      object Label24: TLabel
        Left = 1167
        Top = 8
        Width = 22
        Height = 13
        Caption = 'OBM'
      end
      object Label25: TLabel
        Left = 1167
        Top = 26
        Width = 21
        Height = 13
        Caption = 'CCG'
      end
      object Bevel1: TBevel
        Left = 772
        Top = 11
        Width = 3
        Height = 27
      end
      object Bevel2: TBevel
        Left = 614
        Top = 13
        Width = 3
        Height = 25
      end
      object Bevel3: TBevel
        Left = 462
        Top = 13
        Width = 3
        Height = 25
      end
      object Bevel4: TBevel
        Left = 894
        Top = 10
        Width = 3
        Height = 25
      end
      object Label26: TLabel
        Left = 903
        Top = 24
        Width = 33
        Height = 13
        Caption = 'SDarwi'
      end
      object Bevel5: TBevel
        Left = 1026
        Top = 11
        Width = 3
        Height = 25
      end
      object Bevel6: TBevel
        Left = 1155
        Top = 13
        Width = 3
        Height = 25
      end
      object lbColor: TLabel
        Left = 1199
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label10: TLabel
        Left = 520
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label21: TLabel
        Left = 520
        Top = 27
        Width = 12
        Height = 13
        Caption = '---'
      end
      object StatusBar1: TStatusBar
        Left = 1
        Top = 41
        Width = 1324
        Height = 27
        BiDiMode = bdLeftToRight
        Panels = <
          item
            Alignment = taCenter
            Text = 'Fly-by Help'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'Entities'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'Filter'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'Declutter'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'EMCON'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'Jamming'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'Gunfire'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'FCR LOCK'
            Width = 70
          end
          item
            Alignment = taCenter
            Text = 'COMMS'
            Width = 70
          end
          item
            Alignment = taCenter
            Style = psOwnerDraw
            Text = 'FROZEN'
            Width = 70
          end
          item
            Text = ' DateTime'
            Width = 70
          end>
        ParentBiDiMode = False
        OnDrawPanel = StatusBar1DrawPanel
      end
      object pnlStatusRed: TPanel
        Left = 1
        Top = 4
        Width = 335
        Height = 17
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clRed
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = pnlStatusRedClick
      end
      object pnlStatusYellow: TPanel
        Left = 1
        Top = 20
        Width = 335
        Height = 17
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Color = clYellow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
    end
  end
  object mnMain: TMainMenu
    Images = ImageList1
    Left = 264
    Top = 64
    object View1: TMenuItem
      Caption = 'View'
      object Display1: TMenuItem
        Caption = 'Display'
        object Tactical1: TMenuItem
          Caption = 'Tactical'
          OnClick = Tactical1Click
        end
        object Tote1: TMenuItem
          Caption = 'Tote'
          OnClick = Tote1Click
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FullScreen1: TMenuItem
        Caption = '&Full Screen'
        ImageIndex = 0
        OnClick = FullScreen1Click
      end
      object Scale1: TMenuItem
        Caption = '&Scale'
      end
      object Centre1: TMenuItem
        Caption = 'Centr&e'
        OnClick = Centre1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Rangeings1: TMenuItem
        Caption = '&Range Rings'
        OnClick = Rangeings1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Filters1: TMenuItem
        Caption = 'F&ilters...'
      end
      object Overrides1: TMenuItem
        Caption = 'O&verrides...'
      end
      object History1: TMenuItem
        Caption = '&History...'
      end
      object N4: TMenuItem
        Caption = '-'
      end
    end
    object Hook1: TMenuItem
      Caption = 'Hook'
    end
    object Controller1: TMenuItem
      Caption = 'Controller'
    end
    object ools1: TMenuItem
      Caption = 'Tools'
      object Cursor1: TMenuItem
        Caption = '&Cursor'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object argetPriorityAssessment1: TMenuItem
        Caption = 'Target &Priority Assessment...'
      end
      object NGSSpotterDialog1: TMenuItem
        Caption = '&NGS Spotter Dialog...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Options1: TMenuItem
        Caption = 'Options...'
        ImageIndex = 29
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
    end
  end
  object ImageList1: TImageList
    BkColor = 14215660
    Left = 296
    Top = 64
    Bitmap = {
      494C01012700E001040010001000ECE9D800FF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0000000010020000000000000A0
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC0000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000C0C0C000FFFFFF00C0C0
      C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0
      C000FFFFFF000000FF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC0000000000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFFFF00C0C0C000FFFF
      FF00C0C0C000FFFFFF00C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00C6C3C60000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF0000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF000000000000000000FFFFFF000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF0000000000C0C0C000FFFFFF0000000000FFFFFF0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B6B500CECBCE00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630073717300FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500C6C7C600FFFFFF00EFEFEF00B5B2B500B5B2
      B500B5B2B500A5A6A500636163007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D8E9EC00D8E9EC00181C180094929400D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C6C3C60073717300737173006361630073717300FFFF
      FF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B6B500ADAEAD007371730094929400EFEFEF00B5B2B500B5B2
      B500B5B6B500B5B6B500737173007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600636163007371
      73007371730073717300FFFFFF00D8E9EC00D8E9EC00D8E9EC00212021009C9A
      9C00B5B6B500D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC007371730063616300C6C3C600D8E9EC00636163007371
      7300FFFFFF00FFFFFF00C6C3C600D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B5009C9E9C00737173007371730094929400EFEFEF00B5B2B500B5B2
      B500ADAAAD0073717300737173007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC006361630073717300FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9EC002124
      21008C8E8C00D8E9EC002928290084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C6007371730063616300D8E9EC00D8E9EC00D8E9EC00C6C3C6007371
      730073717300FFFFFF00FFFFFF00D8E9EC00B5B2B500B5B2B500B5B2B500B5B6
      B500ADAAAD0073717300737173007371730094929400EFEFEF00B5B6B500B5B2
      B5007371730073717300737173007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6006361
      6300D8E9EC0073717300FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00212421008C8A8C002928290084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC007371730063616300C6C3C600D8E9EC00D8E9EC00FFFFFF00FFFFFF00D8E9
      EC006361630073717300FFFFFF00FFFFFF00B5B2B500CECFCE00FFFFFF00D6D3
      D6006B696B00737573009C9E9C006365630094929400F7F3F700ADAEAD006361
      63007B797B00A5A6A500636163007B7D7B00D8E9EC00D8E9EC00D8E9EC006361
      630063616300C6C3C600FFFFFF00D8E9EC00D8E9EC00C6C3C60063616300C6C3
      C600D8E9EC0063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00BDBEBD00292C29000000000084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00BDBEBD004241420073757300D8E9EC00D8E9EC00D8E9EC00C6C3C6007371
      730063616300D8E9EC00D8E9EC00C6C3C6007371730063616300FFFFFF00D8E9
      EC00D8E9EC007371730073717300FFFFFF00A5A2A50073717300737173006B69
      6B007B797B00B5B6B500ADAEAD007371730094929400E7E3E7006B6D6B006B6D
      6B00B5B6B500B5B6B500737173007B7D7B00D8E9EC00D8E9EC00D8E9EC00C6C3
      C600C6C3C60063616300C6C3C600FFFFFF00FFFFFF0063616300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC002124
      210000000000000000000000000084868400D8E9EC00BDBEBD00B5B6B500D8E9
      EC00D8E9EC0039383900000000007B7D7B00D8E9EC00D8E9EC00636163007371
      7300D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630073717300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00636163007371730094929400636563006B696B007B7D
      7B00BDBEBD00B5B2B5009C9E9C006365630073717300737173007B7D7B00B5B2
      B500B5B2B500A5A6A500636163007B7D7B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00737173007371730073717300FFFFFF00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00BDBEBD00313031000000000000000000000000000000
      000000000000000000000000000000000000C6C3C6007371730063616300D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600FFFFFF00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0073717300B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B6B500ADAEAD00737173006B6D6B0073717300B5B2B500B5B2
      B500B5B6B500B5B6B500737173007B7D7B007371730063616300737173006361
      63006361630073717300737173007371730063616300FFFFFF00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC002124
      210000000000000000000000000084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00393839000000000073717300D8E9EC0063616300C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630073717300FFFFFF00C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500CECB
      CE00EFEBEF00B5B2B5009C9E9C00636563007B7D7B00B5B2B500B5B2B500B5B2
      B500B5B2B500A5A6A5006361630073717300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00636163006361630073717300C6C3C600FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00BDBEBD00292C29000000000084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC003938390073757300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6007371730073717300FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B6B500A5A6A5009C9E
      9C00EFEBEF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500ADAAAD006B6D6B006B696B00D8E9EC00D8E9EC00D8E9EC00C6C3
      C600C6C3C60063616300D8E9EC00D8E9EC00C6C3C60063616300D8E9EC00FFFF
      FF00D8E9EC00C6C3C600FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00212421008C8A8C002928290084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00FFFFFF006361630073717300FFFF
      FF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00B5B2B500CECFCE00CECFCE009C9E
      9C00FFFFFF00FFFFFF00EFEBEF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC006361
      630063616300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC0063616300C6C3
      C600FFFFFF0063616300FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9EC002124
      21008C8E8C00D8E9EC002928290084868400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00C6C3C6007371730073717300FFFFFF00C6C3C600737173006361
      6300FFFFFF00D8E9EC00D8E9EC00D8E9EC00A5A2A50073717300737173007371
      73006B696B008C8E8C00EFEBEF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6006361
      6300C6C3C60073717300FFFFFF00D8E9EC00D8E9EC00D8E9EC00212021008C8E
      8C00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC006361630073717300FFFFFF00FFFFFF00737173007371
      7300D8E9EC00D8E9EC00D8E9EC00D8E9EC009492940063616300636563007371
      73006B696B007B797B00BDBEBD00B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFF
      FF007371730073717300FFFFFF00D8E9EC00D8E9EC00181C180094929400D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0073717300636163007371730063616300D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B6B500A5A2A5009492
      9400EFEBEF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00737173006361
      63007371730063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500949694007B7D
      7B00BDBEBD00B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600FFFFFF00737173007371730073717300FFFFFF00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500C6C3C600FFFFFF00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600FFFF
      FF00737173007371730063616300737173007371730063616300FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500FFFFFF00FFFFFF00B5B2B500B5B2B500B5B2
      B500B5B2B50063616300D8E9EC00FFFFFF00D8E9EC00D8E9EC00D8E9EC00C6C3
      C600000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00737173007371
      73007371730063616300C6C3C600FFFFFF00FFFFFF007371730073717300FFFF
      FF00FFFFFF00C6C3C600D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500C6C3C600D8E9EC0063616300FFFFFF00B5B2B500B5B2B500B5B2
      B500C6C3C600D8E9EC00D8E9EC00FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C3C600D8E9EC00D8E9EC00D8E9EC0000000000000400000000
      0000C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C6C3C6000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC007371730073717300636163006361
      6300C6C3C600FFFFFF007371730073717300FFFFFF00FFFFFF00737173007371
      7300FFFFFF00FFFFFF00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500C6C3C600D8E9EC00D8E9EC00D8E9EC00FFFFFF00B5B2B500B5B2B500B5B2
      B500D8E9EC00D8E9EC00D8E9EC00FFFFFF00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00C6C3C6000000000000000000D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000001818
      180000000000C6C3C600D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630073717300C6C3C600FFFF
      FF007371730073717300737173007371730073717300FFFFFF00FFFFFF007371
      730073717300FFFFFF00FFFFFF00D8E9EC00B5B2B500B5B2B500B5B2B500C6C3
      C600D8E9EC0063616300D8E9EC00D8E9EC00FFFFFF00B5B2B500C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC000000000000000000C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000004000000000000C6C3C60000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0073717300FFFFFF00737173007371
      7300737173007371730073717300737173007371730073717300FFFFFF00FFFF
      FF007371730073717300FFFFFF00FFFFFF00B5B2B500FFFFFF00FFFFFF00D8E9
      EC0063616300C6C3C60063616300D8E9EC00FFFFFF00C6C3C60063616300D8E9
      EC00B5B2B50063616300D8E9EC00FFFFFF00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00C6C3C6000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3
      C600000000000004000000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630073717300737173007371
      730073717300737173007371730073717300737173007371730073717300FFFF
      FF00FFFFFF007371730073717300D8E9EC00D8E9EC00D8E9EC00D8E9EC006361
      6300B5B2B500C6C3C600D8E9EC00D8E9EC00FFFFFF00D8E9EC0063616300B5B2
      B500C6C3C600D8E9EC00D8E9EC00FFFFFF00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000C6C3C60000000000C6C3C600D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007371730073717300737173007371
      7300737173007371730073717300737173007371730073717300737173007371
      7300FFFFFF0073717300FFFFFF00D8E9EC006361630063616300D8E9EC00B5B2
      B500B5B2B500B5B2B50063616300D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2
      B500B5B2B50063616300D8E9EC00FFFFFF00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9
      EC0000000000D8E9EC00000000001818180000000000D8E9EC00D8E9EC00D8E9
      EC00C6C3C60000000000D8E9EC00D8E9EC0063616300C6C3C600636163007371
      7300737173007371730073717300737173007371730073717300737173007371
      73007371730073717300FFFFFF00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500C6C3C600D8E9EC00D8E9EC0063616300B5B2B500B5B2B500B5B2
      B500C6C3C600D8E9EC00D8E9EC00FFFFFF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000C6C3C60000000000D8E9EC00000000001818180000000000C6C3C600D8E9
      EC00000000007371730000000000D8E9EC00D8E9EC0063616300C6C3C6007371
      7300737173007371730073717300737173007371730073717300737173007371
      73007371730073717300FFFFFF00FFFFFF00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B50063616300D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B50063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000040000000000000000
      0000000000007371730063616300D8E9EC00D8E9EC00D8E9EC0063616300C6C3
      C600636163007371730073717300737173007371730073717300737173007371
      7300737173007371730073717300FFFFFF00B5B2B500B5B2B500C6C3C600B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500D8E9EC0063616300B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000007371
      7300737173000000000000000000D8E9EC00D8E9EC00D8E9EC00C6C3C6006361
      6300D8E9EC007371730073717300737173007371730073717300737173007371
      7300737173006361630063616300D8E9EC00B5B2B500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C6C3C60000000000737173007371
      73007371730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0063616300C6C3C60063616300737173007371730073717300737173007371
      730063616300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0063616300FFFFFF00B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000C6C3C600D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000737173007371
      73007371730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C60063616300C6C3C60073717300737173006361630063616300D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0063616300D8E9EC0063616300D8E9
      EC0063616300C6C3C600B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000007371730073717300000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00636163007371730063616300C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00C6C3C600D8E9EC00BDBABD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00636163000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000073717300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00636163007371
      73007371730073717300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9
      EC00C6C3C600636163000000000039383900C6C3C600D8E9EC00C6C3C600D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC007371730000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000063616300D8E9EC00C6C3C60000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC005A595A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3
      E700E7E3E70063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007371730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3
      E700E7E3E70073717300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000073717300737173000000
      0000000000007371730073717300737173000000000000000000737173007371
      730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC005A595A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3
      E700E7E3E70063616300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000073717300737173000000
      0000737173007371730073717300737173007371730000000000737173007371
      730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      000000000000C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00E7E3E700E7E3E70063616300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000073717300737173000000
      000073717300C6C3C600636163006B696B007371730000000000737173007371
      730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C6C3C60000000000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00C6C3C600000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00E7E3E700E7E3E70063616300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000073717300737173000000
      000063616300D8E9EC00C6C3C600737173007371730000000000737173007371
      730000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006361630000000000C6C3
      C600D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00C6C3
      C600D8E9EC00D8E9EC000000000073717300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000C6C3C600D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00E7E3E700E7E3E70073717300C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF000000
      0000000000007371730073717300737173000000000000000000FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600636163000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3E70063616300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3E70063616300C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C6000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3E7007371
      7300D8E9EC00C6C3C600D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC007371730000000000FFFFFF007B7D7B0063616300D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C6C3C60000000000C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC000000000000000000C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3E700E7E3
      E700636163007371730073717300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00636163000000000031303100C6C3C600D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3
      E700E7E3E700E7E3E70063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00005A595A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3
      E700E7E3E700E7E3E70073717300C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC005A595A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E7E3
      E700E7E3E700E7E3E70063616300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B6
      B500BDBEBD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00BDBABD00DEDBDE00FFFFFF00FFFF
      FF00FFFFFF00E7E7E700D8E9EC00B5B6B500D6D7D600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EFEFEF00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C6C3C600D8E9EC00D8E9EC00D8E9EC009492940063616300636563007371
      730084868400D8E9EC00D8E9EC009C9A9C006365630073717300737173007371
      73006B6D6B00636563007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00BDBABD009C9E9C009C9A
      9C00E7E7E700B5B6B500BDBEBD00D8E9EC00B5B6B500ADAAAD00737173007371
      730094969400EFEFEF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00949694008482
      8400D6D7D600FFFFFF00FFFFFF00FFFFFF00D6D7D60073717300737173007371
      730084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C6C3C6000000000000000000D8E9EC00D8E9EC00C6C3C60000000000C6C3
      C6000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B6B500A5A6
      A500737173006B696B00636563007371730073717300737173006B6D6B008C8A
      8C00EFEBEF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009496
      940094969400E7E7E700D8E9EC009C9A9C006365630073717300737173008482
      8400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000007371730000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009496
      940084828400D6D7D600EFEBEF00ADAAAD00737173006B696B008C8E8C00EFEB
      EF00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C6C3C6000000000000000000000000000000000000000000C6C3C6000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC009496940094969400D6D3D60073717300737173007371730084868400BDBE
      BD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000063616300C6C3C60063616300000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B6
      B500A5A2A50084828400A5A6A500737173006B696B008C8E8C00EFEBEF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9E9C0073717300737173007371730084828400D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9E9C00737173006B696B0094929400EFEBEF00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0094969400636563007371730084868400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00B5B6B500A5A2A5007B797B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500BDBABD00DEDBDE00F7F3
      F700F7F3F700F7F7F700F7F7F700D6D7D600B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B5008C8A8C00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00FFFFFF00E7E7E700B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B50094969400848284008486
      84008486840084868400C6C3C600FFFBFF00D6D7D600B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B5008486840073717300737173007371
      730073717300737173009C9E9C00FFFFFF00E7E7E700B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009C9A9C0073757300737173007371
      730073717300737173007B7D7B00C6C3C600FFFBFF00D6D7D600B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B5007371730073717300737173007371
      7300737173007371730073717300A5A2A500FFFFFF00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007371730073717300737173007371
      73007371730073717300737173007B7D7B00C6C3C600DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B5007371730073717300737173007371
      730073717300737173007371730073717300FFFFFF00B5B2B500B5B2B500B5B2
      B500BDBEBD00E7E7E700B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006B6D6B0073717300737173007371
      730073717300737173007371730073717300B5B6B500DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B5007371730073717300737173007371
      730073717300737173007371730073717300FFFFFF00B5B2B500B5B2B500B5B2
      B5008C8E8C00FFFFFF00E7E3E700B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006B696B0073717300737173007371
      730073717300737173007371730073717300B5B6B500DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B5007371730073717300737173007371
      730073717300737173007371730063656300FFFFFF00BDBABD00E7E3E700E7E3
      E70073717300A5A6A500FFFFFF00E7E3E700D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006B6D6B0073717300737173007371
      73007371730073717300737173006B696B00ADAEAD00DEDBDE00B5B6B500D6D3
      D600EFEFEF00EFEFEF00EFEFEF00EFEFEF007371730073717300737173007371
      73007371730073717300737173006B696B00CECFCE0084868400A5A6A500A5A6
      A5007371730073717300A5A6A500FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC006B696B0073717300737173007371
      73007371730073717300737173006B6D6B0094969400BDBEBD009C9E9C008C8A
      8C00949294009492940094929400BDBEBD007371730073717300737173007371
      73007371730073717300636563009C9A9C00BDBABD006B696B00636563007371
      7300737173007371730063656300D6D3D600D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000008486840073717300737173007371
      730073717300737173006B696B0084828400ADAAAD00B5B6B500949694006B69
      6B006B696B006B696B006B696B008C8A8C009496940063656300636563007371
      730073717300636563009C9A9C00B5B2B500E7E7E70094969400949294009496
      9400636563007371730094929400B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00ADAAAD007B7D7B00636563006B69
      6B00737173006B696B0084868400ADAEAD00CECFCE00D6D3D600ADAAAD009C9E
      9C009C9E9C009C9E9C009C9E9C00A5A6A500B5B2B500949294009C9A9C007371
      7300C6C3C60094929400C6C3C60084828400FFFFFF00B5B2B500B5B2B500BDBA
      BD006361630094969400B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00B5B2B500A5A6A500A5A2A5008C8A
      8C00A5A6A500BDBABD00ADAEAD009C9E9C00B5B6B500DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500BDBABD006365
      6300FFFFFF00BDBABD008C8A8C006B696B00FFFFFF00B5B2B500B5B2B500BDBA
      BD008C8E8C00B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B6B5008C8A
      8C00B5B6B500DEDFDE009C9E9C0073757300B5B2B500DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B5006B69
      6B00FFFFFF008C8A8C009496940073717300FFFFFF00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B5008C8E
      8C00BDBABD00BDBEBD00949294008C8A8C00B5B6B500DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B5006365
      6300B5B2B5008C8E8C00BDBABD0063656300FFFFFF00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B2B5008C8A
      8C00848284009C9A9C00ADAAAD008C8E8C00ADAEAD00DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500BDBABD006361
      630094929400B5B2B500BDBABD0063616300FFFFFF00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B6B5008C8A
      8C0084828400ADAAAD00B5B6B5008C8E8C00ADAEAD00DEDBDE00B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500BDBABD008C8A
      8C00B5B2B500B5B2B500BDBABD0063616300DEDFDE00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500B5B2B500B5B6B500A5A6
      A500A5A6A500B5B2B500B5B6B5008C8E8C009C9A9C00C6C7C600B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B5008C8A8C00BDBABD00B5B2B500B5B2B500B5B2
      B500B5B2B500B5B2B500B5B2B500B5B2B500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B5B6B500D8E9EC00D8E9EC00D8E9EC00B5B6B500D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C600C6C3C600C6C3
      C600CECFCE00C6C3C600C6C3C600C6C3C600CECFCE00C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00A5A6A500E7E3E700E7E3E700E7E3
      E700E7E3E700E7E3E700E7E3E700E7E3E700E7E3E700FFFFFF00C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0073717300737173000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E7E700FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000006361
      63007371730000000000C6C3C600D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00000000000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF000000
      000000000000FFFFFF00B5B2B50000000000B5B2B500FFFFFF00B5B2B5000000
      0000000000007371730000000000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00BDBEBD00B5B6B500D8E9EC00D8E9EC00C6C3C60000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000FFFFFF00B5B2B500FFFFFF0000000000FFFFFF00B5B2B500FFFFFF00FFFF
      FF00000000000000000000000000C6C3C6000000000000000000000000000000
      000000000000000000000000000000000000000000006B6D6B00FFFFFF00B5B6
      B500ADAAAD00FFFFFF00CECBCE00D8E9EC00D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000063616300C6C3C600FFFF
      FF0000000000FFFFFF00B5B2B500FFFFFF00B5B2B500FFFFFF00C6C3C6000000
      0000737173007371730073717300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063616300FFFFFF00BDBE
      BD006B6D6B00EFEBEF00FFFFFF00BDBEBD0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000007B7D7B00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B5B2B500FFFFFF00C6C3C600FFFFFF00C6C3C600636163007371
      7300737173007371730073717300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00B5B6
      B5006361630073717300EFEBEF00F7F7F700000000000000000000000000D8E9
      EC0000000000FFFFFF00000000007B7D7B00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00B5B2B500FFFFFF006361630073717300737173007371
      7300737173000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BDBE
      BD0000000000737173006B696B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007B7D7B00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C6C3C6000000000000000000737173007371
      7300737173007371730073717300000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6D6B00FFFFFF00B5B6
      B5000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007B7D7B00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00007371730073717300737173000000000000000000000000007B7D7B007B7D
      7B007B7D7B007B7D7B007B7D7B00000000000000000063616300FFFFFF00D8E9
      EC006B696B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007B7D7B00FFFFFF000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000D8E9EC000000000000000000F7F3F700F7F3
      F700F7F3F700F7F3F700F7F3F70000000000000000006B6D6B00FFFBFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007B7D7B00FFFFFF0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC000000
      000000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000D8E9EC006B6D6B006B6D6B00737173007371
      73007371730073717300737173006B6D6B000000000063656300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000007B7D7B0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000D8E9EC000000000000000000737573000000
      00007371730000000000000000006365630073757300D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000005A595A00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00007371730063656300D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      000000000000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC0000000000FFFFFF0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00BDBA
      BD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B6B500BDBEBD00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6C3
      C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC003130
      3100C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC009C9A9C00080C08006B69
      6B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5B2B500C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006361
      630063616300D8E9EC00D8E9EC00D8E9EC00B5B2B5005251520010141000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00A5A6A5000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009C9A9C0010141000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ADAAAD0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009C9A9C0010141000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ADAAAD00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC0000000000D8E9EC00C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009C9A9C0018181800BDBEBD00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ADAAAD0000040000ADAEAD000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC006361
      630063616300D8E9EC00D8E9EC00D8E9EC00B5B2B5005251520010141000D8E9
      EC00B5B2B500D8E9EC00A5A6A5000000000008080800D8E9EC00D8E9EC00ADAE
      AD0000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000003130
      3100C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9EC00A5A6A500525552000000
      00000000000000000000080C0800D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000D8E9EC0000000000D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0084828400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0084828400D8E9EC0084828400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000084828400D8E9EC00D8E9
      EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0084828400D8E9
      EC00D8E9EC008482840000000000D8E9EC00848284008482840084828400D8E9
      EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0084828400D8E9
      EC00D8E9EC008482840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C6C3C60000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000084828400D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008482840000000000D8E9EC00D8E9EC00D8E9EC008482840084828400D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008482840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000C6C3C600D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008482
      840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008482
      840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008482
      840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008482
      840000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0084828400848284000000
      000000000000D8E9EC00848284008482840084828400D8E9EC00000000000000
      0000D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC0084828400D8E9EC000000
      000000000000D8E9EC00D8E9EC0084828400D8E9EC00D8E9EC00000000000000
      0000D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000848284000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000084828400D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000084828400D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000008482
      8400000000008482840084828400D8E9EC00D8E9EC00D8E9EC00C6C3C6000000
      0000D8E9EC00D8E9EC00D8E9EC00C6C3C60000000000D8E9EC00D8E9EC00D8E9
      EC00C6C3C60000000000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC008482840000000000D8E9EC0084828400D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000C6C3C600D8E9EC00D8E9EC00D8E9EC0000000000C6C3C600D8E9EC00D8E9
      EC00D8E9EC000000000000000000C6C3C600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC008482840000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00848284008482840084828400000000008482840084828400D8E9EC008482
      8400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00000000000000000000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000084828400D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00C6C3C60000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC008482
      8400D8E9EC000000000084828400D8E9EC00848284000000000084828400D8E9
      EC00D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0084828400D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC008482
      8400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C6C3C600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC008482840084828400D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0084828400D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC008482
      8400D8E9EC00D8E9EC0084828400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D6C7C600D6C3C600D6BABD00DEBE
      C600DEBABD00E7BAC600D6AEB500E7C3C600FFD7DE00D6B2BD00E7C3C600D6B2
      BD00D6BABD00D6B6BD00D6B6BD00CEBABD00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CEB6BD0029080800391418002100
      0000310810004214180029000000390C10002100000031080800391418002900
      080039101800210000004224290021080800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00B5B6B5007B7D7B00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00DEC3C60021000000FFFBFF00FFE7
      EF00FFF7FF00FFD7E700FFF7FF00FFD7F70039143900FFDFFF00FFF7FF00F7D3
      E700FFFBFF00FFF3FF00FFDFE700310C1000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC008C8E8C000000000084828400B5B6B500D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00CEBEC600310C0800FFEBEF00FFF3
      FF00EFE7FF00FFF3FF00F7E3FF00210C5A00180C6300100C4A00EFE7FF00F7E7
      FF00F7E7FF00FFFBFF00FFE7F70031041000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B5B6B5008486840000000000000000000000000094929400D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00000000000000000000000000D8E9EC00C6BEBD0021000000FFFBFF00FFF3
      FF00F7F7FF00E7E3FF0018184A0000005A00000463000810520000043900F7F7
      FF00F7F7FF00E7E7F700FFFBFF0021000800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0094929400000000000000000000000000000000000000000084868400B5B6
      B500D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00BDBAB50039181000FFEBEF00DED7
      EF00E7EBFF00F7F7FF00D6DFFF00E7F3FF0008205200E7F7FF00D6EBFF00EFEF
      FF00DEDBF700F7F3FF00EFDFF70039041800D8E9EC00D8E9EC00D8E9EC008C8A
      8C00000000000000000000000000000000000000000000000000000000009496
      9400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C6C3C600421C1800FFF7FF00DECF
      F70018245200DEE3FF00EFF7FF00BDCFF70008244200BDDFF700D6F3FF00D6E3
      FF0021244200EFEBFF00FFEBFF0039041800D8E9EC00D8E9EC00D8E9EC002124
      2100212421002124210000000000000000000000000021242100212421002124
      2100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00BDBACE0018000800F7CFF7002918
      5A0000045200EFEFFF00D6E3FF00DEF7FF00B5D7F700D6FFFF00BDDBF700E7EF
      FF00100C4A00181C3900FFEBFF0039041800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00CEC3D60031082100421442002110
      5A00181463001008420018204A00ADBEE700DEFBFF00C6E3F700102C4A001010
      520018145200101031003928390021000800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D6BECE0031000800FFD7F7003918
      5200210C4A00FFF3FF00EFE7FF00F7F7FF00E7EFFF00EFFBFF00CED7EF00EFDF
      FF00180C390018143100FFFBFF0039041800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D6BEC60042080800FFF7FF00F7D3
      FF0029184200EFDBFF00FFF3FF00E7DBFF00080C3100DEE7FF00F7FBFF00DECB
      F70031244A00EFE7FF00F7E7F70039081800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BDB6B50039100800FFE7E700FFFB
      FF00E7DFF700FFFBFF00DED7F700F7EFFF0008104A00EFF3FF00CEDBFF00F7F7
      FF00EFEBFF00FFFBFF00EFDFEF0031041000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BDC3BD0029100800FFFFF700F7EF
      F700F7FFFF00EFEBFF00211C420000044A0010186300000C420008143900F7FB
      FF00DEE3EF00DEE3EF00FFFBFF0031041000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C6CBD60018040000FFE7E700EFEF
      F700DEE7F700FFFBFF00D6D3FF0018186B000804630010185A00CED7FF00E7EB
      FF00F7F7FF00FFFFFF00FFF7FF0021000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00080C0800080C0800080C0800D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B5AEB50039181000FFFFF700FFF3
      F700FFFFFF00EFE3EF00FFF3FF00EFDBFF0018106300D6CBFF00FFF7FF00F7E7
      F700FFF7F700E7EBE700FFF3F700390C1000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DEC7C60042080000390000003910
      080018000000290000002904080021002100180018001800100021080800310C
      0800311410000808000029201800390C1000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00424D3E000000000000003E000000
      2800000040000000A00000000100010000000000000500000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF80010000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000CFF3CFF300000000CFC3EFF700000000
      CF03C7E300000000CC03C7E300000000C803E7E7E0070000C803E7E7E0070000
      CF03E007E0070000CF83E007E0070000CFF3F00FE00F0000FFF7FFFFE01F0000
      FFFFFFFFE03F0000FFFFFFFFE07F00000000FFF7FFFFFF0F0000FFE19FFFFC07
      0000FF81C7FFFC410000FFF1E4FFF1C10000FBC9F0FFF1900000E18BF0F1C618
      0000E03FE098CF3C0000003FFC001F1E0000003FE0F89F0F0000FC1FF0F9FE0F
      0000E329F0FFFE070000E3C1E4FFF8070000FFC1CFFFFC0F0000FFE19FFFFE1F
      0000FFC3FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFF01F0000FC1FDFFFC00F0002
      E00F1FCF80030206E003878F0003070EC463C35F00010B1ECE71E0BF00001112
      9E71E17F0001E3468E71F87F000121C2BE7DB47300010306FE7F021180000103
      FE7F0701C0000004FE7F6781C8010000FE7FC703F003F000FCBFC703F01F5000
      FDBFFC07FC3F0000FE7FFE1FFFFF0000FFFFD777FFFFD7FFFAFFC000FFFFC1FF
      B0579FFC9FF7C3FF0007BFFE8FFFC3FF0007BFFE87F7C1FF0007BFFEC3EFF0FF
      0007BFFCE38FF8FF04078EECF09FFC3F00078001F83FFE3F0007FF7FFC3FFF0F
      0007FF7FF03FFF8B904FFE3FF18FFFC0F87FF80F83CFFFE1FFFFFC1F87E7FFE0
      FFFFFE3F8FF7FFE1FFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
      FFFFFFFFFFFF0200F7FFFFFFF7F70601E7FFFFFFE1C38103E0FFEF7FE9D3C007
      E07FE71FE183C007E00FE11FE003E20FE007E007E823E00FE01FE10FE003F00F
      E07FE31FF007E01FE1FFE77FF9CFF83FE7FFFF7FF9CFF83FFFFFFFFFFFFFF87F
      FFFFFFFFFFFFF8FFFFFFFFFFFFFFFFFFFFFF00003C00FFFFC1FF00000000FFFF
      FEFF00000000FFFF7F7F00000000FFFF7F7F00000000E31F7F7B00000000E31F
      7F7B00000000E31F7F6100000000E31FBEE000000000E31FC1FB00000000E31F
      F77B00000000E31FF67F00000000E31FF57F00000000E31FF37F00000000FFFF
      F77F00000000FFFFFF7F00000000FFFFF77FFDBFFFFFFF7F803FF01FFFFFF80F
      001FF00F002FC007001FC00F7FEFC001001FC00F482F80010019800F7FEF8000
      0001800F682F00000000000F7FEF00000000100F7F6F00000001F00F6EAE0000
      0003F00F556400000017F01F6ABA8001001FF03F257C8001003FF87FFAFCC001
      007FFCFFFDFAE001E3FFFFFFFE04F811BFFDFFFFFFFFFFFFB7EDFFFFFFFFFFFF
      D7EBFFFFFFFF803FE7E7FFFFFFFF001F8421FFEF9FFF001FFBDFEFE78F9F001F
      F66FC1E71E07001EF5AFC3F73F07001CF5AFC7F73F870018F66FCAF71F070018
      FBDFDCE71467001C8421FF0781FF001EE7E7FFFFFFFF1B1FD7EBFFFFFFFF0A1F
      B7EDFFFFFFFF843F7FFEFFFFFFFFF1FF7FFD7FFDFFFFFFFF37D917D9FE7FF81F
      97D397D3FE1FF3CFC7C7C7C7FC1FEFF7844BA6CBFF7FDC3B844386C1CE739BD9
      F2BFFEFBC738F66DF4DFF02F8000B5ADF45FF01FCF79B5ADF2DFFEFFEE7BF66D
      E91BF6EFFF3FBBD9844386C3FC1FDC3BE7CFE64FFE3FEFF7D7D7D7D5FF7FF3CF
      B7DAB7DAFFFFF81F5FFD6DFDFFFFFFFF0000FFFFFFFFFFFF0000FCFFFFFFFFF3
      0000FC3FFF1FFFE90000F03FFF1FFFD10000F00FFF1FF8230000E00FFF1FE787
      0000E00FFF1FCFC70000FC7FFF1FDCEF0000FC7FFF1FBCF70000FC7FF803B037
      0000FC7FFC07B0370000FC7FFE0FBCF70000FC7FFF1FDCEF0000FC7FFFBFDFEF
      0000FFFFFFBFE79F0000FFFFFFFFF87F00000000000000000000000000000000
      000000000000}
  end
end
