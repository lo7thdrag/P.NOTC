object frmSummaryRadarIntervalList: TfrmSummaryRadarIntervalList
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Radar Interval List'
  ClientHeight = 91
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 50
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 16
      Top = 4
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object edtName: TEdit
      Left = 16
      Top = 20
      Width = 393
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnEditList: TButton
      Left = 16
      Top = 6
      Width = 97
      Height = 25
      Caption = 'Edit List...'
      TabOrder = 0
      OnClick = btnEditListClick
    end
    object btnApply: TButton
      Left = 334
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 251
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 2
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 3
      OnClick = btnOKClick
    end
  end
end
