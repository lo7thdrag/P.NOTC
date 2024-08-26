object frmEffectsTable: TfrmEffectsTable
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Usage Report'
  ClientHeight = 495
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 654
    Height = 495
    Align = alClient
    TabOrder = 0
    object btnOk: TButton
      Left = 404
      Top = 462
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 485
      Top = 462
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 566
      Top = 462
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 2
      OnClick = btnApplyClick
    end
    object strGrdEffectTable: TStringGrid
      Left = 16
      Top = 16
      Width = 625
      Height = 440
      ColCount = 2
      DefaultColWidth = 50
      RowCount = 2
      TabOrder = 3
    end
  end
end
