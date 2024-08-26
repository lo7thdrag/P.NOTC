object GroupAllocationWindowForm: TGroupAllocationWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Group in TestScenario'
  ClientHeight = 666
  ClientWidth = 552
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 665
    Align = alTop
    TabOrder = 0
    object lblName: TLabel
      Left = 24
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Name :'
    end
    object lblZuluZulu: TLabel
      Left = 24
      Top = 54
      Width = 44
      Height = 13
      Caption = 'Zulu-Zulu'
    end
    object lblForce: TLabel
      Left = 24
      Top = 109
      Width = 27
      Height = 13
      Caption = 'Force'
    end
    object btnBrowse: TSpeedButton
      Left = 456
      Top = 73
      Width = 23
      Height = 22
      Caption = '...'
    end
    object edtName: TEdit
      Left = 24
      Top = 27
      Width = 426
      Height = 21
      TabOrder = 0
    end
    object edtZuluZulu: TEdit
      Left = 24
      Top = 73
      Width = 426
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edtForce: TEdit
      Left = 95
      Top = 105
      Width = 47
      Height = 21
      TabOrder = 2
    end
    object grbTrackBlockRange: TGroupBox
      Left = 24
      Top = 147
      Width = 426
      Height = 70
      Caption = 'Track Block Range'
      TabOrder = 3
      object lblStart: TLabel
        Left = 16
        Top = 36
        Width = 31
        Height = 13
        Caption = 'Start :'
      end
      object lblEnd: TLabel
        Left = 208
        Top = 36
        Width = 25
        Height = 13
        Caption = 'End :'
      end
      object edtStart: TEdit
        Left = 71
        Top = 32
        Width = 49
        Height = 21
        TabOrder = 0
      end
      object edtEnd: TEdit
        Left = 256
        Top = 32
        Width = 57
        Height = 21
        TabOrder = 1
      end
    end
    object grbMembers: TGroupBox
      Left = 24
      Top = 233
      Width = 515
      Height = 183
      Caption = 'Members'
      TabOrder = 4
      object btnAddMembers: TButton
        Left = 432
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Add...'
        Enabled = False
        TabOrder = 0
        OnClick = btnAddMembersClick
      end
      object btnRemoveMembers: TButton
        Left = 432
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Remove'
        Enabled = False
        TabOrder = 1
        OnClick = btnRemoveMembersClick
      end
      object btnMoveUpMembers: TButton
        Left = 432
        Top = 104
        Width = 75
        Height = 25
        Caption = 'Move Up'
        Enabled = False
        TabOrder = 2
        OnClick = btnMoveUpMembersClick
      end
      object btnMoveDownMembers: TButton
        Left = 432
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Move Down'
        Enabled = False
        TabOrder = 3
        OnClick = btnMoveDownMembersClick
      end
      object lstMembers: TListView
        Left = 16
        Top = 16
        Width = 410
        Height = 145
        Columns = <
          item
            Caption = 'Command Priority'
            MaxWidth = 205
            Width = 205
          end
          item
            Caption = 'Member Name'
            MaxWidth = 205
            Width = 205
          end>
        ColumnClick = False
        GridLines = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
        OnChange = lstMembersChange
        OnClick = lstMembersClick
      end
    end
    object grbExternalComm: TGroupBox
      Left = 24
      Top = 433
      Width = 515
      Height = 183
      Caption = 'External Communication Channels'
      TabOrder = 5
      object btnAddExternalComm: TButton
        Left = 432
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Add...'
        Enabled = False
        TabOrder = 0
        OnClick = btnAddExternalCommClick
      end
      object btnRemoveExternalComm: TButton
        Left = 432
        Top = 64
        Width = 75
        Height = 25
        Caption = 'Remove'
        Enabled = False
        TabOrder = 1
        OnClick = btnRemoveExternalCommClick
      end
      object btnMoveUpExternalComm: TButton
        Left = 432
        Top = 104
        Width = 75
        Height = 25
        Caption = 'Move Up'
        Enabled = False
        TabOrder = 2
        OnClick = btnMoveUpExternalCommClick
      end
      object btnMoveDownExternalComm: TButton
        Left = 432
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Move Down'
        Enabled = False
        TabOrder = 3
        OnClick = btnMoveDownExternalCommClick
      end
      object lstExternallComm: TListView
        Left = 16
        Top = 21
        Width = 410
        Height = 145
        Columns = <
          item
            Caption = 'Channel'
            MaxWidth = 136
            Width = 136
          end
          item
            Caption = 'Channel Number'
            MaxWidth = 136
            Width = 136
          end
          item
            Caption = 'Channel Name'
            MaxWidth = 136
            Width = 136
          end>
        ColumnClick = False
        GridLines = True
        RowSelect = True
        TabOrder = 4
        ViewStyle = vsReport
        OnChange = lstExternallCommChange
        OnClick = lstExternallCommClick
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 622
    Width = 552
    Height = 44
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 464
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 372
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
end
