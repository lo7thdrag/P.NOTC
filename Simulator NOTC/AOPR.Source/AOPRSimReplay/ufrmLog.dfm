object frmReplay: TfrmReplay
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Replay'
  ClientHeight = 239
  ClientWidth = 421
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 191
    Width = 26
    Height = 13
    Caption = 'State'
  end
  object Label2: TLabel
    Left = 9
    Top = 207
    Width = 30
    Height = 13
    Caption = 'Speed'
  end
  object Label3: TLabel
    Left = 9
    Top = 223
    Width = 22
    Height = 13
    Caption = 'Time'
  end
  object lblGameTime: TLabel
    Left = 57
    Top = 223
    Width = 22
    Height = 13
    Caption = 'Time'
  end
  object lblGameSpeed: TLabel
    Left = 57
    Top = 207
    Width = 6
    Height = 13
    Caption = '0'
  end
  object lblGameState: TLabel
    Left = 57
    Top = 191
    Width = 40
    Height = 13
    Caption = 'Stopped'
  end
  object lbl1: TLabel
    Left = 8
    Top = 245
    Width = 59
    Height = 13
    Caption = 'Jump To... :'
  end
  object lblMaxTime: TLabel
    Left = 191
    Top = 245
    Width = 34
    Height = 13
    Caption = '( Max )'
  end
  object btnPlay: TButton
    Left = 8
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Play'
    TabOrder = 0
    OnClick = btnPlayClick
  end
  object btnStop: TButton
    Left = 89
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = btnStopClick
  end
  object Button3: TButton
    Left = 170
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Fast'
    TabOrder = 2
    Visible = False
    OnClick = Button3Click
  end
  object btnRewind: TButton
    Left = 251
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Rewind'
    TabOrder = 3
    OnClick = btnRewindClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 421
    Height = 185
    ActivePage = TabSheet1
    Align = alTop
    TabOrder = 4
    object Log: TTabSheet
      Caption = 'Log'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object mmLog: TMemo
        Left = 0
        Top = 0
        Width = 413
        Height = 157
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Frame Event'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Memo1: TMemo
        Left = 0
        Top = 0
        Width = 413
        Height = 157
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        DoubleBuffered = True
        ParentDoubleBuffered = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Platforms'
      ImageIndex = 2
    end
  end
  object medtedt1: TMaskEdit
    Left = 64
    Top = 241
    Width = 64
    Height = 21
    Alignment = taCenter
    EditMask = '!90:00:00;1;_'
    MaxLength = 8
    TabOrder = 5
    Text = '00:05:00'
  end
  object btnJump: TButton
    Left = 135
    Top = 239
    Width = 50
    Height = 25
    Caption = 'Go..'
    TabOrder = 6
    OnClick = btnJumpClick
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 328
    Top = 192
  end
end
