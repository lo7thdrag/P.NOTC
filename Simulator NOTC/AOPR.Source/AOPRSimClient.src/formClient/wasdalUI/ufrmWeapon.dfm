object frmWeapon: TfrmWeapon
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Weapon'
  ClientHeight = 575
  ClientWidth = 347
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
  inline fmWeapon1: TfmWeapon
    Left = 0
    Top = 0
    Width = 347
    Height = 575
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 347
    ExplicitHeight = 575
    inherited PanelWeaponChoices: TPanel
      Width = 347
      ExplicitWidth = 347
    end
    inherited PanelALL: TPanel
      Width = 347
      Height = 550
      ExplicitWidth = 347
      ExplicitHeight = 550
      inherited PanelTacticalWeapons: TPanel
        Width = 347
        Height = 550
        ExplicitWidth = 347
        ExplicitHeight = 550
        inherited grbAcousticTorpedo: TGroupBox [0]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox2: TScrollBox
            Width = 343
            Height = 530
            VertScrollBar.Position = 0
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited lblAcousticTorpedoStatus: TLabel
              Top = 31
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 29
            end
            inherited lblAcousticTorpedoQuantity: TLabel
              Left = 180
              Top = 31
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 29
            end
            inherited lbl4: TLabel
              Left = 8
              Top = 12
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 10
            end
            inherited lbl37: TLabel
              Left = 183
              Top = 390
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 183
              ExplicitTop = 388
            end
            inherited lbl36: TLabel
              Left = 180
              Top = 317
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 315
            end
            inherited lbl35: TLabel
              Left = 180
              Top = 287
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 285
            end
            inherited lbl34: TLabel
              Left = 180
              Top = 257
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 255
            end
            inherited lbl33: TLabel
              Left = 180
              Top = 227
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 225
            end
            inherited lbl32: TLabel
              Left = 24
              Top = 347
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 345
            end
            inherited lbl31: TLabel
              Left = 24
              Top = 317
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 315
            end
            inherited lbl30: TLabel
              Left = 24
              Top = 287
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 285
            end
            inherited lbl29: TLabel
              Left = 24
              Top = 257
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 255
            end
            inherited lbl28: TLabel
              Left = 24
              Top = 227
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 225
            end
            inherited lbl27: TLabel
              Left = 24
              Top = 197
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 195
            end
            inherited lbl26: TLabel
              Left = 24
              Top = 168
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 166
            end
            inherited lbl25: TLabel
              Left = 24
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 129
            end
            inherited lbl24: TLabel
              Left = 8
              Top = 376
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 374
            end
            inherited lbl23: TLabel
              Left = 8
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 102
            end
            inherited lbl2: TLabel
              Left = 109
              Top = 390
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 388
            end
            inherited lbl16: TLabel
              Left = 24
              Top = 76
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 74
            end
            inherited lbl11: TLabel
              Left = 8
              Top = 48
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 46
            end
            inherited lbl10: TLabel
              Left = 117
              Top = 31
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 117
              ExplicitTop = 29
            end
            inherited bvl8: TBevel
              Left = 56
              Top = 382
              Width = 251
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 380
              ExplicitWidth = 251
              ExplicitHeight = 5
            end
            inherited bvl7: TBevel
              Top = 110
              Width = 252
              Height = 5
              ExplicitTop = 108
              ExplicitWidth = 252
              ExplicitHeight = 5
            end
            inherited bvl6: TBevel
              Top = 54
              Width = 252
              Height = 5
              ExplicitTop = 52
              ExplicitWidth = 252
              ExplicitHeight = 5
            end
            inherited bvl5: TBevel
              Left = 51
              Top = 18
              Width = 256
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 16
              ExplicitWidth = 256
              ExplicitHeight = 5
            end
            inherited btnSearchTarget: TSpeedButton
              Left = 180
              Top = 64
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
              ExplicitLeft = 180
              ExplicitTop = 62
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btnRunOutAT: TSpeedButton
              Left = 180
              Top = 193
              Width = 25
              Height = 25
              ExplicitLeft = 180
              ExplicitTop = 191
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnGyroAngleAT: TSpeedButton
              Left = 180
              Top = 343
              Width = 25
              Height = 25
              ExplicitLeft = 180
              ExplicitTop = 341
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnFiringModeAT: TSpeedButton
              Left = 180
              Top = 164
              Width = 25
              Height = 25
              ExplicitLeft = 180
              ExplicitTop = 162
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnDisplayBlindZonesShow: TSpeedButton
              Left = 177
              Top = 406
              Width = 77
              Height = 35
              Font.Height = -13
              ExplicitLeft = 177
              ExplicitTop = 404
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited btnDisplayBlindZonesHide: TSpeedButton
              Left = 177
              Top = 441
              Width = 77
              Height = 35
              Font.Height = -13
              ExplicitLeft = 177
              ExplicitTop = 439
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited btnAccousticDisplayRangeShow: TSpeedButton
              Left = 89
              Top = 406
              Width = 77
              Height = 35
              Font.Height = -13
              ExplicitLeft = 89
              ExplicitTop = 404
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited btnAccousticDisplayRangeHide: TSpeedButton
              Left = 89
              Top = 441
              Width = 77
              Height = 35
              Font.Height = -13
              Transparent = False
              ExplicitLeft = 89
              ExplicitTop = 439
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited btnTargetDetails: TButton
              Left = 232
              Top = 72
              Width = 75
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 72
              ExplicitWidth = 75
            end
            inherited EdtSeekerRangeAT: TEdit
              Left = 117
              Top = 313
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 313
              ExplicitWidth = 60
            end
            inherited EdtSearchRadiusAT: TEdit
              Left = 117
              Top = 223
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 223
              ExplicitWidth = 60
            end
            inherited EdtSearchDepthAT: TEdit
              Left = 117
              Top = 253
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 253
              ExplicitWidth = 60
            end
            inherited EdtSafetyCeilingAT: TEdit
              Left = 117
              Top = 283
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 283
              ExplicitWidth = 60
            end
            inherited EdtRunOutAT: TEdit
              Left = 117
              Top = 193
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 193
              ExplicitWidth = 60
            end
            inherited EdtGyroAngleAT: TEdit
              Left = 117
              Top = 343
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 343
              ExplicitWidth = 60
            end
            inherited EdtFiringModeAT: TEdit
              Left = 117
              Top = 164
              Width = 60
              ExplicitLeft = 117
              ExplicitTop = 164
              ExplicitWidth = 60
            end
            inherited EdtATTargetTrack: TEdit
              Left = 117
              Top = 71
              Width = 60
              Height = 27
              Font.Height = -16
              ExplicitLeft = 117
              ExplicitTop = 71
              ExplicitWidth = 60
              ExplicitHeight = 27
            end
            inherited btnTube4AT: TButton
              Left = 239
              Top = 119
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 239
              ExplicitTop = 119
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btnTube3AT: TButton
              Left = 198
              Top = 119
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 198
              ExplicitTop = 119
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btnTube2AT: TButton
              Left = 157
              Top = 119
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 157
              ExplicitTop = 119
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btnTube1AT: TButton
              Left = 117
              Top = 119
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 117
              ExplicitTop = 119
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btntControlGyroAdvised: TButton
              Left = 232
              Top = 343
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 343
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnPlanAT: TButton
              Left = 30
              Top = 495
              Width = 75
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 30
              ExplicitTop = 495
              ExplicitWidth = 75
              ExplicitHeight = 35
            end
            inherited btnLaunchAT: TButton
              Left = 238
              Top = 495
              Width = 75
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 238
              ExplicitTop = 495
              ExplicitWidth = 75
              ExplicitHeight = 35
            end
            inherited btnControlSeeker: TButton
              Left = 232
              Top = 313
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 313
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnControlSearchRadius: TButton
              Left = 232
              Top = 223
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 223
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnControlSearchDepth: TButton
              Left = 232
              Top = 253
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 253
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnControlSafety: TButton
              Left = 232
              Top = 283
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 283
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnControlControlRunAdvised: TButton
              Left = 232
              Top = 193
              Width = 90
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 232
              ExplicitTop = 193
              ExplicitWidth = 90
              ExplicitHeight = 25
            end
            inherited btnCancelAT: TButton
              Left = 124
              Top = 495
              Width = 75
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 124
              ExplicitTop = 495
              ExplicitWidth = 75
              ExplicitHeight = 35
            end
          end
        end
        inherited grbActivePasiveTorpedo: TGroupBox [1]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox3: TScrollBox
            Width = 343
            Height = 530
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited btnAPGBilndHide: TSpeedButton
              Left = 151
              Top = 324
              Height = 35
              Font.Height = -13
              ExplicitLeft = 151
              ExplicitTop = 324
              ExplicitHeight = 35
            end
            inherited btnAPGRangeHide: TSpeedButton
              Left = 32
              Top = 324
              Height = 35
              Font.Height = -13
              ExplicitLeft = 32
              ExplicitTop = 324
              ExplicitHeight = 35
            end
            inherited btnAPGBilndShow: TSpeedButton
              Left = 151
              Top = 289
              Height = 35
              Font.Height = -13
              ExplicitLeft = 151
              ExplicitTop = 289
              ExplicitHeight = 35
            end
            inherited btnAPGRangeShow: TSpeedButton
              Left = 32
              Top = 289
              Height = 35
              Font.Height = -13
              ExplicitLeft = 32
              ExplicitTop = 289
              ExplicitHeight = 35
            end
            inherited btnTargetTrackAPG: TSpeedButton
              Left = 182
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
              ExplicitLeft = 182
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited bvl1: TBevel
              Left = 51
              Top = 15
              Width = 257
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 15
              ExplicitWidth = 257
              ExplicitHeight = 5
            end
            inherited bvl2: TBevel
              Top = 58
              Width = 253
              Height = 5
              ExplicitTop = 58
              ExplicitWidth = 253
              ExplicitHeight = 5
            end
            inherited bvl3: TBevel
              Top = 117
              Width = 253
              Height = 5
              ExplicitTop = 117
              ExplicitWidth = 253
              ExplicitHeight = 5
            end
            inherited bvl4: TBevel
              Left = 54
              Top = 257
              Width = 254
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 257
              ExplicitWidth = 254
              ExplicitHeight = 5
            end
            inherited lbl1: TLabel
              Left = 8
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
            end
            inherited lbl12: TLabel
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 131
            end
            inherited lbl13: TLabel
              Top = 161
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 161
            end
            inherited lbl14: TLabel
              Top = 192
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 192
            end
            inherited lbl15: TLabel
              Top = 223
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 223
            end
            inherited lbl17: TLabel
              Left = 185
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 131
            end
            inherited lbl18: TLabel
              Left = 185
              Top = 161
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 161
            end
            inherited lbl19: TLabel
              Left = 185
              Top = 192
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 192
            end
            inherited lbl20: TLabel
              Left = 185
              Top = 223
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 223
            end
            inherited lbl21: TLabel
              Left = 54
              Top = 269
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 54
              ExplicitTop = 269
            end
            inherited lbl22: TLabel
              Left = 159
              Top = 269
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 159
              ExplicitTop = 269
            end
            inherited lbl3: TLabel
              Left = 117
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 117
            end
            inherited lbl5: TLabel
              Left = 8
              Top = 52
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 52
            end
            inherited lbl6: TLabel
              Top = 82
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 82
            end
            inherited lbl7: TLabel
              Left = 8
              Top = 111
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 111
            end
            inherited lbl8: TLabel
              Left = 8
              Top = 251
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 251
            end
            inherited lblAPGQuantity: TLabel
              Left = 172
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 172
            end
            inherited lblAPGStatus: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label59: TLabel
              Left = 110
              Top = 161
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 110
              ExplicitTop = 161
            end
            inherited Label60: TLabel
              Left = 110
              Top = 192
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 110
              ExplicitTop = 192
            end
            inherited Label61: TLabel
              Left = 110
              Top = 223
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 110
              ExplicitTop = 223
            end
            inherited Label63: TLabel
              Left = 110
              Top = 82
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 110
              ExplicitTop = 82
            end
            inherited Label64: TLabel
              Left = 110
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 110
              ExplicitTop = 131
            end
            inherited btn4: TButton
              Top = 127
              Width = 75
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 127
              ExplicitWidth = 75
              ExplicitHeight = 25
            end
            inherited btn5: TButton
              Top = 157
              Width = 75
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 157
              ExplicitWidth = 75
              ExplicitHeight = 25
            end
            inherited btn6: TButton
              Top = 188
              Width = 75
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 188
              ExplicitWidth = 75
              ExplicitHeight = 25
            end
            inherited btn7: TButton
              Top = 219
              Width = 75
              Height = 25
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 219
              ExplicitWidth = 75
              ExplicitHeight = 25
            end
            inherited btnAPGLaunch: TButton
              Left = 230
              Top = 370
              Height = 35
              Font.Height = -13
              ExplicitLeft = 230
              ExplicitTop = 370
              ExplicitHeight = 35
            end
            inherited EdtAPGTargetTrack: TEdit
              Left = 129
              Top = 78
              Height = 24
              Font.Height = -13
              ExplicitLeft = 129
              ExplicitTop = 78
              ExplicitHeight = 24
            end
            inherited EdtAPGSafetyCeiling: TEdit
              Left = 129
              Top = 188
              Height = 24
              Font.Height = -13
              ExplicitLeft = 129
              ExplicitTop = 188
              ExplicitHeight = 24
            end
            inherited EdtAPGSearchDepth: TEdit
              Left = 129
              Top = 157
              Height = 24
              Font.Height = -13
              ExplicitLeft = 129
              ExplicitTop = 157
              ExplicitHeight = 24
            end
            inherited EdtAPGSearchRadius: TEdit
              Left = 129
              Top = 127
              Height = 24
              Font.Height = -13
              ExplicitLeft = 129
              ExplicitTop = 127
              ExplicitHeight = 24
            end
            inherited EdtAPGSeekerRange: TEdit
              Left = 129
              Top = 219
              Height = 24
              Font.Height = -13
              ExplicitLeft = 129
              ExplicitTop = 219
              ExplicitHeight = 24
            end
          end
        end
        inherited grbGunEngagementAutomaticManualMode: TGroupBox [2]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 347
          ExplicitHeight = 550
        end
        inherited grbGunEngagementCIWS: TGroupBox [3]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 347
          ExplicitHeight = 550
        end
        inherited grbHybridMissile: TGroupBox [4]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited scrlbx1: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited btnHybridMissileDisplayBlindZonesHide: TSpeedButton
              Top = 384
              Height = 35
              Font.Height = -13
              ExplicitTop = 384
              ExplicitHeight = 35
            end
            inherited btnHybridMissileDisplayBlindZonesShow: TSpeedButton
              Top = 349
              Height = 35
              Font.Height = -13
              ExplicitTop = 349
              ExplicitHeight = 35
            end
            inherited lbl87: TLabel
              Left = 197
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 197
              ExplicitTop = 333
            end
            inherited lbl88: TLabel
              Left = 95
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 95
              ExplicitTop = 333
            end
            inherited btnHybridMissileDisplayRangeShow: TSpeedButton
              Left = 73
              Top = 349
              Height = 35
              Font.Height = -13
              ExplicitLeft = 73
              ExplicitTop = 349
              ExplicitHeight = 35
            end
            inherited btnHybridMissileDisplayRangeHide: TSpeedButton
              Left = 73
              Top = 384
              Height = 35
              Font.Height = -13
              ExplicitLeft = 73
              ExplicitTop = 384
              ExplicitHeight = 35
            end
            inherited lbl89: TLabel
              Left = 8
              Top = 312
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 312
            end
            inherited bvl21: TBevel
              Left = 56
              Top = 318
              Width = 268
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 318
              ExplicitWidth = 268
              ExplicitHeight = 5
            end
            inherited lbl90: TLabel
              Top = 280
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 280
            end
            inherited lbl91: TLabel
              Top = 249
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 249
            end
            inherited lbl92: TLabel
              Top = 219
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 219
            end
            inherited lbl93: TLabel
              Top = 193
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 193
            end
            inherited bvl22: TBevel
              Left = 56
              Top = 199
              Width = 268
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 199
              ExplicitWidth = 268
              ExplicitHeight = 5
            end
            inherited lbl94: TLabel
              Top = 249
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 249
            end
            inherited lbl95: TLabel
              Top = 280
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 280
            end
            inherited lbl96: TLabel
              Top = 152
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 152
            end
            inherited btnSearchHybridMissileTargetTrack: TSpeedButton
              Width = 25
              Height = 25
              Glyph.Data = {
                D20A0000424DD20A00000000000042000000280000001A0000001A0000000100
                200003000000900A0000130B0000130B000000000000000000000000FF0000FF
                0000FF000000E6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF817F7FFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF817F7FFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A
                9AFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF565454FF2B2A2AFF0000
                00FF000000FF1D1C1CFF656262FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF646262FF1D1C1CFF908D
                8DFFBBB6B6FF8F8C8CFF908C8CFFC9C5C5FF727070FF0E0E0EFF656363FFD8D3
                D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF2B2A2AFF6463
                63FFD8D3D3FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD8D3
                D3FF555454FF2B2A2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FF6462
                62FF565454FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFACA9A9FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF1C1C1CFFC9C5
                C5FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF646262FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF8F8C8CFF565454FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF1C1C1CFFCAC5C5FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBBB6B6FF2B2A2AFFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF000000FF908C
                8CFF908C8CFF908C8CFF908C8CFF908C8CFFACA9A9FFE6E1E1FFE6E1E1FFACA9
                A9FF908C8CFF908C8CFF908C8CFF908C8CFF908C8CFF000000FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF000000FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFFACA9A9FFE6E1
                E1FFE6E1E1FFACA9A9FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF0000
                00FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF2B2A2AFFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFADA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFC9C5C5FF1D1C1CFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF565454FF908D8DFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FF656262FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFC9C5C5FF1D1C
                1CFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF0E0E0EFFACA9A9FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF555454FF646363FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF2B2A2AFF565454FFD8D3D3FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD7D3D3FF646262FF2B2A
                2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF6462
                62FF0E0E0EFF737171FFCAC5C5FF8F8C8CFF908C8CFFBBB7B7FF8F8C8CFF1C1C
                1CFF646363FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFACA8A8FF656262FF1C1C1CFF000000FF000000FF2B2A
                2AFF565454FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF9F9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF817E7EFFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF9E9B9BFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF908D8DFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF}
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnAddHybridMissileTargetAimpoint: TSpeedButton
              Top = 108
              Width = 30
              Height = 30
              ExplicitTop = 108
              ExplicitWidth = 30
              ExplicitHeight = 30
            end
            inherited bvl23: TBevel
              Top = 58
              Width = 269
              Height = 5
              ExplicitTop = 58
              ExplicitWidth = 269
              ExplicitHeight = 5
            end
            inherited lbl97: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited lblHybridMissileStatus: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited lbl98: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited lblHybridMissileQuantity: TLabel
              Left = 177
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 177
            end
            inherited bvl24: TBevel
              Left = 51
              Top = 9
              Width = 273
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 9
              ExplicitWidth = 273
              ExplicitHeight = 5
            end
            inherited lbl99: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited btnHybridMissileLaunch: TButton
              Left = 244
              Top = 424
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 424
              ExplicitHeight = 35
            end
            inherited edtHybridMissileControlSalvoSize: TEdit
              Top = 217
              Height = 24
              Font.Height = -13
              ExplicitTop = 217
              ExplicitHeight = 24
            end
            inherited edtHybridMissileControlCruiseAltitude: TEdit
              Top = 245
              Height = 24
              Font.Height = -13
              ExplicitTop = 245
              ExplicitHeight = 24
            end
            inherited edtHybridMissileControlSeekerRange: TEdit
              Top = 276
              Height = 24
              Font.Height = -13
              ExplicitTop = 276
              ExplicitHeight = 24
            end
            inherited btnDefaultHybridMissileControlSeekerRange: TButton
              Left = 244
              Top = 274
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 274
            end
            inherited btnDefaultHybridMissileControlCruiseAltitude: TButton
              Left = 244
              Top = 243
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 243
            end
            inherited edtHybridMissiletargetBearing: TEdit
              Left = 118
              Top = 148
              Height = 24
              Font.Height = -13
              ExplicitLeft = 118
              ExplicitTop = 148
              ExplicitHeight = 24
            end
            inherited rbHybridMissileTargetBearing: TRadioButton
              Top = 152
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 152
            end
            inherited rbHybridMissileTargetAimpoint: TRadioButton
              Top = 115
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 115
            end
            inherited rbHybridMissileTargetTrack: TRadioButton
              Top = 81
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 81
            end
            inherited edtHybridMissiletargetTrack: TEdit
              Height = 24
              Font.Height = -13
              ExplicitHeight = 24
            end
            inherited edtHybridMissiletargetAimpoint: TEdit
              Top = 111
              Height = 24
              Font.Height = -13
              ExplicitTop = 111
              ExplicitHeight = 24
            end
            inherited btnBringToHookHybridMissileTargetBearing: TButton
              Left = 244
              Top = 148
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 148
            end
          end
        end
        inherited grbStraightRunningTorpedos: TGroupBox [5]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox4: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited btnSRBlindHide: TSpeedButton
              Left = 186
              Top = 263
              Height = 35
              ExplicitLeft = 186
              ExplicitTop = 263
              ExplicitHeight = 35
            end
            inherited btnSRBlindShow: TSpeedButton
              Left = 186
              Top = 228
              Height = 35
              ExplicitLeft = 186
              ExplicitTop = 228
              ExplicitHeight = 35
            end
            inherited btnSRRangeHide: TSpeedButton
              Left = 76
              Top = 263
              Height = 35
              ExplicitLeft = 76
              ExplicitTop = 263
              ExplicitHeight = 35
            end
            inherited btnSRRangeShow: TSpeedButton
              Left = 76
              Top = 228
              Height = 35
              ExplicitLeft = 76
              ExplicitTop = 228
              ExplicitHeight = 35
            end
            inherited btnSRTargetTrack: TSpeedButton
              Left = 201
              Top = 67
              Width = 25
              Height = 25
              Glyph.Data = {
                D20A0000424DD20A00000000000042000000280000001A0000001A0000000100
                200003000000900A0000130B0000130B000000000000000000000000FF0000FF
                0000FF000000E6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF817F7FFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF817F7FFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A
                9AFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF565454FF2B2A2AFF0000
                00FF000000FF1D1C1CFF656262FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF646262FF1D1C1CFF908D
                8DFFBBB6B6FF8F8C8CFF908C8CFFC9C5C5FF727070FF0E0E0EFF656363FFD8D3
                D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF2B2A2AFF6463
                63FFD8D3D3FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD8D3
                D3FF555454FF2B2A2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FF6462
                62FF565454FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFACA9A9FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF1C1C1CFFC9C5
                C5FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF646262FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF8F8C8CFF565454FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF1C1C1CFFCAC5C5FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBBB6B6FF2B2A2AFFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF000000FF908C
                8CFF908C8CFF908C8CFF908C8CFF908C8CFFACA9A9FFE6E1E1FFE6E1E1FFACA9
                A9FF908C8CFF908C8CFF908C8CFF908C8CFF908C8CFF000000FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF000000FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFFACA9A9FFE6E1
                E1FFE6E1E1FFACA9A9FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF0000
                00FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF2B2A2AFFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFADA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFC9C5C5FF1D1C1CFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF565454FF908D8DFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FF656262FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFC9C5C5FF1D1C
                1CFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF0E0E0EFFACA9A9FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF555454FF646363FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF2B2A2AFF565454FFD8D3D3FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD7D3D3FF646262FF2B2A
                2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF6462
                62FF0E0E0EFF737171FFCAC5C5FF8F8C8CFF908C8CFFBBB7B7FF8F8C8CFF1C1C
                1CFF646363FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFACA8A8FF656262FF1C1C1CFF000000FF000000FF2B2A
                2AFF565454FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF9F9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF817E7EFFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF9E9B9BFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF908D8DFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF}
              ExplicitLeft = 201
              ExplicitTop = 67
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited bvl14: TBevel
              Top = 57
              Width = 243
              Height = 5
              ExplicitTop = 57
              ExplicitWidth = 243
              ExplicitHeight = 5
            end
            inherited bvl15: TBevel
              Top = 197
              Width = 246
              Height = 5
              ExplicitTop = 197
              ExplicitWidth = 246
              ExplicitHeight = 5
            end
            inherited bvl16: TBevel
              Left = 51
              Top = 16
              Width = 247
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 16
              ExplicitWidth = 247
              ExplicitHeight = 5
            end
            inherited lbl62: TLabel
              Left = 8
              Top = 10
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 10
            end
            inherited lbl63: TLabel
              Left = 117
              Top = 29
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 117
              ExplicitTop = 29
            end
            inherited lbl64: TLabel
              Left = 8
              Top = 51
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 51
            end
            inherited lbl65: TLabel
              Top = 71
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 71
            end
            inherited lbl66: TLabel
              Left = 8
              Top = 191
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 191
            end
            inherited lbl67: TLabel
              Left = 98
              Top = 209
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 98
              ExplicitTop = 209
            end
            inherited lbl68: TLabel
              Left = 194
              Top = 209
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 209
            end
            inherited lbl69: TLabel
              Top = 100
              Width = 95
              Caption = 'Identity            :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 100
              ExplicitWidth = 95
            end
            inherited lbl70: TLabel
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 122
            end
            inherited lbl72: TLabel [17]
              Top = 166
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 166
            end
            inherited lbl73: TLabel [18]
              Left = 180
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 122
            end
            inherited lbl74: TLabel [19]
              Left = 180
              Top = 144
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 144
            end
            inherited lbl75: TLabel [20]
              Left = 180
              Top = 166
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 180
              ExplicitTop = 166
            end
            inherited lblSRQuantity: TLabel [21]
              Left = 178
              Top = 29
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 178
              ExplicitTop = 29
            end
            inherited lblSRStatus: TLabel [22]
              Top = 32
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 32
            end
            inherited lblSRTargetCourse: TLabel [23]
              Left = 134
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 134
              ExplicitTop = 122
            end
            inherited lblSRTargetDepth: TLabel [24]
              Left = 134
              Top = 166
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 134
              ExplicitTop = 166
            end
            inherited lblSRTargetIdentity: TLabel [25]
              Left = 134
              Top = 100
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 134
              ExplicitTop = 100
            end
            inherited Label21: TLabel [26]
              Left = 109
              Top = 71
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 71
            end
            inherited Label24: TLabel [27]
              Left = 109
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 122
            end
            inherited Label38: TLabel [28]
              Left = 109
              Top = 166
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 166
            end
            inherited lbl71: TLabel [29]
              Top = 144
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 144
            end
            inherited Label36: TLabel
              Left = 109
              Top = 144
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 144
            end
            inherited lblSRTargetSpeed: TLabel [31]
              Left = 134
              Top = 144
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 134
              ExplicitTop = 144
            end
            inherited btnSRLaunch: TButton
              Height = 35
              ExplicitHeight = 35
            end
            inherited EdtSRTargetTrack: TEdit
              Left = 134
              Top = 67
              Width = 60
              ExplicitLeft = 134
              ExplicitTop = 67
              ExplicitWidth = 60
            end
          end
        end
        inherited grbSurfaceToSurfaceMissile: TGroupBox [6]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox6: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited btnSurfaceToSurfaceMissileFiring: TSpeedButton
              Left = 174
              Top = 100
              Width = 25
              Height = 25
              ExplicitLeft = 174
              ExplicitTop = 100
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnSurfaceToSurfaceMissileEngagement: TSpeedButton
              Left = 174
              Top = 131
              Width = 25
              Height = 25
              ExplicitLeft = 174
              ExplicitTop = 131
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited Label67: TLabel
              Top = -1
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = -1
            end
            inherited Bevel29: TBevel
              Left = 47
              Top = 5
              Width = 266
              Height = 5
              ExplicitLeft = 47
              ExplicitTop = 5
              ExplicitWidth = 266
              ExplicitHeight = 5
            end
            inherited lblSurfaceToSurfaceMissileStatus: TLabel
              Left = 14
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
            end
            inherited Label69: TLabel
              Left = 109
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
            end
            inherited lbSurfaceToSurfaceMissileQuantity: TLabel
              Left = 170
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 170
            end
            inherited Label75: TLabel
              Top = 38
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 38
            end
            inherited Bevel33: TBevel
              Left = 47
              Width = 266
              Height = 5
              ExplicitLeft = 47
              ExplicitWidth = 266
              ExplicitHeight = 5
            end
            inherited Label76: TLabel
              Left = 14
              Top = 63
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 63
            end
            inherited Label77: TLabel
              Top = 87
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 87
            end
            inherited Bevel74: TBevel
              Left = 42
              Top = 89
              Width = 261
              Height = 0
              ExplicitLeft = 42
              ExplicitTop = 89
              ExplicitWidth = 261
              ExplicitHeight = 0
            end
            inherited Label78: TLabel
              Top = 372
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 372
            end
            inherited Bevel77: TBevel
              Left = 92
              Top = 378
              Width = 222
              Height = 5
              ExplicitLeft = 92
              ExplicitTop = 378
              ExplicitWidth = 222
              ExplicitHeight = 5
            end
            inherited Label414: TLabel
              Left = 14
              Top = 170
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 170
            end
            inherited Label415: TLabel
              Left = 14
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 104
            end
            inherited Label416: TLabel
              Left = 14
              Top = 135
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 135
            end
            inherited btnSurfaceToSurfaceMissileTargetTrack: TSpeedButton
              Left = 174
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
              ExplicitLeft = 174
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited sbSurfaceToSurfaceMissileDisplayRangeShow: TSpeedButton
              Left = 29
              Top = 393
              Width = 77
              Height = 35
              Font.Height = -13
              ExplicitLeft = 29
              ExplicitTop = 393
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited sbSurfaceToSurfaceMissileDisplayRangeHide: TSpeedButton
              Left = 29
              Top = 428
              Width = 77
              Height = 35
              Font.Height = -13
              ExplicitLeft = 29
              ExplicitTop = 428
              ExplicitWidth = 77
              ExplicitHeight = 35
            end
            inherited lblDestruckRange: TLabel
              Left = 14
              Top = 293
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 293
            end
            inherited lblCrossOverRange: TLabel
              Left = 14
              Top = 261
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 14
              ExplicitTop = 261
            end
            inherited lblNmCrossOverRange: TLabel
              Left = 179
              Top = 261
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 179
              ExplicitTop = 261
            end
            inherited lblNmDestruckRange: TLabel
              Left = 179
              Top = 293
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 179
              ExplicitTop = 293
            end
            inherited editSurfaceToSurfaceMissileFiring: TEdit [24]
              Top = 100
              Height = 24
              Font.Height = -13
              ExplicitTop = 100
              ExplicitHeight = 24
            end
            inherited editSurfaceToSurfaceMissileEngangement: TEdit [25]
              Top = 131
              Height = 24
              Font.Height = -13
              ExplicitTop = 131
              ExplicitHeight = 24
            end
            inherited editSurfaceToSurfaceMissileTargetTrack: TEdit [26]
              Left = 120
              Top = 59
              Height = 24
              Font.Height = -13
              ExplicitLeft = 120
              ExplicitTop = 59
              ExplicitHeight = 24
            end
            inherited btnSurfaceToSurfacePlan: TButton [27]
              Left = 27
              Top = 472
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 27
              ExplicitTop = 472
              ExplicitHeight = 35
            end
            inherited btnSurfaceToSurfaceLaunch: TButton [28]
              Left = 235
              Top = 472
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 235
              ExplicitTop = 472
              ExplicitHeight = 35
            end
            inherited btnSurfaceToSurfaceCancel: TButton [29]
              Left = 111
              Top = 472
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 111
              ExplicitTop = 472
              ExplicitHeight = 35
            end
            inherited btnSurfaceToSurfaceMissileLauncherMore: TButton [30]
              Left = 233
              Top = 289
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 233
              ExplicitTop = 289
            end
            inherited pnlLaunch1: TPanel [31]
              Left = 105
              Top = 168
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 105
              ExplicitTop = 168
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl1: TVrBlinkLed
                Width = 38
                Font.Height = -13
                Font.Style = [fsBold]
                ExplicitWidth = 38
              end
            end
            inherited pnlLaunch2: TPanel [32]
              Left = 145
              Top = 168
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 145
              ExplicitTop = 168
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl2: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 38
              end
            end
            inherited pnlLaunch3: TPanel [33]
              Left = 185
              Top = 168
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 168
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl3: TVrBlinkLed
                Width = 38
                ExplicitWidth = 38
              end
            end
            inherited pnlLaunch4: TPanel [34]
              Left = 225
              Top = 168
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 225
              ExplicitTop = 168
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl4: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 21
              end
            end
            inherited pnlLaunch5: TPanel [35]
              Left = 105
              Top = 211
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 105
              ExplicitTop = 211
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl5: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 21
              end
            end
            inherited pnlLaunch6: TPanel [36]
              Left = 145
              Top = 211
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 145
              ExplicitTop = 211
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl6: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 21
              end
            end
            inherited pnlLaunch7: TPanel [37]
              Left = 185
              Top = 211
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 211
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl7: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 21
              end
            end
            inherited pnlLaunch8: TPanel [38]
              Left = 225
              Top = 211
              Width = 40
              Height = 40
              Font.Color = clBlack
              Font.Style = [fsBold]
              ParentFont = False
              ExplicitLeft = 225
              ExplicitTop = 211
              ExplicitWidth = 40
              ExplicitHeight = 40
              inherited vbl8: TVrBlinkLed
                Width = 38
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 21
              end
            end
            inherited edtDestructRange: TEdit [39]
              Left = 120
              Top = 288
              Height = 24
              Font.Height = -13
              ExplicitLeft = 120
              ExplicitTop = 288
              ExplicitHeight = 24
            end
            inherited edtCrossOverRange: TEdit [40]
              Left = 120
              Top = 256
              Height = 24
              Font.Height = -13
              ExplicitLeft = 120
              ExplicitTop = 256
              ExplicitHeight = 24
            end
            inherited btnSurfaceToSurfaceMissileTargetTrackDetails: TButton [41]
              Left = 233
              Top = 59
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 233
              ExplicitTop = 59
            end
            inherited btn1: TButton [42]
              Left = 239
              Top = 131
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 239
              ExplicitTop = 131
            end
            inherited panSurfaceToSurfaceWp: TPanel [43]
              Left = 11
              Top = 314
              Width = 311
              Height = 57
              ExplicitLeft = 11
              ExplicitTop = 314
              ExplicitWidth = 311
              ExplicitHeight = 57
              inherited Bevel16: TBevel
                Left = 71
                Top = 9
                Width = 231
                Height = 5
                ExplicitLeft = 71
                ExplicitTop = 9
                ExplicitWidth = 231
                ExplicitHeight = 5
              end
              inherited Label54: TLabel
                Left = 6
                Top = 3
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 6
                ExplicitTop = 3
              end
              inherited btnSurfaceToSurfaceMissileWaypointsEdit: TButton
                Left = 7
                Top = 23
                Width = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 7
                ExplicitTop = 23
                ExplicitWidth = 56
              end
              inherited btnSurfaceToSurfaceMissileWaypointsAdd: TButton
                Left = 63
                Top = 23
                Width = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 63
                ExplicitTop = 23
                ExplicitWidth = 56
              end
              inherited btnSurfaceToSurfaceMissileWaypointsDelete: TButton
                Left = 119
                Top = 23
                Width = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 119
                ExplicitTop = 23
                ExplicitWidth = 56
              end
              inherited btnSurfaceToSurfaceMissileWaypointsApply: TButton
                Left = 175
                Top = 23
                Width = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 175
                ExplicitTop = 23
                ExplicitWidth = 56
              end
              inherited btnSurfaceToSurfaceMissileWaypointsCancel: TButton
                Left = 231
                Top = 23
                Width = 56
                Font.Color = clBlack
                ParentFont = False
                ExplicitLeft = 231
                ExplicitTop = 23
                ExplicitWidth = 56
              end
            end
          end
        end
        inherited grbTacticalAcousticTorpedos: TGroupBox [7]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited Label439: TLabel
            Left = 5
            Top = 8
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 5
            ExplicitTop = 8
          end
          inherited lblTacticalAcousticTorpedosStatus: TLabel
            Left = 23
            Top = 27
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 23
            ExplicitTop = 27
          end
          inherited Label455: TLabel
            Left = 125
            Top = 27
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 125
            ExplicitTop = 27
          end
          inherited lbTacticalAcousticTorpedosQuantity: TLabel
            Left = 186
            Top = 27
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 186
            ExplicitTop = 27
          end
          inherited Label460: TLabel
            Left = 5
            Top = 104
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 5
            ExplicitTop = 104
          end
          inherited Bevel91: TBevel
            Left = 45
            Top = 112
            Width = 253
            Height = 5
            ExplicitLeft = 45
            ExplicitTop = 112
            ExplicitWidth = 253
            ExplicitHeight = 5
          end
          inherited Label461: TLabel
            Left = 23
            Top = 130
            Width = 49
            Caption = 'Track   :'
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 23
            ExplicitTop = 130
            ExplicitWidth = 49
          end
          inherited Label462: TLabel
            Left = 5
            Top = 180
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 5
            ExplicitTop = 180
          end
          inherited Bevel92: TBevel
            Left = 47
            Top = 186
            Width = 253
            Height = 5
            ExplicitLeft = 47
            ExplicitTop = 186
            ExplicitWidth = 253
            ExplicitHeight = 5
          end
          inherited Label463: TLabel
            Left = 100
            Top = 200
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 100
            ExplicitTop = 200
          end
          inherited Label464: TLabel
            Left = 197
            Top = 200
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 197
            ExplicitTop = 200
          end
          inherited Label465: TLabel
            Left = 23
            Top = 159
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 23
            ExplicitTop = 159
          end
          inherited lbTacticalAcousticTorpedosTargetIdentity: TLabel
            Left = 128
            Top = 159
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 128
            ExplicitTop = 159
          end
          inherited Bevel93: TBevel
            Left = 45
            Top = 16
            Width = 253
            Height = 5
            ExplicitLeft = 45
            ExplicitTop = 16
            ExplicitWidth = 253
            ExplicitHeight = 5
          end
          inherited Label459: TLabel
            Left = 5
            Top = 48
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 5
            ExplicitTop = 48
          end
          inherited Bevel94: TBevel
            Left = 53
            Top = 54
            Width = 245
            Height = 5
            ExplicitLeft = 53
            ExplicitTop = 54
            ExplicitWidth = 245
            ExplicitHeight = 5
          end
          inherited Label476: TLabel
            Left = 23
            Top = 74
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 23
            ExplicitTop = 74
          end
          inherited btnTacticalAcousticTorpedosTargetTrack: TSpeedButton
            Left = 186
            Top = 118
            Width = 43
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
            ExplicitLeft = 186
            ExplicitTop = 118
            ExplicitWidth = 43
            ExplicitHeight = 40
          end
          inherited sbTacticalAcousticTorpedosDisplayRangeShow: TSpeedButton
            Left = 78
            Top = 219
            Height = 35
            Font.Height = -13
            ExplicitLeft = 78
            ExplicitTop = 219
            ExplicitHeight = 35
          end
          inherited sbTacticalAcousticTorpedosDisplayRangeHide: TSpeedButton
            Left = 78
            Top = 254
            Height = 35
            Font.Height = -13
            ExplicitLeft = 78
            ExplicitTop = 254
            ExplicitHeight = 35
          end
          inherited sbTacticalAcousticTorpedosDisplayBlindShow: TSpeedButton
            Left = 189
            Top = 219
            Height = 35
            Font.Height = -13
            ExplicitLeft = 189
            ExplicitTop = 219
            ExplicitHeight = 35
          end
          inherited sbTacticalAcousticTorpedosDisplayBlindHide: TSpeedButton
            Left = 189
            Top = 254
            Height = 35
            Font.Height = -13
            ExplicitLeft = 189
            ExplicitTop = 254
            ExplicitHeight = 35
          end
          inherited editTacticalAcousticTorpedosTargetTrack: TEdit
            Left = 128
            Top = 126
            ExplicitLeft = 128
            ExplicitTop = 126
          end
          inherited btnTacticalAcousticTorpedosLaunch: TButton
            Left = 220
            Top = 302
            Height = 35
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 220
            ExplicitTop = 302
            ExplicitHeight = 35
          end
          inherited editTacticalAcousticTorpedosSalvo: TEdit
            Left = 128
            Top = 70
            ExplicitLeft = 128
            ExplicitTop = 70
          end
        end
        inherited grbWireGuidedTorpedo: TGroupBox [8]
          Width = 347
          Height = 550
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox10: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Bevel19: TBevel
              Left = 55
              Top = 56
              Width = 253
              Height = 5
              ExplicitLeft = 55
              ExplicitTop = 56
              ExplicitWidth = 253
              ExplicitHeight = 5
            end
            inherited Bevel20: TBevel
              Left = 56
              Top = 184
              Width = 254
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 184
              ExplicitWidth = 254
              ExplicitHeight = 5
            end
            inherited Bevel21: TBevel
              Left = 51
              Top = 15
              Width = 257
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 15
              ExplicitWidth = 257
              ExplicitHeight = 5
            end
            inherited btnWGTargetTrack: TSpeedButton
              Left = 196
              Top = 71
              Width = 25
              Height = 25
              Glyph.Data = {
                D20A0000424DD20A00000000000042000000280000001A0000001A0000000100
                200003000000900A0000130B0000130B000000000000000000000000FF0000FF
                0000FF000000E6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF817F7FFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF817F7FFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A
                9AFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFC9C5C5FF565454FF2B2A2AFF0000
                00FF000000FF1D1C1CFF656262FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF646262FF1D1C1CFF908D
                8DFFBBB6B6FF8F8C8CFF908C8CFFC9C5C5FF727070FF0E0E0EFF656363FFD8D3
                D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF2B2A2AFF6463
                63FFD8D3D3FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD8D3
                D3FF555454FF2B2A2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FF6462
                62FF565454FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFACA9A9FF0E0E0EFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF1C1C1CFFC9C5
                C5FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF646262FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF8F8C8CFF565454FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF1C1C1CFFCAC5C5FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFBBB6B6FF2B2A2AFFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF000000FF908C
                8CFF908C8CFF908C8CFF908C8CFF908C8CFFACA9A9FFE6E1E1FFE6E1E1FFACA9
                A9FF908C8CFF908C8CFF908C8CFF908C8CFF908C8CFF000000FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF000000FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFFACA9A9FFE6E1
                E1FFE6E1E1FFACA9A9FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF0000
                00FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FF2B2A2AFFBBB7B7FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFADA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFC9C5C5FF1D1C1CFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF565454FF908D8DFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FF656262FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFC9C5C5FF1D1C
                1CFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFD7D3D3FF0E0E0EFFACA9A9FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FF646262FF656363FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF555454FF646363FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF2B2A2AFF565454FFD8D3D3FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFD7D3D3FF646262FF2B2A
                2AFFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFD8D3D3FF6462
                62FF0E0E0EFF737171FFCAC5C5FF8F8C8CFF908C8CFFBBB7B7FF8F8C8CFF1C1C
                1CFF646363FFD8D3D3FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFACA8A8FF656262FF1C1C1CFF000000FF000000FF2B2A
                2AFF565454FFC9C5C5FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF9F9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF817E7EFFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF9E9B9BFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF908D8DFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF}
              ExplicitLeft = 196
              ExplicitTop = 71
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited Label84: TLabel
              Left = 8
              Top = 9
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 9
            end
            inherited Label85: TLabel
              Top = 28
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 28
            end
            inherited Label86: TLabel
              Left = 8
              Top = 50
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 50
            end
            inherited Label87: TLabel
              Top = 75
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 75
            end
            inherited Label88: TLabel
              Top = 178
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 178
            end
            inherited Label89: TLabel
              Left = 95
              Top = 201
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 95
              ExplicitTop = 201
            end
            inherited Label90: TLabel
              Left = 198
              Top = 201
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 198
              ExplicitTop = 201
            end
            inherited Label91: TLabel
              Top = 99
              Width = 95
              Caption = 'Identity            :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 99
              ExplicitWidth = 95
            end
            inherited Label92: TLabel
              Top = 118
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 118
            end
            inherited Label93: TLabel
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 137
            end
            inherited Label94: TLabel
              Top = 156
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 156
            end
            inherited Label95: TLabel
              Left = 196
              Top = 118
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 196
              ExplicitTop = 118
            end
            inherited Label96: TLabel
              Left = 196
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 196
              ExplicitTop = 137
            end
            inherited Label97: TLabel
              Left = 196
              Top = 154
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 196
              ExplicitTop = 154
            end
            inherited lblWGQuantity: TLabel
              Left = 178
              Top = 29
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 178
              ExplicitTop = 29
            end
            inherited lblWGStatus: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited lblWGTargetCourse: TLabel
              Left = 129
              Top = 118
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 118
            end
            inherited lblWGTargetDepth: TLabel
              Left = 129
              Top = 154
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 154
            end
            inherited lblWGTargetSpeed: TLabel
              Left = 129
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 137
            end
            inherited lblWGTargetIdentity: TLabel
              Left = 130
              Top = 99
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 130
              ExplicitTop = 99
            end
            inherited btnWGRangeHide: TSpeedButton
              Left = 73
              Top = 257
              Height = 35
              Font.Height = -13
              ExplicitLeft = 73
              ExplicitTop = 257
              ExplicitHeight = 35
            end
            inherited btnWGBlindHide: TSpeedButton
              Left = 190
              Top = 257
              Height = 35
              Font.Height = -13
              ExplicitLeft = 190
              ExplicitTop = 257
              ExplicitHeight = 35
            end
            inherited btnWGBlindShow: TSpeedButton
              Left = 190
              Top = 221
              Height = 35
              Font.Height = -13
              ExplicitLeft = 190
              ExplicitTop = 221
              ExplicitHeight = 35
            end
            inherited btnWGRangeShow: TSpeedButton
              Left = 73
              Top = 221
              Height = 35
              Font.Height = -13
              ExplicitLeft = 73
              ExplicitTop = 221
              ExplicitHeight = 35
            end
            inherited Label39: TLabel
              Left = 109
              Top = 154
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 154
            end
            inherited Label40: TLabel
              Left = 109
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 137
            end
            inherited Label41: TLabel
              Left = 109
              Top = 118
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 118
            end
            inherited Label42: TLabel
              Left = 109
              Top = 75
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 109
              ExplicitTop = 75
            end
            inherited btnWGLaunch: TButton
              Left = 224
              Top = 301
              Height = 35
              ExplicitLeft = 224
              ExplicitTop = 301
              ExplicitHeight = 35
            end
            inherited EdtWGTargetTrack: TEdit
              Left = 130
              Top = 71
              Width = 60
              Height = 24
              Font.Height = -13
              Text = '---'
              ExplicitLeft = 130
              ExplicitTop = 71
              ExplicitWidth = 60
              ExplicitHeight = 24
            end
          end
        end
        inherited grbWakeHomingTorpedos: TGroupBox [9]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox5: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Bevel17: TBevel
              Left = 51
              Top = 15
              Width = 274
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 15
              ExplicitWidth = 274
              ExplicitHeight = 5
            end
            inherited Bevel18: TBevel
              Left = 55
              Top = 61
              Width = 270
              Height = 5
              ExplicitLeft = 55
              ExplicitTop = 61
              ExplicitWidth = 270
              ExplicitHeight = 5
            end
            inherited Bevel5: TBevel
              Left = 55
              Top = 107
              Width = 269
              Height = 5
              ExplicitLeft = 55
              ExplicitTop = 107
              ExplicitWidth = 269
              ExplicitHeight = 5
            end
            inherited Bevel6: TBevel
              Left = 54
              Top = 283
              Width = 270
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 283
              ExplicitWidth = 270
              ExplicitHeight = 5
            end
            inherited btnWakeHomingTargetTrack: TSpeedButton
              Left = 206
              Top = 117
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
              OnClick = fmWeapon1btnWakeHomingTargetTrackClick
              ExplicitLeft = 206
              ExplicitTop = 117
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited Label23: TLabel
              Left = 8
              Top = 9
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 9
            end
            inherited Label25: TLabel
              Left = 117
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 117
            end
            inherited Label26: TLabel
              Left = 8
              Top = 101
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 101
            end
            inherited Label27: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label28: TLabel
              Left = 8
              Top = 277
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 277
            end
            inherited Label29: TLabel
              Left = 96
              Top = 299
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 96
              ExplicitTop = 299
            end
            inherited Label30: TLabel
              Left = 196
              Top = 299
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 196
              ExplicitTop = 299
            end
            inherited Label31: TLabel
              Top = 160
              Width = 99
              Caption = 'Identity             :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 160
              ExplicitWidth = 99
            end
            inherited Label32: TLabel
              Top = 191
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 191
            end
            inherited Label33: TLabel
              Top = 221
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 221
            end
            inherited Label34: TLabel
              Top = 251
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 251
            end
            inherited Label35: TLabel
              Left = 206
              Top = 191
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 191
            end
            inherited Label37: TLabel
              Left = 206
              Top = 221
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 221
            end
            inherited Label46: TLabel
              Left = 206
              Top = 251
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 251
            end
            inherited Label47: TLabel
              Left = 8
              Top = 55
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 55
            end
            inherited Label55: TLabel
              Top = 74
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 74
            end
            inherited lblWHStatus: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited lblWHTargetIdentity: TLabel
              Top = 161
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 161
            end
            inherited lblWHQuantity: TLabel
              Left = 178
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 178
            end
            inherited lblWHTargetBearing: TLabel
              Top = 191
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 191
            end
            inherited btnWHBlindHide: TSpeedButton
              Left = 188
              Top = 351
              Height = 35
              Font.Height = -13
              ExplicitLeft = 188
              ExplicitTop = 351
              ExplicitHeight = 35
            end
            inherited btnWHBlindShow: TSpeedButton
              Left = 188
              Top = 316
              Height = 35
              Font.Height = -13
              ExplicitLeft = 188
              ExplicitTop = 316
              ExplicitHeight = 35
            end
            inherited btnWHRangeHide: TSpeedButton
              Left = 74
              Top = 351
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 351
              ExplicitHeight = 35
            end
            inherited btnWHRangeShow: TSpeedButton
              Left = 74
              Top = 317
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 317
              ExplicitHeight = 35
            end
            inherited Label43: TLabel
              Left = 114
              Top = 251
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 251
            end
            inherited Label44: TLabel
              Left = 114
              Top = 221
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 221
            end
            inherited Label45: TLabel
              Left = 114
              Top = 191
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 191
            end
            inherited Label48: TLabel
              Left = 114
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
            end
            inherited Label53: TLabel
              Left = 114
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
            end
            inherited btnWHLaunch: TButton
              Left = 237
              Top = 390
              Height = 35
              ExplicitLeft = 237
              ExplicitTop = 390
              ExplicitHeight = 35
            end
            inherited btnWHDefaultSeekerRange: TButton
              Left = 249
              Top = 247
              ExplicitLeft = 249
              ExplicitTop = 247
            end
            inherited EdtWHLaunchBearing: TEdit
              Top = 217
              ExplicitTop = 217
            end
            inherited EdtWHSeekerRange: TEdit
              Top = 247
              ExplicitTop = 247
            end
            inherited EdtWHTargetTrack: TEdit
              Top = 125
              Width = 60
              ExplicitTop = 125
              ExplicitWidth = 60
            end
          end
        end
        inherited grbTacticalMissiles: TGroupBox [10]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox7: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Bevel107: TBevel
              Left = 47
              Top = 5
              Width = 272
              Height = 5
              ExplicitLeft = 47
              ExplicitTop = 5
              ExplicitWidth = 272
              ExplicitHeight = 5
            end
            inherited Bevel108: TBevel
              Left = 66
              Top = 286
              Width = 258
              Height = 5
              ExplicitLeft = 66
              ExplicitTop = 286
              ExplicitWidth = 258
              ExplicitHeight = 5
            end
            inherited Bevel59: TBevel
              Left = 55
              Top = 180
              Width = 269
              Height = 5
              ExplicitLeft = 55
              ExplicitTop = 180
              ExplicitWidth = 269
              ExplicitHeight = 5
            end
            inherited Bevel60: TBevel
              Left = 47
              Top = 43
              Width = 272
              Height = 5
              ExplicitLeft = 47
              ExplicitTop = 43
              ExplicitWidth = 272
              ExplicitHeight = 5
            end
            inherited Bevel62: TBevel
              Left = 48
              Top = 339
              Width = 277
              Height = 5
              ExplicitLeft = 48
              ExplicitTop = 339
              ExplicitWidth = 277
              ExplicitHeight = 5
            end
            inherited btnTacticalMissileTargetAimpoint: TSpeedButton
              Left = 253
              Top = 94
              Width = 30
              Height = 30
              ExplicitLeft = 253
              ExplicitTop = 94
              ExplicitWidth = 30
              ExplicitHeight = 30
            end
            inherited btnTacticalMissileTargetTrack: TSpeedButton
              Left = 185
              Top = 48
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
              ExplicitLeft = 185
              ExplicitTop = 48
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited Label289: TLabel
              Top = -2
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = -2
            end
            inherited Label294: TLabel
              Left = 117
              Top = 18
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 117
              ExplicitTop = 18
            end
            inherited Label295: TLabel
              Left = 1
              Top = 37
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 1
              ExplicitTop = 37
            end
            inherited Label296: TLabel
              Left = 4
              Top = 174
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 4
              ExplicitTop = 174
            end
            inherited Label302: TLabel
              Left = 24
              Top = 192
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 192
            end
            inherited Label303: TLabel
              Left = 182
              Top = 136
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 182
              ExplicitTop = 136
            end
            inherited Label304: TLabel
              Left = 2
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 2
              ExplicitTop = 333
            end
            inherited Label486: TLabel
              Left = 71
              Top = 351
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 71
              ExplicitTop = 351
            end
            inherited Label494: TLabel
              Left = 221
              Top = 351
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 221
              ExplicitTop = 351
            end
            inherited Label496: TLabel
              Left = 24
              Top = 223
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 24
              ExplicitTop = 223
            end
            inherited Label497: TLabel
              Left = 23
              Top = 254
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 23
              ExplicitTop = 254
            end
            inherited Label498: TLabel
              Top = 223
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 223
            end
            inherited Label499: TLabel
              Left = 182
              Top = 254
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 182
              ExplicitTop = 254
            end
            inherited Label500: TLabel
              Left = 1
              Top = 280
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 1
              ExplicitTop = 280
            end
            inherited lblTacticalMissileStatus: TLabel
              Left = 26
              Top = 18
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 26
              ExplicitTop = 18
            end
            inherited lblTacticalMissileStatusQuantity: TLabel
              Left = 178
              Top = 18
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 178
              ExplicitTop = 18
            end
            inherited sbTacticalMissileDisplayBlindHide: TSpeedButton
              Left = 213
              Top = 405
              Height = 35
              Font.Height = -13
              ExplicitLeft = 213
              ExplicitTop = 405
              ExplicitHeight = 35
            end
            inherited sbTacticalMissileDisplayBlindShow: TSpeedButton
              Left = 213
              Top = 370
              Height = 35
              Font.Height = -13
              ExplicitLeft = 213
              ExplicitTop = 370
              ExplicitHeight = 35
            end
            inherited sbTacticalMissileDisplayRangeHide: TSpeedButton
              Left = 49
              Top = 405
              Height = 35
              Font.Height = -13
              ExplicitLeft = 49
              ExplicitTop = 405
              ExplicitHeight = 35
            end
            inherited sbTacticalMissileDisplayRangeShow: TSpeedButton
              Left = 49
              Top = 370
              Height = 35
              Font.Height = -13
              ExplicitLeft = 49
              ExplicitTop = 370
              ExplicitHeight = 35
            end
            inherited btnTacticalMissileControlCruise: TButton
              Left = 227
              Top = 219
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 227
              ExplicitTop = 219
            end
            inherited btnTacticalMissileControlSeeker: TButton
              Left = 227
              Top = 250
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 227
              ExplicitTop = 250
            end
            inherited btnTacticalMissileLaunch: TButton
              Left = 244
              Top = 447
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 447
              ExplicitHeight = 35
            end
            inherited btnTacticalMissileTargetBearing: TButton
              Top = 132
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 132
            end
            inherited btnTacticalMissileWaypointAdd: TButton
              Left = 125
              Top = 301
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 125
              ExplicitTop = 301
            end
            inherited btnTacticalMissileWaypointCancel: TButton
              Left = 221
              Top = 301
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 221
              ExplicitTop = 301
            end
            inherited btnTacticalMissileWaypointEdit: TButton
              Left = 29
              Top = 301
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 29
              ExplicitTop = 301
            end
            inherited editTacticalMissileControlCruise: TEdit
              Left = 122
              Top = 218
              ExplicitLeft = 122
              ExplicitTop = 218
            end
            inherited editTacticalMissileControlSalvo: TEdit
              Left = 122
              Top = 188
              ExplicitLeft = 122
              ExplicitTop = 188
            end
            inherited editTacticalMissileControlSeeker: TEdit
              Left = 122
              Top = 249
              ExplicitLeft = 122
              ExplicitTop = 249
            end
            inherited rdoTacticalMissileTargetAimpoint: TRadioButton
              Top = 101
              Width = 88
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 101
              ExplicitWidth = 88
            end
            inherited rdoTacticalMissileTargetBearing: TRadioButton
              Top = 136
              Width = 88
              Caption = 'Bearing  :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 136
              ExplicitWidth = 88
            end
            inherited rdoTacticalMissileTargetTrack: TRadioButton
              Top = 60
              Width = 88
              Caption = 'Track     :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 60
              ExplicitWidth = 88
            end
            inherited editTacticalMissileTargetAimpoint: TEdit
              Left = 122
              Top = 97
              ExplicitLeft = 122
              ExplicitTop = 97
            end
            inherited editTacticalMissileTargetTrack: TEdit
              Left = 122
              Top = 56
              ExplicitLeft = 122
              ExplicitTop = 56
            end
            inherited editTacticalMissileTargetBearing: TEdit
              Left = 122
              Top = 132
              ExplicitLeft = 122
              ExplicitTop = 132
            end
          end
        end
        inherited grbSurfaceToAirMissile: TGroupBox
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox1: TScrollBox
            Width = 343
            Height = 530
            Font.Color = clBlack
            ParentFont = False
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Label1: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Bevel1: TBevel
              Left = 46
              Width = 255
              Height = 5
              ExplicitLeft = 46
              ExplicitWidth = 255
              ExplicitHeight = 5
            end
            inherited lblSurfaceToAirStatus: TLabel
              Left = 21
              Top = 19
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 19
            end
            inherited Label2: TLabel
              Left = 124
              Top = 19
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 124
              ExplicitTop = 19
            end
            inherited lbSurfaceToAirStatusQuantity: TLabel
              Left = 185
              Top = 19
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 185
              ExplicitTop = 19
            end
            inherited Label3: TLabel
              Left = 2
              Top = 42
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 2
              ExplicitTop = 42
            end
            inherited Bevel2: TBevel
              Left = 49
              Top = 49
              Width = 252
              Height = 5
              ExplicitLeft = 49
              ExplicitTop = 49
              ExplicitWidth = 252
              ExplicitHeight = 5
            end
            inherited Label4: TLabel
              Left = 21
              Top = 64
              Width = 106
              Caption = 'Salvo size           :'
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 64
              ExplicitWidth = 106
            end
            inherited Label5: TLabel
              Left = 3
              Top = 85
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 3
              ExplicitTop = 85
            end
            inherited Bevel3: TBevel
              Left = 45
              Top = 92
              Width = 255
              Height = 5
              ExplicitLeft = 45
              ExplicitTop = 92
              ExplicitWidth = 255
              ExplicitHeight = 5
            end
            inherited Label6: TLabel
              Left = 21
              Top = 109
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 109
            end
            inherited Label7: TLabel
              Left = 21
              Top = 141
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 141
            end
            inherited Label8: TLabel
              Left = 21
              Top = 159
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 159
            end
            inherited Label9: TLabel
              Left = 21
              Top = 178
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 178
            end
            inherited Label10: TLabel
              Left = 21
              Top = 197
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 197
            end
            inherited Label11: TLabel
              Left = 21
              Top = 215
              Width = 40
              Caption = 'Status '
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 215
              ExplicitWidth = 40
            end
            inherited Label12: TLabel
              Left = 21
              Top = 234
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 234
            end
            inherited Label13: TLabel
              Left = 21
              Top = 253
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 21
              ExplicitTop = 253
            end
            inherited Label14: TLabel
              Left = 6
              Top = 275
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 6
              ExplicitTop = 275
            end
            inherited Bevel4: TBevel
              Left = 52
              Top = 281
              Width = 249
              Height = 5
              ExplicitLeft = 52
              ExplicitTop = 281
              ExplicitWidth = 249
              ExplicitHeight = 5
            end
            inherited Label15: TLabel
              Left = 95
              Top = 295
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 95
              ExplicitTop = 295
            end
            inherited Label16: TLabel
              Left = 198
              Top = 295
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 198
              ExplicitTop = 295
            end
            inherited lbSurfaceToAirCourse: TLabel
              Left = 139
              Top = 142
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 142
            end
            inherited lbSurfaceToAirGround: TLabel
              Left = 139
              Top = 159
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 159
            end
            inherited lbSurfaceToAirAltitude: TLabel
              Left = 139
              Top = 178
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 178
            end
            inherited lbSurfaceToAirStatus: TLabel
              Left = 139
              Top = 215
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 215
            end
            inherited lbSurfaceToAirTimeToWait: TLabel
              Left = 139
              Top = 234
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 234
            end
            inherited lbSurfaceToAirTimeToIntercept: TLabel
              Left = 139
              Top = 253
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 139
              ExplicitTop = 253
            end
            inherited Label17: TLabel
              Left = 206
              Top = 141
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 141
            end
            inherited Label18: TLabel
              Left = 206
              Top = 159
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 159
            end
            inherited Label19: TLabel
              Left = 206
              Top = 178
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 178
            end
            inherited Label20: TLabel
              Left = 206
              Top = 234
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 234
            end
            inherited Label22: TLabel
              Left = 206
              Top = 253
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 206
              ExplicitTop = 253
            end
            inherited btnSurfaceToAirTargetTrack: TSpeedButton
              Left = 206
              Top = 97
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
              ExplicitLeft = 206
              ExplicitTop = 97
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited sbSurfaceToAirDisplayRangeShow: TSpeedButton
              Left = 74
              Top = 313
              Width = 78
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 313
              ExplicitWidth = 78
              ExplicitHeight = 35
            end
            inherited sbSurfaceToAirDisplayRangeHide: TSpeedButton
              Left = 74
              Top = 349
              Width = 78
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 349
              ExplicitWidth = 78
              ExplicitHeight = 35
            end
            inherited sbSurfaceToAirDisplayBlindShow: TSpeedButton
              Left = 191
              Top = 313
              Width = 78
              Height = 35
              Font.Height = -13
              ExplicitLeft = 191
              ExplicitTop = 313
              ExplicitWidth = 78
              ExplicitHeight = 35
            end
            inherited sbSurfaceToAirDisplayBlindHide: TSpeedButton
              Left = 191
              Top = 349
              Width = 78
              Height = 35
              Font.Height = -13
              ExplicitLeft = 191
              ExplicitTop = 349
              ExplicitWidth = 78
              ExplicitHeight = 35
            end
            inherited Label106: TLabel
              Left = 125
              Top = 141
              ExplicitLeft = 125
              ExplicitTop = 141
            end
            inherited Label107: TLabel
              Left = 125
              Top = 109
              ExplicitLeft = 125
              ExplicitTop = 109
            end
            inherited Label108: TLabel
              Left = 125
              Top = 159
              ExplicitLeft = 125
              ExplicitTop = 159
            end
            inherited Label109: TLabel
              Left = 125
              Top = 178
              ExplicitLeft = 125
              ExplicitTop = 178
            end
            inherited Label110: TLabel
              Left = 125
              Top = 199
              ExplicitLeft = 125
              ExplicitTop = 199
            end
            inherited Label111: TLabel
              Left = 125
              Top = 215
              ExplicitLeft = 125
              ExplicitTop = 215
            end
            inherited Label112: TLabel
              Left = 125
              Top = 234
              ExplicitLeft = 125
              ExplicitTop = 234
            end
            inherited Label113: TLabel
              Left = 125
              Top = 253
              ExplicitLeft = 125
              ExplicitTop = 253
            end
            inherited editSurfaceToAirTrack: TEdit [46]
              Left = 139
              Top = 105
              Height = 24
              Font.Height = -13
              ExplicitLeft = 139
              ExplicitTop = 105
              ExplicitHeight = 24
            end
            inherited ediSurfaceToAirSalvo: TEdit [47]
              Left = 139
              Top = 60
              Width = 67
              Height = 24
              Font.Height = -13
              ExplicitLeft = 139
              ExplicitTop = 60
              ExplicitWidth = 67
              ExplicitHeight = 24
            end
            inherited btSurfaceToAirPlan: TButton
              Left = 22
              Top = 394
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 22
              ExplicitTop = 394
              ExplicitHeight = 35
            end
            inherited btSurfaceToAirLaunch: TButton
              Left = 240
              Top = 394
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 240
              ExplicitTop = 394
              ExplicitHeight = 35
            end
            inherited btSurfaceToAirCancel: TButton
              Left = 112
              Top = 394
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 112
              ExplicitTop = 394
              ExplicitHeight = 35
            end
          end
        end
        inherited grbMines: TGroupBox [12]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited Label272: TLabel
            Left = 8
            Top = 9
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 9
          end
          inherited lblStatusMines: TLabel
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 28
          end
          inherited Label288: TLabel
            Left = 118
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 118
            ExplicitTop = 28
          end
          inherited lbMinesQuantity: TLabel
            Left = 178
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 178
            ExplicitTop = 28
          end
          inherited Label291: TLabel
            Left = 8
            Top = 50
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 50
          end
          inherited Bevel58: TBevel
            Left = 53
            Top = 57
            ExplicitLeft = 53
            ExplicitTop = 57
          end
          inherited Label292: TLabel
            Top = 85
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 85
          end
          inherited Bevel61: TBevel
            Left = 48
            Top = 16
            Width = 270
            ExplicitLeft = 48
            ExplicitTop = 16
            ExplicitWidth = 270
          end
          inherited lbl84: TLabel
            Left = 171
            Top = 85
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 171
            ExplicitTop = 85
          end
          inherited lbl104: TLabel
            Top = 210
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 210
          end
          inherited lbl101: TLabel
            Top = 155
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 155
          end
          inherited lbl100: TLabel
            Top = 155
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 155
          end
          inherited EdtMinesDepth: TEdit
            Top = 81
            Width = 52
            Height = 24
            Font.Height = -13
            ExplicitTop = 81
            ExplicitWidth = 52
            ExplicitHeight = 24
          end
          inherited btnMinesDeploy: TButton
            Left = 243
            Top = 120
            Width = 75
            Height = 35
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 243
            ExplicitTop = 120
            ExplicitWidth = 75
            ExplicitHeight = 35
          end
          inherited edtCount: TEdit
            Top = 206
            Height = 24
            Font.Height = -13
            OnKeyPress = nil
            ExplicitTop = 206
            ExplicitHeight = 24
          end
          inherited edtRange: TEdit
            Top = 151
            Height = 24
            Font.Height = -13
            ExplicitTop = 151
            ExplicitHeight = 24
          end
        end
        inherited grbGunEngagementChaffMode: TGroupBox [13]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox9: TScrollBox
            Width = 343
            Height = 530
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Label348: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Bevel97: TBevel
              Left = 51
              Top = 12
              Width = 249
              Height = 5
              ExplicitLeft = 51
              ExplicitTop = 12
              ExplicitWidth = 249
              ExplicitHeight = 5
            end
            inherited Label364: TLabel
              Left = 48
              Top = 23
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 48
              ExplicitTop = 23
            end
            inherited Label365: TLabel
              Left = 23
              Top = 153
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 23
              ExplicitTop = 153
            end
            inherited Label366: TLabel
              Left = 23
              Top = 180
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 23
              ExplicitTop = 180
            end
            inherited Label466: TLabel
              Left = 23
              Top = 207
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 23
              ExplicitTop = 207
            end
            inherited Label467: TLabel
              Left = 23
              Top = 235
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 23
              ExplicitTop = 235
            end
            inherited lbChaffControlQuantity: TLabel
              Left = 144
              Top = 180
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 144
              ExplicitTop = 180
            end
            inherited Label469: TLabel
              Left = 198
              Top = 235
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 198
              ExplicitTop = 235
            end
            inherited Label470: TLabel
              Left = 7
              Top = 273
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 7
              ExplicitTop = 273
            end
            inherited Bevel98: TBevel
              Left = 54
              Top = 279
              Width = 250
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 279
              ExplicitWidth = 250
              ExplicitHeight = 5
            end
            inherited Label471: TLabel
              Left = 93
              Top = 291
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 93
              ExplicitTop = 291
            end
            inherited Label472: TLabel
              Left = 203
              Top = 290
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 203
              ExplicitTop = 290
            end
            inherited btnChaffType: TSpeedButton
              Left = 225
              Top = 149
              Width = 25
              Height = 25
              ExplicitLeft = 225
              ExplicitTop = 149
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnChaffBloomPosition: TSpeedButton
              Left = 276
              Top = 203
              Width = 25
              Height = 25
              ExplicitLeft = 276
              ExplicitTop = 203
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited sbGunEngagementChaffContolAuto: TSpeedButton
              Left = 23
              Top = 40
              Height = 35
              Font.Height = -13
              ExplicitLeft = 23
              ExplicitTop = 40
              ExplicitHeight = 35
            end
            inherited sbGunEngagementChaffContolManual: TSpeedButton
              Left = 23
              Top = 75
              Height = 35
              Font.Height = -13
              ExplicitLeft = 23
              ExplicitTop = 75
              ExplicitHeight = 35
            end
            inherited sbChaffDisplayShow: TSpeedButton
              Left = 71
              Top = 309
              Height = 35
              Font.Height = -13
              ExplicitLeft = 71
              ExplicitTop = 309
              ExplicitHeight = 35
            end
            inherited sbChaffDisplayHide: TSpeedButton
              Left = 71
              Top = 344
              Height = 35
              Font.Height = -13
              ExplicitLeft = 71
              ExplicitTop = 344
              ExplicitHeight = 35
            end
            inherited sbChaffBlindZoneShow: TSpeedButton
              Left = 192
              Top = 309
              Height = 35
              Font.Height = -13
              ExplicitLeft = 192
              ExplicitTop = 309
              ExplicitHeight = 35
            end
            inherited sbChaffBlindZoneHide: TSpeedButton
              Left = 192
              Top = 344
              Height = 35
              Font.Height = -13
              ExplicitLeft = 192
              ExplicitTop = 344
              ExplicitHeight = 35
            end
            inherited sbGunEngagementChaffContolChaff: TSpeedButton
              Left = 23
              Top = 110
              Height = 35
              Font.Height = -13
              ExplicitLeft = 23
              ExplicitTop = 110
              ExplicitHeight = 35
            end
            inherited editChaffControlChaff: TEdit
              Left = 144
              Top = 149
              Height = 24
              Font.Height = -13
              ExplicitLeft = 144
              ExplicitTop = 149
              ExplicitHeight = 24
            end
            inherited editChaffControlBloomPosition: TEdit
              Left = 144
              Top = 203
              Height = 24
              Font.Height = -13
              ExplicitLeft = 144
              ExplicitTop = 203
              ExplicitHeight = 24
            end
            inherited editChaffControlBloomAltitude: TEdit
              Left = 144
              Top = 231
              Height = 24
              Font.Height = -13
              ExplicitLeft = 144
              ExplicitTop = 231
              ExplicitHeight = 24
            end
            inherited btnChaffFire: TButton
              Left = 128
              Top = 388
              Height = 35
              Font.Height = -13
              ExplicitLeft = 128
              ExplicitTop = 388
              ExplicitHeight = 35
            end
            inherited btnChaffCeaseFire: TButton
              Left = 225
              Top = 388
              Height = 35
              Font.Height = -13
              ExplicitLeft = 225
              ExplicitTop = 388
              ExplicitHeight = 35
            end
          end
        end
        inherited grbAirDroppedVECTAC: TGroupBox [14]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox13: TScrollBox
            Width = 343
            Height = 530
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited Bevel72: TBevel
              Left = 51
              Width = 270
              Height = 5
              ExplicitLeft = 51
              ExplicitWidth = 270
              ExplicitHeight = 5
            end
            inherited Bevel75: TBevel
              Left = 106
              Top = 172
              Width = 214
              Height = 5
              ExplicitLeft = 106
              ExplicitTop = 172
              ExplicitWidth = 214
              ExplicitHeight = 5
            end
            inherited Bevel76: TBevel
              Left = 56
              Top = 365
              Width = 265
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 365
              ExplicitWidth = 265
              ExplicitHeight = 5
            end
            inherited btnVectacTargetTrack: TSpeedButton
              Left = 194
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
              ExplicitLeft = 194
              ExplicitTop = 10
              ExplicitWidth = 40
              ExplicitHeight = 40
            end
            inherited btnVectacWeaponCarrierName: TSpeedButton
              Left = 295
              Top = 188
              Width = 25
              Height = 25
              ExplicitLeft = 295
              ExplicitTop = 188
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited btnVectacWeaponName: TSpeedButton
              Left = 295
              Top = 379
              Width = 25
              Height = 25
              ExplicitLeft = 295
              ExplicitTop = 379
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited Label367: TLabel
              Font.Color = clBlack
              ParentFont = False
            end
            inherited Label368: TLabel
              Left = 15
              Top = 22
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 22
            end
            inherited Label369: TLabel
              Top = 165
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 165
            end
            inherited Label371: TLabel
              Left = 15
              Top = 192
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 192
            end
            inherited Label375: TLabel
              Left = 15
              Top = 227
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 227
            end
            inherited Label376: TLabel
              Left = 15
              Top = 262
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 262
            end
            inherited Label377: TLabel
              Left = 15
              Top = 297
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 297
            end
            inherited Label378: TLabel
              Left = 15
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 333
            end
            inherited Label379: TLabel
              Top = 359
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 359
            end
            inherited Label380: TLabel
              Left = 15
              Top = 383
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 383
            end
            inherited Label383: TLabel
              Left = 194
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 104
            end
            inherited Label384: TLabel
              Left = 194
              Top = 227
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 227
            end
            inherited Label385: TLabel
              Left = 194
              Top = 297
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 297
            end
            inherited Label386: TLabel
              Left = 15
              Top = 50
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 50
            end
            inherited Label387: TLabel
              Left = 15
              Top = 68
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 68
            end
            inherited Label388: TLabel
              Left = 15
              Top = 86
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 86
            end
            inherited Label389: TLabel
              Left = 15
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 104
            end
            inherited Label390: TLabel
              Left = 15
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 122
            end
            inherited Label391: TLabel
              Left = 15
              Top = 140
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 140
            end
            inherited Label392: TLabel
              Left = 194
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 122
            end
            inherited Label393: TLabel
              Left = 194
              Top = 140
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 140
            end
            inherited Label394: TLabel
              Left = 194
              Top = 262
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 262
            end
            inherited Label395: TLabel
              Left = 194
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 333
            end
            inherited Label396: TLabel
              Left = 15
              Top = 409
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 15
              ExplicitTop = 409
            end
            inherited Label398: TLabel
              Left = 194
              Top = 409
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 194
              ExplicitTop = 409
            end
            inherited lbVectacTargetCourse: TLabel
              Left = 129
              Top = 104
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 104
            end
            inherited lbVectacTargetDepth: TLabel
              Left = 129
              Top = 140
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 140
            end
            inherited lbVectacTargetDoppler: TLabel
              Left = 129
              Top = 86
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 86
            end
            inherited lbVectacTargetGround: TLabel
              Left = 129
              Top = 122
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 122
            end
            inherited lbVectacTargetIdentity: TLabel
              Left = 129
              Top = 50
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 50
            end
            inherited lbVectacTargetPropulsion: TLabel
              Left = 129
              Top = 68
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 68
            end
            inherited lbVectacWeaponCarrierAdviced: TLabel
              Left = 129
              Top = 262
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 262
            end
            inherited lbVectacWeaponCarrierTime: TLabel
              Left = 129
              Top = 333
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 333
            end
            inherited lbVectacWeaponExpiry: TLabel
              Left = 129
              Top = 409
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 129
              ExplicitTop = 409
            end
            inherited Label66: TLabel
              Left = 118
              Top = 22
              ExplicitLeft = 118
              ExplicitTop = 22
            end
            inherited Label68: TLabel
              Left = 118
              Top = 50
              ExplicitLeft = 118
              ExplicitTop = 50
            end
            inherited Label80: TLabel
              Left = 118
              Top = 68
              ExplicitLeft = 118
              ExplicitTop = 68
            end
            inherited Label81: TLabel
              Left = 118
              Top = 86
              ExplicitLeft = 118
              ExplicitTop = 86
            end
            inherited Label82: TLabel
              Left = 118
              Top = 122
              ExplicitLeft = 118
              ExplicitTop = 122
            end
            inherited Label83: TLabel
              Left = 118
              Top = 104
              ExplicitLeft = 118
              ExplicitTop = 104
            end
            inherited Label98: TLabel
              Left = 118
              Top = 333
              ExplicitLeft = 118
              ExplicitTop = 333
            end
            inherited Label99: TLabel
              Left = 118
              Top = 297
              ExplicitLeft = 118
              ExplicitTop = 297
            end
            inherited Label100: TLabel
              Left = 118
              Top = 262
              ExplicitLeft = 118
              ExplicitTop = 262
            end
            inherited Label101: TLabel
              Left = 118
              Top = 227
              ExplicitLeft = 118
              ExplicitTop = 227
            end
            inherited Label102: TLabel
              Left = 118
              Top = 192
              ExplicitLeft = 118
              ExplicitTop = 192
            end
            inherited Label103: TLabel
              Left = 118
              Top = 409
              ExplicitLeft = 118
              ExplicitTop = 409
            end
            inherited Label104: TLabel
              Left = 118
              Top = 140
              ExplicitLeft = 118
              ExplicitTop = 140
            end
            inherited Label105: TLabel
              Left = 118
              Top = 383
              ExplicitLeft = 118
              ExplicitTop = 383
            end
            inherited btnVectacCancel: TButton
              Left = 96
              Top = 437
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 96
              ExplicitTop = 437
              ExplicitHeight = 35
            end
            inherited btnVectacConfirm: TButton
              Left = 184
              Top = 437
              Width = 150
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 184
              ExplicitTop = 437
              ExplicitWidth = 150
              ExplicitHeight = 35
            end
            inherited btnVectacPlan: TButton
              Left = 10
              Top = 437
              Height = 35
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 10
              ExplicitTop = 437
              ExplicitHeight = 35
            end
            inherited btnVectacWeaponCarrierDrop: TButton
              Left = 252
              Top = 293
              Width = 68
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 252
              ExplicitTop = 293
              ExplicitWidth = 68
            end
            inherited btnVectacWeaponCarrierGround: TButton
              Left = 252
              Top = 223
              Width = 68
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 252
              ExplicitTop = 223
              ExplicitWidth = 68
            end
            inherited editVectacTargetTrack: TEdit
              Left = 129
              Top = 18
              Width = 60
              Enabled = True
              ReadOnly = True
              ExplicitLeft = 129
              ExplicitTop = 18
              ExplicitWidth = 60
            end
            inherited editVectacWeaponCarrierDrop: TEdit
              Left = 129
              Top = 293
              Enabled = True
              ReadOnly = True
              ExplicitLeft = 129
              ExplicitTop = 293
            end
            inherited editVectacWeaponCarrierGround: TEdit
              Left = 129
              Top = 223
              Enabled = True
              ReadOnly = True
              ExplicitLeft = 129
              ExplicitTop = 223
            end
            inherited editVectacWeaponCarrierName: TEdit
              Left = 129
              Top = 188
              Width = 163
              Enabled = True
              ReadOnly = True
              ExplicitLeft = 129
              ExplicitTop = 188
              ExplicitWidth = 163
            end
            inherited editVectacWeaponName: TEdit
              Left = 129
              Top = 379
              Width = 165
              Enabled = True
              ReadOnly = True
              Text = ''
              ExplicitLeft = 129
              ExplicitTop = 379
              ExplicitWidth = 165
            end
          end
        end
        inherited grbAirDroppedTorpedo: TGroupBox [15]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited ScrollBox8: TScrollBox
            Width = 343
            Height = 530
            ExplicitWidth = 343
            ExplicitHeight = 530
            inherited btnADBilndHide: TSpeedButton
              Left = 188
              Top = 442
              Height = 35
              Font.Height = -13
              ExplicitLeft = 188
              ExplicitTop = 442
              ExplicitHeight = 35
            end
            inherited btnADBilndShow: TSpeedButton
              Left = 188
              Top = 406
              Height = 35
              Font.Height = -13
              ExplicitLeft = 188
              ExplicitTop = 406
              ExplicitHeight = 35
            end
            inherited btnADRangeHide: TSpeedButton
              Left = 74
              Top = 442
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 442
              ExplicitHeight = 35
            end
            inherited btnADRangeShow: TSpeedButton
              Left = 74
              Top = 406
              Height = 35
              Font.Height = -13
              ExplicitLeft = 74
              ExplicitTop = 406
              ExplicitHeight = 35
            end
            inherited btnADTargetTrack: TSpeedButton
              Left = 199
              Top = 69
              Width = 25
              Height = 25
              Glyph.Data = {
                D20A0000424DD20A00000000000042000000280000001A0000001A0000000100
                200003000000900A0000130B0000130B000000000000000000000000FF0000FF
                0000FF000000E6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF817F7FFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF817F7FFFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A
                9AFF908D8DFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9B
                9BFF9E9B9BFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FF9E9B9BFF908C
                8CFF908C8CFF908C8CFF908C8CFF908C8CFF908C8CFF565454FF565454FF908C
                8CFF908C8CFF908C8CFF908C8CFF908C8CFF908C8CFF9F9B9BFFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FF9E9A9AFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF5654
                54FF565454FF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF8F8C8CFF9E9A
                9AFFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C
                8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF7370
                70FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF908C8CFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF9E9A9AFF9E9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF737070FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF8F8C8CFF9F9B9BFFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFACA9A9FFACA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FF817E7EFFADA9A9FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FF9E9B9BFF817E7EFFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFACA8A8FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF737070FF737070FF737070FF7370
                70FF737070FF737070FF737070FF737070FF908D8DFFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1
                E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FFE6E1E1FF}
              ExplicitLeft = 199
              ExplicitTop = 69
              ExplicitWidth = 25
              ExplicitHeight = 25
            end
            inherited bvl10: TBevel
              Left = 54
              Top = 377
              Width = 270
              Height = 5
              ExplicitLeft = 54
              ExplicitTop = 377
              ExplicitWidth = 270
              ExplicitHeight = 5
            end
            inherited bvl11: TBevel
              Left = 50
              Top = 15
              Width = 271
              Height = 5
              ExplicitLeft = 50
              ExplicitTop = 15
              ExplicitWidth = 271
              ExplicitHeight = 5
            end
            inherited bvl12: TBevel
              Top = 56
              Width = 267
              Height = 5
              ExplicitTop = 56
              ExplicitWidth = 267
              ExplicitHeight = 5
            end
            inherited bvl13: TBevel
              Left = 101
              Top = 299
              Width = 223
              Height = 5
              ExplicitLeft = 101
              ExplicitTop = 299
              ExplicitWidth = 223
              ExplicitHeight = 5
            end
            inherited bvl9: TBevel
              Left = 56
              Top = 183
              Width = 268
              Height = 5
              ExplicitLeft = 56
              ExplicitTop = 183
              ExplicitWidth = 268
              ExplicitHeight = 5
            end
            inherited lbl38: TLabel
              Left = 9
              Top = 9
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 9
              ExplicitTop = 9
            end
            inherited lbl39: TLabel
              Left = 133
              Top = 28
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 133
              ExplicitTop = 28
            end
            inherited lbl40: TLabel
              Left = 9
              Top = 50
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 9
              ExplicitTop = 50
            end
            inherited lbl41: TLabel
              Left = 28
              Top = 73
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 73
            end
            inherited lbl42: TLabel
              Left = 8
              Top = 372
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 372
            end
            inherited lbl43: TLabel
              Left = 96
              Top = 388
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 96
              ExplicitTop = 388
            end
            inherited lbl44: TLabel
              Left = 196
              Top = 388
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 196
              ExplicitTop = 388
            end
            inherited lbl45: TLabel
              Left = 28
              Top = 101
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 101
            end
            inherited lbl46: TLabel
              Left = 8
              Top = 177
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 177
            end
            inherited lbl47: TLabel
              Left = 28
              Top = 200
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 200
            end
            inherited lbl48: TLabel
              Left = 28
              Top = 230
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 230
            end
            inherited lbl49: TLabel
              Left = 28
              Top = 261
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 261
            end
            inherited lbl50: TLabel
              Left = 199
              Top = 200
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 200
            end
            inherited lbl51: TLabel
              Left = 199
              Top = 230
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 230
            end
            inherited lbl52: TLabel
              Left = 199
              Top = 261
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 261
            end
            inherited lbl53: TLabel
              Left = 28
              Top = 119
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 119
            end
            inherited lbl54: TLabel
              Left = 28
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 137
            end
            inherited lbl55: TLabel
              Left = 28
              Top = 155
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 155
            end
            inherited lbl56: TLabel
              Left = 199
              Top = 119
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 119
            end
            inherited lbl57: TLabel
              Left = 199
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 137
            end
            inherited lbl58: TLabel
              Left = 199
              Top = 155
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 155
            end
            inherited lbl59: TLabel
              Left = 8
              Top = 292
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 8
              ExplicitTop = 292
            end
            inherited lbl60: TLabel
              Left = 28
              Top = 341
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 341
            end
            inherited lbl61: TLabel
              Left = 199
              Top = 341
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 341
            end
            inherited lbl85: TLabel
              Left = 244
              Top = 83
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 244
              ExplicitTop = 83
            end
            inherited lblADQuantity: TLabel
              Left = 199
              Top = 28
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 199
              ExplicitTop = 28
            end
            inherited lblADTargetCourse: TLabel
              Left = 133
              Top = 119
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 133
              ExplicitTop = 119
            end
            inherited lblADTargetDepth: TLabel
              Left = 133
              Top = 155
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 133
              ExplicitTop = 155
            end
            inherited lblADTargetForce: TLabel
              Left = 133
              Top = 101
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 133
              ExplicitTop = 101
            end
            inherited lblADTargetSpeed: TLabel
              Left = 133
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 133
              ExplicitTop = 137
            end
            inherited lblAirDroppedStatus: TLabel
              Top = 28
              Font.Color = clBlack
              ParentFont = False
              ExplicitTop = 28
            end
            inherited Label49: TLabel
              Left = 114
              Top = 261
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 261
            end
            inherited Label50: TLabel
              Left = 114
              Top = 230
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 230
            end
            inherited Label51: TLabel
              Left = 114
              Top = 200
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 200
            end
            inherited Label52: TLabel
              Left = 114
              Top = 155
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 114
              ExplicitTop = 155
            end
            inherited Label56: TLabel
              Left = 115
              Top = 73
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 115
              ExplicitTop = 73
            end
            inherited Label57: TLabel
              Left = 115
              Top = 119
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 115
              ExplicitTop = 119
            end
            inherited Label58: TLabel
              Left = 115
              Top = 137
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 115
              ExplicitTop = 137
            end
            inherited Label62: TLabel
              Left = 115
              Top = 101
              ExplicitLeft = 115
              ExplicitTop = 101
            end
            inherited Label65: TLabel
              Left = 114
              Top = 341
              ExplicitLeft = 114
              ExplicitTop = 341
            end
            inherited btnADDefaultSafetyCeiling: TButton
              Left = 245
              Top = 258
              ExplicitLeft = 245
              ExplicitTop = 258
            end
            inherited btnADDefaultSearchDepth: TButton
              Left = 245
              Top = 227
              ExplicitLeft = 245
              ExplicitTop = 227
            end
            inherited btnADLaunch: TButton
              Left = 242
              Top = 480
              Height = 35
              Font.Height = -13
              ExplicitLeft = 242
              ExplicitTop = 480
              ExplicitHeight = 35
            end
            inherited chkADLaunchWhithoutTarget: TCheckBox
              Left = 229
              Top = 68
              Color = clWhite
              ParentColor = False
              ExplicitLeft = 229
              ExplicitTop = 68
            end
            inherited chkADUseLaunchPlatformHeading: TCheckBox
              Left = 28
              Top = 314
              Width = 187
              Font.Color = clBlack
              ParentFont = False
              ExplicitLeft = 28
              ExplicitTop = 314
              ExplicitWidth = 187
            end
            inherited EdtADTargetTrack: TEdit
              Left = 133
              Top = 68
              Height = 27
              Font.Height = -16
              Text = '---'
              ExplicitLeft = 133
              ExplicitTop = 68
              ExplicitHeight = 27
            end
            inherited EdtADLaunchBearing: TEdit
              Left = 133
              Top = 337
              Height = 24
              Font.Height = -13
              ExplicitLeft = 133
              ExplicitTop = 337
              ExplicitHeight = 24
            end
            inherited EdtADSafetyCeiling: TEdit
              Left = 133
              Top = 256
              Height = 27
              Font.Height = -16
              ExplicitLeft = 133
              ExplicitTop = 256
              ExplicitHeight = 27
            end
            inherited EdtADSearchDepth: TEdit
              Left = 133
              Top = 225
              Height = 27
              Font.Height = -16
              ExplicitLeft = 133
              ExplicitTop = 225
              ExplicitHeight = 27
            end
            inherited EdtADSearchRadius: TEdit
              Left = 133
              Top = 194
              Height = 27
              Font.Height = -16
              ExplicitLeft = 133
              ExplicitTop = 194
              ExplicitHeight = 27
            end
          end
        end
        inherited grbBombDepthCharge: TGroupBox [16]
          Width = 347
          Height = 550
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          ExplicitWidth = 347
          ExplicitHeight = 550
          inherited bvl17: TBevel
            Left = 57
            Top = 117
            Width = 269
            Height = 5
            ExplicitLeft = 57
            ExplicitTop = 117
            ExplicitWidth = 269
            ExplicitHeight = 5
          end
          inherited bvl18: TBevel
            Top = 56
            Width = 271
            Height = 5
            ExplicitTop = 56
            ExplicitWidth = 271
            ExplicitHeight = 5
          end
          inherited bvl19: TBevel
            Left = 57
            Top = 202
            Width = 269
            Height = 5
            ExplicitLeft = 57
            ExplicitTop = 202
            ExplicitWidth = 269
            ExplicitHeight = 5
          end
          inherited bvl20: TBevel
            Left = 53
            Top = 15
            Width = 273
            Height = 5
            ExplicitLeft = 53
            ExplicitTop = 15
            ExplicitWidth = 273
            ExplicitHeight = 5
          end
          inherited btnBombTarget: TSpeedButton
            Left = 181
            Top = 63
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
            ExplicitLeft = 181
            ExplicitTop = 63
            ExplicitWidth = 40
            ExplicitHeight = 40
          end
          inherited lbl76: TLabel
            Left = 8
            Top = 111
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 111
          end
          inherited lbl77: TLabel
            Left = 24
            Top = 135
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 24
            ExplicitTop = 135
          end
          inherited lbl78: TLabel
            Left = 8
            Top = 50
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 50
          end
          inherited lbl79: TLabel
            Left = 8
            Top = 196
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 196
          end
          inherited lbl80: TLabel
            Left = 92
            Top = 214
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 92
            ExplicitTop = 214
          end
          inherited lbl81: TLabel
            Left = 24
            Top = 75
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 24
            ExplicitTop = 75
          end
          inherited lbl82: TLabel
            Left = 8
            Top = 9
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 8
            ExplicitTop = 9
          end
          inherited lbl83: TLabel
            Left = 118
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 118
            ExplicitTop = 28
          end
          inherited lblBombQuantity: TLabel
            Left = 178
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 178
            ExplicitTop = 28
          end
          inherited lblBombStatus: TLabel
            Top = 28
            Font.Color = clBlack
            ParentFont = False
            ExplicitTop = 28
          end
          inherited btnBombDisplayRangeHide: TSpeedButton
            Left = 72
            Top = 273
            Width = 77
            Height = 35
            ExplicitLeft = 72
            ExplicitTop = 273
            ExplicitWidth = 77
            ExplicitHeight = 35
          end
          inherited btnBombDisplayRangeShow: TSpeedButton
            Left = 72
            Top = 237
            Width = 77
            Height = 35
            ExplicitLeft = 72
            ExplicitTop = 237
            ExplicitWidth = 77
            ExplicitHeight = 35
          end
          inherited lbl86: TLabel
            Left = 246
            Top = 85
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 246
            ExplicitTop = 85
          end
          inherited btnPosition: TSpeedButton
            Top = 161
            ExplicitTop = 161
          end
          inherited lbl103: TLabel
            Left = 24
            Top = 165
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 24
            ExplicitTop = 165
          end
          inherited btnBombDrop: TButton
            Left = 251
            Top = 311
            Width = 75
            Height = 35
            ExplicitLeft = 251
            ExplicitTop = 311
            ExplicitWidth = 75
            ExplicitHeight = 35
          end
          inherited EdtBombControlSalvo: TEdit
            Left = 117
            Top = 131
            Width = 60
            ExplicitLeft = 117
            ExplicitTop = 131
            ExplicitWidth = 60
          end
          inherited EdtBombTargetTrack: TEdit
            Left = 117
            Top = 71
            Width = 60
            ExplicitLeft = 117
            ExplicitTop = 71
            ExplicitWidth = 60
          end
          inherited chkBombDropWhitoutTarget: TCheckBox
            Left = 229
            Top = 71
            Font.Color = clBlack
            ParentFont = False
            ExplicitLeft = 229
            ExplicitTop = 71
          end
          inherited edtTargetPosition: TEdit
            Left = 116
            Top = 161
            ExplicitLeft = 116
            ExplicitTop = 161
          end
        end
      end
    end
    inherited pmenuWeapon: TPopupMenu
      Left = 234
      Top = 65529
    end
    inherited pmenuFiring: TPopupMenu
      Left = 156
      Top = 65527
    end
    inherited pmenuEngagement: TPopupMenu
      Left = 204
      Top = 65528
      inherited STOT1: TMenuItem
        OnClick = nil
      end
    end
    inherited TimerLaunch: TTimer
      Left = 128
      Top = 520
    end
    inherited TimerRipple: TTimer
      Left = 96
      Top = 520
    end
    inherited tmrSTOT: TTimer
      OnTimer = nil
      Left = 64
      Top = 520
    end
    inherited tmrLaunchSTOT: TTimer
      Left = 32
      Top = 520
    end
    inherited pmenuWpnCarrier: TPopupMenu
      Left = 176
      Top = 65528
    end
    inherited pmenuWpn: TPopupMenu
      Left = 248
      Top = 32
    end
    inherited pmTorpedoFiring: TPopupMenu
      Left = 168
      Top = 520
    end
    inherited pmTorpedoRunOut: TPopupMenu
      Left = 200
      Top = 520
    end
    inherited pmTorpedoGyroAngle: TPopupMenu
      Left = 232
      Top = 520
    end
    inherited TmrAPG: TTimer
      Left = 312
      Top = 480
    end
  end
end
