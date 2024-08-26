object frmStartSession: TfrmStartSession
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 20
  Caption = 'Start Session'
  ClientHeight = 493
  ClientWidth = 682
  Color = clBtnFace
  DefaultMonitor = dmDesktop
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 104
  TextHeight = 16
  object lvScenario: TListView
    Left = 0
    Top = 0
    Width = 682
    Height = 423
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 343
      end
      item
        Caption = 'Type'
        Width = 137
      end
      item
        Caption = 'Date / Time'
        Width = 206
      end
      item
        Width = 57
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = lvScenarioChange
  end
  object Panel1: TPanel
    Left = 0
    Top = 423
    Width = 682
    Height = 70
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnCancel: TButton
      Left = 573
      Top = 26
      Width = 85
      Height = 29
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = '&Cancel'
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnOK: TButton
      Left = 480
      Top = 26
      Width = 86
      Height = 29
      Align = alCustom
      Anchors = [akRight, akBottom]
      Caption = '&OK'
      TabOrder = 1
      OnClick = btnOKClick
    end
  end
end
