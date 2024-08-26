object frmMainSessionSvr: TfrmMainSessionSvr
  Left = 417
  Top = 167
  Caption = 'Session Server'
  ClientHeight = 704
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTOP: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 41
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 421
    object Label2: TLabel
      Left = 17
      Top = 7
      Width = 110
      Height = 21
      Caption = ' Session Server'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 256
      Top = 0
      Width = 81
      Height = 37
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 336
      object spbOnline: TSpeedButton
        Left = 8
        Top = 8
        Width = 66
        Height = 25
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Online'
        OnClick = spbOnlineClick
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 112
    Width = 341
    Height = 573
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 421
    ExplicitHeight = 181
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 337
      Height = 569
      ActivePage = tsClients
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 417
      ExplicitHeight = 177
      object tsClients: TTabSheet
        Caption = 'Clients'
        ExplicitWidth = 409
        ExplicitHeight = 149
        object lvConnection: TListView
          Left = 0
          Top = 0
          Width = 329
          Height = 541
          Align = alClient
          Columns = <
            item
              Width = 120
            end
            item
              Alignment = taCenter
              Width = 100
            end
            item
              Alignment = taCenter
              Width = 100
            end
            item
              Width = 0
            end>
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
          OnCompare = lvConnectionCompare
          ExplicitWidth = 409
          ExplicitHeight = 483
        end
      end
      object tsLogs: TTabSheet
        Caption = 'Logs'
        ImageIndex = 1
        ExplicitWidth = 409
        ExplicitHeight = 149
        object mmLogs: TMemo
          Left = 0
          Top = 0
          Width = 329
          Height = 541
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          DoubleBuffered = True
          Lines.Strings = (
            '')
          ParentDoubleBuffered = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          ExplicitWidth = 409
          ExplicitHeight = 149
        end
      end
      object tsNetLog: TTabSheet
        Caption = 'tsNetLog'
        ImageIndex = 2
        ExplicitWidth = 409
        ExplicitHeight = 149
        object tvClientLogs: TTreeView
          Left = 0
          Top = 0
          Width = 329
          Height = 541
          Align = alClient
          DoubleBuffered = True
          Indent = 19
          ParentDoubleBuffered = False
          RowSelect = True
          TabOrder = 0
          ExplicitWidth = 409
          ExplicitHeight = 149
        end
      end
    end
  end
  object sBar: TStatusBar
    Left = 0
    Top = 685
    Width = 341
    Height = 19
    Panels = <
      item
        Width = 150
      end
      item
        Width = 80
      end
      item
        Width = 50
      end>
    ExplicitTop = 293
    ExplicitWidth = 421
  end
  object pnlSession: TPanel
    Left = 0
    Top = 41
    Width = 341
    Height = 71
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 421
    object Label3: TLabel
      Left = 17
      Top = 7
      Width = 68
      Height = 18
      Caption = 'Scenario ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 31
      Width = 90
      Height = 18
      Caption = 'Exercise Name '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object lblSession: TLabel
      Left = 173
      Top = 6
      Width = 6
      Height = 18
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object edExerciseName: TEdit
      Left = 111
      Top = 33
      Width = 202
      Height = 21
      ReadOnly = True
      TabOrder = 0
      Text = '123'
    end
    object edScenarioID: TEdit
      Left = 111
      Top = 7
      Width = 39
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = '123'
    end
  end
end
