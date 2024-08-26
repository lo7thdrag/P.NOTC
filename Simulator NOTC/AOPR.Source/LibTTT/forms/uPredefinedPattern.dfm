object fPredefinedPattern: TfPredefinedPattern
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Predefined Pattern'
  ClientHeight = 248
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 49
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object edtPatternName: TEdit
      Left = 7
      Top = 20
      Width = 410
      Height = 21
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 49
    Width = 433
    Height = 160
    TabOrder = 1
    object grp1: TGroupBox
      Left = 8
      Top = 6
      Width = 409
      Height = 67
      TabOrder = 0
      object lbl2: TLabel
        Left = 8
        Top = 17
        Width = 43
        Height = 13
        Caption = 'Vehicle  :'
      end
      object edt1: TEdit
        Left = 8
        Top = 36
        Width = 369
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object btnVehicle: TButton
        Left = 379
        Top = 35
        Width = 27
        Height = 25
        Caption = '...'
        Enabled = False
        TabOrder = 1
        OnClick = btnVehicleClick
      end
    end
    object grp2: TGroupBox
      Left = 7
      Top = 74
      Width = 410
      Height = 79
      Caption = 'Pattern Termination'
      TabOrder = 1
      object lbl3: TLabel
        Left = 5
        Top = 20
        Width = 52
        Height = 13
        Caption = 'Type        :'
      end
      object lbl4: TLabel
        Left = 5
        Top = 46
        Width = 52
        Height = 13
        Caption = 'Heading   :'
      end
      object lbl5: TLabel
        Left = 135
        Top = 46
        Width = 39
        Height = 13
        Caption = 'degrees'
      end
      object cbbType: TComboBox
        Left = 63
        Top = 17
        Width = 145
        Height = 21
        TabOrder = 0
        Items.Strings = (
          'Continue'
          'New Heading'
          'Repeat Pattern Absolutely'
          'Repeat Pattern Relatively'
          'Return to Base'
          'Remove Platform'
          'Heading - this data box is only available')
      end
      object edtHeading: TEdit
        Left = 63
        Top = 44
        Width = 66
        Height = 21
        TabOrder = 1
      end
    end
  end
  object chkEventPattern: TCheckBox
    Left = 16
    Top = 47
    Width = 97
    Height = 17
    Caption = 'Event Pattern'
    TabOrder = 2
    OnClick = chkEventPatternClick
  end
  object pnl3: TPanel
    Left = 0
    Top = 209
    Width = 428
    Height = 40
    TabOrder = 3
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
    object btnEditPattern: TButton
      Left = 8
      Top = 6
      Width = 89
      Height = 25
      Caption = 'Edit Pattern ..'
      TabOrder = 3
    end
  end
end
