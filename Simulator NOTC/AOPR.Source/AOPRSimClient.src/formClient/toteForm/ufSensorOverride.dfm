object fSensorOverride: TfSensorOverride
  Left = 0
  Top = 0
  Caption = 'Sensor Override'
  ClientHeight = 686
  ClientWidth = 853
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbSensorOverride: TPanel
    Left = 0
    Top = 0
    Width = 853
    Height = 686
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 942
    object Panel17: TPanel
      Left = 1
      Top = 1
      Width = 851
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Sensor Override / Error Terms'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      ExplicitWidth = 798
    end
    object Panel33: TPanel
      Left = 1
      Top = 39
      Width = 507
      Height = 646
      Align = alLeft
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      ExplicitHeight = 680
      object StringGrid22: TStringGrid
        Left = 4
        Top = 4
        Width = 499
        Height = 638
        Align = alClient
        ColCount = 4
        FixedCols = 0
        TabOrder = 0
        ExplicitHeight = 672
        ColWidths = (
          69
          94
          64
          64)
      end
    end
    object Panel18: TPanel
      Left = 508
      Top = 39
      Width = 344
      Height = 646
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 2
      ExplicitWidth = 291
      ExplicitHeight = 680
      object Label224: TLabel
        Left = 18
        Top = 28
        Width = 84
        Height = 13
        Caption = 'Selected Platform'
      end
      object Label225: TLabel
        Left = 18
        Top = 60
        Width = 83
        Height = 13
        Caption = 'Detection status:'
      end
      object SpeedButton28: TSpeedButton
        Left = 270
        Top = 55
        Width = 23
        Height = 22
      end
      object Label226: TLabel
        Left = 18
        Top = 164
        Width = 59
        Height = 13
        Caption = 'All platforms'
      end
      object Panel19: TPanel
        Left = 18
        Top = 47
        Width = 303
        Height = 3
        TabOrder = 0
      end
      object Edit37: TEdit
        Left = 143
        Top = 56
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object CheckBox2: TCheckBox
        Left = 18
        Top = 99
        Width = 253
        Height = 17
        Caption = 'Inhibit ESM bearing errors'
        TabOrder = 2
      end
      object CheckBox3: TCheckBox
        Left = 18
        Top = 125
        Width = 202
        Height = 17
        Caption = 'Inhibit sonar bearing errors'
        TabOrder = 3
      end
      object Panel34: TPanel
        Left = 18
        Top = 183
        Width = 303
        Height = 3
        TabOrder = 4
      end
      object Button38: TButton
        Left = 74
        Top = 200
        Width = 243
        Height = 33
        Caption = 'Inhibit All ESM Bearing Errors'
        TabOrder = 5
      end
      object Button39: TButton
        Left = 74
        Top = 243
        Width = 243
        Height = 33
        Caption = 'Inhibit All Sonar Bearing Errors'
        TabOrder = 6
      end
      object Button42: TButton
        Left = 82
        Top = 335
        Width = 213
        Height = 33
        Caption = 'Select Hooked Platform'
        TabOrder = 7
      end
      object Button43: TButton
        Left = 82
        Top = 378
        Width = 213
        Height = 33
        Caption = 'Select Controlled Platform'
        TabOrder = 8
      end
    end
  end
end
