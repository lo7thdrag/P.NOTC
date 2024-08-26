object ChaffMountForm: TChaffMountForm
  Left = 0
  Top = 0
  Caption = 'TestChaff'
  ClientHeight = 241
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 380
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 379
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
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 380
    Height = 151
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 379
    ExplicitHeight = 155
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
          Left = 29
          Top = 30
          Width = 53
          Height = 17
          Caption = 'Quantity :'
          TabOrder = 0
        end
        object edtQuantity: TEdit
          Left = 88
          Top = 28
          Width = 68
          Height = 21
          TabOrder = 1
        end
        object lblFeetAntenna: TStaticText
          Left = 162
          Top = 35
          Width = 4
          Height = 4
          TabOrder = 2
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 200
    Width = 380
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 204
    ExplicitWidth = 379
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
      Top = 6
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
end
