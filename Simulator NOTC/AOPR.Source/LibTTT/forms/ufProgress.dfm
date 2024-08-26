object frmProgress: TfrmProgress
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = 'Loading Scenario from database'
  ClientHeight = 68
  ClientWidth = 584
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 584
    Height = 16
    Align = alTop
    Alignment = taCenter
    Color = 5980694
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 4
  end
  object pBar: TProgressBar
    Left = 32
    Top = 32
    Width = 529
    Height = 17
    Step = 1
    TabOrder = 0
  end
end
