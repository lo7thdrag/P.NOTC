object fEditGameCenter: TfEditGameCenter
  Left = 0
  Top = 0
  Caption = 'fEditGameCenter'
  ClientHeight = 566
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object FMap: TMap
    Left = 0
    Top = -8
    Width = 712
    Height = 566
    ParentColor = False
    TabOrder = 0
    OnMouseUp = FMapMouseUp
    OnMouseMove = FMapMouseMove
    OnMouseDown = FMapMouseDown
    OnClick = FMapClick
    OnDrawUserLayer = FMapDrawUserLayer
    ControlData = {
      8A1A0600964900007F3A0000010000000F0000FF0D47656F44696374696F6E61
      727905456D70747900E8030000000000000000000002000E001E000000000000
      0000000000000000000000000000000000000000000600010000000000500001
      0100000A0000000001F4010000050000800C000000000000000000000000FFFF
      FF000100000000000000000000000000000000000000000000000352E30B918F
      CE119DE300AA004BB85101000000900170460D0005417269616C000352E30B91
      8FCE119DE300AA004BB851010000009001301B0F0005417269616C0000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FFFF000000000000000001370000000000FFFFFF000000000000000352E30B91
      8FCE119DE300AA004BB851010000009001DC7C010005417269616C000352E30B
      918FCE119DE300AA004BB851010200009001A42C02000B4D61702053796D626F
      6C730000000000000001000100FFFFFF000200FFFFFF00000000000001000000
      01000118010000A802260001000000010000001C000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000002
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      8076C000000000008056C0000000000080764000000000008056400100000018
      010000A802260001000000272C28061C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000200000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000098703001000000002C
      EAA2440000000000000000AEEB22006323280600000000000000000000000000
      000088B3400000000000408F400001000001}
  end
  object GroupBox1: TGroupBox
    Left = 718
    Top = 24
    Width = 216
    Height = 161
    Caption = 'Center Game Area'
    TabOrder = 1
    object Label2: TLabel
      Left = 12
      Top = 27
      Width = 50
      Height = 13
      Caption = 'Lattitude :'
    end
    object Label3: TLabel
      Left = 12
      Top = 54
      Width = 54
      Height = 13
      Caption = 'Longitude :'
    end
    object Label4: TLabel
      Left = 12
      Top = 81
      Width = 35
      Height = 13
      Caption = 'Width :'
    end
    object Label5: TLabel
      Left = 172
      Top = 54
      Width = 35
      Height = 13
      Caption = 'Degree'
    end
    object Label6: TLabel
      Left = 172
      Top = 27
      Width = 35
      Height = 13
      Caption = 'Degree'
    end
    object widthEdit: TEdit
      Left = 72
      Top = 78
      Width = 95
      Height = 21
      TabOrder = 0
    end
    object xDegree: TEdit
      Left = 72
      Top = 51
      Width = 94
      Height = 21
      TabOrder = 1
    end
    object yDegree: TEdit
      Left = 72
      Top = 24
      Width = 94
      Height = 21
      TabOrder = 2
    end
  end
  object apply: TButton
    Left = 859
    Top = 140
    Width = 66
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
    OnClick = ApplyClick
  end
  object btOk: TButton
    Left = 778
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 859
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btCancelClick
  end
end
