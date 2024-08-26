object frmWaypointWindow: TfrmWaypointWindow
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Waypoint List'
  ClientHeight = 467
  ClientWidth = 340
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvWaypoint: TListView
    Left = 0
    Top = 0
    Width = 337
    Height = 399
    Columns = <
      item
        Caption = 'No'
        Width = 30
      end
      item
        Caption = 'WAYPOINT NAME'
        Width = 300
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lvWaypointClick
  end
  object btnCopy: TButton
    Left = 88
    Top = 405
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 1
    OnClick = btnCopyClick
  end
  object btnUsage: TButton
    Left = 173
    Top = 436
    Width = 75
    Height = 25
    Caption = 'Usage'
    TabOrder = 2
    OnClick = btnUsageClick
  end
  object btnCancel: TButton
    Left = 258
    Top = 436
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnRemove: TButton
    Left = 259
    Top = 405
    Width = 75
    Height = 25
    Caption = 'Remove'
    TabOrder = 4
    OnClick = btnRemoveClick
  end
  object btnNew: TButton
    Left = 3
    Top = 405
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 5
    OnClick = btnNewClick
  end
  object btnEdit: TButton
    Left = 173
    Top = 405
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 6
    OnClick = btnEditClick
  end
  object chkShow: TCheckBox
    Left = 13
    Top = 440
    Width = 54
    Height = 17
    Caption = 'Show'
    TabOrder = 7
    OnClick = chkShowClick
  end
  object chkShowAll: TCheckBox
    Left = 86
    Top = 440
    Width = 69
    Height = 17
    Caption = 'Show all'
    TabOrder = 8
    OnClick = chkShowAllClick
  end
end
