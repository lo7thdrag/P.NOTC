object fEnvironmentStatus: TfEnvironmentStatus
  Left = 0
  Top = 0
  Caption = 'Environment Status'
  ClientHeight = 686
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object gbEnvironmentStatus: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 686
    Align = alClient
    TabOrder = 0
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 780
      Height = 38
      Align = alTop
      Alignment = taLeftJustify
      BorderWidth = 4
      Caption = 'Environment Status'
      Color = clBtnShadow
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Arial'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object Panel21: TPanel
      Left = 1
      Top = 39
      Width = 780
      Height = 646
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      object Label81: TLabel
        Left = 11
        Top = 14
        Width = 64
        Height = 13
        Caption = 'Above Water'
      end
      object Bevel1: TBevel
        Left = 11
        Top = 28
        Width = 750
        Height = 3
      end
      object Label82: TLabel
        Left = 26
        Top = 37
        Width = 47
        Height = 13
        Caption = 'Wind true'
      end
      object Bevel2: TBevel
        Left = 77
        Top = 42
        Width = 236
        Height = 3
      end
      object Label83: TLabel
        Left = 43
        Top = 60
        Width = 34
        Height = 13
        Caption = 'Speed:'
      end
      object Label84: TLabel
        Left = 43
        Top = 79
        Width = 46
        Height = 13
        Caption = 'Direction:'
      end
      object Bevel3: TBevel
        Left = 440
        Top = 40
        Width = 207
        Height = 3
      end
      object Label85: TLabel
        Left = 360
        Top = 35
        Width = 63
        Height = 13
        Caption = 'Wind relative'
      end
      object lblSpeedWIndTrue: TLabel
        Left = 104
        Top = 63
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object lblDirectionWindTrue: TLabel
        Left = 104
        Top = 79
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object lblWindRelativeDirection: TLabel
        Left = 451
        Top = 79
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label87: TLabel
        Left = 390
        Top = 79
        Width = 46
        Height = 13
        Caption = 'Direction:'
      end
      object lblWindRelativeSpeed: TLabel
        Left = 451
        Top = 63
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label89: TLabel
        Left = 390
        Top = 60
        Width = 34
        Height = 13
        Caption = 'Speed:'
      end
      object Label90: TLabel
        Left = 510
        Top = 79
        Width = 39
        Height = 13
        Caption = 'degrees'
      end
      object Label91: TLabel
        Left = 510
        Top = 60
        Width = 17
        Height = 13
        Caption = 'm/s'
      end
      object Label92: TLabel
        Left = 390
        Top = 199
        Width = 84
        Height = 13
        Caption = 'Infrared visibility:'
      end
      object lblVisibilityFactorsElectroOptical: TLabel
        Left = 515
        Top = 180
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label94: TLabel
        Left = 390
        Top = 180
        Width = 112
        Height = 13
        Caption = 'Electro-optical visibility:'
      end
      object lblAttenuationFactorsCloud: TLabel
        Left = 147
        Top = 180
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label96: TLabel
        Left = 43
        Top = 180
        Width = 90
        Height = 13
        Caption = 'Cloud base height:'
      end
      object Label97: TLabel
        Left = 189
        Top = 180
        Width = 20
        Height = 13
        Caption = 'feet'
      end
      object lblVisibilityactorsTime: TLabel
        Left = 517
        Top = 161
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label99: TLabel
        Left = 390
        Top = 161
        Width = 60
        Height = 13
        Caption = 'Time of day:'
      end
      object lblAttenuationFactorsRain: TLabel
        Left = 147
        Top = 161
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label101: TLabel
        Left = 43
        Top = 161
        Width = 48
        Height = 13
        Caption = 'Rain rate:'
      end
      object Bevel4: TBevel
        Left = 440
        Top = 141
        Width = 207
        Height = 3
      end
      object Label102: TLabel
        Left = 360
        Top = 136
        Width = 76
        Height = 13
        Caption = 'Visiibility factors'
      end
      object Bevel5: TBevel
        Left = 126
        Top = 143
        Width = 187
        Height = 3
      end
      object Label103: TLabel
        Left = 26
        Top = 138
        Width = 94
        Height = 13
        Caption = 'Attenuation factors'
      end
      object lblVisibilityFactorsnfrared: TLabel
        Left = 515
        Top = 202
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label105: TLabel
        Left = 183
        Top = 277
        Width = 24
        Height = 13
        Caption = 'mBar'
      end
      object lblOtherBarometric: TLabel
        Left = 141
        Top = 277
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label107: TLabel
        Left = 37
        Top = 277
        Width = 100
        Height = 13
        Caption = 'Barometric pressure:'
      end
      object lblOtherAirTemp: TLabel
        Left = 141
        Top = 258
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label109: TLabel
        Left = 37
        Top = 258
        Width = 80
        Height = 13
        Caption = 'Air temperature:'
      end
      object Bevel6: TBevel
        Left = 61
        Top = 244
        Width = 246
        Height = 3
      end
      object Label111: TLabel
        Left = 183
        Top = 257
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object Label86: TLabel
        Left = 18
        Top = 336
        Width = 115
        Height = 13
        Caption = 'Surface and Subsurface'
      end
      object Bevel7: TBevel
        Left = 18
        Top = 350
        Width = 750
        Height = 3
      end
      object lblSoundVelocityAverageBottom: TLabel
        Left = 515
        Top = 428
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object lblSoundVelocityLayer: TLabel
        Left = 515
        Top = 406
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object lblSoundVelocityProfile: TLabel
        Left = 515
        Top = 387
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label98: TLabel
        Left = 390
        Top = 425
        Width = 113
        Height = 13
        Caption = 'Average bottom depth:'
      end
      object Label100: TLabel
        Left = 390
        Top = 406
        Width = 62
        Height = 13
        Caption = 'Layer depth:'
      end
      object Label104: TLabel
        Left = 390
        Top = 387
        Width = 34
        Height = 13
        Caption = 'Profile:'
      end
      object Label106: TLabel
        Left = 189
        Top = 387
        Width = 26
        Height = 13
        Caption = 'knots'
      end
      object lblOceanCurrentDirection: TLabel
        Left = 147
        Top = 406
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label112: TLabel
        Left = 43
        Top = 406
        Width = 46
        Height = 13
        Caption = 'Direction:'
      end
      object lblOceanCurrentSpeed: TLabel
        Left = 147
        Top = 387
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label114: TLabel
        Left = 43
        Top = 387
        Width = 34
        Height = 13
        Caption = 'Speed:'
      end
      object Bevel8: TBevel
        Left = 440
        Top = 367
        Width = 207
        Height = 3
      end
      object Label115: TLabel
        Left = 360
        Top = 362
        Width = 70
        Height = 13
        Caption = 'Sound velocity'
      end
      object Bevel9: TBevel
        Left = 126
        Top = 369
        Width = 187
        Height = 3
      end
      object Label116: TLabel
        Left = 26
        Top = 364
        Width = 69
        Height = 13
        Caption = 'Ocean current'
      end
      object Label117: TLabel
        Left = 189
        Top = 406
        Width = 48
        Height = 13
        Caption = 'degrees T'
      end
      object Label118: TLabel
        Left = 558
        Top = 425
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object Label119: TLabel
        Left = 558
        Top = 406
        Width = 33
        Height = 13
        Caption = 'metres'
      end
      object lblSurfaceTemp: TLabel
        Left = 149
        Top = 507
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label95: TLabel
        Left = 43
        Top = 507
        Width = 104
        Height = 13
        Caption = 'Surface temperature:'
      end
      object Label108: TLabel
        Left = 189
        Top = 507
        Width = 7
        Height = 13
        Caption = 'C'
      end
      object lblSeaState: TLabel
        Left = 149
        Top = 488
        Width = 20
        Height = 13
        Caption = '-----'
      end
      object Label120: TLabel
        Left = 43
        Top = 488
        Width = 50
        Height = 13
        Caption = 'Sea state:'
      end
      object Bevel10: TBevel
        Left = 61
        Top = 474
        Width = 246
        Height = 3
      end
      object Label110: TLabel
        Left = 26
        Top = 239
        Width = 28
        Height = 13
        Caption = 'Other'
      end
      object Label121: TLabel
        Left = 26
        Top = 469
        Width = 28
        Height = 13
        Caption = 'Other'
      end
    end
  end
end
