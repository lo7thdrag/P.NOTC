object AccousticDecoy: TAccousticDecoy
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Accoustic Decoy'
  ClientHeight = 252
  ClientWidth = 428
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 378
    object txtName: TStaticText
      Left = 16
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 16
      Top = 24
      Width = 353
      Height = 21
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 211
    Width = 428
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 236
    ExplicitWidth = 378
    object btnApply: TButton
      Left = 294
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 213
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 132
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 49
    Width = 428
    Height = 162
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 378
    ExplicitHeight = 198
    object pgc1: TPageControl
      Left = 16
      Top = 6
      Width = 353
      Height = 143
      ActivePage = tsGeneral
      TabOrder = 0
      object tsGeneral: TTabSheet
        Caption = 'tsGeneral'
        ExplicitHeight = 89
        object txtAntenna: TStaticText
          Left = 88
          Top = 19
          Width = 56
          Height = 17
          Caption = 'Quantity  :'
          TabOrder = 0
        end
        object edtAntenna: TEdit
          Left = 88
          Top = 33
          Width = 68
          Height = 21
          TabOrder = 1
        end
      end
    end
  end
end