object fAcousticDecoy: TfAcousticDecoy
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Acoustic Decoy'
  ClientHeight = 369
  ClientWidth = 458
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
  object Panel1: TPanel
    Left = 0
    Top = 328
    Width = 458
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnApply: TButton
      Left = 371
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 289
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 203
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      OnClick = btnOKClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 458
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 10
      Top = 5
      Width = 32
      Height = 13
      Caption = 'Class :'
    end
    object edtClassAcousticDecoy: TEdit
      Left = 10
      Top = 24
      Width = 436
      Height = 21
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 458
    Height = 271
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 10
      Top = 0
      Width = 436
      Height = 265
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object grbDecoyNoise: TGroupBox
          Left = 2
          Top = 11
          Width = 423
          Height = 110
          Caption = 'Decoy Noise Contributors'
          TabOrder = 0
          object Label10: TLabel
            Left = 324
            Top = 82
            Width = 33
            Height = 13
            Caption = '500 dB'
          end
          object Label11: TLabel
            Left = 11
            Top = 82
            Width = 21
            Height = 13
            Caption = '0 dB'
          end
          object Label1: TLabel
            Left = 11
            Top = 24
            Width = 211
            Height = 13
            Caption = 'Ownship/Ambient Noise Intensity Increase :'
          end
          object edtDecoyNoise: TEdit
            Left = 370
            Top = 55
            Width = 39
            Height = 21
            TabOrder = 0
          end
          object TrackBarDecoyNoise: TTrackBar
            Left = 4
            Top = 53
            Width = 360
            Height = 23
            Max = 500
            Frequency = 50
            TabOrder = 1
            ThumbLength = 15
            OnChange = TrackBarDecoyNoiseChange
          end
        end
        object grbProbOfHit: TGroupBox
          Left = 2
          Top = 124
          Width = 423
          Height = 85
          Caption = 'Probability of Hit Modifiers'
          TabOrder = 1
          object btnEdtProbOfHit: TButton
            Left = 112
            Top = 32
            Width = 193
            Height = 33
            Caption = 'Edit...'
            TabOrder = 0
          end
        end
      end
      object Notes: TTabSheet
        Caption = 'Notes'
        ImageIndex = 1
        object mmNotes: TMemo
          Left = 3
          Top = 3
          Width = 422
          Height = 222
          Lines.Strings = (
            '')
          TabOrder = 0
        end
      end
    end
  end
end
