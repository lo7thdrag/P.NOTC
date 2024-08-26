object AccousticDecoyProb: TAccousticDecoyProb
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Accoustic Decoy'
  ClientHeight = 322
  ClientWidth = 476
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
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 476
    Height = 322
    Align = alClient
    TabOrder = 0
    object btnApply: TButton
      Left = 389
      Top = 286
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 308
      Top = 286
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 227
      Top = 286
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
    object grdpnl1: TGridPanel
      Left = 8
      Top = 8
      Width = 456
      Height = 272
      ColumnCollection = <
        item
          Value = 100.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end>
      ControlCollection = <
        item
          Column = -1
          Row = 7
        end
        item
          Column = 1
          ColumnSpan = 4
          Control = pnl01
          Row = 0
        end
        item
          Column = 0
          Control = pnl1
          Row = 1
        end
        item
          Column = 1
          Control = pnl_BZone1
          Row = 1
        end
        item
          Column = 2
          Control = pnl_BZone2
          Row = 1
        end
        item
          Column = 3
          Control = pnl_BZone3
          Row = 1
        end
        item
          Column = 4
          Control = pnl_BZone4
          Row = 1
        end
        item
          Column = 0
          Control = pnl2
          Row = 2
        end
        item
          Column = 1
          Control = edtActive1
          Row = 2
        end
        item
          Column = 2
          Control = edtActive2
          Row = 2
        end
        item
          Column = 3
          Control = edtActive3
          Row = 2
        end
        item
          Column = 4
          Control = edtActive4
          Row = 2
        end
        item
          Column = 0
          Control = pnl4
          Row = 3
        end
        item
          Column = 1
          Control = edtPassive1
          Row = 3
        end
        item
          Column = 2
          Control = edtPassive2
          Row = 3
        end
        item
          Column = 3
          Control = edtPassive3
          Row = 3
        end
        item
          Column = 4
          Control = edtPassive4
          Row = 3
        end
        item
          Column = 0
          Control = pnl5
          Row = 4
        end
        item
          Column = 1
          Control = edtActivePassive1
          Row = 4
        end
        item
          Column = 2
          Control = edtActivePassive2
          Row = 4
        end
        item
          Column = 3
          Control = edtActivePassive3
          Row = 4
        end
        item
          Column = 4
          Control = edtActivePassive4
          Row = 4
        end
        item
          Column = 0
          Control = pnl6
          Row = 5
        end
        item
          Column = 1
          Control = edtWireGuided1
          Row = 5
        end
        item
          Column = 2
          Control = edtWireGuided2
          Row = 5
        end
        item
          Column = 3
          Control = edtWireGuided3
          Row = 5
        end
        item
          Column = 4
          Control = edtWireGuided4
          Row = 5
        end
        item
          Column = 0
          Control = pnl7
          Row = 6
        end
        item
          Column = 1
          Control = edtWakeHoming1
          Row = 6
        end
        item
          Column = 2
          Control = edtWakeHoming2
          Row = 6
        end
        item
          Column = 3
          Control = edtWakeHoming3
          Row = 6
        end
        item
          Column = 4
          Control = edtWakeHoming4
          Row = 6
        end
        item
          Column = 0
          Control = pnl8
          Row = 0
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      RowCollection = <
        item
          Value = 14.405527864610430000
        end
        item
          SizeStyle = ssAbsolute
          Value = 80.000000000000000000
        end
        item
          Value = 18.413095429693590000
        end
        item
          Value = 15.805644173486240000
        end
        item
          Value = 15.993765987746990000
        end
        item
          Value = 16.848555497363210000
        end
        item
          Value = 18.533411047099530000
        end
        item
          SizeStyle = ssAuto
        end>
      TabOrder = 3
      object pnl01: TPanel
        Left = 135
        Top = 3
        Width = 318
        Height = 25
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Aspect'
        TabOrder = 0
      end
      object pnl1: TPanel
        Left = 3
        Top = 30
        Width = 130
        Height = 78
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Guidance Type'
        TabOrder = 1
      end
      object pnl_BZone1: TPanel
        Left = 135
        Top = 30
        Width = 78
        Height = 78
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 2
      end
      object pnl_BZone2: TPanel
        Left = 215
        Top = 30
        Width = 78
        Height = 78
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 3
      end
      object pnl_BZone3: TPanel
        Left = 295
        Top = 30
        Width = 78
        Height = 78
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 4
      end
      object pnl_BZone4: TPanel
        Left = 375
        Top = 30
        Width = 78
        Height = 78
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 5
      end
      object pnl2: TPanel
        Left = 3
        Top = 110
        Width = 130
        Height = 32
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Active Accoustic'
        TabOrder = 6
      end
      object edtActive1: TEdit
        Left = 135
        Top = 110
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 7
        OnKeyPress = edtActive1KeyPress
        ExplicitHeight = 21
      end
      object edtActive2: TEdit
        Left = 215
        Top = 110
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 8
        OnKeyPress = edtActive2KeyPress
        ExplicitHeight = 21
      end
      object edtActive3: TEdit
        Left = 295
        Top = 110
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 9
        OnKeyPress = edtActive3KeyPress
        ExplicitHeight = 21
      end
      object edtActive4: TEdit
        Left = 375
        Top = 110
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 10
        OnKeyPress = edtActive4KeyPress
        ExplicitHeight = 21
      end
      object pnl4: TPanel
        Left = 3
        Top = 144
        Width = 130
        Height = 27
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Passive Accoustic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object edtPassive1: TEdit
        Left = 135
        Top = 144
        Width = 78
        Height = 27
        Align = alClient
        TabOrder = 12
        OnKeyPress = edtPassive1KeyPress
        ExplicitHeight = 21
      end
      object edtPassive2: TEdit
        Left = 215
        Top = 144
        Width = 78
        Height = 27
        Align = alClient
        TabOrder = 13
        OnKeyPress = edtPassive2KeyPress
        ExplicitHeight = 21
      end
      object edtPassive3: TEdit
        Left = 295
        Top = 144
        Width = 78
        Height = 27
        Align = alClient
        TabOrder = 14
        OnKeyPress = edtPassive3KeyPress
        ExplicitHeight = 21
      end
      object edtPassive4: TEdit
        Left = 375
        Top = 144
        Width = 78
        Height = 27
        Align = alClient
        TabOrder = 15
        OnKeyPress = edtPassive4KeyPress
        ExplicitHeight = 21
      end
      object pnl5: TPanel
        Left = 3
        Top = 173
        Width = 130
        Height = 28
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Active/Passive Accoustic'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 16
      end
      object edtActivePassive1: TEdit
        Left = 135
        Top = 173
        Width = 78
        Height = 28
        Align = alClient
        TabOrder = 17
        OnKeyPress = edtActivePassive1KeyPress
        ExplicitHeight = 21
      end
      object edtActivePassive2: TEdit
        Left = 215
        Top = 173
        Width = 78
        Height = 28
        Align = alClient
        TabOrder = 18
        OnKeyPress = edtActivePassive2KeyPress
        ExplicitHeight = 21
      end
      object edtActivePassive3: TEdit
        Left = 295
        Top = 173
        Width = 78
        Height = 28
        Align = alClient
        TabOrder = 19
        OnKeyPress = edtActivePassive3KeyPress
        ExplicitHeight = 21
      end
      object edtActivePassive4: TEdit
        Left = 375
        Top = 173
        Width = 78
        Height = 28
        Align = alClient
        TabOrder = 20
        OnKeyPress = edtActivePassive4KeyPress
        ExplicitHeight = 21
      end
      object pnl6: TPanel
        Left = 3
        Top = 203
        Width = 130
        Height = 29
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Wire Guided'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 21
      end
      object edtWireGuided1: TEdit
        Left = 135
        Top = 203
        Width = 78
        Height = 29
        Align = alClient
        TabOrder = 22
        OnKeyPress = edtWireGuided1KeyPress
        ExplicitHeight = 21
      end
      object edtWireGuided2: TEdit
        Left = 215
        Top = 203
        Width = 78
        Height = 29
        Align = alClient
        TabOrder = 23
        OnKeyPress = edtWireGuided2KeyPress
        ExplicitHeight = 21
      end
      object edtWireGuided3: TEdit
        Left = 295
        Top = 203
        Width = 78
        Height = 29
        Align = alClient
        TabOrder = 24
        OnKeyPress = edtWireGuided3KeyPress
        ExplicitHeight = 21
      end
      object edtWireGuided4: TEdit
        Left = 375
        Top = 203
        Width = 78
        Height = 29
        Align = alClient
        TabOrder = 25
        OnKeyPress = edtWireGuided4KeyPress
        ExplicitHeight = 21
      end
      object pnl7: TPanel
        Left = 3
        Top = 234
        Width = 130
        Height = 32
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Wake Homing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 26
      end
      object edtWakeHoming1: TEdit
        Left = 135
        Top = 234
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 27
        OnKeyPress = edtWakeHoming1KeyPress
        ExplicitHeight = 21
      end
      object edtWakeHoming2: TEdit
        Left = 215
        Top = 234
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 28
        OnKeyPress = edtWakeHoming2KeyPress
        ExplicitHeight = 21
      end
      object edtWakeHoming3: TEdit
        Left = 295
        Top = 234
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 29
        OnKeyPress = edtWakeHoming3KeyPress
        ExplicitHeight = 21
      end
      object edtWakeHoming4: TEdit
        Left = 375
        Top = 234
        Width = 78
        Height = 32
        Align = alClient
        TabOrder = 30
        OnKeyPress = edtWakeHoming4KeyPress
        ExplicitHeight = 21
      end
      object pnl8: TPanel
        Left = 3
        Top = 3
        Width = 130
        Height = 25
        Align = alClient
        Anchors = []
        BevelOuter = bvLowered
        TabOrder = 31
      end
    end
  end
end
