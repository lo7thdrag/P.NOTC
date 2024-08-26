object fInputName: TfInputName
  Left = 0
  Top = 0
  ClientHeight = 115
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Name'
    Visible = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Track ID'
    Visible = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 33
    Width = 42
    Height = 13
    Caption = 'Quantity'
    Visible = False
  end
  object edtTrackId: TEdit
    Left = 97
    Top = 45
    Width = 136
    Height = 21
    MaxLength = 7
    TabOrder = 0
    Visible = False
  end
  object btnOk: TButton
    Left = 86
    Top = 82
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 167
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object cbbName: TComboBox
    Left = 97
    Top = 18
    Width = 145
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object edtQuantity: TEdit
    Left = 97
    Top = 30
    Width = 136
    Height = 21
    MaxLength = 7
    TabOrder = 4
    Visible = False
  end
end
