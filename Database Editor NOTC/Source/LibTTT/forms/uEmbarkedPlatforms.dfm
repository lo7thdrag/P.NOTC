object EmbarkedPlatformsForm: TEmbarkedPlatformsForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Embarked Platforms'
  ClientHeight = 150
  ClientWidth = 415
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
    Width = 415
    Height = 109
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lblClass: TStaticText
      Left = 16
      Top = 16
      Width = 36
      Height = 17
      Caption = 'Class :'
      TabOrder = 0
    end
    object edtClass: TEdit
      Left = 16
      Top = 31
      Width = 392
      Height = 21
      TabOrder = 1
    end
    object lblQuantity: TStaticText
      Left = 16
      Top = 72
      Width = 53
      Height = 17
      Caption = 'Quantity :'
      TabOrder = 2
    end
    object edtQuantity: TEdit
      Left = 88
      Top = 70
      Width = 41
      Height = 21
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 109
    Width = 415
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 88
    ExplicitTop = 160
    ExplicitWidth = 185
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
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
end
