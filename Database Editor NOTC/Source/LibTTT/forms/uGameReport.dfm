object frmGameReport: TfrmGameReport
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Game Report'
  ClientHeight = 425
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShortCut = FormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 275
    Top = 32
    Width = 2
    Height = 395
  end
  object lbl1: TLabel
    Left = 104
    Top = 8
    Width = 75
    Height = 13
    Caption = 'Game Report'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 360
    Top = 8
    Width = 139
    Height = 13
    Caption = 'Description Of The Game'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnDelete: TSpeedButton
    Left = 360
    Top = 392
    Width = 73
    Height = 25
    Caption = 'Delete'
    Visible = False
    OnClick = BtnHandler
  end
  object btnClear: TSpeedButton
    Tag = 1
    Left = 439
    Top = 392
    Width = 73
    Height = 25
    Caption = 'Clear'
    Visible = False
    OnClick = BtnHandler
  end
  object btnClose: TSpeedButton
    Tag = 2
    Left = 518
    Top = 392
    Width = 73
    Height = 25
    Caption = 'Close'
    OnClick = BtnHandler
  end
  object pnl1: TPanel
    Left = 283
    Top = 32
    Width = 366
    Height = 354
    TabOrder = 0
    object lbl3: TLabel
      Left = 8
      Top = 18
      Width = 79
      Height = 13
      Caption = 'Game Name      :'
    end
    object lbl4: TLabel
      Left = 8
      Top = 39
      Width = 81
      Height = 13
      Caption = 'Scenario Name  :'
    end
    object lbl5: TLabel
      Left = 8
      Top = 59
      Width = 81
      Height = 13
      Caption = 'Date                  :'
    end
    object lbl6: TLabel
      Left = 8
      Top = 80
      Width = 80
      Height = 13
      Caption = 'Time Start         :'
    end
    object lbl7: TLabel
      Left = 8
      Top = 100
      Width = 80
      Height = 13
      Caption = 'Time End           :'
    end
    object lblGame_Name: TLabel
      Left = 101
      Top = 18
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object lblScenario: TLabel
      Left = 101
      Top = 39
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object lblDate: TLabel
      Left = 101
      Top = 59
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object lblTime_Start: TLabel
      Left = 101
      Top = 80
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object lblTime_End: TLabel
      Left = 101
      Top = 100
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object lbl8: TLabel
      Left = 8
      Top = 119
      Width = 82
      Height = 13
      Caption = 'Subject             : '
    end
    object lblSubject: TLabel
      Left = 101
      Top = 119
      Width = 124
      Height = 13
      Caption = '-------------------------------'
    end
    object rg1: TRadioGroup
      Left = 8
      Top = 160
      Width = 345
      Height = 178
      Caption = 'Description'
      TabOrder = 0
    end
    object mmoDesc: TMemo
      Left = 20
      Top = 181
      Width = 321
      Height = 153
      Enabled = False
      Lines.Strings = (
        'mmoDesc')
      TabOrder = 1
    end
  end
  object lvGameReport: TListView
    Left = 8
    Top = 32
    Width = 261
    Height = 354
    BevelInner = bvNone
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'id'
        Width = 0
      end
      item
        Caption = 'Game Name'
        Width = 100
      end
      item
        Caption = 'Subject'
        Width = 160
      end>
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvGameReportSelectItem
  end
end
