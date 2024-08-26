object IFFMode: TIFFMode
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Usage Report'
  ClientHeight = 808
  ClientWidth = 628
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
  object btnApply: TButton
    Left = 560
    Top = 775
    Width = 60
    Height = 25
    Caption = 'Apply'
    TabOrder = 0
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 493
    Top = 775
    Width = 60
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnOK: TButton
    Left = 427
    Top = 775
    Width = 60
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object grpAmberForce: TGroupBox
    Left = 8
    Top = 407
    Width = 193
    Height = 393
    Caption = 'Amber Force'
    TabOrder = 3
    object grdpnlAmberInterrogator: TGridPanel
      Left = 10
      Top = 20
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlAmberInterrogator
          Row = 0
        end
        item
          Column = 0
          Control = pnlAmberInterrogatorMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlAmberInterrogatorCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlAmberInterrogatorState
          Row = 1
        end
        item
          Column = 0
          Control = pnlAmberInterMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtAmberInterCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlAmberInterMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtAmberInterCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlAmberInterMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtAmberInterCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlAmberInterMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtAmberInterCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlAmberInterMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtAmberInterCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlAmberInterState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlAmberInterState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlAmberInterState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlAmberInterState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlAmberInterState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 0
      object pnlAmberInterrogator: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Interrogator'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlAmberInterrogatorMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlAmberInterrogatorCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlAmberInterrogatorState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlAmberInterMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtAmberInterCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlAmberInterMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtAmberInterCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlAmberInterMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtAmberInterCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlAmberInterMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtAmberInterCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlAmberInterMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtAmberInterCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlAmberInterState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkAmberInterState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberInterState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkAmberInterState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberInterState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkAmberInterState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberInterState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkAmberInterState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberInterState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkAmberInterState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
    object grdpnlAmberTransponder: TGridPanel
      Left = 10
      Top = 205
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlAmberTransponder
          Row = 0
        end
        item
          Column = 0
          Control = pnlAmberTransponderMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlAmberTransponderCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlAmberTransponderState
          Row = 1
        end
        item
          Column = 0
          Control = pnlAmberTransMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtAmberTransCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlAmberTransMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtAmberTransCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlAmberTransMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtAmberTransCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlAmberTransMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtAmberTransCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlAmberTransMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtAmberTransCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlAmberTransState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlAmberTransState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlAmberTransState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlAmberTransState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlAmberTransState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 1
      object pnlAmberTransponder: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Transponder'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlAmberTransponderMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlAmberTransponderCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlAmberTransponderState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlAmberTransMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtAmberTransCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlAmberTransMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtAmberTransCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlAmberTransMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtAmberTransCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlAmberTransMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtAmberTransCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlAmberTransMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtAmberTransCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlAmberTransState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkAmberTransState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberTransState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkAmberTransState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberTransState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkAmberTransState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberTransState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkAmberTransState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlAmberTransState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkAmberTransState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
  end
  object grpBlueForce: TGroupBox
    Left = 217
    Top = 8
    Width = 193
    Height = 393
    Caption = 'Blue Force'
    TabOrder = 4
    object grdpnlBlueInterrogator: TGridPanel
      Left = 10
      Top = 20
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlBlueInterrogator
          Row = 0
        end
        item
          Column = 0
          Control = pnlBlueInterrogatorMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlBlueInterrogatorCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlBlueInterrogatorState
          Row = 1
        end
        item
          Column = 0
          Control = pnlBlueInterMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtBlueInterCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlBlueInterMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtBlueInterCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlBlueInterMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtBlueInterCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlBlueInterMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtBlueInterCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlBlueInterMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtBlueInterCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlBlueInterState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlBlueInterState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlBlueInterState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlBlueInterState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlBlueInterState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 0
      object pnlBlueInterrogator: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Interrogator'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlBlueInterrogatorMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlBlueInterrogatorCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlBlueInterrogatorState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlBlueInterMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtBlueInterCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlBlueInterMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtBlueInterCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlBlueInterMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtBlueInterCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlBlueInterMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtBlueInterCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlBlueInterMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtBlueInterCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlBlueInterState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkBlueInterState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueInterState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkBlueInterState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueInterState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkBlueInterState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueInterState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkBlueInterState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueInterState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkBlueInterState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
    object grdpnlBlueTransponder: TGridPanel
      Left = 10
      Top = 205
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlBlueTransponder
          Row = 0
        end
        item
          Column = 0
          Control = pnlBlueTransponderMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlBlueTransponderCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlBlueTransponderState
          Row = 1
        end
        item
          Column = 0
          Control = pnlBlueTransMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtBlueTransCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlBlueTransMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtBlueTransCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlBlueTransMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtBlueTransCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlBlueTransMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtBlueTransCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlBlueTransMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtBlueTransCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlBlueTransState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlBlueTransState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlBlueTransState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlBlueTransState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlBlueTransState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 1
      object pnlBlueTransponder: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Transponder'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlBlueTransponderMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlBlueTransponderCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlBlueTransponderState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlBlueTransMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtBlueTransCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlBlueTransMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtBlueTransCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlBlueTransMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtBlueTransCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlBlueTransMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtBlueTransCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlBlueTransMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtBlueTransCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlBlueTransState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkBlueTransState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueTransState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkBlueTransState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueTransState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkBlueTransState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueTransState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkBlueTransState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlBlueTransState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkBlueTransState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
  end
  object grpGreenForce: TGroupBox
    Left = 217
    Top = 407
    Width = 193
    Height = 393
    Caption = 'Green Force'
    TabOrder = 5
    object grdpnlGreenInterrogator: TGridPanel
      Left = 10
      Top = 20
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlGreenInterrogator
          Row = 0
        end
        item
          Column = 0
          Control = pnlGreenInterrogatorMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlGreenInterrogatorCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlGreenInterrogatorState
          Row = 1
        end
        item
          Column = 0
          Control = pnlGreenInterMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtGreenInterCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlGreenInterMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtGreenInterCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlGreenInterMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtGreenInterCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlGreenInterMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtGreenInterCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlGreenInterMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtGreenInterCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlGreenInterState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlGreenInterState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlGreenInterState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlGreenInterState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlGreenInterState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 0
      object pnlGreenInterrogator: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Interrogator'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlGreenInterrogatorMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlGreenInterrogatorCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlGreenInterrogatorState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlGreenInterMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtGreenInterCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlGreenInterMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtGreenInterCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlGreenInterMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtGreenInterCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlGreenInterMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtGreenInterCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlGreenInterMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtGreenInterCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlGreenInterState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkGreenInterState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenInterState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkGreenInterState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenInterState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkGreenInterState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenInterState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkGreenInterState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenInterState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkGreenInterState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
    object grdpnlGreenTransponder: TGridPanel
      Left = 10
      Top = 205
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlGreenTransponder
          Row = 0
        end
        item
          Column = 0
          Control = pnlGreenTransponderMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlGreenTransponderCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlGreenTransponderState
          Row = 1
        end
        item
          Column = 0
          Control = pnlGreenTransMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtGreenTransCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlGreenTransMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtGreenTransCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlGreenTransMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtGreenTransCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlGreenTransMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtGreenTransCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlGreenTransMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtGreenTransCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlGreenTransState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlGreenTransState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlGreenTransState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlGreenTransState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlGreenTransState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 1
      object pnlGreenTransponder: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Transponder'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlGreenTransponderMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlGreenTransponderCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlGreenTransponderState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlGreenTransMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtGreenTransCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlGreenTransMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtGreenTransCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlGreenTransMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtGreenTransCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlGreenTransMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtGreenTransCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlGreenTransMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtGreenTransCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlGreenTransState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkGreenTransState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenTransState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkGreenTransState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenTransState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkGreenTransState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenTransState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkGreenTransState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlGreenTransState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkGreenTransState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
  end
  object grpNoForce: TGroupBox
    Left = 427
    Top = 8
    Width = 193
    Height = 393
    Caption = 'No Force'
    TabOrder = 6
    object grdpnlNoForceInterrogator: TGridPanel
      Left = 10
      Top = 20
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlNoForceInterrogator
          Row = 0
        end
        item
          Column = 0
          Control = pnlNoForceInterrogatorMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlNoForceInterrogatorCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlNoForceInterrogatorState
          Row = 1
        end
        item
          Column = 0
          Control = pnlNoForceInterMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtNoForceInterCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlNoForceInterMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtNoForceInterCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlNoForceInterMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtNoForceInterCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlNoForceInterMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtNoForceInterCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlNoForceInterMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtNoForceInterCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlNoForceInterState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlNoForceInterState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlNoForceInterState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlNoForceInterState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlNoForceInterState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 0
      object pnlNoForceInterrogator: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Interrogator'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlNoForceInterrogatorMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlNoForceInterrogatorCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlNoForceInterrogatorState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlNoForceInterMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtNoForceInterCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlNoForceInterMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtNoForceInterCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlNoForceInterMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtNoForceInterCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlNoForceInterMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtNoForceInterCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlNoForceInterMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtNoForceInterCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlNoForceInterState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkNoForceInterState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceInterState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkNoForceInterState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceInterState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkNoForceInterState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceInterState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkNoForceInterState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceInterState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkNoForceInterState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
    object grdpnlNoForceTransponder: TGridPanel
      Left = 10
      Top = 205
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlNoForceTransponder
          Row = 0
        end
        item
          Column = 0
          Control = pnlNoForceTransponderMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlNoForceTransponderCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlNoForceTransponderState
          Row = 1
        end
        item
          Column = 0
          Control = pnlNoForceTransMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtNoForceTransCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlNoForceTransMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtNoForceTransCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlNoForceTransMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtNoForceTransCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlNoForceTransMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtNoForceTransCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlNoForceTransMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtNoForceTransCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlNoForceTransState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlNoForceTransState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlNoForceTransState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlNoForceTransState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlNoForceTransState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 1
      object pnlNoForceTransponder: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Transponder'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlNoForceTransponderMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlNoForceTransponderCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlNoForceTransponderState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlNoForceTransMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtNoForceTransCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlNoForceTransMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtNoForceTransCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlNoForceTransMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtNoForceTransCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlNoForceTransMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtNoForceTransCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlNoForceTransMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtNoForceTransCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlNoForceTransState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkNoForceTransState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceTransState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkNoForceTransState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceTransState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkNoForceTransState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceTransState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkNoForceTransState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlNoForceTransState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkNoForceTransState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
  end
  object grpRedForce: TGroupBox
    Left = 8
    Top = 8
    Width = 193
    Height = 393
    Caption = 'Red Force'
    TabOrder = 7
    object grdpnlRedInterrogator: TGridPanel
      Left = 10
      Top = 20
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlRedInterrogator
          Row = 0
        end
        item
          Column = 0
          Control = pnlRedInterrogatorMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlRedInterrogatorCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlRedInterrogatorState
          Row = 1
        end
        item
          Column = 0
          Control = pnlRedInterMode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlRedInterMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtRedInterCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlRedInterMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtRedInterCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlRedInterMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtRedInterCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlRedInterMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtRedInterCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlRedInterState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlRedInterState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlRedInterState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlRedInterState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlRedInterState4
          Row = 6
        end
        item
          Column = 1
          Control = edtRedInterCode1
          Row = 2
        end
        item
          Column = 0
          Control = medtRedInterCode1
          Row = 7
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAuto
        end>
      TabOrder = 0
      DesignSize = (
        173
        179)
      object pnlRedInterrogator: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Interrogator'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlRedInterrogatorMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlRedInterrogatorCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlRedInterrogatorState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlRedInterMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object pnlRedInterMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 5
      end
      object edtRedInterCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 6
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlRedInterMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 7
      end
      object edtRedInterCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 8
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlRedInterMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 9
      end
      object edtRedInterCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 10
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlRedInterMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 11
      end
      object edtRedInterCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 12
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlRedInterState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 13
        object chkRedInterState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedInterState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkRedInterState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedInterState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkRedInterState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedInterState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkRedInterState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedInterState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkRedInterState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object edtRedInterCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 18
        Text = '00'
        ExplicitHeight = 21
      end
      object medtRedInterCode1: TMaskEdit
        Left = 3
        Top = 178
        Width = 48
        Height = 21
        Anchors = []
        EditMask = '00;1;_'
        MaxLength = 2
        TabOrder = 19
        Text = '  '
      end
    end
    object grdpnlRedTransponder: TGridPanel
      Left = 10
      Top = 205
      Width = 173
      Height = 179
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 50.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 70.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          ColumnSpan = 3
          Control = pnlRedTransponder
          Row = 0
        end
        item
          Column = 0
          Control = pnlRedTransponderMode
          Row = 1
        end
        item
          Column = 1
          Control = pnlRedTransponderCode
          Row = 1
        end
        item
          Column = 2
          Control = pnlRedTransponderState
          Row = 1
        end
        item
          Column = 0
          Control = pnlRedTransMode1
          Row = 2
        end
        item
          Column = 1
          Control = edtRedTransCode1
          Row = 2
        end
        item
          Column = 0
          Control = pnlRedTransMode2
          Row = 3
        end
        item
          Column = 1
          Control = edtRedTransCode2
          Row = 3
        end
        item
          Column = 0
          Control = pnlRedTransMode3
          Row = 4
        end
        item
          Column = 1
          Control = edtRedTransCode3
          Row = 4
        end
        item
          Column = 0
          Control = pnlRedTransMode3C
          Row = 5
        end
        item
          Column = 1
          Control = edtRedTransCode3C
          Row = 5
        end
        item
          Column = 0
          Control = pnlRedTransMode4
          Row = 6
        end
        item
          Column = 1
          Control = edtRedTransCode4
          Row = 6
        end
        item
          Column = 2
          Control = pnlRedTransState1
          Row = 2
        end
        item
          Column = 2
          Control = pnlRedTransState2
          Row = 3
        end
        item
          Column = 2
          Control = pnlRedTransState3
          Row = 4
        end
        item
          Column = 2
          Control = pnlRedTransState3C
          Row = 5
        end
        item
          Column = 2
          Control = pnlRedTransState4
          Row = 6
        end>
      Padding.Left = 1
      Padding.Top = 1
      Padding.Right = 1
      Padding.Bottom = 1
      ParentBackground = False
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end>
      TabOrder = 1
      object pnlRedTransponder: TPanel
        Left = 3
        Top = 3
        Width = 168
        Height = 23
        Align = alClient
        Alignment = taLeftJustify
        BevelOuter = bvLowered
        Caption = 'Transponder'
        Padding.Left = 1
        Padding.Top = 1
        Padding.Right = 1
        Padding.Bottom = 1
        TabOrder = 0
      end
      object pnlRedTransponderMode: TPanel
        Left = 3
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Mode'
        TabOrder = 1
      end
      object pnlRedTransponderCode: TPanel
        Left = 53
        Top = 28
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'Code'
        TabOrder = 2
      end
      object pnlRedTransponderState: TPanel
        Left = 103
        Top = 28
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = 'State'
        TabOrder = 3
      end
      object pnlRedTransMode1: TPanel
        Left = 3
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '1'
        TabOrder = 4
      end
      object edtRedTransCode1: TEdit
        Left = 53
        Top = 53
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 5
        Text = '00'
        ExplicitHeight = 21
      end
      object pnlRedTransMode2: TPanel
        Left = 3
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '2'
        TabOrder = 6
      end
      object edtRedTransCode2: TEdit
        Left = 53
        Top = 78
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 7
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlRedTransMode3: TPanel
        Left = 3
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3'
        TabOrder = 8
      end
      object edtRedTransCode3: TEdit
        Left = 53
        Top = 103
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        TabOrder = 9
        Text = '0000'
        ExplicitHeight = 21
      end
      object pnlRedTransMode3C: TPanel
        Left = 3
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '3C'
        TabOrder = 10
      end
      object edtRedTransCode3C: TEdit
        Left = 53
        Top = 128
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 11
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlRedTransMode4: TPanel
        Left = 3
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Caption = '4'
        TabOrder = 12
      end
      object edtRedTransCode4: TEdit
        Left = 53
        Top = 153
        Width = 48
        Height = 23
        Align = alClient
        Alignment = taCenter
        Enabled = False
        TabOrder = 13
        Text = 'N/A'
        ExplicitHeight = 21
      end
      object pnlRedTransState1: TPanel
        Left = 103
        Top = 53
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 14
        object chkRedTransState1: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedTransState2: TPanel
        Left = 103
        Top = 78
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 15
        object chkRedTransState2: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedTransState3: TPanel
        Left = 103
        Top = 103
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 16
        object chkRedTransState3: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedTransState3C: TPanel
        Left = 103
        Top = 128
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 17
        object chkRedTransState3C: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
      object pnlRedTransState4: TPanel
        Left = 103
        Top = 153
        Width = 68
        Height = 23
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 18
        object chkRedTransState4: TCheckBox
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 60
          Height = 15
          Align = alClient
          Caption = 'Enabled'
          TabOrder = 0
        end
      end
    end
  end
end
