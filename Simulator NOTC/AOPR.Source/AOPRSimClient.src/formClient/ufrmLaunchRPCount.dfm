object frmlaunchCountRP: TfrmlaunchCountRP
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Launch RP'
  ClientHeight = 184
  ClientWidth = 290
  Color = 16775920
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 24
    Top = 53
    Width = 55
    Height = 13
    Caption = 'Row          :'
  end
  object lbl2: TLabel
    Left = 24
    Top = 85
    Width = 54
    Height = 13
    Caption = 'Column     :'
  end
  object lblPos: TLabel
    Left = 24
    Top = 24
    Width = 56
    Height = 13
    Caption = 'Position     :'
  end
  object btnPos: TSpeedButton
    Left = 259
    Top = 21
    Width = 23
    Height = 21
    Caption = '+'
    OnClick = btnPosClick
  end
  object lblHeading: TLabel
    Left = 24
    Top = 117
    Width = 55
    Height = 13
    Caption = 'Heading    :'
  end
  object btn1: TButton
    Left = 85
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Launch'
    TabOrder = 0
    OnClick = btn1Click
  end
  object edtRow: TEdit
    Left = 85
    Top = 50
    Width = 163
    Height = 21
    TabOrder = 1
    Text = '1'
  end
  object edtColoumn: TEdit
    Left = 85
    Top = 82
    Width = 163
    Height = 21
    TabOrder = 2
    Text = '1'
  end
  object edtPos: TEdit
    Left = 85
    Top = 21
    Width = 163
    Height = 21
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 173
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object edtHeading: TEdit
    Left = 88
    Top = 114
    Width = 160
    Height = 21
    TabOrder = 5
    Text = '0'
  end
end
