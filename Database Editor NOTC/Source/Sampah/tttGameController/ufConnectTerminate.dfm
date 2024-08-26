object frmConnectTerminate: TfrmConnectTerminate
  Left = 0
  Top = 0
  BorderWidth = 1
  Caption = 'Connect'
  ClientHeight = 486
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 104
  TextHeight = 14
  object tvMapping: TTreeView
    Left = 17
    Top = 17
    Width = 462
    Height = 418
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 298
    Top = 451
    Width = 81
    Height = 27
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = '&Connect'
    ModalResult = 1
    TabOrder = 1
  end
  object btnCancel: TButton
    Left = 398
    Top = 451
    Width = 81
    Height = 27
    Align = alCustom
    Anchors = [akRight, akBottom]
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
