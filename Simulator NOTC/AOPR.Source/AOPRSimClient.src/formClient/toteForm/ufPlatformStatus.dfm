object fPlatformStatus: TfPlatformStatus
  Left = 0
  Top = 0
  Caption = 'Platform Status'
  ClientHeight = 675
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbPlatformStatus: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 675
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 798
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = ' Platform Status'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
    object pnlPlatformRight: TPanel
      Left = 492
      Top = 39
      Width = 307
      Height = 635
      Align = alRight
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      object pnlPlatSensor: TPanel
        Left = 4
        Top = 4
        Width = 299
        Height = 87
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 0
        object Label76: TLabel
          Left = 4
          Top = 4
          Width = 291
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' Sensors:'
          ExplicitWidth = 363
        end
        object lvSensors: TListView
          Left = 4
          Top = 24
          Width = 291
          Height = 59
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
            end
            item
              Caption = 'Status'
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object pnlPlatWeapon: TPanel
        Left = 4
        Top = 91
        Width = 299
        Height = 180
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 1
        object Label77: TLabel
          Left = 4
          Top = 4
          Width = 291
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' Weapons:'
          ExplicitTop = 160
          ExplicitWidth = 363
        end
        object tvWeapons: TTreeView
          Left = 4
          Top = 24
          Width = 291
          Height = 152
          Align = alClient
          Indent = 19
          TabOrder = 0
        end
      end
      object pnlPlatCounterMeasure: TPanel
        Left = 4
        Top = 271
        Width = 299
        Height = 180
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 2
        object Label78: TLabel
          Left = 4
          Top = 4
          Width = 291
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' Countermeasures:'
          ExplicitWidth = 363
        end
        object tvCountermeasures: TTreeView
          Left = 4
          Top = 24
          Width = 291
          Height = 152
          Align = alClient
          Indent = 19
          TabOrder = 0
        end
      end
      object pnlPlatSystemState: TPanel
        Left = 4
        Top = 451
        Width = 299
        Height = 180
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 3
        object Label80: TLabel
          Left = 4
          Top = 4
          Width = 291
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' System State:'
          ExplicitLeft = 0
          ExplicitTop = 10
          ExplicitWidth = 371
        end
        object lvSystemState: TListView
          Left = 4
          Top = 24
          Width = 291
          Height = 152
          Align = alClient
          Columns = <
            item
              Caption = 'Name'
            end
            item
              Caption = 'Status'
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object pnlPlatformLeft: TPanel
      Left = 1
      Top = 39
      Width = 491
      Height = 635
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 0
      object pnlPlatforms: TPanel
        Left = 4
        Top = 4
        Width = 483
        Height = 471
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 4
        DockSite = True
        TabOrder = 0
        object Label75: TLabel
          Left = 4
          Top = 4
          Width = 475
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' Platforms :'
          ExplicitWidth = 507
        end
        object lvPlatforms: TListView
          Left = 4
          Top = 24
          Width = 475
          Height = 402
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
          OnSelectItem = lvPlatformsSelectItem
          ExplicitLeft = 6
        end
        object Panel13: TPanel
          Left = 4
          Top = 426
          Width = 475
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          BorderWidth = 4
          TabOrder = 1
          object btSelectHookedPlatform: TButton
            Left = 211
            Top = 6
            Width = 123
            Height = 25
            Caption = 'Select Hooked Platform'
            TabOrder = 0
          end
          object btHookSelectedPlatform: TButton
            Left = 340
            Top = 6
            Width = 131
            Height = 25
            Caption = 'Hook Selected Platform'
            TabOrder = 1
          end
        end
      end
      object pnlPlatEmbarked: TPanel
        Left = 4
        Top = 475
        Width = 483
        Height = 156
        Align = alBottom
        BevelOuter = bvNone
        BorderWidth = 4
        TabOrder = 1
        object Label79: TLabel
          Left = 4
          Top = 4
          Width = 475
          Height = 20
          Align = alTop
          AutoSize = False
          Caption = ' Embarked platforms:'
          ExplicitLeft = 6
          ExplicitTop = 2
          ExplicitWidth = 507
        end
        object tvEmbarkedPlatforms: TTreeView
          Left = 4
          Top = 24
          Width = 475
          Height = 128
          Align = alClient
          Indent = 19
          TabOrder = 0
        end
      end
    end
  end
  object pmCountermeasure: TPopupMenu
    Left = 1032
    Top = 456
    object Damage2: TMenuItem
      Caption = 'Damage'
    end
    object Repair2: TMenuItem
      Caption = 'Repair'
    end
    object SetAvailableQuantity1: TMenuItem
      Caption = 'Set Available Quantity'
    end
  end
  object pmEmbarked: TPopupMenu
    Left = 296
    Top = 640
  end
  object pmSensor: TPopupMenu
    AutoLineReduction = maManual
    MenuAnimation = [maTopToBottom]
    Left = 1024
    Top = 96
    object damage1: TMenuItem
      Caption = 'damage'
    end
    object fixed1: TMenuItem
      Caption = 'repair'
    end
  end
  object pmState: TPopupMenu
    Left = 1032
    Top = 640
  end
  object pmWeapon: TPopupMenu
    Left = 1024
    Top = 280
    object dam1: TMenuItem
      Caption = 'Damage'
    end
    object Repair1: TMenuItem
      Caption = 'Repair'
    end
    object SetAvailableQuantity2: TMenuItem
      Caption = 'Set Available Quantity'
    end
  end
end
