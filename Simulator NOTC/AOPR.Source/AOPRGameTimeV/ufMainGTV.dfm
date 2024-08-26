object frmMainGT: TfrmMainGT
  Left = 281
  Top = 254
  BorderStyle = bsNone
  BorderWidth = 12
  Caption = 'Tactical Team Trainer Game Time'
  ClientHeight = 480
  ClientWidth = 1078
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Top = 20
  GlassFrame.Right = 20
  GlassFrame.Bottom = 20
  GlassFrame.SheetOfGlass = True
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 354
    Width = 1078
    Height = 126
    Align = alClient
    ExplicitTop = 0
    ExplicitWidth = 1366
    ExplicitHeight = 369
  end
  object Bevel3: TBevel
    Left = 0
    Top = 354
    Width = 1078
    Height = 126
    Align = alClient
    Style = bsRaised
    ExplicitTop = 8
    ExplicitWidth = 1342
    ExplicitHeight = 354
  end
  object Bevel2: TBevel
    Left = 0
    Top = 0
    Width = 1078
    Height = 354
    Align = alTop
    Style = bsRaised
    ExplicitLeft = 64
    ExplicitTop = 56
    ExplicitWidth = 793
  end
  object lblServerTIME: TLabel
    Left = 360
    Top = 176
    Width = 872
    Height = 155
    Caption = ' 00 : 00 : 00 '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16777152
    Font.Height = -128
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object lblGTCaption: TLabel
    Left = 64
    Top = 440
    Width = 668
    Height = 129
    Caption = 'Waktu Asumsi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8454016
    Font.Height = -107
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblRTCaption: TLabel
    Left = 64
    Top = 56
    Width = 889
    Height = 129
    Caption = 'Waktu Sebenarnya'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16777152
    Font.Height = -107
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblGameTime: TLabel
    Left = 360
    Top = 560
    Width = 872
    Height = 155
    Caption = ' 00 : 00 : 00 '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -128
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 464
    Top = 96
  end
end
