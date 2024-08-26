object fmEmbarkTrackIDInput: TfmEmbarkTrackIDInput
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  ClientHeight = 71
  ClientWidth = 125
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
  object lblTrackID: TLabel
    Left = 12
    Top = 12
    Width = 44
    Height = 13
    Caption = 'TrackID :'
  end
  object btnOk: TButton
    Left = 8
    Top = 35
    Width = 109
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object edtTrackID: TEdit
    Left = 67
    Top = 8
    Width = 50
    Height = 21
    TabOrder = 1
    Text = 'NULL'
    OnKeyPress = edtTrackIDKeyPress
  end
end
