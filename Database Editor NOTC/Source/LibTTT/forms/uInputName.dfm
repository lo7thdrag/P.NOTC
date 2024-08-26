object fInputName: TfInputName
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 117
  ClientWidth = 354
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
    Left = 35
    Top = 17
    Width = 31
    Height = 13
    Caption = 'Name:'
    Visible = False
  end
  object lbl2: TLabel
    Left = 35
    Top = 48
    Width = 44
    Height = 13
    Caption = 'Track ID:'
    Visible = False
  end
  object lbl3: TLabel
    Left = 65
    Top = 33
    Width = 46
    Height = 13
    Caption = 'Quantity:'
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
    OnChange = edtTrackIdChange
  end
  object btnOk: TButton
    Left = 158
    Top = 82
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 246
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
    Width = 224
    Height = 22
    Style = csOwnerDrawFixed
    TabOrder = 3
    Visible = False
    OnChange = cbbNameChange
  end
  object edtQuantity: TEdit
    Left = 145
    Top = 30
    Width = 136
    Height = 21
    MaxLength = 7
    NumbersOnly = True
    TabOrder = 4
    Visible = False
  end
  object cbbInstanceIdentIndex: TComboBox
    Left = 0
    Top = 86
    Width = 145
    Height = 21
    TabOrder = 5
    Visible = False
  end
end
