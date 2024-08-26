object frmGroupName1: TfrmGroupName1
  Left = 686
  Top = 386
  BorderStyle = bsDialog
  Caption = 'Group Name'
  ClientHeight = 390
  ClientWidth = 348
  Color = 16775920
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
  object grpName: TGroupBox
    Left = 0
    Top = 0
    Width = 348
    Height = 390
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 8
      Width = 66
      Height = 13
      Caption = 'Group Name :'
    end
    object edtGrpName: TEdit
      Left = 8
      Top = 24
      Width = 274
      Height = 21
      MaxLength = 254
      TabOrder = 0
      OnKeyPress = edtGrpNameKeyPress
    end
    object btnOK: TButton
      Left = 207
      Top = 61
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
  object grpListPlatform: TGroupBox
    Left = 0
    Top = 0
    Width = 348
    Height = 390
    Align = alClient
    TabOrder = 1
    object pnl1: TPanel
      Left = 2
      Top = 15
      Width = 344
      Height = 339
      Align = alTop
      Caption = 'pnl1'
      TabOrder = 0
      object lv1: TListView
        Left = 1
        Top = 1
        Width = 342
        Height = 337
        Align = alClient
        Columns = <
          item
            Caption = 'Name'
            Width = 100
          end
          item
            Caption = 'Selected'
            Width = 200
          end>
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
    object pnl2: TPanel
      Left = 2
      Top = 347
      Width = 344
      Height = 41
      Align = alBottom
      TabOrder = 1
      object btnOKList: TButton
        Left = 264
        Top = 10
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = btnOKListClick
      end
    end
  end
end
