object GuidanceForm: TGuidanceForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Guidance (unsure)'
  ClientHeight = 368
  ClientWidth = 379
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 379
    Height = 361
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitWidth = 377
    object PageControl1: TPageControl
      Left = 0
      Top = 9
      Width = 392
      Height = 353
      ActivePage = tabLateral
      TabOrder = 0
      object tabInitial: TTabSheet
        Caption = 'Initial'
      end
      object tabLateral: TTabSheet
        Caption = 'Lateral'
        ImageIndex = 1
        object grbComboBoxGuidance: TGroupBox
          Left = 3
          Top = 19
          Width = 362
          Height = 30
          Color = clCream
          Ctl3D = True
          ParentBackground = False
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 0
          object cbxLateral: TComboBox
            Left = 3
            Top = 3
            Width = 356
            Height = 21
            TabOrder = 0
            Text = 'Straight/Heading'
          end
        end
        object grbResultStraightHeading: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 1
          Visible = False
          object Course: TLabel
            Left = 16
            Top = 28
            Width = 41
            Height = 13
            Caption = 'Course :'
          end
          object GroundSpeed: TLabel
            Left = 16
            Top = 64
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object degreesT: TLabel
            Left = 288
            Top = 27
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object edtCourse: TEdit
            Left = 136
            Top = 24
            Width = 121
            Height = 21
            TabOrder = 0
            Text = '000.0'
          end
          object cbxGroundSpeed: TComboBox
            Left = 136
            Top = 60
            Width = 193
            Height = 21
            TabOrder = 1
            Text = 'Minimum'
          end
        end
        object grbResultPatternonSelf: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 265
          TabOrder = 2
          Visible = False
          object PredifenedPattern: TLabel
            Left = 15
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Predifened Pattern'
          end
          object AngularOffset: TLabel
            Left = 15
            Top = 80
            Width = 78
            Height = 13
            Caption = 'Angular Offset :'
          end
          object degrees: TLabel
            Left = 240
            Top = 80
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object btnbrowse: TSpeedButton
            Left = 327
            Top = 39
            Width = 23
            Height = 22
            Caption = '...'
          end
          object edtPredifened: TEdit
            Left = 15
            Top = 39
            Width = 306
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '(None)'
          end
          object edtAngularOffset: TEdit
            Left = 104
            Top = 77
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
          end
        end
        object grbResultPatternonTarget: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 3
          Visible = False
          object PredifinedPattern2: TLabel
            Left = 15
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Predifened Pattern'
          end
          object AngularOffset2: TLabel
            Left = 15
            Top = 104
            Width = 78
            Height = 13
            Caption = 'Angular Offset :'
          end
          object degress2: TLabel
            Left = 264
            Top = 104
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object btnBrowse2: TSpeedButton
            Left = 327
            Top = 38
            Width = 23
            Height = 22
            Caption = '...'
          end
          object Target: TLabel
            Left = 15
            Top = 73
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch: TSpeedButton
            Left = 327
            Top = 68
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object edtPredifened2: TEdit
            Left = 15
            Top = 39
            Width = 306
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '(None)'
          end
          object edtAngularOffset2: TEdit
            Left = 128
            Top = 100
            Width = 121
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object edtTarget: TEdit
            Left = 80
            Top = 69
            Width = 241
            Height = 21
            Enabled = False
            TabOrder = 2
            Text = '(None)'
          end
        end
        object grbPatternOnPoint: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 4
          Visible = False
          object PredifenedPattern3: TLabel
            Left = 15
            Top = 18
            Width = 91
            Height = 13
            Caption = 'Predifened Pattern'
          end
          object AngularOffset3: TLabel
            Left = 15
            Top = 72
            Width = 78
            Height = 13
            Caption = 'Angular Offset :'
          end
          object degrees3: TLabel
            Left = 232
            Top = 72
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object btnBrowse3: TSpeedButton
            Left = 327
            Top = 38
            Width = 23
            Height = 22
            Caption = '...'
          end
          object btnAdd: TSpeedButton
            Left = 327
            Top = 95
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object AnchorPosition: TLabel
            Left = 15
            Top = 99
            Width = 81
            Height = 13
            Caption = 'Anchor Position :'
          end
          object AnchorGrid: TLabel
            Left = 15
            Top = 126
            Width = 63
            Height = 13
            Caption = 'Anchor Grid :'
          end
          object edtPredifened3: TEdit
            Left = 15
            Top = 39
            Width = 306
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '(None)'
          end
          object edtAngularOffset3: TEdit
            Left = 128
            Top = 68
            Width = 89
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object edtAnchorPosition1: TEdit
            Left = 128
            Top = 95
            Width = 89
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object edtAnchorGrid1: TEdit
            Left = 128
            Top = 122
            Width = 89
            Height = 21
            TabOrder = 3
            Text = '0'
          end
          object edtAnchorPosition2: TEdit
            Left = 223
            Top = 95
            Width = 89
            Height = 21
            TabOrder = 4
            Text = '0'
          end
          object edtAnchorGrid2: TEdit
            Left = 223
            Top = 122
            Width = 89
            Height = 21
            TabOrder = 5
            Text = '0'
          end
        end
        object grbReturntoBase: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 5
          Visible = False
          object groundSpeed2: TLabel
            Left = 15
            Top = 11
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object Base: TLabel
            Left = 15
            Top = 42
            Width = 30
            Height = 13
            Caption = 'Base :'
          end
          object btnSearch2: TSpeedButton
            Left = 327
            Top = 37
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object edtBase: TEdit
            Left = 112
            Top = 37
            Width = 209
            Height = 21
            Enabled = False
            TabOrder = 0
            Text = '(None)'
          end
          object ComboBox1: TComboBox
            Left = 136
            Top = 7
            Width = 214
            Height = 21
            TabOrder = 1
            Text = 'Minimum'
          end
        end
        object grbStationKeepOnTrack: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 6
          Visible = False
          object Target2: TLabel
            Left = 15
            Top = 11
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object TargetRange: TLabel
            Left = 15
            Top = 42
            Width = 73
            Height = 13
            Caption = 'Target Range :'
          end
          object SpeedButton1: TSpeedButton
            Left = 336
            Top = 9
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object AngleOffset2: TLabel
            Left = 15
            Top = 74
            Width = 68
            Height = 13
            Caption = 'Angle Offset :'
          end
          object degrees4: TLabel
            Left = 224
            Top = 74
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object nm: TLabel
            Left = 224
            Top = 42
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object edtTargetRange: TEdit
            Left = 117
            Top = 38
            Width = 89
            Height = 21
            TabOrder = 0
            Text = '0.00'
          end
          object edtAngleOffset2: TEdit
            Left = 117
            Top = 70
            Width = 89
            Height = 21
            TabOrder = 1
            Text = '0'
          end
          object cbAbsoluteOffset: TCheckBox
            Left = 15
            Top = 112
            Width = 138
            Height = 17
            Caption = 'Absolute Offset Angle'
            TabOrder = 2
          end
          object edtTarget2: TEdit
            Left = 80
            Top = 10
            Width = 250
            Height = 21
            Enabled = False
            TabOrder = 3
            Text = '(None)'
          end
        end
        object grbStationKeepOnPosition: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 7
          Visible = False
          object AnchorPosition2: TLabel
            Left = 15
            Top = 10
            Width = 81
            Height = 13
            Caption = 'Anchor Position :'
          end
          object AnchorGrid2: TLabel
            Left = 15
            Top = 42
            Width = 63
            Height = 13
            Caption = 'Anchor Grid :'
          end
          object btnSearch3: TSpeedButton
            Left = 336
            Top = 5
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object edtAnchorPosition21: TEdit
            Left = 117
            Top = 6
            Width = 101
            Height = 21
            TabOrder = 0
            Text = '56 56.33 N'
          end
          object edtAnchorGrid21: TEdit
            Left = 117
            Top = 38
            Width = 101
            Height = 21
            TabOrder = 1
            Text = '0.00 nm N'
          end
          object cbxDriftOnCurrent: TCheckBox
            Left = 15
            Top = 80
            Width = 138
            Height = 17
            Caption = 'Drifts on Current'
            TabOrder = 2
          end
          object edtAnchorPosition22: TEdit
            Left = 224
            Top = 6
            Width = 106
            Height = 21
            TabOrder = 3
            Text = '003 04.15 E'
          end
          object edtAnchorGrid22: TEdit
            Left = 224
            Top = 38
            Width = 106
            Height = 21
            TabOrder = 4
            Text = '0.00 nm E'
          end
        end
        object grbCircleOnTrack: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 8
          Visible = False
          object RangeOffset: TLabel
            Left = 7
            Top = 131
            Width = 72
            Height = 13
            Caption = 'Range Offset :'
          end
          object AngleOffset: TLabel
            Left = 7
            Top = 162
            Width = 68
            Height = 13
            Caption = 'Angle Offset :'
          end
          object btnSearch4: TSpeedButton
            Left = 319
            Top = 4
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object Target3: TLabel
            Left = 7
            Top = 9
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object Radius: TLabel
            Left = 7
            Top = 39
            Width = 39
            Height = 13
            Caption = 'Radius :'
          end
          object Direction: TLabel
            Left = 7
            Top = 70
            Width = 49
            Height = 13
            Caption = 'Direction :'
          end
          object GroundSpeed3: TLabel
            Left = 7
            Top = 100
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object nm2: TLabel
            Left = 236
            Top = 35
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object nm3: TLabel
            Left = 236
            Top = 127
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object degrees5: TLabel
            Left = 236
            Top = 158
            Width = 39
            Height = 13
            Caption = 'degrees'
          end
          object edtRangeOffset: TEdit
            Left = 109
            Top = 127
            Width = 121
            Height = 21
            TabOrder = 0
          end
          object edtAngleOffset: TEdit
            Left = 109
            Top = 158
            Width = 121
            Height = 21
            TabOrder = 1
          end
          object cbAbsoluteOffset2: TCheckBox
            Left = 7
            Top = 200
            Width = 138
            Height = 17
            Caption = 'Absolute Offset Angle'
            TabOrder = 2
          end
          object edtTarget3: TEdit
            Left = 64
            Top = 5
            Width = 249
            Height = 21
            Enabled = False
            TabOrder = 3
          end
          object edtRadius: TEdit
            Left = 109
            Top = 35
            Width = 121
            Height = 21
            TabOrder = 4
          end
          object cbxDirection: TComboBox
            Left = 109
            Top = 66
            Width = 233
            Height = 21
            TabOrder = 5
          end
          object cbxGroundSpeed2: TComboBox
            Left = 109
            Top = 96
            Width = 233
            Height = 21
            TabOrder = 6
          end
        end
        object grbCircleOnPoint: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 9
          Visible = False
          object Radius2: TLabel
            Left = 7
            Top = 62
            Width = 39
            Height = 13
            Caption = 'Radius :'
          end
          object SpeedButton2: TSpeedButton
            Left = 319
            Top = 4
            Width = 23
            Height = 22
            Caption = 'icon'
          end
          object CentrePosition: TLabel
            Left = 7
            Top = 9
            Width = 80
            Height = 13
            Caption = 'Centre Position :'
          end
          object CentreGrid: TLabel
            Left = 7
            Top = 35
            Width = 62
            Height = 13
            Caption = 'Centre Grid :'
          end
          object nm4: TLabel
            Left = 212
            Top = 59
            Width = 14
            Height = 13
            Caption = 'nm'
            Visible = False
          end
          object Direction2: TLabel
            Left = 7
            Top = 89
            Width = 49
            Height = 13
            Caption = 'Direction :'
          end
          object GroundSpeed4: TLabel
            Left = 7
            Top = 116
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object edtRadius2: TEdit
            Left = 109
            Top = 58
            Width = 97
            Height = 21
            TabOrder = 0
          end
          object edtCentrePosition1: TEdit
            Left = 109
            Top = 5
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edtCentrePosition2: TEdit
            Left = 212
            Top = 5
            Width = 97
            Height = 21
            TabOrder = 2
          end
          object edtCentreGrid1: TEdit
            Left = 109
            Top = 31
            Width = 97
            Height = 21
            TabOrder = 3
          end
          object edtCentreGrid2: TEdit
            Left = 212
            Top = 31
            Width = 97
            Height = 21
            TabOrder = 4
          end
          object cbxDirection2: TComboBox
            Left = 109
            Top = 85
            Width = 233
            Height = 21
            TabOrder = 5
          end
          object cbxGroundspeed3: TComboBox
            Left = 109
            Top = 112
            Width = 233
            Height = 21
            TabOrder = 6
          end
        end
        object grbZigZag: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 10
          Visible = False
          object LegLength: TLabel
            Left = 3
            Top = 12
            Width = 60
            Height = 13
            Caption = 'Leg Length :'
          end
          object Amplitude: TLabel
            Left = 3
            Top = 99
            Width = 54
            Height = 13
            Caption = 'Amplitude :'
          end
          object BaseCourse: TLabel
            Left = 3
            Top = 41
            Width = 67
            Height = 13
            Caption = 'Base Course :'
          end
          object Period: TLabel
            Left = 3
            Top = 70
            Width = 37
            Height = 13
            Caption = 'Period :'
          end
          object nm6: TLabel
            Left = 208
            Top = 99
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object GroundSpeed5: TLabel
            Left = 3
            Top = 129
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object nm5: TLabel
            Left = 208
            Top = 70
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object degreesT2: TLabel
            Left = 208
            Top = 41
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object cbxLeglength: TComboBox
            Left = 105
            Top = 10
            Width = 233
            Height = 21
            TabOrder = 0
          end
          object edtAmplitude: TEdit
            Left = 105
            Top = 95
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edtBaseCourse: TEdit
            Left = 105
            Top = 37
            Width = 97
            Height = 21
            TabOrder = 2
          end
          object edtPeriod: TEdit
            Left = 105
            Top = 66
            Width = 97
            Height = 21
            TabOrder = 3
          end
          object cbxGroundspeed4: TComboBox
            Left = 105
            Top = 125
            Width = 233
            Height = 21
            TabOrder = 4
          end
        end
        object grbSinuate: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 11
          Visible = False
          object Amplitude2: TLabel
            Left = 3
            Top = 67
            Width = 54
            Height = 13
            Caption = 'Amplitude :'
          end
          object BaseCourse2: TLabel
            Left = 3
            Top = 9
            Width = 67
            Height = 13
            Caption = 'Base Course :'
          end
          object Period2: TLabel
            Left = 3
            Top = 38
            Width = 37
            Height = 13
            Caption = 'Period :'
          end
          object nm8: TLabel
            Left = 208
            Top = 67
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object GroundSpeed6: TLabel
            Left = 3
            Top = 97
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object nm7: TLabel
            Left = 208
            Top = 38
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object degreesT3: TLabel
            Left = 208
            Top = 9
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object edtAmplitude2: TEdit
            Left = 105
            Top = 63
            Width = 97
            Height = 21
            TabOrder = 0
          end
          object edtBaseCourse2: TEdit
            Left = 105
            Top = 5
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edtPeriod2: TEdit
            Left = 105
            Top = 34
            Width = 97
            Height = 21
            TabOrder = 2
          end
          object cbxGroundSpeed6: TComboBox
            Left = 105
            Top = 93
            Width = 233
            Height = 21
            TabOrder = 3
          end
        end
        object grbShadow: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 12
          Visible = False
          object TargetRange2: TLabel
            Left = 3
            Top = 43
            Width = 73
            Height = 13
            Caption = 'Target Range :'
          end
          object nm9: TLabel
            Left = 208
            Top = 43
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Target4: TLabel
            Left = 3
            Top = 7
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch5: TSpeedButton
            Left = 335
            Top = 2
            Width = 23
            Height = 22
            Caption = 'icon'
            Visible = False
          end
          object edtTargetRange2: TEdit
            Left = 105
            Top = 39
            Width = 97
            Height = 21
            TabOrder = 0
          end
          object edtTarget4: TEdit
            Left = 60
            Top = 3
            Width = 269
            Height = 21
            Enabled = False
            TabOrder = 1
          end
        end
        object grbEngagement: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 13
          Visible = False
          object TargetRange3: TLabel
            Left = 3
            Top = 43
            Width = 73
            Height = 13
            Caption = 'Target Range :'
          end
          object nm10: TLabel
            Left = 208
            Top = 43
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object Target5: TLabel
            Left = 3
            Top = 7
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch6: TSpeedButton
            Left = 335
            Top = 3
            Width = 23
            Height = 22
            Caption = 'icon'
            Visible = False
          end
          object edtTargetRange3: TEdit
            Left = 105
            Top = 39
            Width = 97
            Height = 21
            TabOrder = 0
          end
          object edtTarget5: TEdit
            Left = 60
            Top = 3
            Width = 269
            Height = 21
            Enabled = False
            TabOrder = 1
          end
        end
        object grbEvasion: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 14
          Visible = False
          object Target6: TLabel
            Left = 3
            Top = 7
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch7: TSpeedButton
            Left = 335
            Top = 2
            Width = 23
            Height = 22
            Caption = 'icon'
            Visible = False
          end
          object edtTarget6: TEdit
            Left = 48
            Top = 3
            Width = 281
            Height = 21
            Enabled = False
            TabOrder = 0
          end
        end
        object grbOutrun: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          TabOrder = 15
          Visible = False
          object Target7: TLabel
            Left = 3
            Top = 7
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch8: TSpeedButton
            Left = 335
            Top = 2
            Width = 23
            Height = 22
            Caption = 'icon'
            Visible = False
          end
          object edtTarget7: TEdit
            Left = 48
            Top = 3
            Width = 281
            Height = 21
            Enabled = False
            TabOrder = 0
          end
        end
        object grbWaypoint: TGroupBox
          Left = 3
          Top = 55
          Width = 362
          Height = 267
          Caption = 'Termination :'
          TabOrder = 16
          Visible = False
          object Type1: TLabel
            Left = 11
            Top = 23
            Width = 31
            Height = 13
            Caption = 'Type :'
          end
          object Heading: TLabel
            Left = 11
            Top = 50
            Width = 46
            Height = 13
            Caption = 'Heading :'
          end
          object Target8: TLabel
            Left = 11
            Top = 78
            Width = 39
            Height = 13
            Caption = 'Target :'
          end
          object btnSearch9: TSpeedButton
            Left = 336
            Top = 73
            Width = 23
            Height = 22
            Caption = 'icon'
            Visible = False
          end
          object degreesT4: TLabel
            Left = 236
            Top = 50
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object cbxType: TComboBox
            Left = 128
            Top = 19
            Width = 231
            Height = 21
            TabOrder = 0
          end
          object edtHeading: TEdit
            Left = 128
            Top = 46
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edtTarget8: TEdit
            Left = 64
            Top = 74
            Width = 266
            Height = 21
            Enabled = False
            TabOrder = 2
          end
          object btnEditWaypoint: TButton
            Left = 12
            Top = 223
            Width = 109
            Height = 25
            Caption = 'Edit Waypoints...'
            TabOrder = 3
          end
        end
      end
      object tabVertical: TTabSheet
        Caption = 'Vertical'
        ImageIndex = 2
      end
    end
  end
end
