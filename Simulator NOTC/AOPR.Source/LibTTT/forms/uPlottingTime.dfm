object fmPlottingTime: TfmPlottingTime
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsToolWindow
  Caption = 'Plotting Time'
  ClientHeight = 155
  ClientWidth = 300
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 37
    Top = 55
    Width = 29
    Height = 16
    Caption = 'Time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 40
    Top = 25
    Width = 26
    Height = 16
    Caption = 'Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dtpTimePlotting: TDateTimePicker
    Left = 80
    Top = 51
    Width = 186
    Height = 24
    Date = 42577.000000000000000000
    Time = 0.656216273149766500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = dtkTime
    ParentFont = False
    TabOrder = 0
  end
  object dtpDatePlotting: TDateTimePicker
    Left = 80
    Top = 21
    Width = 186
    Height = 24
    Date = 42577.000000000000000000
    Time = 0.656216273149766500
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 60
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 165
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelClick
  end
end