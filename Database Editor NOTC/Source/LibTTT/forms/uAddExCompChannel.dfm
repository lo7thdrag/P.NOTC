object AddExCompChannelForm: TAddExCompChannelForm
  Left = 0
  Top = 0
  Caption = 'Add External Component Channel'
  ClientHeight = 171
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Caption = 'Member Name  :'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 79
    Height = 13
    Caption = 'Channel Name  :'
  end
  object verLabel: TLabel
    Left = 95
    Top = 80
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MemberName: TEdit
    Left = 92
    Top = 8
    Width = 197
    Height = 21
    TabOrder = 0
  end
  object ChannelName: TEdit
    Left = 92
    Top = 37
    Width = 197
    Height = 21
    TabOrder = 1
  end
  object btOk: TButton
    Left = 143
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 2
    OnClick = btOkClick
  end
  object btCancel: TButton
    Left = 224
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btCancelClick
  end
end
