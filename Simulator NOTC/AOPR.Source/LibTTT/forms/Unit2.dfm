object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 335
  ClientWidth = 426
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object grbResultPatternonTarget: TGroupBox
    Left = 16
    Top = 8
    Width = 362
    Height = 267
    TabOrder = 0
    Visible = False
    object Base: TLabel
      Left = 15
      Top = 10
      Width = 81
      Height = 13
      Caption = 'Anchor Position :'
    end
    object Label1: TLabel
      Left = 15
      Top = 42
      Width = 63
      Height = 13
      Caption = 'Anchor Grid :'
    end
    object SpeedButton1: TSpeedButton
      Left = 336
      Top = 5
      Width = 23
      Height = 22
      Caption = 'icon'
    end
    object edtBase: TEdit
      Left = 117
      Top = 6
      Width = 101
      Height = 21
      TabOrder = 0
      Text = '56 56.33 N'
    end
    object Edit1: TEdit
      Left = 117
      Top = 38
      Width = 101
      Height = 21
      TabOrder = 1
      Text = '0.00 nm N'
    end
    object CheckBox1: TCheckBox
      Left = 15
      Top = 80
      Width = 138
      Height = 17
      Caption = 'Drifts on Current'
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 224
      Top = 6
      Width = 106
      Height = 21
      TabOrder = 3
      Text = '003 04.15 E'
    end
    object Edit3: TEdit
      Left = 224
      Top = 38
      Width = 106
      Height = 21
      TabOrder = 4
      Text = '0.00 nm E'
    end
  end
end
