unit uPelabuhan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDataset, ComCtrls, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids,
  RzDBGrid, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZAbstractConnection, ZConnection, ExtCtrls, uDataModuleTTT;

type
  TfrmPelabuhan = class(TForm)
    dsPelabuhan: TDataSource;
    dbnvgr1: TDBNavigator;
    ztblPelabuhan: TZTable;
    rzdbgrd1: TRzDBGrid;
    intgrfldztbl1KODE_PROP: TIntegerField;
    intgrfldztbl1SEAPORT_ID: TIntegerField;
    wdstrngfldztbl1SEAPORT_NAME: TWideStringField;
    intgrfldztbl1NOMOR: TIntegerField;
    fltfldztbl1posX: TFloatField;
    fltfldztbl1posy: TFloatField;
    dsFasilitasUmum: TDataSource;
    dsFasilitasPendukung: TDataSource;
    dsAlatBongkar: TDataSource;
    dsPriodikIklim: TDataSource;
    pgc1: TPageControl;
    tsFasilitasUmum: TTabSheet;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    rzdbgrd2: TRzDBGrid;
    dbedtKODE_PELABUHAN4: TDBEdit;
    dbedtDERMAGA: TDBEdit;
    dbedtPANJANG: TDBEdit;
    dbedtLEBAR: TDBEdit;
    dbedtKEDALAMAN: TDBEdit;
    dbedtKONSTRUKSI17: TDBEdit;
    dbnvgr2: TDBNavigator;
    ts1: TTabSheet;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    rzdbgrd3: TRzDBGrid;
    dbedtKONSTRUKSI: TDBEdit;
    dbedtKONSTRUKSI1: TDBEdit;
    dbedtKONSTRUKSI2: TDBEdit;
    dbedtKONSTRUKSI3: TDBEdit;
    dbedtKONSTRUKSI4: TDBEdit;
    dbedtKONSTRUKSI5: TDBEdit;
    dbedtKONSTRUKSI6: TDBEdit;
    dbedtKONSTRUKSI7: TDBEdit;
    dbedtKONSTRUKSI8: TDBEdit;
    dbedtKONSTRUKSI9: TDBEdit;
    dbedtKONSTRUKSI10: TDBEdit;
    dbedtKONSTRUKSI11: TDBEdit;
    dbedtKONSTRUKSI12: TDBEdit;
    dbedtKONSTRUKSI13: TDBEdit;
    dbedtKONSTRUKSI14: TDBEdit;
    dbedtKONSTRUKSI15: TDBEdit;
    dbedtKONSTRUKSI16: TDBEdit;
    dbnvgr3: TDBNavigator;
    ts2: TTabSheet;
    lbl7: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    rzdbgrd4: TRzDBGrid;
    dbedtKODE_PELABUHAN: TDBEdit;
    dbedtKODE_PELABUHAN1: TDBEdit;
    dbedtKODE_PELABUHAN2: TDBEdit;
    dbedtKODE_PELABUHAN3: TDBEdit;
    dbnvgr4: TDBNavigator;
    ts4: TTabSheet;
    rzdbgrd6: TRzDBGrid;
    dbedtKODE_PELABUHAN5: TDBEdit;
    dbedtKODE_PELABUHAN6: TDBEdit;
    dbedtKODE_PELABUHAN7: TDBEdit;
    dbedtKODE_PELABUHAN8: TDBEdit;
    dbedtKODE_PELABUHAN9: TDBEdit;
    dbedtKODE_PELABUHAN10: TDBEdit;
    dbedtKODE_PELABUHAN11: TDBEdit;
    dbedtKODE_PELABUHAN12: TDBEdit;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    dbnvgr5: TDBNavigator;
    ztblFasilitasUmum: TZTable;
    ztblAlatBongkar: TZTable;
    ztblFasilitasPendukung: TZTable;
    ztblPeriodikIklim: TZTable;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initDB(const zDbServer, zDBProto, zDBname, zDBuser,
      zDBPass: string);
  end;

var
  frmPelabuhan: TfrmPelabuhan;

implementation

{$R *.dfm}

procedure TfrmPelabuhan.FormCreate(Sender: TObject);
begin
 { ztblPelabuhan.Connection := dmTTT.ZConn;


    ztblPelabuhan.Connection.HostName := dmTTT.ZConn.HostName;
        ztblPelabuhan.Connection.Database   := dmTTT.ZConn.Database;
        ztblPelabuhan.Connection.User   := dmTTT.ZConn.User;
        ztblPelabuhan.Connection.Password   := dmTTT.ZConn.Password;  }




end;

procedure TfrmPelabuhan.FormShow(Sender: TObject);
begin
//  ShowMessage(ztblPelabuhan.Connection.Database);


  ztblPelabuhan.Active := True;
  ztblFasilitasUmum.Active := True;
  ztblAlatBongkar.Active := true;
  ztblFasilitasPendukung.Active := True;
  ztblPeriodikIklim.Active := True;

  pgc1.Pages[0].Show;

end;

procedure TfrmPelabuhan.initDB(const zDbServer, zDBProto, zDBname, zDBuser,
  zDBPass: string);
begin
 { with conZConn do
  begin
    HostName := zDbServer;
    Protocol := zDBProto;
    Database := zDBname;
    User := zDBuser;
    Password := zDBPass;
  end;

  try
    conZConn.Connect;

  except
    on Exception do
    begin
      MessageDlg('Error Database Connection on ' + zDbServer, mtError, [mbOK],
        0);
      exit;
    end
  end;

  ztblPelabuhan.Active := True;
  ztblFasilitasUmum.Active := True;
  ztblAlatBongkar.Active := true;
  ztblFasilitasPendukung.Active := True;
  ztblPeriodikIklim.Active := True;  }
end;

end.
