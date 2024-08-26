object fResourceAllocSelection: TfResourceAllocSelection
  Left = 0
  Top = 0
  Caption = 'Resource Allocation'
  ClientHeight = 419
  ClientWidth = 661
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 13
    Width = 47
    Height = 13
    Caption = 'Available:'
  end
  object Label2: TLabel
    Left = 376
    Top = 13
    Width = 45
    Height = 13
    Caption = 'Selected:'
  end
  object lbAvailableResAlloc: TListBox
    Left = 8
    Top = 32
    Width = 257
    Height = 345
    ItemHeight = 13
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 168
    Width = 75
    Height = 25
    Caption = '->'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object ListBox2: TListBox
    Left = 376
    Top = 32
    Width = 257
    Height = 345
    ItemHeight = 13
    TabOrder = 2
  end
  object Button1: TButton
    Left = 558
    Top = 392
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
  end
end
