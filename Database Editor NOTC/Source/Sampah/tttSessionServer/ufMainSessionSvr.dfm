object frmMainSessionSvr: TfrmMainSessionSvr
  Left = 417
  Top = 167
  Caption = 'Session Server'
  ClientHeight = 336
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 104
  TextHeight = 14
  object pnlTOP: TPanel
    Left = 0
    Top = 0
    Width = 453
    Height = 44
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 8
      Width = 170
      Height = 23
      Caption = 'Tactical Team Trainer '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object Label2: TLabel
      Left = 209
      Top = 8
      Width = 115
      Height = 23
      Caption = ' Session Server'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object Panel4: TPanel
      Left = 362
      Top = 0
      Width = 87
      Height = 40
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object spbOnline: TSpeedButton
        Left = 9
        Top = 9
        Width = 71
        Height = 27
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Online'
        OnClick = spbOnlineClick
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 121
    Width = 453
    Height = 196
    Align = alClient
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 142
    ExplicitHeight = 175
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 449
      Height = 192
      ActivePage = tsLogs
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 171
      object tsClients: TTabSheet
        Caption = 'Clients'
        ExplicitHeight = 142
        object lvConnection: TListView
          Left = 0
          Top = 0
          Width = 441
          Height = 163
          Align = alClient
          Columns = <
            item
              Width = 103
            end
            item
              Width = 54
            end
            item
              Width = 54
            end
            item
              Width = 54
            end>
          TabOrder = 0
          ViewStyle = vsReport
          ExplicitHeight = 142
        end
      end
      object tsLogs: TTabSheet
        Caption = 'Logs'
        ImageIndex = 1
        ExplicitHeight = 142
        object mmLogs: TMemo
          Left = 0
          Top = 0
          Width = 441
          Height = 163
          Margins.Left = 5
          Margins.Top = 5
          Margins.Right = 5
          Margins.Bottom = 5
          Align = alClient
          DoubleBuffered = True
          Lines.Strings = (
            'Welcome to Tactical Team Trainer')
          ParentDoubleBuffered = False
          ReadOnly = True
          TabOrder = 0
          WordWrap = False
          ExplicitHeight = 142
        end
      end
      object tsNetLog: TTabSheet
        Caption = 'tsNetLog'
        ImageIndex = 2
        ExplicitHeight = 142
        object tvClientLogs: TTreeView
          Left = 0
          Top = 0
          Width = 441
          Height = 163
          Align = alClient
          DoubleBuffered = True
          Indent = 19
          ParentDoubleBuffered = False
          RowSelect = True
          TabOrder = 0
          ExplicitHeight = 142
        end
      end
    end
  end
  object sBar: TStatusBar
    Left = 0
    Top = 317
    Width = 453
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
  end
  object pnlSession: TPanel
    Left = 0
    Top = 44
    Width = 453
    Height = 77
    Align = alTop
    BevelKind = bkTile
    BevelOuter = bvNone
    TabOrder = 3
    object Label3: TLabel
      Left = 18
      Top = 8
      Width = 72
      Height = 19
      Caption = 'Scenario ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object Label4: TLabel
      Left = 18
      Top = 33
      Width = 95
      Height = 19
      Caption = 'Exercise Name '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object lblSession: TLabel
      Left = 186
      Top = 6
      Width = 6
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = 'Tahoma'
      Font.Style = []
      GlowSize = 1
      ParentFont = False
    end
    object edExerciseName: TEdit
      Left = 119
      Top = 36
      Width = 218
      Height = 22
      ReadOnly = True
      TabOrder = 0
      Text = '123'
    end
    object edScenarioID: TEdit
      Left = 119
      Top = 8
      Width = 42
      Height = 22
      ReadOnly = True
      TabOrder = 1
      Text = '123'
    end
  end
end
