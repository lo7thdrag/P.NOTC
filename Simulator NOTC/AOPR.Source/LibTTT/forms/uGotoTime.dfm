object frmGotoTime: TfrmGotoTime
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ' Goto Time'
  ClientHeight = 157
  ClientWidth = 259
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
  object Label1: TLabel
    Left = 10
    Top = 8
    Width = 85
    Height = 16
    Caption = 'Current Time :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCurrentTime: TLabel
    Left = 105
    Top = 8
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
  object Label3: TLabel
    Left = 9
    Top = 155
    Width = 59
    Height = 16
    Caption = 'Progress :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblInfo: TLabel
    Left = 10
    Top = 130
    Width = 52
    Height = 16
    Caption = 'WAIT.....'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object btnApply: TButton
    Left = 93
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Apply'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object btnCancel: TButton
    Left = 174
    Top = 126
    Width = 75
    Height = 25
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
  object GroupBox1: TGroupBox
    Left = 9
    Top = 27
    Width = 240
    Height = 93
    Caption = 'Goto...'
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
    object Label2: TLabel
      Left = 203
      Top = 26
      Width = 27
      Height = 16
      BiDiMode = bdLeftToRight
      Caption = 'after'
      ParentBiDiMode = False
    end
    object Label4: TLabel
      Left = 92
      Top = 73
      Width = 70
      Height = 16
      Caption = 'dd/mm/yyyy'
    end
    object Label5: TLabel
      Left = 171
      Top = 73
      Width = 58
      Height = 16
      Caption = 'hh:mm:ss'
    end
    object rbExactly: TRadioButton
      Left = 16
      Top = 25
      Width = 73
      Height = 17
      Caption = 'Exactly'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbSpecific: TRadioButton
      Left = 16
      Top = 50
      Width = 72
      Height = 17
      Caption = 'Specific'
      TabOrder = 4
      OnClick = rbSpecificClick
    end
    object cbExactly: TComboBox
      Left = 95
      Top = 22
      Width = 99
      Height = 24
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        '')
    end
    object edtTime: TMaskEdit
      Left = 170
      Top = 47
      Width = 59
      Height = 24
      EditMask = '!90:00:00;1;_'
      MaxLength = 8
      TabOrder = 3
      Text = '  :  :  '
      TextHint = 'Specific hh:mm:ss'
    end
    object edtDate: TMaskEdit
      Left = 95
      Top = 47
      Width = 65
      Height = 24
      EditMask = '!99/99/0000;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  -  -    '
      TextHint = 'Specific hh:mm:ss'
    end
  end
  object pgProgress: TProgressBar
    Left = 9
    Top = 174
    Width = 241
    Height = 21
    Step = 1
    TabOrder = 3
    TabStop = True
  end
  object tmGameTime: TTimer
    Interval = 500
    OnTimer = tmGameTimeTimer
    Left = 244
    Top = 2
  end
end
