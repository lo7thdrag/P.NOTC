object ExerciseAreaForm: TExerciseAreaForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Game Area'
  ClientHeight = 420
  ClientWidth = 436
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
  object Panel3: TPanel
    Left = 0
    Top = 67
    Width = 436
    Height = 318
    Align = alClient
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 8
      Top = 7
      Width = 417
      Height = 305
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grbCentre: TGroupBox
          Left = 3
          Top = 27
          Width = 185
          Height = 105
          Caption = 'Centre'
          TabOrder = 0
          object lblLatitude: TStaticText
            Left = 8
            Top = 32
            Width = 50
            Height = 17
            Caption = 'Latitude :'
            TabOrder = 0
          end
          object lblLongitude: TStaticText
            Left = 8
            Top = 64
            Width = 58
            Height = 17
            Caption = 'Longitude :'
            TabOrder = 1
          end
          object edtLatitude: TEdit
            Left = 72
            Top = 33
            Width = 96
            Height = 21
            TabOrder = 2
          end
          object edtLongitude: TEdit
            Left = 72
            Top = 60
            Width = 96
            Height = 21
            TabOrder = 3
          end
        end
        object grbDimensions: TGroupBox
          Left = 211
          Top = 27
          Width = 185
          Height = 105
          Caption = 'Dimensions'
          TabOrder = 1
          object lblMaximum: TStaticText
            Left = 8
            Top = 32
            Width = 55
            Height = 17
            Caption = 'Maximum :'
            TabOrder = 0
          end
          object edtMaximum: TEdit
            Left = 96
            Top = 30
            Width = 57
            Height = 21
            TabOrder = 1
          end
          object lblnm: TStaticText
            Left = 159
            Top = 33
            Width = 18
            Height = 17
            Caption = 'nm'
            TabOrder = 2
          end
        end
        object btnSelectGame: TButton
          Left = 56
          Top = 138
          Width = 289
          Height = 25
          Caption = 'Select Game Centre and Dimensions'
          TabOrder = 2
          OnClick = btnSelectGameClick
        end
        object cbUseCoastlines: TCheckBox
          Left = 211
          Top = 184
          Width = 177
          Height = 17
          Caption = 'Use Coastlines and Features'
          TabOrder = 3
          OnClick = cbUseCoastlinesClick
        end
        object btnImportLandmassData: TButton
          Left = 248
          Top = 216
          Width = 148
          Height = 25
          Caption = 'Import Landmass Data...'
          TabOrder = 4
          OnClick = btnImportLandmassDataClick
        end
        object btnEditLandmassData: TButton
          Left = 248
          Top = 247
          Width = 148
          Height = 25
          Caption = 'Edit Landmass Data...'
          TabOrder = 5
          OnClick = btnEditLandmassDataClick
        end
      end
      object Occulting: TTabSheet
        Caption = 'Occulting'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Memo1: TMemo
          Left = 3
          Top = 3
          Width = 403
          Height = 190
          BorderStyle = bsNone
          Color = clCream
          Lines.Strings = (
            
              'Landmass occulting requires preprocessing of the Game Area terra' +
              'in data. This '
            
              'operation is highly dependent upon the size and complexity of th' +
              'e Game area, '
            'and may take thirty minutes or more.'
            ''
            
              'This preprocessing must be performed for a Game Area when it is ' +
              'created or '
            'whenever any of its parameters are changed.')
          TabOrder = 0
        end
        object btnPreprocess: TButton
          Left = 148
          Top = 232
          Width = 105
          Height = 25
          Caption = 'Preprocess Now'
          TabOrder = 1
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 436
    Height = 67
    Align = alTop
    TabOrder = 1
    object lblName: TStaticText
      Left = 8
      Top = 7
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 8
      Top = 30
      Width = 417
      Height = 21
      TabOrder = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 385
    Width = 436
    Height = 35
    Align = alBottom
    TabOrder = 2
    object btnApply: TButton
      Left = 352
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 271
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 190
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
end
