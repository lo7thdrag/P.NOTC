object fPISelect: TfPISelect
  Left = 0
  Top = 0
  Caption = 'Platform Instance'
  ClientHeight = 90
  ClientWidth = 361
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
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 173
    Height = 13
    Caption = 'Choose the Platform Instance Name'
  end
  object cbbPI: TComboBox
    Left = 200
    Top = 13
    Width = 145
    Height = 21
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 200
    Top = 48
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 281
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object lbTempPI: TListBox
    Left = 8
    Top = 57
    Width = 121
    Height = 25
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
end
