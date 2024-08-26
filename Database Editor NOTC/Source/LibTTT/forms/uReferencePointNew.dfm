object fReferencePointNew: TfReferencePointNew
  Left = 0
  Top = 0
  Caption = 'Reference Point Name'
  ClientHeight = 100
  ClientWidth = 352
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 17
    Width = 207
    Height = 13
    Caption = 'Enter a name for the new Reference Point:'
  end
  object edtReferenceName: TEdit
    Left = 23
    Top = 36
    Width = 321
    Height = 21
    MaxLength = 7
    TabOrder = 0
    Text = '(Reference Point)'
  end
  object btnOk: TButton
    Left = 100
    Top = 63
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 181
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object btnApply: TButton
    Left = 262
    Top = 63
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 3
    OnClick = btnApplyClick
  end
end
