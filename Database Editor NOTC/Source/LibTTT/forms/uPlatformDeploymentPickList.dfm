object PlatformDeploymentPickListForm: TPlatformDeploymentPickListForm
  Left = 0
  Top = 0
  Caption = 'Deployment'
  ClientHeight = 535
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 420
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object lbType: TListBox
      Left = 8
      Top = 9
      Width = 318
      Height = 369
      ItemHeight = 13
      TabOrder = 6
    end
    object lbTmpPlatf: TListBox
      Left = 8
      Top = 9
      Width = 318
      Height = 369
      ItemHeight = 13
      TabOrder = 3
      Visible = False
    end
    object btnFilter: TButton
      Left = 16
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Filter >>'
      TabOrder = 0
      Visible = False
      OnClick = btnFilterClick
    end
    object btnCancel: TButton
      Left = 246
      Top = 384
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 165
      Top = 384
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
    object lbForce: TListBox
      Left = 8
      Top = 9
      Width = 318
      Height = 369
      ItemHeight = 13
      TabOrder = 5
    end
    object lbPlatforms: TListBox
      Left = 8
      Top = 9
      Width = 318
      Height = 369
      ItemHeight = 13
      TabOrder = 4
      OnDblClick = lbPlatformsDblClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 420
    Width = 334
    Height = 115
    Caption = 'Filter'
    TabOrder = 1
    object cbForce: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Force'
      TabOrder = 0
      OnClick = cbForceClick
    end
    object cbClassification: TCheckBox
      Left = 16
      Top = 56
      Width = 97
      Height = 17
      Caption = 'Classification'
      TabOrder = 1
      OnClick = cbClassificationClick
    end
    object cbHide: TCheckBox
      Left = 16
      Top = 88
      Width = 97
      Height = 17
      Caption = 'Hide if Deployed'
      TabOrder = 2
      OnClick = cbHideClick
    end
    object cbxForce: TComboBox
      Left = 119
      Top = 22
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 3
      OnChange = cbxForceChange
      Items.Strings = (
        'Red'
        'Yellow'
        'Blue'
        'Green'
        'No Force'
        'NTDS')
    end
    object cbxClassification: TComboBox
      Left = 119
      Top = 54
      Width = 145
      Height = 21
      Enabled = False
      TabOrder = 4
      OnChange = cbxClassificationChange
      Items.Strings = (
        'Air'
        'Surface'
        'Subsurface'
        'Land'
        'General')
    end
  end
end
