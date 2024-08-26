object IFFMountForm: TIFFMountForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'IFF'
  ClientHeight = 338
  ClientWidth = 423
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 423
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
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
      Width = 392
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 297
    Width = 423
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 423
    Height = 248
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 392
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblCapability: TStaticText
          Left = 19
          Top = 28
          Width = 58
          Height = 17
          Caption = 'Capability :'
          TabOrder = 0
        end
        object cbMountExtension: TComboBox
          Left = 96
          Top = 26
          Width = 140
          Height = 21
          TabOrder = 1
        end
        object lblHullMounted: TStaticText
          Left = 19
          Top = 53
          Width = 86
          Height = 17
          Caption = 'Antenna Height :'
          TabOrder = 2
        end
        object edtAntenna: TEdit
          Left = 168
          Top = 51
          Width = 68
          Height = 21
          TabOrder = 3
        end
        object lblSubmerged: TStaticText
          Left = 19
          Top = 79
          Width = 143
          Height = 17
          Caption = 'Submerged Antenna Height :'
          TabOrder = 4
        end
        object edtSubmerged: TEdit
          Left = 168
          Top = 77
          Width = 68
          Height = 21
          TabOrder = 5
        end
        object lblMaxOperational: TStaticText
          Left = 19
          Top = 105
          Width = 146
          Height = 17
          Caption = 'Maximum Operational Depth :'
          TabOrder = 6
        end
        object edtMaxOperational: TEdit
          Left = 168
          Top = 103
          Width = 68
          Height = 21
          TabOrder = 7
        end
        object lblAntenna: TStaticText
          Left = 242
          Top = 53
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 8
        end
        object lblFeetSubmerged: TStaticText
          Left = 242
          Top = 79
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 9
        end
        object lblFeetMaxOperational: TStaticText
          Left = 242
          Top = 105
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 10
        end
      end
    end
  end
end
