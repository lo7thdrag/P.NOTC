object fmGroupPersonel: TfmGroupPersonel
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Personel '
  ClientHeight = 421
  ClientWidth = 889
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvBrigade: TListView
    Left = 8
    Top = 8
    Width = 321
    Height = 347
    Columns = <
      item
        Caption = 'No'
        Width = 0
      end
      item
        Caption = 'Brigade Name'
        Width = 300
      end
      item
        Caption = 'Index Brigade'
        Width = 0
      end>
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvBrigadeSelectItem
  end
  object grpCreateBrigade: TGroupBox
    Left = 400
    Top = 2
    Width = 323
    Height = 417
    TabOrder = 0
    object lbl4: TLabel
      Left = 18
      Top = 25
      Width = 73
      Height = 13
      Caption = 'Brigade Name :'
    end
    object Label5: TLabel
      Left = 18
      Top = 70
      Width = 82
      Height = 13
      Caption = 'Batalyon Name : '
    end
    object btnOk: TSpeedButton
      Tag = 4
      Left = 148
      Top = 383
      Width = 75
      Height = 25
      Hint = 'Create New Templates'
      Caption = 'Ok'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnHandle
    end
    object btnCancel: TSpeedButton
      Tag = 5
      Left = 229
      Top = 383
      Width = 75
      Height = 25
      Hint = 'Edit Templates'
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btnHandle
    end
    object lbllstupdatedP: TLabel
      Left = 149
      Top = 7
      Width = 15
      Height = 11
      Caption = '- - -'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 87
      Top = 7
      Width = 56
      Height = 11
      Caption = 'last updated :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object edtNameBrigade: TEdit
      Left = 18
      Top = 43
      Width = 286
      Height = 21
      TabOrder = 0
    end
    object edtNameBatalyon: TEdit
      Left = 18
      Top = 89
      Width = 169
      Height = 21
      TabOrder = 1
      Text = 'Yon 1'
    end
    object btnCreate: TButton
      Left = 190
      Top = 87
      Width = 50
      Height = 25
      Caption = 'Create'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnCreateClick
    end
    object tvPersonel: TTreeView
      Left = 18
      Top = 118
      Width = 286
      Height = 259
      DoubleBuffered = True
      Indent = 19
      ParentDoubleBuffered = False
      ReadOnly = True
      TabOrder = 3
      OnEdited = tvPersonelEdited
      OnMouseDown = tvPersonelMouseDown
    end
  end
  object btNew: TButton
    Left = 7
    Top = 361
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 2
    OnClick = btnHandle
  end
  object btCopy: TButton
    Tag = 6
    Left = 89
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Copy'
    Enabled = False
    TabOrder = 3
    OnClick = btnHandle
  end
  object btEdit: TButton
    Tag = 1
    Left = 171
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 4
    OnClick = btnHandle
  end
  object btRemove: TButton
    Tag = 2
    Left = 253
    Top = 361
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 5
    OnClick = btnHandle
  end
  object btClose: TButton
    Tag = 3
    Left = 253
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btnHandle
  end
  object btUsage: TButton
    Tag = 7
    Left = 171
    Top = 391
    Width = 75
    Height = 25
    Caption = 'Usage'
    Enabled = False
    TabOrder = 7
    OnClick = btnHandle
  end
  object pmEmbarked: TPopupMenu
    AutoLineReduction = maManual
    Left = 216
    Top = 56
    object Rename: TMenuItem
      Caption = '&Rename'
      OnClick = RenameClick
    end
    object Delete: TMenuItem
      Tag = 1
      Caption = '&Delete'
      OnClick = DeleteClick
    end
    object Add: TMenuItem
      Caption = '&Add'
      OnClick = AddClick
    end
    object Quantity: TMenuItem
      Caption = '&Quantity'
      OnClick = QuantityClick
    end
  end
end
