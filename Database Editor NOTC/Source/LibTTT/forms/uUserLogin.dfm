object frmUserLogin: TfrmUserLogin
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'User Data'
  ClientHeight = 376
  ClientWidth = 353
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
  object pnl2: TPanel
    Left = 8
    Top = 8
    Width = 337
    Height = 361
    ParentBackground = False
    TabOrder = 0
    object lbl5: TLabel
      Left = 65
      Top = 125
      Width = 62
      Height = 14
      Caption = 'Username :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 68
      Top = 165
      Width = 59
      Height = 14
      Caption = 'Password :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 75
      Top = 253
      Width = 52
      Height = 14
      Caption = 'Privilege :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 23
      Top = 206
      Width = 104
      Height = 14
      Caption = 'Confirm Password :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object bvl1: TBevel
      Left = 24
      Top = 302
      Width = 257
      Height = 2
    end
    object lbl8: TLabel
      Left = 110
      Top = 13
      Width = 91
      Height = 24
      Caption = 'New User '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -20
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object bvl2: TBevel
      Left = 34
      Top = 54
      Width = 257
      Height = 2
    end
    object lbl1: TLabel
      Left = 88
      Top = 83
      Width = 39
      Height = 14
      Caption = 'Name :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnCancel: TButton
      Left = 206
      Top = 321
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 118
      Top = 321
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
    object cbbPrivilege: TComboBox
      Left = 146
      Top = 251
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 2
      Items.Strings = (
        'Admin System'
        'Scenario Builder'
        'Data Modifier')
    end
    object edtCnfPassword: TEdit
      Left = 146
      Top = 204
      Width = 145
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
    object edtPassword: TEdit
      Left = 146
      Top = 163
      Width = 145
      Height = 21
      PasswordChar = '*'
      TabOrder = 4
    end
    object edtUser: TEdit
      Left = 146
      Top = 123
      Width = 145
      Height = 21
      TabOrder = 5
    end
    object edtName: TEdit
      Left = 146
      Top = 81
      Width = 145
      Height = 21
      TabOrder = 6
    end
  end
end
