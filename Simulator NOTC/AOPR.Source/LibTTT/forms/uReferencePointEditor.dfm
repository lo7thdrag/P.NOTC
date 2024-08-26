object ReferencePointEditorForm: TReferencePointEditorForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Reference Point Editor (unsure)'
  ClientHeight = 404
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 363
    Width = 400
    Height = 41
    Align = alBottom
    TabOrder = 0
    object btnApply: TButton
      Left = 296
      Top = 12
      Width = 83
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 206
      Top = 12
      Width = 84
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object btnOK: TButton
      Left = 116
      Top = 12
      Width = 84
      Height = 25
      Caption = 'OK'
      TabOrder = 2
    end
    object btnRemovePoint: TButton
      Left = 10
      Top = 12
      Width = 95
      Height = 25
      Caption = 'Remove Point'
      TabOrder = 3
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 400
    Height = 369
    Align = alTop
    TabOrder = 1
    object grbReferencePoints: TGroupBox
      Left = 8
      Top = 8
      Width = 385
      Height = 349
      Caption = 'Reference Points'
      TabOrder = 0
      object grbName: TGroupBox
        Left = 2
        Top = 15
        Width = 381
        Height = 59
        Align = alTop
        BiDiMode = bdLeftToRight
        Ctl3D = True
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 0
        object lblName: TStaticText
          Left = 3
          Top = 8
          Width = 38
          Height = 17
          Caption = 'Name :'
          TabOrder = 0
        end
        object cbxName: TComboBox
          Left = 3
          Top = 24
          Width = 366
          Height = 21
          TabOrder = 1
        end
      end
      object grbSurfaceTrack: TGroupBox
        Left = 2
        Top = 92
        Width = 381
        Height = 255
        Align = alBottom
        TabOrder = 1
        Visible = False
        object btnAddSurface: TSpeedButton
          Left = 346
          Top = 32
          Width = 23
          Height = 22
          Caption = 'icon'
        end
        object lblTypeSurface: TStaticText
          Left = 3
          Top = 6
          Width = 35
          Height = 17
          Caption = 'Type :'
          TabOrder = 0
        end
        object lblPositionSurface: TStaticText
          Left = 3
          Top = 37
          Width = 48
          Height = 17
          Caption = 'Position :'
          TabOrder = 1
        end
        object lblGridSurface: TStaticText
          Left = 3
          Top = 68
          Width = 30
          Height = 17
          Caption = 'Grid :'
          TabOrder = 2
        end
        object lblDomainSurface: TStaticText
          Left = 3
          Top = 99
          Width = 46
          Height = 17
          Caption = 'Domain :'
          TabOrder = 3
        end
        object lblIndentitySurface: TStaticText
          Left = 3
          Top = 130
          Width = 55
          Height = 17
          Caption = 'Indentity :'
          TabOrder = 4
        end
        object lblDisplaySurface: TStaticText
          Left = 3
          Top = 161
          Width = 45
          Height = 17
          Caption = 'Display :'
          TabOrder = 5
        end
        object lblCourseSurface: TStaticText
          Left = 3
          Top = 192
          Width = 45
          Height = 17
          Caption = 'Course :'
          TabOrder = 6
        end
        object lblGroundSpeedSurface: TStaticText
          Left = 3
          Top = 223
          Width = 79
          Height = 17
          Caption = 'Ground Speed :'
          TabOrder = 7
        end
        object cbxTypeSurface: TComboBox
          Left = 132
          Top = 3
          Width = 145
          Height = 21
          TabOrder = 8
        end
        object edtPosition1Surface: TEdit
          Left = 132
          Top = 33
          Width = 100
          Height = 21
          TabOrder = 9
        end
        object edtPosition2Surface: TEdit
          Left = 240
          Top = 33
          Width = 100
          Height = 21
          TabOrder = 10
        end
        object edtGrid1Surface: TEdit
          Left = 132
          Top = 64
          Width = 100
          Height = 21
          TabOrder = 11
        end
        object edtGrid2Surface: TEdit
          Left = 240
          Top = 64
          Width = 100
          Height = 21
          TabOrder = 12
        end
        object cbxDomainSurface: TComboBox
          Left = 132
          Top = 95
          Width = 208
          Height = 21
          TabOrder = 13
        end
        object cbxIdentitySurface: TComboBox
          Left = 132
          Top = 126
          Width = 208
          Height = 21
          TabOrder = 14
        end
        object edtDisplaySurface: TEdit
          Left = 132
          Top = 157
          Width = 121
          Height = 21
          TabOrder = 15
        end
        object edtCourseSurface: TEdit
          Left = 184
          Top = 188
          Width = 121
          Height = 21
          TabOrder = 16
        end
        object edtGroundSpeedSurface: TEdit
          Left = 184
          Top = 219
          Width = 121
          Height = 21
          TabOrder = 17
        end
        object lbldegreesTSurface: TStaticText
          Left = 311
          Top = 190
          Width = 52
          Height = 17
          Caption = 'degrees T'
          TabOrder = 18
        end
        object lblKnotsSurface: TStaticText
          Left = 311
          Top = 221
          Width = 30
          Height = 17
          Caption = 'knots'
          TabOrder = 19
        end
      end
      object grbDistresseed: TGroupBox
        Left = 3
        Top = 91
        Width = 381
        Height = 255
        TabOrder = 2
        Visible = False
        object btnAddDistressed: TSpeedButton
          Left = 346
          Top = 32
          Width = 23
          Height = 22
          Caption = 'icon'
        end
        object lblTypeDistressed: TStaticText
          Left = 3
          Top = 6
          Width = 35
          Height = 17
          Caption = 'Type :'
          TabOrder = 0
        end
        object lblPositionDistressed: TStaticText
          Left = 3
          Top = 37
          Width = 48
          Height = 17
          Caption = 'Position :'
          TabOrder = 1
        end
        object lblgridDistressed: TStaticText
          Left = 3
          Top = 68
          Width = 30
          Height = 17
          Caption = 'Grid :'
          TabOrder = 2
        end
        object lblSymbolDistressed: TStaticText
          Left = 3
          Top = 130
          Width = 45
          Height = 17
          Caption = 'Symbol :'
          TabOrder = 3
        end
        object lblDisplayDistressed: TStaticText
          Left = 3
          Top = 161
          Width = 45
          Height = 17
          Caption = 'Display :'
          TabOrder = 4
        end
        object cbxTypeDistressed: TComboBox
          Left = 132
          Top = 3
          Width = 145
          Height = 21
          TabOrder = 5
        end
        object edtPositionDistressed1: TEdit
          Left = 132
          Top = 33
          Width = 100
          Height = 21
          TabOrder = 6
        end
        object edtPositionDistressed2: TEdit
          Left = 240
          Top = 33
          Width = 100
          Height = 21
          TabOrder = 7
        end
        object edtGridDistressed1: TEdit
          Left = 132
          Top = 64
          Width = 100
          Height = 21
          TabOrder = 8
        end
        object edtGridDistressed2: TEdit
          Left = 240
          Top = 64
          Width = 100
          Height = 21
          TabOrder = 9
        end
        object cbxSymbolDistressed: TComboBox
          Left = 132
          Top = 126
          Width = 208
          Height = 21
          TabOrder = 10
        end
        object edtDisplayDistressed: TEdit
          Left = 132
          Top = 157
          Width = 121
          Height = 21
          TabOrder = 11
        end
      end
    end
  end
end
