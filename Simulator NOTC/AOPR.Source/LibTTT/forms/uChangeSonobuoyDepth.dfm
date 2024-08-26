object fChangeSonobuoyDepth: TfChangeSonobuoyDepth
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Change Sonobuoy Depth'
  ClientHeight = 196
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = -8
    Width = 345
    Height = 209
    Color = 5980694
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 94
      Width = 103
      Height = 16
      Caption = 'New Depth         :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 57
      Width = 105
      Height = 16
      Caption = 'Current Depth     :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbDepth: TLabel
      Left = 158
      Top = 57
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
    object Label4: TLabel
      Left = 24
      Top = 20
      Width = 105
      Height = 16
      Caption = 'Track                 :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbtrack: TLabel
      Left = 158
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
    object Bevel2: TBevel
      Left = 24
      Top = 131
      Width = 288
      Height = 3
      Shape = bsTopLine
    end
    object Label1: TLabel
      Left = 158
      Top = 38
      Width = 15
      Height = 16
      Caption = '---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object btnCancel: TButton
      Left = 237
      Top = 145
      Width = 75
      Height = 30
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 156
      Top = 145
      Width = 75
      Height = 30
      Caption = 'OK'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = edOrderAltitudeKeyPress
    end
    object edtNewDepth: TEdit
      Left = 158
      Top = 90
      Width = 91
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = '---'
    end
  end
end
