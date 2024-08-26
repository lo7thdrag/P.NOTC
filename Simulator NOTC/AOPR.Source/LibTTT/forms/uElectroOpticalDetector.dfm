object ElectroOpticalForm: TElectroOpticalForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Electro Optical Detector'
  ClientHeight = 348
  ClientWidth = 425
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 36
      Height = 17
      Caption = 'Class :'
      TabOrder = 0
    end
    object edtClass: TEdit
      Left = 16
      Top = 24
      Width = 392
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 307
    Width = 425
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 171
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 425
    Height = 258
    Align = alClient
    TabOrder = 2
    object pgc1: TPageControl
      Left = 16
      Top = 2
      Width = 392
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblClassName: TStaticText
          Left = 3
          Top = 11
          Width = 64
          Height = 17
          Caption = 'Sensor Type'
          TabOrder = 0
        end
        object lblMountExtension: TStaticText
          Left = 3
          Top = 42
          Width = 84
          Height = 17
          Caption = 'Detection Range'
          TabOrder = 1
        end
        object lblBlindZones: TStaticText
          Left = 3
          Top = 73
          Width = 124
          Height = 17
          Caption = 'Associated Cross Section'
          TabOrder = 2
        end
        object lblAntenna: TStaticText
          Left = 3
          Top = 104
          Width = 172
          Height = 17
          Caption = 'Maximum Possible Detection Range'
          TabOrder = 3
        end
        object edtMaxPossible: TEdit
          Left = 199
          Top = 103
          Width = 68
          Height = 21
          TabOrder = 4
        end
        object lblFeetAntenna: TStaticText
          Left = 273
          Top = 104
          Width = 18
          Height = 17
          Caption = 'nm'
          TabOrder = 5
        end
        object txt1: TStaticText
          Left = 179
          Top = 11
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object txt2: TStaticText
          Left = 179
          Top = 42
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object txt3: TStaticText
          Left = 179
          Top = 73
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 8
        end
        object txt4: TStaticText
          Left = 179
          Top = 104
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 9
        end
        object edtAssociatedCross: TEdit
          Left = 199
          Top = 70
          Width = 68
          Height = 21
          TabOrder = 10
        end
        object edtDetectionRange: TEdit
          Left = 199
          Top = 38
          Width = 68
          Height = 21
          TabOrder = 11
        end
        object txt5: TStaticText
          Left = 273
          Top = 73
          Width = 37
          Height = 17
          Caption = 'metres'
          TabOrder = 12
        end
        object txt6: TStaticText
          Left = 273
          Top = 42
          Width = 18
          Height = 17
          Caption = 'nm'
          TabOrder = 13
        end
        object cbbSensorType: TComboBox
          Left = 199
          Top = 11
          Width = 145
          Height = 21
          TabOrder = 14
          Items.Strings = (
            'EO Sensor (Optical)'
            'Laser Sensor'
            'IR Sensor (Infrared)')
        end
      end
      object ts1: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object mmNotes: TMemo
          Left = 0
          Top = 0
          Width = 381
          Height = 202
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
