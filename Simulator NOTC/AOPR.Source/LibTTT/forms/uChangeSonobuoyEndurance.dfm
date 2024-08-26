object fChangeSonobuoyEndurance: TfChangeSonobuoyEndurance
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Change Sonobuoy Endurance'
  ClientHeight = 189
  ClientWidth = 336
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbIndex: TLabel
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
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 345
    Height = 209
    TabOrder = 0
    object Label2: TLabel
      Left = 24
      Top = 92
      Width = 114
      Height = 16
      Caption = 'New Endurance     :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 58
      Width = 116
      Height = 16
      Caption = 'Current Endurance :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbEnduranceCurrent: TLabel
      Left = 158
      Top = 58
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
      Top = 21
      Width = 117
      Height = 16
      Caption = 'Track                    :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbEnduranceTrack: TLabel
      Left = 158
      Top = 21
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
      Left = 255
      Top = 58
      Width = 19
      Height = 16
      Caption = 'sec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 255
      Top = 92
      Width = 19
      Height = 16
      Caption = 'sec'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
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
      OnClick = btnOkClick
    end
    object edtNewEndurance: TEdit
      Left = 158
      Top = 90
      Width = 91
      Height = 21
      TabOrder = 2
      Text = '---'
    end
  end
end
