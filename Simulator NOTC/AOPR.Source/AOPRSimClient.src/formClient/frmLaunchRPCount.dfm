object frmlaunchCountRP: TfrmlaunchCountRP
  Left = 0
  Top = 0
  Caption = 'Launch RP'
  ClientHeight = 129
  ClientWidth = 218
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 27
    Width = 43
    Height = 13
    Caption = 'Row      :'
  end
  object lbl2: TLabel
    Left = 24
    Top = 59
    Width = 42
    Height = 13
    Caption = 'Column :'
  end
  object btn1: TButton
    Left = 80
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Launch'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edtRow: TEdit
    Left = 80
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtColoumn: TEdit
    Left = 80
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
end
