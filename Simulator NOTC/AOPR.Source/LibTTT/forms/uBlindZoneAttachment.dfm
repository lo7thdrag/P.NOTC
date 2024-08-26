object BlindZonesAttachmentForm: TBlindZonesAttachmentForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Blind Zones'
  ClientHeight = 330
  ClientWidth = 590
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
    Width = 590
    Height = 289
    Align = alClient
    TabOrder = 0
    object imgForwardFirst: TImage
      Left = 495
      Top = 28
      Width = 73
      Height = 73
    end
    object imgForwardSecond: TImage
      Left = 495
      Top = 167
      Width = 73
      Height = 73
    end
    object grbFirstBlindZone: TGroupBox
      Left = 8
      Top = 8
      Width = 481
      Height = 121
      TabOrder = 0
      object lblCentreFirst: TStaticText
        Left = 16
        Top = 32
        Width = 44
        Height = 17
        Caption = 'Centre :'
        TabOrder = 0
      end
      object TrackCentreFirst: TTrackBar
        Left = 81
        Top = 32
        Width = 336
        Height = 45
        Max = 6
        TabOrder = 1
      end
      object edtCentreFirst: TEdit
        Left = 415
        Top = 32
        Width = 50
        Height = 21
        TabOrder = 2
      end
      object lblWidthFirst: TStaticText
        Left = 16
        Top = 72
        Width = 39
        Height = 17
        Caption = 'Width :'
        TabOrder = 3
      end
      object TrackWidthFirst: TTrackBar
        Left = 81
        Top = 72
        Width = 336
        Height = 45
        Max = 6
        TabOrder = 4
      end
      object edtWidthFirst: TEdit
        Left = 415
        Top = 72
        Width = 50
        Height = 21
        TabOrder = 5
      end
    end
    object grbSecondBlindZone: TGroupBox
      Left = 8
      Top = 151
      Width = 481
      Height = 122
      TabOrder = 1
      object lblCentreSecond: TStaticText
        Left = 16
        Top = 32
        Width = 44
        Height = 17
        Caption = 'Centre :'
        TabOrder = 0
      end
      object TrackCentreSecond: TTrackBar
        Left = 81
        Top = 32
        Width = 336
        Height = 45
        Max = 6
        TabOrder = 1
      end
      object edtCentreSecond: TEdit
        Left = 415
        Top = 32
        Width = 50
        Height = 21
        TabOrder = 2
      end
      object lblWidthSecond: TStaticText
        Left = 16
        Top = 72
        Width = 39
        Height = 17
        Caption = 'Width :'
        TabOrder = 3
      end
      object TrackWidthSecond: TTrackBar
        Left = 81
        Top = 60
        Width = 336
        Height = 45
        Max = 6
        TabOrder = 4
      end
      object edtWidthSecond: TEdit
        Left = 415
        Top = 72
        Width = 50
        Height = 21
        TabOrder = 5
      end
    end
    object lblForwardFirst: TStaticText
      Left = 502
      Top = 5
      Width = 44
      Height = 17
      Caption = 'Forward'
      TabOrder = 2
    end
    object lblForwardSecond: TStaticText
      Left = 502
      Top = 144
      Width = 44
      Height = 17
      Caption = 'Forward'
      TabOrder = 3
    end
    object cbFirstBlindZone: TCheckBox
      Left = 24
      Top = 2
      Width = 97
      Height = 17
      Caption = 'First Blind Zone'
      TabOrder = 4
    end
    object cbSecondBlindZone: TCheckBox
      Left = 24
      Top = 144
      Width = 105
      Height = 17
      Caption = 'Second Blind Zone'
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 289
    Width = 590
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 502
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 421
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 340
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
end
