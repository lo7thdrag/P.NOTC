object frmAudioTrackSetting: TfrmAudioTrackSetting
  Left = 0
  Top = 0
  Caption = 'frmAudioTrackSetting'
  ClientHeight = 438
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label4: TLabel
    Left = 32
    Top = 32
    Width = 241
    Height = 28
    Caption = 'Select the audio tracks to be replayed'
    WordWrap = True
  end
  object ListBox1: TListBox
    Left = 32
    Top = 72
    Width = 425
    Height = 305
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 14
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 301
    Top = 393
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = '&OK'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 382
    Top = 393
    Width = 75
    Height = 25
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    TabOrder = 2
  end
end
