object fSelectRecipient: TfSelectRecipient
  Left = 0
  Top = 0
  Caption = 'Select Recipient'
  ClientHeight = 449
  ClientWidth = 530
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblNameRecipient: TLabel
    Left = 8
    Top = 10
    Width = 182
    Height = 16
    Caption = 'Type Name Or Select From Unit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTo: TLabel
    Left = 308
    Top = 53
    Width = 15
    Height = 16
    Caption = 'To'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblInfo: TLabel
    Left = 308
    Top = 229
    Width = 22
    Height = 16
    Caption = 'Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNameRecipient: TEdit
    Left = 8
    Top = 35
    Width = 209
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object lvName: TListView
    Left = 8
    Top = 72
    Width = 209
    Height = 316
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiSelect = True
    ParentFont = False
    TabOrder = 1
    ViewStyle = vsReport
  end
  object lvTo: TListView
    Left = 308
    Top = 72
    Width = 210
    Height = 137
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiSelect = True
    ParentFont = False
    TabOrder = 2
    ViewStyle = vsReport
  end
  object lvInfo: TListView
    Left = 308
    Top = 248
    Width = 210
    Height = 140
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiSelect = True
    ParentFont = False
    TabOrder = 3
    ViewStyle = vsReport
  end
  object btnAddTo: TButton
    Left = 233
    Top = 112
    Width = 60
    Height = 25
    Caption = 'To -->'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnAddToClick
  end
  object btnRemoveTo: TButton
    Left = 233
    Top = 143
    Width = 60
    Height = 25
    Caption = '<-- To'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnRemoveToClick
  end
  object btnAddInfo: TButton
    Left = 233
    Top = 288
    Width = 60
    Height = 25
    Caption = 'Info -->'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnAddInfoClick
  end
  object btnRemoveInfo: TButton
    Left = 233
    Top = 319
    Width = 60
    Height = 25
    Caption = '<-- Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnRemoveInfoClick
  end
  object btnOk: TButton
    Left = 192
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 273
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnCancelClick
  end
end
