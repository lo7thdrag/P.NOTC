object fSnrVsPod: TfSnrVsPod
  Left = 0
  Top = 0
  ParentCustomHint = False
  BiDiMode = bdLeftToRight
  BorderStyle = bsToolWindow
  Caption = 'Signal to Noise Ratio vs Probability of Detection Curve'
  ClientHeight = 89
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 89
    TabOrder = 0
    object lbl1: TLabel
      Left = 10
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object edtName: TEdit
      Left = 10
      Top = 27
      Width = 407
      Height = 21
      TabOrder = 0
    end
    object btnEditList: TButton
      Left = 10
      Top = 54
      Width = 119
      Height = 25
      Caption = 'Edit Curve..'
      TabOrder = 1
    end
    object btnApply: TButton
      Left = 342
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 2
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 261
      Top = 54
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 180
      Top = 54
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 4
      OnClick = btnOkClick
    end
  end
end
