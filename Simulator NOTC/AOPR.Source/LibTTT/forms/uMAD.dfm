object MADMount: TMADMount
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'TestMAD'
  ClientHeight = 341
  ClientWidth = 462
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
    Width = 462
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
      Width = 433
      Height = 21
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 300
    Width = 462
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 372
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 291
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 210
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 49
    Width = 462
    Height = 251
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 433
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblAntenna: TStaticText
          Left = 56
          Top = 35
          Width = 86
          Height = 17
          Caption = 'Antenna Height :'
          TabOrder = 0
        end
        object edtAntenna: TEdit
          Left = 205
          Top = 33
          Width = 68
          Height = 21
          TabOrder = 1
        end
        object lblFeetAntenna: TStaticText
          Left = 287
          Top = 35
          Width = 24
          Height = 17
          Caption = 'feet'
          TabOrder = 2
        end
      end
    end
  end
end
