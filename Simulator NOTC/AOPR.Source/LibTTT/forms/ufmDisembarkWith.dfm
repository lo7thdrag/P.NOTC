object fmDisembarkWith: TfmDisembarkWith
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Disembark with'
  ClientHeight = 278
  ClientWidth = 289
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisembarkWithPf: TPanel
    Left = 10
    Top = 10
    Width = 265
    Height = 220
    TabOrder = 0
    object lvDisembarkWithPf: TListView
      Left = 1
      Top = 1
      Width = 263
      Height = 218
      Align = alClient
      Color = clWhite
      Columns = <
        item
          Caption = 'Name'
          Width = 260
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      OnSelectItem = lvDisembarkWithPfSelectItem
    end
  end
  object btnOk: TButton
    Left = 113
    Top = 240
    Width = 75
    Height = 30
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 199
    Top = 240
    Width = 75
    Height = 30
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
