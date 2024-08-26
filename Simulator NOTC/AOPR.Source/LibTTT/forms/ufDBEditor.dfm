object fDBEditor: TfDBEditor
  Left = 0
  Top = 0
  Caption = 'Database Editor'
  ClientHeight = 506
  ClientWidth = 939
  Color = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 48
    Top = 48
    object Exercise1: TMenuItem
      Caption = 'Exercise'
      object Scenario1: TMenuItem
        Caption = 'Scenario'#8230
        OnClick = Scenario1Click
      end
      object ResourceAllocation1: TMenuItem
        Caption = 'Resource Allocation'#8230
        OnClick = ResourceAllocation1Click
      end
      object Environment1: TMenuItem
        Caption = 'Environment'#8230
        OnClick = Environment1Click
      end
      object GameArea1: TMenuItem
        Caption = 'Game Area'#8230
        OnClick = GameArea1Click
      end
    end
    object Platforms1: TMenuItem
      Caption = 'Platforms'
      object Vehicle1: TMenuItem
        Caption = 'Vehicle'#8230
        OnClick = Vehicle1Click
      end
      object Satellite1: TMenuItem
        Caption = 'Satellite'#8230
        OnClick = Satellite1Click
      end
      object Motion1: TMenuItem
        Caption = 'Motion'#8230
        OnClick = Motion1Click
      end
    end
    object Sensors1: TMenuItem
      Caption = 'Sensors'
      object Radar1: TMenuItem
        Caption = 'Radar'#8230
        OnClick = Radar1Click
      end
      object Sonar1: TMenuItem
        Caption = 'Sonar'#8230
        OnClick = Sonar1Click
      end
      object ESM1: TMenuItem
        Caption = 'ESM'#8230
        OnClick = ESM1Click
      end
      object ElectroOpticalDetector1: TMenuItem
        Caption = 'Electro Optical Detector'#8230
        OnClick = ElectroOpticalDetector1Click
      end
      object MAD1: TMenuItem
        Caption = 'MAD'#8230
        OnClick = MAD1Click
      end
      object Sonobuoy1: TMenuItem
        Caption = 'Sonobuoy'#8230
        OnClick = Sonobuoy1Click
      end
    end
    object Weapons1: TMenuItem
      Caption = 'Weapons'
      object Missile1: TMenuItem
        Caption = 'Missile'#8230
        OnClick = Missile1Click
      end
      object orpedo1: TMenuItem
        Caption = 'Torpedo'#8230
        OnClick = orpedo1Click
      end
      object Mine1: TMenuItem
        Caption = 'Mine'#8230
        OnClick = Mine1Click
      end
      object Gun1: TMenuItem
        Caption = 'Gun'#8230
        OnClick = Gun1Click
      end
      object Bomb1: TMenuItem
        Caption = 'Bomb'#8230
        OnClick = Bomb1Click
      end
    end
    object Countermeasures1: TMenuItem
      Caption = 'Countermeasures'
      object AcousticDecoy1: TMenuItem
        Caption = 'Acoustic Decoy'#8230
        OnClick = AcousticDecoy1Click
      end
      object AirBubble1: TMenuItem
        Caption = 'Air Bubble'#8230
        OnClick = AirBubble1Click
      end
      object Chaff1: TMenuItem
        Caption = 'Chaff'#8230
        OnClick = Chaff1Click
      end
      object FloatingDecoy1: TMenuItem
        Caption = 'Floating Decoy'#8230
        OnClick = FloatingDecoy1Click
      end
      object SelfDefensiveJammer1: TMenuItem
        Caption = 'Self Defensive Jammer'#8230
        OnClick = SelfDefensiveJammer1Click
      end
      object owedJammerDecoy1: TMenuItem
        Caption = 'Towed Jammer/Decoy'#8230
        OnClick = owedJammerDecoy1Click
      end
      object RadarNoiseJammer1: TMenuItem
        Caption = 'Radar Noise Jammer'#8230
        OnClick = RadarNoiseJammer1Click
      end
    end
    object Other1: TMenuItem
      Caption = 'Other'
      object RuntimePlatformLibrary1: TMenuItem
        Caption = 'Runtime Platform Library'#8230
        OnClick = RuntimePlatformLibrary1Click
      end
      object PredefinedPatterns1: TMenuItem
        Caption = 'Predefined Patterns'#8230
        OnClick = PredefinedPatterns1Click
      end
      object RadarActivationIntervals1: TMenuItem
        Caption = 'Radar Activation Intervals'#8230
        OnClick = RadarActivationIntervals1Click
      end
      object GraphicalOverlays1: TMenuItem
        Caption = 'Graphical Overlays'#8230
        OnClick = GraphicalOverlays1Click
      end
      object x1: TMenuItem
        Caption = 'Student Roles'#8230
        OnClick = x1Click
      end
      object GameDefaults1: TMenuItem
        Caption = 'Game Defaults'#8230
        OnClick = GameDefaults1Click
      end
      object SNRvsPODCurve1: TMenuItem
        Caption = 'SNR vs. POD Curve'#8230
        OnClick = SNRvsPODCurve1Click
      end
      object ReportEditor1: TMenuItem
        Caption = 'Report Editor'#8230
        OnClick = ReportEditor1Click
      end
      object ReportViewer1: TMenuItem
        Caption = 'Report Viewer'#8230
        OnClick = ReportViewer1Click
      end
    end
    object Options1: TMenuItem
      Caption = 'Options'
      object DisplayDimensionsinfeet1: TMenuItem
        Caption = 'Display Dimensions in feet'
      end
      object DisplayDimensionsinmetres1: TMenuItem
        Caption = 'Display Dimensions in metres'
      end
    end
    object Shutdown1: TMenuItem
      Caption = 'Shutdown'
      object ShutdownDatabaseEditor1: TMenuItem
        Caption = 'Shutdown Database Editor'#8230
        OnClick = ShutdownDatabaseEditor1Click
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object AboutDatabaseEditor1: TMenuItem
        Caption = 'About Database Editor'#8230
      end
    end
  end
end
