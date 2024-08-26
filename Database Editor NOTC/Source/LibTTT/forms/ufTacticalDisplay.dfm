object frmTacticalDisplay: TfrmTacticalDisplay
  Left = 52
  Top = 4
  BorderStyle = bsToolWindow
  Caption = 
    'Tactical Display - Ahmad Yani - Cubicle 3, Station 6 [Command Pl' +
    'atform: Arctic Passage 3] '
  ClientHeight = 893
  ClientWidth = 1353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1353
    Height = 33
    Align = alTop
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 1349
      Height = 29
      Caption = 'ToolBar1'
      Images = ImageList1
      TabOrder = 0
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 1
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
      object ToolButton43: TToolButton
        Left = 31
        Top = 0
        Width = 8
        Caption = 'ToolButton43'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object cbSetScale: TComboBox
        Left = 39
        Top = 0
        Width = 76
        Height = 21
        Hint = 'Select Scale'
        ItemIndex = 9
        TabOrder = 1
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
        Left = 115
        Top = 0
        Hint = 'Decrease Scale'
        ImageIndex = 1
        OnClick = tbtnScaleDecreaseClick
      end
      object toolbtnIncreaseScale: TToolButton
        Left = 138
        Top = 0
        Hint = 'Increase Scale'
        Caption = 'toolbtnIncreaseScale'
        ImageIndex = 2
        OnClick = tbtnScaleIncreaseClick
      end
      object ToolButton8: TToolButton
        Left = 161
        Top = 0
        Width = 8
        Caption = 'ToolButton8'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object toolbtnZoom: TToolButton
        Left = 169
        Top = 0
        Hint = 'Zoom'
        Caption = 'toolbtnZoom'
        ImageIndex = 3
        OnClick = toolbtnZoomClick
      end
      object ToolBtnCentreOnHook: TToolButton
        Left = 192
        Top = 0
        Hint = 'Center On Hook'
        Caption = 'ToolBtnCentreOnHook'
        ImageIndex = 4
        OnClick = ToolBtnCentreOnHookClick
      end
      object ToolBtnCentreOnGameCentre: TToolButton
        Left = 215
        Top = 0
        Hint = 'Center On Game Center'
        Caption = 'ToolBtnCentreOnGameCentre'
        ImageIndex = 5
        OnClick = ToolBtnCentreOnGameCentreClick
      end
      object ToolBtnPan: TToolButton
        Left = 238
        Top = 0
        Hint = 'Pan'
        Caption = 'ToolBtnPan'
        ImageIndex = 6
        OnClick = ToolBtnPanClick
      end
      object toolBtnFilterRangeRings: TToolButton
        Left = 261
        Top = 0
        Hint = 'Filter Range Rings'
        AllowAllUp = True
        Caption = 'toolBtnFilterRangeRings'
        ImageIndex = 7
        Style = tbsCheck
        OnClick = toolBtnFilterRangeRingsClick
      end
      object ToolBtnRangeRingsOnHook: TToolButton
        Left = 284
        Top = 0
        Hint = 'Range Rings On Hook'
        Caption = 'ToolBtnRangeRingsOnHook'
        ImageIndex = 8
        OnClick = ToolBtnRangeRingsOnHookClick
      end
      object ToolButton15: TToolButton
        Left = 307
        Top = 0
        Width = 8
        Caption = 'ToolButton15'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ToolBtnHookPrevious: TToolButton
        Left = 315
        Top = 0
        Hint = 'Hook Previous Track'
        Caption = 'ToolBtnHookPrevious'
        ImageIndex = 9
        OnClick = ToolBtnHookPreviousClick
      end
      object ToolBtnHookNext: TToolButton
        Left = 338
        Top = 0
        Hint = 'Hooks Next Track'
        Caption = 'ToolBtnHookNext'
        ImageIndex = 10
        OnClick = ToolBtnHookNextClick
      end
      object ToolButton18: TToolButton
        Left = 361
        Top = 0
        Width = 8
        Caption = 'ToolButton18'
        ImageIndex = 14
        Style = tbsSeparator
      end
      object ToolBtnAddToTrackTable: TToolButton
        Left = 369
        Top = 0
        Hint = 'Add To Track Table'
        Caption = 'ToolBtnAddToTrackTable'
        ImageIndex = 11
        OnClick = ToolBtnAddToTrackTableClick
      end
      object ToolBtnRemoveFromTrackTable: TToolButton
        Left = 392
        Top = 0
        Hint = 'Remove From Track Table'
        Caption = 'ToolBtnRemoveFromTrackTable'
        ImageIndex = 12
        OnClick = ToolBtnRemoveFromTrackTableClick
      end
      object ToolButton44: TToolButton
        Left = 415
        Top = 0
        Width = 8
        Caption = 'ToolButton44'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object cbAssumeControl: TComboBox
        Left = 423
        Top = 0
        Width = 225
        Height = 21
        Hint = 'Platform Select (for control)'
        Style = csDropDownList
        DropDownCount = 10
        TabOrder = 0
        OnChange = cbAssumeControlChange
      end
      object ToolBtnAssumeControlOfHook: TToolButton
        Left = 648
        Top = 0
        Hint = 'Assume Control Of Hook'
        Caption = 'ToolBtnAssumeControlOfHook'
        ImageIndex = 13
        OnClick = ToolBtnAssumeControlOfHookClick
      end
      object ToolButton21: TToolButton
        Left = 671
        Top = 0
        Width = 8
        Caption = 'ToolButton21'
        ImageIndex = 16
        Style = tbsSeparator
      end
      object ToolBtnEdit: TToolButton
        Left = 679
        Top = 0
        Hint = 'Edit Text'
        Caption = 'ToolBtnEdit'
        ImageIndex = 14
      end
      object ToolButton23: TToolButton
        Left = 702
        Top = 0
        Width = 8
        Caption = 'ToolButton23'
        ImageIndex = 17
        Style = tbsSeparator
      end
      object ToolBtnTrackHistory: TToolButton
        Left = 710
        Top = 0
        Caption = 'ToolBtnTrackHistory'
        ImageIndex = 15
        OnClick = ToolBtnTrackHistoryClick
      end
      object ToolButton25: TToolButton
        Left = 733
        Top = 0
        Width = 8
        Caption = 'ToolButton25'
        ImageIndex = 18
        Style = tbsSeparator
      end
      object ToolBtnAddSonobuoy: TToolButton
        Left = 741
        Top = 0
        Hint = 'Add Sonobuoy'
        Caption = 'ToolBtnAddSonobuoy'
        ImageIndex = 16
      end
      object ToolBtnRemoveSonobuoy: TToolButton
        Left = 764
        Top = 0
        Hint = 'Remove Sonobuoy'
        Caption = 'ToolBtnRemoveSonobuoy'
        ImageIndex = 17
      end
      object ToolBtnTransferSonobuoy: TToolButton
        Left = 787
        Top = 0
        Hint = 'Transfer Sonobuoy'
        Caption = 'ToolBtnTransferSonobuoy'
        ImageIndex = 18
      end
      object ToolButton27: TToolButton
        Left = 810
        Top = 0
        Width = 8
        Caption = 'ToolButton27'
        ImageIndex = 19
        Style = tbsSeparator
      end
      object ToolBtnFreeze: TToolButton
        Left = 818
        Top = 0
        Hint = 'Freeze'
        Caption = 'ToolBtnFreeze'
        ImageIndex = 19
      end
      object ToolBtn1x: TToolButton
        Left = 841
        Top = 0
        Hint = 'Standard Speed'
        Caption = 'ToolBtn1x'
        ImageIndex = 20
      end
      object ToolBtnDoubleSpeed: TToolButton
        Left = 864
        Top = 0
        Hint = 'Double Current Speed'
        Caption = 'ToolBtnDoubleSpeed'
        ImageIndex = 21
      end
      object ToolButton31: TToolButton
        Left = 887
        Top = 0
        Width = 8
        Caption = 'ToolButton31'
        ImageIndex = 22
        Style = tbsSeparator
      end
      object ToolBtnFind: TToolButton
        Left = 895
        Top = 0
        Hint = 'Monitor Student'
        Caption = 'ToolBtnFind'
        ImageIndex = 22
      end
      object ToolBtnAnnotate: TToolButton
        Left = 918
        Top = 0
        Hint = 'Annotate'
        Caption = 'ToolBtnAnnotate'
        ImageIndex = 23
      end
      object ToolBtnSnapshot: TToolButton
        Left = 941
        Top = 0
        Hint = 'Snapshot'
        Caption = 'ToolBtnSnapshot'
        ImageIndex = 24
      end
      object ToolButton35: TToolButton
        Left = 964
        Top = 0
        Width = 8
        Caption = 'ToolButton35'
        ImageIndex = 25
        Style = tbsSeparator
      end
      object ToolBtnAddPlatform: TToolButton
        Left = 972
        Top = 0
        Hint = 'Track History'
        Caption = 'ToolBtnAddPlatform'
        ImageIndex = 25
        OnClick = ToolBtnAddPlatformClick
      end
      object ToolBtnRemovePlatformOrTrack: TToolButton
        Left = 995
        Top = 0
        Hint = 'Remove Platform / Track'
        Caption = 'ToolBtnRemovePlatformOrTrack'
        ImageIndex = 26
      end
      object ToolButton42: TToolButton
        Left = 1018
        Top = 0
        Width = 8
        Caption = 'ToolButton42'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object ToolBtnFilterCursor: TToolButton
        Left = 1026
        Top = 0
        Hint = 'Filter Cursor'
        Caption = 'ToolBtnFilterCursor'
        ImageIndex = 27
        OnClick = ToolBtnFilterCursorClick
      end
      object ToolBtnAnchorCursor: TToolButton
        Left = 1049
        Top = 0
        Hint = 'Anchor Cursor'
        Caption = 'ToolBtnAnchorCursor'
        ImageIndex = 28
        OnClick = ToolBtnAnchorCursorClick
      end
      object ToolBtnOptions: TToolButton
        Left = 1072
        Top = 0
        Hint = 'Options'
        Caption = 'ToolBtnOptions'
        ImageIndex = 29
      end
      object ToolButton45: TToolButton
        Left = 1095
        Top = 0
        Width = 8
        Caption = 'ToolButton45'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object ToolBtnContents: TToolButton
        Left = 1103
        Top = 0
        Hint = 'Contents'
        Caption = 'ToolBtnContents'
        ImageIndex = 30
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 33
    Width = 341
    Height = 787
    Align = alLeft
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 1
    object HookContactInfoTraineeDisplay: TPageControl
      Left = 0
      Top = 113
      Width = 337
      Height = 231
      ActivePage = tsHook
      Align = alTop
      TabOrder = 0
      ExplicitTop = 95
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
          Top = 67
          Width = 15
          Height = 14
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 3
          Top = 67
          Width = 36
          Height = 13
          Caption = 'Bearing'
        end
        object Label4: TLabel
          Left = 190
          Top = 67
          Width = 43
          Height = 13
          Caption = 'degree T'
        end
        object Label5: TLabel
          Left = 3
          Top = 86
          Width = 31
          Height = 13
          Caption = 'Range'
        end
        object lbRangeHook: TLabel
          Left = 100
          Top = 86
          Width = 15
          Height = 14
          Caption = '---'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 190
          Top = 86
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
          Top = 105
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbCourseHook: TLabel
          Left = 100
          Top = 124
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbPositionHook2: TLabel
          Left = 190
          Top = 105
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbGround: TLabel
          Left = 100
          Top = 145
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbAltitude: TLabel
          Left = 100
          Top = 164
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbFormation: TLabel
          Left = 100
          Top = 184
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label8: TLabel
          Left = 190
          Top = 145
          Width = 43
          Height = 13
          Caption = 'degree T'
        end
        object Label9: TLabel
          Left = 190
          Top = 164
          Width = 21
          Height = 13
          Caption = 'knot'
        end
        object Label10: TLabel
          Left = 190
          Top = 184
          Width = 20
          Height = 13
          Caption = 'feet'
        end
        object StaticText1: TStaticText
          Left = 3
          Top = 3
          Width = 30
          Height = 17
          Caption = 'Track'
          TabOrder = 0
        end
        object StaticText6: TStaticText
          Left = 3
          Top = 105
          Width = 41
          Height = 17
          Caption = 'Position'
          TabOrder = 1
        end
        object StaticText7: TStaticText
          Left = 3
          Top = 124
          Width = 38
          Height = 17
          Caption = 'Course'
          TabOrder = 2
        end
        object StaticText8: TStaticText
          Left = 3
          Top = 143
          Width = 72
          Height = 17
          Caption = 'Ground Speed'
          TabOrder = 3
        end
        object StaticText9: TStaticText
          Left = 3
          Top = 162
          Width = 41
          Height = 17
          Caption = 'Altitude'
          TabOrder = 4
        end
        object StaticText10: TStaticText
          Left = 3
          Top = 182
          Width = 74
          Height = 17
          Caption = 'Formation Size'
          TabOrder = 5
        end
        object StaticText25: TStaticText
          Left = 89
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object StaticText28: TStaticText
          Left = 89
          Top = 19
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText29: TStaticText
          Left = 89
          Top = 36
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText30: TStaticText
          Left = 89
          Top = 65
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object StaticText31: TStaticText
          Left = 89
          Top = 86
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 10
        end
        object StaticText32: TStaticText
          Left = 89
          Top = 104
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 11
        end
        object StaticText33: TStaticText
          Left = 89
          Top = 143
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 12
        end
        object StaticText34: TStaticText
          Left = 89
          Top = 162
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 13
        end
        object StaticText35: TStaticText
          Left = 89
          Top = 182
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 14
        end
        object StaticText36: TStaticText
          Left = 89
          Top = 123
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 15
        end
      end
      object tsDetails: TTabSheet
        Caption = 'Details'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbTrackDetails: TLabel
          Left = 110
          Top = 5
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label11: TLabel
          Left = 3
          Top = 20
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object lbNameDetails: TLabel
          Left = 110
          Top = 21
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbClassdetails: TLabel
          Left = 110
          Top = 37
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label12: TLabel
          Left = 3
          Top = 37
          Width = 25
          Height = 13
          Caption = 'Class'
        end
        object Label13: TLabel
          Left = 3
          Top = 54
          Width = 24
          Height = 13
          Caption = 'Type'
        end
        object Label14: TLabel
          Left = 3
          Top = 81
          Width = 35
          Height = 13
          Caption = 'Domain'
        end
        object lbDomain: TLabel
          Left = 110
          Top = 81
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label15: TLabel
          Left = 85
          Top = 105
          Width = 3
          Height = 13
        end
        object lbPropulsion: TLabel
          Left = 110
          Top = 115
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbIdentifier: TLabel
          Left = 110
          Top = 98
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbDoppler: TLabel
          Left = 110
          Top = 150
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbSonarClass: TLabel
          Left = 110
          Top = 133
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbTrackType: TLabel
          Left = 110
          Top = 167
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbTypeDetails: TLabel
          Left = 110
          Top = 54
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMergeStatus: TLabel
          Left = 110
          Top = 185
          Width = 12
          Height = 13
          Caption = '---'
        end
        object StaticText2: TStaticText
          Left = 3
          Top = 3
          Width = 30
          Height = 17
          Caption = 'Track'
          TabOrder = 0
        end
        object StaticText3: TStaticText
          Left = 3
          Top = 98
          Width = 48
          Height = 17
          Caption = 'Identifier'
          TabOrder = 1
        end
        object StaticText4: TStaticText
          Left = 3
          Top = 115
          Width = 80
          Height = 17
          Caption = 'Propulsion Type'
          TabOrder = 2
        end
        object StaticText5: TStaticText
          Left = 3
          Top = 133
          Width = 41
          Height = 17
          Caption = 'Doppler'
          TabOrder = 3
        end
        object StaticText11: TStaticText
          Left = 3
          Top = 150
          Width = 60
          Height = 17
          Caption = 'Sonar Class'
          TabOrder = 4
        end
        object StaticText12: TStaticText
          Left = 3
          Top = 167
          Width = 57
          Height = 17
          Caption = 'Track Type'
          TabOrder = 5
        end
        object StaticText13: TStaticText
          Left = 3
          Top = 185
          Width = 68
          Height = 17
          Caption = 'Merge Status'
          TabOrder = 6
        end
        object StaticText37: TStaticText
          Left = 96
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText38: TStaticText
          Left = 96
          Top = 19
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText39: TStaticText
          Left = 96
          Top = 35
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object StaticText40: TStaticText
          Left = 96
          Top = 52
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 10
        end
        object StaticText41: TStaticText
          Left = 96
          Top = 79
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 11
        end
        object StaticText42: TStaticText
          Left = 96
          Top = 96
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 12
        end
        object StaticText43: TStaticText
          Left = 96
          Top = 133
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 13
        end
        object StaticText44: TStaticText
          Left = 96
          Top = 150
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 14
        end
        object StaticText45: TStaticText
          Left = 96
          Top = 167
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 15
        end
        object StaticText46: TStaticText
          Left = 96
          Top = 115
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 16
        end
        object StaticText47: TStaticText
          Left = 96
          Top = 185
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 17
        end
      end
      object tsDetection: TTabSheet
        Caption = 'Detection'
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbTrackDetection: TLabel
          Left = 137
          Top = 5
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label16: TLabel
          Left = 3
          Top = 19
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object lbNameDetection: TLabel
          Left = 137
          Top = 20
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbClassDetection: TLabel
          Left = 137
          Top = 36
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label17: TLabel
          Left = 3
          Top = 36
          Width = 25
          Height = 13
          Caption = 'Class'
        end
        object Label18: TLabel
          Left = 3
          Top = 62
          Width = 88
          Height = 13
          Caption = 'Owner PU Number'
        end
        object Label19: TLabel
          Left = 3
          Top = 93
          Width = 68
          Height = 13
          Caption = 'First Detected'
        end
        object lbFirstDetected: TLabel
          Left = 137
          Top = 93
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label20: TLabel
          Left = 85
          Top = 114
          Width = 3
          Height = 13
        end
        object lbLastDetected: TLabel
          Left = 137
          Top = 114
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbOwner: TLabel
          Left = 137
          Top = 62
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMonthFD: TLabel
          Left = 185
          Top = 93
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMonthLastDetected: TLabel
          Left = 185
          Top = 114
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbYearFirstDetected: TLabel
          Left = 211
          Top = 93
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbYearLastDetected: TLabel
          Left = 211
          Top = 114
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbDetectionDetectionType: TLabel
          Left = 137
          Top = 135
          Width = 8
          Height = 13
          Caption = '--'
        end
        object StaticText14: TStaticText
          Left = 3
          Top = 3
          Width = 30
          Height = 17
          Caption = 'Track'
          TabOrder = 0
        end
        object StaticText15: TStaticText
          Left = 3
          Top = 113
          Width = 71
          Height = 17
          Caption = 'Last Detected'
          TabOrder = 1
        end
        object lbDetectionType: TStaticText
          Left = 3
          Top = 133
          Width = 77
          Height = 17
          Caption = 'Detection Type'
          TabOrder = 2
        end
        object StaticText48: TStaticText
          Left = 120
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 3
        end
        object StaticText49: TStaticText
          Left = 120
          Top = 18
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 4
        end
        object StaticText50: TStaticText
          Left = 120
          Top = 34
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 5
        end
        object StaticText51: TStaticText
          Left = 120
          Top = 60
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object StaticText53: TStaticText
          Left = 120
          Top = 91
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText54: TStaticText
          Left = 120
          Top = 133
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText55: TStaticText
          Left = 120
          Top = 112
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
      end
      object tsIFF: TTabSheet
        Caption = 'IFF'
        ImageIndex = 3
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbTrackIff: TLabel
          Left = 91
          Top = 3
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label88: TLabel
          Left = 3
          Top = 19
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object lbNameIff: TLabel
          Left = 91
          Top = 19
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbClassIff: TLabel
          Left = 91
          Top = 36
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label91: TLabel
          Left = 3
          Top = 36
          Width = 25
          Height = 13
          Caption = 'Class'
        end
        object Label92: TLabel
          Left = 3
          Top = 66
          Width = 35
          Height = 13
          Caption = 'Mode 1'
        end
        object Label93: TLabel
          Left = 3
          Top = 85
          Width = 35
          Height = 13
          Caption = 'Mode 2'
        end
        object lbMode2Iff: TLabel
          Left = 91
          Top = 86
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label95: TLabel
          Left = 95
          Top = 106
          Width = 3
          Height = 13
        end
        object lbMode1Iff: TLabel
          Left = 91
          Top = 66
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMode3CIff: TLabel
          Left = 91
          Top = 126
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMode3Iff: TLabel
          Left = 91
          Top = 106
          Width = 12
          Height = 13
          Caption = '---'
        end
        object lbMode4Iff: TLabel
          Left = 91
          Top = 147
          Width = 12
          Height = 13
          Caption = '---'
        end
        object StaticText17: TStaticText
          Left = 3
          Top = 3
          Width = 30
          Height = 17
          Caption = 'Track'
          TabOrder = 0
        end
        object StaticText18: TStaticText
          Left = 3
          Top = 105
          Width = 39
          Height = 17
          Caption = 'Mode 3'
          TabOrder = 1
        end
        object StaticText19: TStaticText
          Left = 3
          Top = 125
          Width = 46
          Height = 17
          Caption = 'Mode 3C'
          TabOrder = 2
        end
        object StaticText20: TStaticText
          Left = 3
          Top = 145
          Width = 39
          Height = 17
          Caption = 'Mode 4'
          TabOrder = 3
        end
        object StaticText52: TStaticText
          Left = 80
          Top = 3
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 4
        end
        object StaticText56: TStaticText
          Left = 80
          Top = 19
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 5
        end
        object StaticText57: TStaticText
          Left = 80
          Top = 35
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object StaticText59: TStaticText
          Left = 80
          Top = 64
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object StaticText60: TStaticText
          Left = 80
          Top = 84
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object StaticText61: TStaticText
          Left = 80
          Top = 124
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object StaticText62: TStaticText
          Left = 80
          Top = 145
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 10
        end
        object StaticText63: TStaticText
          Left = 80
          Top = 104
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 11
        end
      end
    end
    object TacticalDisplayControlPanel: TPageControl
      Left = 0
      Top = 344
      Width = 337
      Height = 439
      ActivePage = tsOwnShip
      Align = alClient
      Images = ImageList2
      TabOrder = 1
      ExplicitTop = 326
      ExplicitHeight = 457
      object tsOwnShip: TTabSheet
        ExplicitHeight = 428
        inline fmOwnShip1: TfmOwnShip
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited ScrollBox4: TScrollBox
            Width = 329
            Height = 410
            ExplicitWidth = 329
            ExplicitHeight = 428
          end
        end
      end
      object tsPlatformGuidance: TTabSheet
        ImageIndex = 1
<<<<<<< ufTacticalDisplay.dfm
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object PanelGuidanceControlChoices: TPanel
=======
        ExplicitHeight = 428
        inline fmPlatformGuidance1: TfmPlatformGuidance
>>>>>>> 1.38
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited PanelGuidanceControlChoices: TPanel
            Width = 329
            ExplicitWidth = 329
          end
          inherited PanelPlatformGuidance: TPanel
            Width = 329
            Height = 369
            ExplicitWidth = 329
            ExplicitHeight = 387
            inherited grbReturnToBase: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbFormation: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbEvasion: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbOutrun: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbEngagement: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbShadow: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbSinuation: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbZigZag: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbCircleOnPosition: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbStationKeepingOnTrack: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbStationKeepingOnPosition: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbCircleOnTrack: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited gbWaypoint: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
              inherited btnWaypoint: TButton
                Top = 341
                ExplicitTop = 359
              end
            end
            inherited grbHelm: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
            end
            inherited grbStraightLine: TGroupBox
              Width = 329
              Height = 369
              ExplicitWidth = 329
              ExplicitHeight = 387
              inherited ScrollBox5: TScrollBox
                Width = 325
                Height = 352
                ExplicitWidth = 325
                ExplicitHeight = 370
              end
            end
          end
        end
      end
      object tsSensor: TTabSheet
        ImageIndex = 2
        ExplicitHeight = 428
        inline fmSensor1: TfmSensor
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited PanelSensorChoices: TPanel
            Width = 329
            Height = 111
            ExplicitWidth = 329
            ExplicitHeight = 111
            inherited lstSensor: TListView
              Width = 327
              Height = 109
              ExplicitWidth = 327
              ExplicitHeight = 109
            end
          end
          inherited PanelSensorControl: TPanel
            Top = 116
            Width = 329
            Height = 294
            ExplicitTop = 116
            ExplicitWidth = 329
            ExplicitHeight = 312
            inherited grbIFFTransponderControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel23: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label110: TLabel
                Left = 33
                Top = 20
                ExplicitLeft = 33
                ExplicitTop = 20
              end
              inherited Label112: TLabel
                Top = 89
                ExplicitTop = 89
              end
              inherited Bevel24: TBevel
                Left = 98
                Top = 97
                Width = 185
                Height = 2
                ExplicitLeft = 98
                ExplicitTop = 97
                ExplicitWidth = 185
                ExplicitHeight = 2
              end
              inherited sbIFFTransponderControlModeOn: TSpeedButton
                Left = 13
                Top = 38
                Width = 71
                Height = 21
                ExplicitLeft = 13
                ExplicitTop = 38
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbIFFTransponderControlModeOff: TSpeedButton
                Left = 13
                Top = 56
                Width = 71
                Height = 20
                ExplicitLeft = 13
                ExplicitTop = 56
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited cbIFFTransponderControlMode1: TCheckBox
                Left = 13
                Top = 113
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 113
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbIFFTransponderControlMode2: TCheckBox
                Left = 13
                Top = 142
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 142
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbIFFTransponderControlMode3: TCheckBox
                Left = 13
                Top = 171
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 171
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbIFFTransponderControlMode3C: TCheckBox
                Left = 13
                Top = 200
                Width = 53
                Height = 15
                ExplicitLeft = 13
                ExplicitTop = 200
                ExplicitWidth = 53
                ExplicitHeight = 15
              end
              inherited cbIFFTransponderControlMode4: TCheckBox
                Left = 13
                Top = 228
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 228
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited edtIFFTransponderControlMode1: TEdit
                Left = 82
                Top = 111
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 111
                ExplicitWidth = 79
              end
              inherited edtIFFTransponderControlMode2: TEdit
                Left = 82
                Top = 140
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 140
                ExplicitWidth = 79
              end
              inherited edtIFFTransponderControlMode3: TEdit
                Left = 82
                Top = 169
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 169
                ExplicitWidth = 79
              end
            end
            inherited grbAnomalyDetectorSensor: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel47: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label230: TLabel
                Left = 33
                Top = 20
                ExplicitLeft = 33
                ExplicitTop = 20
              end
              inherited sbAnomalyDetectorControlModeOn: TSpeedButton
                Left = 13
                Top = 35
                Width = 71
                Height = 21
                ExplicitLeft = 13
                ExplicitTop = 35
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbAnomalyDetectorControlModeOff: TSpeedButton
                Left = 13
                Top = 55
                Width = 71
                Height = 20
                ExplicitLeft = 13
                ExplicitTop = 55
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
            end
            inherited grbElectroOpticalSensor: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel48: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label235: TLabel
                Left = 50
                Top = 20
                ExplicitLeft = 50
                ExplicitTop = 20
              end
              inherited Label245: TLabel
                Top = 84
                ExplicitTop = 84
              end
              inherited Bevel49: TBevel
                Left = 42
                Top = 90
                Width = 241
                ExplicitLeft = 42
                ExplicitTop = 90
                ExplicitWidth = 241
              end
              inherited Label251: TLabel
                Left = 142
                Top = 107
                ExplicitLeft = 142
                ExplicitTop = 107
              end
              inherited Label252: TLabel
                Left = 52
                Top = 107
                ExplicitLeft = 52
                ExplicitTop = 107
              end
              inherited sbElectroOpticalSensorDisplayRangeShow: TSpeedButton
                Left = 35
                Top = 124
                Width = 71
                Height = 21
                ExplicitLeft = 35
                ExplicitTop = 124
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbElectroOpticalSensorDisplayRangeHide: TSpeedButton
                Left = 35
                Top = 144
                Width = 71
                Height = 20
                ExplicitLeft = 35
                ExplicitTop = 144
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited sbElectroOpticalSensorBlindZoneShow: TSpeedButton
                Left = 132
                Top = 124
                Width = 70
                Height = 21
                ExplicitLeft = 132
                ExplicitTop = 124
                ExplicitWidth = 70
                ExplicitHeight = 21
              end
              inherited sbElectroOpticalSensorBlindZoneHide: TSpeedButton
                Left = 132
                Top = 144
                Width = 70
                Height = 20
                ExplicitLeft = 132
                ExplicitTop = 144
                ExplicitWidth = 70
                ExplicitHeight = 20
              end
              inherited sbElectroOpticalSensorControlModeOn: TSpeedButton
                Left = 35
                Top = 35
                Width = 71
                Height = 21
                ExplicitLeft = 35
                ExplicitTop = 35
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbElectroOpticalSensorControlModeOff: TSpeedButton
                Left = 35
                Top = 55
                Width = 71
                Height = 20
                ExplicitLeft = 35
                ExplicitTop = 55
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited btnElectroOpticalSensorExecuteSingleScan: TButton
                Left = 135
                Top = 341
                Width = 142
                Height = 23
                ExplicitLeft = 135
                ExplicitTop = 341
                ExplicitWidth = 142
                ExplicitHeight = 23
              end
            end
            inherited grbVisualDetectorSensor: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel51: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label258: TLabel
                Left = 135
                Top = 26
                ExplicitLeft = 135
                ExplicitTop = 26
              end
              inherited Label259: TLabel
                Left = 47
                Top = 26
                ExplicitLeft = 47
                ExplicitTop = 26
              end
              inherited sbVisualDetectorDisplayRangeShow: TSpeedButton
                Left = 28
                Top = 41
                Width = 70
                Height = 20
                ExplicitLeft = 28
                ExplicitTop = 41
                ExplicitWidth = 70
                ExplicitHeight = 20
              end
              inherited sbVisualDetectorDisplayRangeHide: TSpeedButton
                Left = 28
                Top = 59
                Width = 70
                Height = 21
                ExplicitLeft = 28
                ExplicitTop = 59
                ExplicitWidth = 70
                ExplicitHeight = 21
              end
              inherited sbVisualDetectorDisplayBlindZonesShow: TSpeedButton
                Left = 123
                Top = 41
                Width = 70
                Height = 20
                ExplicitLeft = 123
                ExplicitTop = 41
                ExplicitWidth = 70
                ExplicitHeight = 20
              end
              inherited sbVisualDetectorDisplayBlindZonesHide: TSpeedButton
                Left = 123
                Top = 59
                Width = 70
                Height = 21
                ExplicitLeft = 123
                ExplicitTop = 59
                ExplicitWidth = 70
                ExplicitHeight = 21
              end
            end
            inherited grbSearchRadarControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited ScrollBox1: TScrollBox
                Width = 319
                Height = 271
                ExplicitWidth = 319
                ExplicitHeight = 289
                inherited Bevel28: TBevel
                  Left = 40
                  Top = 9
                  Width = 176
                  ExplicitLeft = 40
                  ExplicitTop = 9
                  ExplicitWidth = 176
                end
                inherited Label193: TLabel
                  Left = 40
                  Top = 20
                  ExplicitLeft = 40
                  ExplicitTop = 20
                end
                inherited Label194: TLabel
                  Left = 226
                  Top = 20
                  ExplicitLeft = 226
                  ExplicitTop = 20
                end
                inherited Label200: TLabel
                  Top = 121
                  ExplicitTop = 121
                end
                inherited Bevel30: TBevel
                  Left = 69
                  Top = 128
                  Width = 162
                  ExplicitLeft = 69
                  ExplicitTop = 128
                  ExplicitWidth = 162
                end
                inherited Label201: TLabel
                  Left = 40
                  Top = 138
                  ExplicitLeft = 40
                  ExplicitTop = 138
                end
                inherited Label202: TLabel
                  Left = 123
                  Top = 158
                  ExplicitLeft = 123
                  ExplicitTop = 158
                end
                inherited Label203: TLabel
                  Left = 123
                  Top = 179
                  ExplicitLeft = 123
                  ExplicitTop = 179
                end
                inherited Label204: TLabel
                  Left = 190
                  Top = 158
                  ExplicitLeft = 190
                  ExplicitTop = 158
                end
                inherited Label205: TLabel
                  Left = 191
                  Top = 179
                  ExplicitLeft = 191
                  ExplicitTop = 179
                end
                inherited Label261: TLabel
                  Top = 206
                  ExplicitTop = 206
                end
                inherited Bevel31: TBevel
                  Left = 47
                  Top = 214
                  Width = 179
                  Height = 2
                  ExplicitLeft = 47
                  ExplicitTop = 214
                  ExplicitWidth = 179
                  ExplicitHeight = 2
                end
                inherited Label262: TLabel
                  Left = 40
                  Top = 224
                  ExplicitLeft = 40
                  ExplicitTop = 224
                end
                inherited Label263: TLabel
                  Left = 123
                  Top = 224
                  ExplicitLeft = 123
                  ExplicitTop = 224
                end
                inherited Label264: TLabel
                  Left = 214
                  Top = 224
                  ExplicitLeft = 214
                  ExplicitTop = 224
                end
                inherited btnControlComboInterval: TSpeedButton
                  Left = 251
                  Top = 93
                  Width = 21
                  Height = 20
                  ExplicitLeft = 251
                  ExplicitTop = 93
                  ExplicitWidth = 21
                  ExplicitHeight = 20
                end
                inherited btnComboScanStrart: TSpeedButton
                  Left = 247
                  Top = 153
                  Width = 21
                  Height = 21
                  ExplicitLeft = 247
                  ExplicitTop = 153
                  ExplicitWidth = 21
                  ExplicitHeight = 21
                end
                inherited sbControlModeSearch: TSpeedButton
                  Left = 18
                  Top = 36
                  Width = 75
                  Height = 21
                  ExplicitLeft = 18
                  ExplicitTop = 36
                  ExplicitWidth = 75
                  ExplicitHeight = 21
                end
                inherited sbControlModeTrack: TSpeedButton
                  Left = 18
                  Top = 55
                  Width = 75
                  Height = 20
                  ExplicitLeft = 18
                  ExplicitTop = 55
                  ExplicitWidth = 75
                  ExplicitHeight = 20
                end
                inherited sbControlModeOff: TSpeedButton
                  Left = 18
                  Top = 72
                  Width = 75
                  Height = 20
                  ExplicitLeft = 18
                  ExplicitTop = 72
                  ExplicitWidth = 75
                  ExplicitHeight = 20
                end
                inherited sbControlEccmOn: TSpeedButton
                  Left = 204
                  Top = 36
                  Width = 71
                  Height = 21
                  ExplicitLeft = 204
                  ExplicitTop = 36
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbControlEccmOff: TSpeedButton
                  Left = 204
                  Top = 55
                  Width = 71
                  Height = 20
                  ExplicitLeft = 204
                  ExplicitTop = 55
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbScanModeFull: TSpeedButton
                  Left = 18
                  Top = 156
                  Width = 70
                  Height = 20
                  ExplicitLeft = 18
                  ExplicitTop = 156
                  ExplicitWidth = 70
                  ExplicitHeight = 20
                end
                inherited sbScanModePartial: TSpeedButton
                  Left = 18
                  Top = 175
                  Width = 70
                  Height = 20
                  ExplicitLeft = 18
                  ExplicitTop = 175
                  ExplicitWidth = 70
                  ExplicitHeight = 20
                end
                inherited sbRangeShow: TSpeedButton
                  Left = 20
                  Top = 240
                  Width = 71
                  Height = 20
                  ExplicitLeft = 20
                  ExplicitTop = 240
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbRangeHide: TSpeedButton
                  Left = 20
                  Top = 258
                  Width = 71
                  Height = 21
                  ExplicitLeft = 20
                  ExplicitTop = 258
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbBlindShow: TSpeedButton
                  Left = 111
                  Top = 240
                  Width = 71
                  Height = 20
                  ExplicitLeft = 111
                  ExplicitTop = 240
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbBlindHide: TSpeedButton
                  Left = 111
                  Top = 258
                  Width = 71
                  Height = 21
                  ExplicitLeft = 111
                  ExplicitTop = 258
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbScanShow: TSpeedButton
                  Left = 200
                  Top = 240
                  Width = 70
                  Height = 20
                  ExplicitLeft = 200
                  ExplicitTop = 240
                  ExplicitWidth = 70
                  ExplicitHeight = 20
                end
                inherited sbScanHide: TSpeedButton
                  Left = 200
                  Top = 258
                  Width = 70
                  Height = 21
                  ExplicitLeft = 200
                  ExplicitTop = 258
                  ExplicitWidth = 70
                  ExplicitHeight = 21
                end
                inherited cbActivationInterval: TCheckBox
                  Left = 22
                  Top = 96
                  Width = 99
                  Height = 15
                  ExplicitLeft = 22
                  ExplicitTop = 96
                  ExplicitWidth = 99
                  ExplicitHeight = 15
                end
                inherited editComboInterval: TEdit
                  Left = 126
                  Top = 94
                  Width = 119
                  ExplicitLeft = 126
                  ExplicitTop = 94
                  ExplicitWidth = 119
                end
                inherited editScanStart: TEdit
                  Left = 157
                  Top = 154
                  Width = 28
                  ExplicitLeft = 157
                  ExplicitTop = 154
                  ExplicitWidth = 28
                end
                inherited editScanEnd: TEdit
                  Left = 157
                  Top = 176
                  Width = 28
                  ExplicitLeft = 157
                  ExplicitTop = 176
                  ExplicitWidth = 28
                end
                inherited btShowRangeAltitude: TButton
                  Left = 20
                  Top = 305
                  Width = 109
                  Height = 18
                  ExplicitLeft = 20
                  ExplicitTop = 305
                  ExplicitWidth = 109
                  ExplicitHeight = 18
                end
                inherited btExecuteSingleScan: TButton
                  Left = 170
                  Top = 305
                  Width = 98
                  Height = 18
                  ExplicitLeft = 170
                  ExplicitTop = 305
                  ExplicitWidth = 98
                  ExplicitHeight = 18
                end
              end
            end
<<<<<<< ufTacticalDisplay.dfm
          end
        end
      end
      object tsSensor: TTabSheet
        ImageIndex = 2
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object PanelSensorChoices: TPanel
          Left = 0
          Top = 0
          Width = 329
          Height = 120
          Align = alTop
          ParentBackground = False
          TabOrder = 0
          object lstSensor: TListView
            Left = 1
            Top = 1
            Width = 327
            Height = 118
            Align = alClient
            Color = clMenu
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
            GridLines = True
            RowSelect = True
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = lstSensorSelectItem
          end
        end
        object PanelSensorControl: TPanel
          Left = 0
          Top = 125
          Width = 329
          Height = 763
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 3
          ParentBackground = False
          TabOrder = 1
          ExplicitHeight = 744
          object grbIFFTransponderControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 8
            ExplicitHeight = 738
            object Label108: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel23: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label110: TLabel
              Left = 35
              Top = 22
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object Label112: TLabel
              Left = 3
              Top = 96
              Width = 101
              Height = 13
              Caption = 'Mode/Code Selection'
            end
            object Bevel24: TBevel
              Left = 105
              Top = 104
              Width = 200
              Height = 3
            end
            object sbIFFTransponderControlModeOn: TSpeedButton
              Left = 14
              Top = 41
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'On'
            end
            object sbIFFTransponderControlModeOff: TSpeedButton
              Left = 14
              Top = 60
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Off'
            end
            object cbIFFTransponderControlMode1: TCheckBox
              Left = 14
              Top = 122
              Width = 57
              Height = 17
              Caption = 'Mode 1 :'
              TabOrder = 0
            end
            object cbIFFTransponderControlMode2: TCheckBox
              Left = 14
              Top = 153
              Width = 57
              Height = 17
              Caption = 'Mode 2 :'
              TabOrder = 1
            end
            object cbIFFTransponderControlMode3: TCheckBox
              Left = 14
              Top = 184
              Width = 57
              Height = 17
              Caption = 'Mode 3 :'
              TabOrder = 2
            end
            object cbIFFTransponderControlMode3C: TCheckBox
              Left = 14
              Top = 215
              Width = 57
              Height = 17
              Caption = 'Mode 3C :'
              TabOrder = 3
            end
            object cbIFFTransponderControlMode4: TCheckBox
              Left = 14
              Top = 246
              Width = 57
              Height = 17
              Caption = 'Mode 4 :'
              TabOrder = 4
            end
            object edtIFFTransponderControlMode1: TEdit
              Left = 88
              Top = 120
              Width = 85
              Height = 21
              TabOrder = 5
              Text = '00'
            end
            object edtIFFTransponderControlMode2: TEdit
              Left = 88
              Top = 151
              Width = 85
              Height = 21
              TabOrder = 6
              Text = '0000'
            end
            object edtIFFTransponderControlMode3: TEdit
              Left = 88
              Top = 182
              Width = 85
              Height = 21
              TabOrder = 7
              Text = '0000'
            end
          end
          object grbAnomalyDetectorSensor: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 3
            ExplicitHeight = 738
            object Label225: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel47: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label230: TLabel
              Left = 35
              Top = 22
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object sbAnomalyDetectorControlModeOn: TSpeedButton
              Left = 14
              Top = 38
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 3
              Caption = 'On'
            end
            object sbAnomalyDetectorControlModeOff: TSpeedButton
              Left = 14
              Top = 59
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 3
              Down = True
              Caption = 'Off'
            end
          end
          object grbElectroOpticalSensor: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 4
            ExplicitHeight = 738
            object Label231: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel48: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label235: TLabel
              Left = 54
              Top = 22
              Width = 46
              Height = 13
              Caption = 'Periscope'
            end
            object Label245: TLabel
              Left = 3
              Top = 90
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel49: TBevel
              Left = 45
              Top = 97
              Width = 260
              Height = 3
            end
            object Label251: TLabel
              Left = 153
              Top = 115
              Width = 57
              Height = 13
              Caption = 'Blind Zones '
            end
            object Label252: TLabel
              Left = 56
              Top = 115
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object sbElectroOpticalSensorDisplayRangeShow: TSpeedButton
              Left = 38
              Top = 134
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbElectroOpticalSensorDisplayRangeHide: TSpeedButton
              Left = 38
              Top = 155
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object sbElectroOpticalSensorBlindZoneShow: TSpeedButton
              Left = 142
              Top = 134
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbElectroOpticalSensorBlindZoneHide: TSpeedButton
              Left = 142
              Top = 155
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbElectroOpticalSensorControlModeOn: TSpeedButton
              Left = 38
              Top = 38
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 3
              Caption = 'Up'
            end
            object sbElectroOpticalSensorControlModeOff: TSpeedButton
              Left = 38
              Top = 59
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 3
              Down = True
              Caption = 'Down'
            end
            object btnElectroOpticalSensorExecuteSingleScan: TButton
              Left = 145
              Top = 367
              Width = 153
              Height = 25
              Caption = 'Execute Single Scan'
              TabOrder = 0
            end
          end
          object grbVisualDetectorSensor: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 6
            ExplicitHeight = 738
            object Label257: TLabel
              Left = 5
              Top = 3
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel51: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label258: TLabel
              Left = 145
              Top = 28
              Width = 57
              Height = 13
              Caption = 'Blind Zones '
            end
            object Label259: TLabel
              Left = 51
              Top = 28
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object sbVisualDetectorDisplayRangeShow: TSpeedButton
              Tag = 1
              Left = 30
              Top = 44
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
              OnClick = OnVisualShowClick
            end
            object sbVisualDetectorDisplayRangeHide: TSpeedButton
              Tag = 2
              Left = 30
              Top = 64
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
              OnClick = OnVisualShowClick
            end
            object sbVisualDetectorDisplayBlindZonesShow: TSpeedButton
              Tag = 3
              Left = 132
              Top = 44
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
              OnClick = OnVisualShowClick
            end
            object sbVisualDetectorDisplayBlindZonesHide: TSpeedButton
              Tag = 4
              Left = 132
              Top = 64
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
              OnClick = OnVisualShowClick
            end
          end
          object grbSearchRadarControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 0
            ExplicitHeight = 738
            object ScrollBox1: TScrollBox
              Left = 2
              Top = 15
              Width = 319
              Height = 740
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              ExplicitHeight = 721
              object Label189: TLabel
                Left = 3
                Top = 3
                Width = 35
                Height = 13
                Caption = 'Control'
              end
              object Bevel28: TBevel
                Left = 43
                Top = 10
                Width = 190
                Height = 3
              end
              object Label193: TLabel
                Left = 43
                Top = 22
                Width = 26
                Height = 13
                Caption = 'Mode'
              end
              object Label194: TLabel
                Left = 243
                Top = 22
                Width = 28
                Height = 13
                Caption = 'ECCM'
              end
              object Label200: TLabel
                Left = 3
                Top = 130
                Width = 57
                Height = 13
                Caption = 'Scan Sector'
              end
              object Bevel30: TBevel
                Left = 74
                Top = 138
                Width = 175
                Height = 3
              end
              object Label201: TLabel
                Left = 43
                Top = 149
                Width = 26
                Height = 13
                Caption = 'Mode'
              end
              object Label202: TLabel
                Left = 132
                Top = 170
                Width = 31
                Height = 13
                Caption = 'Start :'
              end
              object Label203: TLabel
                Left = 132
                Top = 193
                Width = 25
                Height = 13
                Caption = 'End :'
              end
              object Label204: TLabel
                Left = 205
                Top = 170
                Width = 48
                Height = 13
                Caption = 'degrees T'
              end
              object Label205: TLabel
                Left = 206
                Top = 193
                Width = 48
                Height = 13
                Caption = 'degrees T'
              end
              object Label261: TLabel
                Left = 3
                Top = 222
                Width = 34
                Height = 13
                Caption = 'Display'
              end
              object Bevel31: TBevel
                Left = 51
                Top = 230
                Width = 192
                Height = 3
              end
              object Label262: TLabel
                Left = 43
                Top = 241
                Width = 31
                Height = 13
                Caption = 'Range'
              end
              object Label263: TLabel
                Left = 132
                Top = 241
                Width = 54
                Height = 13
                Caption = 'Blind Zones'
              end
              object Label264: TLabel
                Left = 230
                Top = 241
                Width = 57
                Height = 13
                Caption = 'Scan Sector'
              end
              object btnControlComboInterval: TSpeedButton
                Left = 270
                Top = 100
                Width = 23
                Height = 22
                Glyph.Data = {
                  D6050000424DD605000000000000360000002800000017000000140000000100
                  180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                  000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
              end
              object btnComboScanStrart: TSpeedButton
                Left = 266
                Top = 165
                Width = 23
                Height = 22
                Glyph.Data = {
                  D6050000424DD605000000000000360000002800000017000000140000000100
                  180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                  000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                  0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                  B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
              end
              object sbControlModeSearch: TSpeedButton
                Tag = 9
                Left = 19
                Top = 39
                Width = 81
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 7
                Caption = 'Search / Track'
                OnClick = sbHideShowClick
              end
              object sbControlModeTrack: TSpeedButton
                Tag = 10
                Left = 19
                Top = 59
                Width = 81
                Height = 22
                AllowAllUp = True
                GroupIndex = 7
                Caption = 'Track'
                OnClick = sbHideShowClick
              end
              object sbControlModeOff: TSpeedButton
                Tag = 11
                Left = 19
                Top = 77
                Width = 81
                Height = 22
                AllowAllUp = True
                GroupIndex = 7
                Down = True
                Caption = 'Off'
                OnClick = sbHideShowClick
              end
              object sbControlEccmOn: TSpeedButton
                Tag = 12
                Left = 220
                Top = 39
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 3
                Caption = 'On'
                OnClick = sbHideShowClick
              end
              object sbControlEccmOff: TSpeedButton
                Tag = 13
                Left = 220
                Top = 59
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 3
                Down = True
                Caption = 'Off'
                OnClick = sbHideShowClick
              end
              object sbScanModeFull: TSpeedButton
                Tag = 7
                Left = 19
                Top = 168
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 1
                Down = True
                Caption = 'Full'
              end
              object sbScanModePartial: TSpeedButton
                Tag = 8
                Left = 19
                Top = 188
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 1
                Caption = 'Partial'
              end
              object sbRangeShow: TSpeedButton
                Tag = 1
                Left = 22
                Top = 258
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 4
                Caption = 'Show'
                OnClick = sbHideShowClick
              end
              object sbRangeHide: TSpeedButton
                Tag = 2
                Left = 22
                Top = 278
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 4
                Down = True
                Caption = 'Hide'
                OnClick = sbHideShowClick
              end
              object sbBlindShow: TSpeedButton
                Tag = 3
                Left = 120
                Top = 258
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 5
                Caption = 'Show'
                OnClick = sbHideShowClick
              end
              object sbBlindHide: TSpeedButton
                Tag = 4
                Left = 120
                Top = 278
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 5
                Down = True
                Caption = 'Hide'
                OnClick = sbHideShowClick
              end
              object sbScanShow: TSpeedButton
                Tag = 5
                Left = 215
                Top = 258
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 6
                Caption = 'Show'
                OnClick = sbHideShowClick
              end
              object sbScanHide: TSpeedButton
                Tag = 6
                Left = 215
                Top = 278
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 6
                Down = True
                Caption = 'Hide'
                OnClick = sbHideShowClick
              end
              object cbActivationInterval: TCheckBox
                Left = 24
                Top = 103
                Width = 106
                Height = 17
                Caption = 'Activation Interval'
                TabOrder = 0
              end
              object editComboInterval: TEdit
                Left = 136
                Top = 101
                Width = 128
                Height = 21
                TabOrder = 1
                Text = 'None'
              end
              object editScanStart: TEdit
                Left = 169
                Top = 166
                Width = 30
                Height = 21
                TabOrder = 2
                Text = '000'
              end
              object editScanEnd: TEdit
                Left = 169
                Top = 189
                Width = 30
                Height = 21
                TabOrder = 3
                Text = '000'
              end
              object btShowRangeAltitude: TButton
                Left = 22
                Top = 328
                Width = 117
                Height = 20
                Caption = 'Show Range Altitude..'
                TabOrder = 4
              end
              object btExecuteSingleScan: TButton
                Left = 183
                Top = 328
                Width = 106
                Height = 20
                Caption = 'Execute Single Scan'
                TabOrder = 5
              end
            end
          end
          object grbIFFInterrogatorControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 7
            ExplicitHeight = 738
            object Label208: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel34: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label210: TLabel
              Left = 35
              Top = 22
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object Label211: TLabel
              Left = 3
              Top = 154
              Width = 101
              Height = 13
              Caption = 'Mode/Code Selection'
            end
            object Bevel35: TBevel
              Left = 105
              Top = 162
              Width = 200
              Height = 3
            end
            object Label212: TLabel
              Left = 3
              Top = 90
              Width = 26
              Height = 13
              Caption = 'Track'
            end
            object Bevel36: TBevel
              Left = 35
              Top = 98
              Width = 265
              Height = 3
            end
            object btnbtnIFFInterrogatorTrackSearch: TSpeedButton
              Left = 96
              Top = 110
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbIFFInterrogatorControlModeOn: TSpeedButton
              Left = 12
              Top = 40
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'On'
            end
            object sbIFFInterrogatorControlModeOff: TSpeedButton
              Left = 12
              Top = 60
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Off'
            end
            object cbbtnIFFInterrogatorMode1: TCheckBox
              Left = 14
              Top = 180
              Width = 57
              Height = 17
              Caption = 'Mode 1 :'
              TabOrder = 0
            end
            object cbbtnIFFInterrogatorMode2: TCheckBox
              Left = 14
              Top = 211
              Width = 57
              Height = 17
              Caption = 'Mode 2 :'
              TabOrder = 1
            end
            object cbbtnIFFInterrogatorMode3: TCheckBox
              Left = 14
              Top = 242
              Width = 57
              Height = 17
              Caption = 'Mode 3 :'
              TabOrder = 2
            end
            object cbbtnIFFInterrogatorMode3C: TCheckBox
              Left = 14
              Top = 273
              Width = 57
              Height = 17
              Caption = 'Mode 3C :'
              TabOrder = 3
            end
            object cbbtnIFFInterrogatorMode4: TCheckBox
              Left = 14
              Top = 304
              Width = 57
              Height = 17
              Caption = 'Mode 4 :'
              TabOrder = 4
            end
            object edtIFFInterrogatorMode1: TEdit
              Left = 88
              Top = 178
              Width = 85
              Height = 21
              TabOrder = 5
              Text = '00'
            end
            object edtIFFInterrogatorMode2: TEdit
              Left = 88
              Top = 209
              Width = 85
              Height = 21
              TabOrder = 6
              Text = '0000'
            end
            object edtIFFInterrogatorMode3: TEdit
              Left = 88
              Top = 240
              Width = 85
              Height = 21
              TabOrder = 7
              Text = '0000'
            end
            object editbtnIFFInterrogatorTrack: TEdit
              Left = 14
              Top = 111
              Width = 73
              Height = 21
              TabOrder = 8
              Text = '1004'
            end
          end
          object grbSonobuoyControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 5
            ExplicitHeight = 738
            object Label240: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object Bevel44: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object lblStatusSonobuoy: TLabel
              Left = 35
              Top = 22
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label243: TLabel
              Left = 35
              Top = 72
              Width = 33
              Height = 13
              Caption = 'Mode :'
            end
            object Label244: TLabel
              Left = 107
              Top = 22
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbStatusQuantity: TLabel
              Left = 162
              Top = 22
              Width = 18
              Height = 13
              Caption = '100'
            end
            object Label242: TLabel
              Left = 3
              Top = 49
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel45: TBevel
              Left = 45
              Top = 56
              Width = 260
              Height = 3
            end
            object Label246: TLabel
              Left = 35
              Top = 103
              Width = 36
              Height = 13
              Caption = 'Depth :'
            end
            object Label247: TLabel
              Left = 159
              Top = 103
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label248: TLabel
              Left = 3
              Top = 161
              Width = 36
              Height = 13
              Caption = 'Monitor'
            end
            object Bevel46: TBevel
              Left = 41
              Top = 169
              Width = 260
              Height = 3
            end
            object Label249: TLabel
              Left = 35
              Top = 186
              Width = 128
              Height = 13
              Caption = 'Platform Monitor Capacity:'
            end
            object Label250: TLabel
              Left = 35
              Top = 215
              Width = 105
              Height = 13
              Caption = 'Currently Monitoring :'
            end
            object lblSonobuoyMonitorCurrently: TLabel
              Left = 190
              Top = 215
              Width = 6
              Height = 13
              Caption = '0'
            end
            object lblSonobuoyMonitorPlatform: TLabel
              Left = 188
              Top = 186
              Width = 12
              Height = 13
              Caption = '50'
            end
            object Label253: TLabel
              Left = 208
              Top = 186
              Width = 54
              Height = 13
              Caption = 'sonobuy(s)'
            end
            object Label254: TLabel
              Left = 208
              Top = 215
              Width = 54
              Height = 13
              Caption = 'sonobuy(s)'
            end
            object btnSonobuoyControlCombo: TSpeedButton
              Left = 280
              Top = 67
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object editControlMode: TEdit
              Left = 80
              Top = 68
              Width = 194
              Height = 21
              TabOrder = 0
              Text = 'Passive'
            end
            object editControlDepth: TEdit
              Left = 80
              Top = 99
              Width = 73
              Height = 21
              TabOrder = 1
              Text = '100'
            end
            object btnSonobuoyControlDeploy: TButton
              Left = 228
              Top = 134
              Width = 75
              Height = 25
              Caption = 'Deploy'
              TabOrder = 2
            end
          end
          object grbESMSensorControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 2
            ExplicitHeight = 738
            object Label217: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel38: TBevel
              Left = 43
              Top = 10
              Width = 260
              Height = 3
            end
            object Label218: TLabel
              Left = 35
              Top = 22
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object Label219: TLabel
              Left = 3
              Top = 90
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel40: TBevel
              Left = 45
              Top = 97
              Width = 260
              Height = 3
            end
            object Label220: TLabel
              Left = 25
              Top = 115
              Width = 57
              Height = 13
              Caption = 'Blind Zones '
            end
            object sbESMSensorControlModeOn: TSpeedButton
              Tag = 1
              Left = 14
              Top = 40
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 3
              Caption = 'On'
              OnClick = sbESMOnClisk
            end
            object sbESMSensorControlModeOff: TSpeedButton
              Tag = 2
              Left = 14
              Top = 60
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 3
              Down = True
              Caption = 'Off'
              OnClick = sbESMOnClisk
            end
            object sbESMSensorDisplayBlindZoneShow: TSpeedButton
              Tag = 3
              Left = 14
              Top = 129
              Width = 76
              Height = 22
              HelpContext = 1
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
              OnClick = sbESMOnClisk
            end
            object sbESMSensorDisplayBlindZoneHide: TSpeedButton
              Tag = 4
              Left = 14
              Top = 149
              Width = 76
              Height = 22
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
              OnClick = sbESMOnClisk
            end
          end
          object grbSonarControl: TGroupBox
            Left = 3
            Top = 3
            Width = 323
            Height = 757
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 738
            object ScrollBox2: TScrollBox
              Left = 2
              Top = 15
              Width = 319
              Height = 740
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              ExplicitHeight = 721
              object Bevel37: TBevel
                Left = 44
                Top = 4
                Width = 262
                Height = 3
              end
              object Bevel39: TBevel
                Left = 65
                Top = 107
                Width = 245
                Height = 3
              end
              object Bevel41: TBevel
                Left = 202
                Top = 125
                Width = 105
                Height = 3
              end
              object Bevel42: TBevel
                Left = 170
                Top = 194
                Width = 140
                Height = 3
              end
              object Bevel43: TBevel
                Left = 45
                Top = 274
                Width = 265
                Height = 3
              end
              object Label213: TLabel
                Left = 3
                Top = -2
                Width = 35
                Height = 13
                Caption = 'Control'
              end
              object Label214: TLabel
                Left = 43
                Top = 10
                Width = 26
                Height = 13
                Caption = 'Mode'
              end
              object Label215: TLabel
                Left = 43
                Top = 118
                Width = 30
                Height = 13
                Caption = 'Action'
              end
              object Label216: TLabel
                Left = 3
                Top = 99
                Width = 57
                Height = 13
                Caption = 'Deployment'
              end
              object Label221: TLabel
                Left = 132
                Top = 142
                Width = 47
                Height = 13
                Caption = 'Ordered :'
              end
              object Label222: TLabel
                Left = 132
                Top = 165
                Width = 37
                Height = 13
                Caption = 'Actual :'
              end
              object Label223: TLabel
                Left = 250
                Top = 142
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label224: TLabel
                Left = 250
                Top = 165
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label226: TLabel
                Left = 22
                Top = 188
                Width = 41
                Height = 13
                Caption = 'Status : '
              end
              object Label228: TLabel
                Left = 132
                Top = 208
                Width = 41
                Height = 13
                Caption = 'Settled :'
              end
              object Label229: TLabel
                Left = 132
                Top = 228
                Width = 37
                Height = 13
                Caption = 'Actual :'
              end
              object Label232: TLabel
                Left = 250
                Top = 208
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label233: TLabel
                Left = 250
                Top = 228
                Width = 33
                Height = 13
                Caption = 'metres'
              end
              object Label234: TLabel
                Left = 132
                Top = 247
                Width = 60
                Height = 13
                Caption = 'Tow Speed :'
              end
              object Label236: TLabel
                Left = 250
                Top = 247
                Width = 26
                Height = 13
                Caption = 'knots'
              end
              object Label237: TLabel
                Left = 3
                Top = 266
                Width = 34
                Height = 13
                Caption = 'Display'
              end
              object Label238: TLabel
                Left = 43
                Top = 285
                Width = 31
                Height = 13
                Caption = 'Range'
              end
              object Label239: TLabel
                Left = 145
                Top = 285
                Width = 54
                Height = 13
                Caption = 'Blind Zones'
              end
              object LabelCablePayout: TLabel
                Left = 132
                Top = 118
                Width = 64
                Height = 13
                Caption = 'Cable Payout'
              end
              object LabelDepth: TLabel
                Left = 132
                Top = 188
                Width = 29
                Height = 13
                Caption = 'Depth'
              end
              object lbCableActual: TLabel
                Left = 187
                Top = 165
                Width = 18
                Height = 13
                Caption = '124'
              end
              object lbDepthActual: TLabel
                Left = 212
                Top = 228
                Width = 6
                Height = 13
                Caption = '6'
              end
              object lbDepthSettled: TLabel
                Left = 212
                Top = 208
                Width = 6
                Height = 13
                Caption = '6'
              end
              object lbDepthTow: TLabel
                Left = 212
                Top = 247
                Width = 22
                Height = 13
                Caption = '29.0'
              end
              object lblStatusDeployment: TLabel
                Left = 62
                Top = 188
                Width = 45
                Height = 13
                Caption = 'Deployed'
              end
              object sbDeploymentActiondeploy: TSpeedButton
                Tag = 4
                Left = 22
                Top = 137
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 3
                Caption = 'Deploy'
                OnClick = sbSonarBtnClick
              end
              object sbDeploymentActionShow: TSpeedButton
                Tag = 5
                Left = 22
                Top = 157
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 3
                Down = True
                Caption = 'Stow'
                OnClick = sbSonarBtnClick
              end
              object sbDisplayBlindHide: TSpeedButton
                Tag = 8
                Left = 133
                Top = 321
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 4
                Down = True
                Caption = 'Hide'
                OnClick = sbSonarBtnClick
              end
              object sbDisplayBlindShow: TSpeedButton
                Tag = 9
                Left = 133
                Top = 300
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 4
                Caption = 'Show'
                OnClick = sbSonarBtnClick
              end
              object sbDisplayRangeHide: TSpeedButton
                Tag = 6
                Left = 26
                Top = 321
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 2
                Down = True
                Caption = 'Hide'
                OnClick = sbSonarBtnClick
              end
              object sbDisplayRangeShow: TSpeedButton
                Tag = 7
                Left = 26
                Top = 300
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 2
                Caption = 'Show'
                OnClick = sbSonarBtnClick
              end
              object sbSonarControlModeActive: TSpeedButton
                Tag = 1
                Left = 22
                Top = 29
                Width = 76
                Height = 22
                HelpContext = 1
                AllowAllUp = True
                GroupIndex = 1
                Caption = 'Active'
                OnClick = sbSonarBtnClick
              end
              object sbSonarControlModeOff: TSpeedButton
                Tag = 3
                Left = 22
                Top = 68
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 1
                Down = True
                Caption = 'Off'
                OnClick = sbSonarBtnClick
              end
              object sbSonarControlModePassive: TSpeedButton
                Tag = 2
                Left = 22
                Top = 49
                Width = 76
                Height = 22
                AllowAllUp = True
                GroupIndex = 1
                Caption = 'Passive'
                OnClick = sbSonarBtnClick
              end
              object editCableOrdered: TEdit
                Left = 187
                Top = 138
                Width = 41
                Height = 21
                TabOrder = 0
                Text = '124'
              end
            end
          end
        end
        object PanelSpace: TPanel
          Left = 0
          Top = 120
          Width = 329
          Height = 5
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
        end
      end
      object tsWeapon: TTabSheet
        ImageIndex = 3
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object PanelTacticalWeapons: TPanel
          Left = 0
          Top = 34
          Width = 329
          Height = 854
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          ExplicitHeight = 835
          object grbWakeHomingTorpedos: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 7
            ExplicitHeight = 835
            object Label400: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblWakeHomingStatus: TLabel
              Left = 22
              Top = 25
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label418: TLabel
              Left = 126
              Top = 25
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblWakeHomingQuantity: TLabel
              Left = 182
              Top = 25
              Width = 6
              Height = 13
              Caption = '8'
            end
            object Label420: TLabel
              Left = 3
              Top = 105
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel82: TBevel
              Left = 42
              Top = 112
              Width = 260
              Height = 3
            end
            object Label421: TLabel
              Left = 22
              Top = 131
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label422: TLabel
              Left = 3
              Top = 249
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel84: TBevel
              Left = 40
              Top = 258
              Width = 260
              Height = 3
            end
            object Label423: TLabel
              Left = 43
              Top = 268
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label425: TLabel
              Left = 150
              Top = 268
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Label429: TLabel
              Left = 22
              Top = 153
              Width = 45
              Height = 13
              Caption = 'Identity :'
            end
            object lblWakeHomingTargetIdentity: TLabel
              Left = 127
              Top = 153
              Width = 38
              Height = 13
              Caption = 'Pending'
            end
            object Label431: TLabel
              Left = 22
              Top = 176
              Width = 78
              Height = 13
              Caption = 'Target Bearing :'
            end
            object Label435: TLabel
              Left = 22
              Top = 198
              Width = 80
              Height = 13
              Caption = 'Launch Bearing :'
            end
            object Label436: TLabel
              Left = 22
              Top = 221
              Width = 74
              Height = 13
              Caption = 'Seeker Range :'
            end
            object lbWakeHomingTargetTarget: TLabel
              Left = 127
              Top = 176
              Width = 18
              Height = 13
              Caption = '144'
            end
            object Label440: TLabel
              Left = 185
              Top = 176
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label441: TLabel
              Left = 185
              Top = 198
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label442: TLabel
              Left = 185
              Top = 221
              Width = 27
              Height = 13
              Caption = 'yards'
            end
            object Bevel86: TBevel
              Left = 40
              Top = 11
              Width = 260
              Height = 3
            end
            object Label443: TLabel
              Left = 3
              Top = 52
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel87: TBevel
              Left = 39
              Top = 60
              Width = 260
              Height = 3
            end
            object Label444: TLabel
              Left = 22
              Top = 76
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object btnWakeHomingTargetTrack: TSpeedButton
              Left = 185
              Top = 126
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbWakeHomingDisplayRangeShow: TSpeedButton
              Left = 24
              Top = 283
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbWakeHomingDisplayRangeHide: TSpeedButton
              Left = 24
              Top = 307
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbWakeHomingDisplayBlindShow: TSpeedButton
              Left = 138
              Top = 283
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbWakeHomingDisplayBlindHide: TSpeedButton
              Left = 138
              Top = 307
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object edtWakeHomingTargetTrack: TEdit
              Left = 126
              Top = 127
              Width = 53
              Height = 21
              TabOrder = 0
              Text = '1010'
            end
            object btnWakeHomingLaunch: TButton
              Left = 242
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
            object edtWakeHomingControlSalvo: TEdit
              Left = 126
              Top = 73
              Width = 53
              Height = 21
              TabOrder = 2
              Text = '1'
            end
            object editWakeHomingTargetLaunch: TEdit
              Left = 126
              Top = 194
              Width = 36
              Height = 21
              TabOrder = 3
              Text = '144'
            end
            object editWakeHomingTargetSeeker: TEdit
              Left = 126
              Top = 217
              Width = 36
              Height = 21
              TabOrder = 4
              Text = '6076'
            end
            object btnWakeHomingTargetSeekerDefault: TButton
              Left = 242
              Top = 217
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 5
            end
          end
          object grbWireGuidedTorpedo: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 8
            ExplicitHeight = 835
            object Label326: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblWireGuidedTorpedoStatus: TLabel
              Left = 24
              Top = 31
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label372: TLabel
              Left = 117
              Top = 31
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblWireGuidedTorpedoQuantity: TLabel
              Left = 173
              Top = 31
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label401: TLabel
              Left = 3
              Top = 60
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel81: TBevel
              Left = 43
              Top = 69
              Width = 260
              Height = 3
            end
            object Label402: TLabel
              Left = 24
              Top = 83
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label404: TLabel
              Left = 3
              Top = 187
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel83: TBevel
              Left = 43
              Top = 195
              Width = 260
              Height = 3
            end
            object Label408: TLabel
              Left = 46
              Top = 199
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label417: TLabel
              Left = 153
              Top = 199
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Label424: TLabel
              Left = 24
              Top = 103
              Width = 45
              Height = 13
              Caption = 'Identity :'
            end
            object lblWireGuidedTorpedoTargetIdentity: TLabel
              Left = 116
              Top = 103
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label426: TLabel
              Left = 24
              Top = 124
              Width = 41
              Height = 13
              Caption = 'Course :'
            end
            object Label427: TLabel
              Left = 24
              Top = 144
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object Label428: TLabel
              Left = 24
              Top = 165
              Width = 44
              Height = 13
              Caption = 'Altitude :'
            end
            object lblWireGuidedTorpedoTargetCourse: TLabel
              Left = 116
              Top = 124
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lblWireGuidedTorpedoTargetGround: TLabel
              Left = 116
              Top = 144
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lblWireGuidedTorpedoTargetDepth: TLabel
              Left = 116
              Top = 165
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label432: TLabel
              Left = 179
              Top = 124
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label433: TLabel
              Left = 179
              Top = 144
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label434: TLabel
              Left = 179
              Top = 165
              Width = 20
              Height = 13
              Caption = 'feet'
            end
            object Bevel85: TBevel
              Left = 40
              Top = 11
              Width = 260
              Height = 3
            end
            object btnlWireGuidedTorpedoTargetTrack: TSpeedButton
              Left = 179
              Top = 78
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sblWireGuidedTorpedoDisplayRangeShow: TSpeedButton
              Left = 24
              Top = 221
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sblWireGuidedTorpedodDisplayRangeHide: TSpeedButton
              Left = 24
              Top = 245
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sblWireGuidedTorpedoDisplayBlindShow: TSpeedButton
              Left = 141
              Top = 221
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sblWireGuidedTorpedoDisplayBlindHide: TSpeedButton
              Left = 141
              Top = 245
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object editlWireGuidedTorpedoTargetTrack: TEdit
              Left = 117
              Top = 79
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnlWireGuidedTorpedoLaunch: TButton
              Left = 235
              Top = 465
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
          end
          object grbTacticalMissiles: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 4
            ExplicitHeight = 835
            object Label289: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblTacticalMissileStatus: TLabel
              Left = 24
              Top = 25
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label294: TLabel
              Left = 116
              Top = 25
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblTacticalMissileStatusQuantity: TLabel
              Left = 172
              Top = 25
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label296: TLabel
              Left = 3
              Top = 181
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel59: TBevel
              Left = 40
              Top = 188
              Width = 190
              Height = 2
            end
            object Label302: TLabel
              Left = 22
              Top = 207
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object Label304: TLabel
              Left = 9
              Top = 363
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel62: TBevel
              Left = 46
              Top = 371
              Width = 190
              Height = 2
            end
            object Label486: TLabel
              Left = 45
              Top = 382
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label494: TLabel
              Left = 198
              Top = 382
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Bevel107: TBevel
              Left = 40
              Top = 10
              Width = 190
              Height = 2
            end
            object Label295: TLabel
              Left = 3
              Top = 52
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel60: TBevel
              Left = 40
              Top = 60
              Width = 190
              Height = 2
            end
            object Label303: TLabel
              Left = 176
              Top = 142
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label496: TLabel
              Left = 22
              Top = 237
              Width = 77
              Height = 13
              Caption = 'Cruise Altitude :'
            end
            object Label497: TLabel
              Left = 22
              Top = 268
              Width = 74
              Height = 13
              Caption = 'Seeker Range :'
            end
            object Label498: TLabel
              Left = 161
              Top = 237
              Width = 20
              Height = 13
              Caption = 'feet'
            end
            object Label499: TLabel
              Left = 161
              Top = 268
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label500: TLabel
              Left = 3
              Top = 298
              Width = 51
              Height = 13
              Caption = 'Waypoints'
            end
            object Bevel108: TBevel
              Left = 58
              Top = 312
              Width = 175
              Height = 2
            end
            object btnTacticalMissileTargetTrack: TSpeedButton
              Left = 179
              Top = 76
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnTacticalMissileTargetAimpoint: TSpeedButton
              Left = 287
              Top = 105
              Width = 23
              Height = 22
              Caption = '+'
            end
            object sbTacticalMissileDisplayRangeShow: TSpeedButton
              Left = 24
              Top = 401
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbTacticalMissileDisplayRangeHide: TSpeedButton
              Left = 24
              Top = 425
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbTacticalMissileDisplayBlindShow: TSpeedButton
              Left = 187
              Top = 401
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbTacticalMissileDisplayBlindHide: TSpeedButton
              Left = 187
              Top = 425
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object editTacticalMissileControlSalvo: TEdit
              Left = 102
              Top = 203
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnTacticalMissileLaunch: TButton
              Left = 230
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
            object rdoTacticalMissileTargetTrack: TRadioButton
              Left = 24
              Top = 79
              Width = 113
              Height = 17
              Caption = 'Track :'
              TabOrder = 2
            end
            object rdoTacticalMissileTargetAimpoint: TRadioButton
              Left = 24
              Top = 108
              Width = 113
              Height = 17
              Caption = 'Aimpoint :'
              TabOrder = 3
            end
            object rdoTacticalMissileTargetBearing: TRadioButton
              Left = 24
              Top = 140
              Width = 113
              Height = 17
              Caption = 'Bearing :'
              TabOrder = 4
            end
            object editTacticalMissileTargetTrack: TEdit
              Left = 116
              Top = 77
              Width = 57
              Height = 21
              TabOrder = 5
            end
            object editTacticalMissileTargetAimpoint: TEdit
              Left = 116
              Top = 106
              Width = 125
              Height = 21
              TabOrder = 6
            end
            object editTacticalMissileTargetBearing: TEdit
              Left = 116
              Top = 138
              Width = 57
              Height = 21
              TabOrder = 7
            end
            object btnTacticalMissileTargetBearing: TButton
              Left = 230
              Top = 136
              Width = 80
              Height = 25
              Caption = 'Brg to Hook'
              TabOrder = 8
            end
            object editTacticalMissileControlCruise: TEdit
              Left = 102
              Top = 233
              Width = 53
              Height = 21
              TabOrder = 9
            end
            object editTacticalMissileControlSeeker: TEdit
              Left = 102
              Top = 264
              Width = 53
              Height = 21
              TabOrder = 10
            end
            object btnTacticalMissileControlCruise: TButton
              Left = 187
              Top = 231
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 11
            end
            object btnTacticalMissileControlSeeker: TButton
              Left = 187
              Top = 262
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 12
            end
            object btnTacticalMissileWaypointEdit: TButton
              Left = 24
              Top = 327
              Width = 80
              Height = 25
              Caption = 'Edit'
              TabOrder = 13
            end
            object btnTacticalMissileWaypointAdd: TButton
              Left = 127
              Top = 327
              Width = 80
              Height = 25
              Caption = 'Add'
              TabOrder = 14
            end
            object btnTacticalMissileWaypointCancel: TButton
              Left = 230
              Top = 327
              Width = 80
              Height = 25
              Caption = 'Cancel'
              TabOrder = 15
            end
          end
          object grbTacticalAcousticTorpedos: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 12
            ExplicitHeight = 835
            object Label439: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblTacticalAcousticTorpedosStatus: TLabel
              Left = 24
              Top = 30
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label455: TLabel
              Left = 126
              Top = 30
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbTacticalAcousticTorpedosQuantity: TLabel
              Left = 182
              Top = 30
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label460: TLabel
              Left = 3
              Top = 109
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel91: TBevel
              Left = 41
              Top = 117
              Width = 260
              Height = 3
            end
            object Label461: TLabel
              Left = 24
              Top = 131
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label462: TLabel
              Left = 2
              Top = 212
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel92: TBevel
              Left = 39
              Top = 221
              Width = 260
              Height = 3
            end
            object Label463: TLabel
              Left = 48
              Top = 225
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label464: TLabel
              Left = 149
              Top = 225
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Label465: TLabel
              Left = 24
              Top = 161
              Width = 45
              Height = 13
              Caption = 'Identity :'
            end
            object lbTacticalAcousticTorpedosTargetIdentity: TLabel
              Left = 127
              Top = 161
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Bevel93: TBevel
              Left = 40
              Top = 11
              Width = 260
              Height = 3
            end
            object Label459: TLabel
              Left = 3
              Top = 57
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel94: TBevel
              Left = 39
              Top = 64
              Width = 260
              Height = 3
            end
            object Label476: TLabel
              Left = 24
              Top = 83
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object btnTacticalAcousticTorpedosTargetTrack: TSpeedButton
              Left = 185
              Top = 126
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbTacticalAcousticTorpedosDisplayRangeShow: TSpeedButton
              Left = 25
              Top = 245
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbTacticalAcousticTorpedosDisplayRangeHide: TSpeedButton
              Left = 25
              Top = 269
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbTacticalAcousticTorpedosDisplayBlindShow: TSpeedButton
              Left = 137
              Top = 245
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbTacticalAcousticTorpedosDisplayBlindHide: TSpeedButton
              Left = 137
              Top = 269
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object editTacticalAcousticTorpedosTargetTrack: TEdit
              Left = 126
              Top = 127
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnTacticalAcousticTorpedosLaunch: TButton
              Left = 242
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
            object editTacticalAcousticTorpedosSalvo: TEdit
              Left = 125
              Top = 79
              Width = 53
              Height = 21
              TabOrder = 2
            end
          end
          object grbStraightRunningTorpedos: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 6
            ExplicitHeight = 835
            object Label430: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblStatusStraightRunningTorpedos: TLabel
              Left = 22
              Top = 31
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label438: TLabel
              Left = 125
              Top = 31
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbStraightRunningTorpedosQuantity: TLabel
              Left = 181
              Top = 31
              Width = 12
              Height = 13
              Caption = '12'
            end
            object Label445: TLabel
              Left = 3
              Top = 56
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel88: TBevel
              Left = 40
              Top = 64
              Width = 260
              Height = 3
            end
            object Label446: TLabel
              Left = 22
              Top = 84
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label447: TLabel
              Left = 3
              Top = 192
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel89: TBevel
              Left = 40
              Top = 199
              Width = 260
              Height = 3
            end
            object Label448: TLabel
              Left = 47
              Top = 203
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label449: TLabel
              Left = 150
              Top = 203
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Label450: TLabel
              Left = 24
              Top = 104
              Width = 45
              Height = 13
              Caption = 'Identity :'
            end
            object lbStraightRunningTorpedosTargetIdentity: TLabel
              Left = 124
              Top = 104
              Width = 38
              Height = 13
              Caption = 'Pending'
            end
            object Label452: TLabel
              Left = 24
              Top = 123
              Width = 41
              Height = 13
              Caption = 'Course :'
            end
            object Label453: TLabel
              Left = 24
              Top = 141
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object Label454: TLabel
              Left = 24
              Top = 160
              Width = 36
              Height = 13
              Caption = 'Depth :'
            end
            object lbStraightRunningTorpedosTargetCourse: TLabel
              Left = 124
              Top = 123
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label456: TLabel
              Left = 184
              Top = 123
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label457: TLabel
              Left = 184
              Top = 141
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label458: TLabel
              Left = 184
              Top = 160
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Bevel90: TBevel
              Left = 40
              Top = 11
              Width = 260
              Height = 3
            end
            object lbStraightRunningTorpedosTargetGround: TLabel
              Left = 124
              Top = 141
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbStraightRunningTorpedosTargetDepth: TLabel
              Left = 124
              Top = 160
              Width = 12
              Height = 13
              Caption = '---'
            end
            object btnStraightRunningTorpedosTargetTrack: TSpeedButton
              Left = 184
              Top = 79
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbStraightRunningTorpedosDisplayRangeShow: TSpeedButton
              Left = 24
              Top = 223
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbStraightRunningTorpedosDisplayRangeHide: TSpeedButton
              Left = 24
              Top = 247
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbStraightRunningTorpedosDisplayBlindShow: TSpeedButton
              Left = 134
              Top = 223
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbStraightRunningTorpedosDisplayBlindHide: TSpeedButton
              Left = 134
              Top = 247
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object edtStraightRunningTorpedosTargetTrack: TEdit
              Left = 125
              Top = 80
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnStraightRunningTorpedosLaunch: TButton
              Left = 242
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
          end
          object grbMines: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 14
            ExplicitHeight = 835
            object Label272: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblStatusMines: TLabel
              Left = 22
              Top = 31
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label288: TLabel
              Left = 94
              Top = 31
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbMinesQuantity: TLabel
              Left = 150
              Top = 31
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label291: TLabel
              Left = 3
              Top = 60
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel58: TBevel
              Left = 40
              Top = 67
              Width = 260
              Height = 3
            end
            object Label292: TLabel
              Left = 22
              Top = 90
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object Bevel61: TBevel
              Left = 40
              Top = 10
              Width = 260
              Height = 3
            end
            object editMinesControlSalvo: TEdit
              Left = 94
              Top = 86
              Width = 53
              Height = 21
              TabOrder = 0
              Text = '0'
            end
            object btnMinesDeploy: TButton
              Left = 236
              Top = 193
              Width = 80
              Height = 25
              Caption = 'Deploy'
              TabOrder = 1
            end
          end
          object grbHybridMissile: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 5
            ExplicitHeight = 835
            object Label24: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblHybridMissileStatus: TLabel
              Left = 24
              Top = 25
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label38: TLabel
              Left = 116
              Top = 25
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblHybridMissileQuantity: TLabel
              Left = 172
              Top = 25
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label40: TLabel
              Left = 3
              Top = 181
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel7: TBevel
              Left = 40
              Top = 188
              Width = 190
              Height = 2
            end
            object Label41: TLabel
              Left = 22
              Top = 207
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object Label42: TLabel
              Left = 9
              Top = 363
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel8: TBevel
              Left = 46
              Top = 371
              Width = 190
              Height = 2
            end
            object Label43: TLabel
              Left = 45
              Top = 382
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label44: TLabel
              Left = 198
              Top = 382
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Bevel9: TBevel
              Left = 40
              Top = 10
              Width = 190
              Height = 2
            end
            object Label45: TLabel
              Left = 3
              Top = 52
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel10: TBevel
              Left = 40
              Top = 60
              Width = 190
              Height = 2
            end
            object Label48: TLabel
              Left = 176
              Top = 142
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label49: TLabel
              Left = 22
              Top = 237
              Width = 77
              Height = 13
              Caption = 'Cruise Altitude :'
            end
            object Label50: TLabel
              Left = 22
              Top = 268
              Width = 74
              Height = 13
              Caption = 'Seeker Range :'
            end
            object Label51: TLabel
              Left = 161
              Top = 237
              Width = 20
              Height = 13
              Caption = 'feet'
            end
            object Label52: TLabel
              Left = 161
              Top = 268
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object btnSearchHybridMissileTargetTrack: TSpeedButton
              Left = 179
              Top = 76
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnAddHybridMissileTargetAimpoint: TSpeedButton
              Left = 287
              Top = 105
              Width = 23
              Height = 22
              Caption = '+'
            end
            object sbHybridMissileDisplayRangeShow: TSpeedButton
              Left = 22
              Top = 402
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbHybridMissileDisplayRangeHide: TSpeedButton
              Left = 22
              Top = 426
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbHybridMissileDisplayBlindZonesShow: TSpeedButton
              Left = 187
              Top = 402
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbHybridMissileDisplayBlindZonesHide: TSpeedButton
              Left = 187
              Top = 426
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object edtHybridMissileControlSalvoSize: TEdit
              Left = 102
              Top = 203
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnHybridMissileLaunch: TButton
              Left = 230
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
            object rdoHybridMissileTargetTrack: TRadioButton
              Left = 24
              Top = 79
              Width = 113
              Height = 17
              Caption = 'Track :'
              TabOrder = 2
            end
            object rdoHybridMissileTargetAimpoint: TRadioButton
              Left = 24
              Top = 108
              Width = 113
              Height = 17
              Caption = 'Aimpoint :'
              TabOrder = 3
            end
            object rdoHybridMissileTargetBearing: TRadioButton
              Left = 24
              Top = 140
              Width = 113
              Height = 17
              Caption = 'Bearing :'
              TabOrder = 4
            end
            object edtHybridMissiletargetTrack: TEdit
              Left = 116
              Top = 77
              Width = 57
              Height = 21
              TabOrder = 5
            end
            object edtHybridMissiletargetAimpoint: TEdit
              Left = 116
              Top = 106
              Width = 125
              Height = 21
              TabOrder = 6
            end
            object edtHybridMissiletargetBearing: TEdit
              Left = 116
              Top = 138
              Width = 57
              Height = 21
              TabOrder = 7
            end
            object btnBringToHookHybridMissileTargetBearing: TButton
              Left = 230
              Top = 136
              Width = 80
              Height = 25
              Caption = 'Brg to Hook'
              TabOrder = 8
            end
            object edtHybridMissileControlCruiseAltitude: TEdit
              Left = 102
              Top = 233
              Width = 53
              Height = 21
              TabOrder = 9
            end
            object edtHybridMissileControlSeekerRange: TEdit
              Left = 102
              Top = 264
              Width = 53
              Height = 21
              TabOrder = 10
            end
            object btnDefaultHybridMissileControlCruiseAltitude: TButton
              Left = 187
              Top = 231
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 11
            end
            object btnDefaultHybridMissileControlSeekerRange: TButton
              Left = 187
              Top = 262
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 12
            end
          end
          object grbBombDepthCharge: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 3
            ExplicitHeight = 835
            object Label475: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblBombStatus: TLabel
              Left = 22
              Top = 31
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label485: TLabel
              Left = 94
              Top = 31
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbBombQuantity: TLabel
              Left = 150
              Top = 31
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label487: TLabel
              Left = 3
              Top = 122
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel102: TBevel
              Left = 40
              Top = 129
              Width = 260
              Height = 3
            end
            object Label490: TLabel
              Left = 22
              Top = 154
              Width = 55
              Height = 13
              Caption = 'Salvo Size :'
            end
            object Label491: TLabel
              Left = 3
              Top = 60
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel104: TBevel
              Left = 40
              Top = 68
              Width = 260
              Height = 3
            end
            object Label492: TLabel
              Left = 3
              Top = 192
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel105: TBevel
              Left = 40
              Top = 200
              Width = 260
              Height = 3
            end
            object Label493: TLabel
              Left = 38
              Top = 208
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label495: TLabel
              Left = 22
              Top = 90
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Bevel106: TBevel
              Left = 40
              Top = 10
              Width = 260
              Height = 3
            end
            object btnBombTarget: TSpeedButton
              Left = 172
              Top = 85
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbBombDisplayRangeShow: TSpeedButton
              Left = 22
              Top = 225
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbBombDisplayRangeHide: TSpeedButton
              Left = 22
              Top = 249
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object editBombControlSalvo: TEdit
              Left = 104
              Top = 150
              Width = 62
              Height = 21
              TabOrder = 0
            end
            object btnBombDrop: TButton
              Left = 222
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Drop'
              TabOrder = 1
            end
            object editBombTargetTrack: TEdit
              Left = 104
              Top = 86
              Width = 62
              Height = 21
              TabOrder = 2
            end
          end
          object grbAirDroppedVECTAC: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 15
            ExplicitHeight = 835
            object Label367: TLabel
              Left = 3
              Top = 3
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel72: TBevel
              Left = 40
              Top = 10
              Width = 260
              Height = 3
            end
            object Label368: TLabel
              Left = 24
              Top = 33
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label369: TLabel
              Left = 3
              Top = 203
              Width = 76
              Height = 13
              Caption = 'Weapon Carrier'
            end
            object Bevel75: TBevel
              Left = 80
              Top = 210
              Width = 215
              Height = 3
            end
            object Label371: TLabel
              Left = 24
              Top = 230
              Width = 34
              Height = 13
              Caption = 'Name :'
            end
            object Label375: TLabel
              Left = 24
              Top = 261
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object Label376: TLabel
              Left = 24
              Top = 292
              Width = 82
              Height = 13
              Caption = 'Adviced Course :'
            end
            object Label377: TLabel
              Left = 24
              Top = 323
              Width = 91
              Height = 13
              Caption = 'Drop Point Offset :'
            end
            object Label378: TLabel
              Left = 24
              Top = 355
              Width = 57
              Height = 13
              Caption = 'Time to go :'
            end
            object Label379: TLabel
              Left = 3
              Top = 378
              Width = 40
              Height = 13
              Caption = 'Weapon'
            end
            object Bevel76: TBevel
              Left = 45
              Top = 386
              Width = 260
              Height = 3
            end
            object Label380: TLabel
              Left = 24
              Top = 408
              Width = 34
              Height = 13
              Caption = 'Name :'
            end
            object lbVectacWeaponCarrierAdviced: TLabel
              Left = 125
              Top = 292
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacWeaponCarrierTime: TLabel
              Left = 125
              Top = 355
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label383: TLabel
              Left = 185
              Top = 128
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label384: TLabel
              Left = 185
              Top = 261
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label385: TLabel
              Left = 185
              Top = 323
              Width = 14
              Height = 13
              Caption = 'nm'
            end
            object Label386: TLabel
              Left = 24
              Top = 56
              Width = 45
              Height = 13
              Caption = 'Identity :'
            end
            object Label387: TLabel
              Left = 24
              Top = 80
              Width = 83
              Height = 13
              Caption = 'Propulsion Type :'
            end
            object Label388: TLabel
              Left = 24
              Top = 104
              Width = 44
              Height = 13
              Caption = 'Doppler :'
            end
            object Label389: TLabel
              Left = 24
              Top = 128
              Width = 41
              Height = 13
              Caption = 'Course :'
            end
            object Label390: TLabel
              Left = 24
              Top = 152
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object Label391: TLabel
              Left = 24
              Top = 176
              Width = 36
              Height = 13
              Caption = 'Depth :'
            end
            object Label392: TLabel
              Left = 185
              Top = 152
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label393: TLabel
              Left = 185
              Top = 177
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label394: TLabel
              Left = 185
              Top = 292
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label395: TLabel
              Left = 185
              Top = 355
              Width = 30
              Height = 13
              Caption = 'mm:ss'
            end
            object Label396: TLabel
              Left = 24
              Top = 430
              Width = 62
              Height = 13
              Caption = 'Expiry Time :'
            end
            object lbVectacWeaponExpiry: TLabel
              Left = 129
              Top = 430
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label398: TLabel
              Left = 184
              Top = 430
              Width = 30
              Height = 13
              Caption = 'mm:ss'
            end
            object lbVectacTargetIdentity: TLabel
              Left = 125
              Top = 56
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacTargetPropulsion: TLabel
              Left = 125
              Top = 80
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacTargetDoppler: TLabel
              Left = 125
              Top = 104
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacTargetCourse: TLabel
              Left = 125
              Top = 128
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacTargetGround: TLabel
              Left = 125
              Top = 152
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbVectacTargetDepth: TLabel
              Left = 125
              Top = 176
              Width = 12
              Height = 13
              Caption = '---'
            end
            object btnVectacTargetTrack: TSpeedButton
              Left = 185
              Top = 28
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnVectacWeaponCarrierName: TSpeedButton
              Left = 299
              Top = 224
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnVectacWeaponName: TSpeedButton
              Left = 299
              Top = 403
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnVectacPlan: TButton
              Left = 3
              Top = 469
              Width = 80
              Height = 25
              Caption = 'Plan'
              TabOrder = 0
            end
            object btnVectacConfirm: TButton
              Left = 202
              Top = 469
              Width = 120
              Height = 25
              Caption = 'Confirm Weapon Drop'
              TabOrder = 1
            end
            object btnVectacCancel: TButton
              Left = 99
              Top = 469
              Width = 80
              Height = 25
              Caption = 'Cancel'
              TabOrder = 2
            end
            object editVectacTargetTrack: TEdit
              Left = 125
              Top = 29
              Width = 50
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object editVectacWeaponCarrierName: TEdit
              Left = 125
              Top = 226
              Width = 168
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object editVectacWeaponCarrierGround: TEdit
              Left = 125
              Top = 257
              Width = 50
              Height = 21
              Enabled = False
              TabOrder = 5
            end
            object editVectacWeaponCarrierDrop: TEdit
              Left = 125
              Top = 319
              Width = 50
              Height = 21
              Enabled = False
              TabOrder = 6
            end
            object btnVectacWeaponCarrierGround: TButton
              Left = 242
              Top = 255
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 7
            end
            object btnVectacWeaponCarrierDrop: TButton
              Left = 242
              Top = 317
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 8
            end
            object editVectacWeaponName: TEdit
              Left = 125
              Top = 404
              Width = 168
              Height = 21
              Enabled = False
              TabOrder = 9
              Text = '(none)'
            end
          end
          object grbAirDroppedTorpedo: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 9
            ExplicitHeight = 835
            object Label36: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object lblAirDroppedStatus: TLabel
              Left = 22
              Top = 25
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label53: TLabel
              Left = 130
              Top = 25
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblAirDroppedQuantity: TLabel
              Left = 195
              Top = 25
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label81: TLabel
              Left = 3
              Top = 158
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel11: TBevel
              Left = 41
              Top = 166
              Width = 260
              Height = 3
            end
            object Label82: TLabel
              Left = 24
              Top = 187
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label83: TLabel
              Left = 3
              Top = 383
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel12: TBevel
              Left = 39
              Top = 392
              Width = 260
              Height = 3
            end
            object Label84: TLabel
              Left = 45
              Top = 400
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label85: TLabel
              Left = 148
              Top = 400
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object Label86: TLabel
              Left = 23
              Top = 213
              Width = 34
              Height = 13
              Caption = 'Force :'
            end
            object lblAirDproppedTargetForce: TLabel
              Left = 130
              Top = 213
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Bevel13: TBevel
              Left = 40
              Top = 11
              Width = 260
              Height = 3
            end
            object Label89: TLabel
              Left = 3
              Top = 49
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel14: TBevel
              Left = 41
              Top = 60
              Width = 260
              Height = 3
            end
            object Label90: TLabel
              Left = 24
              Top = 78
              Width = 72
              Height = 13
              Caption = 'Search radius :'
            end
            object Label94: TLabel
              Left = 24
              Top = 106
              Width = 71
              Height = 13
              Caption = 'Search depth :'
            end
            object Label96: TLabel
              Left = 23
              Top = 135
              Width = 72
              Height = 13
              Caption = 'Search ceiling :'
            end
            object Label99: TLabel
              Left = 196
              Top = 78
              Width = 27
              Height = 13
              Caption = 'yards'
            end
            object Label100: TLabel
              Left = 196
              Top = 106
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label101: TLabel
              Left = 196
              Top = 135
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object btnAirDroppesTargetTrack: TSpeedButton
              Left = 187
              Top = 182
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object Label102: TLabel
              Left = 23
              Top = 237
              Width = 41
              Height = 13
              Caption = 'Course :'
            end
            object lblAirDproppedTargetCourse: TLabel
              Left = 130
              Top = 237
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label109: TLabel
              Left = 22
              Top = 261
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object lblAirDproppedTargetGroundSpeed: TLabel
              Left = 130
              Top = 261
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label111: TLabel
              Left = 22
              Top = 286
              Width = 36
              Height = 13
              Caption = 'Depth :'
            end
            object lblAirDproppedTargetDepth: TLabel
              Left = 130
              Top = 286
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label114: TLabel
              Left = 187
              Top = 237
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label115: TLabel
              Left = 187
              Top = 261
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label116: TLabel
              Left = 187
              Top = 286
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label113: TLabel
              Left = 3
              Top = 308
              Width = 73
              Height = 13
              Caption = 'Launch Bearing'
            end
            object Bevel15: TBevel
              Left = 82
              Top = 317
              Width = 222
              Height = 3
            end
            object Label117: TLabel
              Left = 24
              Top = 360
              Width = 43
              Height = 13
              Caption = 'Bearing :'
            end
            object Label118: TLabel
              Left = 196
              Top = 360
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object sbAirDroppesDisplayRangeShow: TSpeedButton
              Left = 24
              Top = 422
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbAirDroppesDisplayRangeHide: TSpeedButton
              Left = 24
              Top = 446
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbAirDroppesDisplayBilndZonesShow: TSpeedButton
              Left = 136
              Top = 422
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbAirDropeedBilndZonesHide: TSpeedButton
              Left = 136
              Top = 446
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object edtAirDroppedTargetTrack: TEdit
              Left = 130
              Top = 183
              Width = 53
              Height = 21
              TabOrder = 0
            end
            object btnAirDroppedLaunch: TButton
              Left = 242
              Top = 485
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 1
            end
            object edtAirDroppedControlSearchRadius: TEdit
              Left = 130
              Top = 74
              Width = 60
              Height = 21
              TabOrder = 2
            end
            object edtAirDroppedControlSearchDepth: TEdit
              Left = 130
              Top = 102
              Width = 60
              Height = 21
              TabOrder = 3
            end
            object edtAirDroppedControlSearchCeiling: TEdit
              Left = 130
              Top = 131
              Width = 60
              Height = 21
              TabOrder = 4
            end
            object btnDefaultAirDroppedControlSearchCeiling: TButton
              Left = 242
              Top = 129
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 5
            end
            object btnDefaultAirDroppedSearchDepth: TButton
              Left = 242
              Top = 98
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 6
            end
            object edtAirDroppedLaunchBearing: TEdit
              Left = 130
              Top = 356
              Width = 60
              Height = 21
              TabOrder = 7
            end
            object cbAirDroppedUseLaunchPlatformHeading: TCheckBox
              Left = 24
              Top = 335
              Width = 166
              Height = 17
              Caption = 'Use launch platform heading'
              TabOrder = 8
            end
            object btnPlanAirDroppedTorpedo: TButton
              Left = 13
              Top = 485
              Width = 80
              Height = 25
              Caption = 'Plan'
              TabOrder = 9
            end
            object btnCancelAirDroppedTorpedo: TButton
              Left = 99
              Top = 485
              Width = 80
              Height = 25
              Caption = 'Cancel'
              TabOrder = 10
            end
          end
          object grbAcousticTorpedo: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 11
            ExplicitHeight = 835
            object Label325: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object Bevel67: TBevel
              Left = 40
              Top = 10
              Width = 278
              Height = 3
            end
            object lblAcousticTorpedoStatus: TLabel
              Left = 25
              Top = 28
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label328: TLabel
              Left = 95
              Top = 28
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lblAcousticTorpedoQuantity: TLabel
              Left = 151
              Top = 28
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label330: TLabel
              Left = 3
              Top = 50
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel68: TBevel
              Left = 41
              Top = 57
              Width = 278
              Height = 3
            end
            object Label331: TLabel
              Left = 25
              Top = 79
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label332: TLabel
              Left = 3
              Top = 103
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel69: TBevel
              Left = 41
              Top = 110
              Width = 278
              Height = 3
            end
            object Label333: TLabel
              Left = 3
              Top = 344
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel70: TBevel
              Left = 43
              Top = 352
              Width = 190
              Height = 2
            end
            object Label336: TLabel
              Left = 25
              Top = 128
              Width = 31
              Height = 13
              Caption = 'Tube :'
            end
            object Label337: TLabel
              Left = 25
              Top = 154
              Width = 62
              Height = 13
              Caption = 'Firing Mode :'
            end
            object Label338: TLabel
              Left = 25
              Top = 180
              Width = 75
              Height = 13
              Caption = 'Run-out Mode :'
            end
            object Label339: TLabel
              Left = 25
              Top = 206
              Width = 75
              Height = 13
              Caption = 'Search Radius :'
            end
            object Label340: TLabel
              Left = 25
              Top = 233
              Width = 72
              Height = 13
              Caption = 'Search Depth :'
            end
            object Label341: TLabel
              Left = 25
              Top = 259
              Width = 73
              Height = 13
              Caption = 'Safety Ceiling :'
            end
            object Label342: TLabel
              Left = 25
              Top = 285
              Width = 74
              Height = 13
              Caption = 'Seeker Range :'
            end
            object Label343: TLabel
              Left = 25
              Top = 312
              Width = 60
              Height = 13
              Caption = 'Gyro Angle :'
            end
            object Label344: TLabel
              Left = 170
              Top = 201
              Width = 27
              Height = 13
              Caption = 'yards'
            end
            object Label345: TLabel
              Left = 171
              Top = 227
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label346: TLabel
              Left = 171
              Top = 254
              Width = 33
              Height = 13
              Caption = 'meters'
            end
            object Label347: TLabel
              Left = 171
              Top = 280
              Width = 27
              Height = 13
              Caption = 'yards'
            end
            object btnControlComboFiringMode: TSpeedButton
              Left = 171
              Top = 148
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnControlComboRunOut: TSpeedButton
              Left = 171
              Top = 174
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object btnControlComboGyro: TSpeedButton
              Left = 173
              Top = 307
              Width = 23
              Height = 22
              Glyph.Data = {
                D6050000424DD605000000000000360000002800000017000000140000000100
                180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
                0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object Label21: TLabel
              Left = 48
              Top = 370
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object btnSearchTarget: TSpeedButton
              Left = 143
              Top = 74
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object Label39: TLabel
              Left = 161
              Top = 373
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object sbAccousticDisplayRangeShow: TSpeedButton
              Left = 25
              Top = 393
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbAccousticDisplayRangeHide: TSpeedButton
              Left = 25
              Top = 417
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbDisplayBlindZonesShow: TSpeedButton
              Left = 149
              Top = 393
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbDisplayBlindZonesHide: TSpeedButton
              Left = 149
              Top = 417
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object editTargetTrack: TEdit
              Left = 85
              Top = 75
              Width = 52
              Height = 21
              TabOrder = 0
              Text = '---'
            end
            object btnAcousticTorpedoPlan: TButton
              Left = 3
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Plan'
              TabOrder = 1
            end
            object btnAcousticTorpedoLaunch: TButton
              Left = 236
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 2
            end
            object btnAcousticTorpedoCancel: TButton
              Left = 89
              Top = 470
              Width = 80
              Height = 25
              Caption = 'Cancel'
              TabOrder = 3
            end
            object editControlFiring: TEdit
              Left = 103
              Top = 148
              Width = 62
              Height = 21
              TabOrder = 4
            end
            object editControlRunOut: TEdit
              Left = 103
              Top = 175
              Width = 62
              Height = 21
              TabOrder = 5
            end
            object editControlSearchRadius: TEdit
              Left = 103
              Top = 201
              Width = 38
              Height = 21
              TabOrder = 6
            end
            object editControlSearchDepth: TEdit
              Left = 103
              Top = 228
              Width = 38
              Height = 21
              TabOrder = 7
            end
            object editControlSafety: TEdit
              Left = 103
              Top = 254
              Width = 38
              Height = 21
              TabOrder = 8
            end
            object edittControlSeeker: TEdit
              Left = 103
              Top = 281
              Width = 38
              Height = 21
              TabOrder = 9
            end
            object editControlGyro: TEdit
              Left = 103
              Top = 308
              Width = 38
              Height = 21
              TabOrder = 10
            end
            object btnControlControlRunAdvised: TButton
              Left = 236
              Top = 174
              Width = 80
              Height = 25
              Caption = '< Advised'
              TabOrder = 11
            end
            object btnControlSearchRadius: TButton
              Left = 236
              Top = 200
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 12
            end
            object btnControlSearchDepth: TButton
              Left = 236
              Top = 226
              Width = 80
              Height = 25
              Caption = '< Advised'
              TabOrder = 13
            end
            object btnControlSafety: TButton
              Left = 236
              Top = 252
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 14
            end
            object btnControlSeeker: TButton
              Left = 236
              Top = 278
              Width = 80
              Height = 25
              Caption = '< Default'
              TabOrder = 15
            end
            object btntControlGyroAdvised: TButton
              Left = 236
              Top = 305
              Width = 80
              Height = 25
              Caption = '< Advised'
              TabOrder = 16
            end
            object btnControlTube1: TButton
              Left = 103
              Top = 122
              Width = 24
              Height = 24
              Caption = '1'
              TabOrder = 17
            end
            object btnControlTube2: TButton
              Left = 125
              Top = 122
              Width = 24
              Height = 24
              Caption = '2'
              TabOrder = 18
            end
            object btnControlTube3: TButton
              Left = 146
              Top = 122
              Width = 24
              Height = 24
              Caption = '3'
              TabOrder = 19
            end
            object btnControlTube4: TButton
              Left = 168
              Top = 122
              Width = 24
              Height = 24
              Caption = '4'
              TabOrder = 20
            end
            object btnTargetDetails: TButton
              Left = 236
              Top = 73
              Width = 80
              Height = 25
              Caption = 'Details...'
              TabOrder = 21
            end
          end
          object grbSurfaceToAirMissile: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 10
            ExplicitHeight = 835
            object Label269: TLabel
              Left = 3
              Top = 3
              Width = 31
              Height = 13
              Caption = 'Status'
            end
            object Bevel54: TBevel
              Left = 40
              Top = 10
              Width = 260
              Height = 3
            end
            object lblSurfaceToAirStatus: TLabel
              Left = 23
              Top = 30
              Width = 43
              Height = 13
              Caption = 'Available'
            end
            object Label271: TLabel
              Left = 126
              Top = 30
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object lbSurfaceToAirStatusQuantity: TLabel
              Left = 182
              Top = 30
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label273: TLabel
              Left = 2
              Top = 59
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Bevel55: TBevel
              Left = 39
              Top = 66
              Width = 190
              Height = 2
            end
            object Label274: TLabel
              Left = 25
              Top = 86
              Width = 54
              Height = 13
              Caption = 'Salvo size :'
            end
            object Label275: TLabel
              Left = 3
              Top = 112
              Width = 32
              Height = 13
              Caption = 'Target'
            end
            object Bevel56: TBevel
              Left = 40
              Top = 119
              Width = 260
              Height = 3
            end
            object Label276: TLabel
              Left = 24
              Top = 132
              Width = 33
              Height = 13
              Caption = 'Track :'
            end
            object Label277: TLabel
              Left = 24
              Top = 156
              Width = 41
              Height = 13
              Caption = 'Course :'
            end
            object Label278: TLabel
              Left = 24
              Top = 180
              Width = 75
              Height = 13
              Caption = 'Ground Speed :'
            end
            object Label279: TLabel
              Left = 24
              Top = 204
              Width = 44
              Height = 13
              Caption = 'Altitude :'
            end
            object Label280: TLabel
              Left = 24
              Top = 229
              Width = 41
              Height = 13
              Caption = 'Priority :'
            end
            object Label281: TLabel
              Left = 24
              Top = 253
              Width = 38
              Height = 13
              Caption = 'Status :'
            end
            object Label282: TLabel
              Left = 24
              Top = 277
              Width = 65
              Height = 13
              Caption = 'Time to wait :'
            end
            object Label283: TLabel
              Left = 23
              Top = 302
              Width = 88
              Height = 13
              Caption = 'Time to intercept :'
            end
            object Label284: TLabel
              Left = 3
              Top = 333
              Width = 34
              Height = 13
              Caption = 'Display'
            end
            object Bevel57: TBevel
              Left = 40
              Top = 341
              Width = 260
              Height = 3
            end
            object Label285: TLabel
              Left = 43
              Top = 349
              Width = 31
              Height = 13
              Caption = 'Range'
            end
            object Label286: TLabel
              Left = 150
              Top = 349
              Width = 54
              Height = 13
              Caption = 'Blind Zones'
            end
            object lbSurfaceToAirCourse: TLabel
              Left = 126
              Top = 156
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbSurfaceToAirGround: TLabel
              Left = 126
              Top = 179
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbSurfaceToAirAltitude: TLabel
              Left = 126
              Top = 204
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbSurfaceToAirStatus: TLabel
              Left = 126
              Top = 253
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbSurfaceToAirTimeToWait: TLabel
              Left = 126
              Top = 277
              Width = 12
              Height = 13
              Caption = '---'
            end
            object lbSurfaceToAirTimeToIntercept: TLabel
              Left = 126
              Top = 302
              Width = 12
              Height = 13
              Caption = '---'
            end
            object Label311: TLabel
              Left = 172
              Top = 156
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label312: TLabel
              Left = 172
              Top = 179
              Width = 26
              Height = 13
              Caption = 'knots'
            end
            object Label313: TLabel
              Left = 172
              Top = 204
              Width = 20
              Height = 13
              Caption = 'feet'
            end
            object Label316: TLabel
              Left = 172
              Top = 277
              Width = 30
              Height = 13
              Caption = 'mm:ss'
            end
            object Label317: TLabel
              Left = 172
              Top = 302
              Width = 30
              Height = 13
              Caption = 'mm:ss'
            end
            object btnSurfaceToAirTargetTrack: TSpeedButton
              Left = 172
              Top = 129
              Width = 23
              Height = 22
              Glyph.Data = {
                36090000424D360900000000000036000000280000001F000000180000000100
                18000000000000090000000000000000000000000000000000006161613E3E3E
                3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
                3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
                41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
                7474747F7F7F7878787777778080808080807878787878788080807474747C7C
                7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
                80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
                491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
                5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
                86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
                13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
                27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
                B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
                BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
                53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
                58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
                25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
                25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
                53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
                0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
                B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
                9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
                94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
                6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
                39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
                A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
                B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            end
            object sbSurfaceToAirDisplayRangeShow: TSpeedButton
              Left = 23
              Top = 368
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Show'
            end
            object sbSurfaceToAirDisplayRangeHide: TSpeedButton
              Left = 23
              Top = 392
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Hide'
            end
            object sbSurfaceToAirDisplayBlindShow: TSpeedButton
              Left = 138
              Top = 368
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Show'
            end
            object sbSurfaceToAirDisplayBlindHide: TSpeedButton
              Left = 138
              Top = 392
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Hide'
            end
            object ediSurfaceToAirSalvo: TEdit
              Left = 126
              Top = 82
              Width = 70
              Height = 21
              TabOrder = 0
            end
            object editSurfaceToAirTrack: TEdit
              Left = 126
              Top = 129
              Width = 39
              Height = 21
              ReadOnly = True
              TabOrder = 1
            end
            object btSurfaceToAirPlan: TButton
              Left = 3
              Top = 468
              Width = 80
              Height = 25
              Caption = 'Plan'
              TabOrder = 2
            end
            object btSurfaceToAirLaunch: TButton
              Left = 242
              Top = 468
              Width = 80
              Height = 25
              Caption = 'Launch'
              TabOrder = 3
            end
            object btSurfaceToAirCancel: TButton
              Left = 89
              Top = 468
              Width = 80
              Height = 25
              Caption = 'Cancel'
              TabOrder = 4
            end
          end
          object grbGunEngagementCIWS: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 854
            Align = alClient
            TabOrder = 2
            ExplicitHeight = 835
            object ScrollBox8: TScrollBox
              Left = 2
              Top = 15
              Width = 325
              Height = 837
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
              ExplicitHeight = 818
              object Label468: TLabel
                Left = 3
                Top = 3
                Width = 31
                Height = 13
                Caption = 'Status'
              end
              object lblCIWSStatus: TLabel
                Left = 35
                Top = 31
                Width = 43
                Height = 13
                Caption = 'Available'
              end
              object Label474: TLabel
                Left = 108
                Top = 31
                Width = 49
                Height = 13
                Caption = 'Quantity :'
              end
              object lbCIWSQuantity: TLabel
                Left = 164
                Top = 31
                Width = 12
                Height = 13
                Caption = '---'
              end
              object Label477: TLabel
                Left = 3
                Top = 64
                Width = 35
                Height = 13
                Caption = 'Control'
              end
              object Bevel99: TBevel
=======
            inherited grbIFFInterrogatorControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel34: TBevel
>>>>>>> 1.38
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label210: TLabel
                Left = 33
                Top = 20
                ExplicitLeft = 33
                ExplicitTop = 20
              end
              inherited Label211: TLabel
                Top = 143
                ExplicitTop = 143
              end
              inherited Bevel35: TBevel
                Left = 98
                Top = 150
                Width = 185
                ExplicitLeft = 98
                ExplicitTop = 150
                ExplicitWidth = 185
              end
              inherited Label212: TLabel
                Top = 84
                ExplicitTop = 84
              end
              inherited Bevel36: TBevel
                Left = 33
                Top = 91
                Width = 246
                ExplicitLeft = 33
                ExplicitTop = 91
                ExplicitWidth = 246
              end
              inherited btnbtnIFFInterrogatorTrackSearch: TSpeedButton
                Left = 89
                Top = 102
                Width = 22
                Height = 21
                ExplicitLeft = 89
                ExplicitTop = 102
                ExplicitWidth = 22
                ExplicitHeight = 21
              end
              inherited sbIFFInterrogatorControlModeOn: TSpeedButton
                Left = 11
                Top = 37
                Width = 71
                Height = 21
                ExplicitLeft = 11
                ExplicitTop = 37
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbIFFInterrogatorControlModeOff: TSpeedButton
                Left = 11
                Top = 56
                Width = 71
                Height = 20
                ExplicitLeft = 11
                ExplicitTop = 56
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited cbbtnIFFInterrogatorMode1: TCheckBox
                Left = 13
                Top = 167
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 167
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbbtnIFFInterrogatorMode2: TCheckBox
                Left = 13
                Top = 196
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 196
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbbtnIFFInterrogatorMode3: TCheckBox
                Left = 13
                Top = 225
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 225
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited cbbtnIFFInterrogatorMode3C: TCheckBox
                Left = 13
                Top = 254
                Width = 53
                Height = 15
                ExplicitLeft = 13
                ExplicitTop = 254
                ExplicitWidth = 53
                ExplicitHeight = 15
              end
              inherited cbbtnIFFInterrogatorMode4: TCheckBox
                Left = 13
                Top = 282
                Width = 53
                Height = 16
                ExplicitLeft = 13
                ExplicitTop = 282
                ExplicitWidth = 53
                ExplicitHeight = 16
              end
              inherited edtIFFInterrogatorMode1: TEdit
                Left = 82
                Top = 165
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 165
                ExplicitWidth = 79
              end
              inherited edtIFFInterrogatorMode2: TEdit
                Left = 82
                Top = 194
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 194
                ExplicitWidth = 79
              end
              inherited edtIFFInterrogatorMode3: TEdit
                Left = 82
                Top = 223
                Width = 79
                ExplicitLeft = 82
                ExplicitTop = 223
                ExplicitWidth = 79
              end
              inherited editbtnIFFInterrogatorTrack: TEdit
                Left = 13
                Top = 103
                Width = 68
                ExplicitLeft = 13
                ExplicitTop = 103
                ExplicitWidth = 68
              end
            end
            inherited grbSonobuoyControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel44: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited lblStatusSonobuoy: TLabel
                Left = 33
                Top = 20
                ExplicitLeft = 33
                ExplicitTop = 20
              end
              inherited Label243: TLabel
                Left = 33
                Top = 67
                ExplicitLeft = 33
                ExplicitTop = 67
              end
              inherited Label244: TLabel
                Left = 99
                Top = 20
                ExplicitLeft = 99
                ExplicitTop = 20
              end
              inherited lbStatusQuantity: TLabel
                Left = 150
                Top = 20
                ExplicitLeft = 150
                ExplicitTop = 20
              end
              inherited Label242: TLabel
                Top = 46
                ExplicitTop = 46
              end
              inherited Bevel45: TBevel
                Left = 42
                Top = 52
                Width = 241
                ExplicitLeft = 42
                ExplicitTop = 52
                ExplicitWidth = 241
              end
              inherited Label246: TLabel
                Left = 33
                Top = 96
                ExplicitLeft = 33
                ExplicitTop = 96
              end
              inherited Label247: TLabel
                Left = 148
                Top = 96
                ExplicitLeft = 148
                ExplicitTop = 96
              end
              inherited Label248: TLabel
                Top = 150
                ExplicitTop = 150
              end
              inherited Bevel46: TBevel
                Left = 38
                Top = 157
                Width = 242
                ExplicitLeft = 38
                ExplicitTop = 157
                ExplicitWidth = 242
              end
              inherited Label249: TLabel
                Left = 33
                Top = 173
                ExplicitLeft = 33
                ExplicitTop = 173
              end
              inherited Label250: TLabel
                Left = 33
                Top = 200
                ExplicitLeft = 33
                ExplicitTop = 200
              end
              inherited lblSonobuoyMonitorCurrently: TLabel
                Left = 176
                Top = 200
                ExplicitLeft = 176
                ExplicitTop = 200
              end
              inherited lblSonobuoyMonitorPlatform: TLabel
                Left = 175
                Top = 173
                ExplicitLeft = 175
                ExplicitTop = 173
              end
              inherited Label253: TLabel
                Left = 193
                Top = 173
                ExplicitLeft = 193
                ExplicitTop = 173
              end
              inherited Label254: TLabel
                Left = 193
                Top = 200
                ExplicitLeft = 193
                ExplicitTop = 200
              end
              inherited btnSonobuoyControlCombo: TSpeedButton
                Left = 260
                Top = 62
                Width = 21
                Height = 21
                ExplicitLeft = 260
                ExplicitTop = 62
                ExplicitWidth = 21
                ExplicitHeight = 21
              end
              inherited editControlMode: TEdit
                Left = 74
                Top = 63
                Width = 180
                ExplicitLeft = 74
                ExplicitTop = 63
                ExplicitWidth = 180
              end
              inherited editControlDepth: TEdit
                Left = 74
                Top = 92
                Width = 68
                ExplicitLeft = 74
                ExplicitTop = 92
                ExplicitWidth = 68
              end
              inherited btnSonobuoyControlDeploy: TButton
                Left = 212
                Top = 124
                Width = 69
                Height = 24
                ExplicitLeft = 212
                ExplicitTop = 124
                ExplicitWidth = 69
                ExplicitHeight = 24
              end
            end
            inherited grbESMSensorControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited Bevel38: TBevel
                Left = 40
                Top = 9
                Width = 241
                ExplicitLeft = 40
                ExplicitTop = 9
                ExplicitWidth = 241
              end
              inherited Label218: TLabel
                Left = 33
                Top = 20
                ExplicitLeft = 33
                ExplicitTop = 20
              end
              inherited Label219: TLabel
                Top = 84
                ExplicitTop = 84
              end
              inherited Bevel40: TBevel
                Left = 42
                Top = 90
                Width = 241
                ExplicitLeft = 42
                ExplicitTop = 90
                ExplicitWidth = 241
              end
              inherited Label220: TLabel
                Left = 23
                Top = 107
                ExplicitLeft = 23
                ExplicitTop = 107
              end
              inherited sbESMSensorControlModeOn: TSpeedButton
                Left = 13
                Top = 37
                Width = 71
                Height = 21
                ExplicitLeft = 13
                ExplicitTop = 37
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
              inherited sbESMSensorControlModeOff: TSpeedButton
                Left = 13
                Top = 56
                Width = 71
                Height = 20
                ExplicitLeft = 13
                ExplicitTop = 56
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited sbESMSensorDisplayBlindZoneShow: TSpeedButton
                Left = 13
                Top = 120
                Width = 71
                Height = 20
                ExplicitLeft = 13
                ExplicitTop = 120
                ExplicitWidth = 71
                ExplicitHeight = 20
              end
              inherited sbESMSensorDisplayBlindZoneHide: TSpeedButton
                Left = 13
                Top = 138
                Width = 71
                Height = 21
                ExplicitLeft = 13
                ExplicitTop = 138
                ExplicitWidth = 71
                ExplicitHeight = 21
              end
            end
            inherited grbSonarControl: TGroupBox
              Width = 323
              Height = 288
              ExplicitWidth = 323
              ExplicitHeight = 306
              inherited ScrollBox2: TScrollBox
                Width = 319
                Height = 271
                VertScrollBar.Position = 30
                ExplicitWidth = 319
                ExplicitHeight = 289
                inherited Bevel37: TBevel
                  Left = 41
                  Top = -26
                  Width = 243
                  ExplicitLeft = 41
                  ExplicitTop = -26
                  ExplicitWidth = 243
                end
                inherited Bevel39: TBevel
                  Left = 60
                  Top = 69
                  Width = 228
                  ExplicitLeft = 60
                  ExplicitTop = 99
                  ExplicitWidth = 228
                end
                inherited Bevel41: TBevel
                  Left = 188
                  Top = 86
                  Width = 97
                  ExplicitLeft = 188
                  ExplicitTop = 116
                  ExplicitWidth = 97
                end
                inherited Bevel42: TBevel
                  Left = 158
                  Top = 150
                  Width = 130
                  ExplicitLeft = 158
                  ExplicitTop = 180
                  ExplicitWidth = 130
                end
                inherited Bevel43: TBevel
                  Left = 42
                  Top = 224
                  Width = 246
                  ExplicitLeft = 42
                  ExplicitTop = 254
                  ExplicitWidth = 246
                end
                inherited Label213: TLabel
                  Top = -32
                  ExplicitTop = -32
                end
                inherited Label214: TLabel
                  Left = 40
                  Top = -21
                  ExplicitLeft = 40
                  ExplicitTop = 9
                end
                inherited Label215: TLabel
                  Left = 40
                  Top = 80
                  ExplicitLeft = 40
                  ExplicitTop = 110
                end
                inherited Label216: TLabel
                  ExplicitTop = 92
                end
                inherited Label221: TLabel
                  Left = 123
                  Top = 102
                  ExplicitLeft = 123
                  ExplicitTop = 132
                end
                inherited Label222: TLabel
                  Left = 123
                  Top = 123
                  ExplicitLeft = 123
                  ExplicitTop = 153
                end
                inherited Label223: TLabel
                  Left = 232
                  Top = 102
                  ExplicitLeft = 232
                  ExplicitTop = 132
                end
                inherited Label224: TLabel
                  Left = 232
                  Top = 123
                  ExplicitLeft = 232
                  ExplicitTop = 153
                end
                inherited Label226: TLabel
                  Left = 20
                  Top = 145
                  ExplicitLeft = 20
                  ExplicitTop = 175
                end
                inherited Label228: TLabel
                  Left = 123
                  Top = 163
                  ExplicitLeft = 123
                  ExplicitTop = 193
                end
                inherited Label229: TLabel
                  Left = 123
                  Top = 182
                  ExplicitLeft = 123
                  ExplicitTop = 212
                end
                inherited Label232: TLabel
                  Left = 232
                  Top = 163
                  ExplicitLeft = 232
                  ExplicitTop = 193
                end
                inherited Label233: TLabel
                  Left = 232
                  Top = 182
                  ExplicitLeft = 232
                  ExplicitTop = 212
                end
                inherited Label234: TLabel
                  Left = 123
                  Top = 199
                  ExplicitLeft = 123
                  ExplicitTop = 229
                end
                inherited Label236: TLabel
                  Left = 232
                  Top = 199
                  ExplicitLeft = 232
                  ExplicitTop = 229
                end
                inherited Label237: TLabel
                  Top = 217
                  ExplicitTop = 247
                end
                inherited Label238: TLabel
                  Left = 40
                  Top = 235
                  ExplicitLeft = 40
                  ExplicitTop = 265
                end
                inherited Label239: TLabel
                  Left = 135
                  Top = 235
                  ExplicitLeft = 135
                  ExplicitTop = 265
                end
                inherited LabelCablePayout: TLabel
                  Left = 123
                  Top = 80
                  ExplicitLeft = 123
                  ExplicitTop = 110
                end
                inherited LabelDepth: TLabel
                  Left = 123
                  Top = 145
                  ExplicitLeft = 123
                  ExplicitTop = 175
                end
                inherited lbCableActual: TLabel
                  Left = 174
                  Top = 123
                  ExplicitLeft = 174
                  ExplicitTop = 153
                end
                inherited lbDepthActual: TLabel
                  Left = 197
                  Top = 182
                  ExplicitLeft = 197
                  ExplicitTop = 212
                end
                inherited lbDepthSettled: TLabel
                  Left = 197
                  Top = 163
                  ExplicitLeft = 197
                  ExplicitTop = 193
                end
                inherited lbDepthTow: TLabel
                  Left = 197
                  Top = 199
                  ExplicitLeft = 197
                  ExplicitTop = 229
                end
                inherited lblStatusDeployment: TLabel
                  Left = 58
                  Top = 145
                  ExplicitLeft = 58
                  ExplicitTop = 175
                end
                inherited sbDeploymentActiondeploy: TSpeedButton
                  Left = 20
                  Top = 97
                  Width = 71
                  Height = 21
                  ExplicitLeft = 20
                  ExplicitTop = 127
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbDeploymentActionShow: TSpeedButton
                  Left = 20
                  Top = 116
                  Width = 71
                  Height = 20
                  ExplicitLeft = 20
                  ExplicitTop = 146
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbDisplayBlindHide: TSpeedButton
                  Left = 124
                  Top = 268
                  Width = 70
                  Height = 21
                  ExplicitLeft = 124
                  ExplicitTop = 298
                  ExplicitWidth = 70
                  ExplicitHeight = 21
                end
                inherited sbDisplayBlindShow: TSpeedButton
                  Left = 124
                  Top = 249
                  Width = 70
                  Height = 20
                  ExplicitLeft = 124
                  ExplicitTop = 279
                  ExplicitWidth = 70
                  ExplicitHeight = 20
                end
                inherited sbDisplayRangeHide: TSpeedButton
                  Left = 24
                  Top = 268
                  Width = 71
                  Height = 21
                  ExplicitLeft = 24
                  ExplicitTop = 298
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbDisplayRangeShow: TSpeedButton
                  Left = 24
                  Top = 249
                  Width = 71
                  Height = 20
                  ExplicitLeft = 24
                  ExplicitTop = 279
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbSonarControlModeActive: TSpeedButton
                  Left = 20
                  Top = -3
                  Width = 71
                  Height = 20
                  ExplicitLeft = 20
                  ExplicitTop = 27
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited sbSonarControlModeOff: TSpeedButton
                  Left = 20
                  Top = 33
                  Width = 71
                  Height = 21
                  ExplicitLeft = 20
                  ExplicitTop = 63
                  ExplicitWidth = 71
                  ExplicitHeight = 21
                end
                inherited sbSonarControlModePassive: TSpeedButton
                  Left = 20
                  Top = 16
                  Width = 71
                  Height = 20
                  ExplicitLeft = 20
                  ExplicitTop = 46
                  ExplicitWidth = 71
                  ExplicitHeight = 20
                end
                inherited editCableOrdered: TEdit
                  Left = 174
                  Top = 98
                  Width = 38
                  ExplicitLeft = 174
                  ExplicitTop = 98
                  ExplicitWidth = 38
                end
              end
            end
          end
<<<<<<< ufTacticalDisplay.dfm
        end
        object PanelWeaponChoices: TPanel
          Left = 0
          Top = 0
          Width = 329
          Height = 22
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object btnWeapon: TSpeedButton
            Tag = 1
            Left = 304
            Top = 0
            Width = 23
            Height = 22
            Glyph.Data = {
              D6050000424DD605000000000000360000002800000017000000140000000100
              180000000000A005000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C1C1C1B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              000000000000000000000000C1C1C1B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000000000000000000000000000000000000000000000000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2000000000000000000000000000000000000000000000000B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000000000000000B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000000000000000000000
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200000000
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B200
              0000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
              B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
            PopupMenu = pmGuidance
            OnClick = btnWeaponClick
          end
          object edtWeaponName: TEdit
            Left = 6
            Top = 1
            Width = 294
            Height = 21
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 0
          end
        end
        object PanelWeaponSpace: TPanel
          Left = 0
          Top = 22
          Width = 329
          Height = 12
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
        end
      end
      object tsECM: TTabSheet
        ImageIndex = 4
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object PanelCounterMeasureChoice: TPanel
          Left = 0
          Top = 0
          Width = 329
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          object lvECM: TListView
            Left = 0
            Top = 0
            Width = 329
            Height = 100
            Align = alClient
            Columns = <
              item
                Caption = 'Name'
                Width = 150
              end
              item
                Caption = 'Status'
                Width = 60
              end>
            TabOrder = 0
            ViewStyle = vsReport
            OnSelectItem = lvECMSelectItem
          end
        end
        object PanelCounterMeasureSpace: TPanel
          Left = 0
          Top = 100
          Width = 329
          Height = 15
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
        end
        object PanelCounterMeasure: TPanel
          Left = 0
          Top = 115
          Width = 329
          Height = 773
          Align = alClient
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          ExplicitHeight = 754
          object grbOnBoardSelfDefenseJammer: TGroupBox
            Left = 0
            Top = 0
            Width = 329
            Height = 773
            Align = alClient
            TabOrder = 1
            ExplicitHeight = 754
            object Label542: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Label543: TLabel
              Left = 155
              Top = 24
              Width = 46
              Height = 13
              Caption = 'Targeting'
            end
            object Label544: TLabel
              Left = 53
              Top = 24
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object Bevel112: TBevel
              Left = 41
              Top = 10
              Width = 260
              Height = 3
            end
            object Label546: TLabel
              Left = 28
              Top = 169
              Width = 69
              Height = 13
              Caption = 'Spot Number :'
            end
            object Label547: TLabel
              Left = 28
              Top = 144
              Width = 43
              Height = 13
              Caption = 'Bearing :'
            end
            object Label549: TLabel
              Left = 172
              Top = 144
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton
              Left = 28
              Top = 43
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Automatic'
            end
            object sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton
              Left = 28
              Top = 66
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Manual'
            end
            object sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton
              Left = 140
              Top = 43
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Spot'
            end
            object sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton
              Left = 140
              Top = 68
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Track'
            end
            object sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton
              Left = 28
              Top = 89
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Off'
            end
            object edtOnBoardSelfDefenseJammerBearing: TEdit
              Left = 103
              Top = 142
              Width = 63
              Height = 21
              TabOrder = 0
              Text = '000'
            end
            object edtOnBoardSelfDefenseJammerSpotNumber: TEdit
              Left = 103
              Top = 166
              Width = 63
              Height = 21
              TabOrder = 1
              Text = '---'
            end
          end
          object grbTowedJammerDecoy: TGroupBox
            Left = 0
            Top = 241
            Width = 329
            Height = 495
            TabOrder = 2
            object Label501: TLabel
              Left = 3
              Top = 3
              Width = 35
              Height = 13
              Caption = 'Control'
            end
            object Label503: TLabel
              Left = 45
              Top = 22
              Width = 26
              Height = 13
              Caption = 'Mode'
            end
            object Label506: TLabel
              Left = 18
              Top = 131
              Width = 43
              Height = 13
              Caption = 'Bearing :'
            end
            object Bevel111: TBevel
              Left = 44
              Top = 10
              Width = 260
              Height = 3
            end
            object Label504: TLabel
              Left = 18
              Top = 154
              Width = 69
              Height = 13
              Caption = 'Spot Number :'
            end
            object Label559: TLabel
              Left = 3
              Top = 188
              Width = 57
              Height = 13
              Caption = 'Deployment'
            end
            object Bevel118: TBevel
              Left = 60
              Top = 195
              Width = 245
              Height = 3
            end
            object Label505: TLabel
              Left = 150
              Top = 19
              Width = 46
              Height = 13
              Caption = 'Targeting'
            end
            object Label507: TLabel
              Left = 189
              Top = 133
              Width = 48
              Height = 13
              Caption = 'degrees T'
            end
            object Label508: TLabel
              Left = 41
              Top = 212
              Width = 30
              Height = 13
              Caption = 'Action'
            end
            object Label509: TLabel
              Left = 130
              Top = 212
              Width = 49
              Height = 13
              Caption = 'Quantity :'
            end
            object Label512: TLabel
              Left = 130
              Top = 235
              Width = 56
              Height = 13
              Caption = 'Tow Length'
            end
            object Label560: TLabel
              Left = 130
              Top = 259
              Width = 47
              Height = 13
              Caption = 'Ordered :'
            end
            object Label561: TLabel
              Left = 130
              Top = 283
              Width = 37
              Height = 13
              Caption = 'Actual :'
            end
            object Bevel109: TBevel
              Left = 212
              Top = 241
              Width = 90
              Height = 2
            end
            object lblTowedJammerDecoyActual: TLabel
              Left = 212
              Top = 283
              Width = 12
              Height = 13
              Caption = '75'
            end
            object Label563: TLabel
              Left = 260
              Top = 283
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object Label564: TLabel
              Left = 260
              Top = 259
              Width = 33
              Height = 13
              Caption = 'metres'
            end
            object lblTowedJammerDecoyQuantity: TLabel
              Left = 212
              Top = 212
              Width = 6
              Height = 13
              Caption = '1'
            end
            object sbTowedJammerDecoyModeAuto: TSpeedButton
              Left = 18
              Top = 34
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Automatic'
            end
            object sbTowedJammerDecoyModeManual: TSpeedButton
              Left = 18
              Top = 57
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Down = True
              Caption = 'Manual'
            end
            object sbTowedJammerDecoyActionDeploy: TSpeedButton
              Left = 18
              Top = 228
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 3
              Down = True
              Caption = 'Deploy'
            end
            object sbTowedJammerDecoyActionStow: TSpeedButton
              Left = 18
              Top = 253
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 3
              Caption = 'Stow'
            end
            object sbTowedJammerDecoyTargetingSpot: TSpeedButton
              Left = 130
              Top = 34
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Down = True
              Caption = 'Spot'
            end
            object sbTowedJammerDecoyTargetingTrack: TSpeedButton
              Left = 130
              Top = 59
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 2
              Caption = 'Track'
            end
            object sbTowedJammerDecoyModeOff: TSpeedButton
              Left = 18
              Top = 80
              Width = 80
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Caption = 'Off'
            end
            object edtTowedJammerDecoyBearing: TEdit
              Left = 93
              Top = 131
              Width = 88
              Height = 21
              TabOrder = 0
              Text = '000'
            end
            object edtTowedJammerDecoySpotNumb: TEdit
              Left = 93
              Top = 155
              Width = 88
              Height = 21
              TabOrder = 1
              Text = '---'
            end
            object editTowedJammerDecoyOrdered: TEdit
              Left = 212
              Top = 255
              Width = 40
              Height = 21
              TabOrder = 2
              Text = '775'
            end
          end
          object grbFloatingDecoy: TGroupBox
            Left = 0
            Top = 0
=======
          inherited PanelSpace: TPanel
            Top = 111
>>>>>>> 1.38
            Width = 329
            ExplicitTop = 111
            ExplicitWidth = 329
          end
        end
      end
      object tsWeapon: TTabSheet
        ImageIndex = 3
        ExplicitHeight = 428
        inline fmWeapon1: TfmWeapon
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited PanelTacticalWeapons: TPanel
            Width = 329
            Height = 388
            ExplicitWidth = 329
            ExplicitHeight = 406
            inherited grbWakeHomingTorpedos: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbWireGuidedTorpedo: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbTacticalMissiles: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbTacticalAcousticTorpedos: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbStraightRunningTorpedos: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbMines: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbHybridMissile: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbBombDepthCharge: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbAirDroppedVECTAC: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbAirDroppedTorpedo: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbAcousticTorpedo: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbSurfaceToAirMissile: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
            end
            inherited grbGunEngagementChaffMode: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
              inherited ScrollBox9: TScrollBox
                Width = 325
                Height = 371
                ExplicitWidth = 325
                ExplicitHeight = 389
              end
            end
            inherited grbGunEngagementAutomaticManualMode: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
              inherited ScrollBox7: TScrollBox
                Width = 325
                Height = 371
                ExplicitWidth = 325
                ExplicitHeight = 389
                inherited btnTargetSearch: TSpeedButton
                  OnClick = fmWeapon1btnTargetSearchClick
                end
              end
            end
            inherited grbGunEngagementCIWS: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
              inherited ScrollBox8: TScrollBox
                Width = 325
                Height = 371
                ExplicitWidth = 325
                ExplicitHeight = 389
              end
            end
            inherited grbSurfaceToSurfaceMissile: TGroupBox
              Width = 329
              Height = 388
              ExplicitWidth = 329
              ExplicitHeight = 406
              inherited ScrollBox6: TScrollBox
                Width = 325
                Height = 371
                VertScrollBar.Position = 73
                ExplicitWidth = 325
                ExplicitHeight = 389
                inherited Label67: TLabel
                  Top = -74
                  ExplicitTop = -74
                end
                inherited Bevel29: TBevel
                  Top = -67
                  ExplicitTop = -67
                end
                inherited lblSurfaceToSurfaceMissileStatus: TLabel
                  Top = -47
                  ExplicitTop = -47
                end
                inherited Label69: TLabel
                  Top = -47
                  ExplicitTop = -47
                end
                inherited lbSurfaceToSurfaceMissileQuantity: TLabel
                  Top = -47
                  ExplicitTop = -47
                end
                inherited Label75: TLabel
                  Top = -18
                  ExplicitTop = -18
                end
                inherited Bevel33: TBevel
                  Top = -11
                  ExplicitTop = -11
                end
                inherited Label76: TLabel
                  Top = 8
                  ExplicitTop = 8
                end
                inherited Label77: TLabel
                  Top = 36
                  ExplicitTop = 36
                end
                inherited Bevel74: TBevel
                  Top = 43
                  ExplicitTop = 43
                end
                inherited Label78: TLabel
                  Top = 253
                  ExplicitTop = 253
                end
                inherited Bevel77: TBevel
                  Top = 261
                  ExplicitTop = 261
                end
                inherited Label413: TLabel
                  Top = 269
                  ExplicitTop = 269
                end
                inherited Label414: TLabel
                  Top = 119
                  ExplicitTop = 119
                end
                inherited Label415: TLabel
                  Top = 61
                  ExplicitTop = 61
                end
                inherited Label416: TLabel
                  Top = 89
                  ExplicitTop = 89
                end
                inherited btnSurfaceToSurfaceMissileFiring: TSpeedButton
                  Top = 56
                  ExplicitTop = 56
                end
                inherited btnSurfaceToSurfaceMissileEngagement: TSpeedButton
                  Top = 84
                  ExplicitTop = 84
                end
                inherited btnSurfaceToSurfaceMissileTargetTrack: TSpeedButton
                  Top = 3
                  ExplicitTop = 3
                end
                inherited Label54: TLabel
                  Top = 196
                  ExplicitTop = 196
                end
                inherited Bevel16: TBevel
                  Top = 203
                  ExplicitTop = 203
                end
                inherited sbSurfaceToSurfaceMissileDisplayRangeShow: TSpeedButton
                  Top = 283
                  ExplicitTop = 283
                end
                inherited sbSurfaceToSurfaceMissileDisplayRangeHide: TSpeedButton
                  Top = 307
                  ExplicitTop = 307
                end
                inherited editSurfaceToSurfaceMissileTargetTrack: TEdit
                  Top = 4
                  ExplicitTop = 4
                end
                inherited btnSurfaceToSurfacePlan: TButton
                  Top = 348
                  ExplicitTop = 348
                end
                inherited btnSurfaceToSurfaceLaunch: TButton
                  Top = 348
                  ExplicitTop = 348
                end
                inherited btnSurfaceToSurfaceCancel: TButton
                  Top = 348
                  ExplicitTop = 348
                end
                inherited editSurfaceToSurfaceMissileFiring: TEdit
                  Top = 57
                  ExplicitTop = 57
                end
                inherited editSurfaceToSurfaceMissileEngangement: TEdit
                  Top = 85
                  ExplicitTop = 85
                end
                inherited btnSurfaceToSurfaceMissileLauncherMore: TButton
                  Top = 172
                  ExplicitTop = 172
                end
                inherited btnSurfaceToSurfaceMissileLauncher1: TButton
                  Top = 111
                  ExplicitTop = 111
                end
                inherited btnSurfaceToSurfaceMissileLauncher2: TButton
                  Top = 111
                  ExplicitTop = 111
                end
                inherited btnSurfaceToSurfaceMissileLauncher3: TButton
                  Top = 111
                  ExplicitTop = 111
                end
                inherited btnSurfaceToSurfaceMissileLauncher4: TButton
                  Top = 111
                  ExplicitTop = 111
                end
                inherited btnSurfaceToSurfaceMissileTargetTrackDetails: TButton
                  Top = 2
                  ExplicitTop = 2
                end
                inherited btnSurfaceToSurfaceMissileWaypointsCancel: TButton
                  Top = 220
                  ExplicitTop = 220
                end
                inherited btnSurfaceToSurfaceMissileWaypointsApply: TButton
                  Top = 220
                  ExplicitTop = 220
                end
                inherited btnSurfaceToSurfaceMissileWaypointsDelete: TButton
                  Top = 220
                  ExplicitTop = 220
                end
                inherited btnSurfaceToSurfaceMissileWaypointsAdd: TButton
                  Top = 220
                  ExplicitTop = 220
                end
                inherited btnSurfaceToSurfaceMissileWaypointsEdit: TButton
                  Top = 220
                  ExplicitTop = 220
                end
              end
            end
          end
          inherited PanelWeaponChoices: TPanel
            Width = 329
            ExplicitWidth = 329
          end
        end
      end
<<<<<<< ufTacticalDisplay.dfm
      object tsAssets: TTabSheet
        ImageIndex = 5
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object ScrollBox3: TScrollBox
=======
      object tsCounterMeasure: TTabSheet
        ImageIndex = 4
        ExplicitHeight = 428
        inline fmCounterMeasure1: TfmCounterMeasure
>>>>>>> 1.38
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited PanelCounterMeasureSpace: TPanel
            Width = 329
            ExplicitWidth = 329
          end
          inherited PanelCounterMeasureChoice: TPanel
            Width = 329
            ExplicitWidth = 329
            inherited lvECM: TListView
              Width = 329
              ExplicitWidth = 329
            end
          end
          inherited PanelCounterMeasure: TPanel
            Width = 329
            Height = 295
            ExplicitWidth = 329
            ExplicitHeight = 313
            inherited grbOnBoardSelfDefenseJammer: TGroupBox
              Width = 329
              Height = 295
              ExplicitWidth = 329
              ExplicitHeight = 313
            end
            inherited grbFloatingDecoy: TGroupBox
              Width = 329
              Height = 295
              ExplicitWidth = 329
              ExplicitHeight = 313
            end
            inherited grbAirborneChaff: TGroupBox
              Width = 329
              Height = 295
              ExplicitWidth = 329
              ExplicitHeight = 313
            end
            inherited grbAcousticDecoy: TGroupBox
              Width = 329
              Height = 295
              ExplicitWidth = 329
              ExplicitHeight = 313
            end
            inherited PanelRadarJamming: TPanel
              Width = 329
              Height = 295
              ExplicitWidth = 329
              ExplicitHeight = 313
            end
          end
        end
      end
<<<<<<< ufTacticalDisplay.dfm
      object tsEMCON: TTabSheet
        ImageIndex = 6
<<<<<<< ufTacticalDisplay.dfm
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
=======
        ExplicitHeight = 869
>>>>>>> 1.36
        object PanelEmconChoices: TPanel
=======
      object tsFireControl: TTabSheet
        ImageIndex = 5
        ExplicitHeight = 428
        inline fmFireControl1: TfmFireControl
>>>>>>> 1.38
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited ScrollBox3: TScrollBox
            Width = 329
            Height = 410
            ExplicitWidth = 329
            ExplicitHeight = 428
            inherited lstAssetsChoices: TListView
              Width = 308
              ExplicitWidth = 308
            end
          end
        end
      end
      object tsEMCON: TTabSheet
        ImageIndex = 6
        ExplicitHeight = 428
        inline fmEMCON1: TfmEMCON
          Left = 0
          Top = 0
          Width = 329
          Height = 410
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ExplicitWidth = 329
          ExplicitHeight = 428
          inherited PanelEmconChoices: TPanel
            Width = 329
            ExplicitWidth = 329
            inherited ListView7: TListView
              Width = 327
              ExplicitWidth = 327
            end
          end
          inherited PanelEmcon: TPanel
            Width = 329
            Height = 313
            ExplicitWidth = 329
            ExplicitHeight = 331
          end
        end
      end
    end
    object lvTrackTable: TListView
      Left = 0
      Top = 0
      Width = 337
      Height = 113
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
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
      OnSelectItem = lvTrackTableSelectItem
    end
  end
  object pnlMap: TPanel
    Left = 341
    Top = 33
    Width = 1012
    Height = 787
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    inline fmMapWindow1: TfmMapWindow
      Left = 0
      Top = 0
      Width = 1008
      Height = 783
      Align = alClient
      TabOrder = 0
<<<<<<< ufTacticalDisplay.dfm
      OnExit = Map1Exit
      OnDblClick = Map1DblClick
      OnClick = Map1Click
      ExplicitLeft = 121
      ExplicitTop = 6
      ExplicitHeight = 1224
      ControlData = {
<<<<<<< ufTacticalDisplay.dfm
<<<<<<< ufTacticalDisplay.dfm
        8A1A06002E6800004E780000010000000F0000FF0D47656F44696374696F6E61
=======
        8B1A06002E6800005F7A0000010000000F0000FF0D47656F44696374696F6E61
>>>>>>> 1.34
=======
        8B1A06002E68000078800000010000000F0000FF0D47656F44696374696F6E61
>>>>>>> 1.36
        727905456D70747900E8030000000000000000000002000E001E000000000000
        0000000000000000000000000000000000000000000600010000000000500001
        010000E80300000001F4010000050000800C000000000000000000000000FFFF
        FF000100000000000000000000000000000000000000000000000352E30B918F
        CE119DE300AA004BB8510100000090017C380F0005417269616C000352E30B91
        8FCE119DE300AA004BB8510100000090012CB1040005417269616C0000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
        8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
        918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
        6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
        010001180100003004260001000000000000001C000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000002
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        8076C000000000008056C0000000000080764000000000008056400100000018
        0100003004260001000000000000001C00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000B002000000000000A6
        88417E8B01000000000000700F010040B98F00A0CD2200000000000000000000
        000088B3400000000000408F400001000001}
=======
      ExplicitWidth = 1008
      ExplicitHeight = 783
      inherited pnlTop: TPanel
        Width = 1008
        Height = 25
        Visible = False
        ExplicitWidth = 1008
        ExplicitHeight = 25
      end
      inherited pnlMap: TPanel
        Top = 25
        Width = 1008
        Height = 758
        ExplicitTop = 25
        ExplicitWidth = 1008
        ExplicitHeight = 758
        inherited Map: TMap
          Width = 1006
          Height = 756
          OnExit = Map2Exit
          OnDblClick = Map2DblClick
          OnClick = Map2Click
          ExplicitLeft = 6
          ExplicitTop = 0
          ExplicitWidth = 1006
          ExplicitHeight = 756
          ControlData = {
            8B1A0600F9670000234E0000010000000F0000FF0D47656F44696374696F6E61
            727905456D70747900E8030000000000000000000002000E001E000000000000
            0000000000000000000000000000000000000000000600010000000000500001
            010000640000000001F4010000050000800C000000000000000000000000FFFF
            FF000100000000000000000000000000000000000000000000000352E30B918F
            CE119DE300AA004BB85101000000900180FC0A0005417269616C000352E30B91
            8FCE119DE300AA004BB8510100000090015C790C0005417269616C0000000000
            00000000000000000000000000000000000000000000000000000000000000FF
            FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
            8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
            918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
            6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
            01000118010000A802270001000000B4B3D4771C000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000002
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            8076C000000000008056C0000000000080764000000000008056400100000018
            010000A802270001000000000004001C00000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000200000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000F762D87700000C0000
            00000054E92300B8CEBA06000000000000000000000000000000000000000000
            000088B3400000000000408F400001000001}
        end
      end
>>>>>>> 1.38
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 820
    Width = 1353
    Height = 73
    Align = alBottom
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 3
    object Panel1: TPanel
      Left = 0
      Top = -2
      Width = 1326
      Height = 69
      TabOrder = 0
      object Label55: TLabel
        Left = 358
        Top = 8
        Width = 34
        Height = 13
        Caption = 'Course'
      end
      object Label56: TLabel
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
      object Label59: TLabel
        Left = 529
        Top = 26
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label60: TLabel
        Left = 480
        Top = 26
        Width = 30
        Height = 13
        Caption = 'Speed'
      end
      object Label61: TLabel
        Left = 529
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label62: TLabel
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
      object Label64: TLabel
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
      object Label66: TLabel
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
      object Label68: TLabel
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
      object Label70: TLabel
        Left = 781
        Top = 8
        Width = 36
        Height = 13
        Caption = 'Bearing'
      end
      object Label71: TLabel
        Left = 974
        Top = 27
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label73: TLabel
        Left = 903
        Top = 8
        Width = 54
        Height = 13
        Caption = 'Origin OCM'
      end
      object Label74: TLabel
        Left = 974
        Top = 8
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label72: TLabel
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
      object Label79: TLabel
        Left = 1167
        Top = 8
        Width = 22
        Height = 13
        Caption = 'OBM'
      end
      object Label80: TLabel
        Left = 1167
        Top = 26
        Width = 21
        Height = 13
        Caption = 'CCG'
      end
      object lbStatus: TLabel
        Left = 11
        Top = 13
        Width = 52
        Height = 16
        Alignment = taCenter
        Caption = 'STATUS'
        Color = clMedGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'System'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
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
      object Label35: TLabel
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
            Text = 'Game Speed'
            Width = 70
          end
          item
            Text = ' DateTime'
            Width = 70
          end>
        ParentBiDiMode = False
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 488
    Top = 8
    object View1: TMenuItem
      Caption = 'View'
      object Display1: TMenuItem
        Caption = 'Display'
        object Tactical1: TMenuItem
          Caption = 'Tactical'
        end
        object Tote1: TMenuItem
          Caption = 'Tote'
        end
      end
      object mnFullScreen1: TMenuItem
        Caption = 'Full Screen'
        OnClick = tbtnFullScreenClick
      end
      object Scale1: TMenuItem
        Caption = 'Scale'
        object Increase1: TMenuItem
          Caption = 'Increase'
          OnClick = tbtnScaleIncreaseClick
        end
        object Decrease1: TMenuItem
          Caption = 'Decrease'
          OnClick = tbtnScaleDecreaseClick
        end
        object Zoom1: TMenuItem
          Caption = 'Zoom...'
          OnClick = toolbtnZoomClick
        end
      end
      object Centre1: TMenuItem
        Caption = 'Centre'
        object Settings2: TMenuItem
          Caption = 'Settings...'
          OnClick = Settings2Click
        end
        object OnHookedTrack2: TMenuItem
          Caption = 'On Hooked Track'
          OnClick = OnHookedTrack2Click
        end
        object OnGameCentre1: TMenuItem
          Caption = 'On Game Centre'
        end
        object Pan1: TMenuItem
          Caption = 'Pan'
        end
      end
      object RangeRings1: TMenuItem
        Caption = 'Range Rings'
        object Settings1: TMenuItem
          Caption = 'Settings'
        end
        object OnHookedTrack1: TMenuItem
          Caption = 'On Hooked Track'
        end
      end
      object Filters1: TMenuItem
        Caption = 'Filters...'
      end
      object Overrides1: TMenuItem
        Caption = 'Overrides...'
      end
      object History1: TMenuItem
        Caption = 'History...'
      end
    end
    object Hook1: TMenuItem
      Caption = 'Hook'
      object Next1: TMenuItem
        Caption = 'Next'
        OnClick = Next1Click
      end
      object Previous1: TMenuItem
        Caption = 'Previous'
        OnClick = Previous1Click
      end
      object rackTable1: TMenuItem
        Caption = 'Track Table'
        object Add1: TMenuItem
          Caption = 'Add'
          OnClick = Add1Click
        end
        object Remove1: TMenuItem
          Caption = 'Remove'
          OnClick = Remove1Click
        end
      end
      object AssumeControl1: TMenuItem
        Caption = 'Assume Control'
        object HookedTrack1: TMenuItem
          Caption = 'Hooked Track'
        end
        object CommandPlatform1: TMenuItem
          Caption = 'Command Platform'
        end
      end
    end
    object Track1: TMenuItem
      Caption = 'Track'
      object Characteristics1: TMenuItem
        Caption = 'Characteristics'
        object Domain1: TMenuItem
          Caption = 'Domain'
          object A1: TMenuItem
            Caption = 'Air'
            Checked = True
          end
          object Surface1: TMenuItem
            Caption = 'Surface'
          end
          object Subsurface1: TMenuItem
            Caption = 'Subsurface'
          end
          object Land1: TMenuItem
            Caption = 'Land'
          end
          object General1: TMenuItem
            Caption = 'General'
          end
        end
        object IDentity1: TMenuItem
          Caption = 'Identity'
        end
        object PlatformType1: TMenuItem
          Caption = 'Platform Type'
        end
        object Propulsion1: TMenuItem
          Caption = 'Propulsion Type '
        end
        object Edit1: TMenuItem
          Caption = 'Edit'
        end
      end
      object MErge1: TMenuItem
        Caption = 'Merge'
      end
      object Split1: TMenuItem
        Caption = 'Split'
      end
      object Datalink1: TMenuItem
        Caption = 'Datalink'
        object o1: TMenuItem
          Caption = 'To'
        end
        object From1: TMenuItem
          Caption = 'From'
        end
      end
      object Number1: TMenuItem
        Caption = 'Number'
        object Automatic1: TMenuItem
          Caption = 'Automatic'
        end
        object Manual1: TMenuItem
          Caption = 'Manual...'
        end
      end
      object History2: TMenuItem
        Caption = 'History'
        OnClick = History2Click
      end
      object InitiateTMA1: TMenuItem
        Caption = 'Initiate TMA'
      end
      object Sonobuoys1: TMenuItem
        Caption = 'Sonobuoys'
        object OperatingMode1: TMenuItem
          Caption = 'Operating Mode'
        end
        object Depth1: TMenuItem
          Caption = 'Depth'
        end
        object Monitor1: TMenuItem
          Caption = 'Monitor'
        end
        object Destroy1: TMenuItem
          Caption = 'Destroy'
        end
      end
      object Break1: TMenuItem
        Caption = 'Break All Fire Control Asset Assignments'
      end
      object RangeControlandBlindZone1: TMenuItem
        Caption = 'Range Circle and Blind Zones'
        object ClearforHookedTracks1: TMenuItem
          Caption = 'Clear for Hooked Tracks'
        end
        object ClearforAllTracks1: TMenuItem
          Caption = 'Clear for All Tracks'
        end
      end
      object Remove2: TMenuItem
        Caption = 'Remove'
      end
    end
    object ools1: TMenuItem
      Caption = 'Tools'
      object Cursor1: TMenuItem
        Caption = 'Cursor'
        object Anchor1: TMenuItem
          Caption = 'Anchor'
        end
        object Origin1: TMenuItem
          Caption = 'Origin...'
        end
        object Select1: TMenuItem
          Caption = 'Select...'
          OnClick = Select1Click
        end
        object SendEndPointExactly1: TMenuItem
          Caption = 'Send End Point Exactly...'
        end
      end
      object Overlays1: TMenuItem
        Caption = 'Overlays...'
      end
      object Formation1: TMenuItem
        Caption = 'Formation...'
      end
      object argetIntercept1: TMenuItem
        Caption = 'Target Intercept...'
      end
      object argetPriorityA1: TMenuItem
        Caption = 'Target Priority Assessment...'
      end
      object Opotions1: TMenuItem
        Caption = 'Opotions...'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Contents1: TMenuItem
        Caption = 'Contents'
      end
      object About1: TMenuItem
        Caption = 'About'
      end
    end
  end
  object ImageList1: TImageList
    BkColor = 14215660
    Left = 848
    Top = 72
    Bitmap = {
      494C01011F002100B40010001000ECE9D800FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100FFFFFF00707070007070700070707000FFFFFF00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100FFFF
      FF00707070007070700060606000707070007070700060606000FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00707070007070
      70007070700060606000C1C1C100FFFFFF00FFFFFF007070700070707000FFFF
      FF00FFFFFF00C1C1C100D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000060606000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000606060006060
      6000C1C1C100FFFFFF007070700070707000FFFFFF00FFFFFF00707070007070
      7000FFFFFF00FFFFFF00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00C1C1C1000000000000000000D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000001919
      190000000000C1C1C100D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000C1C1C100FFFF
      FF007070700070707000707070007070700070707000FFFFFF00FFFFFF007070
      700070707000FFFFFF00FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000606060000000000C1C1C10000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0070707000FFFFFF00707070007070
      7000707070007070700070707000707070007070700070707000FFFFFF00FFFF
      FF007070700070707000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000606060000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000707070007070
      700070707000707070007070700070707000707070007070700070707000FFFF
      FF00FFFFFF007070700070707000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000C1C1C10000000000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000707070007070
      7000707070007070700070707000707070007070700070707000707070007070
      7000FFFFFF0070707000FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC0000000000D8E9EC00000000001919190000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC0060606000C1C1C100606060007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000C1C1C10000000000D8E9EC00000000001919190000000000C1C1C100D8E9
      EC00000000007070700000000000D8E9EC00D8E9EC0060606000C1C1C1007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000006060600000000000000
      0000000000007070700060606000D8E9EC00D8E9EC00D8E9EC0060606000C1C1
      C100606060007070700070707000707070007070700070707000707070007070
      7000707070007070700070707000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000007070
      7000707070000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C1006060
      6000D8E9EC007070700070707000707070007070700070707000707070007070
      7000707070006060600060606000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0060606000C1C1C10060606000707070007070700070707000707070007070
      700060606000C1C1C100D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C10060606000C1C1C10070707000707070006060600060606000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000007070700070707000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00606060007070700060606000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00C1C1C100D8E9EC00B9B9B900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060007070
      70007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00C1C1C100606060000000000038383800C1C1C100D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000060606000D8E9EC00C1C1C10000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10070707000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000000000007070700070707000707070000000000000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000707070007070700070707000707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00E1E1E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000070707000C1C1C10060606000686868007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000060606000D8E9EC00C1C1C100707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC000000000070707000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000C1C1C100D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF000000
      0000000000007070700070707000707070000000000000000000FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E1007070
      7000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC007070700000000000FFFFFF007F7F7F0060606000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100606060007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00606060000000000030303000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
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
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B6B6
      B600BDBDBD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B8B8B800D8D8D800FFFFFF00FFFF
      FF00FFFFFF00E5E5E500D8E9EC00B7B7B700D4D4D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC009292920060606000666666007070
      700087878700D8E9EC00D8E9EC00999999006565650070707000707070007070
      70006C6C6C00646464007F7F7F00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00B8B8B8009E9E9E009898
      9800E5E5E500B7B7B700BCBCBC00D8E9EC00B6B6B600AAAAAA00707070007070
      700095959500ECECEC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00949494008282
      8200D6D6D600FFFFFF00FFFFFF00FFFFFF00D4D4D40070707000707070007070
      700081818100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000D8E9EC00D8E9EC00C1C1C10000000000C1C1
      C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7B700A4A4
      A400707070006B6B6B00656565007070700070707000707070006C6C6C008A8A
      8A00EBEBEB00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950097979700E5E5E500D8E9EC00999999006565650070707000707070008282
      8200D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000007070700000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950081818100D6D6D600EBEBEB00A8A8A800707070006B6B6B008C8C8C00EAEA
      EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000000000000000000000000000C1C1C1000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC009696960095959500D1D1D10070707000707070007070700086868600BDBD
      BD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000060606000C1C1C10060606000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7
      B700A0A0A00080808000A7A7A700707070006B6B6B008E8E8E00EAEAEA00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C0070707000707070007070700083838300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C00707070006B6B6B0090909000E9E9E900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0097979700656565007070700084848400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00B7B7B700A2A2A20079797900D8E9EC00D8E9EC00D8E9EC00D8E9
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
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B9B9B900DBDBDB00F3F3
      F300F3F3F300F4F4F400F4F4F400D4D4D400B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20089898900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00FFFFFF00E7E7E700B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B20095959500838383008787
      87008787870087878700C3C3C300F9F9F900D4D4D400B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2008585850070707000707070007070
      700070707000707070009E9E9E00FFFFFF00E6E6E600B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009999990075757500707070007070
      700070707000707070007C7C7C00C2C2C200F9F9F900D4D4D400B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      7000707070007070700070707000A0A0A000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007171710070707000707070007070
      70007070700070707000707070007D7D7D00C2C2C200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200BCBCBC00E4E4E400B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006F6F6F0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B2008D8D8D00FFFFFF00E3E3E300B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006A6A6A0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700066666600FFFFFF00BBBBBB00E3E3E300E3E3
      E30070707000A5A5A500FFFFFF00E3E3E300D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006E6E6E0070707000707070007070
      70007070700070707000707070006A6A6A00ADADAD00DBDBDB00B7B7B700D3D3
      D300EEEEEE00EEEEEE00EEEEEE00EEEEEE007070700070707000707070007070
      70007070700070707000707070006A6A6A00CFCFCF0085858500A7A7A700A7A7
      A7007070700070707000A7A7A700FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC006B6B6B0070707000707070007070
      70007070700070707000707070006E6E6E0096969600BCBCBC009D9D9D008989
      8900919191009191910091919100BDBDBD007070700070707000707070007070
      700070707000707070006666660098989800BBBBBB006A6A6A00666666007070
      7000707070007070700066666600D0D0D000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000008484840070707000707070007070
      700070707000707070006A6A6A0082828200AAAAAA00B7B7B700959595006969
      69006B6B6B00696969006B6B6B008B8B8B009797970066666600666666007070
      700070707000666666009A9A9A00B2B2B200E6E6E60097979700919191009797
      9700666666007070700091919100B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00A8A8A8007F7F7F00646464006A6A
      6A00707070006A6A6A0086868600ADADAD00CDCDCD00D2D2D200ABABAB009F9F
      9F009F9F9F009F9F9F009F9F9F00A5A5A500B2B2B20090909000999999007070
      7000C3C3C30090909000C1C1C10082828200FFFFFF00B2B2B200B2B2B200BBBB
      BB006060600097979700B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00B2B2B200A6A6A600A2A2A2008A8A
      8A00A6A6A600BABABA00AEAEAE009C9C9C00B7B7B700DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B8B8B8006767
      6700FFFFFF00BBBBBB008A8A8A0069696900FFFFFF00B2B2B200B2B2B200B8B8
      B8008F8F8F00B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B4B4B4008B8B
      8B00B5B5B500DDDDDD009C9C9C0074747400B2B2B200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006969
      6900FFFFFF008B8B8B009696960070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008D8D
      8D00B8B8B800BCBCBC00909090008B8B8B00B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006767
      6700B1B1B1008D8D8D00B9B9B90067676700FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008989
      8900818181009A9A9A00A8A8A8008F8F8F00AEAEAE00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200BABABA006060
      600093939300B2B2B200BABABA0060606000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B7B7B7008B8B
      8B0080808000A8A8A800B7B7B7008F8F8F00ACACAC00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B9B9B9008B8B
      8B00B2B2B200B2B2B200B9B9B90060606000DEDEDE00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B5B5B500A6A6
      A600A5A5A500B2B2B200B4B4B4008D8D8D0098989800C5C5C500B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B2008A8A8A00B9B9B900B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B5B5B500D8E9EC00D8E9EC00D8E9EC00B5B5B500D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C2C2C200C2C2C200C2C2
      C200CECECE00C2C2C200C2C2C200C2C2C200CECECE00C2C2C200D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A5A5A500E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200FFFFFF00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0070707000707070000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E400FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000006060
      60007070700000000000C1C1C100D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00000000000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF000000
      000000000000FFFFFF00B2B2B20000000000B2B2B200FFFFFF00B2B2B2000000
      0000000000007070700000000000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00BFBFBF00B4B4B400D8E9EC00D8E9EC00C1C1C10000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000FFFFFF00B2B2B200FFFFFF0000000000FFFFFF00B2B2B200FFFFFF00FFFF
      FF00000000000000000000000000C1C1C1000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B400A8A8A800FFFFFF00CACACA00D8E9EC00D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000060606000C1C1C100FFFF
      FF0000000000FFFFFF00B2B2B200FFFFFF00B2B2B200FFFFFF00C1C1C1000000
      0000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062626200FFFFFF00BFBF
      BF006E6E6E00EBEBEB00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B200FFFFFF00C1C1C100FFFFFF00C1C1C100606060007070
      7000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00B4B4
      B4006262620070707000EBEBEB00F5F5F500000000000000000000000000D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00B2B2B200FFFFFF006060600070707000707070007070
      7000707070000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000707070006A6A6A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C1C1000000000000000000707070007070
      7000707070007070700070707000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B4000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00007070700070707000707070000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D00000000000000000061616100FFFFFF00D8E9
      EC0068686800D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000D8E9EC000000000000000000F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F30000000000000000006F6F6F00F9F9F900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC000000
      000000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000D8E9EC006F6F6F006F6F6F00707070007070
      70007070700070707000707070006F6F6F000000000066666600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000007F7F7F0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000D8E9EC000000000000000000757575000000
      00007070700000000000000000006565650074747400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000059595900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00007373730064646400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
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
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B9B9
      B900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B4B4B400BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC009B9B9B000C0C0C006B6B
      6B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B3B3B300C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00A7A7A7000000000000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ABABAB00000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC0000000000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990019191900BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90007070700ADADAD000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00B3B3B300D8E9EC00A5A5A5000000000009090900D8E9EC00D8E9EC00AFAF
      AF0001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A7A7A700545454000000
      000000000000000000000D0D0D00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
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
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00808080008080800080808000D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC008080800080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000808080000000
      000000000000D8E9EC00808080008080800080808000D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC000000
      000000000000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000808080000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000080808000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000008080
      8000000000008080800080808000D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC008080800000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC008080800000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00808080008080800080808000000000008080800080808000D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
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
      EC000000000080808000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC000000000080808000D8E9EC00808080000000000080808000D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
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
      000000000000D8E9EC00D8E9EC008080800080808000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D3C5C700D5C0C300D4BBBF00DDBD
      C200DCB8BE00E1BBC100D4AEB400E6C0C600F9D5DB00D4B2B800E1C1C600D1B3
      B800D7B9BE00D4B6BB00D2B7BB00CFB8BC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCB5B900280A0F0039171D002200
      0000360A110043141C00290000003F0E16002700000034080F003F151C002C03
      0A00381218002100030047272C0023080C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00B6B6B6007E7E7E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D9C2C60026030700FFF9FE00FFE4
      EE00FFF7FF00FBD4E300FFF4FF00FFD7F6003F173A00FFDCF800FFF4FF00F5D1
      E100FFF8FF00FFF3FC00F9DCE500300E1500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC008C8C8C000000000081818100B6B6B600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00CEBFC300320C0C00FFEAEC00FFF3
      FF00EFE6FB00FFF2FF00F5E3FF00200C59001F0F6300160C4E00ECE4FF00F2E6
      FF00F2E6FA00FFF9FF00F9E5F20031041400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B6B6B6008484840000000000000000000000000090909000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00000000000000000000000000D8E9EC00C4BCBD0023000000FFFAFC00F8F0
      FF00F2F6FF00E2E1FF0019184A0006035800030760000A13570000063800F2F4
      FF00F5F5FF00E3E5F700FFF8FF0027000800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0093939300000000000000000000000000000000000000000087878700B6B6
      B600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00BCB9B1003E1B1100FFE8E800DFD7
      EE00E3E8FF00F3F7FF00D6DDFE00E5F0FF000F215600E1F7FF00D6E9FF00E9EF
      FF00DADBF500F1F2FF00EFDFF00038051900D8E9EC00D8E9EC00D8E9EC008B8B
      8B00000000000000000000000000000000000000000000000000000000009696
      9600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C4C2C100411F1F00FFF7FF00DACF
      F7001F245100DEE3FF00ECF7FF00BCCFF40008244600BCDDF000D6F1FF00D7E0
      FF0022244700E9EBFF00F8E8F9003A071B00D8E9EC00D8E9EC00D8E9EC002424
      2400242424002424240000000000000000000000000024242400242424002424
      2400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00BAB9C90019000B00F4CDF3002819
      5D0007065000ECEEFF00D7E3FF00DDF7FF00B2D6F400D6FEFF00BCDAF700E4ED
      FF00100E49001A1C3A00F9E9FB003B071E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C9C0D500360B2600451440002710
      5A001D146400100A43001E214D00ACBFE400DDF9FF00C0E1F500162E4C001213
      50001E1754001413330039293B0027000A00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D7BFCB0034000A00FFD7F5003E18
      5200230C4A00FFF0FF00EFE4FF00F4F4FF00E6EEFF00EAF8FF00CDD4ED00EBDF
      FF001B0C3F001B173400FFF8FF0039051C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D5BEC200410A0D00FFF4FF00F4D3
      F8002F1B4600EDD8F800FFF0FF00E3DAFF000F0F3700DDE4FF00F4F8FF00D8CB
      F10034264A00E9E6FC00F5E5F6003C091D00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBB6B30039120A00FFE4E100FFF9
      FF00E1DFF500FDF9FF00DAD5F400F1EDFF000D104D00E8F3FF00CDD8F800F3F4
      FF00EBEAFE00F8FBFF00EBDDE90036041600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBC0BF002F130800FFFEF500F2EF
      F100F4FDFF00E9EAF800201F410006044A0017196700020D47000A173D00F3FA
      FF00DCE2ED00DCE1EA00FFFAFF0037061400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C3CAD3001F060200FFE7E200EBEC
      F000DDE7F100F8FAFF00D5D1FA001E186A000A076300131A5F00CCD7FF00E2E8
      FF00F2F7FF00F8FEFF00FFF6FC0027000100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000F0F0F000F0F0F000F0F0F00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B0AEB4003E1A1400FFFDF500FFF3
      F500FFFCFF00EDE1ED00FFF2FF00EBD9FF001F106100D2CBFF00F8F4FF00F0E7
      F400F9F4F600E3E8E700FBF0F2003B0D1300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DFC7C100450A00003E0000003B12
      0F001F000100280300002F060E002500230018001D0018001000250A0E00310C
      0800331710000C0A020029201C003B0E1100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF01F0000FC1FDFFFC00F0000
      E00F1FCF80030000E003878F00030000C463C35F00010000CE71E0BF00000000
      9E71E17F000100008E71F87F00010000BE7DB47300010000FE7F021180000000
      FE7F0701C0000000FE7F6781C8010000FE7FC703F0030000FCBFC703F01F0000
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
  object ImageList2: TImageList
    Left = 848
    Top = 128
    Bitmap = {
      494C010107000900B40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C1C1C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B2B2B003D3D
      3D00C1C1C1000000000000000000000000000000000000000000000000000000
      0000000000003D3D3D003D3D3D00C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C1003D3D3D003D3D
      3D003D3D3D00000000000000000000000000000000000000000000000000C1C1
      C1003D3D3D003D3D3D002B2B2B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002B2B
      2B003D3D3D003D3D3D00C1C1C1000000000000000000C1C1C100000000003D3D
      3D003D3D3D003D3D3D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003D3D3D003D3D3D00000000000000000000000000000000003D3D3D003D3D
      3D002B2B2B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100000000002B2B2B003D3D3D00C1C1C100000000003D3D3D003D3D3D003D3D
      3D0000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B2003D3D3D003D3D3D00000000003D3D3D002B2B2B00B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C10000000000C1C1C100000000003D3D3D003D3D3D003D3D3D0000000000C1C1
      C10000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003D3D3D003D3D3D003D3D3D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C10000000000C1C1C1003D3D3D003D3D3D00000000003D3D3D003D3D3D00C1C1
      C10000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003D3D3D002B2B2B00B2B2B200000000002B2B2B003D3D3D003D3D
      3D00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003D3D3D003D3D3D0000000000C1C1C10000000000C1C1C1002B2B2B003D3D
      3D003D3D3D00C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C1C1C1003D3D
      3D003D3D3D002B2B2B0000000000000000000000000000000000000000003D3D
      3D003D3D3D003D3D3D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B2B2B003D3D
      3D003D3D3D000000000000000000000000000000000000000000000000000000
      00002B2B2B003D3D3D003D3D3D00C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003D3D3D002B2B
      2B00000000000000000000000000000000000000000000000000000000000000
      0000000000003D3D3D002B2B2B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C10000000000C1C1C10000000000C1C1C10000000000C1C1C100C1C1C1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C1C1C100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070707000606060007070
      7000707070000000000000000000000000000000000070707000707070007070
      7000606060000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100000000000000000000000000B2B2B20000000000B2B2B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000606060006060600060606000000000007070700070707000707070000000
      0000000000000000000060606000C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2B2B20000000000B2B2B20000000000B2B2B20000000000B2B2
      B200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C100000000006060600000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C10000000000C1C1C10000000000C1C1C10000000000C1C1C10000000000C1C1
      C10000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000060606000C1C1C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000060606000C1C1C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C10000000000B2B2B20000000000B2B2B20000000000B2B2B20000000000B2B2
      B20000000000C1C1C10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C1C1C100606060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C1C1C10000000000B2B2B20000000000B2B2B20000000000C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C1C1C10000000000C1C1C100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFF07DFFF0000
      0001FE23C63800003FF9F831876100000001F038E1230000FFFFC318F0070000
      FFF9819CE0030000E731999CC0010000CE31999CC00100008C21819CC0010000
      0001C318C00100008C21F038C0010000CE71F831F0030000E739FE23C0030000
      FFFFFF07C7F00000FFFFFFFFCFF90000FFFFFFFFFFFFF3FFFFFFFFFFFEFFF3FF
      FFFFFFBFFE3FF9FFEA9FFC0FFE3FF9FF8003FBB5FF7FF8FF8001D7BBFE7F9CFF
      8001E7B5FC0F867F8001DA0EE007C27FF01CDC1EC001F36FFC7FDE0EC001FE07
      FE7FDC16C001FF0FFE7FEBB9C001FF07FCFFF7BAC001FE07FFFFEBB7F007FFE3
      FFFFFC0FFC1FFFF9FFFFFFBFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pmenuWeapon: TPopupMenu
    Left = 365
    Top = 275
  end
end
