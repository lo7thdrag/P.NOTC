object VisualDetectorMountForm: TVisualDetectorMountForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Visual Detector Mount'
  ClientHeight = 348
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
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
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 392
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object imgBlindZones: TImage
          Left = 3
          Top = 35
          Width = 70
          Height = 70
        end
        object lblBlindZones: TStaticText
          Left = 3
          Top = 16
          Width = 65
          Height = 17
          Caption = 'Blind Zones :'
          TabOrder = 0
        end
        object lblObserver: TStaticText
          Left = 104
          Top = 35
          Width = 90
          Height = 17
          Caption = 'Observer Height :'
          TabOrder = 1
        end
        object edtObserver: TEdit
          Left = 253
          Top = 33
          Width = 68
          Height = 21
          TabOrder = 2
        end
        object lblFeetObserver: TStaticText
          Left = 327
          Top = 35
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 3
        end
      end
    end
  end
end
