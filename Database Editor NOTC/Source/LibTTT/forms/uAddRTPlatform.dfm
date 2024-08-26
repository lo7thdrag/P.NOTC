object frmRuntimeLibrary: TfrmRuntimeLibrary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Add Runtime LIbrary'
  ClientHeight = 457
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 419
    Width = 325
    Height = 38
    Align = alBottom
    TabOrder = 0
    object Cancel: TButton
      Left = 229
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
    end
  end
  object lvTrackTable: TListView
    Left = 0
    Top = 0
    Width = 325
    Height = 419
    Align = alClient
    Columns = <
      item
        Caption = 'Platform Name'
        Width = 300
      end>
    TabOrder = 1
    ViewStyle = vsReport
    ExplicitLeft = -12
    ExplicitWidth = 337
    ExplicitHeight = 95
  end
end
