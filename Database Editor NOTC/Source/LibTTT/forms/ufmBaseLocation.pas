unit ufmBaseLocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDataModuleTTT, uDBAsset_Base,
  uBaseCoordSystem;

type
  TfmBaseLocation = class(TForm)
    lbBaseLocation: TListBox;
    shp1: TShape;
    btnRemove: TButton;
    btnEdit: TButton;
    btnPick: TButton;
    btnCancel: TButton;
    lbBaseID: TListBox;
    btnNew: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GetBaseList;
    procedure ReListBase;
    procedure btnPickClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lbBaseLocationClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    FTrackSel : Integer;
  public
    { Public declarations }
    BaseLocationList : TList;
    Base_Location : TBase_Location;
    IdxSel : Integer;
  end;

var
  fmBaseLocation: TfmBaseLocation;

implementation

uses
  ufrmBaseResourceAllocationPickList, ufmEmbarkPositionInput;

{$R *.dfm}

procedure TfmBaseLocation.btnCancelClick(Sender: TObject);
begin
  Close;
  frmBaseResourceAllocationPickList.Show;
end;

procedure TfmBaseLocation.btnEditClick(Sender: TObject);
begin
  if lbBaseLocation.ItemIndex <> -1 then
  begin
    Close;
    with fmEmbarkPositionInput do
    begin
      OpenBy := 0;
      IdAction := 1;

      edtBaseLocation.Text := lbBaseLocation.Items[lbBaseLocation.ItemIndex];
      edtPosLat.Text := formatDMS_latt(TBase_Location(BaseLocationList[IdxSel]).FData.Latitude);
      edtPosLong.Text := formatDMS_long(TBase_Location(BaseLocationList[IdxSel]).FDAta.Longitude);

      Show;
    end;
  end;
end;

procedure TfmBaseLocation.btnNewClick(Sender: TObject);
begin
  Close;

  with fmEmbarkPositionInput do
  begin
    OpenBy := 0;
    IdAction := 0;

    edtBaseLocation.Text := 'New';
    edtPosLat.Text := formatDMS_latt(0);
    edtPosLong.Text := formatDMS_long(0);

    Show;
  end;
end;

procedure TfmBaseLocation.btnPickClick(Sender: TObject);
begin
  if lbBaseLocation.ItemIndex <> -1 then
  begin
    Close;
    with fmEmbarkPositionInput do
    begin
      OpenBy := 1;
      Show;
    end;
  end;

//  with fmEmbarkLibraryPickList do
//  begin
//    FillBaseSelectedList;
//    Show;
//  end;
end;

procedure TfmBaseLocation.btnRemoveClick(Sender: TObject);
var
  warning : Integer;
begin
  if lbBaseLocation.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item ?',
      mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      dmTTT.DeleteBase_Location(lbBaseID.Items[lbBaseLocation.ItemIndex]);
      GetBaseList;
    end;
  end;
end;

procedure TfmBaseLocation.FormCreate(Sender: TObject);
begin
  BaseLocationList := TList.Create;
  Base_Location := TBase_Location.Create;
end;

procedure TfmBaseLocation.FormDestroy(Sender: TObject);
begin
  BaseLocationList.Free;
  Base_Location.Free;
end;

procedure TfmBaseLocation.FormShow(Sender: TObject);
begin
  GetBaseList;
end;

procedure TfmBaseLocation.GetBaseList;
begin
  BaseLocationList.Clear;

  dmTTT.GetBase_Location(0,BaseLocationList,Base_Location);
  ReListBase;
end;

procedure TfmBaseLocation.lbBaseLocationClick(Sender: TObject);
var
  i : Integer;
begin
  FTrackSel := StrToInt(lbBaseID.Items[lbBaseLocation.ItemIndex]);
  for i := 0 to BaseLocationList.Count - 1 do
  begin
    if FTrackSel = TBase_Location(BaseLocationList.Items[i]).FDAta.Base_Index then
    begin
      IdxSel := i;
    end;
  end;

  with fmEmbarkPositionInput do
  begin
    LastName := TBase_Location(BaseLocationList.Items[IdxSel]).FDAta.Base_Identifier;
    edtPosLat.Text := formatDMS_latt(TBase_Location(BaseLocationList[IdxSel]).FData.Latitude);
    edtPosLong.Text := formatDMS_long(TBase_Location(BaseLocationList[IdxSel]).FDAta.Longitude);
  end;
end;

procedure TfmBaseLocation.ReListBase;
var
  i : Integer;
begin
  lbBaseLocation.Items.Clear;
  lbBaseID.Items.Clear;

  for i := 0 to BaseLocationList.Count - 1 do
  begin
   lbBaseLocation.Items.Add(TBase_Location(BaseLocationList[i]).FDAta.
    Base_Identifier);
   lbBaseID.Items.Add(IntToStr(TBase_Location(BaseLocationList[i]).FDAta.
    Base_Index));
  end;

end;

end.
