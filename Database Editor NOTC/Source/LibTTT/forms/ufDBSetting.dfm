object frmDBSetting: TfrmDBSetting
  Left = 518
  Top = 350
  BorderStyle = bsDialog
  Caption = 'Database Setting'
  ClientHeight = 151
  ClientWidth = 225
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
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 225
    Height = 112
    Align = alClient
    Shape = bsBottomLine
  end
  object Label1: TLabel
    Left = 12
    Top = 12
    Width = 32
    Height = 13
    Caption = 'Server'
  end
  object Label2: TLabel
    Left = 12
    Top = 34
    Width = 27
    Height = 13
    Caption = 'Name'
  end
  object Label3: TLabel
    Left = 12
    Top = 56
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object Label4: TLabel
    Left = 12
    Top = 78
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Bevel2: TBevel
    Left = 0
    Top = 112
    Width = 225
    Height = 39
    Align = alBottom
    Shape = bsSpacer
  end
  object Edit1: TEdit
    Left = 92
    Top = 8
    Width = 121
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 0
    Text = '192.168.1.11'
  end
  object Edit2: TEdit
    Left = 92
    Top = 30
    Width = 121
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 92
    Top = 52
    Width = 121
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 92
    Top = 74
    Width = 121
    Height = 21
    BevelInner = bvNone
    BevelKind = bkFlat
    BorderStyle = bsNone
    PasswordChar = '*'
    TabOrder = 3
  end
  object btnOK: TButton
    Left = 120
    Top = 120
    Width = 75
    Height = 25
    Caption = 'O K'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TButton
    Left = 24
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    OnClick = btnCancelClick
  end
end
