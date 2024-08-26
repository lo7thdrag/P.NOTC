object EnvironmentForm: TEnvironmentForm
  Left = 0
  Top = 0
  Caption = 'Game Environment'
  ClientHeight = 271
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 230
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 16
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 16
      Top = 32
      Width = 393
      Height = 21
      TabOrder = 1
      Text = '(Unnamed)'
    end
    object PageControl1: TPageControl
      Left = 16
      Top = 59
      Width = 393
      Height = 148
      ActivePage = General
      TabOrder = 2
      object General: TTabSheet
        Caption = 'General'
        object btnBrowse: TSpeedButton
          Left = 359
          Top = 30
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = btnBrowseClick
        end
        object lblArea: TStaticText
          Left = 3
          Top = 17
          Width = 34
          Height = 17
          Caption = 'Area :'
          TabOrder = 0
        end
        object edtArea: TEdit
          Left = 3
          Top = 30
          Width = 350
          Height = 21
          TabOrder = 1
          Text = '(None)'
          OnChange = edtAreaChange
        end
        object btnEditCharacteristics: TButton
          Left = 3
          Top = 80
          Width = 150
          Height = 25
          Caption = 'Edit Characteristics...'
          TabOrder = 2
          OnClick = btnEditCharacteristicsClick
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 230
    Width = 422
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 337
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
      Left = 175
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
end
