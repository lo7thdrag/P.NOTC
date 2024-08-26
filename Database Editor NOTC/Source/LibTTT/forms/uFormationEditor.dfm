object FormationEditorForm: TFormationEditorForm
  Left = 0
  Top = 0
  Caption = 'Formation'
  ClientHeight = 379
  ClientWidth = 299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFormation: TPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 337
    Align = alTop
    TabOrder = 0
    object lstAvailableIndex: TListBox
      Left = 8
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 4
    end
    object lstAvailable: TListBox
      Left = 8
      Top = 8
      Width = 281
      Height = 293
      ItemHeight = 13
      TabOrder = 3
    end
    object btnEdit: TButton
      Left = 133
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Edit...'
      TabOrder = 0
      OnClick = btnEditClick
    end
    object btnRemove: TButton
      Left = 214
      Top = 307
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 1
      OnClick = btnRemoveClick
    end
    object btnNew: TButton
      Left = 8
      Top = 307
      Width = 75
      Height = 25
      Caption = 'New...'
      TabOrder = 2
      OnClick = btnNewClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 338
    Width = 299
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnFilter: TButton
      Left = 8
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Filter >>'
      TabOrder = 0
      Visible = False
      OnClick = btnFilterClick
    end
    object btnClose: TButton
      Left = 214
      Top = 5
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = btnCloseClick
    end
  end
end
