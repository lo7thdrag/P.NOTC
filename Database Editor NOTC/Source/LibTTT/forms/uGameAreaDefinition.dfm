object DefinitionArea: TDefinitionArea
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = ' Definition Area'
  ClientHeight = 302
  ClientWidth = 224
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btn_New: TButton
    Left = 7
    Top = 232
    Width = 65
    Height = 25
    Caption = 'New...'
    TabOrder = 1
    OnClick = btn_NewClick
  end
  object btn_Copy: TButton
    Left = 78
    Top = 263
    Width = 65
    Height = 25
    Caption = 'Copy'
    Enabled = False
    TabOrder = 2
    OnClick = btn_CopyClick
  end
  object btn_Edit: TButton
    Left = 78
    Top = 232
    Width = 65
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 3
    OnClick = btn_EditClick
  end
  object btn_Remove: TButton
    Left = 149
    Top = 232
    Width = 65
    Height = 25
    Caption = 'Remove...'
    Enabled = False
    TabOrder = 4
    OnClick = btn_RemoveClick
  end
  object btn_Pick: TButton
    Left = 7
    Top = 263
    Width = 65
    Height = 25
    Caption = 'Pick...'
    Enabled = False
    TabOrder = 5
    OnClick = btn_PickClick
  end
  object btn_Close: TButton
    Left = 149
    Top = 263
    Width = 65
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btn_CloseClick
  end
  object lst_DBIdGameArea: TListBox
    Left = 8
    Top = 8
    Width = 89
    Height = 33
    ItemHeight = 13
    TabOrder = 7
  end
  object lst_DBGameAreaIdentifier: TListBox
    Left = 134
    Top = 8
    Width = 81
    Height = 33
    ItemHeight = 13
    TabOrder = 8
  end
  object lst_DefinitionArea: TListBox
    Left = 8
    Top = 8
    Width = 207
    Height = 209
    ItemHeight = 13
    TabOrder = 0
    OnClick = lst_DefinitionAreaClick
  end
end
