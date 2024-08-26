object ScreenCaptureWindowForm: TScreenCaptureWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 436
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 16
    Top = 16
    Width = 450
    Height = 371
  end
  object scrl1: TScrollBar
    Left = 16
    Top = 368
    Width = 433
    Height = 17
    PageSize = 0
    TabOrder = 0
  end
  object scrl2: TScrollBar
    Left = 449
    Top = 16
    Width = 17
    Height = 353
    Kind = sbVertical
    PageSize = 0
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 383
    Width = 483
    Height = 53
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 416
    object btnCapture: TButton
      Left = 16
      Top = 16
      Width = 108
      Height = 25
      Caption = 'Capture'
      TabOrder = 0
    end
    object btnPrint: TButton
      Left = 130
      Top = 16
      Width = 108
      Height = 25
      Caption = 'Print Captured Area'
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 244
      Top = 16
      Width = 108
      Height = 25
      Caption = 'Save As...'
      TabOrder = 2
    end
    object btnOK: TButton
      Left = 358
      Top = 16
      Width = 108
      Height = 25
      Caption = 'OK'
      TabOrder = 3
    end
  end
end
