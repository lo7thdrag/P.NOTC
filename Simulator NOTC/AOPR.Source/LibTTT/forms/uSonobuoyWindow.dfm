object SonobuoyWindowForm: TSonobuoyWindowForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Sonobuoy'
  ClientHeight = 348
  ClientWidth = 425
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 425
    Height = 49
    Align = alTop
    TabOrder = 0
    object lblName: TStaticText
      Left = 16
      Top = 8
      Width = 38
      Height = 17
      Caption = 'Name :'
      TabOrder = 0
    end
    object edtName: TEdit
      Left = 16
      Top = 24
      Width = 392
      Height = 21
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 307
    Width = 425
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnApply: TButton
      Left = 333
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Apply'
      TabOrder = 0
      OnClick = btnApplyClick
    end
    object btnCancel: TButton
      Left = 252
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 171
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
    Top = 49
    Width = 425
    Height = 258
    Align = alClient
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 16
      Top = 2
      Width = 392
      Height = 233
      ActivePage = General
      TabOrder = 0
      object General: TTabSheet
        Caption = 'General'
        object lblClassName: TStaticText
          Left = 3
          Top = 16
          Width = 80
          Height = 17
          Caption = 'Maximum Depth'
          TabOrder = 0
        end
        object edtMaxDepth: TEdit
          Left = 119
          Top = 12
          Width = 97
          Height = 21
          TabOrder = 1
        end
        object lblMountExtension: TStaticText
          Left = 3
          Top = 51
          Width = 80
          Height = 17
          Caption = 'Endurance Time'
          TabOrder = 2
        end
        object lblQuantity: TStaticText
          Left = 3
          Top = 89
          Width = 80
          Height = 17
          Caption = 'Sonar Definition'
          TabOrder = 3
        end
        object edtSonarDef: TEdit
          Left = 3
          Top = 112
          Width = 350
          Height = 21
          Enabled = False
          TabOrder = 4
        end
        object txt1: TStaticText
          Left = 95
          Top = 16
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 5
        end
        object txt2: TStaticText
          Left = 95
          Top = 51
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 6
        end
        object txt3: TStaticText
          Left = 95
          Top = 89
          Width = 8
          Height = 17
          Caption = ':'
          TabOrder = 7
        end
        object edtEnduranceTime: TEdit
          Left = 119
          Top = 51
          Width = 97
          Height = 21
          TabOrder = 8
        end
        object btn1: TButton
          Left = 354
          Top = 110
          Width = 27
          Height = 25
          Caption = '...'
          TabOrder = 9
          OnClick = btn1Click
        end
      end
      object ts1: TTabSheet
        Caption = 'Physical'
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object grp1: TGroupBox
          Left = 3
          Top = 0
          Width = 245
          Height = 150
          Caption = 'Dimensions'
          TabOrder = 0
          object lbl1: TLabel
            Left = 16
            Top = 24
            Width = 40
            Height = 13
            Caption = 'Length :'
          end
          object lbl2: TLabel
            Left = 16
            Top = 56
            Width = 41
            Height = 13
            Caption = 'Width   :'
          end
          object lbl3: TLabel
            Left = 16
            Top = 88
            Width = 41
            Height = 13
            Caption = 'Height  :'
          end
          object edtLength: TEdit
            Left = 71
            Top = 21
            Width = 97
            Height = 21
            TabOrder = 0
          end
          object edtWidth: TEdit
            Left = 71
            Top = 53
            Width = 97
            Height = 21
            TabOrder = 1
          end
          object edtHeight: TEdit
            Left = 71
            Top = 86
            Width = 97
            Height = 21
            TabOrder = 2
          end
        end
      end
      object ts2: TTabSheet
        Caption = 'Notes'
        ImageIndex = 2
        object mmNotes: TMemo
          Left = 3
          Top = 0
          Width = 378
          Height = 199
          Lines.Strings = (
            ''
            '')
          TabOrder = 0
        end
      end
    end
  end
end
