object fRadarIntervalSetup: TfRadarIntervalSetup
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'TestRadarInterval'
  ClientHeight = 355
  ClientWidth = 477
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
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 477
    Height = 233
    Align = alClient
    TabOrder = 0
    object ListView1: TListView
      Left = 16
      Top = 6
      Width = 362
      Height = 211
      Columns = <
        item
          Caption = 'Priority'
          Width = 70
        end
        item
          Alignment = taCenter
          Caption = 'State'
          Width = 70
        end
        item
          Alignment = taCenter
          Caption = 'Number of Scans'
          Width = 110
        end
        item
          Alignment = taCenter
          Caption = 'Time Interval'
          Width = 105
        end>
      GridLines = True
      HideSelection = False
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ListView1Click
      OnSelectItem = ListView1SelectItem
    end
    object btnRemove: TButton
      Left = 384
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 1
      OnClick = btnRemoveClick
    end
    object btnMoveUp: TButton
      Left = 384
      Top = 37
      Width = 75
      Height = 25
      Caption = 'Move Up'
      TabOrder = 2
      OnClick = btnMoveUpClick
    end
    object btnMoveDown: TButton
      Left = 384
      Top = 68
      Width = 75
      Height = 25
      Caption = 'Move Down'
      TabOrder = 3
      OnClick = btnMoveDownClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 477
    Height = 81
    Align = alTop
    TabOrder = 1
    object lblRadarIntervals: TStaticText
      Left = 16
      Top = 16
      Width = 86
      Height = 17
      Caption = 'Radar Intervals :'
      TabOrder = 0
    end
    object cbxRadarIntervals: TComboBox
      Left = 32
      Top = 31
      Width = 73
      Height = 21
      TabOrder = 1
      OnSelect = cbxRadarIntervalsSelect
      Items.Strings = (
        'On'
        'Off')
    end
    object lblNumberOfScans: TStaticText
      Left = 136
      Top = 33
      Width = 92
      Height = 17
      Caption = 'Number of Scans :'
      TabOrder = 2
    end
    object edtNumberOfScans: TEdit
      Left = 234
      Top = 31
      Width = 49
      Height = 21
      TabOrder = 3
      OnKeyPress = edtNumberOfScansKeyPress
      OnKeyUp = edtNumberOfScansKeyUp
    end
    object lblTimeInterval: TStaticText
      Left = 136
      Top = 58
      Width = 74
      Height = 17
      Caption = 'Time Interval :'
      Enabled = False
      TabOrder = 4
    end
    object edtTimeInterval: TEdit
      Left = 234
      Top = 56
      Width = 49
      Height = 21
      Enabled = False
      TabOrder = 5
      OnKeyPress = edtTimeIntervalKeyPress
      OnKeyUp = edtTimeIntervalKeyUp
    end
    object lblSeconds: TStaticText
      Left = 289
      Top = 58
      Width = 43
      Height = 17
      Caption = 'seconds'
      Enabled = False
      TabOrder = 6
    end
    object btnAdd: TButton
      Left = 384
      Top = 29
      Width = 75
      Height = 25
      Caption = 'Add'
      TabOrder = 7
      OnClick = btnAddClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 314
    Width = 477
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnApply: TButton
      Left = 303
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 220
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 137
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
end