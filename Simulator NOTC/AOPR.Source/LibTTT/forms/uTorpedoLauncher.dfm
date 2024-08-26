object TorpedoLauncherForm: TTorpedoLauncherForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Torpedo Launcher for Test Torpedo'
  ClientHeight = 282
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 335
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
    object cbxName: TComboBox
      Left = 16
      Top = 24
      Width = 305
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 241
    Width = 335
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 246
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 165
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 84
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
    Width = 335
    Height = 192
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 305
      Height = 167
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblMaxQuantity: TStaticText
          Left = 27
          Top = 29
          Width = 100
          Height = 17
          Caption = 'Maximum Quantity :'
          TabOrder = 0
        end
        object edtMaxQuantity: TEdit
          Left = 159
          Top = 27
          Width = 67
          Height = 21
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 3
          Top = 68
          Width = 278
          Height = 61
          TabOrder = 2
          object lblAngle: TStaticText
            Left = 24
            Top = 32
            Width = 38
            Height = 17
            Caption = 'Angle :'
            TabOrder = 0
          end
          object edtAngle: TEdit
            Left = 156
            Top = 28
            Width = 68
            Height = 21
            Enabled = False
            TabOrder = 1
          end
        end
        object cbAngleRequired: TCheckBox
          Left = 16
          Top = 60
          Width = 97
          Height = 17
          Caption = 'Angle Required :'
          TabOrder = 3
          OnClick = cbAngleRequiredClick
        end
      end
    end
  end
end
