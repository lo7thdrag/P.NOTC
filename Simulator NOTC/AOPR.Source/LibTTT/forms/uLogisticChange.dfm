object frmLogisticChange: TfrmLogisticChange
  Left = 600
  Top = 394
  BorderIcons = []
  Caption = 'Logistic Change'
  ClientHeight = 220
  ClientWidth = 240
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHose: TPanel
    Left = 0
    Top = 0
    Width = 240
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    object Label4: TLabel
      Left = 6
      Top = 12
      Width = 45
      Height = 16
      Caption = 'Hose  : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cbbHose: TComboBox
      Left = 57
      Top = 8
      Width = 80
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Port'
      Items.Strings = (
        'Port'
        'Starboard')
    end
  end
  object pnlValue: TPanel
    Left = 0
    Top = 40
    Width = 240
    Height = 180
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    object btnCancel: TSpeedButton
      Left = 142
      Top = 146
      Width = 91
      Height = 22
      Caption = 'Cancel'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnCancelClick
    end
    object btnTransfer: TSpeedButton
      Left = 45
      Top = 146
      Width = 91
      Height = 22
      Caption = 'Transfer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = btnTransferClick
    end
    object GroupBox16: TGroupBox
      Left = 6
      Top = 3
      Width = 227
      Height = 134
      Color = 16775920
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object Label31: TLabel
        Left = 16
        Top = 20
        Width = 37
        Height = 16
        Caption = '-  Fuel'
      end
      object lblFuel: TLabel
        Left = 190
        Top = 20
        Width = 18
        Height = 16
        Caption = 'm3'
      end
      object lblFreshWater: TLabel
        Left = 190
        Top = 70
        Width = 18
        Height = 16
        Caption = 'm3'
      end
      object Label38: TLabel
        Left = 16
        Top = 95
        Width = 41
        Height = 16
        Caption = '-  Food'
      end
      object lblFood: TLabel
        Left = 189
        Top = 95
        Width = 18
        Height = 16
        Caption = 'ton'
      end
      object Label69: TLabel
        Left = 100
        Top = 70
        Width = 13
        Height = 16
        Caption = ' : '
      end
      object Label113: TLabel
        Left = 100
        Top = 95
        Width = 13
        Height = 16
        Caption = ' : '
      end
      object Label145: TLabel
        Left = 100
        Top = 20
        Width = 13
        Height = 16
        Caption = ' : '
      end
      object Label2: TLabel
        Left = 16
        Top = 45
        Width = 71
        Height = 16
        Caption = '-  Lubricants'
      end
      object Label3: TLabel
        Left = 100
        Top = 45
        Width = 13
        Height = 16
        Caption = ' : '
      end
      object lblML: TLabel
        Left = 190
        Top = 45
        Width = 18
        Height = 16
        Caption = 'm3'
      end
      object Label5: TLabel
        Left = 16
        Top = 71
        Width = 48
        Height = 16
        Caption = '-  Water'
      end
      object edtFuelTrans: TEdit
        Left = 120
        Top = 17
        Width = 60
        Height = 24
        MaxLength = 7
        TabOrder = 0
        Text = '0'
        OnKeyPress = edtDesimalKeyPress
      end
      object edtATTrans: TEdit
        Left = 120
        Top = 67
        Width = 60
        Height = 24
        MaxLength = 7
        TabOrder = 2
        Text = '0'
        OnKeyPress = edtDesimalKeyPress
      end
      object edtFoodTrans: TEdit
        Left = 120
        Top = 92
        Width = 60
        Height = 24
        MaxLength = 7
        TabOrder = 3
        Text = '0'
        OnKeyPress = edtDesimalKeyPress
      end
      object edtMLTrans: TEdit
        Left = 120
        Top = 42
        Width = 60
        Height = 24
        MaxLength = 7
        TabOrder = 1
        Text = '0'
        OnKeyPress = edtDesimalKeyPress
      end
    end
  end
end
