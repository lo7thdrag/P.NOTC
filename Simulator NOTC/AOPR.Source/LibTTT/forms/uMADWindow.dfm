object MADForm: TMADForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'MAD'
  ClientHeight = 248
  ClientWidth = 462
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
    Width = 462
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 36
      Height = 17
      Caption = 'Class :'
      TabOrder = 0
    end
    object edtClass: TEdit
      Left = 16
      Top = 24
      Width = 433
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 207
    Width = 462
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 372
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 291
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 210
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 462
    Height = 158
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 433
      Height = 143
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblAntenna: TStaticText
          Left = 3
          Top = 11
          Width = 133
          Height = 17
          Caption = 'Baseline Detection Range :'
          TabOrder = 0
        end
        object edtAssociatedCross: TEdit
          Left = 141
          Top = 37
          Width = 68
          Height = 21
          TabOrder = 1
        end
        object lblFeetAntenna: TStaticText
          Left = 213
          Top = 11
          Width = 18
          Height = 17
          Caption = 'nm'
          TabOrder = 2
        end
        object txt1: TStaticText
          Left = 3
          Top = 40
          Width = 132
          Height = 17
          Caption = 'Associated Cross-Section :'
          TabOrder = 3
        end
        object edtBaselineDetection: TEdit
          Left = 142
          Top = 8
          Width = 68
          Height = 21
          TabOrder = 4
        end
      end
    end
  end
end
