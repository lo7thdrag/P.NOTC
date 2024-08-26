object fVehicleList: TfVehicleList
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Vehicle'
  ClientHeight = 472
  ClientWidth = 339
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 419
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object lbVehicle: TListBox
      Left = 1
      Top = 1
      Width = 337
      Height = 417
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 419
    Width = 339
    Height = 53
    Align = alBottom
    TabOrder = 1
    object BtnNew: TButton
      Left = 8
      Top = 12
      Width = 75
      Height = 25
      Caption = 'New'
      TabOrder = 0
    end
    object BtnEdit: TButton
      Left = 89
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Edit'
      TabOrder = 1
      OnClick = BtnEditClick
    end
    object BtnRemove: TButton
      Left = 170
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 2
    end
    object BtnClose: TButton
      Left = 251
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 3
      OnClick = BtnCloseClick
    end
  end
end
