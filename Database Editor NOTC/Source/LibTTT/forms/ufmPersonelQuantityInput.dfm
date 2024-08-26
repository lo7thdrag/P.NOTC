object fmPersonelQuantityInput: TfmPersonelQuantityInput
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 70
  ClientWidth = 123
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
  object Label23: TLabel
    Left = 12
    Top = 12
    Width = 49
    Height = 13
    Caption = 'Quantity :'
  end
  object edtQuantity: TEdit
    Left = 67
    Top = 8
    Width = 46
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '0'
  end
  object btnOK: TButton
    Left = 8
    Top = 35
    Width = 105
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOKClick
  end
end
