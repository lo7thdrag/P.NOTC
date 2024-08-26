object frmHullView: TfrmHullView
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'frmHullView'
  ClientHeight = 406
  ClientWidth = 1362
  Color = 1119507
  TransparentColor = True
  TransparentColorValue = 1119507
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 1362
    Height = 406
    Align = alClient
    BevelWidth = 2
    Color = 5980694
    ParentBackground = False
    TabOrder = 0
    object pnlMainShip: TPanel
      Left = 215
      Top = 71
      Width = 1130
      Height = 261
      Color = 5980694
      ParentBackground = False
      TabOrder = 0
      object pnlKanan: TPanel
        Left = 1109
        Top = 31
        Width = 20
        Height = 199
        Align = alRight
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 0
      end
      object pnlKiri: TPanel
        Left = 1
        Top = 31
        Width = 20
        Height = 199
        Align = alLeft
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 1
      end
      object pnlBawah: TPanel
        Left = 1
        Top = 230
        Width = 1128
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 2
      end
      object pnlAtas: TPanel
        Left = 1
        Top = 1
        Width = 1128
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        Color = 5980694
        ParentBackground = False
        TabOrder = 3
      end
      object pnlShip: TPanel
        Left = 21
        Top = 31
        Width = 1088
        Height = 199
        Align = alClient
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 4
        object imgGraph: TImage
          Left = 0
          Top = 0
          Width = 1088
          Height = 199
          Cursor = crCross
          Align = alClient
          OnMouseDown = imgGraphMouseDown
          ExplicitLeft = 112
          ExplicitTop = 94
          ExplicitWidth = 345
          ExplicitHeight = 211
        end
      end
    end
    object btnCancel: TButton
      Left = 1158
      Top = 342
      Width = 90
      Height = 30
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683636
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnOK: TButton
      Left = 1254
      Top = 342
      Width = 90
      Height = 30
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3683636
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnOKClick
    end
    object Panel1: TPanel
      Left = 19
      Top = 30
      Width = 182
      Height = 347
      Color = 5980694
      ParentBackground = False
      TabOrder = 3
      object lvTransport: TListView
        Left = 1
        Top = 1
        Width = 180
        Height = 345
        Align = alClient
        Columns = <
          item
            Caption = 'No'
            Width = 30
          end
          item
            Caption = 'Instance Name'
            Width = 145
          end>
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Berlin Sans FB'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentFont = False
        TabOrder = 0
        ViewStyle = vsReport
        OnClick = lvTransportClick
      end
    end
    object Panel2: TPanel
      Left = 215
      Top = 338
      Width = 929
      Height = 38
      Color = 5980694
      ParentBackground = False
      TabOrder = 4
      object Button3: TButton
        Tag = 2
        Left = 213
        Top = 0
        Width = 90
        Height = 30
        Caption = 'Port'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3683636
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Button3Click
      end
      object Button4: TButton
        Tag = 3
        Left = 309
        Top = 0
        Width = 90
        Height = 30
        Caption = 'Starboard'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 3683636
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button4Click
      end
    end
    object pnlHistShipName: TPanel
      Left = 215
      Top = 31
      Width = 1130
      Height = 33
      Caption = 'Teluk Semangka'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 236
    Top = 338
    Width = 90
    Height = 30
    Caption = 'Front'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3683636
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Tag = 1
    Left = 332
    Top = 342
    Width = 90
    Height = 30
    Caption = 'Back'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 3683636
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
end
