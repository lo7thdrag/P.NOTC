object frmHandle: TfrmHandle
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Platform Handle'
  ClientHeight = 152
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pName: TLabel
    Left = 8
    Top = 8
    Width = 40
    Height = 13
    Caption = 'Platform'
  end
  object Label1: TLabel
    Left = 8
    Top = 92
    Width = 54
    Height = 13
    Caption = 'Start Angle'
  end
  object Label2: TLabel
    Left = 8
    Top = 116
    Width = 48
    Height = 13
    Caption = 'End Angle'
  end
  object pRadar: TLabel
    Left = 8
    Top = 67
    Width = 40
    Height = 13
    Caption = 'Platform'
  end
  object Button1: TButton
    Left = 8
    Top = 31
    Width = 58
    Height = 25
    Caption = 'Turn Left'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 135
    Top = 31
    Width = 62
    Height = 25
    Caption = 'Turn Right'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 72
    Top = 33
    Width = 57
    Height = 21
    Alignment = taCenter
    TabOrder = 2
    Text = '0'
  end
  object pSAngle: TEdit
    Left = 74
    Top = 89
    Width = 55
    Height = 21
    Alignment = taCenter
    TabOrder = 3
    Text = '0'
  end
  object pEAngle: TEdit
    Left = 74
    Top = 113
    Width = 55
    Height = 21
    Alignment = taCenter
    TabOrder = 4
    Text = '0'
  end
  object Button3: TButton
    Left = 135
    Top = 89
    Width = 62
    Height = 45
    Caption = 'Blind Zone'
    TabOrder = 5
    OnClick = Button3Click
  end
end
