object fBombWindow: TfBombWindow
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Bomb'
  ClientHeight = 376
  ClientWidth = 421
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
    Left = 0
    Top = -3
    Width = 433
    Height = 49
    TabOrder = 0
    object lbl1: TLabel
      Left = 13
      Top = 6
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClass: TEdit
      Left = 13
      Top = 25
      Width = 402
      Height = 21
      TabOrder = 0
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 48
    Width = 421
    Height = 298
    Caption = 'pnl3'
    TabOrder = 1
    object pgc1: TPageControl
      Left = 4
      Top = 1
      Width = 415
      Height = 290
      ActivePage = ts1
      TabOrder = 0
      object ts1: TTabSheet
        Caption = 'General'
        object lbl2: TLabel
          Left = 3
          Top = 14
          Width = 34
          Height = 13
          Caption = 'Type  :'
        end
        object grp1: TGroupBox
          Left = 3
          Top = 40
          Width = 399
          Height = 49
          Caption = 'Target Selection'
          TabOrder = 0
          object chkAntiSurface: TCheckBox
            Left = 6
            Top = 18
            Width = 113
            Height = 17
            Caption = 'Anti-Surface'
            TabOrder = 0
          end
          object chkAntiSubSurface: TCheckBox
            Left = 125
            Top = 18
            Width = 113
            Height = 17
            Caption = 'Anti-Subsurface'
            TabOrder = 1
          end
          object chkAntiLand: TCheckBox
            Left = 261
            Top = 18
            Width = 113
            Height = 17
            Caption = 'Anti-Land'
            TabOrder = 2
          end
        end
        object grp2: TGroupBox
          Left = 3
          Top = 89
          Width = 215
          Height = 80
          Caption = 'Range'
          TabOrder = 1
          object lbl3: TLabel
            Left = 8
            Top = 20
            Width = 53
            Height = 13
            Caption = 'Minimum   :'
          end
          object lbl4: TLabel
            Left = 8
            Top = 50
            Width = 51
            Height = 13
            Caption = 'Maximum :'
          end
          object lbl5: TLabel
            Left = 155
            Top = 20
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object lbl6: TLabel
            Left = 155
            Top = 50
            Width = 14
            Height = 13
            Caption = 'nm'
          end
          object edtRangeMin: TEdit
            Left = 67
            Top = 18
            Width = 82
            Height = 21
            TabOrder = 0
          end
          object edtRangeMax: TEdit
            Left = 67
            Top = 47
            Width = 82
            Height = 21
            TabOrder = 1
          end
        end
        object grp3: TGroupBox
          Left = 224
          Top = 89
          Width = 178
          Height = 80
          Caption = 'Probability of Hit Curve'
          TabOrder = 2
          object btn1: TButton
            Left = 54
            Top = 23
            Width = 75
            Height = 25
            Caption = 'Edit ...'
            TabOrder = 0
          end
        end
        object grp4: TGroupBox
          Left = 3
          Top = 169
          Width = 399
          Height = 80
          Caption = 'Lethatlity'
          TabOrder = 3
          object lbl7: TLabel
            Left = 10
            Top = 48
            Width = 6
            Height = 13
            Caption = '0'
          end
          object lbl8: TLabel
            Left = 309
            Top = 47
            Width = 40
            Height = 13
            Caption = '100.000'
          end
          object trckbrLethality: TTrackBar
            Left = 0
            Top = 17
            Width = 329
            Height = 31
            Max = 100000
            Frequency = 10000
            TabOrder = 0
            OnChange = trckbrLethalityChange
          end
          object edtLethality: TEdit
            Left = 328
            Top = 20
            Width = 68
            Height = 21
            TabOrder = 1
          end
        end
        object cbbType: TComboBox
          Left = 43
          Top = 12
          Width = 145
          Height = 21
          TabOrder = 4
          Items.Strings = (
            'Bomb'
            'Depth Charge')
        end
      end
      object ts2: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object mmo1: TMemo
          Left = 4
          Top = 7
          Width = 411
          Height = 250
          Lines.Strings = (
            'mmo1')
          TabOrder = 0
        end
      end
    end
  end
  object btnApply: TButton
    Left = 348
    Top = 348
    Width = 65
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 275
    Top = 348
    Width = 65
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnOk: TButton
    Left = 200
    Top = 348
    Width = 65
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = btnOkClick
  end
end
