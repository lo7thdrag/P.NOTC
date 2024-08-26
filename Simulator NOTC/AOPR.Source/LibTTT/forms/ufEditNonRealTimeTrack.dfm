object frmEditNonRealTimeTrack: TfrmEditNonRealTimeTrack
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Edit Non Real Time Track'
  ClientHeight = 465
  ClientWidth = 382
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Lbltrack: TLabel
    Left = 13
    Top = 12
    Width = 41
    Height = 16
    Caption = 'Track :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbltrack1: TLabel
    Left = 75
    Top = 8
    Width = 28
    Height = 16
    Caption = '2014'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 8
    Top = 40
    Width = 374
    Height = 2
  end
  object Label1: TLabel
    Left = 13
    Top = 57
    Width = 46
    Height = 16
    Caption = 'Name : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 89
    Width = 37
    Height = 16
    Caption = 'Type :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtnameTrack: TEdit
    Left = 61
    Top = 53
    Width = 304
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = edtnameTrackKeyPress
  end
  object edtTypeEditNonRealTimeTrack: TEdit
    Left = 61
    Top = 85
    Width = 272
    Height = 24
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object btnType: TButton
    Left = 339
    Top = 85
    Width = 26
    Height = 25
    ImageIndex = 20
    Images = ImageList1
    TabOrder = 2
    OnClick = btnTypeClick
  end
  object btnclose: TButton
    Left = 291
    Top = 427
    Width = 87
    Height = 30
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btncloseClick
  end
  object edtTrackNumber: TEdit
    Left = 63
    Top = 8
    Width = 75
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    OnKeyPress = edtTrackNumberKeyPress
  end
  object pnlPageControlTrackDetail: TPanel
    Left = 6
    Top = 130
    Width = 373
    Height = 289
    BevelOuter = bvNone
    TabOrder = 5
    object pnlBot: TPanel
      Left = 0
      Top = 20
      Width = 373
      Height = 269
      Align = alClient
      TabOrder = 1
      object pnlContentDetail: TPanel
        Left = 1
        Top = 1
        Width = 371
        Height = 267
        Align = alClient
        BevelOuter = bvNone
        Color = 16775920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label15: TLabel
          Left = 16
          Top = 126
          Width = 100
          Height = 16
          Caption = 'Propulsion Type :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 16
          Top = 83
          Width = 89
          Height = 16
          Caption = 'Platform Type :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 16
          Top = 41
          Width = 39
          Height = 16
          Caption = 'Class :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 16
          Top = 212
          Width = 96
          Height = 16
          Caption = 'Track Identifier :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 16
          Top = 169
          Width = 83
          Height = 16
          Caption = 'Last Updated :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtTrackIden: TEdit
          Left = 122
          Top = 208
          Width = 121
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object edtLastUpdated: TEdit
          Left = 122
          Top = 165
          Width = 161
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object edtPropulsionType: TEdit
          Left = 122
          Top = 122
          Width = 121
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnLastUpdated: TButton
          Left = 286
          Top = 165
          Width = 26
          Height = 25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Images = ImageList1
          ParentFont = False
          TabOrder = 3
          OnClick = btnLastUpdatedClick
        end
        object btnpropulsiontype: TButton
          Left = 249
          Top = 122
          Width = 26
          Height = 25
          ImageIndex = 20
          Images = ImageList1
          TabOrder = 4
          OnClick = btnpropulsiontypeClick
        end
        object btnPlatformType: TButton
          Left = 286
          Top = 79
          Width = 26
          Height = 25
          ImageIndex = 20
          Images = ImageList1
          TabOrder = 5
          OnClick = btnPlatformTypeClick
        end
        object edtPlatformType: TEdit
          Left = 122
          Top = 79
          Width = 161
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object edtClass: TEdit
          Left = 122
          Top = 37
          Width = 190
          Height = 24
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
        end
      end
      object pnlContentTrack: TPanel
        Left = 1
        Top = 1
        Width = 371
        Height = 267
        Align = alClient
        BevelOuter = bvNone
        Color = 16775920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object grpESM: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 0
          object lbl25: TLabel
            Left = 12
            Top = 105
            Width = 41
            Height = 16
            Caption = 'Force :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl26: TLabel
            Left = 12
            Top = 73
            Width = 51
            Height = 16
            Caption = 'Identity :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl27: TLabel
            Left = 12
            Top = 43
            Width = 52
            Height = 16
            Caption = 'Domain :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl28: TLabel
            Left = 12
            Top = 137
            Width = 43
            Height = 16
            Caption = 'Origin :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object btn11: TButton
            Left = 255
            Top = 101
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 0
            OnClick = btnforceClick
          end
          object edtESMForce: TEdit
            Left = 96
            Top = 101
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object edtESMIdentity: TEdit
            Left = 96
            Top = 69
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btn12: TButton
            Left = 255
            Top = 69
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 3
            OnClick = btnIdentityTrackClick
          end
          object btn13: TButton
            Left = 255
            Top = 39
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 4
            OnClick = btnDomainClick
          end
          object edtESMDomain: TEdit
            Left = 96
            Top = 39
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object edtESMOrigin: TEdit
            Left = 96
            Top = 133
            Width = 185
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Visible = False
          end
          object btn14: TButton
            Left = 286
            Top = 133
            Width = 24
            Height = 25
            ImageIndex = 6
            Images = ImageList1
            TabOrder = 7
            Visible = False
            OnClick = btnPositionClick
          end
        end
        object grpNonRealAOP: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 1
          object lbl13: TLabel
            Left = 12
            Top = 32
            Width = 52
            Height = 16
            Caption = 'Domain :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl14: TLabel
            Left = 12
            Top = 64
            Width = 51
            Height = 16
            Caption = 'Identity :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl15: TLabel
            Left = 12
            Top = 96
            Width = 41
            Height = 16
            Caption = 'Force :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lbl16: TLabel
            Left = 12
            Top = 128
            Width = 47
            Height = 16
            Caption = 'Center :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl17: TLabel
            Left = 12
            Top = 158
            Width = 90
            Height = 16
            Caption = 'Ground Speed :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl18: TLabel
            Left = 179
            Top = 158
            Width = 30
            Height = 16
            Caption = 'knots'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtAOPDomain: TEdit
            Left = 108
            Top = 28
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btn1: TButton
            Left = 267
            Top = 28
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 1
            OnClick = btnDomainClick
          end
          object edtAOPIdentity: TEdit
            Left = 108
            Top = 60
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btn2: TButton
            Left = 267
            Top = 60
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 3
            OnClick = btnIdentityTrackClick
          end
          object edtAOPForce: TEdit
            Left = 108
            Top = 92
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object btn5: TButton
            Left = 267
            Top = 92
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 5
            Visible = False
            OnClick = btnforceClick
          end
          object btn6: TButton
            Left = 324
            Top = 124
            Width = 26
            Height = 25
            ImageIndex = 6
            Images = ImageList1
            TabOrder = 6
            OnClick = btnPositionClick
          end
          object edtAOPPosLat: TEdit
            Left = 108
            Top = 124
            Width = 106
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnKeyPress = edtPositionCenterKeyPress
          end
          object edtAOPGroundSpeed: TEdit
            Left = 108
            Top = 154
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Text = '000'
            OnKeyPress = edtGroundSpeedKeyPress
          end
          object edtAOPPosLong: TEdit
            Left = 216
            Top = 124
            Width = 106
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnKeyPress = edtPositionCenterKeyPress
          end
        end
        object grpNonRealBearing: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 2
          object lbl7: TLabel
            Left = 12
            Top = 28
            Width = 52
            Height = 16
            Caption = 'Domain :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl8: TLabel
            Left = 12
            Top = 60
            Width = 51
            Height = 16
            Caption = 'Identity :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl9: TLabel
            Left = 12
            Top = 93
            Width = 41
            Height = 16
            Caption = 'Force :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lbl10: TLabel
            Left = 12
            Top = 126
            Width = 43
            Height = 16
            Caption = 'Origin :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl11: TLabel
            Left = 12
            Top = 158
            Width = 52
            Height = 16
            Caption = 'Bearing :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl12: TLabel
            Left = 172
            Top = 158
            Width = 58
            Height = 16
            Caption = 'degrees T'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtNRBBearing: TEdit
            Left = 96
            Top = 154
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = '000'
            OnKeyPress = edtCourseKeyPress
          end
          object btnBearingDomain: TButton
            Left = 256
            Top = 24
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 1
            OnClick = btnDomainClick
          end
          object btnBearingIdentity: TButton
            Left = 255
            Top = 56
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 2
            OnClick = btnIdentityTrackClick
          end
          object edtNRBForce: TEdit
            Left = 96
            Top = 89
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Visible = False
          end
          object btn3: TButton
            Left = 255
            Top = 89
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 4
            Visible = False
            OnClick = btnforceClick
          end
          object edtNRBPosLat: TEdit
            Tag = 2
            Left = 96
            Top = 122
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnKeyPress = edtPositionCenterKeyPress
          end
          object btn4: TButton
            Left = 312
            Top = 122
            Width = 26
            Height = 25
            ImageIndex = 6
            Images = ImageList1
            TabOrder = 6
            OnClick = btnPositionClick
          end
          object edtNRBIdentity: TEdit
            Left = 96
            Top = 56
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object edtNRBDomain: TEdit
            Left = 96
            Top = 24
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object edtNRBPosLong: TEdit
            Tag = 2
            Left = 204
            Top = 122
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnKeyPress = edtPositionCenterKeyPress
          end
        end
        object grpNonRealSpecial: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 4
          object lbl19: TLabel
            Left = 12
            Top = 31
            Width = 52
            Height = 16
            Caption = 'Domain :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl20: TLabel
            Left = 12
            Top = 63
            Width = 83
            Height = 16
            Caption = 'Symbol Type :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl21: TLabel
            Left = 12
            Top = 96
            Width = 41
            Height = 16
            Caption = 'Force :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lbl22: TLabel
            Left = 12
            Top = 128
            Width = 53
            Height = 16
            Caption = 'Position :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl23: TLabel
            Left = 12
            Top = 160
            Width = 52
            Height = 16
            Caption = 'Altitude :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl24: TLabel
            Left = 177
            Top = 160
            Width = 28
            Height = 16
            Caption = 'feets'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object edtNRSDomain: TEdit
            Left = 101
            Top = 27
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btn7: TButton
            Left = 260
            Top = 27
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 1
            OnClick = btnDomainClick
          end
          object edtNRSSymbolType: TEdit
            Left = 101
            Top = 59
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object btn8: TButton
            Left = 260
            Top = 59
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 3
            OnClick = btn8Click
          end
          object edtNRSForce: TEdit
            Left = 101
            Top = 92
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object btn9: TButton
            Left = 260
            Top = 91
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 5
            Visible = False
            OnClick = btnforceClick
          end
          object btn10: TButton
            Left = 317
            Top = 123
            Width = 26
            Height = 25
            ImageIndex = 6
            Images = ImageList1
            TabOrder = 6
            OnClick = btnPositionClick
          end
          object edtNRSPosLat: TEdit
            Tag = 4
            Left = 101
            Top = 124
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnKeyPress = edtPositionCenterKeyPress
          end
          object edtNRSAltitude: TEdit
            Left = 101
            Top = 156
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
            Text = '000'
            OnKeyPress = edtAltitudeKeyPress
          end
          object edtNRSPosLong: TEdit
            Tag = 4
            Left = 209
            Top = 124
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            OnKeyPress = edtPositionCenterKeyPress
          end
        end
        object grpRealTime: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 5
          object lbl1: TLabel
            Left = 15
            Top = 36
            Width = 37
            Height = 16
            Caption = 'Name '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl2: TLabel
            Left = 15
            Top = 63
            Width = 30
            Height = 16
            Caption = 'Class'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl3: TLabel
            Left = 15
            Top = 90
            Width = 28
            Height = 16
            Caption = 'Type'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object lbl4: TLabel
            Left = 15
            Top = 117
            Width = 43
            Height = 16
            Caption = 'Domain'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl5: TLabel
            Left = 15
            Top = 144
            Width = 42
            Height = 16
            Caption = 'Identity'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbl6: TLabel
            Left = 15
            Top = 171
            Width = 91
            Height = 16
            Caption = 'Propulsion Type'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object edtNameRT: TEdit
            Left = 112
            Top = 32
            Width = 231
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnKeyPress = edtnameTrackKeyPress
          end
          object edtClassTrack: TEdit
            Left = 112
            Top = 59
            Width = 232
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnKeyPress = edtClassTrackKeyPress
          end
          object edtTypeTrack: TEdit
            Left = 112
            Top = 86
            Width = 233
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Visible = False
          end
          object edtDomainTrack: TEdit
            Left = 112
            Top = 113
            Width = 105
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object edtIdentityTrack: TEdit
            Left = 112
            Top = 140
            Width = 105
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object edtPropulsionTypeTrack: TEdit
            Left = 112
            Top = 167
            Width = 105
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Text = '--'
            Visible = False
          end
          object btnBTtype: TButton
            Left = 349
            Top = 87
            Width = 23
            Height = 22
            ImageIndex = 0
            Images = ImageList1
            TabOrder = 6
            Visible = False
          end
          object btnBTpropulsiontype: TButton
            Left = 293
            Top = 167
            Width = 26
            Height = 25
            ImageIndex = 0
            Images = ImageList1
            TabOrder = 7
            Visible = False
          end
          object btnDomainRT: TButton
            Left = 223
            Top = 113
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 8
            OnClick = btnDomainClick
          end
          object btnIdentityRT: TButton
            Left = 223
            Top = 140
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 9
            OnClick = btnIdentityTrackClick
          end
          object btnPropReal: TButton
            Left = 223
            Top = 167
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 10
            Visible = False
            OnClick = btnpropulsiontypeClick
          end
        end
        object grpNonRealPoint: TGroupBox
          Left = 0
          Top = 0
          Width = 371
          Height = 267
          Align = alClient
          ParentBackground = False
          TabOrder = 3
          object Label6: TLabel
            Left = 12
            Top = 122
            Width = 53
            Height = 16
            Caption = 'Position :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbAltitude: TLabel
            Left = 13
            Top = 216
            Width = 52
            Height = 16
            Caption = 'Altitude :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 12
            Top = 90
            Width = 41
            Height = 16
            Caption = 'Force :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object Label3: TLabel
            Left = 12
            Top = 28
            Width = 52
            Height = 16
            Caption = 'Domain :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 12
            Top = 59
            Width = 51
            Height = 16
            Caption = 'Identity :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbGroundSpeed: TLabel
            Left = 12
            Top = 184
            Width = 90
            Height = 16
            Caption = 'Ground Speed :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 179
            Top = 184
            Width = 30
            Height = 16
            Caption = 'knots'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 176
            Top = 153
            Width = 58
            Height = 16
            Caption = 'degrees T'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 179
            Top = 216
            Width = 22
            Height = 16
            Caption = 'feet'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lbCourse: TLabel
            Left = 12
            Top = 153
            Width = 49
            Height = 16
            Caption = 'Course :'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnDomain: TButton
            Left = 267
            Top = 24
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 0
            OnClick = btnDomainClick
          end
          object btnforce: TButton
            Left = 267
            Top = 86
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 1
            Visible = False
            OnClick = btnforceClick
          end
          object edtIdentity: TEdit
            Left = 108
            Top = 55
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object edtforce: TEdit
            Left = 108
            Top = 86
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Visible = False
          end
          object edtGroundSpeed: TEdit
            Left = 108
            Top = 180
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            Text = '0.0'
            OnKeyPress = edtGroundSpeedKeyPress
          end
          object btnIdentityTrack: TButton
            Left = 267
            Top = 55
            Width = 26
            Height = 25
            ImageIndex = 20
            Images = ImageList1
            TabOrder = 6
            OnClick = btnIdentityTrackClick
          end
          object edtCourse: TEdit
            Left = 108
            Top = 149
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            Text = '000'
            OnKeyPress = edtCourseKeyPress
          end
          object btnPosition: TButton
            Left = 323
            Top = 117
            Width = 26
            Height = 25
            ImageIndex = 6
            Images = ImageList1
            TabOrder = 8
            OnClick = btnPositionClick
          end
          object edtAltitude: TEdit
            Left = 108
            Top = 212
            Width = 65
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Text = '0'
            OnKeyPress = edtAltitudeKeyPress
          end
          object edtDomain: TEdit
            Left = 108
            Top = 24
            Width = 153
            Height = 24
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object edtposLat: TEdit
            Tag = 1
            Left = 107
            Top = 118
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnKeyPress = edtPositionCenterKeyPress
          end
          object edtposLong: TEdit
            Tag = 1
            Left = 215
            Top = 118
            Width = 106
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            OnKeyPress = edtPositionCenterKeyPress
          end
        end
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 373
      Height = 20
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object pnlTabDetail: TPanel
        Left = 60
        Top = 0
        Width = 60
        Height = 20
        BevelOuter = bvLowered
        Caption = 'Detail'
        Color = 6770973
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        OnClick = pgControlTrackDetailClick
      end
      object pnlTabTrack: TPanel
        Left = 0
        Top = 0
        Width = 60
        Height = 20
        BevelOuter = bvLowered
        Caption = 'Track'
        Color = 10583852
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        OnClick = pgControlTrackDetailClick
      end
    end
  end
  object ImageList1: TImageList
    BkColor = 14215660
    Left = 848
    Top = 56
    Bitmap = {
      494C01011F002100040010001000ECE9D800FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100FFFFFF00707070007070700070707000FFFFFF00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100FFFF
      FF00707070007070700060606000707070007070700060606000FFFFFF00FFFF
      FF00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00FFFFFF00707070007070
      70007070700060606000C1C1C100FFFFFF00FFFFFF007070700070707000FFFF
      FF00FFFFFF00C1C1C100D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000060606000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000606060006060
      6000C1C1C100FFFFFF007070700070707000FFFFFF00FFFFFF00707070007070
      7000FFFFFF00FFFFFF00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00C1C1C1000000000000000000D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000001919
      190000000000C1C1C100D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000C1C1C100FFFF
      FF007070700070707000707070007070700070707000FFFFFF00FFFFFF007070
      700070707000FFFFFF00FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000606060000000000C1C1C10000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0070707000FFFFFF00707070007070
      7000707070007070700070707000707070007070700070707000FFFFFF00FFFF
      FF007070700070707000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100000000000606060000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600070707000707070007070
      700070707000707070007070700070707000707070007070700070707000FFFF
      FF00FFFFFF007070700070707000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000C1C1C10000000000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700070707000707070007070
      7000707070007070700070707000707070007070700070707000707070007070
      7000FFFFFF0070707000FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC0000000000D8E9EC00000000001919190000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC0060606000C1C1C100606060007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000C1C1C10000000000D8E9EC00000000001919190000000000C1C1C100D8E9
      EC00000000007070700000000000D8E9EC00D8E9EC0060606000C1C1C1007070
      7000707070007070700070707000707070007070700070707000707070007070
      70007070700070707000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000006060600000000000000
      0000000000007070700060606000D8E9EC00D8E9EC00D8E9EC0060606000C1C1
      C100606060007070700070707000707070007070700070707000707070007070
      7000707070007070700070707000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000007070
      7000707070000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C1006060
      6000D8E9EC007070700070707000707070007070700070707000707070007070
      7000707070006060600060606000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0060606000C1C1C10060606000707070007070700070707000707070007070
      700060606000C1C1C100D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000707070007070
      70007070700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C10060606000C1C1C10070707000707070006060600060606000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000007070700070707000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00606060007070700060606000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00C1C1C100D8E9EC00B9B9B900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00606060007070
      70007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00C1C1C100606060000000000038383800C1C1C100D8E9EC00C1C1C100D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000060606000D8E9EC00C1C1C10000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10070707000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000000000007070700070707000707070000000000000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      0000707070007070700070707000707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00E1E1E100E1E1E10060606000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000070707000C1C1C10060606000686868007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000070707000707070000000
      000060606000D8E9EC00C1C1C100707070007070700000000000707070007070
      700000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060600000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC000000000070707000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000C1C1C100D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF000000
      0000000000007070700070707000707070000000000000000000FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100606060000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E10060606000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C1000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1E1007070
      7000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC007070700000000000FFFFFF007F7F7F0060606000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1E100E1E1
      E100606060007070700070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00606060000000000030303000C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10070707000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0059595900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00E1E1
      E100E1E1E100E1E1E10060606000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B6B6
      B600BDBDBD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B8B8B800D8D8D800FFFFFF00FFFF
      FF00FFFFFF00E5E5E500D8E9EC00B7B7B700D4D4D400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EEEEEE00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00C1C1C100D8E9EC00D8E9EC00D8E9EC009292920060606000666666007070
      700087878700D8E9EC00D8E9EC00999999006565650070707000707070007070
      70006C6C6C00646464007F7F7F00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00B8B8B8009E9E9E009898
      9800E5E5E500B7B7B700BCBCBC00D8E9EC00B6B6B600AAAAAA00707070007070
      700095959500ECECEC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00949494008282
      8200D6D6D600FFFFFF00FFFFFF00FFFFFF00D4D4D40070707000707070007070
      700081818100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000D8E9EC00D8E9EC00C1C1C10000000000C1C1
      C1000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7B700A4A4
      A400707070006B6B6B00656565007070700070707000707070006C6C6C008A8A
      8A00EBEBEB00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950097979700E5E5E500D8E9EC00999999006565650070707000707070008282
      8200D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000007070700000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009595
      950081818100D6D6D600EBEBEB00A8A8A800707070006B6B6B008C8C8C00EAEA
      EA00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000C1C1C1000000000000000000000000000000000000000000C1C1C1000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC009696960095959500D1D1D10070707000707070007070700086868600BDBD
      BD00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000060606000C1C1C10060606000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B7B7
      B700A0A0A00080808000A7A7A700707070006B6B6B008E8E8E00EAEAEA00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C0070707000707070007070700083838300D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC009C9C9C00707070006B6B6B0090909000E9E9E900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0097979700656565007070700084848400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00B7B7B700A2A2A20079797900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B9B9B900DBDBDB00F3F3
      F300F3F3F300F4F4F400F4F4F400D4D4D400B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B20089898900D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00FFFFFF00E7E7E700B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B20095959500838383008787
      87008787870087878700C3C3C300F9F9F900D4D4D400B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2008585850070707000707070007070
      700070707000707070009E9E9E00FFFFFF00E6E6E600B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC009999990075757500707070007070
      700070707000707070007C7C7C00C2C2C200F9F9F900D4D4D400B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      7000707070007070700070707000A0A0A000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC007171710070707000707070007070
      70007070700070707000707070007D7D7D00C2C2C200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200BCBCBC00E4E4E400B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC006F6F6F0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700070707000FFFFFF00B2B2B200B2B2B200B2B2
      B2008D8D8D00FFFFFF00E3E3E300B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006A6A6A0070707000707070007070
      700070707000707070007070700070707000B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B2007070700070707000707070007070
      700070707000707070007070700066666600FFFFFF00BBBBBB00E3E3E300E3E3
      E30070707000A5A5A500FFFFFF00E3E3E300D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC006E6E6E0070707000707070007070
      70007070700070707000707070006A6A6A00ADADAD00DBDBDB00B7B7B700D3D3
      D300EEEEEE00EEEEEE00EEEEEE00EEEEEE007070700070707000707070007070
      70007070700070707000707070006A6A6A00CFCFCF0085858500A7A7A700A7A7
      A7007070700070707000A7A7A700FFFFFF00D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000000000000000000000000000D8E9EC006B6B6B0070707000707070007070
      70007070700070707000707070006E6E6E0096969600BCBCBC009D9D9D008989
      8900919191009191910091919100BDBDBD007070700070707000707070007070
      700070707000707070006666660098989800BBBBBB006A6A6A00666666007070
      7000707070007070700066666600D0D0D000D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      0000000000000000000000000000000000008484840070707000707070007070
      700070707000707070006A6A6A0082828200AAAAAA00B7B7B700959595006969
      69006B6B6B00696969006B6B6B008B8B8B009797970066666600666666007070
      700070707000666666009A9A9A00B2B2B200E6E6E60097979700919191009797
      9700666666007070700091919100B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00A8A8A8007F7F7F00646464006A6A
      6A00707070006A6A6A0086868600ADADAD00CDCDCD00D2D2D200ABABAB009F9F
      9F009F9F9F009F9F9F009F9F9F00A5A5A500B2B2B20090909000999999007070
      7000C3C3C30090909000C1C1C10082828200FFFFFF00B2B2B200B2B2B200BBBB
      BB006060600097979700B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00B2B2B200A6A6A600A2A2A2008A8A
      8A00A6A6A600BABABA00AEAEAE009C9C9C00B7B7B700DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B8B8B8006767
      6700FFFFFF00BBBBBB008A8A8A0069696900FFFFFF00B2B2B200B2B2B200B8B8
      B8008F8F8F00B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B4B4B4008B8B
      8B00B5B5B500DDDDDD009C9C9C0074747400B2B2B200DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006969
      6900FFFFFF008B8B8B009696960070707000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008D8D
      8D00B8B8B800BCBCBC00909090008B8B8B00B4B4B400DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B2006767
      6700B1B1B1008D8D8D00B9B9B90067676700FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B2B2B2008989
      8900818181009A9A9A00A8A8A8008F8F8F00AEAEAE00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200BABABA006060
      600093939300B2B2B200BABABA0060606000FFFFFF00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B7B7B7008B8B
      8B0080808000A8A8A800B7B7B7008F8F8F00ACACAC00DBDBDB00B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B9B9B9008B8B
      8B00B2B2B200B2B2B200B9B9B90060606000DEDEDE00B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B2B2B200B2B2B200B5B5B500A6A6
      A600A5A5A500B2B2B200B4B4B4008D8D8D0098989800C5C5C500B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B2008A8A8A00B9B9B900B2B2B200B2B2B200B2B2
      B200B2B2B200B2B2B200B2B2B200B2B2B200D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B5B5B500D8E9EC00D8E9EC00D8E9EC00B5B5B500D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C2C2C200C2C2C200C2C2
      C200CECECE00C2C2C200C2C2C200C2C2C200CECECE00C2C2C200D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A5A5A500E2E2E200E2E2E200E2E2
      E200E2E2E200E2E2E200E2E2E200E2E2E200E2E2E200FFFFFF00C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0070707000707070000000
      000000000000D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      00000000000000000000000000000000000000000000E4E4E400FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000006060
      60007070700000000000C1C1C100D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00000000000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF000000
      000000000000FFFFFF00B2B2B20000000000B2B2B200FFFFFF00B2B2B2000000
      0000000000007070700000000000D8E9EC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00D8E9
      EC00D8E9EC00BFBFBF00B4B4B400D8E9EC00D8E9EC00C1C1C10000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000FFFFFF00B2B2B200FFFFFF0000000000FFFFFF00B2B2B200FFFFFF00FFFF
      FF00000000000000000000000000C1C1C1000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B400A8A8A800FFFFFF00CACACA00D8E9EC00D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000060606000C1C1C100FFFF
      FF0000000000FFFFFF00B2B2B200FFFFFF00B2B2B200FFFFFF00C1C1C1000000
      0000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062626200FFFFFF00BFBF
      BF006E6E6E00EBEBEB00FFFFFF00BDBDBD0000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00B2B2B200FFFFFF00C1C1C100FFFFFF00C1C1C100606060007070
      7000707070007070700070707000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00B4B4
      B4006262620070707000EBEBEB00F5F5F500000000000000000000000000D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00B2B2B200FFFFFF006060600070707000707070007070
      7000707070000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00BFBF
      BF0000000000707070006A6A6A00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C1C1C1000000000000000000707070007070
      7000707070007070700070707000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6E6E00FFFFFF00B4B4
      B4000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000FFFFFF000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9
      EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC000000
      000000000000D8E9EC00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000000000000000
      00007070700070707000707070000000000000000000000000007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D00000000000000000061616100FFFFFF00D8E9
      EC0068686800D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC0000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00000000000000
      0000000000000000000000000000D8E9EC000000000000000000F3F3F300F3F3
      F300F3F3F300F3F3F300F3F3F30000000000000000006F6F6F00F9F9F900D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000FFFFFF00000000007F7F7F00FFFFFF0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9EC000000
      000000000000D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF000000
      0000000000000000000000000000D8E9EC006F6F6F006F6F6F00707070007070
      70007070700070707000707070006F6F6F000000000066666600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000007F7F7F0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF00000000000000000000000000D8E9EC000000000000000000757575000000
      00007070700000000000000000006565650074747400D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000059595900D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000FFFFFF000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      00007373730064646400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      000000000000D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC0000000000FFFFFF0000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B9B9
      B900D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B4B4B400BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00C1C1
      C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC009B9B9B000C0C0C006B6B
      6B00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00B3B3B300C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00A7A7A7000000000000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90000000000000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990017171700D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00ABABAB00000000000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC0000000000D8E9EC00C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC009999990019191900BFBFBF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00A9A9A90007070700ADADAD000000
      000001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC006060
      600060606000D8E9EC00D8E9EC00D8E9EC00B3B3B3005353530015151500D8E9
      EC00B3B3B300D8E9EC00A5A5A5000000000009090900D8E9EC00D8E9EC00AFAF
      AF0001010100D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC000000
      0000000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000003030
      3000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9EC00A7A7A700545454000000
      000000000000000000000D0D0D00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000000000000000
      0000D8E9EC0000000000D8E9EC0000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00000000000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC0080808000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00808080008080800080808000D8E9
      EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000D8E9
      EC00D8E9EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC008080800080808000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC008080800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000C1C1C100D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000008080
      800000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0080808000808080000000
      000000000000D8E9EC00808080008080800080808000D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC0080808000D8E9EC000000
      000000000000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00000000000000
      0000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC0000000000808080000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000080808000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000008080
      8000000000008080800080808000D8E9EC00D8E9EC00D8E9EC00C1C1C1000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC008080800000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000C1C1C100D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC000000000000000000C1C1C100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC008080800000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00808080008080800080808000000000008080800080808000D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00000000000000000000000000D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000080808000D8E9EC0000000000D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00C1C1C10000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC000000000080808000D8E9EC00808080000000000080808000D8E9
      EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0080808000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000C1C1C100D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC000000000000000000D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00000000000000000000000000D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC008080800080808000D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC0000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC0000000000D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00000000000000000000000000000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00FFFFFF00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC0000000000D8E9EC00D8E9EC008080
      8000D8E9EC00D8E9EC0080808000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D3C5C700D5C0C300D4BBBF00DDBD
      C200DCB8BE00E1BBC100D4AEB400E6C0C600F9D5DB00D4B2B800E1C1C600D1B3
      B800D7B9BE00D4B6BB00D2B7BB00CFB8BC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00CCB5B900280A0F0039171D002200
      0000360A110043141C00290000003F0E16002700000034080F003F151C002C03
      0A00381218002100030047272C0023080C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00B6B6B6007E7E7E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC000000000000000000D8E9EC00D8E9EC00D9C2C60026030700FFF9FE00FFE4
      EE00FFF7FF00FBD4E300FFF4FF00FFD7F6003F173A00FFDCF800FFF4FF00F5D1
      E100FFF8FF00FFF3FC00F9DCE500300E1500D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC008C8C8C000000000081818100B6B6B600D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC000000000000000000D8E9EC00CEBFC300320C0C00FFEAEC00FFF3
      FF00EFE6FB00FFF2FF00F5E3FF00200C59001F0F6300160C4E00ECE4FF00F2E6
      FF00F2E6FA00FFF9FF00F9E5F20031041400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00B6B6B6008484840000000000000000000000000090909000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00000000000000000000000000D8E9EC00C4BCBD0023000000FFFAFC00F8F0
      FF00F2F6FF00E2E1FF0019184A0006035800030760000A13570000063800F2F4
      FF00F5F5FF00E3E5F700FFF8FF0027000800D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0093939300000000000000000000000000000000000000000087878700B6B6
      B600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000D8E9EC000000
      00000000000000000000D8E9EC00D8E9EC00BCB9B1003E1B1100FFE8E800DFD7
      EE00E3E8FF00F3F7FF00D6DDFE00E5F0FF000F215600E1F7FF00D6E9FF00E9EF
      FF00DADBF500F1F2FF00EFDFF00038051900D8E9EC00D8E9EC00D8E9EC008B8B
      8B00000000000000000000000000000000000000000000000000000000009696
      9600D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00C4C2C100411F1F00FFF7FF00DACF
      F7001F245100DEE3FF00ECF7FF00BCCFF40008244600BCDDF000D6F1FF00D7E0
      FF0022244700E9EBFF00F8E8F9003A071B00D8E9EC00D8E9EC00D8E9EC002424
      2400242424002424240000000000000000000000000024242400242424002424
      2400D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00BAB9C90019000B00F4CDF3002819
      5D0007065000ECEEFF00D7E3FF00DDF7FF00B2D6F400D6FEFF00BCDAF700E4ED
      FF00100E49001A1C3A00F9E9FB003B071E00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C9C0D500360B2600451440002710
      5A001D146400100A43001E214D00ACBFE400DDF9FF00C0E1F500162E4C001213
      50001E1754001413330039293B0027000A00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D7BFCB0034000A00FFD7F5003E18
      5200230C4A00FFF0FF00EFE4FF00F4F4FF00E6EEFF00EAF8FF00CDD4ED00EBDF
      FF001B0C3F001B173400FFF8FF0039051C00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC000000000000000000000000000000000000000000000000000000
      00000000000000000000D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00D5BEC200410A0D00FFF4FF00F4D3
      F8002F1B4600EDD8F800FFF0FF00E3DAFF000F0F3700DDE4FF00F4F8FF00D8CB
      F10034264A00E9E6FC00F5E5F6003C091D00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC0000000000000000000000000000000000000000000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00000000000000000000000000000000000000000000000000D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBB6B30039120A00FFE4E100FFF9
      FF00E1DFF500FDF9FF00DAD5F400F1EDFF000D104D00E8F3FF00CDD8F800F3F4
      FF00EBEAFE00F8FBFF00EBDDE90036041600D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000000000000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC00D8E9
      EC0000000000D8E9EC00D8E9EC00D8E9EC00BBC0BF002F130800FFFEF500F2EF
      F100F4FDFF00E9EAF800201F410006044A0017196700020D47000A173D00F3FA
      FF00DCE2ED00DCE1EA00FFFAFF0037061400D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00000000000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC000000000000000000D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00C3CAD3001F060200FFE7E200EBEC
      F000DDE7F100F8FAFF00D5D1FA001E186A000A076300131A5F00CCD7FF00E2E8
      FF00F2F7FF00F8FEFF00FFF6FC0027000100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC000F0F0F000F0F0F000F0F0F00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      0000D8E9EC00D8E9EC00D8E9EC00D8E9EC00B0AEB4003E1A1400FFFDF500FFF3
      F500FFFCFF00EDE1ED00FFF2FF00EBD9FF001F106100D2CBFF00F8F4FF00F0E7
      F400F9F4F600E3E8E700FBF0F2003B0D1300D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC0000000000D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC000000
      000000000000D8E9EC00D8E9EC00D8E9EC00D8E9EC000000000000000000D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00DFC7C100450A00003E0000003B12
      0F001F000100280300002F060E002500230018001D0018001000250A0E00310C
      0800331710000C0A020029201C003B0E1100D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00D8E9
      EC00D8E9EC0000000000000000000000000000000000D8E9EC00D8E9EC00D8E9
      EC00D8E9EC00D8E9EC00D8E9EC00D8E9EC00424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFF01F0000FC1FDFFFC00F0000
      E00F1FCF80030000E003878F00030000C463C35F00010000CE71E0BF00000000
      9E71E17F000100008E71F87F00010000BE7DB47300010000FE7F021180000000
      FE7F0701C0000000FE7F6781C8010000FE7FC703F0030000FCBFC703F01F0000
      FDBFFC07FC3F0000FE7FFE1FFFFF0000FFFFD777FFFFD7FFFAFFC000FFFFC1FF
      B0579FFC9FF7C3FF0007BFFE8FFFC3FF0007BFFE87F7C1FF0007BFFEC3EFF0FF
      0007BFFCE38FF8FF04078EECF09FFC3F00078001F83FFE3F0007FF7FFC3FFF0F
      0007FF7FF03FFF8B904FFE3FF18FFFC0F87FF80F83CFFFE1FFFFFC1F87E7FFE0
      FFFFFE3F8FF7FFE1FFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
      FFFFFFFFFFFF0200F7FFFFFFF7F70601E7FFFFFFE1C38103E0FFEF7FE9D3C007
      E07FE71FE183C007E00FE11FE003E20FE007E007E823E00FE01FE10FE003F00F
      E07FE31FF007E01FE1FFE77FF9CFF83FE7FFFF7FF9CFF83FFFFFFFFFFFFFF87F
      FFFFFFFFFFFFF8FFFFFFFFFFFFFFFFFFFFFF00003C00FFFFC1FF00000000FFFF
      FEFF00000000FFFF7F7F00000000FFFF7F7F00000000E31F7F7B00000000E31F
      7F7B00000000E31F7F6100000000E31FBEE000000000E31FC1FB00000000E31F
      F77B00000000E31FF67F00000000E31FF57F00000000E31FF37F00000000FFFF
      F77F00000000FFFFFF7F00000000FFFFF77FFDBFFFFFFF7F803FF01FFFFFF80F
      001FF00F002FC007001FC00F7FEFC001001FC00F482F80010019800F7FEF8000
      0001800F682F00000000000F7FEF00000000100F7F6F00000001F00F6EAE0000
      0003F00F556400000017F01F6ABA8001001FF03F257C8001003FF87FFAFCC001
      007FFCFFFDFAE001E3FFFFFFFE04F811BFFDFFFFFFFFFFFFB7EDFFFFFFFFFFFF
      D7EBFFFFFFFF803FE7E7FFFFFFFF001F8421FFEF9FFF001FFBDFEFE78F9F001F
      F66FC1E71E07001EF5AFC3F73F07001CF5AFC7F73F870018F66FCAF71F070018
      FBDFDCE71467001C8421FF0781FF001EE7E7FFFFFFFF1B1FD7EBFFFFFFFF0A1F
      B7EDFFFFFFFF843F7FFEFFFFFFFFF1FF7FFD7FFDFFFFFFFF37D917D9FE7FF81F
      97D397D3FE1FF3CFC7C7C7C7FC1FEFF7844BA6CBFF7FDC3B844386C1CE739BD9
      F2BFFEFBC738F66DF4DFF02F8000B5ADF45FF01FCF79B5ADF2DFFEFFEE7BF66D
      E91BF6EFFF3FBBD9844386C3FC1FDC3BE7CFE64FFE3FEFF7D7D7D7D5FF7FF3CF
      B7DAB7DAFFFFF81F5FFD6DFDFFFFFFFF0000FFFFFFFFFFFF0000FCFFFFFFFFF3
      0000FC3FFF1FFFE90000F03FFF1FFFD10000F00FFF1FF8230000E00FFF1FE787
      0000E00FFF1FCFC70000FC7FFF1FDCEF0000FC7FFF1FBCF70000FC7FF803B037
      0000FC7FFC07B0370000FC7FFE0FBCF70000FC7FFF1FDCEF0000FC7FFFBFDFEF
      0000FFFFFFBFE79F0000FFFFFFFFF87F00000000000000000000000000000000
      000000000000}
  end
  object PmenuType: TPopupMenu
    Left = 304
    Top = 112
    object NonRealTime1: TMenuItem
      Tag = 1
      Caption = 'Non Real Time Point Track'
      OnClick = nrtTypeChangeClick
    end
    object NonRealTimeBearingTrack1: TMenuItem
      Tag = 2
      Caption = 'Non Real Time Bearing Track'
      OnClick = nrtTypeChangeClick
    end
    object NonRealTime2: TMenuItem
      Tag = 3
      Caption = 'Non Real Time Area of Probability'
      OnClick = nrtTypeChangeClick
    end
    object SpecialPoint1: TMenuItem
      Tag = 4
      Caption = 'Special Point'
      OnClick = nrtTypeChangeClick
    end
  end
  object pmDomain: TPopupMenu
    Left = 136
    Top = 424
    object Air1: TMenuItem
      Caption = '&Air'
      OnClick = DomainChangeClick
    end
    object Surface1: TMenuItem
      Tag = 1
      Caption = '&Surface'
      OnClick = DomainChangeClick
    end
    object Subsurface1: TMenuItem
      Tag = 2
      Caption = 'S&ubsurface'
      OnClick = DomainChangeClick
    end
    object Land1: TMenuItem
      Tag = 3
      Caption = '&Land'
      OnClick = DomainChangeClick
    end
    object Amphibious1: TMenuItem
      Tag = 4
      Caption = 'A&mphibious'
      OnClick = DomainChangeClick
    end
    object General1: TMenuItem
      Tag = 6
      Caption = '&General'
      OnClick = DomainChangeClick
    end
  end
  object pmIdentity: TPopupMenu
    Left = 200
    Top = 424
    object Pending1: TMenuItem
      Caption = '&Pending'
      OnClick = IdentityChangeClick
    end
    object Unknown1: TMenuItem
      Tag = 1
      Caption = '&Unknown'
      OnClick = IdentityChangeClick
    end
    object AssumedFriend1: TMenuItem
      Tag = 2
      Caption = '&Assumed Friend'
      OnClick = IdentityChangeClick
    end
    object Friend1: TMenuItem
      Tag = 3
      Caption = '&Friend'
      OnClick = IdentityChangeClick
    end
    object Neutral1: TMenuItem
      Tag = 4
      Caption = '&Neutral'
      OnClick = IdentityChangeClick
    end
    object Suspect1: TMenuItem
      Tag = 5
      Caption = '&Suspect'
      OnClick = IdentityChangeClick
    end
    object Hostile1: TMenuItem
      Tag = 6
      Caption = '&Hostile'
      OnClick = IdentityChangeClick
    end
  end
  object pmforce: TPopupMenu
    Left = 16
    Top = 424
    object ForceRed1: TMenuItem
      Caption = 'Force &Red'
      OnClick = ForceChangeClick
    end
    object ForceBlue1: TMenuItem
      Tag = 1
      Caption = 'Force &Blue'
      OnClick = ForceChangeClick
    end
    object ForceGreen1: TMenuItem
      Tag = 2
      Caption = 'Force &Green'
      Visible = False
      OnClick = ForceChangeClick
    end
    object ForceAmber1: TMenuItem
      Tag = 3
      Caption = 'Force &Amber'
      Visible = False
      OnClick = ForceChangeClick
    end
    object NoForce1: TMenuItem
      Tag = 4
      Caption = 'No Force'
      OnClick = ForceChangeClick
    end
  end
  object pmPlatformType: TPopupMenu
    Left = 312
    Top = 320
    object Acoustic1: TMenuItem
      Caption = 'Acoustic Decoy'
    end
  end
  object pmPropulsionType: TPopupMenu
    Left = 320
    Top = 368
    object Unknown2: TMenuItem
      Caption = 'Unknown'
    end
    object Convensional1: TMenuItem
      Caption = 'Convensional'
    end
    object Nuclear1: TMenuItem
      Caption = 'Nuclear'
    end
  end
  object pmpumtype: TPopupMenu
    Left = 72
    Top = 416
    object mnAircraftCarrier: TMenuItem
      Caption = 'Aircraft Carrier (CV/CVN)'
      RadioItem = True
    end
    object mnAmphibiousWarfare: TMenuItem
      Caption = 'Amphibious Warfare'
      RadioItem = True
    end
    object mnAuxiliary: TMenuItem
      Caption = 'Auxiliary'
      RadioItem = True
    end
    object mnChaff: TMenuItem
      Caption = 'Chaff'
      RadioItem = True
    end
    object mnCruiserGuidedMissile: TMenuItem
      Caption = 'Cruiser, Guided Missile (CG/CGN)'
      RadioItem = True
    end
    object mnDestroyer: TMenuItem
      Caption = 'Destroyer'
      RadioItem = True
    end
    object mnDestroyerGuidedMissle: TMenuItem
      Caption = 'Destroyer, Guided Missle (DOG)'
      RadioItem = True
    end
    object mnFrigate: TMenuItem
      Caption = 'Frigate (FF)'
      RadioItem = True
    end
    object mnFrigateGuidedMissle: TMenuItem
      Caption = 'Frigate, Guided Missle (FFG)'
      RadioItem = True
    end
    object mnInfraredDecoy: TMenuItem
      Caption = 'Infrared Decoy'
      RadioItem = True
    end
    object mnJammerDecoy: TMenuItem
      Caption = 'Jammer Decoy'
      RadioItem = True
    end
    object mnMerchant: TMenuItem
      Caption = 'Merchant'
      RadioItem = True
    end
    object mnMineWar: TMenuItem
      Caption = 'Mine Warfare'
    end
    object mnPatrolCraff: TMenuItem
      Caption = 'Patrol Craft (PT/PTG)'
    end
    object mnUtility: TMenuItem
      Caption = 'Utility Vessel'
    end
    object mnOther: TMenuItem
      Caption = 'Other'
    end
  end
  object j: TPopupMenu
    Left = 144
    Top = 136
    object mnAir: TMenuItem
      Caption = '&Air'
      OnClick = mnAirClick
    end
    object mnSurface: TMenuItem
      Tag = 1
      Caption = '&Surface'
      OnClick = mnAirClick
    end
    object mnSubsurface: TMenuItem
      Tag = 2
      Caption = 'S&ubsurface'
      OnClick = mnAirClick
    end
    object mnLand: TMenuItem
      Tag = 3
      Caption = '&Land'
      OnClick = mnAirClick
    end
    object mnGeneral: TMenuItem
      Tag = 4
      Caption = '&General'
      OnClick = mnAirClick
    end
  end
  object pmpumidentity: TPopupMenu
    Left = 240
    Top = 368
    object mnPending: TMenuItem
      Caption = '&Pending'
      OnClick = mnPendingClick
    end
    object mnUnknown: TMenuItem
      Tag = 1
      Caption = '&Unknown'
      OnClick = mnPendingClick
    end
    object mnAssumedFriend: TMenuItem
      Tag = 2
      Caption = '&Assumed Friend'
      OnClick = mnPendingClick
    end
    object mnFriend: TMenuItem
      Tag = 3
      Caption = '&Friend'
      OnClick = mnPendingClick
    end
    object mnNeutral: TMenuItem
      Tag = 4
      Caption = '&Neutral'
      OnClick = mnPendingClick
    end
    object mnSuspent: TMenuItem
      Tag = 5
      Caption = '&Suspect'
      OnClick = mnPendingClick
    end
    object mnHostile: TMenuItem
      Tag = 6
      Caption = '&Hostile'
      OnClick = mnPendingClick
    end
  end
  object pmGeneralSpecial: TPopupMenu
    Left = 160
    Top = 368
    object General2: TMenuItem
      Caption = '&General'
      Hint = 'General'
      OnClick = ASWGeneral1Click
    end
    object Bouy1: TMenuItem
      Caption = '&Buoy'
      Hint = 'Sonobuoy'
      OnClick = ASWGeneral1Click
    end
    object DatalinkReferencePoint1: TMenuItem
      Caption = '&Datalink Reference Point'
      Hint = 'DataLinkReferencePoint'
      OnClick = ASWGeneral1Click
    end
    object DistressedVessel1: TMenuItem
      Caption = 'Distressed &Vessel'
      Hint = 'DistressedVessel'
      OnClick = ASWGeneral1Click
    end
    object ESMECMFix1: TMenuItem
      Caption = '&ESM/ECM Fix'
      Hint = 'EsmEcmFix'
      OnClick = ASWGeneral1Click
    end
    object GroundZero1: TMenuItem
      Caption = '&Ground Zero'
      Hint = 'GroundZero'
      OnClick = ASWGeneral1Click
    end
    object ManInZero1: TMenuItem
      Caption = 'Man In &Water'
      Hint = 'ManInWater'
      OnClick = ASWGeneral1Click
    end
    object MaritimeHeadquarter1: TMenuItem
      Caption = 'Maritime Head&quarter'
      Hint = 'MaritimeHeadquarters'
      OnClick = ASWGeneral1Click
    end
    object MineHazard1: TMenuItem
      Caption = '&Mine Hazard'
      Hint = 'Mine'
      OnClick = ASWGeneral1Click
    end
    object NavigationHazart1: TMenuItem
      Caption = '&Navigation Hazard'
      Hint = 'NavigationHazard'
      OnClick = ASWGeneral1Click
    end
    object OilRig1: TMenuItem
      Caption = '&Oil Rig'
      Hint = 'OilRig'
      OnClick = ASWGeneral1Click
    end
    object Station1: TMenuItem
      Caption = '&Station'
      Hint = 'Station'
      OnClick = ASWGeneral1Click
    end
    object acticalGridOrigin1: TMenuItem
      Caption = '&Tactical Grid Origin'
      Hint = 'TacticalGridorigin'
      OnClick = ASWGeneral1Click
    end
  end
  object pmAirSpecial: TPopupMenu
    Left = 80
    Top = 368
    object AirGeneral1: TMenuItem
      Caption = '&Air General'
      Hint = 'Air'
      OnClick = ASWGeneral1Click
    end
    object AirborneEarlyWarning1: TMenuItem
      Caption = 'Airborne Early &Warning'
      Hint = 'AirborneEarlyWarning'
      OnClick = ASWGeneral1Click
    end
    object Bullseye1: TMenuItem
      Caption = '&Bullseye'
      Hint = 'Bullseye'
      OnClick = ASWGeneral1Click
    end
    object CombatAirPatrol1: TMenuItem
      Caption = '&Combat Air Patrol'
      Hint = 'CombatAirPatrol'
      OnClick = ASWGeneral1Click
    end
    object DitchedAirCraft1: TMenuItem
      Caption = '&Ditched Air Craft'
      Hint = 'DitchedAirCraft'
      OnClick = ASWGeneral1Click
    end
    object Gate1: TMenuItem
      Caption = '&Gate'
      Hint = 'Gate'
      OnClick = ASWGeneral1Click
    end
  end
  object pmASW: TPopupMenu
    Left = 16
    Top = 368
    object ASWGeneral1: TMenuItem
      Caption = 'ASW General'
      Hint = 'AswGeneral'
      OnClick = ASWGeneral1Click
    end
    object BriefContact1: TMenuItem
      Caption = 'Brief Contact'
      Hint = 'BriefContact'
      OnClick = ASWGeneral1Click
    end
    object Datum1: TMenuItem
      Caption = 'Datum'
      Hint = 'Datum'
      OnClick = ASWGeneral1Click
    end
    object Kingpin1: TMenuItem
      Caption = 'Kingpin'
      Hint = 'Kingpin'
      OnClick = ASWGeneral1Click
    end
    object Riser1: TMenuItem
      Caption = 'Riser'
      Hint = 'Riser'
      OnClick = ASWGeneral1Click
    end
    object SearchCenter1: TMenuItem
      Caption = 'Search Center'
      Hint = 'SearchCenter'
      OnClick = ASWGeneral1Click
    end
    object Sinker1: TMenuItem
      Caption = 'Sinker'
      Hint = 'Sinker'
      OnClick = ASWGeneral1Click
    end
    object WeaponEntryPoint1: TMenuItem
      Caption = 'Weapon Entry Point'
      Hint = 'WeaponEntryPoint'
      OnClick = ASWGeneral1Click
    end
    object Wreck1: TMenuItem
      Caption = 'Wreck'
      Hint = 'Wreck'
      OnClick = ASWGeneral1Click
    end
  end
end
