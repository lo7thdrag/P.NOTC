object CommunicationsChannelsForm: TCommunicationsChannelsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = ' Channel'
  ClientHeight = 281
  ClientWidth = 428
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
  object pnl1: TPanel
    Left = 0
    Top = 240
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnApply: TButton
      Left = 342
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 256
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 167
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 240
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 8
      Top = 8
      Width = 409
      Height = 224
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lblName: TStaticText
          Left = 3
          Top = 3
          Width = 38
          Height = 17
          Caption = 'Name :'
          TabOrder = 0
        end
        object edtName: TEdit
          Left = 3
          Top = 16
          Width = 390
          Height = 21
          TabOrder = 1
        end
        object lblChannelNumber: TStaticText
          Left = 3
          Top = 56
          Width = 90
          Height = 17
          Caption = 'Channel Number :'
          TabOrder = 2
        end
        object lblCommunicationBand: TStaticText
          Left = 3
          Top = 83
          Width = 110
          Height = 17
          Caption = 'Communication Band :'
          TabOrder = 3
        end
        object lblChannelFrequency: TStaticText
          Left = 3
          Top = 110
          Width = 104
          Height = 17
          Caption = 'Channel Frequency :'
          TabOrder = 4
        end
        object lblChannelCode: TStaticText
          Left = 3
          Top = 137
          Width = 78
          Height = 17
          Caption = 'Channel Code :'
          TabOrder = 5
        end
        object cbSecureChannel: TCheckBox
          Left = 3
          Top = 168
          Width = 97
          Height = 17
          Caption = 'Secure Channel'
          TabOrder = 6
        end
        object edtChannelNumber: TEdit
          Left = 128
          Top = 52
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 7
        end
        object cbxCommunicationBand: TComboBox
          Left = 128
          Top = 79
          Width = 145
          Height = 21
          TabOrder = 8
          OnChange = cbxCommunicationBandChange
          Items.Strings = (
            'HF'
            'UHF/VHF'
            'FM'
            'SATCOM'
            'UWT')
        end
        object edtChannelFrequency: TEdit
          Left = 128
          Top = 106
          Width = 121
          Height = 21
          TabOrder = 9
        end
        object edtChannelCode: TEdit
          Left = 128
          Top = 133
          Width = 121
          Height = 21
          TabOrder = 10
        end
        object lblMhz: TStaticText
          Left = 260
          Top = 108
          Width = 24
          Height = 17
          Caption = 'MHz'
          TabOrder = 11
        end
      end
    end
  end
end
