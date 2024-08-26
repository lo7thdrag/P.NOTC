object LateralForm: TLateralForm
  Left = 0
  Top = 0
  Caption = 'LateralForm (unsure)'
  ClientHeight = 321
  ClientWidth = 401
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
    Top = 0
    Width = 401
    Height = 321
    Align = alTop
    TabOrder = 0
    object pgControl: TPageControl
      Left = 0
      Top = 16
      Width = 401
      Height = 305
      ActivePage = tabLateral
      TabOrder = 0
      object tabInitial: TTabSheet
        Caption = 'Initial'
      end
      object tabLateral: TTabSheet
        Caption = 'Lateral'
        ImageIndex = 1
        object grbSelect: TGroupBox
          Left = 3
          Top = 11
          Width = 387
          Height = 30
          TabOrder = 0
          object cbxLateral: TComboBox
            Left = 3
            Top = 3
            Width = 381
            Height = 21
            TabOrder = 0
            Text = 'Straight/Heading'
          end
        end
        object grbStraughtHeading: TGroupBox
          Left = 3
          Top = 47
          Width = 387
          Height = 227
          TabOrder = 1
          object Course: TLabel
            Left = 16
            Top = 16
            Width = 41
            Height = 13
            Caption = 'Course :'
          end
          object GroundSpeed: TLabel
            Left = 16
            Top = 56
            Width = 75
            Height = 13
            Caption = 'Ground Speed :'
          end
          object degreesT: TLabel
            Left = 264
            Top = 16
            Width = 48
            Height = 13
            Caption = 'degrees T'
          end
          object Edit1: TEdit
            Left = 112
            Top = 13
            Width = 121
            Height = 21
            TabOrder = 0
            Text = 'Edit1'
          end
          object ComboBox1: TComboBox
            Left = 112
            Top = 52
            Width = 145
            Height = 21
            TabOrder = 1
            Text = 'ComboBox1'
          end
        end
      end
      object tabVertical: TTabSheet
        Caption = 'Vertical'
        ImageIndex = 2
      end
    end
  end
end
