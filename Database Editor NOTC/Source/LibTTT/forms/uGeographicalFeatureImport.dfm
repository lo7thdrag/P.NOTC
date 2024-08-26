object GeographicalFeatureImportForm: TGeographicalFeatureImportForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Geography Import'
  ClientHeight = 695
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 660
    Width = 505
    Height = 35
    Align = alBottom
    TabOrder = 0
    object btnClose: TButton
      Left = 406
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnOK: TButton
      Left = 325
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Import'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 85
    Align = alTop
    TabOrder = 1
    object grbImportSource: TGroupBox
      Left = 8
      Top = 16
      Width = 489
      Height = 63
      Caption = 'Import Source'
      TabOrder = 0
      object grbLibrary: TGroupBox
        Left = 165
        Top = 16
        Width = 311
        Height = 44
        Caption = 'Library'
        Enabled = False
        TabOrder = 0
        object edtLibrary: TEdit
          Left = 14
          Top = 17
          Width = 172
          Height = 21
          TabOrder = 0
          Text = 'M:\map\game_area'
        end
      end
      object cbImportSource: TComboBox
        Left = 11
        Top = 31
        Width = 148
        Height = 21
        TabOrder = 1
        Text = 'Vector Smart Level 0'
        OnChange = cbImportSourceChange
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 85
    Width = 505
    Height = 575
    Align = alClient
    TabOrder = 2
    object grbImportFilters: TGroupBox
      Left = 8
      Top = 0
      Width = 489
      Height = 569
      Caption = 'Import Filters'
      TabOrder = 0
      object cbCoastline: TCheckBox
        Left = 11
        Top = 20
        Width = 97
        Height = 17
        Caption = 'Coastline'
        TabOrder = 0
      end
      object grbDepthContours: TGroupBox
        Left = 11
        Top = 47
        Width = 465
        Height = 103
        TabOrder = 1
        object cb10mDepthCountours: TCheckBox
          Left = 32
          Top = 16
          Width = 65
          Height = 17
          Caption = '0 - 10m'
          Enabled = False
          TabOrder = 0
        end
        object cb20mDepthCountours: TCheckBox
          Left = 32
          Top = 39
          Width = 65
          Height = 17
          Caption = '11 - 20m'
          Enabled = False
          TabOrder = 1
        end
        object cb40mDepthCountours: TCheckBox
          Left = 32
          Top = 62
          Width = 65
          Height = 17
          Caption = '21 - 40m'
          Enabled = False
          TabOrder = 2
        end
        object cb60mDepthCountours: TCheckBox
          Left = 32
          Top = 81
          Width = 65
          Height = 17
          Caption = '41 - 60m'
          Enabled = False
          TabOrder = 3
        end
        object cb80mDepthCountours: TCheckBox
          Left = 120
          Top = 16
          Width = 65
          Height = 17
          Caption = '61 - 80m'
          Enabled = False
          TabOrder = 4
        end
        object cb100mDepthCountours: TCheckBox
          Left = 120
          Top = 39
          Width = 65
          Height = 17
          Caption = '81 - 100m'
          Enabled = False
          TabOrder = 5
        end
        object cb120mDepthCountours: TCheckBox
          Left = 120
          Top = 62
          Width = 79
          Height = 17
          Caption = '101 - 120m'
          Enabled = False
          TabOrder = 6
        end
        object cb140mDepthCountours: TCheckBox
          Left = 120
          Top = 83
          Width = 79
          Height = 17
          Caption = '121 - 140m'
          Enabled = False
          TabOrder = 7
        end
        object cb160mDepthCountours: TCheckBox
          Left = 205
          Top = 16
          Width = 85
          Height = 17
          Caption = '141 - 160m'
          Enabled = False
          TabOrder = 8
        end
        object cb180mDepthCountours: TCheckBox
          Left = 205
          Top = 39
          Width = 85
          Height = 17
          Caption = '161 - 180m'
          Enabled = False
          TabOrder = 9
        end
        object cb200mDepthCountours: TCheckBox
          Left = 205
          Top = 62
          Width = 85
          Height = 17
          Caption = '181 - 200m'
          Enabled = False
          TabOrder = 10
        end
        object cb300mDepthCountours: TCheckBox
          Left = 205
          Top = 81
          Width = 85
          Height = 17
          Caption = '201 - 300m'
          Enabled = False
          TabOrder = 11
        end
        object cb400mDepthCountours: TCheckBox
          Left = 296
          Top = 16
          Width = 76
          Height = 17
          Caption = '301 - 400m'
          Enabled = False
          TabOrder = 12
        end
        object cb500mDepthCountours: TCheckBox
          Left = 296
          Top = 39
          Width = 76
          Height = 17
          Caption = '401 - 500m'
          Enabled = False
          TabOrder = 13
        end
        object cb700mDepthCountours: TCheckBox
          Left = 296
          Top = 62
          Width = 89
          Height = 17
          Caption = '501 - 700m'
          Enabled = False
          TabOrder = 14
        end
        object cb1000mDepthCountours: TCheckBox
          Left = 296
          Top = 81
          Width = 89
          Height = 17
          Caption = '701 - 1000m'
          Enabled = False
          TabOrder = 15
        end
        object cbBelow1000mDepthCountours: TCheckBox
          Left = 378
          Top = 16
          Width = 79
          Height = 17
          Caption = 'below 1000m'
          Enabled = False
          TabOrder = 16
        end
      end
      object grbElevationContours: TGroupBox
        Left = 11
        Top = 159
        Width = 465
        Height = 90
        TabOrder = 2
        object cb100ftElevationContours: TCheckBox
          Left = 32
          Top = 16
          Width = 65
          Height = 17
          Caption = '1 - 100ft'
          Enabled = False
          TabOrder = 0
        end
        object cb200ftElevationContours: TCheckBox
          Left = 32
          Top = 39
          Width = 65
          Height = 17
          Caption = '101 - 200ft'
          Enabled = False
          TabOrder = 1
        end
        object cb500ftElevationContours: TCheckBox
          Left = 32
          Top = 62
          Width = 65
          Height = 17
          Caption = '201 - 500ft'
          Enabled = False
          TabOrder = 2
        end
        object cb1000ftElevationContours: TCheckBox
          Left = 120
          Top = 16
          Width = 79
          Height = 17
          Caption = '501 - 1000ft'
          Enabled = False
          TabOrder = 3
        end
        object cb1500ftElevationContours: TCheckBox
          Left = 120
          Top = 39
          Width = 89
          Height = 17
          Caption = '1001 - 1500ft'
          Enabled = False
          TabOrder = 4
        end
        object cb2000ftElevationContours: TCheckBox
          Left = 120
          Top = 62
          Width = 89
          Height = 17
          Caption = '1501 - 2000ft'
          Enabled = False
          TabOrder = 5
        end
        object cb3000ftElevationContours: TCheckBox
          Left = 205
          Top = 16
          Width = 85
          Height = 17
          Caption = '2001 - 3000ft'
          Enabled = False
          TabOrder = 6
        end
        object cb5000ftElevationContours: TCheckBox
          Left = 205
          Top = 39
          Width = 85
          Height = 17
          Caption = '3001 - 5000ft'
          Enabled = False
          TabOrder = 7
        end
        object cb7000ftElevationContours: TCheckBox
          Left = 205
          Top = 62
          Width = 85
          Height = 17
          Caption = '5001 - 7000ft'
          Enabled = False
          TabOrder = 8
        end
        object cb10000ftElevationContours: TCheckBox
          Left = 296
          Top = 16
          Width = 89
          Height = 17
          Caption = '7001 - 10000ft'
          Enabled = False
          TabOrder = 9
        end
        object cbAbove10000ftElevationContours: TCheckBox
          Left = 296
          Top = 39
          Width = 89
          Height = 17
          Caption = 'above 10000ft '
          Enabled = False
          TabOrder = 10
        end
      end
      object grbPopulatedPlaces: TGroupBox
        Left = 11
        Top = 262
        Width = 465
        Height = 34
        TabOrder = 3
        object cbPointsPopulatedPlaces: TCheckBox
          Left = 32
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Points'
          Enabled = False
          TabOrder = 0
        end
        object cbAreasPopulatedPlaces: TCheckBox
          Left = 120
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Areas'
          Enabled = False
          TabOrder = 1
        end
      end
      object grbAirports: TGroupBox
        Left = 11
        Top = 311
        Width = 465
        Height = 34
        TabOrder = 4
        object cbMilitaryAirports: TCheckBox
          Left = 32
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Military'
          Enabled = False
          TabOrder = 0
        end
        object cbCivilianAirports: TCheckBox
          Left = 120
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Civilian'
          Enabled = False
          TabOrder = 1
        end
        object cbOtherAirports: TCheckBox
          Left = 205
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Other'
          Enabled = False
          TabOrder = 2
        end
      end
      object grbRailroads: TGroupBox
        Left = 11
        Top = 362
        Width = 465
        Height = 34
        TabOrder = 5
        object cbPrimaryRailroads: TCheckBox
          Left = 32
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Primary'
          Enabled = False
          TabOrder = 0
        end
        object cbSecondaryRailroads: TCheckBox
          Left = 120
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Secondary'
          Enabled = False
          TabOrder = 1
        end
      end
      object grbRoads: TGroupBox
        Left = 11
        Top = 411
        Width = 465
        Height = 34
        TabOrder = 6
        object cbPrimaryRoads: TCheckBox
          Left = 32
          Top = 14
          Width = 65
          Height = 17
          Caption = 'Primary'
          Enabled = False
          TabOrder = 0
        end
        object cbSecondaryRoads: TCheckBox
          Left = 120
          Top = 14
          Width = 79
          Height = 17
          Caption = 'Secondary'
          Enabled = False
          TabOrder = 1
        end
      end
      object cbPoliticalBoundaries: TCheckBox
        Left = 19
        Top = 451
        Width = 118
        Height = 17
        Caption = 'Political Boundaries'
        TabOrder = 7
      end
      object cbWrecks: TCheckBox
        Left = 19
        Top = 474
        Width = 97
        Height = 17
        Caption = 'Wrecks'
        TabOrder = 8
      end
      object cbPipelines: TCheckBox
        Left = 240
        Top = 451
        Width = 97
        Height = 17
        Caption = 'Pipelines'
        TabOrder = 9
      end
      object cbPlatforms: TCheckBox
        Left = 240
        Top = 474
        Width = 97
        Height = 17
        Caption = 'Platforms'
        TabOrder = 10
      end
      object grbScaleFactor: TGroupBox
        Left = 11
        Top = 488
        Width = 465
        Height = 65
        Caption = 'Scale Factor'
        TabOrder = 11
        object trackScaleFactor: TTrackBar
          Left = 3
          Top = 17
          Width = 399
          Height = 45
          Min = 1
          Position = 1
          TabOrder = 0
          OnChange = trackScaleFactorChange
        end
        object edtScaleFactor: TEdit
          Left = 408
          Top = 16
          Width = 46
          Height = 21
          TabOrder = 1
          Text = '1 : 1'
        end
        object lbl1ScaleFactor: TStaticText
          Left = 16
          Top = 45
          Width = 10
          Height = 17
          Caption = '1'
          TabOrder = 2
        end
        object lbl10ScaleFactor: TStaticText
          Left = 386
          Top = 45
          Width = 16
          Height = 17
          Caption = '10'
          TabOrder = 3
        end
      end
      object cbDepthContours: TCheckBox
        Left = 20
        Top = 40
        Width = 102
        Height = 17
        Caption = 'Depth Contours'
        TabOrder = 12
        OnClick = cbDepthContoursClick
      end
      object cbElevationContours: TCheckBox
        Left = 20
        Top = 156
        Width = 117
        Height = 17
        Caption = 'Elevation Contours'
        TabOrder = 13
        OnClick = cbElevationContoursClick
      end
      object cbPopulatedPlaces: TCheckBox
        Left = 19
        Top = 253
        Width = 102
        Height = 17
        Caption = 'Populated Places'
        TabOrder = 14
        OnClick = cbPopulatedPlacesClick
      end
      object cbAirports: TCheckBox
        Left = 20
        Top = 302
        Width = 102
        Height = 17
        Caption = 'Airports'
        TabOrder = 15
        OnClick = cbAirportsClick
      end
      object cbrRilroads: TCheckBox
        Left = 19
        Top = 353
        Width = 102
        Height = 17
        Caption = 'Railroads'
        TabOrder = 16
        OnClick = cbrRilroadsClick
      end
      object cbRoads: TCheckBox
        Left = 20
        Top = 402
        Width = 102
        Height = 17
        Caption = 'Roads'
        TabOrder = 17
        OnClick = cbRoadsClick
      end
    end
  end
  object Button1: TButton
    Left = 365
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Browse ...'
    TabOrder = 3
    OnClick = Button1Click
  end
end
