object fEditRoleList: TfEditRoleList
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 216
  ClientWidth = 406
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
    Left = 0
    Top = 0
    Width = 409
    Height = 218
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 74
      Height = 13
      Caption = 'Student Roles :'
    end
    object edtStudent: TEdit
      Left = 6
      Top = 23
      Width = 307
      Height = 21
      TabOrder = 0
    end
    object lbStudent: TListBox
      Left = 6
      Top = 50
      Width = 307
      Height = 151
      ItemHeight = 13
      TabOrder = 1
    end
    object btnAdd: TButton
      Left = 319
      Top = 21
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 2
      OnClick = btnAddClick
    end
    object btnRemove: TButton
      Left = 319
      Top = 52
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 3
      OnClick = btnRemoveClick
    end
    object lbTempId: TListBox
      Left = 6
      Top = 50
      Width = 307
      Height = 151
      ItemHeight = 13
      TabOrder = 4
      Visible = False
    end
  end
end
