object ElevationSettingForm: TElevationSettingForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Elevation'
  ClientHeight = 116
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblFeet: TLabel
    Left = 87
    Top = 19
    Width = 20
    Height = 13
    Caption = 'feet'
  end
  object edtElevation: TEdit
    Left = 8
    Top = 16
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 160
    Top = 14
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 160
    Top = 45
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
  end
  object btnApply: TButton
    Left = 160
    Top = 76
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
  end
end
