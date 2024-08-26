object SonarMountForm: TSonarMountForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sonar Mount'
  ClientHeight = 338
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
        object lblHullMounted: TStaticText
          Left = 104
          Top = 123
          Width = 137
          Height = 17
          Caption = 'Hull-Mounted Sonar Depth :'
          TabOrder = 5
        end
        object edtHullMounted: TEdit
          Left = 253
          Top = 121
          Width = 68
          Height = 21
          TabOrder = 6
        end
        object lblDeployTime: TStaticText
          Left = 104
          Top = 146
          Width = 69
          Height = 17
          Caption = 'Deploy Time :'
          TabOrder = 7
        end
        object edtDeployTime: TEdit
          Left = 253
          Top = 144
          Width = 68
          Height = 21
          TabOrder = 8
        end
        object lblStowTime: TStaticText
          Left = 104
          Top = 169
          Width = 60
          Height = 17
          Caption = 'Stow Time :'
          TabOrder = 9
        end
        object edtStowTime: TEdit
          Left = 253
          Top = 167
          Width = 68
          Height = 21
          TabOrder = 10
        end
        object lblFeetHullMounted: TStaticText
          Left = 327
          Top = 123
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 11
        end
        object lblFeetDeployTime: TStaticText
          Left = 327
          Top = 146
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 12
        end
        object lblFeetStowTime: TStaticText
          Left = 327
          Top = 169
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 13
        end
      end
    end
  end
end
