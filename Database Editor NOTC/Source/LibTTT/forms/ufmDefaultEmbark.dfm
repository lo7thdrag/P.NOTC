object frmDefaultEmbark: TfrmDefaultEmbark
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Default Embark'
  ClientHeight = 698
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 8
    Top = 648
    Width = 605
    Height = 2
  end
  object lbl17: TLabel
    Left = 352
    Top = 8
    Width = 85
    Height = 13
    Caption = 'Air Platform List  :'
  end
  object lbl18: TLabel
    Left = 355
    Top = 413
    Width = 70
    Height = 13
    Caption = 'Personel List  :'
  end
  object lbl16: TLabel
    Left = 351
    Top = 219
    Width = 173
    Height = 13
    Caption = 'Amphibious and Land Platform List  :'
  end
  object btnAdd: TButton
    Left = 280
    Top = 240
    Width = 65
    Height = 25
    Caption = 'Add ->'
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnRemove: TButton
    Left = 459
    Top = 615
    Width = 75
    Height = 25
    Caption = 'Remove'
    Enabled = False
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 456
    Top = 656
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnClose: TButton
    Left = 540
    Top = 656
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
  object btnEditTrack: TButton
    Left = 540
    Top = 615
    Width = 75
    Height = 25
    Caption = 'Edit...'
    Enabled = False
    TabOrder = 4
  end
  object btnUsage: TButton
    Left = 378
    Top = 615
    Width = 75
    Height = 25
    Caption = 'Usage...'
    Enabled = False
    TabOrder = 5
  end
  object chkAmphibi: TCheckBox
    Left = 280
    Top = 32
    Width = 65
    Height = 17
    Caption = 'Amphibi'
    TabOrder = 6
    Visible = False
  end
  object lstVehicleAvailableID: TListBox
    Left = 8
    Top = 649
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object lstAirPlatformSelectedID: TListBox
    Left = 31
    Top = 649
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 8
    Visible = False
  end
  object lvAirPlatformSelected: TListView
    Left = 351
    Top = 27
    Width = 266
    Height = 173
    Columns = <
      item
        Caption = 'Vehicle Name'
        Width = 195
      end
      item
        Caption = 'TrackID'
        Width = 60
      end>
    GridLines = True
    TabOrder = 9
    ViewStyle = vsReport
    OnSelectItem = lvAirPlatformSelectedSelectItem
  end
  object chkAir: TCheckBox
    Left = 280
    Top = 8
    Width = 65
    Height = 17
    Caption = 'Air'
    TabOrder = 10
    Visible = False
  end
  object chkLand: TCheckBox
    Left = 280
    Top = 56
    Width = 65
    Height = 17
    Caption = 'Land'
    TabOrder = 11
    Visible = False
  end
  object tvPersonel: TTreeView
    Left = 355
    Top = 432
    Width = 262
    Height = 173
    DoubleBuffered = True
    Indent = 19
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 12
  end
  object rgTypeList: TRadioGroup
    Left = 8
    Top = 8
    Width = 266
    Height = 38
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Vehicle'
      'Personel')
    TabOrder = 13
    OnClick = rgTypeListClick
  end
  object pnlPersonelList: TPanel
    Left = 8
    Top = 64
    Width = 265
    Height = 564
    BevelOuter = bvNone
    Caption = 'pnlVehicleList'
    TabOrder = 14
    object lbl19: TLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 13
      Caption = 'Personel List  :'
    end
    object lstPersonelAvailable: TListBox
      Left = 0
      Top = 20
      Width = 265
      Height = 522
      ItemHeight = 13
      TabOrder = 0
    end
    object tvPersonelAvailable: TTreeView
      Left = 0
      Top = 19
      Width = 265
      Height = 522
      DoubleBuffered = True
      Indent = 19
      ParentDoubleBuffered = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object pnlVehicleList: TPanel
    Left = 8
    Top = 64
    Width = 265
    Height = 564
    BevelOuter = bvNone
    Caption = 'pnlVehicleList'
    TabOrder = 15
    object lbl20: TLabel
      Left = 0
      Top = 0
      Width = 62
      Height = 13
      Caption = 'Vehicle List  :'
    end
    object lstVehicleAvailable: TListBox
      Left = 0
      Top = 19
      Width = 265
      Height = 522
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lstVehicleAvailableDblClick
    end
  end
  object lstPersonelAvailableID: TListBox
    Left = 56
    Top = 649
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 16
    Visible = False
  end
  object lvAmphibiousLandSelected: TListView
    Left = 351
    Top = 238
    Width = 266
    Height = 173
    Columns = <
      item
        Caption = 'Vehicle Name'
        Width = 195
      end
      item
        Caption = 'TrackID'
        Width = 60
      end>
    GridLines = True
    TabOrder = 17
    ViewStyle = vsReport
    OnSelectItem = lvAmphibiousLandSelectedSelectItem
  end
  object lstAmphibiousLandSelectedID: TListBox
    Left = 86
    Top = 649
    Width = 121
    Height = 41
    ItemHeight = 13
    TabOrder = 18
    Visible = False
  end
end
