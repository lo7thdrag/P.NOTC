object fVehicleName: TfVehicleName
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'VehicleName'
  ClientHeight = 120
  ClientWidth = 252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 70
    Height = 13
    Caption = 'Vehicle'#39's Name'
  end
  object lbl2: TLabel
    Left = 8
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Track ID'
  end
  object edtVehicleName: TEdit
    Left = 112
    Top = 13
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtTrackId: TEdit
    Left = 112
    Top = 45
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 86
    Top = 82
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 167
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
