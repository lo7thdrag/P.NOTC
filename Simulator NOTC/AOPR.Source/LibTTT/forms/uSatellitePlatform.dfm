object SatellitePlatformForm: TSatellitePlatformForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Satellite'
  ClientHeight = 311
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 500
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblClass: TStaticText
      Left = 16
      Top = 8
      Width = 36
      Height = 17
      Caption = 'Class :'
      TabOrder = 0
    end
    object edtClass: TEdit
      Left = 16
      Top = 23
      Width = 473
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 270
    Width = 500
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 414
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 500
    Height = 221
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 1
      Width = 473
      Height = 216
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object grbRecognition: TGroupBox
          Left = 3
          Top = 19
          Width = 446
          Height = 54
          Caption = 'Recognition Capabilties'
          TabOrder = 0
          object cbPlatformType: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Platform Type'
            TabOrder = 0
          end
          object cbPlatformClass: TCheckBox
            Left = 264
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Platform Class'
            TabOrder = 1
          end
        end
        object lblDetectionRangeRadius: TStaticText
          Left = 19
          Top = 88
          Width = 126
          Height = 17
          Caption = 'Detection Range Radius :'
          TabOrder = 1
        end
        object edtDetectionRangeRadius: TEdit
          Left = 19
          Top = 104
          Width = 70
          Height = 21
          TabOrder = 2
        end
        object lblnmDetectionRange: TStaticText
          Left = 95
          Top = 106
          Width = 18
          Height = 17
          Caption = 'nm'
          TabOrder = 3
        end
        object lblAltitude: TStaticText
          Left = 19
          Top = 136
          Width = 48
          Height = 17
          Caption = 'Altitude :'
          TabOrder = 4
        end
        object edtAltitude: TEdit
          Left = 19
          Top = 152
          Width = 70
          Height = 21
          TabOrder = 5
        end
        object lblFeetAltitude: TStaticText
          Left = 95
          Top = 154
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 6
        end
        object lblGameArea: TStaticText
          Left = 267
          Top = 88
          Width = 143
          Height = 17
          Caption = 'Game Area Re-entry Period :'
          TabOrder = 7
        end
        object edtGameArea: TEdit
          Left = 267
          Top = 104
          Width = 70
          Height = 21
          TabOrder = 8
        end
        object lblHoursGameArea: TStaticText
          Left = 343
          Top = 106
          Width = 50
          Height = 17
          Caption = 'hh:mm:ss'
          TabOrder = 9
        end
        object lblGroundSpeed: TStaticText
          Left = 267
          Top = 136
          Width = 79
          Height = 17
          Caption = 'Ground Speed :'
          TabOrder = 10
        end
        object edtGroundSpeed: TEdit
          Left = 267
          Top = 152
          Width = 70
          Height = 21
          TabOrder = 11
        end
        object lblKnotsGroundSpeed: TStaticText
          Left = 343
          Top = 154
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 12
        end
      end
      object Physical: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
        object grbDimensions: TGroupBox
          Left = 3
          Top = 16
          Width = 214
          Height = 105
          Caption = 'Dimensions'
          TabOrder = 0
          object lblLength: TStaticText
            Left = 11
            Top = 24
            Width = 44
            Height = 17
            Caption = 'Length :'
            TabOrder = 0
          end
          object edtLength: TEdit
            Left = 88
            Top = 22
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object lblFeetLength: TStaticText
            Left = 155
            Top = 24
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 2
          end
          object lblWidth: TStaticText
            Left = 11
            Top = 47
            Width = 39
            Height = 17
            Caption = 'Width :'
            TabOrder = 3
          end
          object edtWidth: TEdit
            Left = 88
            Top = 45
            Width = 49
            Height = 21
            TabOrder = 4
          end
          object lblFeetWidth: TStaticText
            Left = 155
            Top = 47
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 5
          end
          object lblHeight: TStaticText
            Left = 11
            Top = 70
            Width = 42
            Height = 17
            Caption = 'Height :'
            TabOrder = 6
          end
          object edtHeight: TEdit
            Left = 88
            Top = 68
            Width = 49
            Height = 21
            TabOrder = 7
          end
          object lblFeetHeight: TStaticText
            Left = 155
            Top = 70
            Width = 24
            Height = 17
            Caption = 'feet'
            TabOrder = 8
          end
        end
        object grbRadarCrossSection: TGroupBox
          Left = 240
          Top = 16
          Width = 209
          Height = 105
          Caption = 'Radar Cross-Section'
          TabOrder = 1
          object lblFront: TStaticText
            Left = 11
            Top = 24
            Width = 37
            Height = 17
            Caption = 'Front :'
            TabOrder = 0
          end
          object edtFront: TEdit
            Left = 88
            Top = 22
            Width = 49
            Height = 21
            TabOrder = 1
          end
          object lblSide: TStaticText
            Left = 11
            Top = 47
            Width = 31
            Height = 17
            Caption = 'Side :'
            TabOrder = 2
          end
          object edtSide: TEdit
            Left = 88
            Top = 45
            Width = 49
            Height = 21
            TabOrder = 3
          end
          object cbxDbm2Front: TComboBox
            Left = 143
            Top = 22
            Width = 56
            Height = 21
            TabOrder = 4
          end
          object cbxDbm2Side: TComboBox
            Left = 143
            Top = 45
            Width = 56
            Height = 21
            TabOrder = 5
          end
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 2
        object mmNotes: TMemo
          Left = 0
          Top = 0
          Width = 462
          Height = 185
          Lines.Strings = (
            ''
            '')
          TabOrder = 0
        end
      end
    end
  end
end
