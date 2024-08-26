object frmPelabuhan: TfrmPelabuhan
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'PORT'
  ClientHeight = 772
  ClientWidth = 766
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
  object dbnvgr1: TDBNavigator
    Left = 247
    Top = 264
    Width = 240
    Height = 25
    DataSource = dsPelabuhan
    TabOrder = 0
  end
  object rzdbgrd1: TRzDBGrid
    Left = 23
    Top = 0
    Width = 724
    Height = 258
    DataSource = dsPelabuhan
    DefaultDrawing = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SEAPORT_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'posX'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'posy'
        Width = 100
        Visible = True
      end>
  end
  object pgc1: TPageControl
    Left = 23
    Top = 295
    Width = 724
    Height = 458
    ActivePage = ts1
    TabOrder = 2
    TabStop = False
    object tsFasilitasUmum: TTabSheet
      Caption = 'Fasilitas Umum'
      object lbl1: TLabel
        Left = 32
        Top = 177
        Width = 64
        Height = 13
        Caption = 'ID Pelabuhan'
      end
      object lbl2: TLabel
        Left = 32
        Top = 209
        Width = 43
        Height = 13
        Caption = 'Dermaga'
      end
      object lbl3: TLabel
        Left = 32
        Top = 241
        Width = 39
        Height = 13
        Caption = 'Panjang'
      end
      object lbl4: TLabel
        Left = 408
        Top = 177
        Width = 27
        Height = 13
        Caption = 'Lebar'
      end
      object lbl5: TLabel
        Left = 408
        Top = 209
        Width = 52
        Height = 13
        Caption = 'Kedalaman'
      end
      object lbl6: TLabel
        Left = 408
        Top = 241
        Width = 49
        Height = 13
        Caption = 'Konstruksi'
      end
      object rzdbgrd2: TRzDBGrid
        Left = 3
        Top = 3
        Width = 710
        Height = 134
        DataSource = dsFasilitasUmum
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
            FieldName = 'KODE_PELABUHAN'
            Title.Caption = 'KODE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DERMAGA'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PANJANG'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LEBAR'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KEDALAMAN'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KONSTRUKSI'
            Width = 150
            Visible = True
          end>
      end
      object dbedtKODE_PELABUHAN4: TDBEdit
        Left = 160
        Top = 177
        Width = 121
        Height = 21
        DataField = 'KODE_PELABUHAN'
        DataSource = dsFasilitasUmum
        TabOrder = 1
      end
      object dbedtDERMAGA: TDBEdit
        Left = 160
        Top = 204
        Width = 121
        Height = 21
        DataField = 'DERMAGA'
        DataSource = dsFasilitasUmum
        TabOrder = 2
      end
      object dbedtPANJANG: TDBEdit
        Left = 160
        Top = 231
        Width = 121
        Height = 21
        DataField = 'PANJANG'
        DataSource = dsFasilitasUmum
        TabOrder = 3
      end
      object dbedtLEBAR: TDBEdit
        Left = 528
        Top = 177
        Width = 121
        Height = 21
        DataField = 'LEBAR'
        DataSource = dsFasilitasUmum
        TabOrder = 4
      end
      object dbedtKEDALAMAN: TDBEdit
        Left = 528
        Top = 204
        Width = 121
        Height = 21
        DataField = 'KEDALAMAN'
        DataSource = dsFasilitasUmum
        TabOrder = 5
      end
      object dbedtKONSTRUKSI17: TDBEdit
        Left = 528
        Top = 231
        Width = 121
        Height = 21
        DataField = 'KONSTRUKSI'
        DataSource = dsFasilitasUmum
        TabOrder = 6
      end
      object dbnvgr2: TDBNavigator
        Left = 220
        Top = 402
        Width = 240
        Height = 25
        DataSource = dsFasilitasUmum
        TabOrder = 7
      end
    end
    object ts1: TTabSheet
      Caption = 'Fasilitas Pendukung'
      ImageIndex = 1
      object lbl8: TLabel
        Left = 32
        Top = 157
        Width = 71
        Height = 13
        Caption = 'Kde Pelabuhan'
      end
      object lbl9: TLabel
        Left = 32
        Top = 181
        Width = 69
        Height = 13
        Caption = 'General Cargo'
      end
      object lbl10: TLabel
        Left = 32
        Top = 211
        Width = 83
        Height = 13
        Caption = 'Barang Karungan'
      end
      object lbl11: TLabel
        Left = 32
        Top = 235
        Width = 52
        Height = 13
        Caption = 'Peti Kemas'
      end
      object lbl12: TLabel
        Left = 32
        Top = 265
        Width = 107
        Height = 13
        Caption = 'Jam Kerja Senin-Kamis'
      end
      object lbl13: TLabel
        Left = 32
        Top = 297
        Width = 81
        Height = 13
        Caption = 'Jam Kerja Jum'#39'at'
      end
      object lbl14: TLabel
        Left = 32
        Top = 316
        Width = 78
        Height = 13
        Caption = 'Jam Kerja Sabtu'
      end
      object lbl15: TLabel
        Left = 32
        Top = 345
        Width = 111
        Height = 13
        Caption = 'Jam Kerja Minggu-Libur'
      end
      object lbl16: TLabel
        Left = 32
        Top = 377
        Width = 20
        Height = 13
        Caption = 'Pipa'
      end
      object lbl17: TLabel
        Left = 400
        Top = 157
        Width = 25
        Height = 13
        Caption = 'Tanki'
      end
      object lbl18: TLabel
        Left = 400
        Top = 181
        Width = 47
        Height = 13
        Caption = 'Tongkang'
      end
      object lbl19: TLabel
        Left = 400
        Top = 211
        Width = 24
        Height = 13
        Caption = 'Solar'
      end
      object lbl20: TLabel
        Left = 400
        Top = 235
        Width = 31
        Height = 13
        Caption = 'Bensin'
      end
      object lbl21: TLabel
        Left = 400
        Top = 264
        Width = 35
        Height = 13
        Caption = 'Kerosin'
      end
      object lbl22: TLabel
        Left = 400
        Top = 296
        Width = 75
        Height = 13
        Caption = 'Minyak Pelumas'
      end
      object lbl23: TLabel
        Left = 400
        Top = 319
        Width = 93
        Height = 13
        Caption = 'Jml Makanan Basah'
      end
      object lbl24: TLabel
        Left = 400
        Top = 347
        Width = 94
        Height = 13
        Caption = 'Jml Makanan Kering'
      end
      object rzdbgrd3: TRzDBGrid
        Left = 3
        Top = 3
        Width = 710
        Height = 126
        DataSource = dsFasilitasPendukung
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
            FieldName = 'KODE_PELABUHAN'
            Title.Caption = 'KODE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GENERAL_CARGO'
            Title.Caption = 'GENERAL CARGO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BARANG_KARUNGAN'
            Title.Caption = 'BARANG KARUNGAN'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PETI_KEMAS'
            Title.Caption = 'PETI KEMAS'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JAM_KERJA_SENINKAMIS'
            Title.Caption = 'JAM KERJA SENIN-KAMIS'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JAM_KERJA_JUMAT'
            Title.Caption = 'JAM KERJA JUMAT'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JAM_KERJA_SABTU'
            Title.Caption = 'JAM KERJA SABTU'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JAM_KERJA_MINGGU_LIBUR'
            Title.Caption = 'JAM KERJA MINGGU LIBUR'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PIPA'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TANKI'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TONGKANG'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOLAR'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BENSIN'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KEROSIN'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MINYAK_PELUMAS'
            Title.Caption = 'MINYAK PELUMAS'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JML_MAKANANBASAH'
            Title.Caption = 'JML MAKANAN BASAH'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JML_MAKANAN_KERING'
            Title.Caption = 'JML MAKANAN KERING'
            Width = 100
            Visible = True
          end>
      end
      object dbedtKONSTRUKSI: TDBEdit
        Left = 169
        Top = 154
        Width = 121
        Height = 21
        DataField = 'KODE_PELABUHAN'
        DataSource = dsFasilitasPendukung
        TabOrder = 1
      end
      object dbedtKONSTRUKSI1: TDBEdit
        Left = 169
        Top = 181
        Width = 121
        Height = 21
        DataField = 'GENERAL_CARGO'
        DataSource = dsFasilitasPendukung
        TabOrder = 2
      end
      object dbedtKONSTRUKSI2: TDBEdit
        Left = 169
        Top = 208
        Width = 121
        Height = 21
        DataField = 'BARANG_KARUNGAN'
        DataSource = dsFasilitasPendukung
        TabOrder = 3
      end
      object dbedtKONSTRUKSI3: TDBEdit
        Left = 169
        Top = 235
        Width = 121
        Height = 21
        DataField = 'PETI_KEMAS'
        DataSource = dsFasilitasPendukung
        TabOrder = 4
      end
      object dbedtKONSTRUKSI4: TDBEdit
        Left = 169
        Top = 262
        Width = 121
        Height = 21
        DataField = 'JAM_KERJA_SENINKAMIS'
        DataSource = dsFasilitasPendukung
        TabOrder = 5
      end
      object dbedtKONSTRUKSI5: TDBEdit
        Left = 169
        Top = 289
        Width = 121
        Height = 21
        DataField = 'JAM_KERJA_JUMAT'
        DataSource = dsFasilitasPendukung
        TabOrder = 6
      end
      object dbedtKONSTRUKSI6: TDBEdit
        Left = 169
        Top = 316
        Width = 121
        Height = 21
        DataField = 'JAM_KERJA_SABTU'
        DataSource = dsFasilitasPendukung
        TabOrder = 7
      end
      object dbedtKONSTRUKSI7: TDBEdit
        Left = 169
        Top = 343
        Width = 121
        Height = 21
        DataField = 'JAM_KERJA_MINGGU_LIBUR'
        DataSource = dsFasilitasPendukung
        TabOrder = 8
      end
      object dbedtKONSTRUKSI8: TDBEdit
        Left = 169
        Top = 370
        Width = 121
        Height = 21
        DataField = 'PIPA'
        DataSource = dsFasilitasPendukung
        TabOrder = 9
      end
      object dbedtKONSTRUKSI9: TDBEdit
        Left = 520
        Top = 154
        Width = 121
        Height = 21
        DataField = 'TANKI'
        DataSource = dsFasilitasPendukung
        TabOrder = 10
      end
      object dbedtKONSTRUKSI10: TDBEdit
        Left = 520
        Top = 181
        Width = 121
        Height = 21
        DataField = 'TONGKANG'
        DataSource = dsFasilitasPendukung
        TabOrder = 11
      end
      object dbedtKONSTRUKSI11: TDBEdit
        Left = 520
        Top = 208
        Width = 121
        Height = 21
        DataField = 'SOLAR'
        DataSource = dsFasilitasPendukung
        TabOrder = 12
      end
      object dbedtKONSTRUKSI12: TDBEdit
        Left = 520
        Top = 235
        Width = 121
        Height = 21
        DataField = 'BENSIN'
        DataSource = dsFasilitasPendukung
        TabOrder = 13
      end
      object dbedtKONSTRUKSI13: TDBEdit
        Left = 520
        Top = 262
        Width = 121
        Height = 21
        DataField = 'KEROSIN'
        DataSource = dsFasilitasPendukung
        TabOrder = 14
      end
      object dbedtKONSTRUKSI14: TDBEdit
        Left = 520
        Top = 289
        Width = 121
        Height = 21
        DataField = 'MINYAK_PELUMAS'
        DataSource = dsFasilitasPendukung
        TabOrder = 15
      end
      object dbedtKONSTRUKSI15: TDBEdit
        Left = 520
        Top = 316
        Width = 121
        Height = 21
        DataField = 'JML_MAKANANBASAH'
        DataSource = dsFasilitasPendukung
        TabOrder = 16
      end
      object dbedtKONSTRUKSI16: TDBEdit
        Left = 520
        Top = 343
        Width = 121
        Height = 21
        DataField = 'JML_MAKANAN_KERING'
        DataSource = dsFasilitasPendukung
        TabOrder = 17
      end
      object dbnvgr3: TDBNavigator
        Left = 220
        Top = 402
        Width = 240
        Height = 25
        DataSource = dsFasilitasPendukung
        TabOrder = 18
      end
    end
    object ts2: TTabSheet
      Caption = 'Alat Bongkar'
      ImageIndex = 2
      object lbl7: TLabel
        Left = 32
        Top = 209
        Width = 77
        Height = 13
        Caption = 'Kode Pelabuhan'
      end
      object lbl25: TLabel
        Left = 32
        Top = 241
        Width = 66
        Height = 13
        Caption = 'Jenis Bongkar'
      end
      object lbl26: TLabel
        Left = 328
        Top = 209
        Width = 75
        Height = 13
        Caption = 'Jumlah Bongkar'
      end
      object lbl27: TLabel
        Left = 328
        Top = 241
        Width = 88
        Height = 13
        Caption = 'Kapasitas bongkar'
      end
      object rzdbgrd4: TRzDBGrid
        Left = 6
        Top = 6
        Width = 710
        Height = 159
        DataSource = dsAlatBongkar
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
            FieldName = 'KODE_PELABUHAN'
            Title.Caption = 'KODE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JENIS_BONGKAR'
            Title.Caption = 'JENIS BONGKAR'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'JML_BONGKAR'
            Title.Caption = 'JML BONGKAR'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KAPASITAS_BONGKAR'
            Title.Caption = 'KAPASITAS BONGKAR'
            Width = 150
            Visible = True
          end>
      end
      object dbedtKODE_PELABUHAN: TDBEdit
        Left = 145
        Top = 206
        Width = 121
        Height = 21
        DataField = 'KODE_PELABUHAN'
        DataSource = dsAlatBongkar
        TabOrder = 1
      end
      object dbedtKODE_PELABUHAN1: TDBEdit
        Left = 145
        Top = 233
        Width = 121
        Height = 21
        DataField = 'JENIS_BONGKAR'
        DataSource = dsAlatBongkar
        TabOrder = 2
      end
      object dbedtKODE_PELABUHAN2: TDBEdit
        Left = 492
        Top = 206
        Width = 121
        Height = 21
        DataField = 'JML_BONGKAR'
        DataSource = dsAlatBongkar
        TabOrder = 3
      end
      object dbedtKODE_PELABUHAN3: TDBEdit
        Left = 492
        Top = 233
        Width = 121
        Height = 21
        DataField = 'KAPASITAS_BONGKAR'
        DataSource = dsAlatBongkar
        TabOrder = 4
      end
      object dbnvgr4: TDBNavigator
        Left = 220
        Top = 402
        Width = 240
        Height = 25
        DataSource = dsAlatBongkar
        TabOrder = 5
      end
    end
    object ts4: TTabSheet
      Caption = 'Periodik Iklim'
      ImageIndex = 4
      object lbl28: TLabel
        Left = 32
        Top = 186
        Width = 77
        Height = 13
        Caption = 'Kode Pelabuhan'
      end
      object lbl29: TLabel
        Left = 32
        Top = 217
        Width = 26
        Height = 13
        Caption = 'Bulan'
      end
      object lbl30: TLabel
        Left = 32
        Top = 242
        Width = 53
        Height = 13
        Caption = 'Arah Angin'
      end
      object lbl31: TLabel
        Left = 32
        Top = 274
        Width = 51
        Height = 13
        Caption = 'Kecepatan'
      end
      object lbl32: TLabel
        Left = 328
        Top = 186
        Width = 41
        Height = 13
        Caption = 'Dominan'
      end
      object lbl33: TLabel
        Left = 328
        Top = 217
        Width = 53
        Height = 13
        Caption = 'Gelombang'
      end
      object lbl34: TLabel
        Left = 328
        Top = 244
        Width = 24
        Height = 13
        Caption = 'Suhu'
      end
      object lbl35: TLabel
        Left = 328
        Top = 274
        Width = 62
        Height = 13
        Caption = 'Lembab Nisbi'
      end
      object rzdbgrd6: TRzDBGrid
        Left = 6
        Top = 6
        Width = 710
        Height = 159
        DataSource = dsPriodikIklim
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
            FieldName = 'KODE_PELABUHAN'
            Title.Caption = 'KODE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BULAN'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARAH_ANGIN'
            Title.Caption = 'ARAH ANGIN'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KECEPATAN'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOMINAN'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'GELOMBANG'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUHU'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LEMBAB_NISBI'
            Title.Caption = 'LEMBAB NISBI'
            Width = 150
            Visible = True
          end>
      end
      object dbedtKODE_PELABUHAN5: TDBEdit
        Left = 169
        Top = 183
        Width = 121
        Height = 21
        DataField = 'KODE_PELABUHAN'
        DataSource = dsPriodikIklim
        TabOrder = 1
      end
      object dbedtKODE_PELABUHAN6: TDBEdit
        Left = 169
        Top = 210
        Width = 121
        Height = 21
        DataField = 'BULAN'
        DataSource = dsPriodikIklim
        TabOrder = 2
      end
      object dbedtKODE_PELABUHAN7: TDBEdit
        Left = 169
        Top = 237
        Width = 121
        Height = 21
        DataField = 'ARAH_ANGIN'
        DataSource = dsPriodikIklim
        TabOrder = 3
      end
      object dbedtKODE_PELABUHAN8: TDBEdit
        Left = 169
        Top = 264
        Width = 121
        Height = 21
        DataField = 'KECEPATAN'
        DataSource = dsPriodikIklim
        TabOrder = 4
      end
      object dbedtKODE_PELABUHAN9: TDBEdit
        Left = 497
        Top = 183
        Width = 121
        Height = 21
        DataField = 'DOMINAN'
        DataSource = dsPriodikIklim
        TabOrder = 5
      end
      object dbedtKODE_PELABUHAN10: TDBEdit
        Left = 497
        Top = 210
        Width = 121
        Height = 21
        DataField = 'GELOMBANG'
        DataSource = dsPriodikIklim
        TabOrder = 6
      end
      object dbedtKODE_PELABUHAN11: TDBEdit
        Left = 497
        Top = 237
        Width = 121
        Height = 21
        DataField = 'SUHU'
        DataSource = dsPriodikIklim
        TabOrder = 7
      end
      object dbedtKODE_PELABUHAN12: TDBEdit
        Left = 497
        Top = 264
        Width = 121
        Height = 21
        DataField = 'LEMBAB_NISBI'
        DataSource = dsPriodikIklim
        TabOrder = 8
      end
      object dbnvgr5: TDBNavigator
        Left = 220
        Top = 402
        Width = 240
        Height = 25
        DataSource = dsPriodikIklim
        TabOrder = 9
      end
    end
  end
  object dsPelabuhan: TDataSource
    DataSet = ztblPelabuhan
    Left = 704
    Top = 416
  end
  object ztblPelabuhan: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."PL_PELABUHAN"'
    Left = 704
    Top = 456
    object intgrfldztbl1KODE_PROP: TIntegerField
      FieldName = 'KODE_PROP'
      Required = True
    end
    object intgrfldztbl1SEAPORT_ID: TIntegerField
      FieldName = 'SEAPORT_ID'
      Required = True
    end
    object wdstrngfldztbl1SEAPORT_NAME: TWideStringField
      FieldName = 'SEAPORT_NAME'
      Size = 50
    end
    object intgrfldztbl1NOMOR: TIntegerField
      FieldName = 'NOMOR'
    end
    object fltfldztbl1posX: TFloatField
      FieldName = 'posX'
    end
    object fltfldztbl1posy: TFloatField
      FieldName = 'posy'
    end
  end
  object dsFasilitasUmum: TDataSource
    DataSet = ztblFasilitasUmum
    Left = 568
    Top = 416
  end
  object dsFasilitasPendukung: TDataSource
    DataSet = ztblFasilitasPendukung
    Left = 664
    Top = 416
  end
  object dsAlatBongkar: TDataSource
    DataSet = ztblAlatBongkar
    Left = 616
    Top = 416
  end
  object dsPriodikIklim: TDataSource
    DataSet = ztblPeriodikIklim
    Left = 520
    Top = 416
  end
  object ztblFasilitasUmum: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."PL_FASILITAS_UMUM"'
    MasterFields = 'SEAPORT_ID'
    MasterSource = dsPelabuhan
    LinkedFields = 'KODE_PELABUHAN'
    Left = 560
    Top = 456
  end
  object ztblAlatBongkar: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."PL_ALAT_BONGKAR"'
    MasterFields = 'SEAPORT_ID'
    MasterSource = dsPelabuhan
    LinkedFields = 'KODE_PELABUHAN'
    Left = 608
    Top = 456
  end
  object ztblFasilitasPendukung: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."PL_FASILITAS_PENDUKUNG"'
    MasterFields = 'SEAPORT_ID'
    MasterSource = dsPelabuhan
    LinkedFields = 'KODE_PELABUHAN'
    Left = 656
    Top = 456
  end
  object ztblPeriodikIklim: TZTable
    Connection = dmTTT.ZConn
    TableName = '"dbo"."PL_PERIODIK_IKLIM"'
    MasterFields = 'SEAPORT_ID'
    MasterSource = dsPelabuhan
    LinkedFields = 'KODE_PELABUHAN'
    Left = 512
    Top = 456
  end
end
