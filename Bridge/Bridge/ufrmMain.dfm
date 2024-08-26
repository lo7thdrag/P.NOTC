object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'A/NOTC 3D BRIDGE'
  ClientHeight = 850
  ClientWidth = 557
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object LogMemo: TMemo
    Left = 0
    Top = 161
    Width = 557
    Height = 689
    Align = alClient
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object TopPanel: TPanel
    Left = 0
    Top = 32
    Width = 557
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 13
      Top = 14
      Width = 116
      Height = 13
      Caption = 'N/AOTC Sim Server IP : '
    end
    object lbl2: TLabel
      Left = 41
      Top = 71
      Width = 88
      Height = 13
      Caption = 'N/AOTC 3D Port : '
    end
    object lbl21: TLabel
      Left = 16
      Top = 105
      Width = 76
      Height = 13
      Caption = '3D Bridge Port :'
    end
    object lbl3: TLabel
      Left = 39
      Top = 43
      Width = 88
      Height = 13
      Caption = 'N/AOTC 2D Port : '
    end
    object lbl11: TLabel
      Left = 245
      Top = 14
      Width = 137
      Height = 13
      Caption = 'N/AOTC SimSvr GameAddr : '
    end
    object lbl31: TLabel
      Left = 283
      Top = 43
      Width = 99
      Height = 13
      Caption = 'A/NOTC GamePort : '
    end
    object ListenButton: TButton
      Left = 444
      Top = 68
      Width = 95
      Height = 55
      Caption = 'Start'
      TabOrder = 0
      OnClick = ListenButtonClick
    end
    object edtSvrIp: TEdit
      Left = 132
      Top = 11
      Width = 84
      Height = 21
      TabOrder = 1
      Text = '192.168.1.50'
    end
    object edtSvrPort: TEdit
      Left = 132
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '6546'
    end
    object edt3dSvrPort: TEdit
      Left = 132
      Top = 68
      Width = 60
      Height = 21
      TabOrder = 3
      Text = '32009'
    end
    object edtThisSvrPort: TEdit
      Left = 98
      Top = 102
      Width = 60
      Height = 21
      TabOrder = 4
      Text = '9000'
    end
    object chkShowLog: TCheckBox
      Left = 233
      Top = 101
      Width = 76
      Height = 17
      Caption = 'Verbose log'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = chkShowLogClick
    end
    object btnClearLog: TButton
      Left = 313
      Top = 97
      Width = 75
      Height = 25
      Caption = 'Clear Log'
      TabOrder = 6
      OnClick = btnClearLogClick
    end
    object edtSvrUdpIp: TEdit
      Left = 386
      Top = 11
      Width = 84
      Height = 21
      TabOrder = 7
      Text = '192.168.1.255'
    end
    object edtSvrUdpPort: TEdit
      Left = 386
      Top = 40
      Width = 57
      Height = 21
      TabOrder = 8
      Text = '54325'
    end
  end
  object pnlClose: TPanel
    Left = 0
    Top = 0
    Width = 557
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    Color = clActiveCaption
    ParentBackground = False
    TabOrder = 2
    object imgClose: TImage
      Left = 520
      Top = -2
      Width = 34
      Height = 34
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000280000
        002808060000008CFEB86D000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000002
        BE4944415478DAED983D6FD3501885DFF0290AB446801800359919482760A25D
        808D4442AC7525F634F00392FE0014338394CCA8126142B0349D80A91980358E
        80812F611594AA8252CEF1B51337C4C6516ABB821EE938378E933C3AF7F56B5F
        A764872B9534C07F01A8C13A7C19CEC2E911FFB3099BF063B8362A600EAE3A90
        5188A00B41A0418015789E834BF055F81A7C7644A257F01BF82EFCAEB7BBEC80
        86062CF14BE3D8DC816F45129EC803077455BD35E06218401DAE126E113E1711
        9CABD7F08D1E641EAEFF0DB005A717224CAE5F4CB2A486169C715E0702EA7095
        75F6222638574CF1B91A729A0D3F40C67B9D67C7CD9801EF8B3A5344B59F9C1F
        A0094F3E93E86BAF5F6FE18B3D868C1FE02637EF63867375BA374CFD31181670
        7F362B870B057BBCBEBC2C6BB55AF7B3BDE9B41C2DA9B2DF68B7E55BB91C3F20
        757C69490E4E4FCB2FCB920F998C6C5AEAE41BAF54E4C8BCDDE3EDFD1BA6990C
        20533CB9B2628FBF1B86AC168B767AA75A2D7B5F07A95A7373217F2D02406A02
        60EE547F9C9A9209A4C75499DAE79999D0E94506B847D3EC14991CA79AEF2926
        D7F1D4656280D401247602F5E8EA47B3299F90E6B08A0CD05B77945B8F3B0650
        C3548ECDCE6ED9C77AFCD96C260F7848D7E558B56A8F991AFB5F0A75B8DE68C8
        179C248902726AD90BF7E195672B7BDE18803507D80270C73042FE5A0480DEA9
        F53664BF061E2B605043F636F0B57A5DBEE6F3C924B8DDDA058C03D084275F62
        732666382E9EAEA8219B67F73234F0963FCE0593AB87D25D7306DEF2F326AEC2
        85FA62CC8017A4BB90673BA8F901F25684BD434B68D9698A673D32089062BC8F
        125AB86F49CF0F90E2F5A910F3A30F4E5AB9FF98A087473CD84E9E0BF9DBA2D2
        1C3551D6D913F8A97417EAD43D711E540D0348E90E647ABBD373C48B34A7B5EE
        7740D827AC04CD39A0E747846A8BEA750D51F5167827F14F3C02DE050CD26F9D
        D7EE29244B39280000000049454E44AE426082}
      Proportional = True
      Stretch = True
      OnClick = imgCloseClick
    end
  end
  object tmrGetPacketAsAotcClient: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrGetPacketAsAotcClientTimer
    Left = 56
    Top = 168
  end
  object tmrGetPacketAs3dServer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrGetPacketAs3dServerTimer
    Left = 56
    Top = 240
  end
  object tmrGetPacketAsAotcServer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrGetPacketAsAotcServerTimer
    Left = 208
    Top = 168
  end
  object tmrDelayer: TTimer
    Enabled = False
    Left = 424
    Top = 360
  end
  object tmrGetPacketForUDP: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrGetPacketForUDPTimer
    Left = 208
    Top = 240
  end
end
