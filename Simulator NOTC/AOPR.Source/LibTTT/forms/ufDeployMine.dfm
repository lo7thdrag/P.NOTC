object frmDeployMine: TfrmDeployMine
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ' Deploy Mine'
  ClientHeight = 149
  ClientWidth = 288
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 8
    Top = -3
    Width = 276
    Height = 113
    Align = alCustom
    Color = 16775920
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object btnPosition: TSpeedButton
      Tag = 3
      Left = 242
      Top = 70
      Width = 25
      Height = 25
      Glyph.Data = {
        D20A0000424DD20A00000000000042000000280000001A0000001A0000000100
        200003000000900A0000130B0000130B000000000000000000000000FF0000FF
        0000FF000000FFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF9F9C96FF807D78FF807D78FF807D78FF807D78FF807D78FF807D
        78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D
        78FF807D78FF807D78FFBFBBB4FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FF8F8C87FFB0ACA5FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFC0BCB4FF8F8D87FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFBFBBB4FFBFBBB4FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFB0AC
        A5FFA09C96FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFDFDAD2FF605D5AFF302E2DFF0000
        00FF000000FF201F1EFF706D69FFBFBBB4FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D
        78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF706C69FF201F1EFFA09C
        96FFD0CCC3FF9F9C96FFA09C96FFE0DBD2FF807D78FF10100FFF706D69FFEFEA
        E1FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF302E2DFF706D
        69FFEFEAE1FFFFFAF0FFFFFAF0FF9F9C96FFA09C96FFFFFAF0FFFFFAF0FFEFEA
        E1FF605D5AFF302E2DFFEFEAE1FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FF706C
        69FF605D5AFFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C96FFA09C96FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF706D69FF706D69FFFFFAF0FFFFFAF0FFFFFA
        F0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFA
        F0FFBFBBB4FF10100FFFEFEAE1FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C
        96FFA09C96FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF201F1EFFDFDB
        D2FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D
        78FFFFFAF0FFFFFAF0FF706D69FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF9F9C96FFA09C96FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FF9F9C96FF605E5AFFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FF201F1EFFE0DBD2FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFC0BBB4FFBFBBB4FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFCFCBC3FF302F2DFFFFFAF0FFFFFAF0FF807D78FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FF000000FF9F9C
        96FF9F9C96FF9F9C96FF9F9C96FF9F9C96FFBFBBB4FFFFFAF0FFFFFAF0FFBFBB
        B4FF9F9C96FF9F9C96FF9F9C96FF9F9C96FF9F9C96FF000000FFFFFAF0FFFFFA
        F0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFA
        F0FF000000FFA09C96FFA09C96FFA09C96FFA09C96FFA09C96FFBFBCB4FFFFFA
        F0FFFFFAF0FFBFBBB4FFA09C96FFA09C96FFA09C96FFA09C96FFA09C96FF0000
        00FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D
        78FFFFFAF0FFFFFAF0FF302E2DFFCFCBC3FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFBFBBB4FFBFBBB4FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFDFDBD2FF201F1EFFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FF605D5AFFA09C96FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C96FFA09C96FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FF807D78FF706D69FFFFFAF0FFFFFAF0FF807D78FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFDFDAD2FF201F
        1EFFEFEAE1FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C96FFA09C96FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF10100FFFBFBBB4FFFFFAF0FFFFFA
        F0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFA
        F0FFFFFAF0FF706D69FF706D69FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C
        96FFA09C96FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF5F5D5AFF706D69FFFFFA
        F0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D
        78FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF302E2DFF5F5D5AFFEFEAE1FFFFFA
        F0FFFFFAF0FF9F9C96FFA09C96FFFFFAF0FFFFFAF0FFEFEAE1FF706C69FF302E
        2DFFEFEAE1FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFEFEAE1FF706D
        69FF10100FFF7F7C78FFDFDBD2FF9F9C96FFA09C96FFCFCBC3FF9F9C96FF201F
        1EFF706D69FFEFEAE1FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFC0BCB4FF706D69FF201F1EFF000000FF000000FF302F
        2DFF605E5AFFDFDBD2FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FF807D78FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF9F9C96FFAFABA5FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFBFBBB4FFBFBBB4FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FF8F8C87FFBFBBB4FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFAFABA5FF908D87FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFC0BCB4FF807D78FF807D78FF807D78FF807D
        78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D78FF807D
        78FF807D78FF807D78FF807D78FF807D78FFA09C96FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFA
        F0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FFFFFAF0FF}
      OnClick = btnPositionClick
    end
    object lbl2: TLabel
      Left = 15
      Top = 20
      Width = 25
      Height = 16
      Caption = 'Row'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 15
      Top = 47
      Width = 43
      Height = 16
      Caption = 'Column'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 15
      Top = 74
      Width = 44
      Height = 16
      Caption = 'Position'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 58
      Top = 20
      Width = 13
      Height = 16
      Caption = ' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 58
      Top = 47
      Width = 13
      Height = 16
      Caption = ' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 58
      Top = 74
      Width = 13
      Height = 16
      Caption = ' : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtRow: TEdit
      Left = 77
      Top = 16
      Width = 41
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = '1'
    end
    object edtColoumn: TEdit
      Left = 77
      Top = 43
      Width = 41
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      Text = '1'
    end
    object edtPosition: TEdit
      Left = 77
      Top = 70
      Width = 161
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object btnCancel: TButton
    Left = 207
    Top = 116
    Width = 75
    Height = 30
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnCancelClick
  end
  object btnDeploy: TButton
    Left = 124
    Top = 116
    Width = 75
    Height = 30
    Caption = 'Deploy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnDeployClick
  end
end