object PlanDetail: TPlanDetail
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Acoustic Torpedo Plan Detail'
  ClientHeight = 386
  ClientWidth = 265
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bvl1: TBevel
    Left = 64
    Top = 11
    Width = 192
    Height = 5
    Shape = bsTopLine
  end
  object bvl2: TBevel
    Left = 54
    Top = 73
    Width = 202
    Height = 5
    Shape = bsTopLine
  end
  object bvl3: TBevel
    Left = 10
    Top = 344
    Width = 246
    Height = 5
    Shape = bsTopLine
  end
  object bvl4: TBevel
    Left = 87
    Top = 249
    Width = 169
    Height = 5
    Shape = bsTopLine
  end
  object lbl3: TLabel
    Left = 10
    Top = 5
    Width = 48
    Height = 16
    Caption = 'Torpedo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 20
    Top = 44
    Width = 42
    Height = 16
    Caption = 'Tube  :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 10
    Top = 67
    Width = 38
    Height = 16
    Caption = 'Target'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl6: TLabel
    Left = 20
    Top = 89
    Width = 41
    Height = 16
    Caption = 'Track :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl7: TLabel
    Left = 20
    Top = 108
    Width = 42
    Height = 16
    Caption = 'Identity'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 20
    Top = 127
    Width = 91
    Height = 16
    Caption = 'Propulsion Type'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl10: TLabel
    Left = 20
    Top = 152
    Width = 40
    Height = 16
    Caption = 'Course'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl11: TLabel
    Left = 20
    Top = 169
    Width = 81
    Height = 16
    Caption = 'Ground Speed'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl12: TLabel
    Left = 20
    Top = 186
    Width = 33
    Height = 16
    Caption = 'Depth'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl13: TLabel
    Left = 20
    Top = 203
    Width = 43
    Height = 16
    Caption = 'Bearing'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl14: TLabel
    Left = 20
    Top = 220
    Width = 36
    Height = 16
    Caption = 'Range'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl15: TLabel
    Left = 10
    Top = 243
    Width = 71
    Height = 16
    Caption = 'Engagement'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl16: TLabel
    Left = 20
    Top = 265
    Width = 36
    Height = 16
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl17: TLabel
    Left = 20
    Top = 284
    Width = 119
    Height = 16
    Caption = 'Advised close course'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl18: TLabel
    Left = 20
    Top = 303
    Width = 127
    Height = 16
    Caption = 'Advised launch course'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl19: TLabel
    Left = 20
    Top = 322
    Width = 85
    Height = 16
    Caption = 'Time to launch'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAcousticTorpedoStatus: TLabel
    Left = 20
    Top = 24
    Width = 42
    Height = 16
    Caption = 'Name :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblNeme: TLabel
    Left = 68
    Top = 24
    Width = 33
    Height = 16
    Caption = 'Name'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTube: TLabel
    Left = 68
    Top = 44
    Width = 29
    Height = 16
    Caption = 'Tube'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTrack: TLabel
    Left = 153
    Top = 89
    Width = 41
    Height = 16
    Caption = 'Track :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblIdentity: TLabel
    Left = 153
    Top = 110
    Width = 45
    Height = 16
    Caption = 'Pending'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblPropulsion: TLabel
    Left = 153
    Top = 129
    Width = 52
    Height = 16
    Caption = 'Unknown'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCourse: TLabel
    Left = 153
    Top = 154
    Width = 21
    Height = 16
    Caption = '000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblSpeed: TLabel
    Left = 153
    Top = 171
    Width = 21
    Height = 16
    Caption = '000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDepth: TLabel
    Left = 153
    Top = 188
    Width = 28
    Height = 16
    Caption = '0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblBearing: TLabel
    Left = 153
    Top = 205
    Width = 21
    Height = 16
    Caption = '000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblRange: TLabel
    Left = 153
    Top = 222
    Width = 28
    Height = 16
    Caption = '0000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblStatus: TLabel
    Left = 153
    Top = 267
    Width = 81
    Height = 16
    Caption = 'Unengageable'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblCloseCourse: TLabel
    Left = 153
    Top = 286
    Width = 21
    Height = 16
    Caption = '000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblLaunchCourse: TLabel
    Left = 153
    Top = 305
    Width = 21
    Height = 16
    Caption = '000'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblTime: TLabel
    Left = 153
    Top = 324
    Width = 33
    Height = 16
    Caption = '00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl31: TLabel
    Left = 198
    Top = 154
    Width = 58
    Height = 16
    Caption = 'degrees T'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl32: TLabel
    Left = 198
    Top = 171
    Width = 30
    Height = 16
    Caption = 'knots'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl33: TLabel
    Left = 198
    Top = 188
    Width = 40
    Height = 16
    Caption = 'metres'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl34: TLabel
    Left = 198
    Top = 205
    Width = 58
    Height = 16
    Caption = 'degrees T'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl35: TLabel
    Left = 198
    Top = 222
    Width = 18
    Height = 16
    Caption = 'nm'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl36: TLabel
    Left = 198
    Top = 286
    Width = 58
    Height = 16
    Caption = 'degrees T'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl37: TLabel
    Left = 198
    Top = 305
    Width = 58
    Height = 16
    Caption = 'degrees T'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl38: TLabel
    Left = 198
    Top = 324
    Width = 39
    Height = 16
    Caption = 'mm:ss'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object btnAcousticTorpedoLaunch: TButton
    Tag = 10
    Left = 169
    Top = 351
    Width = 80
    Height = 30
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnAcousticTorpedoLaunchClick
  end
end
