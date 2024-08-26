object frmSaveAsOverlay: TfrmSaveAsOverlay
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = ' Save as Overlay'
  ClientHeight = 361
  ClientWidth = 274
  Color = 5980694
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lvOverlayTemplate: TListView
    Left = 11
    Top = 8
    Width = 250
    Height = 174
    Columns = <
      item
        Caption = 'No'
        Width = 30
      end
      item
        Caption = 'Name'
        Width = 135
      end
      item
        Caption = 'Type'
        Width = 80
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    GridLines = True
    ReadOnly = True
    RowSelect = True
    ParentFont = False
    TabOrder = 0
    ViewStyle = vsReport
    OnSelectItem = lvOverlayTemplateSelectItem
  end
  object pnlScenario: TPanel
    Left = 11
    Top = 181
    Width = 250
    Height = 135
    BevelOuter = bvNone
    Color = 16775920
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 1
      Width = 59
      Height = 16
      Caption = 'Scenario :'
    end
    object lbl1: TLabel
      Left = 10
      Top = 20
      Width = 36
      Height = 16
      Caption = 'Force '
    end
    object lbl2: TLabel
      Left = 44
      Top = 19
      Width = 5
      Height = 16
      Caption = ':'
    end
    object lblScenarioName: TLabel
      Left = 75
      Top = 2
      Width = 86
      Height = 16
      Caption = 'Scenario name'
    end
    object rgfOrCe: TRadioGroup
      Left = 75
      Top = 20
      Width = 91
      Height = 109
      Items.Strings = (
        'Blue'
        'Red'
        'Yellow'
        'Green'
        'No Force'
        'NTDS')
      TabOrder = 0
    end
  end
  object btnCancel: TButton
    Left = 186
    Top = 325
    Width = 75
    Height = 25
    Caption = 'Cancel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnSaveAs: TButton
    Left = 105
    Top = 325
    Width = 75
    Height = 25
    Caption = 'Save As'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnSaveAsClick
  end
end
