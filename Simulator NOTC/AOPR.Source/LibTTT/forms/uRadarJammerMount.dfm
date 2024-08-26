object RadarJammerMountForm: TRadarJammerMountForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'TestRadarJammer'
  ClientHeight = 234
  ClientWidth = 382
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
    Width = 382
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
      Width = 353
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 193
    Width = 382
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 294
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 213
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 132
      Top = 7
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
    Width = 382
    Height = 144
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 353
      Height = 143
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblAntenna: TStaticText
          Left = 88
          Top = 19
          Width = 86
          Height = 17
          Caption = 'Antenna Height :'
          TabOrder = 0
        end
        object edtAntenna: TEdit
          Left = 88
          Top = 33
          Width = 68
          Height = 21
          TabOrder = 1
        end
        object lblFeetAntenna: TStaticText
          Left = 162
          Top = 35
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 2
        end
      end
    end
  end
end
