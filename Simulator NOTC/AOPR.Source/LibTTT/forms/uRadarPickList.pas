unit uRadarPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSimDBEditor;

type
  TfRadarPickList = class(TForm)
    lbRadars: TListBox;
    btnNew: TButton;
    btnEdit: TButton;
    lbIdRadars: TListBox;
    btClose: TButton;
    btCopy: TButton;
    btFilter: TButton;
    btRemove: TButton;
    btUsage: TButton;
    lbTempidRadars: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataRadar;
  public
    { Public declarations }
    rList: Tlist;
    procedure refresh;
  end;

var
  fRadarPickList: TfRadarPickList;
  pList : TList;


implementation

uses UDBAsset_Radar,uRadarSummary, uDataModuleTTT;

{$R *.dfm}

procedure TfRadarPickList.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfRadarPickList.btCopyClick(Sender: TObject);
begin
  fRadarSummary.isCopy  := True;
  getDataRadar;
end;

procedure TfRadarPickList.btnEditClick(Sender: TObject);
begin
  fRadarSummary.isCopy  := False;
  getDataRadar;
end;

procedure TfRadarPickList.getDataRadar;
begin
  if lbRadars.Selected[lbRadars.ItemIndex] then
      fRadarSummary.radarobject := pList[lbRadars.ItemIndex];
  fRadarSummary.isNew := false;
  fRadarSummary.Show;
end;


procedure TfRadarPickList.btnNewClick(Sender: TObject);
begin
 fRadarSummary.isNew := true;
 fRadarSummary.Show;
end;

procedure TfRadarPickList.btRemoveClick(Sender: TObject);
begin
  if lbRadars.Selected[lbRadars.ItemIndex] then
  begin
    dmTTT.DeleteRadar_Definition(lbTempidRadars.Items.Strings[lbRadars.ItemIndex]);
  end;
  refresh;
end;

procedure TfRadarPickList.FormCreate(Sender: TObject);
begin
 pList := Tlist.Create;
 rList := Tlist.Create;
end;

procedure TfRadarPickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfRadarPickList.refresh;
var i : integer;
begin

 uSimDBEditor.getAllRadar_Definition(plist);

 lbRadars.Items.Clear;
 lbTempidRadars.Items.Clear;
 lbTempIdRadars.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbRadars.Items.Add(TRadar_On_Board(pList[i]).FDef.Radar_Identifier);
  lbTempidRadars.Items.Add(IntToStr(TRadar_On_Board(pList[i]).FDef.Radar_Index));
 end;

end;
end.
