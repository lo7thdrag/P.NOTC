object CreateDefinitionArea: TCreateDefinitionArea
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsToolWindow
  Caption = 'Definition Area'
  ClientHeight = 728
  ClientWidth = 919
  Color = clBtnFace
  DoubleBuffered = True
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
  object pnl_Border: TPanel
    Left = 0
    Top = 33
    Width = 353
    Height = 695
    Align = alLeft
    ParentBackground = False
    TabOrder = 2
    object lbl_Zoom: TLabel
      Left = 18
      Top = 552
      Width = 48
      Height = 13
      Caption = 'Zoom     : '
    end
    object lbl_ZoomValue: TLabel
      Left = 80
      Top = 552
      Width = 12
      Height = 13
      Caption = '---'
    end
  end
  object grp_ListGameArea: TGroupBox
    Left = 8
    Top = 46
    Width = 339
    Height = 201
    Caption = 'Game Area'
    TabOrder = 0
    object lst_idGameArea: TListBox
      Left = 10
      Top = 32
      Width = 121
      Height = 25
      ItemHeight = 13
      TabOrder = 1
    end
    object chklst_ListGameArea: TCheckListBox
      Left = 10
      Top = 20
      Width = 317
      Height = 169
      OnClickCheck = chklst_ListGameAreaClickCheck
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object grp_SelectedGameArea: TGroupBox
    Left = 6
    Top = 264
    Width = 341
    Height = 297
    Caption = ' Selected Area '
    TabOrder = 1
    object lbl_DefinitionName: TLabel
      Left = 12
      Top = 216
      Width = 85
      Height = 13
      Caption = 'Definition Name  :'
    end
    object btn_Up: TButton
      Left = 254
      Top = 63
      Width = 75
      Height = 25
      Caption = 'Up'
      Enabled = False
      TabOrder = 0
      OnClick = btn_UpClick
    end
    object btn_Down: TButton
      Left = 254
      Top = 95
      Width = 75
      Height = 25
      Caption = 'Down'
      Enabled = False
      TabOrder = 1
      OnClick = btn_DownClick
    end
    object lst_SelectedArea: TListBox
      Left = 14
      Top = 24
      Width = 234
      Height = 169
      ItemHeight = 13
      TabOrder = 2
      OnClick = lst_SelectedAreaClick
    end
    object btn_SetDef: TButton
      Left = 254
      Top = 150
      Width = 75
      Height = 25
      Caption = 'Set Def...'
      Enabled = False
      TabOrder = 3
      OnClick = btn_SetDefClick
    end
    object edt_DefinitionName: TEdit
      Left = 112
      Top = 216
      Width = 185
      Height = 21
      TabOrder = 4
    end
    object btn_OK: TButton
      Left = 164
      Top = 256
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 5
      OnClick = btn_OKClick
    end
    object btn_Cancel: TButton
      Left = 254
      Top = 256
      Width = 74
      Height = 25
      Caption = 'Cancel'
      TabOrder = 6
      OnClick = btn_CancelClick
    end
    object chk_SeeMap: TCheckBox
      Left = 254
      Top = 35
      Width = 67
      Height = 17
      Caption = '  Map'
      TabOrder = 7
      OnClick = chk_SeeMapClick
    end
  end
  object mp_SelectedGameArea: TMap
    Left = 353
    Top = 33
    Width = 566
    Height = 695
    ParentColor = False
    Align = alClient
    TabOrder = 3
    OnMouseDown = mp_SelectedGameAreaMouseDown
    OnMapViewChanged = mp_SelectedGameAreaMapViewChanged
    OnDrawUserLayer = mp_SelectedGameAreaDrawUserLayer
    ExplicitTop = 36
    ControlData = {
      8A1A06007F3A0000D5470000010000000F0000FF0D47656F44696374696F6E61
      727905456D70747900E8030000000000000000000002000E001E000000000000
      0000000000000000000000000000000000000000000600010000000000500001
      010000640000000001F4010000050000800C000000000000000000000000FFFF
      FF000100000000000000000000000000000000000000000000000352E30B918F
      CE119DE300AA004BB851010000009001C027090005417269616C000352E30B91
      8FCE119DE300AA004BB851010000009001BC10060005417269616C0000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
      8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
      918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
      6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
      01000118010000509BBE1B01000000000000001C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8076C000000000008056C0000000000080764000000000008056400100000018
      010000509BBE1B0100000098EA28001C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000020000000000000000
      0000001E00000000000000010000008CE34677B9965F76000000000000000000
      000088B3400000000000408F400001000001}
  end
  object pnl_Top: TPanel
    Left = 0
    Top = 0
    Width = 919
    Height = 33
    Align = alTop
    TabOrder = 4
    object tlb_Button: TToolBar
      Left = 1
      Top = 1
      Width = 917
      Height = 29
      Caption = 'tlb_Button'
      Images = image_button
      TabOrder = 0
      object btn_Cursor: TToolButton
        Left = 0
        Top = 0
        Caption = 'btn_Cursor'
        ImageIndex = 0
        OnClick = btn_CursorClick
      end
      object btn_HandTool: TToolButton
        Left = 23
        Top = 0
        Caption = 'btn_HandTool'
        ImageIndex = 1
        OnClick = btn_HandToolClick
      end
      object btn_ZoomIn: TToolButton
        Left = 46
        Top = 0
        Caption = 'btn_ZoomIn'
        ImageIndex = 4
        OnClick = btn_ZoomInClick
      end
      object btn_ZoomOut: TToolButton
        Left = 69
        Top = 0
        Caption = 'btn_ZoomOut'
        ImageIndex = 5
        OnClick = btn_ZoomOutClick
      end
      object btn_Center: TToolButton
        Left = 92
        Top = 0
        Caption = 'btn_Center'
        ImageIndex = 6
        OnClick = btn_CenterClick
      end
    end
  end
  object image_button: TImageList
    Left = 376
    Top = 64
    Bitmap = {
      494C010107001401040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFF
      FF00C1CECF001511110045484800000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FBFF
      FF00C1CECF001511110045484800000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7E9EC00FDFFFF002120
      20001D1A190035353500130F0F00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D7E9EC00FDFFFF002120
      20001D1A190035353500130F0F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D9ED
      F000F0FFFF00E4F9FC00DAEEF100F7FFFF00EEFFFF00E7FAFB00252424003737
      380035353500100C0B00FCFFFF0000000000000000000000000000000000D9ED
      F000F0FFFF00E4F9FC00DAEEF100F7FFFF00EEFFFF00E7FAFB00252424003737
      380035353500100C0B00FCFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4E8EB00F2FF
      FF00B2BFC100494C4D003739390078808100B8C7C900FFFFFF00090404003435
      35002E2E2E00828C8D00DFF2F500000000000000000000000000D4E8EB00F2FF
      FF00B2BFC100494C4D003739390078808100B8C7C900FFFFFF00090404003435
      35002E2E2E00828C8D00DFF2F500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D8EBEE00A6B2B3000202
      02006A6F7000CDDDDF00DDEEF100ADB7B8005F636400282A2A00272625002321
      2100868F9100E0F3F600000000000000000000000000D8EBEE00A6B2B3000202
      02006A6F7000CDDDDF00DDEEF100ADB7B8005F636400282A2A00272625002321
      2100868F9100E0F3F60000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEDEE00017161600FFFF
      FF00D9EDF0000000000000000000D5E8EB00DBEFF200B8C7C90042464600F6FF
      FF000000000000000000000000000000000000000000CEDEE00017161600FFFF
      FF00D9EDF0000000000000000000D5E8EB00DBEFF200B8C7C90042464600F6FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000016131200EFFFFF000000
      00000000000000000000333333000000000000000000E0F4F6003C3D3D00D3E6
      E900E2F8FA000000000000000000000000000000000016131200EFFFFF000000
      00000000000000000000000000000000000000000000E0F4F6003C3D3D00D3E6
      E900E2F8FA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F9FFFF00EDFF
      FF00F1FFFF00EFFFFF0033333300EFFFFF00F2FFFF00D3E6E900838C8E009EAB
      AE00F4FFFF000000000000000000000000000000000000000000F9FFFF00EDFF
      FF00F1FFFF00EFFFFF00EFFFFF00EFFFFF00F2FFFF00D3E6E900838C8E009EAB
      AE00F4FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000016121100F4FFFF001D1C
      1B000202020006010100333333000601010001010100E5FAFD00B5C4C600737B
      7C00F3FFFF000000000000000000000000000000000016121100F4FFFF001D1C
      1B000202020006010100060101000601010001010100E5FAFD00B5C4C600737B
      7C00F3FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3FFFF00EDFF
      FF00F1FFFF00EFFFFF0033333300EFFFFF00F2FFFF00D4E7EA00949FA2008D98
      9A00F7FFFF000000000000000000000000000000000000000000F3FFFF00EDFF
      FF00F1FFFF00EFFFFF00EFFFFF00EFFFFF00F2FFFF00D4E7EA00949FA2008D98
      9A00F7FFFF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003D3D3D00D2E6E900D4E7
      EA000000000000000000333333000000000000000000F7FFFF0006040300EFFF
      FF00D9EEF100000000000000000000000000000000003D3D3D00D2E6E900D4E7
      EA000000000000000000000000000000000000000000F7FFFF0006040300EFFF
      FF00D9EEF1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009DABAD00595E5E00E7FB
      FD00D4E7EA00000000000000000000000000D3E7EA00F1FFFF0001010100F5FF
      FF00D5E8EB00000000000000000000000000000000009DABAD00595E5E00E7FB
      FD00D4E7EA00000000000000000000000000D3E7EA00F1FFFF0001010100F5FF
      FF00D5E8EB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7F9FB0051555600494C
      4D00B6C2C300F8FFFF00F5FFFF00E8FAFC00B0BBBB0001010100EFFFFF00D5E8
      EB000000000000000000000000000000000000000000E7F9FB0051555600494C
      4D00B6C2C300F8FFFF00F5FFFF00E8FAFC00B0BBBB0001010100EFFFFF00D5E8
      EB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E4F7FA00B4C1
      C300686D6E000000000000000000282626006D747400FBFFFF00D4E7EA000000
      0000000000000000000000000000000000000000000000000000E4F7FA00B4C1
      C300686D6E000000000000000000282626006D747400FBFFFF00D4E7EA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000EFEFEF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C6000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5A5A500CECECE00F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B5007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E7E7E7009C9C9C0094949400D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8C000000000084848400B5B5B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00CECE
      CE00000000000000000000000000A5A5A500DEDEDE00F7F7F7008C8C8C000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B5B5B5008484840000000000000000000000000094949400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7F7F700EFEFEF009C9C
      9C00DEDEDE00F7F7F700E7E7E700BDBDBD00EFEFEF00ADADAD00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000094949400000000000000000000000000000000000000000084848400B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00DEDE
      DE008C8C8C00EFEFEF0084848400DEDEDE00DEDEDE00A5A5A500000000000000
      00000000000000000000000000000000000000000000C6C6C60000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000008C8C
      8C00000000000000000000000000000000000000000000000000000000009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E700DEDE
      DE00EFEFEF0084848400C6C6C600CECECE00BDBDBD000000000000000000F7F7
      F700000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000002121
      2100212121002121210000000000000000000000000021212100212121002121
      2100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00DEDE
      DE00CECECE00DEDEDE00D6D6D600E7E7E7008C8C8C00B5B5B500BDBDBD00BDBD
      BD00EFEFEF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00E7E7
      E700CECECE00D6D6D600CECECE00D6D6D600D6D6D600DEDEDE00DEDEDE008C8C
      8C00E7E7E7000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00E7E7
      E700CECECE00CECECE00CECECE00D6D6D600BDBDBD00DEDEDE00949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00E7E7
      E700CECECE00CECECE00C6C6C600CECECE00D6D6D600A5A5A500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00C6C6C600C6C6C600CECECE00C6C6C600BDBDBD000000000000000000F7F7
      F700000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700E7E7
      E700C6C6C600BDBDBD00C6C6C600DEDEDE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00000000007B7B7B00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFEFEF00EFEF
      EF00B5B5B500B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007B7B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800080808000808080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E7E7E7000000
      0000ADADAD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F7F7F700B5B5
      B5000000000000000000F7F7F700F7F7F7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFE1FFE1FE7F0000
      FF81FF81FE1F0000E001E001FC1F0000C001C001FF7F000080038003CE730000
      860F860FC73800009D879F878000000080078007CF79000080078007EE7B0000
      80078007FF3F00008D878F87FC1F000087078707FE3F0000800F800FFF7F0000
      C01FC01FFFFF0000FFFFFFFFFFFF0000FF7FFDBFFFFFFFFFFF1FF01FFCFFFFFF
      FE1FF00FFC3FFF1FCE1FC00FF03FFF1F803FC00FF00FFF1FC03F800FE00FFF1F
      C06F800FE00FFF1FC007000FFC7FFF1FC007100FFC7FFF1FC01FF00FFC7FF803
      C03FF00FFC7FFC07C06FF01FFC7FFE0FC0FFF03FFC7FFF1FC3FFF87FFC7FFFBF
      D7FFFCFFFFFFFFBFCCFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end