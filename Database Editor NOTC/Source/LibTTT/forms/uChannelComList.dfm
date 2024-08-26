object fChannelComList: TfChannelComList
  Left = 0
  Top = 0
  Caption = 'Communication Channel'
  ClientHeight = 378
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 411
    Height = 74
    Align = alBottom
    TabOrder = 0
    object BtnNew: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'New'
      TabOrder = 0
      OnClick = BtnNewClick
    end
    object BtnUsage: TButton
      Left = 166
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Usage'
      TabOrder = 1
    end
    object BtnRemove: TButton
      Left = 247
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 2
      OnClick = BtnRemoveClick
    end
    object BtnEdit: TButton
      Left = 328
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 3
      OnClick = BtnEditClick
    end
    object BtnClose: TButton
      Left = 328
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 4
      OnClick = BtnCloseClick
    end
    object BtnFilter: TButton
      Left = 8
      Top = 39
      Width = 75
      Height = 25
      Caption = '>>Filter'
      Enabled = False
      TabOrder = 5
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 411
    Height = 304
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object lbChannelID: TListBox
      Left = 1
      Top = 1
      Width = 409
      Height = 302
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
    end
    object lbChannelList: TListBox
      Left = 1
      Top = 1
      Width = 409
      Height = 302
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lbChannelListDblClick
    end
  end
end
