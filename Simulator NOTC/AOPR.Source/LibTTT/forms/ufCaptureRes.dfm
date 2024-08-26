object fCaptureRes: TfCaptureRes
  Left = 0
  Top = 0
  Caption = 'Capture'
  ClientHeight = 488
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 335
    Height = 433
    Align = alClient
    TabOrder = 0
    object imgCaptureResult: TImage
      Left = 1
      Top = 1
      Width = 333
      Height = 431
      Align = alClient
      ExplicitLeft = 13
      ExplicitTop = 8
      ExplicitWidth = 473
      ExplicitHeight = 265
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 433
    Width = 335
    Height = 55
    Align = alBottom
    TabOrder = 1
    object btnCapture: TButton
      Left = 7
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Capture'
      ModalResult = 1
      TabOrder = 0
      OnClick = btnCaptureClick
    end
    object btnSave: TButton
      Left = 88
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Save..'
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnPrint: TButton
      Left = 169
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Print...'
      TabOrder = 2
      OnClick = btnPrintClick
    end
    object btOK: TButton
      Left = 250
      Top = 16
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 3
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 120
    Top = 168
  end
  object PrintDialog1: TPrintDialog
    Left = 208
    Top = 168
  end
end
