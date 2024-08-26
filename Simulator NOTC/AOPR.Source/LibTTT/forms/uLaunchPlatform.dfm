object frmLaunchPlaform: TfrmLaunchPlaform
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Launch Platform'
  ClientHeight = 257
  ClientWidth = 475
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 19
    Top = 210
    Width = 437
    Height = 3
  end
  object btnNext: TButton
    Left = 220
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Next >'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnNextClick
  end
  object btnLaunch: TButton
    Left = 301
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Launch'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnLaunchClick
  end
  object btnCancel: TButton
    Left = 382
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 475
    Height = 200
    Align = alTop
    Color = 5980694
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    PageIndex = 2
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      object lvEmbarked: TListView
        Left = 17
        Top = 16
        Width = 437
        Height = 172
        Columns = <
          item
            Caption = 'Class'
            MinWidth = 100
            Width = 300
          end
          item
            Caption = 'Available'
            Width = 100
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Class'
      object Label1: TLabel
        Left = 20
        Top = 20
        Width = 39
        Height = 16
        Caption = 'Class :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 20
        Top = 50
        Width = 60
        Height = 16
        Caption = 'Available :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 20
        Top = 80
        Width = 42
        Height = 16
        Caption = 'Name :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 20
        Top = 110
        Width = 96
        Height = 16
        Caption = 'Track Identifier :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 20
        Top = 140
        Width = 67
        Height = 16
        Caption = 'Formation :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbClass: TLabel
        Left = 125
        Top = 20
        Width = 15
        Height = 16
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbAvailable: TLabel
        Left = 125
        Top = 50
        Width = 15
        Height = 16
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtName: TEdit
        Left = 125
        Top = 77
        Width = 342
        Height = 24
        TabOrder = 0
      end
      object edtTrackId: TEdit
        Left = 125
        Top = 107
        Width = 51
        Height = 24
        TabOrder = 1
        OnChange = edtTrackIdChange
      end
      object edtFormation: TEdit
        Left = 125
        Top = 137
        Width = 51
        Height = 24
        TabOrder = 2
        Text = '1'
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Launch'
      object Label6: TLabel
        Left = 20
        Top = 20
        Width = 39
        Height = 16
        Caption = 'Class :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 20
        Top = 50
        Width = 42
        Height = 16
        Caption = 'Name :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbClassLaunch: TLabel
        Left = 97
        Top = 20
        Width = 15
        Height = 16
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbNameLaunch: TLabel
        Left = 97
        Top = 50
        Width = 15
        Height = 16
        Caption = '---'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 20
        Top = 90
        Width = 442
        Height = 32
        Caption = 
          'Use the Platform Control sheet to set Guidance and EMCON for thi' +
          's platform, '#13'then select Launch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 16
    Top = 216
  end
end
