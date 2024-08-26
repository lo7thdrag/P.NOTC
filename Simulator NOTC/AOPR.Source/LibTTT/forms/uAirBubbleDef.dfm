object fAirBubble: TfAirBubble
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Air Bubble'
  ClientHeight = 368
  ClientWidth = 457
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
    Top = 327
    Width = 457
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
    Width = 457
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
    object edtClassAirBubble: TEdit
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
    Width = 457
    Height = 270
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
        object Label7: TLabel
          Left = 11
          Top = 17
          Width = 155
          Height = 13
          Caption = 'Maximum Acoustic Cross Section'
        end
        object Label8: TLabel
          Left = 224
          Top = 17
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label9: TLabel
          Left = 311
          Top = 17
          Width = 28
          Height = 13
          Caption = 'dB m'#178
        end
        object Label1: TLabel
          Left = 11
          Top = 57
          Width = 76
          Height = 13
          Caption = 'Dissipation Time'
        end
        object Label2: TLabel
          Left = 224
          Top = 57
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label3: TLabel
          Left = 311
          Top = 57
          Width = 16
          Height = 13
          Caption = 'sec'
        end
        object Label4: TLabel
          Left = 11
          Top = 97
          Width = 59
          Height = 13
          Caption = 'Ascent Rate'
        end
        object Label5: TLabel
          Left = 224
          Top = 97
          Width = 4
          Height = 13
          Caption = ':'
        end
        object Label6: TLabel
          Left = 311
          Top = 97
          Width = 40
          Height = 13
          Caption = 'feet/min'
        end
        object edtMaxAcousticCross: TEdit
          Left = 230
          Top = 13
          Width = 75
          Height = 21
          TabOrder = 0
        end
        object edtDissipationTime: TEdit
          Left = 230
          Top = 53
          Width = 75
          Height = 21
          TabOrder = 1
        end
        object edtAscentRate: TEdit
          Left = 230
          Top = 93
          Width = 75
          Height = 21
          TabOrder = 2
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
          TabOrder = 0
        end
      end
    end
  end
end
