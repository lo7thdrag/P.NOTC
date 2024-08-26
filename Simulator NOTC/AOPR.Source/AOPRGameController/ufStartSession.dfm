object frmStartSession: TfrmStartSession
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  BorderWidth = 20
  Caption = 'Start Session'
  ClientHeight = 586
  ClientWidth = 564
  Color = 5980694
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object lvScenario: TListView
    Left = 0
    Top = 0
    Width = 564
    Height = 544
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 300
      end
      item
        Alignment = taCenter
        Caption = 'Type'
        Width = 80
      end
      item
        Alignment = taCenter
        Caption = 'Date / Time'
        Width = 150
      end
      item
        Width = 0
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvScenarioChange
    OnSelectItem = lvScenarioSelectItem
  end
  object Panel1: TPanel
    Left = 0
    Top = 544
    Width = 564
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCancel: TButton
      Left = 489
      Top = 14
      Width = 75
      Height = 25
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 408
      Top = 14
      Width = 75
      Height = 25
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
end
