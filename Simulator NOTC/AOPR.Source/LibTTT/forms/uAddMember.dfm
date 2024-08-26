object AddMemberForm: TAddMemberForm
  Left = 0
  Top = 0
  Caption = 'Add Member'
  ClientHeight = 99
  ClientWidth = 277
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
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 43
    Height = 13
    Caption = 'Name    :'
  end
  object verLabel: TLabel
    Left = 57
    Top = 35
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MemberName: TEdit
    Left = 57
    Top = 8
    Width = 212
    Height = 21
    TabOrder = 0
  end
  object btOk: TButton
    Left = 113
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 194
    Top = 68
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btCancelClick
  end
end
