object AddParticipantForm: TAddParticipantForm
  Left = 0
  Top = 0
  Caption = 'Add Participant Form'
  ClientHeight = 153
  ClientWidth = 309
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
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Participant Name :'
  end
  object Label2: TLabel
    Left = 8
    Top = 35
    Width = 88
    Height = 13
    Caption = 'Octal PU Code     :'
  end
  object verLabel: TLabel
    Left = 102
    Top = 59
    Width = 3
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object EParticipantName: TEdit
    Left = 102
    Top = 5
    Width = 199
    Height = 21
    TabOrder = 0
  end
  object EOctalPUC: TEdit
    Left = 102
    Top = 32
    Width = 199
    Height = 21
    TabOrder = 1
  end
  object btOK: TButton
    Left = 145
    Top = 96
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btOKClick
  end
  object btCancel: TButton
    Left = 226
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = btCancelClick
  end
end
