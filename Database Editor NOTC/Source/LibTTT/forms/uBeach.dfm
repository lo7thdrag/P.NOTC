object frmBeach: TfrmBeach
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Pantai'
  ClientHeight = 559
  ClientWidth = 622
  Color = clBtnFace
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
  object lbl1: TLabel
    Left = 32
    Top = 233
    Width = 57
    Height = 13
    Caption = 'Kode Pantai'
  end
  object lbl2: TLabel
    Left = 32
    Top = 260
    Width = 60
    Height = 13
    Caption = 'Nama Pantai'
  end
  object lbl3: TLabel
    Left = 32
    Top = 287
    Width = 47
    Height = 13
    Caption = 'Longitude'
  end
  object lbl4: TLabel
    Left = 32
    Top = 314
    Width = 39
    Height = 13
    Caption = 'Latitude'
  end
  object lbl5: TLabel
    Left = 32
    Top = 341
    Width = 81
    Height = 13
    Caption = 'DP Posisi Tengah'
  end
  object lbl6: TLabel
    Left = 32
    Top = 368
    Width = 123
    Height = 13
    Caption = 'LP Daerah Manuver Kapal'
  end
  object lbl7: TLabel
    Left = 32
    Top = 395
    Width = 89
    Height = 13
    Caption = 'LP Rintangan Alam'
  end
  object lbl8: TLabel
    Left = 312
    Top = 233
    Width = 100
    Height = 13
    Caption = 'LP Rintangan Buatan'
  end
  object lbl9: TLabel
    Left = 312
    Top = 260
    Width = 84
    Height = 13
    Caption = 'PDK Tinggi ombak'
  end
  object lbl10: TLabel
    Left = 312
    Top = 287
    Width = 37
    Height = 13
    Caption = 'Gradien'
  end
  object lbl11: TLabel
    Left = 312
    Top = 314
    Width = 94
    Height = 13
    Caption = 'PDP Panjang Pantai'
  end
  object lbl12: TLabel
    Left = 312
    Top = 341
    Width = 88
    Height = 13
    Caption = 'PDP Bentuk Pantai'
  end
  object lbl13: TLabel
    Left = 312
    Top = 368
    Width = 86
    Height = 13
    Caption = 'PB Material Pantai'
  end
  object lbl14: TLabel
    Left = 312
    Top = 395
    Width = 56
    Height = 13
    Caption = 'Keterangan'
  end
  object rzdbgrd1: TRzDBGrid
    Left = 8
    Top = 8
    Width = 600
    Height = 193
    DataSource = dsPantai
    DefaultDrawing = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PNT_ID'
        Title.Caption = 'KODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_NAME'
        Title.Caption = 'NAMA PANTAI'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_LONGITUDE'
        Title.Caption = 'LONGITUDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_LATITUDE'
        Title.Caption = 'LATITUDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_DP_POSISI_TENGAH'
        Title.Caption = 'DP POSISI TENGAH'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_LP_DAERAH_MANUVER_KAPAL'
        Title.Caption = 'LP DAERAH MANUVER KAPAL'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_LP_RINTANGAN_ALAM'
        Title.Caption = 'LP RINTANGAN ALAM'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_LP_RINTANGAN_BUATAN'
        Title.Caption = 'LP RINTANGAN BUATAN'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_PDK_TINGGI_OMBAK'
        Title.Caption = 'PDK TINGGI OMBAK'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_PDK_GRADIEN'
        Title.Caption = 'PDK GRADIEN'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_PDP_PANJANG_PANTAI'
        Title.Caption = 'PDP PANJANG PANTAI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_PDP_BENTUK_PANTAI'
        Title.Caption = 'PDP BENTUK PANTAI'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_PB_MATERIAL_PANTAI'
        Title.Caption = 'PB MATERIAL PANTAI'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PNT_KETERANGAN'
        Title.Caption = 'KETERANGAN'
        Width = 100
        Visible = True
      end>
  end
  object dbnvgr1: TDBNavigator
    Left = 172
    Top = 519
    Width = 240
    Height = 25
    DataSource = dsPantai
    TabOrder = 1
  end
  object dbedtKODE_PELABUHAN5: TDBEdit
    Left = 161
    Top = 230
    Width = 121
    Height = 21
    DataField = 'PNT_ID'
    DataSource = dsPantai
    TabOrder = 2
  end
  object dbedtPNT_ID: TDBEdit
    Left = 161
    Top = 257
    Width = 121
    Height = 21
    DataField = 'PNT_NAME'
    DataSource = dsPantai
    TabOrder = 3
  end
  object dbedtPNT_ID1: TDBEdit
    Left = 161
    Top = 284
    Width = 121
    Height = 21
    DataField = 'PNT_LONGITUDE'
    DataSource = dsPantai
    TabOrder = 4
  end
  object dbedtPNT_ID2: TDBEdit
    Left = 161
    Top = 311
    Width = 121
    Height = 21
    DataField = 'PNT_LATITUDE'
    DataSource = dsPantai
    TabOrder = 5
  end
  object dbedtPNT_ID3: TDBEdit
    Left = 161
    Top = 338
    Width = 121
    Height = 21
    DataField = 'PNT_DP_POSISI_TENGAH'
    DataSource = dsPantai
    TabOrder = 6
  end
  object dbedtPNT_ID4: TDBEdit
    Left = 161
    Top = 365
    Width = 121
    Height = 21
    DataField = 'PNT_LP_DAERAH_MANUVER_KAPAL'
    DataSource = dsPantai
    TabOrder = 7
  end
  object dbedtPNT_ID5: TDBEdit
    Left = 161
    Top = 392
    Width = 121
    Height = 21
    DataField = 'PNT_LP_RINTANGAN_ALAM'
    DataSource = dsPantai
    TabOrder = 8
  end
  object dbedtPNT_ID6: TDBEdit
    Left = 433
    Top = 230
    Width = 121
    Height = 21
    DataField = 'PNT_LP_RINTANGAN_BUATAN'
    DataSource = dsPantai
    TabOrder = 9
  end
  object dbedtPNT_ID7: TDBEdit
    Left = 433
    Top = 257
    Width = 121
    Height = 21
    DataField = 'PNT_PDK_TINGGI_OMBAK'
    DataSource = dsPantai
    TabOrder = 10
  end
  object dbedtPNT_ID8: TDBEdit
    Left = 433
    Top = 284
    Width = 121
    Height = 21
    DataField = 'PNT_PDK_GRADIEN'
    DataSource = dsPantai
    TabOrder = 11
  end
  object dbedtPNT_ID9: TDBEdit
    Left = 433
    Top = 311
    Width = 121
    Height = 21
    DataField = 'PNT_PDP_PANJANG_PANTAI'
    DataSource = dsPantai
    TabOrder = 12
  end
  object dbedtPNT_ID10: TDBEdit
    Left = 433
    Top = 338
    Width = 121
    Height = 21
    DataField = 'PNT_PDP_BENTUK_PANTAI'
    DataSource = dsPantai
    TabOrder = 13
  end
  object dbedtPNT_ID11: TDBEdit
    Left = 433
    Top = 365
    Width = 121
    Height = 21
    DataField = 'PNT_PB_MATERIAL_PANTAI'
    DataSource = dsPantai
    TabOrder = 14
  end
  object dbmmo1: TDBMemo
    Left = 433
    Top = 392
    Width = 181
    Height = 89
    DataField = 'PNT_KETERANGAN'
    DataSource = dsPantai
    TabOrder = 15
  end
  object dsPantai: TDataSource
    DataSet = ztblPantai
    Left = 584
    Top = 432
  end
  object ztblPantai: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo".M_Pantai'
    Left = 584
    Top = 392
  end
end
