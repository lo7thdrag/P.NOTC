object FormationEditorForm: TFormationEditorForm
  Left = 0
  Top = 0
  Caption = 'Formation'
  ClientHeight = 379
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFormation: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 337
    Align = alTop
    TabOrder = 0
    object lblSelected: TLabel
      Left = 392
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Selected'
    end
    object lblAvailable: TLabel
      Left = 8
      Top = 8
      Width = 43
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'Available'
      ParentBiDiMode = False
    end
    object lstSelectedIndex: TListBox
      Left = 392
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 9
    end
    object lstAvailableIndex: TListBox
      Left = 8
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 8
    end
    object lstAvailable: TListBox
      Left = 8
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 7
      OnClick = lstAvailableClick
    end
    object lstSelected: TListBox
      Left = 392
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 0
    end
    object btnEdit2: TButton
      Left = 598
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Edit...'
      TabOrder = 1
      OnClick = btnEdit2Click
    end
    object btnRemove: TButton
      Left = 517
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 2
      OnClick = btnRemoveClick
    end
    object btnEdit: TButton
      Left = 170
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Edit...'
      TabOrder = 3
      OnClick = btnEditClick
    end
    object btnCopy: TButton
      Left = 89
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Copy...'
      TabOrder = 4
    end
    object btnNew: TButton
      Left = 8
      Top = 307
      Width = 75
      Height = 25
      Caption = 'New...'
      TabOrder = 5
      OnClick = btnNewClick
    end
    object btnAdd: TButton
      Left = 303
      Top = 138
      Width = 75
      Height = 25
      Caption = 'Add ->'
      TabOrder = 6
      OnClick = btnAddClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 683
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnClose: TButton
      Left = 598
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnFilter: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Filter >>'
      TabOrder = 1
      OnClick = btnFilterClick
    end
  end
end
