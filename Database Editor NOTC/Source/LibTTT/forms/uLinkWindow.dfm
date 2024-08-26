object LinkWindowForm: TLinkWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Link in TestScenario'
  ClientHeight = 561
  ClientWidth = 549
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 549
    Height = 513
    Align = alTop
    TabOrder = 0
    object lblIdentifierNumber: TLabel
      Left = 24
      Top = 24
      Width = 91
      Height = 13
      Caption = 'Identifier Number :'
    end
    object lblName: TLabel
      Left = 24
      Top = 56
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object lblController: TLabel
      Left = 24
      Top = 102
      Width = 54
      Height = 13
      Caption = 'Controller :'
    end
    object lblForce: TLabel
      Left = 24
      Top = 160
      Width = 34
      Height = 13
      Caption = 'Force :'
    end
    object lblMode: TLabel
      Left = 24
      Top = 208
      Width = 33
      Height = 13
      Caption = 'Mode :'
    end
    object btnBrowse: TSpeedButton
      Left = 511
      Top = 120
      Width = 23
      Height = 22
      Caption = '...'
    end
    object cbxIdentifierNumber: TComboBox
      Left = 144
      Top = 21
      Width = 97
      Height = 21
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 24
      Top = 75
      Width = 481
      Height = 21
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
    end
    object edtController: TEdit
      Left = 24
      Top = 121
      Width = 481
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edtForce: TEdit
      Left = 144
      Top = 160
      Width = 65
      Height = 21
      TabOrder = 3
    end
    object cbxMode: TComboBox
      Left = 144
      Top = 205
      Width = 97
      Height = 21
      TabOrder = 4
    end
    object grbParticipants: TGroupBox
      Left = 24
      Top = 240
      Width = 513
      Height = 264
      Caption = 'Participants'
      TabOrder = 5
      object btnAdd: TButton
        Left = 431
        Top = 32
        Width = 75
        Height = 25
        Caption = 'Add...'
        TabOrder = 0
        OnClick = btnAddClick
      end
      object btnRemove: TButton
        Left = 431
        Top = 71
        Width = 75
        Height = 25
        Caption = 'Remove'
        TabOrder = 1
        OnClick = btnRemoveClick
      end
      object lstParticipants: TListView
        Left = 15
        Top = 24
        Width = 410
        Height = 225
        Columns = <
          item
            Caption = 'Participants Name'
            MaxWidth = 205
            Width = 205
          end
          item
            Caption = 'Octal PU Code'
            MaxWidth = 205
            Width = 205
          end>
        ColumnClick = False
        GridLines = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 520
    Width = 549
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNew: TButton
      Left = 24
      Top = 9
      Width = 75
      Height = 25
      Caption = 'New'
      TabOrder = 0
    end
    object btnApply: TButton
      Left = 116
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
    end
    object btnRemove2: TButton
      Left = 208
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 2
    end
    object btnCancel: TButton
      Left = 462
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 3
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 374
      Top = 9
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 4
    end
  end
end
