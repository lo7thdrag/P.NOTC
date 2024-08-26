object fESMWindow: TfESMWindow
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Electronic Support Measures'
  ClientHeight = 640
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TStaticText
    Left = 8
    Top = 8
    Width = 33
    Height = 17
    Caption = 'Class:'
    TabOrder = 0
  end
  object edtClass: TEdit
    Left = 8
    Top = 23
    Width = 414
    Height = 21
    TabOrder = 1
  end
  object PageControl1: TPageControl
    Left = -1
    Top = 62
    Width = 441
    Height = 539
    ActivePage = General
    TabOrder = 2
    object General: TTabSheet
      Caption = 'General'
      object gbClassificationCharacteristics: TGroupBox
        Left = 3
        Top = 3
        Width = 416
        Height = 105
        Caption = 'Classification Characteristics'
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 136
          Height = 13
          Caption = 'Maximum Confidence Level :'
        end
        object Label2: TLabel
          Left = 16
          Top = 51
          Width = 102
          Height = 13
          Caption = 'Classification Period :'
        end
        object Label3: TLabel
          Left = 16
          Top = 75
          Width = 101
          Height = 13
          Caption = 'Identfication Period :'
        end
        object Label4: TLabel
          Left = 303
          Top = 51
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object Label5: TLabel
          Left = 303
          Top = 75
          Width = 46
          Height = 13
          Caption = 'hh:mm:ss'
        end
        object cbMaximumConfidenceLevel: TComboBox
          Left = 176
          Top = 21
          Width = 145
          Height = 21
          TabOrder = 0
          Items.Strings = (
            '1(Low)'
            '2(Medium)'
            '3(High)'
            '4(Highest)')
        end
        object edClassificationPeriod: TEdit
          Left = 176
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edIdentificationPeriod: TEdit
          Left = 176
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 2
        end
      end
      object cbCommunicationInterceptCapable: TCheckBox
        Left = 3
        Top = 114
        Width = 206
        Height = 17
        Caption = 'Communication Intercept Capable'
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 137
        Width = 416
        Height = 86
        Caption = 'First Frequency Detection Band'
        TabOrder = 2
        object Label6: TLabel
          Left = 16
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Lower Limit :'
        end
        object Label7: TLabel
          Left = 16
          Top = 51
          Width = 60
          Height = 13
          Caption = 'Upper Limit :'
        end
        object Label9: TLabel
          Left = 306
          Top = 24
          Width = 20
          Height = 13
          Caption = 'MHz'
        end
        object Label10: TLabel
          Left = 306
          Top = 51
          Width = 20
          Height = 13
          Caption = 'MHz'
        end
        object edLowerLimitFirst: TEdit
          Left = 179
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edUpperLimitFirst: TEdit
          Left = 179
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 229
        Width = 416
        Height = 86
        TabOrder = 3
        object Label14: TLabel
          Left = 16
          Top = 24
          Width = 60
          Height = 13
          Caption = 'Lower Limit :'
        end
        object Label15: TLabel
          Left = 16
          Top = 51
          Width = 60
          Height = 13
          Caption = 'Upper Limit :'
        end
        object Label16: TLabel
          Left = 306
          Top = 23
          Width = 20
          Height = 13
          Caption = 'MHz'
        end
        object Label17: TLabel
          Left = 306
          Top = 50
          Width = 20
          Height = 13
          Caption = 'MHz'
        end
        object edLowerLimitSecond: TEdit
          Left = 179
          Top = 20
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edUpperLimitSecond: TEdit
          Left = 179
          Top = 47
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 321
        Width = 416
        Height = 86
        Caption = 'Detection Characteristics'
        TabOrder = 4
        object Label8: TLabel
          Left = 16
          Top = 24
          Width = 159
          Height = 13
          Caption = 'Emmiter Detection Range Factor:'
        end
        object Label11: TLabel
          Left = 16
          Top = 51
          Width = 152
          Height = 13
          Caption = 'Sector BLank Detection Factor :'
        end
        object edEmmiterDetectionRangeFactor: TEdit
          Left = 179
          Top = 19
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edSectorBlankDetectionFactor: TEdit
          Left = 179
          Top = 46
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 413
        Width = 416
        Height = 86
        Caption = 'Bearing Error Variance'
        TabOrder = 5
        object Label12: TLabel
          Left = 16
          Top = 24
          Width = 47
          Height = 13
          Caption = 'Minimum :'
        end
        object Label13: TLabel
          Left = 16
          Top = 48
          Width = 33
          Height = 13
          Caption = 'Initial :'
        end
        object Label18: TLabel
          Left = 306
          Top = 24
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object Label19: TLabel
          Left = 306
          Top = 51
          Width = 39
          Height = 13
          Caption = 'degrees'
        end
        object edMinimum: TEdit
          Left = 179
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object edInitial: TEdit
          Left = 179
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 1
        end
      end
      object chkSecondFrequencyDetectionBand: TCheckBox
        Left = 3
        Top = 226
        Width = 187
        Height = 17
        Caption = 'Second Frequency Detection Band'
        TabOrder = 6
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Notes'
      ImageIndex = 3
      object mmNotes: TMemo
        Left = 3
        Top = 3
        Width = 422
        Height = 374
        Lines.Strings = (
          ''
          '')
        TabOrder = 0
      end
    end
  end
  object btOK: TButton
    Left = 200
    Top = 607
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = btOKClick
  end
  object btCancel: TButton
    Left = 281
    Top = 607
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btCancelClick
  end
  object btApply: TButton
    Left = 362
    Top = 607
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 5
    OnClick = btApplyClick
  end
end
