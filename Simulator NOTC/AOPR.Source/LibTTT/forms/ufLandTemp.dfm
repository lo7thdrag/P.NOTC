object frmLandTemp: TfrmLandTemp
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  ClientHeight = 292
  ClientWidth = 321
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 163
    Height = 16
    Caption = 'Select Platform Destination :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lvPlaformAvailable: TListView
    Left = 7
    Top = 25
    Width = 305
    Height = 226
    Color = clWhite
    Columns = <
      item
        Caption = 'Name'
        MaxWidth = 300
        MinWidth = 300
        Width = 300
      end
      item
        Caption = 'Capability'
        Width = 0
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = lvPlaformAvailableSelectItem
  end
  object btnOK: TButton
    Left = 147
    Top = 256
    Width = 75
    Height = 30
    Caption = 'Ok'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 236
    Top = 256
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
