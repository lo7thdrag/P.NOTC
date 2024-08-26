object fRuntimePlatform: TfRuntimePlatform
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Runtime Platform Library'
  ClientHeight = 249
  ClientWidth = 428
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 49
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 6
      Width = 37
      Height = 13
      Caption = 'Name  :'
    end
    object edtRuntimeName: TEdit
      Left = 7
      Top = 22
      Width = 410
      Height = 21
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 49
    Width = 428
    Height = 160
    TabOrder = 1
    object grp1: TGroupBox
      Left = 8
      Top = 0
      Width = 305
      Height = 149
      Caption = 'Platforms'
      TabOrder = 0
      object btnVehicle: TButton
        Left = 13
        Top = 24
        Width = 116
        Height = 25
        Caption = 'Vehicle ..'
        TabOrder = 0
        OnClick = btnVehicleClick
      end
      object btnTorpedo: TButton
        Left = 13
        Top = 65
        Width = 116
        Height = 25
        Caption = 'Torpedo ..'
        TabOrder = 1
        OnClick = btnTorpedoClick
      end
      object btnMine: TButton
        Left = 13
        Top = 106
        Width = 116
        Height = 25
        Caption = 'Mine ..'
        TabOrder = 2
        OnClick = btnMineClick
      end
      object btnMissile: TButton
        Left = 141
        Top = 24
        Width = 116
        Height = 25
        Caption = 'Missile ..'
        TabOrder = 3
        OnClick = btnMissileClick
      end
      object btnSonobuoy: TButton
        Left = 141
        Top = 65
        Width = 116
        Height = 25
        Caption = 'Sonobuoy ..'
        TabOrder = 4
        OnClick = btnSonobuoyClick
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 209
    Width = 428
    Height = 40
    TabOrder = 2
    object btnCancel: TButton
      Left = 261
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnApply: TButton
      Left = 342
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 1
      OnClick = btnApplyClick
    end
    object btnOk: TButton
      Left = 180
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOkClick
    end
  end
end
