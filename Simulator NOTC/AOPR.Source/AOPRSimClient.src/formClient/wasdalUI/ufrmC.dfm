object frmCM: TfrmCM
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Countermeasure'
  ClientHeight = 505
  ClientWidth = 361
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
  object lblType: TLabel
    Left = 18
    Top = 34
    Width = 28
    Height = 16
    Caption = 'Type'
    Color = 4012087
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnFace
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  inline fmCounterMeasure1: TfmCounterMeasure
    Left = 0
    Top = 0
    Width = 361
    Height = 505
    Align = alClient
    Color = 4012086
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    ExplicitWidth = 361
    ExplicitHeight = 505
    inherited PanelALL: TPanel
      Width = 361
      Height = 391
      ExplicitWidth = 361
      ExplicitHeight = 391
      inherited PanelCounterMeasure: TPanel
        Width = 361
        Height = 391
        ExplicitWidth = 361
        ExplicitHeight = 391
        inherited grbAirborneChaff: TGroupBox [0]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited Label510: TLabel
            Font.Color = clBlack
            ParentFont = False
          end
          inherited Label511: TLabel
            Top = 67
            Width = 60
            Caption = 'Quantity  :'
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 67
            ExplicitWidth = 60
          end
          inherited Label516: TLabel
            Top = 34
            Width = 61
            Caption = 'Type       :'
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 34
            ExplicitWidth = 61
          end
          inherited Bevel110: TBevel
            Left = 80
            Top = 11
            Width = 227
            Height = 5
            ExplicitLeft = 80
            ExplicitTop = 11
            ExplicitWidth = 227
            ExplicitHeight = 5
          end
          inherited lbChaffAirboneQuantity: TLabel
            Top = 67
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 67
          end
          inherited btnAirboneChaffType: TSpeedButton
            Left = 279
            Top = 27
            Width = 30
            Height = 30
            ExplicitLeft = 279
            ExplicitTop = 27
            ExplicitWidth = 30
            ExplicitHeight = 30
          end
          inherited editChaffAirboneType: TEdit
            Top = 30
            ParentFont = False
            ExplicitTop = 30
          end
          inherited btnChaffAirboneDeploy: TButton
            Top = 102
            Width = 89
            Height = 35
            ParentFont = False
            ExplicitTop = 102
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
        end
        inherited grbAcousticDecoy: TGroupBox
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited ScrollBox1: TScrollBox
            Width = 357
            Height = 371
            ParentColor = False
            ExplicitWidth = 357
            ExplicitHeight = 371
            inherited Label1: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Bevel1: TBevel
              Left = 83
              Top = 3
              Height = 5
              ExplicitLeft = 83
              ExplicitTop = 3
              ExplicitHeight = 5
            end
            inherited Label2: TLabel
              Top = 215
              Width = 80
              Caption = 'Mode           :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 215
              ExplicitWidth = 80
            end
            inherited Label3: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label4: TLabel
              Left = 53
              Top = 16
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 53
              ExplicitTop = 16
            end
            inherited Label5: TLabel
              Top = 98
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 98
            end
            inherited Bevel2: TBevel
              Left = 57
              Top = 104
              Width = 248
              Height = 5
              ExplicitLeft = 57
              ExplicitTop = 104
              ExplicitWidth = 248
              ExplicitHeight = 5
            end
            inherited Label6: TLabel
              Left = 43
              Top = 113
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 43
              ExplicitTop = 113
            end
            inherited Label7: TLabel
              Left = 146
              Top = 113
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 146
              ExplicitTop = 113
            end
            inherited Label8: TLabel
              Top = 244
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 244
            end
            inherited Label9: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited btnComboAcousticDecoyMode: TSpeedButton
              Left = 282
              Top = 211
              Width = 25
              Height = 25
              ExplicitLeft = 282
              ExplicitTop = 211
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnComboAcousticDecoyFilter: TSpeedButton
              Left = 282
              Top = 240
              Width = 25
              Height = 25
              ExplicitLeft = 282
              ExplicitTop = 240
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited sbAcousticDecoyActionDeploy: TSpeedButton
              Left = 26
              Top = 31
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 26
              ExplicitTop = 31
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbAcousticDecoyActionStow: TSpeedButton
              Left = 26
              Top = 60
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 26
              ExplicitTop = 60
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbAcousticDecoyActivationOn: TSpeedButton
              Left = 26
              Top = 130
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 26
              ExplicitTop = 130
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbAcousticDecoyActivationOff: TSpeedButton
              Left = 26
              Top = 159
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 26
              ExplicitTop = 159
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbAcousticDecoyCycleTimerOn: TSpeedButton
              Left = 136
              Top = 130
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 136
              ExplicitTop = 130
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbAcousticDecoyCycleTimerOff: TSpeedButton
              Left = 136
              Top = 159
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 136
              ExplicitTop = 159
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited edtAcousticDecoyMode: TEdit
              Left = 108
              Top = 211
              ParentFont = False
              ExplicitLeft = 108
              ExplicitTop = 211
            end
            inherited edtAcousticDecoyFilter: TEdit
              Left = 108
              Top = 240
              ParentFont = False
              ExplicitLeft = 108
              ExplicitTop = 240
            end
          end
        end
        inherited grbFloatingDecoy: TGroupBox [2]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited Label502: TLabel
            Top = 5
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 5
          end
          inherited Bevel114: TBevel
            Left = 83
            Top = 11
            Width = 222
            Height = 5
            ExplicitLeft = 83
            ExplicitTop = 11
            ExplicitWidth = 222
            ExplicitHeight = 5
          end
          inherited Label550: TLabel
            Top = 33
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 33
          end
          inherited lbFloatingDecoyQuantity: TLabel
            Top = 33
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 33
          end
          inherited btnFloatingDecoyDeploy: TButton
            Left = 216
            Top = 24
            Width = 89
            Height = 35
            ParentFont = False
            ExplicitLeft = 216
            ExplicitTop = 24
            ExplicitWidth = 89
            ExplicitHeight = 35
          end
        end
        inherited grbOnBoardSelfDefenseJammer: TGroupBox [3]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited ScrollBox5: TScrollBox
            Width = 357
            Height = 371
            ParentColor = False
            ExplicitWidth = 357
            ExplicitHeight = 371
            inherited Bevel112: TBevel
              Left = 57
              Top = 3
              Width = 244
              Height = 5
              ExplicitLeft = 57
              ExplicitTop = 3
              ExplicitWidth = 244
              ExplicitHeight = 5
            end
            inherited Label542: TLabel
              Top = -3
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = -3
            end
            inherited Label543: TLabel
              Left = 161
              Top = 15
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 161
              ExplicitTop = 15
            end
            inherited Label544: TLabel
              Left = 60
              Top = 15
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 60
              ExplicitTop = 15
            end
            inherited sbOnBoardSelfDefenseJammerControlModeAuto: TSpeedButton
              Left = 31
              Top = 32
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 31
              ExplicitTop = 32
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbOnBoardSelfDefenseJammerControlModeManual: TSpeedButton
              Left = 31
              Top = 60
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 31
              ExplicitTop = 60
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbOnBoardSelfDefenseJammerControlModeOff: TSpeedButton
              Left = 31
              Top = 88
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 31
              ExplicitTop = 88
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbOnBoardSelfDefenseJammerControlTargetingSpot: TSpeedButton
              Left = 144
              Top = 32
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 144
              ExplicitTop = 32
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbOnBoardSelfDefenseJammerControlTargetingTrack: TSpeedButton
              Left = 144
              Top = 60
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 144
              ExplicitTop = 60
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited grbManualTrack: TGroupBox
              Top = 129
              ExplicitTop = 129
              inherited Label24: TLabel
                Left = 13
                Top = 22
                Width = 81
                Caption = 'Track           :'
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 13
                ExplicitTop = 22
                ExplicitWidth = 81
              end
              inherited btnSDJammerTarget: TSpeedButton
                Left = 181
                Top = 10
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
                OnClick = fmCounterMeasure1btnSDJammerTargetClick
                ExplicitLeft = 181
                ExplicitTop = 10
                ExplicitWidth = 40
                ExplicitHeight = 40
              end
              inherited edtSDJammerTarget: TEdit
                Left = 101
                Top = 18
                ParentFont = False
                ExplicitLeft = 101
                ExplicitTop = 18
              end
            end
            inherited grbManualSpot: TGroupBox
              Top = 129
              ExplicitTop = 129
              inherited Label547: TLabel
                Font.Color = clBlack
                ParentFont = False
              end
              inherited Label546: TLabel
                Top = 36
                Font.Color = clBlack
                ParentFont = False
                ExplicitTop = 36
              end
              inherited Label549: TLabel
                Left = 175
                Top = 8
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 175
                ExplicitTop = 8
              end
              inherited edtOnBoardSelfDefenseJammerSpotNumber: TEdit
                Left = 106
                Top = 33
                ParentFont = False
                ExplicitLeft = 106
                ExplicitTop = 33
              end
              inherited edtOnBoardSelfDefenseJammerBearing: TEdit
                Left = 106
                Top = 6
                ParentFont = False
                ExplicitLeft = 106
                ExplicitTop = 6
              end
            end
          end
        end
        inherited grbRadarNoiseJammer: TGroupBox [4]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited ScrollBox3: TScrollBox
            Width = 357
            Height = 371
            ParentColor = False
            ExplicitWidth = 357
            ExplicitHeight = 371
            inherited Bevel117: TBevel
              Left = 57
              Top = 3
              Width = 237
              Height = 5
              ExplicitLeft = 57
              ExplicitTop = 3
              ExplicitWidth = 237
              ExplicitHeight = 5
            end
            inherited btnComboRadarJammingControlMode: TSpeedButton
              Left = 297
              Top = 112
              Width = 30
              Height = 30
              ExplicitLeft = 297
              ExplicitTop = 112
              ExplicitWidth = 30
              ExplicitHeight = 30
            end
            inherited Label532: TLabel
              Top = 119
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 119
            end
            inherited Label557: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label558: TLabel
              Left = 31
              Top = 16
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 31
              ExplicitTop = 16
            end
            inherited sbRadarJammingControlActivationOn: TSpeedButton [5]
              Left = 14
              Top = 34
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 34
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbRadarJammingControlActivationOff: TSpeedButton [6]
              Left = 14
              Top = 63
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 63
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited cbRadarJammingControlMode: TComboBox
              Left = 85
              Top = 115
              ParentFont = False
              ExplicitLeft = 85
              ExplicitTop = 115
            end
            inherited PanelRadarJammingMode: TPanel
              Top = 150
              Height = 150
              ExplicitTop = 150
              ExplicitHeight = 150
              inherited gbRadarJammingSelectedTrackMode: TGroupBox [0]
                Height = 150
                ExplicitHeight = 150
                inherited Label518: TLabel
                  Top = 54
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 54
                end
                inherited Label528: TLabel
                  Left = 195
                  Top = 54
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 54
                end
                inherited Label530: TLabel
                  Left = 195
                  Top = 84
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 84
                end
                inherited Label535: TLabel
                  Top = 84
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 84
                end
                inherited Label539: TLabel
                  Top = 115
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 115
                end
                inherited Label540: TLabel
                  Left = 195
                  Top = 115
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 115
                end
                inherited Label541: TLabel
                  Top = 17
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 17
                end
                inherited btnRadarJammingModeSelectedTrackTrack: TSpeedButton
                  Left = 194
                  Top = 5
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
                  OnClick = fmCounterMeasure1btnRadarJammingModeSelectedTrackTrackClick
                  ExplicitLeft = 194
                  ExplicitTop = 5
                  ExplicitWidth = 40
                  ExplicitHeight = 40
                end
                inherited Label32: TLabel
                  Top = 17
                  ExplicitTop = 17
                end
                inherited Label33: TLabel
                  Top = 54
                  ExplicitTop = 54
                end
                inherited Label34: TLabel
                  Top = 84
                  ExplicitTop = 84
                end
                inherited Label35: TLabel
                  Top = 115
                  ExplicitTop = 115
                end
                inherited editRadarJammingModeSelectedTrackCenterFreq: TEdit
                  Left = 136
                  Top = 80
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 80
                end
                inherited editRadarJammingModeSelectedTrackBearing: TEdit
                  Left = 136
                  Top = 50
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 50
                end
                inherited editRadarJammingModeSelectedTrackBandwidth: TEdit
                  Left = 136
                  Top = 111
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 111
                end
                inherited editRadarJammingSelectedTrackModeTrack: TEdit
                  Left = 136
                  Top = 13
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 13
                end
              end
              inherited gbRadarJammingBarrageMode: TGroupBox [1]
                Height = 150
                ExplicitHeight = 150
                inherited Label531: TLabel
                  Top = 13
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 13
                end
                inherited Label533: TLabel
                  Left = 195
                  Top = 13
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 13
                end
                inherited Label534: TLabel
                  Left = 195
                  Top = 43
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 43
                end
                inherited Label536: TLabel
                  Top = 43
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 43
                end
                inherited Label537: TLabel
                  Top = 73
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 73
                end
                inherited Label538: TLabel
                  Left = 195
                  Top = 73
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 73
                end
                inherited Label29: TLabel
                  Top = 13
                  ExplicitTop = 13
                end
                inherited Label30: TLabel
                  Top = 43
                  ExplicitTop = 43
                end
                inherited Label31: TLabel
                  Top = 73
                  ExplicitTop = 73
                end
                inherited editRadarJammingBarrageCenter: TEdit
                  Left = 136
                  Top = 39
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 39
                end
                inherited editRadarJammingBarrageBearing: TEdit
                  Left = 136
                  Top = 9
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 9
                end
                inherited editRadarJammingBarrageBandwidth: TEdit
                  Left = 136
                  Top = 69
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 69
                end
              end
              inherited gbRadarJammingSpotNumberMode: TGroupBox
                Height = 150
                Align = alClient
                ExplicitHeight = 150
                inherited Label519: TLabel
                  Top = 42
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 42
                end
                inherited Label521: TLabel
                  Left = 195
                  Top = 42
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 42
                end
                inherited Label522: TLabel
                  Left = 195
                  Top = 71
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 71
                end
                inherited Label523: TLabel
                  Top = 71
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 71
                end
                inherited Label524: TLabel
                  Top = 100
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 100
                end
                inherited Label525: TLabel
                  Left = 195
                  Top = 100
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitLeft = 195
                  ExplicitTop = 100
                end
                inherited Label517: TLabel
                  Top = 13
                  Font.Color = clBlack
                  ParentFont = False
                  ExplicitTop = 13
                end
                inherited Label25: TLabel
                  Top = 13
                  ExplicitTop = 13
                end
                inherited Label26: TLabel
                  Top = 42
                  ExplicitTop = 42
                end
                inherited Label27: TLabel
                  Top = 71
                  ExplicitTop = 71
                end
                inherited Label28: TLabel
                  Top = 100
                  ExplicitTop = 100
                end
                inherited editRadarJammingSpotNumberCenter: TEdit
                  Left = 136
                  Top = 67
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 67
                end
                inherited editRadarJammingSpotNumberBearing: TEdit
                  Left = 136
                  Top = 38
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 38
                end
                inherited editRadarJammingSpotNumberBandwidth: TEdit
                  Left = 136
                  Top = 96
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 96
                end
                inherited editRadarJammingSpotNumberSpot: TEdit
                  Left = 136
                  Top = 9
                  ParentFont = False
                  ExplicitLeft = 136
                  ExplicitTop = 9
                end
              end
            end
          end
        end
        inherited grbSurfaceChaffDeployment: TGroupBox [5]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited ScrollBox2: TScrollBox
            Width = 357
            Height = 371
            ParentColor = False
            ExplicitWidth = 357
            ExplicitHeight = 371
            inherited Bevel3: TBevel
              Left = 74
              Top = 3
              Width = 229
              Height = 5
              ExplicitLeft = 74
              ExplicitTop = 3
              ExplicitWidth = 229
              ExplicitHeight = 5
            end
            inherited Label10: TLabel
              Top = -3
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = -3
            end
            inherited Label11: TLabel
              Top = 22
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 22
            end
            inherited Label12: TLabel
              Top = 49
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 49
            end
            inherited Label13: TLabel
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 104
            end
            inherited Label14: TLabel
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 131
            end
            inherited Label15: TLabel
              Top = 158
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 158
            end
            inherited Label16: TLabel
              Top = 186
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 186
            end
            inherited Label17: TLabel
              Top = 213
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 213
            end
            inherited Label18: TLabel
              Top = 241
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 241
            end
            inherited lblSurfaceChaffQuantity: TLabel
              Left = 104
              Top = 131
              Color = 4012087
              Font.Color = clBlack
              ParentColor = False
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 131
            end
            inherited btnSurfaceChaffLauncher: TSpeedButton
              Left = 270
              Top = 18
              Width = 25
              Height = 25
              ExplicitLeft = 270
              ExplicitTop = 18
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnSurfaceChaffType: TSpeedButton
              Left = 270
              Top = 100
              Width = 25
              Height = 25
              ParentFont = False
              ExplicitLeft = 270
              ExplicitTop = 100
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnSurfaceChaffCopy: TSpeedButton
              Top = 265
              Height = 30
              ExplicitTop = 265
              ExplicitHeight = 30
            end
            inherited btnSurfaceChaffLaunch: TSpeedButton
              Top = 265
              Width = 121
              Height = 30
              ExplicitTop = 265
              ExplicitWidth = 121
              ExplicitHeight = 30
            end
            inherited btnSurfaceChaffAbort: TSpeedButton
              Top = 294
              Width = 121
              Height = 30
              ExplicitTop = 294
              ExplicitWidth = 121
              ExplicitHeight = 30
            end
            inherited Label19: TLabel
              Top = 320
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 320
            end
            inherited Bevel4: TBevel
              Left = 72
              Top = 326
              Width = 231
              Height = 5
              ExplicitLeft = 72
              ExplicitTop = 326
              ExplicitWidth = 231
              ExplicitHeight = 5
            end
            inherited Label20: TLabel
              Left = 185
              Top = 158
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 158
            end
            inherited Label21: TLabel
              Left = 185
              Top = 186
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 186
            end
            inherited Label22: TLabel
              Left = 185
              Top = 241
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 241
            end
            inherited Label23: TLabel
              Left = 185
              Top = 49
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 49
            end
            inherited edtSurfaceChaffLauncher: TEdit
              Left = 104
              Top = 18
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 18
            end
            inherited edtSurfaceChaffBearing: TEdit
              Left = 104
              Top = 45
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 45
            end
            inherited edtSurfaceChaffType: TEdit
              Left = 104
              Top = 100
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 100
            end
            inherited edtSurfaceChaffBloomRange: TEdit
              Left = 104
              Top = 154
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 154
            end
            inherited edtSurfaceChaffBloomAltitude: TEdit
              Left = 104
              Top = 182
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 182
            end
            inherited edtSurfaceChaffSalvoSize: TEdit
              Left = 104
              Top = 209
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 209
            end
            inherited edtSurfaceChaffDelay: TEdit
              Left = 104
              Top = 237
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 104
              ExplicitTop = 237
            end
            inherited ckSurfaceChaffEnabled: TCheckBox
              Top = 76
              Color = 4012087
              Font.Color = clBtnFace
              ParentColor = False
              ParentFont = False
              ExplicitTop = 76
            end
            inherited ckSurfaceChaffSeductionEnabled: TCheckBox
              Top = 341
              Color = 4012087
              Font.Color = clBtnFace
              ParentColor = False
              ParentFont = False
              ExplicitTop = 341
            end
          end
        end
        inherited grbTowedJammerDecoy: TGroupBox [6]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited ScrollBox4: TScrollBox
            Width = 357
            Height = 371
            ParentColor = False
            ParentFont = False
            ExplicitWidth = 357
            ExplicitHeight = 371
            inherited Bevel109: TBevel
              Left = 203
              Top = 247
              Height = 5
              ExplicitLeft = 203
              ExplicitTop = 247
              ExplicitHeight = 5
            end
            inherited Bevel111: TBevel
              Left = 57
              Top = 4
              Width = 236
              Height = 5
              ExplicitLeft = 57
              ExplicitTop = 4
              ExplicitWidth = 236
              ExplicitHeight = 5
            end
            inherited Bevel118: TBevel
              Left = 83
              Top = 202
              Width = 210
              Height = 5
              ExplicitLeft = 83
              ExplicitTop = 202
              ExplicitWidth = 210
              ExplicitHeight = 5
            end
            inherited Label501: TLabel
              Top = -3
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = -3
            end
            inherited Label503: TLabel
              Left = 50
              Top = 15
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 50
              ExplicitTop = 15
            end
            inherited Label504: TLabel
              Top = 165
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 165
            end
            inherited Label505: TLabel
              Left = 147
              Top = 15
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 147
              ExplicitTop = 15
            end
            inherited Label506: TLabel
              Top = 135
              Width = 84
              Caption = 'Bearing         :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 135
              ExplicitWidth = 84
            end
            inherited Label507: TLabel
              Left = 206
              Top = 135
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 135
            end
            inherited Label508: TLabel
              Left = 47
              Top = 218
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 47
              ExplicitTop = 218
            end
            inherited Label509: TLabel
              Top = 218
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 218
            end
            inherited Label512: TLabel
              Top = 240
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 240
            end
            inherited Label559: TLabel
              Top = 196
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 196
            end
            inherited Label560: TLabel
              Top = 263
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 263
            end
            inherited Label561: TLabel
              Top = 286
              Width = 56
              Caption = 'Actual    :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 286
              ExplicitWidth = 56
            end
            inherited Label563: TLabel
              Left = 253
              Top = 286
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 253
              ExplicitTop = 286
            end
            inherited Label564: TLabel
              Left = 253
              Top = 263
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 253
              ExplicitTop = 263
            end
            inherited lblTowedJammerDecoyActual: TLabel
              Left = 206
              Top = 286
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 286
            end
            inherited lblTowedJammerDecoyQuantity: TLabel
              Left = 206
              Top = 218
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 218
            end
            inherited sbTowedJammerDecoyActionDeploy: TSpeedButton
              Left = 20
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 20
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyActionStow: TSpeedButton
              Left = 20
              Top = 264
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 20
              ExplicitTop = 264
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyModeAuto: TSpeedButton
              Left = 21
              Top = 32
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 32
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyModeManual: TSpeedButton
              Left = 21
              Top = 61
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 61
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyModeOff: TSpeedButton
              Left = 21
              Top = 90
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 90
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyTargetingSpot: TSpeedButton
              Top = 32
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitTop = 32
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited sbTowedJammerDecoyTargetingTrack: TSpeedButton
              Top = 61
              Width = 89
              Height = 30
              ParentFont = False
              ExplicitTop = 61
              ExplicitWidth = 89
              ExplicitHeight = 30
            end
            inherited editTowedJammerDecoyOrdered: TEdit
              Left = 206
              Top = 259
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 259
            end
            inherited edtTowedJammerDecoyBearing: TEdit
              Top = 131
              ParentFont = False
              ExplicitTop = 131
            end
            inherited edtTowedJammerDecoySpotNumb: TEdit
              Top = 161
              ParentFont = False
              ExplicitTop = 161
            end
          end
        end
        inherited grpAirBubble: TGroupBox [7]
          Width = 361
          Height = 391
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 361
          ExplicitHeight = 391
          inherited lblDeploy: TLabel
            Color = 4012087
            Font.Color = clBlack
            ParentColor = False
            ParentFont = False
          end
          inherited lblQuant: TLabel
            Top = 68
            Width = 64
            Caption = 'Quantity   :'
            Color = 4012087
            Font.Color = clBlack
            ParentColor = False
            ParentFont = False
            ExplicitTop = 68
            ExplicitWidth = 64
          end
          inherited lblType: TLabel
            Top = 34
            Width = 65
            Caption = 'Type        :'
            Color = 4012087
            Font.Color = clBlack
            ParentColor = False
            ParentFont = False
            ExplicitTop = 34
            ExplicitWidth = 65
          end
          inherited bvl1: TBevel
            Left = 80
            Width = 227
            ExplicitLeft = 80
            ExplicitWidth = 227
          end
          inherited lblBubblelQuantity: TLabel
            Top = 68
            Color = 4012087
            Font.Color = clBlack
            ParentColor = False
            ParentFont = False
            ExplicitTop = 68
          end
          inherited btnType: TSpeedButton
            Left = 278
            Top = 27
            Width = 30
            Height = 30
            ExplicitLeft = 278
            ExplicitTop = 27
            ExplicitWidth = 30
            ExplicitHeight = 30
          end
          inherited edtBubble: TEdit
            Top = 30
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 30
          end
          inherited btnAirBubbleDeploy: TButton
            Top = 104
            Width = 100
            Height = 35
            ParentFont = False
            ExplicitTop = 104
            ExplicitWidth = 100
            ExplicitHeight = 35
          end
        end
      end
    end
    inherited PanelCounterMeasureSpace: TPanel
      Width = 361
      ExplicitWidth = 361
    end
    inherited PanelCounterMeasureChoice: TPanel
      Width = 361
      ExplicitWidth = 361
      inherited lvECM: TListView
        Width = 357
        ExplicitWidth = 357
      end
    end
    inherited pmNoiseJammerMode: TPopupMenu
      Left = 314
      Top = 134
    end
  end
end
