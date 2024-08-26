object CurveEditWindowForm: TCurveEditWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Signal-to-Noise Ratio vs. probability of Detection Curve'
  ClientHeight = 471
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 24
    Width = 665
    Height = 449
    Caption = 'Probability of Detection (%)'
    ParentBackground = False
    TabOrder = 0
    object grbCursorPosition: TGroupBox
      Left = 8
      Top = 8
      Width = 137
      Height = 65
      Caption = 'Cursor Position'
      TabOrder = 0
      object lblRatioCursor: TLabel
        Left = 11
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Ratio :'
      end
      object lblProbabilityCursor: TLabel
        Left = 11
        Top = 43
        Width = 57
        Height = 13
        Caption = 'Probability :'
      end
    end
    object grbselectedPoint: TGroupBox
      Left = 8
      Top = 79
      Width = 137
      Height = 65
      Caption = 'Selected Point'
      TabOrder = 1
      object lblratioSelectedPoint: TLabel
        Left = 11
        Top = 24
        Width = 32
        Height = 13
        Caption = 'Ratio :'
      end
      object lblProbabilitySelectedPoint: TLabel
        Left = 11
        Top = 43
        Width = 57
        Height = 13
        Caption = 'Probability :'
      end
    end
    object grbRatio: TGroupBox
      Left = 8
      Top = 248
      Width = 137
      Height = 73
      Caption = 'Ratio'
      TabOrder = 2
      object lblRatioMax: TLabel
        Left = 11
        Top = 44
        Width = 27
        Height = 13
        Caption = 'Max :'
      end
      object lblRatioMin: TLabel
        Left = 11
        Top = 21
        Width = 23
        Height = 13
        Caption = 'Min :'
      end
      object lblRatioMindB: TLabel
        Left = 95
        Top = 21
        Width = 12
        Height = 13
        Caption = 'dB'
      end
      object lblRatioMaxdB: TLabel
        Left = 95
        Top = 44
        Width = 12
        Height = 13
        Caption = 'dB'
      end
      object edtRatioMin: TEdit
        Left = 44
        Top = 17
        Width = 45
        Height = 21
        TabOrder = 0
      end
      object edtRatioMax: TEdit
        Left = 44
        Top = 40
        Width = 45
        Height = 21
        TabOrder = 1
      end
    end
    object btnOK: TButton
      Left = 420
      Top = 414
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 3
    end
    object btnCancel: TButton
      Left = 501
      Top = 414
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 4
    end
    object btnApply: TButton
      Left = 582
      Top = 414
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 5
    end
    object grbProbability: TGroupBox
      Left = 8
      Top = 327
      Width = 137
      Height = 73
      Caption = 'Probability'
      TabOrder = 6
      object lblProbabilityMax: TLabel
        Left = 11
        Top = 44
        Width = 27
        Height = 13
        Caption = 'Max :'
      end
      object lblProbabilityMin: TLabel
        Left = 11
        Top = 21
        Width = 23
        Height = 13
        Caption = 'Min :'
      end
      object lblProbMinProsen: TLabel
        Left = 95
        Top = 21
        Width = 11
        Height = 13
        Caption = '%'
      end
      object lblProbMaxProsen: TLabel
        Left = 95
        Top = 44
        Width = 11
        Height = 13
        Caption = '%'
      end
      object edtProbabilityMin: TEdit
        Left = 44
        Top = 17
        Width = 45
        Height = 21
        TabOrder = 0
      end
      object edtProbabilityMax: TEdit
        Left = 44
        Top = 40
        Width = 45
        Height = 21
        TabOrder = 1
      end
    end
    object chartProbability: TChart
      Left = 151
      Top = 8
      Width = 506
      Height = 392
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
      TabOrder = 7
      PrintMargins = (
        15
        11
        15
        11)
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 26
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 23
      Height = 22
    end
    object SpeedButton2: TSpeedButton
      Left = 23
      Top = 0
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = False
    end
    object SpeedButton3: TSpeedButton
      Left = 53
      Top = 0
      Width = 23
      Height = 22
    end
  end
end
