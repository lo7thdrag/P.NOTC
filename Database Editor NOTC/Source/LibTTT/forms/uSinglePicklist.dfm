object SinglePicklistForm: TSinglePicklistForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Motion'
  ClientHeight = 528
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 456
    Width = 339
    Height = 72
    Align = alBottom
    TabOrder = 0
    object grbFilter: TGroupBox
      Left = 8
      Top = 1
      Width = 321
      Height = 47
      Caption = 'Filter'
      TabOrder = 0
      object cbUsage: TCheckBox
        Left = 11
        Top = 19
        Width = 78
        Height = 17
        Caption = 'Usage'
        TabOrder = 0
      end
      object cbxFilter: TComboBox
        Left = 95
        Top = 16
        Width = 218
        Height = 21
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 339
    Height = 72
    Align = alBottom
    TabOrder = 1
    object btnNew: TButton
      Left = 11
      Top = 0
      Width = 75
      Height = 25
      Caption = 'New..'
      TabOrder = 0
    end
    object btnCopy: TButton
      Left = 93
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Copy..'
      TabOrder = 1
    end
    object btnEdit: TButton
      Left = 176
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Edit..'
      TabOrder = 2
    end
    object btnRemove: TButton
      Left = 257
      Top = 0
      Width = 75
      Height = 25
      Caption = 'Remove'
      TabOrder = 3
    end
    object btnFilter: TButton
      Left = 12
      Top = 31
      Width = 75
      Height = 25
      Caption = '<< Filter'
      TabOrder = 4
    end
    object btnUsage: TButton
      Left = 176
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Usage..'
      TabOrder = 5
    end
    object btnClose: TButton
      Left = 257
      Top = 31
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 6
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 339
    Height = 384
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 168
    ExplicitTop = 184
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lstMotion: TListBox
      Left = 8
      Top = 8
      Width = 321
      Height = 353
      ItemHeight = 13
      TabOrder = 0
    end
  end
end
