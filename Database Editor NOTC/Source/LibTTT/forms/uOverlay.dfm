object fOverlay: TfOverlay
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Overlay'
  ClientHeight = 182
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = -5
    Top = 0
    Width = 433
    Height = 145
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object lbl2: TLabel
      Left = 8
      Top = 47
      Width = 34
      Height = 13
      Caption = 'Type  :'
    end
    object lbl3: TLabel
      Left = 168
      Top = 47
      Width = 45
      Height = 13
      Caption = 'Domain  :'
    end
    object lbl4: TLabel
      Left = 9
      Top = 94
      Width = 33
      Height = 13
      Caption = 'Area  :'
    end
    object edtOverlayName: TEdit
      Left = 7
      Top = 20
      Width = 410
      Height = 21
      TabOrder = 0
    end
    object cbbType: TComboBox
      Left = 8
      Top = 66
      Width = 113
      Height = 21
      TabOrder = 1
      OnChange = cbbTypeChange
      Items.Strings = (
        'Dynamic'
        'Static')
    end
    object cbbDomain: TComboBox
      Left = 168
      Top = 66
      Width = 113
      Height = 21
      TabOrder = 2
      Items.Strings = (
        'Surface'
        'Sub Surface'
        'Air'
        'Land')
    end
    object edtArea: TEdit
      Left = 8
      Top = 108
      Width = 377
      Height = 21
      Enabled = False
      TabOrder = 3
      OnChange = edtAreaChange
    end
    object btnArea: TButton
      Left = 391
      Top = 106
      Width = 27
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = btnAreaClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 145
    Width = 428
    Height = 40
    TabOrder = 1
    object btnCancel: TButton
      Left = 261
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 342
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = btnApplyClick
    end
    object btnOk: TButton
      Left = 180
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOkClick
    end
    object btnEditOverlay: TButton
      Left = 12
      Top = 6
      Width = 89
      Height = 25
      Caption = 'EditOverlay ..'
      TabOrder = 3
      OnClick = btnEditOverlayClick
    end
  end
end
