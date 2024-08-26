object fStudentRoleListWindow: TfStudentRoleListWindow
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Student Role List'
  ClientHeight = 86
  ClientWidth = 428
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
    Width = 433
    Height = 89
    TabOrder = 0
    object lbl1: TLabel
      Left = 10
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object edtName: TEdit
      Left = 10
      Top = 27
      Width = 407
      Height = 21
      TabOrder = 0
    end
    object btnEditList: TButton
      Left = 10
      Top = 54
      Width = 119
      Height = 25
      Caption = 'Edit List'
      Enabled = False
      TabOrder = 1
      OnClick = btnEditListClick
    end
    object btnApply: TButton
      Left = 342
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 2
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 261
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 180
      Top = 54
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 4
      OnClick = btnOkClick
    end
  end
end
