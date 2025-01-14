object frmRPLibrary: TfrmRPLibrary
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Runtime Platform Library'
  ClientHeight = 251
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
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
    Width = 472
    Height = 200
    Align = alTop
    PageIndex = 2
    TabOrder = 0
    object TPage
      Left = 0
      Top = 0
      Caption = 'Default'
      ExplicitWidth = 462
      ExplicitHeight = 0
      object lvObject: TListView
        Left = 17
        Top = 16
        Width = 437
        Height = 172
        Columns = <
          item
            Caption = 'Class'
            MinWidth = 100
            Width = 400
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
      ExplicitWidth = 462
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 19
        Top = 17
        Width = 32
        Height = 13
        Caption = 'Class :'
      end
      object Label3: TLabel
        Left = 19
        Top = 45
        Width = 34
        Height = 13
        Caption = 'Name :'
      end
      object Label4: TLabel
        Left = 19
        Top = 74
        Width = 80
        Height = 13
        Caption = 'Track Identifier :'
      end
      object lbClass: TLabel
        Left = 114
        Top = 17
        Width = 12
        Height = 13
        Caption = '---'
      end
      object edtName: TEdit
        Left = 114
        Top = 41
        Width = 342
        Height = 21
        TabOrder = 0
      end
      object edtTrackId: TEdit
        Left = 114
        Top = 70
        Width = 51
        Height = 21
        TabOrder = 1
      end
    end
    object TPage
      Left = 0
      Top = 0
      Caption = 'Launch'
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
        Left = 54
        Top = 126
        Width = 373
        Height = 26
        Caption = 
          'Use the Platform Control sheet to set Guidance and EMCON for thi' +
          's platform, '#13'then select Launch'
      end
      object lbPosition: TLabel
        Left = 19
        Top = 79
        Width = 44
        Height = 13
        Caption = 'Position :'
      end
      object btnPosition: TSpeedButton
        Tag = 3
        Left = 258
        Top = 74
        Width = 23
        Height = 22
        Glyph.Data = {
          36090000424D360900000000000036000000280000001F000000180000000100
          18000000000000090000000000000000000000000000000000006161613E3E3E
          3737374040403B3B3B3A3A3A4141414141413A3A3A3A3A3A4040403737373E3E
          3E3D3D3D3838384141413A3A3A3B3B3B4040403737373E3E3E3D3D3D38383841
          41413A3A3A3B3B3B4040403737373E3E3E3C3C3C383838000000B2B2B27C7C7C
          7474747F7F7F7878787777778080808080807878787878788080807474747C7C
          7C7B7B7B7474748080807A7A7A7A7A7A7F7F7F7474747C7C7C7B7B7B74747480
          80807777777979797F7F7F7474747D7D7D7A7A7A757575000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2BDBDBDBBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2C0C0C04949
          491111111111111111111212121212121A1A1AB2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29191914D4D4D5454545F5F
          5F6565656262620000004747476565656363634D4D4D4D4D4D797979BABABAB2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29797976969692929292929298686
          86B2B2B2ADADAD0000007D7D7DB2B2B2ABABAB292929292929545454979797B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23D3D3D3B3B3BB2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B26A6A6A0E0E0EB2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B21616166F6F6FA5A5A5B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2AAAAAA94949413
          13138A8A8AB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2A6A6A68B8B8B2C2C2C838383B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007F7F7FB4B4B4B2B2B2B2B2B2B2B2B2B2B2B2A7A7A727
          27277272729C9C9CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000BDBDBDB7B7B7B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD000000888888BBBBBBB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000B0B0B0B3B3B3B2B2B2B2B2B2BFBFBFB6B6
          B6B2B2B2B1B1B19D9D9DADADADB3B3B3B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3BF
          BFBF3030304C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B0000004F4F4F5151515151515151515858585353
          53737373B2B2B2B2B2B2B2B2B28D8D8D51515151515151515151515152525258
          58581616164C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B0000002424242525252525252525252525252525
          25575757B2B2B2B2B2B2B2B2B27D7D7D25252525252525252525252525252525
          25250909094C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000AFAFAFB2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B27B7B7B000000BBBBBBB6B6B6B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD171717848484B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B22C2C2C4C4C4CB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B29999995F5F5F5A5A5A949494B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B5B5B5B2B2B253
          53535C5C5C828282B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B7B7B7AFAFAF00
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2030303757575B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A4A4A400
          0000868686B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B29A9A9A4545454B4B4BB2B2B2B2B2B2B2B2
          B2B2B2B2ADADAD0000007D7D7DB2B2B2B2B2B2B2B2B2B2B2B274747423232399
          9999ACACACB2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B27A7A7A5A5A5A5555555555559494
          94B5B5B5B4B4B4000000838383B7B7B7ADADAD555555555555585858646464B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B3B3B3000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B28282822121212121216D6D
          6D9595959898980000006E6E6E9898988B8B8B2121212121215B5B5BB2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B23939
          39000000000000000000000000000000090909B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B4B4B4000000D0D0D0B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2A0A0
          A0979797979797979797979797979797999999B2B2B2B2B2B2B2B2B2B2B2B2B2
          B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2B2000000}
        OnClick = btnPositionClick
      end
      object edtPosition: TEdit
        Left = 97
        Top = 75
        Width = 149
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  object btnNext: TButton
    Left = 220
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Next >'
    TabOrder = 1
    OnClick = btnNextClick
  end
  object btnLaunch: TButton
    Left = 301
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Deploy'
    Enabled = False
    TabOrder = 2
    OnClick = btnLaunchClick
  end
  object btnCancel: TButton
    Left = 382
    Top = 219
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
