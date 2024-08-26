object TorpedoMountsForm: TTorpedoMountsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Torpedo Mounts'
  ClientHeight = 338
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 16
      Top = 24
      Width = 392
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 297
    Width = 423
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 423
    Height = 248
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 392
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object imgBlindZones: TImage
          Left = 3
          Top = 123
          Width = 70
          Height = 70
        end
        object lblClassName: TStaticText
          Left = 3
          Top = 3
          Width = 66
          Height = 17
          Caption = 'Class Name :'
          TabOrder = 0
        end
        object edtClassName: TEdit
          Left = 3
          Top = 16
          Width = 366
          Height = 21
          TabOrder = 1
        end
        object lblMountExtension: TStaticText
          Left = 3
          Top = 51
          Width = 91
          Height = 17
          Caption = 'Mount Extension :'
          TabOrder = 2
        end
        object cbMountExtension: TComboBox
          Left = 3
          Top = 64
          Width = 366
          Height = 21
          TabOrder = 3
          Items.Strings = (
            'Mount 1'
            'Mount 2'
            'Mount 3'
            'Mount 4'
            'Mount 5'
            'Mount 6'
            'Mount 7'
            'Mount 8'
            'Forward Mount'
            'Aft Mount'
            'Port Mount'
            'Starboard Mount')
        end
        object lblBlindZones: TStaticText
          Left = 3
          Top = 104
          Width = 65
          Height = 17
          Caption = 'Blind Zones :'
          TabOrder = 4
        end
        object lblQuantity: TStaticText
          Left = 104
          Top = 123
          Width = 53
          Height = 17
          Caption = 'Quantity :'
          TabOrder = 5
        end
        object edtQuantity: TEdit
          Left = 222
          Top = 123
          Width = 68
          Height = 21
          TabOrder = 6
        end
        object lblReload: TStaticText
          Left = 104
          Top = 146
          Width = 112
          Height = 17
          Caption = 'Reload/Launch Delay :'
          TabOrder = 7
        end
        object edtReload: TEdit
          Left = 222
          Top = 146
          Width = 68
          Height = 21
          TabOrder = 8
        end
        object lblHourReload: TStaticText
          Left = 296
          Top = 148
          Width = 50
          Height = 17
          Caption = 'hh:mm:ss'
          TabOrder = 9
        end
        object btnEditLaunchers: TButton
          Left = 222
          Top = 177
          Width = 147
          Height = 25
          Caption = 'Edit Launchers...'
          TabOrder = 10
          OnClick = btnEditLaunchersClick
        end
      end
    end
  end
end
