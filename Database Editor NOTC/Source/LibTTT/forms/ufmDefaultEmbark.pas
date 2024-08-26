unit ufmDefaultEmbark;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, uDBAsset_Vehicle, uBrigadePersonel,
  uDBAsset_Base, uDataModuleTTT;

type
  TfrmDefaultEmbark = class(TForm)
    shp1: TShape;
    lbl17: TLabel;
    lbl18: TLabel;
    btnAdd: TButton;
    btnRemove: TButton;
    btnOk: TButton;
    btnClose: TButton;
    btnEditTrack: TButton;
    btnUsage: TButton;
    chkAmphibi: TCheckBox;
    lstVehicleAvailableID: TListBox;
    lstAirPlatformSelectedID: TListBox;
    lvAirPlatformSelected: TListView;
    chkAir: TCheckBox;
    chkLand: TCheckBox;
    tvPersonel: TTreeView;
    rgTypeList: TRadioGroup;
    pnlPersonelList: TPanel;
    lbl19: TLabel;
    lstPersonelAvailable: TListBox;
    pnlVehicleList: TPanel;
    lbl20: TLabel;
    lstVehicleAvailable: TListBox;
    lstPersonelAvailableID: TListBox;
    lvAmphibiousLandSelected: TListView;
    lbl16: TLabel;
    lstAmphibiousLandSelectedID: TListBox;
    tvPersonelAvailable: TTreeView;
    procedure RefreshList;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditTrackClick(Sender:TObject);
    procedure lbEmbarkPlatformSelectedClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rgTypeListClick(Sender: TObject);
    procedure tvPersonelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function getInput(s: string): Boolean;
    procedure lstVehicleAvailableDblClick(Sender: TObject);
    procedure lvAirPlatformSelectedSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure lvAmphibiousLandSelectedSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);

  private
    { Private declarations }
    FTrackSel, FidxSel, IdxPersonSel : Integer;
  public
    { Public declarations }
    idAction : Byte; {1=new, 2=edit, 3=delete, 4=copy}
    allPlatformList : TList;
    allPersonelList : TList;
    PlatformSelectedList : TList;
    PersonelSelectedList : TList;
    vList, BrigList, BatalyonList, KompiList, PlatoonList, GroupList : TList;

    hoverNode : TTreeNode;
//    vehicle : TVehicle_Definition;
//    Personel : TPoersonel;
    LastName : string;
    SelId : Integer;

    isVehicle : Boolean;

    function CekInput: Boolean;
    procedure Filter;
  end;

var
  frmDefaultEmbark: TfrmDefaultEmbark;

implementation

uses
  ufmEmbarkTrackIDInput;

{$R *.dfm}

{ TfrmDefaultEmbark }

procedure TfrmDefaultEmbark.btnAddClick(Sender: TObject);
var
  vehicleSelected : TDefaultEmbark;
  personelSelected : TPersonel;
begin
  {vehicle}
  if rgTypeList.ItemIndex = 0 then
  begin
    if lstVehicleAvailable.ItemIndex <> -1 then
    begin
      fmEmbarkTrackIDInput.IsClose := True;
      fmEmbarkTrackIDInput.edtTrackID.Text := 'NULL';
      fmEmbarkTrackIDInput.ShowModal;

      if not fmEmbarkTrackIDInput.IsClose then
      begin
        vehicleSelected := TDefaultEmbark.Create;
        vehicleSelected.FData.Vehicle_Index := StrToInt(lstVehicleAvailableID.
          Items[lstVehicleAvailable.ItemIndex]);
        vehicleSelected.FData.Vehicle_Identifier := lstVehicleAvailable.
          Items[lstVehicleAvailable.ItemIndex];
        vehicleSelected.FData.Vehicle_Domain := dmTTT.GetDomainFromVehicleID(
          StrToInt(lstVehicleAvailableID.Items[lstVehicleAvailable.ItemIndex]));
        vehicleSelected.FData.Track_ID := fmEmbarkTrackIDInput.edtTrackID.Text;

        PlatformSelectedList.Add(vehicleSelected);

        RefreshList;
      end;
    end;
  end
  else
  begin     {Personel}
    if lstPersonelAvailable.ItemIndex <> -1 then

  end;
end;

procedure TfrmDefaultEmbark.btnCloseClick(Sender: TObject);
begin
//
end;

procedure TfrmDefaultEmbark.btnEditTrackClick(Sender: TObject);
begin
//
end;

procedure TfrmDefaultEmbark.btnOkClick(Sender: TObject);
begin
//  fmEmbarkTrackIDInput.ShowModal;
end;

procedure TfrmDefaultEmbark.btnRemoveClick(Sender: TObject);
begin
//
end;

function TfrmDefaultEmbark.CekInput: Boolean;
begin
//
end;

procedure TfrmDefaultEmbark.Filter;
//var
//  udara, amfib, darat : Integer;
begin
//  udara := -1;
//  amfib := -1;
//  darat := -1;
  if chkAmphibi.Checked then
  begin
//    amfib:= 4;
  end;
  if chkAir.Checked = True then
  begin
//    udara := 0;
  end;
  if chkLand.Checked = True then
  begin
//    darat := 3;
  end;
  allPlatformList.Clear;
  allPersonelList.Clear;
  dmTTT.GetCarriable_Vehicle(0,allPlatformList);
  dmTTT.GetAll_Brigade(allPersonelList);
  RefreshList;
end;

procedure TfrmDefaultEmbark.FormCreate(Sender: TObject);
begin
//  vehicle
  allPlatformList := TList.Create;
  allPersonelList := TList.Create;
  PlatformSelectedList := TList.Create;
  PersonelSelectedList := TList.Create;

  BrigList := TList.Create;
  BatalyonList := TList.Create;
  KompiList := TList.Create;
  PlatoonList := TList.Create;
  GroupList := TList.Create;
end;

procedure TfrmDefaultEmbark.FormDestroy(Sender: TObject);
begin
  allPlatformList.Free;
  allPersonelList.Free;
  PlatformSelectedList.Free;
  PersonelSelectedList.Free;

  BrigList.Free;
  BatalyonList.Free;
  KompiList.Free;
  PlatoonList.Free;
  GroupList.Free;
end;

procedure TfrmDefaultEmbark.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TfrmDefaultEmbark.FormShow(Sender: TObject);
begin
  btnUsage.Enabled := False;
  btnUsage.Visible := False;
  btnRemove.Enabled := False;
  btnEditTrack.Enabled := False;
  btnEditTrack.Visible := False;

  Filter;
end;

function TfrmDefaultEmbark.getInput(s: string): Boolean;
begin
//
end;

procedure TfrmDefaultEmbark.lbEmbarkPlatformSelectedClick(Sender: TObject);
begin
//
end;

procedure TfrmDefaultEmbark.lstVehicleAvailableDblClick(Sender: TObject);
begin
//  btnAdd.Click;
end;

procedure TfrmDefaultEmbark.lvAmphibiousLandSelectedSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  i : Integer;
begin
  if Selected then
  begin
    btnRemove.Enabled := True;

    FTrackSel := StrToInt(lstAmphibiousLandSelectedID.
      Items[lvAmphibiousLandSelected.ItemIndex]);
    for i := 0 to PlatformSelectedList.Count - 1 do
    begin
      if FTrackSel = TDefaultEmbark(PlatformSelectedList[i]).FData.
        Vehicle_Index then
      begin
        FidxSel := i;
      end;
    end;
  end
  else
    btnRemove.Enabled := False;
end;

procedure TfrmDefaultEmbark.lvAirPlatformSelectedSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  i : Integer;
begin
  if Selected then
  begin
    btnRemove.Enabled := True;

    FTrackSel := StrToInt(lstAirPlatformSelectedID.
      Items[lvAirPlatformSelected.ItemIndex]);
    for i := 0 to PlatformSelectedList.Count - 1 do
    begin
      if FTrackSel = TDefaultEmbark(PlatformSelectedList[i]).FData.
        Vehicle_Index then
      begin
        FidxSel := i;
      end;
    end;
  end
  else
    btnRemove.Enabled := False;
end;

procedure TfrmDefaultEmbark.RefreshList;
var
  i, j, a, b, c, d,
  IdVehicleAvailable, IdVehicleSelected,
  IdPersonelAvailable, IdPersonelSelected  : Integer;
  IsPrintInAvailable : Boolean;

  SelList : TListItem;

  Brigade, Batalyon, Kompi, Platoon, Group: TTreeNode;
  ObjPersonel : TPersonel;
  ObjBrigade  : TBrigade;
  ObjBatalyon : TBatalyon;
  ObjKompi    : TKompi;
  ObjPlatoon  : TPlatoon;
  ObjGroup    : TGroup;
begin
  lstVehicleAvailable.Items.Clear;
  lstVehicleAvailableID.Items.Clear;
  lvAirPlatformSelected.Items.Clear;
  lvAmphibiousLandSelected.Items.Clear;
  lstAirPlatformSelectedID.Items.Clear;
  lstAmphibiousLandSelectedID.Items.Clear;

  lstPersonelAvailable.Items.Clear;
  lstPersonelAvailableID.Items.Clear;

  tvPersonel.Items.Clear;

  {menampilkan daftar vehicle yang dipilih(sebelah kanan)}
  for i := 0 to PlatformSelectedList.Count - 1 do
  begin
    IdVehicleSelected := TDefaultEmbark(PlatformSelectedList[i]).
      FData.Vehicle_Index;
    for j := 0 to allPlatformList.Count - 1 do
    begin
      IdVehicleAvailable := TVehicle_Definition(allPlatformList[j]).FData.
        Vehicle_Index;
      if IdVehicleSelected = IdVehicleAvailable then
      begin
        {cek domainnya; 0: Air, 3: Land, 4: Amphibious}
        if TDefaultEmbark(PlatformSelectedList[i]).FData.Vehicle_Domain
          = 0 then
        begin
          SelList := lvAirPlatformSelected.Items.Add;
          SelList.Caption := TVehicle_Definition(
            allPlatformList[j]).FData.Vehicle_Identifier;
          SelList.SubItems.Add(TDefaultEmbark(
            PlatformSelectedList[i]).FData.Track_ID);
          lstAirPlatformSelectedID.Items.Add(IntToStr(TDefaultEmbark(
            PlatformSelectedList[i]).FData.Vehicle_Index));
        end
        else
        begin
          SelList := lvAmphibiousLandSelected.Items.Add;
          SelList.Caption := TVehicle_Definition(
            allPlatformList[j]).FData.Vehicle_Identifier;
          SelList.SubItems.Add(TDefaultEmbark(
            PlatformSelectedList[i]).FData.Track_ID);
          lstAmphibiousLandSelectedID.Items.Add(IntToStr(TDefaultEmbark(
            PlatformSelectedList[i]).FData.Vehicle_Index));
        end;
      end;
    end;
  end;

  {menampilkan daftar personel yang dipilih(sebelah kanan)}
  for i := 0 to PersonelSelectedList.Count - 1 do
  begin
    IdPersonelSelected := TPersonel(PersonelSelectedList[i]).Id;
    for j := 0 to allPersonelList.Count - 1 do
    begin
      IdPersonelAvailable := TPersonel(allPersonelList[i]).Id;
      if IdPersonelSelected = IdPersonelAvailable then
      begin
        ObjBrigade  := TBrigade.Create;
        ObjBatalyon := TBatalyon.Create;
        ObjKompi    := TKompi.Create;
        ObjPlatoon  := TPlatoon.Create;
        ObjGroup    := TGroup.Create;

        ObjBrigade := TBrigade(allPersonelList[j]);
        Brigade := tvPersonel.Items.Add(nil, TPersonel(ObjBrigade).Identifier);
        {Load brigade, mendapat nilai balik list batalyon}
        dmTTT.GetBatalyon(IdPersonelAvailable, BatalyonList);
        for a := 0 to BatalyonList.Count - 1 do
        begin
          ObjBatalyon := BatalyonList.Items[a];
          Batalyon := tvPersonel.Items.AddChild(Brigade, TPersonel(ObjBatalyon).Identifier);

          {Load batalyon, mendapat nilai balik list kompi}
          dmTTT.GetKompi(TPersonel(ObjBatalyon).Id, KompiList);
          for b := 0 to KompiList.Count - 1 do
          begin
            ObjKompi := KompiList.Items[b];
            Kompi := tvPersonel.Items.AddChild(Batalyon, TPersonel(ObjKompi).Identifier);

            {Load kompi, mendapat nilai balik list platoon}
            dmTTT.GetPlatoon(TPersonel(ObjKompi).Id, PlatoonList);
            for c := 0 to PlatoonList.Count - 1 do
            begin
              ObjPlatoon := PlatoonList.Items[c];
              Platoon := tvPersonel.Items.AddChild(Kompi, TPersonel(ObjPlatoon).Identifier);

              {Load Platoon, mendapat nilai balik list group}
              dmTTT.GetGroup(TPersonel(ObjPlatoon).Id, GroupList);
              for d := 0 to GroupList.Count - 1 do
              begin
                ObjGroup := GroupList.Items[d];

                Group := tvPersonel.Items.AddChildFirst(Platoon, IntToStr(ObjGroup.quantity));
                tvPersonel.Items.AddChildFirst(Group, IntToStr(ObjGroup.quantity));
              end;
            end;
          end;
        end;
      end;
    end;
  end;

  {Menampilkan semua vehicle(sebelah kiri)}
  for i := 0 to allPlatformList.Count - 1 do
  begin
    lstVehicleAvailable.Items.Add(TVehicle_Definition(allPlatformList[i]).
      FData.Vehicle_Identifier);
    lstVehicleAvailableID.Items.Add(IntToStr(TVehicle_Definition
      (allPlatformList[i]).FData.Vehicle_Index));
  end;

  {Menampilkan semua daftar personel(sebelah kiri)}
  for i := 0 to allPersonelList.Count - 1 do
  begin
    IdPersonelAvailable := TPersonel(allPersonelList[i]).Id;
    IsPrintInAvailable := True;

    for j := 0 to PersonelSelectedList.Count - 1 do
    begin
      IdPersonelSelected := TPersonel(PersonelSelectedList[j]).Id;

      if IdPersonelAvailable = IdPersonelSelected then
      begin
        IsPrintInAvailable := False;
        Break;
      end;
    end;
    if IsPrintInAvailable then
    begin
      tvPersonelAvailable.Items.Add(Brigade.Parent,TPersonel(allPersonelList[i]).Identifier);
      lstPersonelAvailableID.Items.Add(IntToStr(TPersonel(allPersonelList[i]).Id));
    end;
  end;
end;

procedure TfrmDefaultEmbark.rgTypeListClick(Sender: TObject);
begin
  if rgTypeList.ItemIndex = 0 then
  begin
    pnlVehicleList.BringToFront;
  end
  else
  begin
    pnlPersonelList.BringToFront;
  end;
end;

procedure TfrmDefaultEmbark.tvPersonelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i : Integer;
begin
  btnUsage.Enabled := False;
  btnRemove.Enabled := False;
  btnEditTrack.Enabled := False;

  if tvPersonel.Selected = nil then
    Exit;

  hoverNode := tvPersonel.GetNodeAt(X, Y);

  if not Assigned (hoverNode) then
    Exit;

  if hoverNode.Level <> 0 then
    Exit;

  btnRemove.Enabled := True;
  isVehicle := False;

  for i := 0 to PersonelSelectedList.Count - 1 do
  begin
    if hoverNode.Text = TPersonel(PersonelSelectedList.Items[i]).Identifier then
      IdxPersonSel := i;
  end;

end;

end.
