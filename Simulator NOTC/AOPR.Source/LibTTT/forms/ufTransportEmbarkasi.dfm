object frmTransportEmbarkasi: TfrmTransportEmbarkasi
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Transport Embarkasi'
  ClientHeight = 620
  ClientWidth = 990
  Color = 6770973
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 334
    Width = 990
    Height = 286
    Align = alBottom
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object lblSelectedRampPosition: TLabel
      Left = 0
      Top = 190
      Width = 990
      Height = 16
      Alignment = taCenter
      AutoSize = False
      Caption = 'No Platform Selected'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblIndicator: TLabel
      Left = 338
      Top = 14
      Width = 315
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '< BACK (180)                    FRONT (0) >'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object pnlImageArea: TPanel
      Left = 48
      Top = 45
      Width = 894
      Height = 112
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object imgArea: TImage
        Left = 1
        Top = 1
        Width = 892
        Height = 110
        Align = alClient
        OnMouseDown = imgAreaMouseDown
        ExplicitLeft = 4
      end
    end
    object pnlFrontRamp: TPanel
      Left = 942
      Top = 45
      Width = 30
      Height = 112
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 1
      Visible = False
    end
    object pnlStarboardRampBack: TPanel
      Left = 88
      Top = 157
      Width = 110
      Height = 30
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 2
      Visible = False
    end
    object pnlStarboardRampFront: TPanel
      Left = 792
      Top = 157
      Width = 110
      Height = 30
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 3
      Visible = False
    end
    object pnlPortRampBack: TPanel
      Left = 88
      Top = 15
      Width = 110
      Height = 30
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 4
      Visible = False
    end
    object pnlPortRampFront: TPanel
      Left = 792
      Top = 15
      Width = 110
      Height = 30
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 5
      Visible = False
    end
    object pnlBackRamp: TPanel
      Left = 18
      Top = 45
      Width = 30
      Height = 112
      BevelOuter = bvNone
      Color = clRed
      ParentBackground = False
      TabOrder = 6
      Visible = False
    end
    object btnDisembark: TButton
      Left = 457
      Top = 220
      Width = 76
      Height = 25
      Caption = 'Disembark'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = btnDisembarkClick
    end
    object btnClose: TButton
      Left = 865
      Top = 250
      Width = 76
      Height = 25
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = btnCloseClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 990
    Height = 334
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    object pnlShipDetails: TPanel
      Left = 0
      Top = 0
      Width = 495
      Height = 334
      Align = alLeft
      TabOrder = 0
      object lblShipName: TLabel
        Left = 0
        Top = 30
        Width = 495
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ship Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipClassName: TLabel
        Left = 0
        Top = 65
        Width = 495
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ship Class Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipMaxWeightTitle: TLabel
        Left = 12
        Top = 125
        Width = 141
        Height = 18
        Caption = 'Maximum Hull Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipCurrWeightTitle: TLabel
        Left = 186
        Top = 125
        Width = 125
        Height = 18
        Caption = 'Current Hull Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipLengthTitle: TLabel
        Left = 25
        Top = 225
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Hull Length'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipCurrWeightUnit: TLabel
        Left = 199
        Top = 175
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ton'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipAreaTitle: TLabel
        Left = 355
        Top = 225
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Hull Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipMaxWeightUnit: TLabel
        Left = 25
        Top = 175
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ton'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipRemWeightUnit: TLabel
        Left = 355
        Top = 175
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Ton'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipRemWeightTitle: TLabel
        Left = 342
        Top = 125
        Width = 143
        Height = 18
        Caption = 'Remaining Hull Weight'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipWidthUnit: TLabel
        Left = 199
        Top = 275
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipWidthTitle: TLabel
        Left = 199
        Top = 225
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Hull Width'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipAreaUnit: TLabel
        Left = 355
        Top = 275
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'#178
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipLengthUnit: TLabel
        Left = 25
        Top = 275
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblShipRemWeight: TLabel
        Left = 355
        Top = 150
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipCurrWeight: TLabel
        Left = 199
        Top = 150
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipLength: TLabel
        Left = 25
        Top = 250
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipMaxWeight: TLabel
        Left = 25
        Top = 150
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipWidth: TLabel
        Left = 199
        Top = 250
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblShipArea: TLabel
        Left = 355
        Top = 250
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '99999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlPlatformDetails: TPanel
      Left = 495
      Top = 0
      Width = 495
      Height = 334
      Align = alClient
      TabOrder = 1
      object lblSelectedPlatform: TLabel
        Left = 6
        Top = 26
        Width = 495
        Height = 33
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedPlatformClass: TLabel
        Left = 0
        Top = 65
        Width = 495
        Height = 23
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Class Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedPlatformLengthTitle: TLabel
        Left = 25
        Top = 125
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Length'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformWidthTitle: TLabel
        Left = 199
        Top = 125
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Width'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPlatformMoveTitle: TLabel
        Left = 25
        Top = 225
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Move'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformWidthUnit: TLabel
        Left = 199
        Top = 175
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPlatformStatusTitle: TLabel
        Left = 355
        Top = 225
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformLengthUnit: TLabel
        Left = 25
        Top = 175
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformAreaUnit: TLabel
        Left = 355
        Top = 175
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Feet'#178
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformAreaTitle: TLabel
        Left = 355
        Top = 125
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Platform Area'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPlatformHeadingTitle: TLabel
        Left = 199
        Top = 225
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Heading'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblSelectedPlatformArea: TLabel
        Left = 355
        Top = 150
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedPlatformWidth: TLabel
        Left = 199
        Top = 150
        Width = 98
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSelectedPlatformLength: TLabel
        Left = 25
        Top = 150
        Width = 114
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = '1500'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPlatformStatus: TLabel
        Left = 355
        Top = 250
        Width = 116
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Queue'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object imgTurnTable: TImage
        Left = 206
        Top = 245
        Width = 85
        Height = 70
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000550000
          00410806000000A0B2E8D7000000097048597300000B1300000B1301009A9C18
          000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000007
          864944415478DAED5C41525B4710EDF94A527656E604914F603801A252098EB3
          089CC07801C8AB88130027B0BC4AC0AE829C00BC49800DF8042827403901DEA4
          7048F4276F463291F4BB7BE64B42E82B74154595F4359A79EAE97EDDD33D86EE
          65E4624639983DA047F4007F44E5CE1F51425F518B7E37CFE8F0AE17DB33D753
          CCF36F7AEEE646297DA06B6A9A65FC1F818C0454FB1BAD00BC57643DA0CC03F4
          D87C47CDF1411639EF63BAEC99B301A8D6CFD3817B689ED2EB41C61D15A8158C
          742ABC7D86C92D8C19AFB8791FD32640DC62DF2CD192F986DE0D32EED0A0DA23
          AAE1DF2BF181842AE65B7A3F1E9872CEDD99806BBA60779885B62654338BF44B
          DE718702151ABA85113695479AD0D2C7B906ADD1A3D29FB464137A622C95ADA1
          59BF68D3B570B76083B1B14D2D5103CFBD6F25D4A09FF39B1868AB335B3505A1
          95BCC00E0C6A04A0F1130290C9476885A579805419744E9006FEF653836D1B09
          70C074E55BC7CDE3034860CB9F79AD827685B4F4B32A55ACA5CD2181E41766E1
          68527AFDCF5BCC27BC1E07AA03B78179CFB20FB568CE7CEF7FB4F077E79D6CE0
          97DD07902FF04CD94D4EA451AB345B025BB80D3099059EB50CBDD034D7AF29A1
          79FA02DEFE9AF630F7A5EC439E11CCC5B0985CA07AB0DA80969991B6B045B6D5
          01DC36BFF2DEF6C7DB069301653BDD153C7D769DFB58CF73E6AD265D01D8009F
          CD07EA113C2507684743D50F57A99C58E107199F34616F1742F6B6C30A4E5953
          60A80EE5D9D03E1F0DAAE298823CB4F412DEBC856D6584E0609C826D9C121460
          578FF03CB07FD139714A60690166E04CFA6C14A89D6D7FC1BCD5EC7C4153FA6C
          A94A2B70467B7783A0B6A8B039B0279ECE9D323C56350371A04ADB3E107E266B
          B0A246090CEE5A2C6D00D8BAFAC8AF5843C2AC41F12141507D5C6F184D0B3826
          BFE5533AB86BDC42922658DF4F3A07BDA15C3D2F424B3F42A9186D0D83CA6BA9
          1E2939A794C21E4D820D0D2E103636A1B900E52A435BCF336640502C1554514B
          03F17CB22EB284499566FA10C0D665AAC4265F046DD541E5B554A54F49155F6C
          03E1EB248AA53AECAB4895C4E40BA3AD22A862E4A439A73617BDA0824ADA0235
          54C25A495B81C74CF74B32A8477EDBAFF4BDAC72D2D21A1D58C38478051184CD
          6776475E9FA8AD7DBC5506B53F2BDE7E5ACCD6B8E4486A03D99E0248505B8F3C
          A3E9579C1E93C8820A409700683F1D523DBE59A70343C5D5D29BB587B495338B
          7D26800795DFFAB2832AB82DED173081990013B8D44C80046AD6EB2B340A14CA
          659DD4C8A45002670426200636ACD275B1800CA8629C7F453352AC0B505DE281
          4FEE1650ACA586DD056F95DE3F8112A51925BA71E25950797B2A7BFD29DBFA9F
          443301ACE275D9550E54EED8B60E5059620C1AB5041A35F1317E5E3196565ABB
          724E80B5AB9DDD9C0595A70C35A9B0005BDF6570E4D3C8E24A3DDD5122AC639F
          0BE835799D732C0ED46C46467152A5753A1DC759D3B80576F5107675597C9F77
          569EC773A0663DBF7292386D4EAA4B9AD05491970BB4D3EF68CEA68AB6821B3C
          59C3F34548F1E5159712DCED8DE97BDEE67C4F8756719A6AFB5F03FA62380B4D
          B534A5024DD5C2F87B5007917B506F4146076A5E9B5ABC2C7F9C846D6AB6B04D
          D1D42C489F53D97C4D7F70834F2BA8C1503517A5E248ADC253A725E597C12194
          0254F83CA7A9E22FC00DFE3F8EA8B266528CA8F8225839F65FA5159B4C6005CA
          9092B6B0FBDEF2E5E99D92A0CBFED73F39742EF5C71D4BCB59AA7625DF254D99
          A406D194500BC066FF0D3474B16D83E3F2A94A35861F04F1BF99A2F83FE8A4F8
          DD7C7332229D515D864E0CBB25A92A5D1EC594FC19AA2EBF93E78C4AB4ABD366
          02025B9F3F19E9AA8730C207B37695291AE896693101412A15384AF158B01F8C
          2C1AE8912A55926938F74FA1186FE43A313638EAA39C5A854A96DC062A548AAE
          AD1167FE7CC15E5F29D4686BA9566936497CD2BA90A2D952BF745ED15C0F6BCF
          09815EF5C7B18050D55F4123ACD4D52DE81E9F3B656643F810A83C55D26C2B98
          80B9A27353A0240BB67DD386EA5373143FEBA0CA0DB17A474A812AA941F43FD8
          5025B5D4E128E444C2E5E95223414A1BE69952EAB3464B4901EA01520B7BA8B4
          FF88A5E9AED1F8291F750DDE9D12D356B846B56482BB535267DA76F52EC5413A
          7362FBA8A47ED4065DC1BE6A6D85130A6CEAACFF8E7EF384D29027479794A7E3
          4FEE8B0FB7503A534093D1F1E76D6809EB08B5F9C88006FB53E341D5DB0AB7B1
          15B6D401E0BC8CF5C14199EE48BC978FE94D95487E7B90E07D30F91A7EE5B6C2
          38609D546933B9838C96E7A10F613FEB7A07B40A684CA7380DD6EFAFFD8AB1C0
          3AADDD1B4748EB43CF14737A13BEC7257039846A47BB65B09B29B45B72225AB7
          6FE425CD9B16D5CC2D74B4E401D33FAF5D5F62108A2ECAC56AD9C7079DF4B19A
          9816391C2BD05C6AD10F2601991EA2D8CD036911E97D09AF5E8FBBB8ABE32B1C
          9FAE486B09329C3E19EEB61F19D8DAA0176579802D3D015BA8D836C0EE3E96B2
          E9620EB67DDB8FBB98AB81D79BE09B0D00F92E16C8CC3AF84489933300BA9CF7
          66B5E1EFA5CA021B6D7B264584703C4C150519CD0D6AFF85B251778C4CA2F404
          38915E5E92915DA0E8636437E004DEE917BD8613DFBAD418F6C6B791DE4A792F
          6DB907F516E45F9504CC6F93B767160000000049454E44AE426082}
      end
      object imgArrowRight: TImage
        Tag = 1
        Left = 266
        Top = 245
        Width = 25
        Height = 70
        Enabled = False
        OnClick = btnHeadingClick
      end
      object imgArrowLeft: TImage
        Left = 206
        Top = 245
        Width = 25
        Height = 70
        Enabled = False
        OnClick = btnHeadingClick
      end
      object lblPlatformHeading: TLabel
        Left = 229
        Top = 268
        Width = 40
        Height = 20
        Alignment = taCenter
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnMoveForward: TButton
        Left = 40
        Top = 250
        Width = 85
        Height = 20
        Caption = 'Move Forward'
        Enabled = False
        TabOrder = 0
        OnClick = btnMoveClick
      end
      object btnStop: TButton
        Tag = 1
        Left = 40
        Top = 270
        Width = 85
        Height = 20
        Caption = 'Stop'
        Enabled = False
        TabOrder = 1
        OnClick = btnMoveClick
      end
      object btnMoveBackward: TButton
        Tag = 2
        Left = 40
        Top = 290
        Width = 85
        Height = 20
        Caption = 'Move Backward'
        Enabled = False
        TabOrder = 2
        OnClick = btnMoveClick
      end
      object btnReady: TButton
        Tag = 1
        Left = 370
        Top = 290
        Width = 85
        Height = 20
        Caption = 'Ready'
        Enabled = False
        TabOrder = 3
        OnClick = btnReadyClick
      end
    end
  end
  object pnlPlatformDetailssss: TPanel
    Left = 0
    Top = 584
    Width = 315
    Height = 600
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    Visible = False
    object Label17: TLabel
      Left = 75
      Top = 291
      Width = 46
      Height = 16
      Caption = 'Heading'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 201
      Top = 291
      Width = 36
      Height = 16
      Caption = 'Speed'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 18
      Top = 544
      Width = 36
      Height = 16
      Caption = 'Status'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label10: TLabel
      Left = 60
      Top = 544
      Width = 5
      Height = 16
      Caption = ':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTransportStatus: TLabel
      Left = 71
      Top = 544
      Width = 102
      Height = 16
      Caption = 'Embark Process'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label11: TLabel
      Left = 18
      Top = 468
      Width = 33
      Height = 16
      Caption = 'Name'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label12: TLabel
      Left = 18
      Top = 506
      Width = 30
      Height = 16
      Caption = 'Class'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label21: TLabel
      Left = 60
      Top = 506
      Width = 5
      Height = 16
      Caption = ':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label22: TLabel
      Left = 60
      Top = 468
      Width = 5
      Height = 16
      Caption = ':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTransportClass: TLabel
      Left = 71
      Top = 506
      Width = 18
      Height = 16
      Caption = '---'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblTransportNameDetail: TLabel
      Left = 71
      Top = 468
      Width = 135
      Height = 16
      Caption = 'No Platform Selected'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label23: TLabel
      Left = 192
      Top = 544
      Width = 46
      Height = 16
      Caption = 'Heading'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label24: TLabel
      Left = 244
      Top = 544
      Width = 5
      Height = 16
      Caption = ':'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTransportArah: TLabel
      Left = 255
      Top = 544
      Width = 18
      Height = 16
      Caption = '---'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btnSetHeading0: TButton
      Tag = 30
      Left = 86
      Top = 342
      Width = 25
      Height = 25
      Caption = '0'
      Enabled = False
      TabOrder = 0
    end
    object btnSetHeading180: TButton
      Tag = 32
      Left = 86
      Top = 373
      Width = 25
      Height = 25
      Caption = '180'
      Enabled = False
      TabOrder = 1
    end
    object btnSetHeading270: TButton
      Tag = 33
      Left = 55
      Top = 357
      Width = 25
      Height = 25
      Caption = '270'
      Enabled = False
      TabOrder = 2
    end
    object btnSetHeading90: TButton
      Tag = 31
      Left = 117
      Top = 357
      Width = 25
      Height = 25
      Caption = '90'
      Enabled = False
      TabOrder = 3
    end
    object btnSpZero: TButton
      Tag = 10
      Left = 164
      Top = 342
      Width = 54
      Height = 25
      Caption = 'set sp 0'
      Enabled = False
      TabOrder = 4
    end
    object btnUpdate: TButton
      Left = 121
      Top = 432
      Width = 75
      Height = 25
      Caption = 'Update'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object btnSpOne: TButton
      Tag = 11
      Left = 224
      Top = 342
      Width = 54
      Height = 25
      Caption = 'set sp 1'
      Enabled = False
      TabOrder = 6
    end
    object btnSpTwo: TButton
      Tag = 12
      Left = 192
      Top = 373
      Width = 54
      Height = 25
      Caption = 'set sp 2'
      Enabled = False
      TabOrder = 7
    end
    object edtArah: TEdit
      Left = 60
      Top = 313
      Width = 76
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      Text = '0'
    end
    object edtKecepatan: TEdit
      Left = 181
      Top = 313
      Width = 76
      Height = 23
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Cn'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Text = '0'
    end
    object btnClosex: TButton
      Left = 256
      Top = 120
      Width = 55
      Height = 25
      Caption = 'Close'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object btnStateReady: TButton
      Tag = 23
      Left = 68
      Top = 432
      Width = 47
      Height = 25
      Caption = 'Ready'
      TabOrder = 11
    end
    object btnStateStandBy: TButton
      Tag = 22
      Left = 18
      Top = 432
      Width = 47
      Height = 25
      Caption = 'StandBy'
      TabOrder = 12
    end
    object btnStateEmbarkProcess: TButton
      Tag = 21
      Left = 68
      Top = 404
      Width = 47
      Height = 25
      Caption = 'Proses'
      TabOrder = 13
    end
    object btnStateQueue: TButton
      Tag = 20
      Left = 18
      Top = 404
      Width = 47
      Height = 25
      Caption = 'Queue'
      TabOrder = 14
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 950
    Top = 8
  end
end
