object frmTeluk: TfrmTeluk
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Teluk'
  ClientHeight = 547
  ClientWidth = 689
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
    Left = 40
    Top = 233
    Width = 52
    Height = 13
    Caption = 'Kode Teluk'
  end
  object lbl2: TLabel
    Left = 40
    Top = 260
    Width = 55
    Height = 13
    Caption = 'Nama Teluk'
  end
  object lbl3: TLabel
    Left = 40
    Top = 287
    Width = 45
    Height = 13
    Caption = 'Longitute'
  end
  object lbl4: TLabel
    Left = 40
    Top = 314
    Width = 39
    Height = 13
    Caption = 'Latitude'
  end
  object lbl5: TLabel
    Left = 40
    Top = 341
    Width = 26
    Height = 13
    Caption = 'Posisi'
  end
  object lbl6: TLabel
    Left = 40
    Top = 368
    Width = 33
    Height = 13
    Caption = 'Bentuk'
  end
  object lbl7: TLabel
    Left = 40
    Top = 395
    Width = 22
    Height = 13
    Caption = 'Luas'
  end
  object lbl8: TLabel
    Left = 344
    Top = 233
    Width = 57
    Height = 13
    Caption = 'Garis Pantai'
  end
  object lbl9: TLabel
    Left = 344
    Top = 260
    Width = 52
    Height = 13
    Caption = 'Kedalaman'
  end
  object lbl10: TLabel
    Left = 344
    Top = 287
    Width = 75
    Height = 13
    Caption = 'Rintangan Alam'
  end
  object lbl11: TLabel
    Left = 344
    Top = 314
    Width = 86
    Height = 13
    Caption = 'Rintangan Buatan'
  end
  object lbl12: TLabel
    Left = 344
    Top = 341
    Width = 50
    Height = 13
    Caption = 'Pelabuhan'
  end
  object lbl13: TLabel
    Left = 40
    Top = 422
    Width = 66
    Height = 13
    Caption = 'Keadaan Laut'
  end
  object lbl14: TLabel
    Left = 344
    Top = 417
    Width = 56
    Height = 13
    Caption = 'Keterangan'
  end
  object rzdbgrd1: TRzDBGrid
    Left = 15
    Top = 8
    Width = 658
    Height = 193
    DataSource = dsTeluk
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
        FieldName = 'TLK_ID'
        Title.Caption = 'Kode'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_NAME'
        Title.Caption = 'NAME'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_LONGITUDE'
        Title.Caption = 'LONGITUDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_LATITUDE'
        Title.Caption = 'LATITUDE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_POSISI'
        Title.Caption = 'POSISI'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_BENTUK'
        Title.Caption = 'BENTUK'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_LUAS'
        Title.Caption = 'LUAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_GARIS_PANTAI'
        Title.Caption = 'GARIS PANTAI'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_KEDALAMAN'
        Title.Caption = 'KEDALAMAN'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_RINTANGAN_ALAM'
        Title.Caption = 'RINTANGAN ALAM'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_RINTANGAN_BUATAN'
        Title.Caption = 'RINTANGAN BUATAN'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_PELABUHAN'
        Title.Caption = 'PELABUHAN'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_KEADAAN_LAUT'
        Title.Caption = 'KEADAAN LAUT'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TLK_KETERANGAN'
        Title.Caption = 'KETERANGAN'
        Width = 100
        Visible = True
      end>
  end
  object dbnvgr1: TDBNavigator
    Left = 206
    Top = 503
    Width = 240
    Height = 25
    DataSource = dsTeluk
    TabOrder = 1
  end
  object dbedtKODE_PELABUHAN5: TDBEdit
    Left = 145
    Top = 230
    Width = 121
    Height = 21
    DataField = 'TLK_ID'
    DataSource = dsTeluk
    TabOrder = 2
  end
  object dbedtTLK_ID: TDBEdit
    Left = 145
    Top = 257
    Width = 121
    Height = 21
    DataField = 'TLK_NAME'
    DataSource = dsTeluk
    TabOrder = 3
  end
  object dbedtTLK_ID1: TDBEdit
    Left = 145
    Top = 284
    Width = 121
    Height = 21
    DataField = 'TLK_LONGITUDE'
    DataSource = dsTeluk
    TabOrder = 4
  end
  object dbedtTLK_ID2: TDBEdit
    Left = 145
    Top = 311
    Width = 121
    Height = 21
    DataField = 'TLK_LATITUDE'
    DataSource = dsTeluk
    TabOrder = 5
  end
  object dbedtTLK_ID3: TDBEdit
    Left = 145
    Top = 338
    Width = 121
    Height = 21
    DataField = 'TLK_POSISI'
    DataSource = dsTeluk
    TabOrder = 6
  end
  object dbedtTLK_ID4: TDBEdit
    Left = 145
    Top = 365
    Width = 121
    Height = 21
    DataField = 'TLK_BENTUK'
    DataSource = dsTeluk
    TabOrder = 7
  end
  object dbedtTLK_ID5: TDBEdit
    Left = 145
    Top = 392
    Width = 121
    Height = 21
    DataField = 'TLK_LUAS'
    DataSource = dsTeluk
    TabOrder = 8
  end
  object dbedtTLK_ID6: TDBEdit
    Left = 465
    Top = 230
    Width = 121
    Height = 21
    DataField = 'TLK_GARIS_PANTAI'
    DataSource = dsTeluk
    TabOrder = 9
  end
  object dbedtTLK_ID7: TDBEdit
    Left = 465
    Top = 257
    Width = 121
    Height = 21
    DataField = 'TLK_KEDALAMAN'
    DataSource = dsTeluk
    TabOrder = 10
  end
  object dbedtTLK_ID8: TDBEdit
    Left = 465
    Top = 284
    Width = 121
    Height = 21
    DataField = 'TLK_RINTANGAN_ALAM'
    DataSource = dsTeluk
    TabOrder = 11
  end
  object dbedtTLK_ID9: TDBEdit
    Left = 465
    Top = 311
    Width = 121
    Height = 21
    DataField = 'TLK_RINTANGAN_BUATAN'
    DataSource = dsTeluk
    TabOrder = 12
  end
  object dbedtTLK_ID11: TDBEdit
    Left = 145
    Top = 419
    Width = 121
    Height = 21
    DataField = 'TLK_KEADAAN_LAUT'
    DataSource = dsTeluk
    TabOrder = 13
  end
  object dbmmoPelabuhan: TDBMemo
    Left = 465
    Top = 341
    Width = 168
    Height = 67
    TabOrder = 14
  end
  object dbmmoKeterangan: TDBMemo
    Left = 465
    Top = 414
    Width = 168
    Height = 67
    DataField = 'TLK_KETERANGAN'
    DataSource = dsTeluk
    TabOrder = 15
  end
  object dsTeluk: TDataSource
    DataSet = ztblTeluk
    Left = 624
    Top = 280
  end
  object ztblTeluk: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."M_TELUK"'
    Left = 616
    Top = 232
  end
end
