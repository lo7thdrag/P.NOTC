object OverlayTextEntryForm: TOverlayTextEntryForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Overlay Text'
  ClientHeight = 89
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
    Height = 89
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 176
    ExplicitTop = 72
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lblEnterText: TStaticText
      Left = 8
      Top = 8
      Width = 62
      Height = 17
      Caption = 'Enter Text :'
      TabOrder = 0
    end
    object edtText: TEdit
      Left = 8
      Top = 24
      Width = 398
      Height = 21
      TabOrder = 1
    end
    object btnCancel: TButton
      Left = 331
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
    end
    object btnOK: TButton
      Left = 248
      Top = 54
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 3
    end
  end
end
