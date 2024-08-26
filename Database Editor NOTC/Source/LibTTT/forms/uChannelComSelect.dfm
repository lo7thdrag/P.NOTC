object fChannelComSelect: TfChannelComSelect
  Left = 0
  Top = 0
  Caption = 'Channel Select'
  ClientHeight = 432
  ClientWidth = 726
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
  object BtnAdd: TButton
    Left = 319
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Add -->'
    TabOrder = 0
  end
  object BtnRemove: TButton
    Left = 319
    Top = 176
    Width = 75
    Height = 25
    Caption = '<-- Remove'
    TabOrder = 1
  end
  object BtnOk: TButton
    Left = 400
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = BtnOkClick
  end
  object BtnCancel: TButton
    Left = 481
    Top = 375
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = BtnCancelClick
  end
  object LbChannelList: TListBox
    Left = 8
    Top = 8
    Width = 305
    Height = 353
    ItemHeight = 13
    TabOrder = 4
  end
  object LbChannelMap: TListBox
    Left = 400
    Top = 8
    Width = 305
    Height = 353
    ItemHeight = 13
    TabOrder = 5
  end
end
