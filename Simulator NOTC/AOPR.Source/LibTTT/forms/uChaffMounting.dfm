object ChaffMountingForm: TChaffMountingForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'TestChaff'
  ClientHeight = 248
  ClientWidth = 384
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
    Width = 384
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 382
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object cbxName: TComboBox
      Left = 16
      Top = 22
      Width = 353
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 207
    Width = 384
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 193
    ExplicitWidth = 382
    object btnApply: TButton
      Left = 294
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 213
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 132
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 384
    Height = 158
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 382
    ExplicitHeight = 144
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 353
      Height = 143
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblQuantity: TStaticText
          Left = 88
          Top = 19
          Width = 53
          Height = 17
          Caption = 'Quantity :'
          TabOrder = 0
        end
        object edtAntenna: TEdit
          Left = 164
          Top = 17
          Width = 49
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
end