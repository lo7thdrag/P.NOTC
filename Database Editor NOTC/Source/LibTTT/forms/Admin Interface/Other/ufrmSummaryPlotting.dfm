object frmSummaryPlotting: TfrmSummaryPlotting
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Plotting'
  ClientHeight = 238
  ClientWidth = 260
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
  object bvl1: TBevel
    Left = 33
    Top = 189
    Width = 193
    Height = 3
  end
  object lblName: TLabel
    Left = 32
    Top = 5
    Width = 37
    Height = 13
    Caption = 'Name  :'
  end
  object lbl1: TLabel
    Left = 32
    Top = 44
    Width = 34
    Height = 13
    Caption = 'Type  :'
  end
  object bvl2: TBevel
    Left = 32
    Top = 103
    Width = 188
    Height = 50
  end
  object lbl2: TLabel
    Left = 33
    Top = 85
    Width = 45
    Height = 13
    Caption = 'Identity :'
  end
  object lbl3: TLabel
    Left = 195
    Top = 25
    Width = 59
    Height = 11
    Caption = '* Max 12 char'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtPlotName: TEdit
    Left = 33
    Top = 20
    Width = 160
    Height = 21
    MaxLength = 12
    TabOrder = 0
  end
  object cbbPlotType: TComboBox
    Left = 32
    Top = 63
    Width = 161
    Height = 21
    TabOrder = 1
    Text = 'Intelijen'
    OnSelect = cbbPlotTypeSelect
    Items.Strings = (
      'Intelijen'
      'Logistic'
      'Radar'
      'Pangkalan'
      'Panah')
  end
  object btnEditPlot: TButton
    Left = 137
    Top = 158
    Width = 89
    Height = 25
    Caption = 'Edit Plotting..'
    TabOrder = 2
    OnClick = btnEditPlotClick
  end
  object btnOk: TButton
    Left = 41
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 145
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object rbRed: TRadioButton
    Left = 41
    Top = 107
    Width = 113
    Height = 17
    Caption = 'Hostile'
    TabOrder = 5
  end
  object rbBlue: TRadioButton
    Left = 41
    Top = 130
    Width = 113
    Height = 17
    Caption = 'Friend'
    TabOrder = 6
  end
end
