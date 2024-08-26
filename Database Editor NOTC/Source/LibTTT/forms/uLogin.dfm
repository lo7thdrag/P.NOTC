object frmLoginOld: TfrmLoginOld
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'OPR'
  ClientHeight = 233
  ClientWidth = 355
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
  object pnl1: TPanel
    Left = 9
    Top = 16
    Width = 337
    Height = 201
    TabOrder = 0
    object lbl1: TLabel
      Left = 28
      Top = 52
      Width = 67
      Height = 14
      Caption = 'Username :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 28
      Top = 99
      Width = 67
      Height = 14
      Caption = 'Password :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bvl3: TBevel
      Left = 28
      Top = 181
      Width = 281
      Height = 2
    end
    object bvl4: TBevel
      Left = 28
      Top = 20
      Width = 281
      Height = 2
    end
    object btnLogin: TButton
      Left = 234
      Top = 139
      Width = 75
      Height = 25
      Caption = 'Log In'
      TabOrder = 2
      OnClick = btnLoginClick
    end
    object edtPassword: TEdit
      Left = 123
      Top = 97
      Width = 186
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
      Text = 'admin'
    end
    object edtUsername: TEdit
      Left = 123
      Top = 50
      Width = 186
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'Administrator'
    end
  end
end
