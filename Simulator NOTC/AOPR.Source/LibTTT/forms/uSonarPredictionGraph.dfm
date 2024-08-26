object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 581
  ClientWidth = 588
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
    Top = 0
    Width = 588
    Height = 507
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    object chartProbability: TChart
      Left = 8
      Top = 11
      Width = 569
      Height = 490
      Title.Color = -1
      Title.CustomPosition = True
      Title.Font.Color = -1
      Title.Font.Height = -13
      Title.Left = 25
      Title.Text.Strings = (
        'Probability of Detection (%)')
      Title.Top = 10
      Title.VertMargin = 9
      BottomAxis.Title.Caption = 'Signal-to-Noise Ratio (dB)'
      BottomAxis.Title.Font.Height = -13
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.ExactDateTime = False
      LeftAxis.Increment = 10.000000000000000000
      RightAxis.Title.Caption = 'Probability of Detection (%)'
      RightAxis.Title.Font.Height = -13
      RightAxis.Title.Color = -1
      RightAxis.Title.Transparent = False
      RightAxis.Visible = False
      TopAxis.Visible = False
      View3DWalls = False
      Color = clWhite
      TabOrder = 0
      PrintMargins = (
        15
        11
        15
        11)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 507
    Width = 588
    Height = 74
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 6
      Width = 161
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 184
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 502
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
    end
  end
end
