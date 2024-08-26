unit uTeluk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPelabuhan, DB, Grids, DBGrids, RzDBGrid, ExtCtrls, DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZAbstractTable, ZDataset, StdCtrls, Mask,
  uDataModuleTTT;

type
  TfrmTeluk = class(TForm)
    rzdbgrd1: TRzDBGrid;
    dsTeluk: TDataSource;
    ztblTeluk: TZTable;
    dbnvgr1: TDBNavigator;
    dbedtKODE_PELABUHAN5: TDBEdit;
    dbedtTLK_ID: TDBEdit;
    dbedtTLK_ID1: TDBEdit;
    dbedtTLK_ID2: TDBEdit;
    dbedtTLK_ID3: TDBEdit;
    dbedtTLK_ID4: TDBEdit;
    dbedtTLK_ID5: TDBEdit;
    dbedtTLK_ID6: TDBEdit;
    dbedtTLK_ID7: TDBEdit;
    dbedtTLK_ID8: TDBEdit;
    dbedtTLK_ID9: TDBEdit;
    dbedtTLK_ID11: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    dbmmoPelabuhan: TDBMemo;
    dbmmoKeterangan: TDBMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeluk: TfrmTeluk;

implementation

{$R *.dfm}

procedure TfrmTeluk.FormShow(Sender: TObject);
begin
  ztblTeluk.Active := True;
end;

end.
