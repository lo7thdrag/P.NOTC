object DoublePicklistForm: TDoublePicklistForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Motion'
  ClientHeight = 376
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMotion: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 337
    Align = alTop
    TabOrder = 0
    object lblSelected: TLabel
      Left = 392
      Top = 8
      Width = 51
      Height = 13
      Caption = 'lblSelected'
    end
    object lblAvailable: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      BiDiMode = bdLeftToRight
      Caption = 'lblAvailable'
      ParentBiDiMode = False
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
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Edit...'
      TabOrder = 1
    end
    object btnRemove: TButton
      Left = 517
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 2
    end
    object btnEdit: TButton
      Left = 170
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Edit...'
      TabOrder = 3
    end
    object btnCopy: TButton
      Left = 89
      Top = 304
      Width = 75
      Height = 25
      Caption = 'Copy...'
      TabOrder = 4
    end
    object btnNew: TButton
      Left = 8
      Top = 304
      Width = 75
      Height = 25
      Caption = 'New...'
      TabOrder = 5
    end
    object btnAdd: TButton
      Left = 303
      Top = 138
      Width = 75
      Height = 25
      Caption = 'Add ->'
      TabOrder = 6
    end
    object lstAvailable: TListBox
      Left = 8
      Top = 27
      Width = 281
      Height = 262
      ItemHeight = 13
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 683
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnClose: TButton
      Left = 600
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
    end
    object btnFilter: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Filter >>'
      TabOrder = 1
    end
  end
end
