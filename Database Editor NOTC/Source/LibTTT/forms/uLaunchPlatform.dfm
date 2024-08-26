object frmLaunchPlaform: TfrmLaunchPlaform
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Launch Platform'
  ClientHeight = 257
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 19
    Top = 210
    Width = 437
    Height = 3
  end
  object Notebook1: TNotebook
    Left = 0
    Top = 0
    Width = 475
    Height = 200
    Align = alTop
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
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Class'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 19
        Top = 17
        Width = 32
        Height = 13
        Caption = 'Class :'
      end
      object Label2: TLabel
        Left = 19
        Top = 46
        Width = 50
        Height = 13
        Caption = 'Available :'
      end
      object Label3: TLabel
        Left = 19
        Top = 76
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object Label4: TLabel
        Left = 19
        Top = 105
        Width = 80
        Height = 13
        Caption = 'Track Identifier :'
      end
      object Label5: TLabel
        Left = 19
        Top = 137
        Width = 55
        Height = 13
        Caption = 'Formation :'
      end
      object lbClass: TLabel
        Left = 114
        Top = 17
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbAvailable: TLabel
        Left = 114
        Top = 46
        Width = 12
        Height = 13
        Caption = '---'
      end
      object edtName: TEdit
        Left = 114
        Top = 72
        Width = 342
        Height = 21
        TabOrder = 0
      end
      object edtTrackId: TEdit
        Left = 114
        Top = 101
        Width = 51
        Height = 21
        TabOrder = 1
      end
      object edtFormation: TEdit
        Left = 114
        Top = 133
        Width = 51
        Height = 21
        TabOrder = 2
        Text = '1'
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Launch'
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label6: TLabel
        Left = 19
        Top = 20
        Width = 32
        Height = 13
        Caption = 'Class :'
      end
      object Label7: TLabel
        Left = 19
        Top = 49
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object lbClassLaunch: TLabel
        Left = 97
        Top = 20
        Width = 12
        Height = 13
        Caption = '---'
      end
      object lbNameLaunch: TLabel
        Left = 97
        Top = 49
        Width = 12
        Height = 13
        Caption = '---'
      end
      object Label8: TLabel
        Left = 55
        Top = 86
        Width = 373
        Height = 26
        Caption = 
          'Use the Platform Control sheet to set Guidance and EMCON for thi' +
          's platform, '#13'then select Launch'
      end
    end
  end
  object btnNext: TButton
    Left = 220
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Next >'
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
    TabOrder = 2
    OnClick = btnLaunchClick
  end
  object btnCancel: TButton
    Left = 382
    Top = 222
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
