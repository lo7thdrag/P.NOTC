object fmPlottingTime: TfmPlottingTime
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Plotting Time'
  ClientHeight = 139
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 37
    Top = 54
    Width = 29
    Height = 16
    Caption = 'Time'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 40
    Top = 23
    Width = 26
    Height = 16
    Caption = 'Date'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object dtpTimePlotting: TDateTimePicker
    Left = 72
    Top = 54
    Width = 186
    Height = 21
    Date = 42577.000000000000000000
    Time = 0.656216273149766500
    Kind = dtkTime
    TabOrder = 0
  end
  object dtpDatePlotting: TDateTimePicker
    Left = 72
    Top = 23
    Width = 186
    Height = 21
    Date = 42577.000000000000000000
    Time = 0.656216273149766500
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 56
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 159
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
