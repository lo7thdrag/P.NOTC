object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Map Stub'
  ClientHeight = 413
  ClientWidth = 473
  Color = clBtnFace
  Constraints.MinHeight = 106
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object mmLog: TMemo
    Left = 0
    Top = 105
    Width = 473
    Height = 308
    Align = alClient
    BorderStyle = bsNone
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 105
    Align = alTop
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 76
      Width = 70
      Height = 13
      Caption = 'Network Port :'
    end
    object lblPort: TLabel
      Left = 87
      Top = 76
      Width = 8
      Height = 13
      Caption = '--'
    end
    object lblGeoset: TLabel
      Left = 87
      Top = 30
      Width = 8
      Height = 13
      Caption = '--'
    end
    object lblMapData: TLabel
      Left = 87
      Top = 8
      Width = 8
      Height = 13
      Caption = '--'
    end
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Map Data :'
    end
    object Label2: TLabel
      Left = 8
      Top = 30
      Width = 74
      Height = 13
      Caption = 'Active Geoset :'
    end
    object Label4: TLabel
      Left = 216
      Top = 76
      Width = 87
      Height = 13
      Caption = 'Network GC Port :'
    end
    object lblGCPort: TLabel
      Left = 310
      Top = 76
      Width = 8
      Height = 13
      Caption = '--'
    end
    object Label5: TLabel
      Left = 8
      Top = 52
      Width = 54
      Height = 13
      Caption = 'Map Type :'
    end
    object lblMapType: TLabel
      Left = 87
      Top = 52
      Width = 8
      Height = 13
      Caption = '--'
    end
  end
  object mnMain: TPopupMenu
    Left = 392
    object Show2: TMenuItem
      Caption = 'Show/Hide'
      OnClick = Show2Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Show1: TMenuItem
      Caption = 'Exit'
      OnClick = Show1Click
    end
  end
end
