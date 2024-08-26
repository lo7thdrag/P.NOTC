unit uBeach;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPelabuhan, DB, ZAbstractRODataset, ZAbstractDataset, ZAbstractTable,
  ZDataset, Grids, DBGrids, RzDBGrid, ExtCtrls, DBCtrls, StdCtrls, Mask, uDataModuleTTT;

type
  TfrmBeach = class(TForm)
    rzdbgrd1: TRzDBGrid;
    dsPantai: TDataSource;
    ztblPantai: TZTable;
    dbnvgr1: TDBNavigator;
    dbedtKODE_PELABUHAN5: TDBEdit;
    dbedtPNT_ID: TDBEdit;
    dbedtPNT_ID1: TDBEdit;
    dbedtPNT_ID2: TDBEdit;
    dbedtPNT_ID3: TDBEdit;
    dbedtPNT_ID4: TDBEdit;
    dbedtPNT_ID5: TDBEdit;
    dbedtPNT_ID6: TDBEdit;
    dbedtPNT_ID7: TDBEdit;
    dbedtPNT_ID8: TDBEdit;
    dbedtPNT_ID9: TDBEdit;
    dbedtPNT_ID10: TDBEdit;
    dbedtPNT_ID11: TDBEdit;
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
    dbmmo1: TDBMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBeach: TfrmBeach;

implementation

{$R *.dfm}

procedure TfrmBeach.FormShow(Sender: TObject);
begin
  ztblPantai.Active := True;
end;

end.
