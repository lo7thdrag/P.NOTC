object frmSensor: TfrmSensor
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Sensor'
  ClientHeight = 565
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inline fmSensor1: TfmSensor
    Left = 0
    Top = 0
    Width = 334
    Height = 565
    Align = alClient
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 334
    ExplicitHeight = 565
    inherited PanelALL: TPanel [0]
      Top = 111
      Width = 334
      Height = 454
      ExplicitTop = 111
      ExplicitWidth = 334
      ExplicitHeight = 454
      inherited PanelSensorControl: TPanel
        Width = 334
        Height = 454
        ExplicitWidth = 334
        ExplicitHeight = 454
        inherited grbVisualDetectorSensor: TGroupBox [0]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited Label257: TLabel
            Top = 5
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 5
          end
          inherited Bevel51: TBevel
            Top = 11
            Width = 248
            Height = 5
            ExplicitTop = 11
            ExplicitWidth = 248
            ExplicitHeight = 5
          end
          inherited Label258: TLabel
            Left = 184
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 184
          end
          inherited Label259: TLabel
            Left = 91
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 91
          end
          inherited sbVisualDetectorDisplayRangeShow: TSpeedButton
            Left = 65
            Top = 49
            Width = 89
            Height = 35
            Font.Height = -13
            ExplicitLeft = 65
            ExplicitTop = 49
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
          inherited sbVisualDetectorDisplayRangeHide: TSpeedButton
            Left = 65
            Top = 85
            Width = 89
            Height = 35
            Font.Height = -13
            ExplicitLeft = 65
            ExplicitTop = 85
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
          inherited sbVisualDetectorDisplayBlindZonesShow: TSpeedButton
            Left = 174
            Top = 49
            Width = 89
            Height = 35
            Font.Height = -13
            ExplicitLeft = 174
            ExplicitTop = 49
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
          inherited sbVisualDetectorDisplayBlindZonesHide: TSpeedButton
            Left = 174
            Top = 85
            Width = 89
            Height = 35
            Font.Height = -13
            ExplicitLeft = 174
            ExplicitTop = 85
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
        end
        inherited grbSonarControl: TGroupBox [1]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox2: TScrollBox
            Width = 324
            Height = 428
            ParentFont = False
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Bevel37: TBevel
              Left = 53
              Top = 9
              Width = 253
              Height = 5
              ExplicitLeft = 53
              ExplicitTop = 9
              ExplicitWidth = 253
              ExplicitHeight = 5
            end
            inherited Bevel43: TBevel
              Left = 54
              Top = 311
              Width = 260
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 311
              ExplicitWidth = 260
              ExplicitHeight = 5
            end
            inherited Label213: TLabel
              Left = 6
              Top = 3
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 6
              ExplicitTop = 3
            end
            inherited Label214: TLabel
              Left = 94
              Top = 18
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 94
              ExplicitTop = 18
            end
            inherited Label237: TLabel
              Left = 9
              Top = 304
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 9
              ExplicitTop = 304
            end
            inherited Label238: TLabel
              Left = 90
              Top = 319
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 90
              ExplicitTop = 319
            end
            inherited Label239: TLabel
              Left = 183
              Top = 319
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 183
              ExplicitTop = 319
            end
            inherited sbDisplayBlindHide: TSpeedButton
              Left = 172
              Top = 373
              Width = 86
              Height = 35
              ExplicitLeft = 172
              ExplicitTop = 373
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbDisplayBlindShow: TSpeedButton
              Left = 172
              Top = 337
              Width = 86
              Height = 35
              ExplicitLeft = 172
              ExplicitTop = 337
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbDisplayRangeHide: TSpeedButton
              Left = 65
              Top = 373
              Width = 86
              Height = 35
              ExplicitLeft = 65
              ExplicitTop = 373
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbDisplayRangeShow: TSpeedButton
              Left = 65
              Top = 337
              Width = 86
              Height = 35
              ExplicitLeft = 65
              ExplicitTop = 337
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbSonarControlModeActive: TSpeedButton
              Left = 66
              Top = 32
              Width = 86
              Height = 35
              ExplicitLeft = 66
              ExplicitTop = 32
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbSonarControlModeOff: TSpeedButton
              Left = 66
              Top = 104
              Width = 86
              Height = 35
              ExplicitLeft = 66
              ExplicitTop = 104
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbSonarControlModePassive: TSpeedButton
              Left = 66
              Top = 69
              Width = 86
              Height = 35
              ExplicitLeft = 66
              ExplicitTop = 69
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited lblRangeTIOW: TLabel
              Left = 183
              Top = 19
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 183
              ExplicitTop = 19
            end
            inherited btnRange1: TSpeedButton
              Left = 182
              Top = 35
              Height = 35
              ExplicitLeft = 182
              ExplicitTop = 35
              ExplicitHeight = 35
            end
            inherited btnRAnge2: TSpeedButton
              Left = 182
              Top = 69
              Height = 35
              ExplicitLeft = 182
              ExplicitTop = 69
              ExplicitHeight = 35
            end
            inherited btnRange3: TSpeedButton
              Left = 182
              Top = 105
              Height = 35
              ExplicitLeft = 182
              ExplicitTop = 105
              ExplicitHeight = 35
            end
            inherited pnlDeployment: TPanel
              Left = 3
              Top = 145
              Height = 153
              ExplicitLeft = 3
              ExplicitTop = 145
              ExplicitHeight = 153
              inherited Bevel39: TBevel
                Left = 79
                Top = 5
                Width = 224
                ExplicitLeft = 79
                ExplicitTop = 5
                ExplicitWidth = 224
              end
              inherited Bevel41: TBevel
                Left = 207
                Top = 20
                Height = 5
                ExplicitLeft = 207
                ExplicitTop = 20
                ExplicitHeight = 5
              end
              inherited Bevel42: TBevel
                Left = 169
                Top = 84
                Width = 134
                Height = 5
                ExplicitLeft = 169
                ExplicitTop = 84
                ExplicitWidth = 134
                ExplicitHeight = 5
              end
              inherited Label215: TLabel
                Left = 42
                Top = 17
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 42
                ExplicitTop = 17
              end
              inherited Label216: TLabel
                Top = -2
                Font.Color = clBlack
                ParentFont = False
                ExplicitTop = -2
              end
              inherited Label221: TLabel
                Left = 138
                Top = 34
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 138
                ExplicitTop = 34
              end
              inherited Label222: TLabel
                Left = 138
                Top = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 138
                ExplicitTop = 56
              end
              inherited Label223: TLabel
                Left = 261
                Top = 34
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 261
                ExplicitTop = 34
              end
              inherited Label224: TLabel
                Left = 261
                Top = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 261
                ExplicitTop = 56
              end
              inherited Label226: TLabel
                Left = 17
                Top = 110
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 17
                ExplicitTop = 110
              end
              inherited Label228: TLabel
                Left = 138
                Top = 97
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 138
                ExplicitTop = 97
              end
              inherited Label229: TLabel
                Left = 138
                Top = 113
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 138
                ExplicitTop = 113
              end
              inherited Label232: TLabel
                Left = 261
                Top = 97
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 261
                ExplicitTop = 97
              end
              inherited Label233: TLabel
                Left = 261
                Top = 114
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 261
                ExplicitTop = 114
              end
              inherited Label234: TLabel
                Left = 137
                Top = 131
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 137
                ExplicitTop = 131
              end
              inherited Label236: TLabel
                Left = 261
                Top = 131
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 261
                ExplicitTop = 131
              end
              inherited LabelCablePayout: TLabel
                Left = 125
                Top = 14
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 125
                ExplicitTop = 14
              end
              inherited LabelDepth: TLabel
                Left = 126
                Top = 78
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 126
                ExplicitTop = 78
              end
              inherited lbCableActual: TLabel
                Left = 217
                Top = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 217
                ExplicitTop = 56
              end
              inherited lbDepthActual: TLabel
                Left = 217
                Top = 114
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 217
                ExplicitTop = 114
              end
              inherited lbDepthSettled: TLabel
                Left = 217
                Top = 97
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 217
                ExplicitTop = 97
              end
              inherited lbDepthTow: TLabel
                Left = 217
                Top = 131
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 217
                ExplicitTop = 131
              end
              inherited lblStatusDeployment: TLabel
                Left = 67
                Top = 110
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 67
                ExplicitTop = 110
              end
              inherited sbDeploymentActiondeploy: TSpeedButton
                Left = 21
                Top = 34
                Width = 78
                Height = 35
                ExplicitLeft = 21
                ExplicitTop = 34
                ExplicitWidth = 78
                ExplicitHeight = 35
              end
              inherited sbDeploymentActionShow: TSpeedButton
                Left = 21
                Top = 69
                Width = 78
                Height = 35
                ExplicitLeft = 21
                ExplicitTop = 69
                ExplicitWidth = 78
                ExplicitHeight = 35
              end
              inherited editCableOrdered: TEdit
                Left = 216
                Top = 30
                Width = 40
                Height = 24
                Font.Height = -13
                ExplicitLeft = 216
                ExplicitTop = 30
                ExplicitWidth = 40
                ExplicitHeight = 24
              end
            end
          end
        end
        inherited grbSearchRadarControl: TGroupBox [2]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox1: TScrollBox
            Width = 324
            Height = 428
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Label189: TLabel
              Top = 3
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 3
            end
            inherited Bevel28: TBevel
              Left = 53
              Top = 10
              Width = 251
              ExplicitLeft = 53
              ExplicitTop = 10
              ExplicitWidth = 251
            end
            inherited Label193: TLabel
              Left = 56
              Top = 22
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 56
              ExplicitTop = 22
            end
            inherited Label194: TLabel
              Left = 232
              Top = 21
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 21
            end
            inherited Label261: TLabel
              Top = 277
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 277
            end
            inherited Bevel31: TBevel
              Left = 56
              Top = 282
              Width = 248
              ExplicitLeft = 56
              ExplicitTop = 282
              ExplicitWidth = 248
            end
            inherited Label262: TLabel
              Left = 49
              Top = 293
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 49
              ExplicitTop = 293
            end
            inherited Label263: TLabel
              Left = 131
              Top = 293
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 131
              ExplicitTop = 293
            end
            inherited Label264: TLabel
              Top = 293
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 293
            end
            inherited btnControlComboInterval: TSpeedButton
              Left = 279
              Top = 140
              Width = 25
              Height = 25
              ExplicitLeft = 279
              ExplicitTop = 140
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited sbControlEccmOn: TSpeedButton
              Left = 207
              Top = 39
              Width = 83
              Height = 35
              Font.Height = -13
              ExplicitLeft = 207
              ExplicitTop = 39
              ExplicitWidth = 83
              ExplicitHeight = 35
            end
            inherited sbControlEccmOff: TSpeedButton
              Left = 207
              Top = 73
              Width = 83
              Height = 35
              Font.Height = -13
              ExplicitLeft = 207
              ExplicitTop = 73
              ExplicitWidth = 83
              ExplicitHeight = 35
            end
            inherited sbRangeShow: TSpeedButton
              Left = 24
              Top = 311
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitLeft = 24
              ExplicitTop = 311
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbRangeHide: TSpeedButton
              Left = 24
              Top = 346
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitLeft = 24
              ExplicitTop = 346
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbBlindShow: TSpeedButton
              Top = 311
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitTop = 311
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbScanShow: TSpeedButton [15]
              Left = 216
              Top = 311
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitLeft = 216
              ExplicitTop = 311
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbScanHide: TSpeedButton [16]
              Left = 216
              Top = 346
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitLeft = 216
              ExplicitTop = 346
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited sbBlindHide: TSpeedButton [17]
              Top = 346
              Width = 86
              Height = 35
              Font.Height = -13
              ExplicitTop = 346
              ExplicitWidth = 86
              ExplicitHeight = 35
            end
            inherited cbActivationInterval: TCheckBox [18]
              Left = 12
              Top = 145
              Width = 120
              Height = 14
              Color = clWhite
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 12
              ExplicitTop = 145
              ExplicitWidth = 120
              ExplicitHeight = 14
            end
            inherited editComboInterval: TEdit [19]
              Left = 139
              Top = 140
              Height = 24
              Font.Height = -13
              ExplicitLeft = 139
              ExplicitTop = 140
              ExplicitHeight = 24
            end
            inherited btShowRangeAltitude: TButton [20]
              Left = 3
              Top = 385
              Width = 150
              Height = 35
              Font.Height = -13
              ExplicitLeft = 3
              ExplicitTop = 385
              ExplicitWidth = 150
              ExplicitHeight = 35
            end
            inherited btExecuteSingleScan: TButton [21]
              Left = 171
              Top = 385
              Width = 150
              Height = 35
              Font.Height = -13
              ExplicitLeft = 171
              ExplicitTop = 385
              ExplicitWidth = 150
              ExplicitHeight = 35
            end
            inherited pnlScanSector: TPanel [22]
              Left = 5
              Top = 164
              Width = 309
              Height = 118
              ExplicitLeft = 5
              ExplicitTop = 164
              ExplicitWidth = 309
              ExplicitHeight = 118
              inherited Bevel30: TBevel
                Left = 82
                Top = 12
                Width = 217
                ExplicitLeft = 82
                ExplicitTop = 12
                ExplicitWidth = 217
              end
              inherited Label200: TLabel
                Left = 6
                Top = 4
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 6
                ExplicitTop = 4
              end
              inherited Label201: TLabel
                Left = 36
                Top = 22
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 36
                ExplicitTop = 22
              end
              inherited sbScanModePartial: TSpeedButton
                Left = 12
                Top = 75
                Width = 79
                Height = 35
                Font.Height = -13
                ExplicitLeft = 12
                ExplicitTop = 75
                ExplicitWidth = 79
                ExplicitHeight = 35
              end
              inherited sbScanModeFull: TSpeedButton
                Left = 12
                Top = 41
                Width = 79
                Height = 35
                Font.Height = -13
                ExplicitLeft = 12
                ExplicitTop = 41
                ExplicitWidth = 79
                ExplicitHeight = 35
              end
              inherited Label202: TLabel
                Left = 124
                Top = 31
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 124
                ExplicitTop = 31
              end
              inherited Label203: TLabel
                Left = 124
                Top = 70
                Width = 34
                Caption = 'End  :'
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 124
                ExplicitTop = 70
                ExplicitWidth = 34
              end
              inherited Label205: TLabel
                Left = 214
                Top = 70
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 214
                ExplicitTop = 70
              end
              inherited Label204: TLabel
                Left = 213
                Top = 31
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 213
                ExplicitTop = 31
              end
              inherited btnComboScanStrart: TSpeedButton
                Left = 273
                Top = 27
                Width = 25
                Height = 25
                ExplicitLeft = 273
                ExplicitTop = 27
                ExplicitWidth = 25
                ExplicitHeight = 25
              end
              inherited editScanStart: TEdit
                Left = 167
                Width = 40
                Height = 24
                Font.Height = -13
                ExplicitLeft = 167
                ExplicitWidth = 40
                ExplicitHeight = 24
              end
              inherited editScanEnd: TEdit
                Left = 167
                Top = 66
                Width = 40
                Height = 24
                Font.Height = -13
                ExplicitLeft = 167
                ExplicitTop = 66
                ExplicitWidth = 40
                ExplicitHeight = 24
              end
            end
            inherited pnlControlRadar: TPanel
              Left = 12
              Top = 39
              Width = 114
              Height = 90
              ExplicitLeft = 12
              ExplicitTop = 39
              ExplicitWidth = 114
              ExplicitHeight = 90
              inherited btnControlModeOff2: TSpeedButton
                Left = 0
                Top = 34
                Width = 110
                Height = 35
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 0
                ExplicitTop = 34
                ExplicitWidth = 110
                ExplicitHeight = 35
              end
              inherited btnControlModeOn: TSpeedButton
                Left = 0
                Top = 0
                Width = 110
                Height = 35
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 110
                ExplicitHeight = 35
              end
            end
            inherited pnlControlModeRadar2: TPanel
              Left = 12
              Top = 35
              Width = 110
              Height = 110
              ExplicitLeft = 12
              ExplicitTop = 35
              ExplicitWidth = 110
              ExplicitHeight = 110
              inherited sbControlModeSearch: TSpeedButton
                Left = 0
                Top = 4
                Width = 110
                Height = 35
                Font.Height = -13
                ExplicitLeft = 0
                ExplicitTop = 4
                ExplicitWidth = 110
                ExplicitHeight = 35
              end
              inherited sbControlModeTrack: TSpeedButton
                Left = 0
                Top = 38
                Width = 110
                Height = 35
                Font.Height = -13
                ExplicitLeft = 0
                ExplicitTop = 38
                ExplicitWidth = 110
                ExplicitHeight = 35
              end
              inherited sbControlModeOff: TSpeedButton
                Left = 0
                Top = 72
                Width = 110
                Height = 35
                Font.Height = -13
                ExplicitLeft = 0
                ExplicitTop = 72
                ExplicitWidth = 110
                ExplicitHeight = 35
              end
            end
          end
        end
        inherited grbIFFInterrogatorControl: TGroupBox
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox5: TScrollBox
            Width = 324
            Height = 428
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Bevel5: TBevel
              Left = 53
              Top = 9
              Width = 248
              Height = 5
              ExplicitLeft = 53
              ExplicitTop = 9
              ExplicitWidth = 248
              ExplicitHeight = 5
            end
            inherited Bevel6: TBevel
              Left = 134
              Top = 201
              Width = 167
              Height = 5
              ExplicitLeft = 134
              ExplicitTop = 201
              ExplicitWidth = 167
              ExplicitHeight = 5
            end
            inherited Bevel7: TBevel
              Left = 49
              Top = 136
              Width = 252
              Height = 5
              ExplicitLeft = 49
              ExplicitTop = 136
              ExplicitWidth = 252
              ExplicitHeight = 5
            end
            inherited btnIFFInterrogatorTrackSearch: TSpeedButton
              Top = 147
              Width = 40
              Height = 40
              Glyph.Data = {
                D21B0000424DD21B00000000000042000000280000002A0000002A0000000100
                200003000000901B0000130B0000130B000000000000000000000000FF0000FF
                0000FF000000E6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF817F7FFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF817F7FFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A
                9AFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFD8D3D3FF8F8C8CFF565454FF2B2A2AFF0E0E0EFF0000
                00FF000000FF0E0E0EFF2B2A2AFF575454FF908C8CFFD8D3D3FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFC9C5C5FF565454FF000000FF484646FF817E7EFFACA8
                A8FFD8D3D3FF393838FF3A3838FFD8D3D3FFBBB6B6FF817E7EFF393838FF1C1C
                1CFF656262FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFD7D3D3FF646262FF1D1C1CFF727070FFC9C5C5FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFD8D3D3FF727070FF0E0E0EFF656363FFD8D3D3FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF1C1C1CFF565454FFC9C5C5FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF646262FF1D1C
                1CFFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFBAB7B7FF1C1C1CFF817E7EFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF807E7EFF1D1C1CFFBAB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF1C1C1CFF908D
                8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8D8DFF1D1C1CFFC9C5C5FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF1C1C
                1CFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF807E
                7EFF1D1C1CFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF646262FF646363FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF565454FF656363FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFC9C5C5FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF1C1C1CFFC9C5C5FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FF646262FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7270
                70FF565454FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFD7D3D3FF1D1C1CFFD8D3D3FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFC9C5C5FF000000FFD8D3D3FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF8F8C8CFF3938
                38FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF484646FF908D8DFFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF565454FF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF817E7EFF5654
                54FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF2B2A2AFFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFBBB6B6FFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFACA8A8FF2B2A2AFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFD7D3D3FF0E0E0EFFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF000000FF3A38
                38FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF3A38
                38FF3A3838FF3A3838FF3A3838FFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFBBB6B6FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF3A38
                38FF3A3838FF3A3838FF3A3838FF3A3838FF3A3838FF000000FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF000000FF393838FF393838FF393838FF393838FF393838FF393838FF3938
                38FF393838FF393838FF393838FF393838FF393838FFBBB7B7FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBAB6B6FF393838FF393838FF393838FF393838FF3938
                38FF393838FF393838FF393838FF393838FF393838FF393838FF393838FF0000
                00FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFD7D3D3FF0E0E0EFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF2B2A2AFFADA9A9FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFBBB6B6FFBBB7B7FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBBB6B6FF2B2A2AFFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF565454FF817E
                7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF817E7EFF575454FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF8F8C8CFF484646FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF908C
                8CFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFD7D3D3FF000000FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3
                D3FF1D1C1CFFD8D3D3FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FF565454FF737171FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FF656262FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5
                C5FF1D1C1CFFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFD7D3D3FF0E0E0EFFC9C5C5FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF646262FF565454FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF646262FF646363FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF1C1C1CFF817F7FFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF817E7EFF1D1C1CFFD8D3
                D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5
                C5FF1C1C1CFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8D8DFF1D1C
                1CFFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBAB7B7FF1C1C1CFF817F7FFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF393838FF3A3838FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF817E
                7EFF1D1C1CFFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF1C1C1CFF6563
                63FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF3938
                38FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5
                C5FF565454FF1D1C1CFFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFD8D3D3FF646262FF0E0E0EFF737171FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF393838FF3A3838FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5
                C5FF737171FF1C1C1CFF646363FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF656262FF1C1C1CFF3A38
                38FF817E7EFFBBB7B7FFD8D3D3FF393838FF3A3838FFD8D3D3FFADA9A9FF817E
                7EFF484646FF000000FF565454FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFD8D3D3FF8F8C8CFF565454FF2B2A2AFF0E0E0EFF000000FF000000FF0E0E
                0EFF2B2A2AFF565454FF908D8DFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF9F9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF817E7EFFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF9E9B9BFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF908D8DFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF}
              OnClick = fmSensor1btnIFFInterrogatorTrackSearchClick
              ExplicitTop = 147
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited Label10: TLabel
              Top = 3
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 3
            end
            inherited Label11: TLabel
              Left = 75
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 75
            end
            inherited Label12: TLabel
              Top = 195
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 195
            end
            inherited Label13: TLabel
              Top = 130
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 130
            end
            inherited sbIFFInterrogatorControlModeOff: TSpeedButton
              Left = 46
              Top = 75
              Width = 89
              Height = 35
              ExplicitLeft = 46
              ExplicitTop = 75
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbIFFInterrogatorControlModeOn: TSpeedButton
              Left = 46
              Top = 39
              Width = 89
              Height = 35
              ExplicitLeft = 46
              ExplicitTop = 39
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited btnManual: TSpeedButton
              Left = 188
              Top = 75
              Width = 89
              Height = 35
              ExplicitLeft = 188
              ExplicitTop = 75
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited btnAutomatic: TSpeedButton
              Left = 188
              Top = 39
              Width = 89
              Height = 35
              ExplicitLeft = 188
              ExplicitTop = 39
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited lblInterrogation: TLabel
              Left = 195
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 195
            end
            inherited cbbtnIFFInterrogatorMode1: TCheckBox
              Top = 221
              Width = 75
              Caption = 'Mode 1   :'
              ParentFont = False
              ExplicitTop = 221
              ExplicitWidth = 75
            end
            inherited cbbtnIFFInterrogatorMode2: TCheckBox
              Top = 249
              Width = 75
              Caption = 'Mode 2   :'
              ParentFont = False
              ExplicitTop = 249
              ExplicitWidth = 75
            end
            inherited cbbtnIFFInterrogatorMode3: TCheckBox
              Top = 277
              Width = 75
              Caption = 'Mode 3   :'
              ParentFont = False
              ExplicitTop = 277
              ExplicitWidth = 75
            end
            inherited cbbtnIFFInterrogatorMode3C: TCheckBox
              Top = 305
              Width = 75
              ParentFont = False
              ExplicitTop = 305
              ExplicitWidth = 75
            end
            inherited cbbtnIFFInterrogatorMode4: TCheckBox
              Top = 333
              Width = 75
              Caption = 'Mode 4   :'
              ParentFont = False
              ExplicitTop = 333
              ExplicitWidth = 75
            end
            inherited editbtnIFFInterrogatorTrack: TEdit
              Top = 155
              Height = 24
              Font.Height = -13
              ExplicitTop = 155
              ExplicitHeight = 24
            end
            inherited edtIFFInterrogatorMode1: TEdit
              Left = 96
              Top = 217
              Width = 25
              ExplicitLeft = 96
              ExplicitTop = 217
              ExplicitWidth = 25
            end
            inherited edtIFFInterrogatorMode2: TEdit
              Left = 96
              Top = 245
              ExplicitLeft = 96
              ExplicitTop = 245
            end
            inherited edtIFFInterrogatorMode3: TEdit
              Left = 96
              Top = 273
              ExplicitLeft = 96
              ExplicitTop = 273
            end
          end
        end
        inherited grbAnomalyDetectorSensor: TGroupBox [4]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited Label225: TLabel
            Top = 5
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 5
          end
          inherited Bevel47: TBevel
            Left = 52
            Top = 12
            Width = 261
            Height = 5
            ExplicitLeft = 52
            ExplicitTop = 12
            ExplicitWidth = 261
            ExplicitHeight = 5
          end
          inherited Label230: TLabel
            Left = 48
            Top = 29
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 48
            ExplicitTop = 29
          end
          inherited sbAnomalyDetectorControlModeOn: TSpeedButton
            Left = 21
            Width = 85
            Height = 35
            Font.Height = -13
            ExplicitLeft = 21
            ExplicitWidth = 85
            ExplicitHeight = 35
          end
          inherited sbAnomalyDetectorControlModeOff: TSpeedButton
            Left = 21
            Top = 88
            Width = 85
            Height = 35
            Font.Height = -13
            ExplicitLeft = 21
            ExplicitTop = 88
            ExplicitWidth = 85
            ExplicitHeight = 35
          end
        end
        inherited grbSonobuoyControl: TGroupBox [5]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox7: TScrollBox
            Width = 324
            Height = 428
            ParentColor = False
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Bevel10: TBevel
              Left = 52
              Top = 9
              Width = 251
              Height = 5
              ExplicitLeft = 52
              ExplicitTop = 9
              ExplicitWidth = 251
              ExplicitHeight = 5
            end
            inherited Bevel11: TBevel
              Left = 52
              Top = 61
              Width = 251
              Height = 5
              ExplicitLeft = 52
              ExplicitTop = 61
              ExplicitWidth = 251
              ExplicitHeight = 5
            end
            inherited Bevel12: TBevel
              Left = 54
              Top = 182
              Width = 250
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 182
              ExplicitWidth = 250
              ExplicitHeight = 5
            end
            inherited btnSonobuoyControlCombo: TSpeedButton
              Left = 278
              Top = 68
              Width = 25
              Height = 25
              ExplicitLeft = 278
              ExplicitTop = 68
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited Label17: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label18: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label19: TLabel
              Left = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 25
            end
            inherited Label20: TLabel
              Left = 102
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 102
            end
            inherited Label21: TLabel
              Left = 25
              Top = 117
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 25
              ExplicitTop = 117
            end
            inherited Label22: TLabel
              Top = 117
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 117
            end
            inherited Label23: TLabel
              Top = 176
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 176
            end
            inherited Label24: TLabel
              Top = 197
              Width = 156
              Caption = 'Platform Monitor Capacity :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 197
              ExplicitWidth = 156
            end
            inherited Label25: TLabel
              Top = 219
              Width = 157
              Caption = 'Currently Monitoring         :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 219
              ExplicitWidth = 157
            end
            inherited Label26: TLabel
              Left = 228
              Top = 197
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 228
              ExplicitTop = 197
            end
            inherited Label27: TLabel
              Left = 228
              Top = 219
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 228
              ExplicitTop = 219
            end
            inherited lblSonobuoyMonitorCurrently: TLabel
              Left = 203
              Top = 219
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 203
              ExplicitTop = 219
            end
            inherited lblSonobuoyMonitorPlatform: TLabel
              Left = 201
              Top = 197
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 201
              ExplicitTop = 197
            end
            inherited lblStatusSonobuoy: TLabel
              Left = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 25
            end
            inherited lbStatusQuantity: TLabel
              Left = 165
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 165
            end
            inherited btnSonobuoyControlDeploy: TButton
              Left = 220
              Top = 138
              Width = 84
              Height = 35
              ParentFont = False
              ExplicitLeft = 220
              ExplicitTop = 138
              ExplicitWidth = 84
              ExplicitHeight = 35
            end
            inherited editControlDepth: TEdit
              Top = 113
              ExplicitTop = 113
            end
          end
        end
        inherited grbIFFTransponderControl: TGroupBox [6]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox6: TScrollBox
            Width = 324
            Height = 428
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Bevel8: TBevel
              Left = 52
              Width = 260
              ExplicitLeft = 52
              ExplicitWidth = 260
            end
            inherited Bevel9: TBevel
              Left = 132
              Top = 137
              Width = 180
              ExplicitLeft = 132
              ExplicitTop = 137
              ExplicitWidth = 180
            end
            inherited Label14: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label15: TLabel
              Left = 50
              Top = 20
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 50
              ExplicitTop = 20
            end
            inherited Label16: TLabel
              Top = 130
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 130
            end
            inherited sbIFFTransponderControlModeOff: TSpeedButton
              Left = 21
              Top = 76
              Width = 89
              Height = 35
              ExplicitLeft = 21
              ExplicitTop = 76
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbIFFTransponderControlModeOn: TSpeedButton
              Left = 21
              Top = 39
              Width = 89
              Height = 35
              ExplicitLeft = 21
              ExplicitTop = 39
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited cbIFFTransponderControlMode1: TCheckBox
              Left = 21
              Top = 154
              Width = 75
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 154
              ExplicitWidth = 75
            end
            inherited cbIFFTransponderControlMode2: TCheckBox
              Left = 21
              Top = 182
              Width = 75
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 182
              ExplicitWidth = 75
            end
            inherited cbIFFTransponderControlMode3: TCheckBox
              Left = 21
              Top = 211
              Width = 75
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 211
              ExplicitWidth = 75
            end
            inherited cbIFFTransponderControlMode3C: TCheckBox
              Left = 21
              Top = 239
              Width = 75
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 239
              ExplicitWidth = 75
            end
            inherited cbIFFTransponderControlMode4: TCheckBox
              Left = 21
              Top = 268
              Width = 75
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 268
              ExplicitWidth = 75
            end
            inherited edtIFFTransponderControlMode1: TEdit
              Left = 102
              Top = 152
              Width = 49
              Height = 24
              Font.Height = -13
              Text = '0000'
              ExplicitLeft = 102
              ExplicitTop = 152
              ExplicitWidth = 49
              ExplicitHeight = 24
            end
            inherited edtIFFTransponderControlMode2: TEdit
              Left = 102
              Top = 178
              Height = 24
              Font.Height = -13
              ExplicitLeft = 102
              ExplicitTop = 178
              ExplicitHeight = 24
            end
            inherited edtIFFTransponderControlMode3: TEdit
              Left = 102
              Top = 207
              Height = 24
              Font.Height = -13
              ExplicitLeft = 102
              ExplicitTop = 207
              ExplicitHeight = 24
            end
          end
        end
        inherited grbESMSensorControl: TGroupBox [7]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox4: TScrollBox
            Width = 324
            Height = 428
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Label6: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Bevel3: TBevel
              Left = 53
              Top = 9
              Height = 5
              ExplicitLeft = 53
              ExplicitTop = 9
              ExplicitHeight = 5
            end
            inherited Label7: TLabel
              Left = 48
              Top = 19
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 48
              ExplicitTop = 19
            end
            inherited Label8: TLabel
              Top = 126
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 126
            end
            inherited Bevel4: TBevel
              Top = 132
              Height = 5
              ExplicitTop = 132
              ExplicitHeight = 5
            end
            inherited Label9: TLabel
              Left = 32
              Top = 145
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 32
              ExplicitTop = 145
            end
            inherited sbESMSensorControlModeOn: TSpeedButton
              Left = 19
              Top = 39
              Width = 89
              Height = 35
              ExplicitLeft = 19
              ExplicitTop = 39
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbESMSensorControlModeOff: TSpeedButton
              Left = 19
              Top = 76
              Width = 89
              Height = 35
              ExplicitLeft = 19
              ExplicitTop = 76
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbESMSensorDisplayBlindZoneShow: TSpeedButton
              Left = 22
              Top = 163
              Width = 89
              Height = 35
              ExplicitLeft = 22
              ExplicitTop = 163
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbESMSensorDisplayBlindZoneHide: TSpeedButton
              Left = 22
              Top = 199
              Width = 89
              Height = 35
              ExplicitLeft = 22
              ExplicitTop = 199
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
          end
        end
        inherited grbElectroOpticalSensor: TGroupBox [8]
          Width = 328
          Height = 448
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 328
          ExplicitHeight = 448
          inherited ScrollBox3: TScrollBox [0]
            Width = 324
            Height = 428
            ExplicitWidth = 324
            ExplicitHeight = 428
            inherited Label1: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Bevel1: TBevel
              Left = 53
              Top = 9
              Height = 5
              ExplicitLeft = 53
              ExplicitTop = 9
              ExplicitHeight = 5
            end
            inherited Label2: TLabel
              Left = 54
              Top = 20
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 54
              ExplicitTop = 20
            end
            inherited Label3: TLabel
              Top = 127
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 127
            end
            inherited Bevel2: TBevel
              Top = 133
              Height = 5
              ExplicitTop = 133
              ExplicitHeight = 5
            end
            inherited Label4: TLabel
              Left = 157
              Top = 148
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 157
              ExplicitTop = 148
            end
            inherited Label5: TLabel
              Left = 63
              Top = 148
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 63
              ExplicitTop = 148
            end
            inherited sbElectroOpticalSensorDisplayRangeShow: TSpeedButton
              Left = 37
              Top = 167
              Width = 89
              Height = 35
              ExplicitLeft = 37
              ExplicitTop = 167
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbElectroOpticalSensorDisplayRangeHide: TSpeedButton
              Left = 37
              Top = 205
              Width = 89
              Height = 35
              ExplicitLeft = 37
              ExplicitTop = 205
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbElectroOpticalSensorBlindZoneShow: TSpeedButton
              Left = 147
              Top = 167
              Width = 89
              Height = 35
              ExplicitLeft = 147
              ExplicitTop = 167
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbElectroOpticalSensorBlindZoneHide: TSpeedButton
              Left = 147
              Top = 205
              Width = 89
              Height = 35
              ExplicitLeft = 147
              ExplicitTop = 205
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbElectroOpticalSensorControlModeOn: TSpeedButton
              Left = 37
              Top = 36
              Width = 89
              Height = 35
              ExplicitLeft = 37
              ExplicitTop = 36
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
            inherited sbElectroOpticalSensorControlModeOff: TSpeedButton
              Left = 37
              Width = 89
              Height = 35
              ExplicitLeft = 37
              ExplicitWidth = 89
              ExplicitHeight = 35
            end
          end
          inherited btnElectroOpticalSensorExecuteSingleScan: TButton [1]
            Height = 35
            ParentFont = False
            ExplicitHeight = 35
          end
        end
      end
    end
    inherited PanelSpace: TPanel [1]
      Top = 111
      Width = 334
      Height = 0
      Color = 4012087
      Font.Height = -13
      ParentFont = False
      ExplicitTop = 111
      ExplicitWidth = 334
      ExplicitHeight = 0
    end
    inherited PanelSensorChoices: TPanel [2]
      Width = 334
      Height = 111
      Font.Height = -13
      ParentFont = False
      ExplicitWidth = 334
      ExplicitHeight = 111
      inherited lstSensor: TListView
        Width = 332
        Height = 109
        ExplicitWidth = 332
        ExplicitHeight = 109
      end
    end
    inherited pmModeSonobuoy: TPopupMenu
      Left = 312
      Top = 448
    end
  end
end
