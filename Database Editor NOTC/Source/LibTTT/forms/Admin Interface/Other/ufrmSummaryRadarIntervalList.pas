unit ufrmSummaryRadarIntervalList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT, uRadarIntervalDouble;

type
  TfrmSummaryRadarIntervalList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtName: TEdit;
    btnEditList: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnEditListClick(Sender: TObject);
    procedure getdata;


  private
    { Private declarations }
  public
    { Public declarations }
    radar_interval : TRadar_Interval_List;
    isNew   : Boolean;
//    radar_def : TRadar_Interval_Definition;
    id_radar : integer;
  end;

var
  frmSummaryRadarIntervalList: TfrmSummaryRadarIntervalList;
  mList       : TList;

implementation

uses
  uDataModuleTTT, uRadarIntervalSetup;

{$R *.dfm}

procedure TfrmSummaryRadarIntervalList.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    radar_interval := TRadar_Interval_List.Create;
    radar_interval.FData.Interval_List_Identifier := edtName.Text;
    dmTTT.InsertRadar_Interval_List(radar_interval);
    getdata;
    btnEditList.Enabled := true;
    isNew := false;
  end
  else
  begin
    radar_interval.FData.Interval_List_Identifier := edtName.Text;
    dmTTT.UpdateRadar_Interval_List(radar_interval.FData.Interval_List_Index,radar_interval);
  end;

 { if fRadarIntervalSelect.isNew then
  begin
    radar_interval.FData.Interval_List_Identifier := edtName.Text;
    dmTTT.InsertRadar_Interval_List(radar_interval);
    getdata;
    btnEditList.Enabled := true;
    fRadarIntervalSelect.isNew := false;
  end
  else
  begin
    radar_interval.FData.Interval_List_Identifier := edtName.Text;
    dmTTT.UpdateRadar_Interval_List(radar_interval.FData.Interval_List_Index,radar_interval);
  end;  }
end;

procedure TfrmSummaryRadarIntervalList.btnCancelClick(Sender: TObject);
begin
  Close;
  btnEditList.Enabled := false;
end;

procedure TfrmSummaryRadarIntervalList.btnEditListClick(Sender: TObject);
begin
  id_radar := radar_interval.FData.Interval_List_Index;
  fRadarIntervalSetup.ShowModal;
end;

procedure TfrmSummaryRadarIntervalList.btnOKClick(Sender: TObject);
begin
   btnApplyClick(Sender);
//   fOtherSingle.refresh;
   Close;
end;

procedure TfrmSummaryRadarIntervalList.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfrmSummaryRadarIntervalList.getdata;
var  I : Integer;
     vList: TList;
     PLrec: TRadar_Interval_List;
begin
  vList := TList.Create;
  dmTTT.getAllRadar_On_Board(id_radar,I,vList);
  for I := 0 to vList.Count - 1 do
  begin
    PLrec := TRadar_Interval_List.Create;
    PLrec := TRadar_Interval_List(vList[I]);
    PLrec.FData.Interval_List_Index := radar_interval.FData.Interval_List_Index;
    dmTTT.InsertRadar_Interval_List(PLrec);
  end;
end;

end.
