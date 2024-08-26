unit ufrmGroupPersonel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, StdCtrls, ExtCtrls, Menus, Buttons, uBrigadePersonel,
  uDataModuleTTT, ufmPersonelQuantityInput;

type
  TfmGroupPersonel = class(TForm)
    pmEmbarked: TPopupMenu;
    Rename: TMenuItem;
    Delete: TMenuItem;
    grpCreateBrigade: TGroupBox;
    lbl4: TLabel;
    edtNameBrigade: TEdit;
    lvBrigade: TListView;
    Label5: TLabel;
    edtNameBatalyon: TEdit;
    btnCreate: TButton;
    btnOk: TSpeedButton;
    btnCancel: TSpeedButton;
    tvPersonel: TTreeView;
    Add: TMenuItem;
    Quantity: TMenuItem;
    lbl1: TLabel;
    lbllstupdatedP: TLabel;
    btNew: TButton;
    btCopy: TButton;
    btEdit: TButton;
    btRemove: TButton;
    btClose: TButton;
    btUsage: TButton;
    procedure btnCreateClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure DeleteClick(Sender: TObject);
    procedure RenameClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnHandle(Sender: TObject);
    procedure lvBrigadeSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure tvPersonelEdited(Sender: TObject; Node: TTreeNode; var S: string);
    procedure tvPersonelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure AddClick(Sender: TObject);
    procedure QuantityClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    procedure btnNewClick(Sender: TObject);
    function CreateGroup(grp : TTreeNode): TGroup;

  public
    hoverNode: TTreeNode;
    OBrigade  : TBrigade;
    OBatalyon : TBatalyon;
    OKompi    : TKompi;
    OPlatoon  : TPlatoon;
    OGroup    : TGroup;
    BrigList, BatalyonList, KompiList, PlatoonList, GroupList : TList;
    IdxBrigade: Integer;
    LastName : string;
    IdAction : Byte; {1: add; 2: Edit; 3: Delete; 4: Copy}

    function CekInput: Boolean;

    procedure SaveToDbase;
    procedure SaveData;
    procedure ClearData;
    procedure DeleteData;
    procedure LoadData;
    procedure RefreshlvBrigade;
    procedure DeleteBrigadeName;
  end;

var
  fmGroupPersonel: TfmGroupPersonel;

implementation

{$R *.dfm}

procedure TfmGroupPersonel.AddClick(Sender: TObject);
var
  ChildNode : TTreeNode;
  LevelGroup : string;
begin
  case hoverNode.Level of
    0 : LevelGroup := 'Kompi ';
    1 : LevelGroup := 'Platoon ';
    2 : LevelGroup := 'Group ';
  end;

  ChildNode := tvPersonel.Items.AddChild(hoverNode, LevelGroup + IntToStr(hoverNode.Count + 1));

  if hoverNode.Level = 2 then
    tvPersonel.Items.AddChildFirst(ChildNode, IntToStr(10));
end;

procedure TfmGroupPersonel.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGroupPersonel.btnHandle(Sender: TObject);
begin
  case TButton(Sender).Tag of
    0: {New}
    begin
      IdAction := 1;
      lbllstupdatedP.Caption := '';
      ClearData;
    end;
    1: {Edit}
    begin
      if lvBrigade.Selected = nil then
      begin
        ShowMessage('Select Personel List first');
        Exit;
      end;

      IdAction := 2;
      LoadData;
    end;
    2: {Delete}
    begin
      if lvBrigade.Selected = nil then
      begin
        ShowMessage('Select Personel List first');
        Exit;
      end;

      IdAction := 3;
      DeleteBrigadeName;
      DeleteData;
    end;
    3: {Close}
    begin
      Close
    end;
    4: {OK}
    begin
      if IdAction = 2 then
      begin
        DeleteData;
      end;

      SaveData;
      btNew.Visible := True;
      btCopy.Visible := True;
      btEdit.Visible := True;
      btRemove.Visible := True;
      btUsage.Visible := True;
      btClose.Visible := True;
    end;
    5: {Cancel}
    begin
      grpCreateBrigade.Left := 400;
      btNew.Visible := True;
      btCopy.Visible := True;
      btEdit.Visible := True;
      btRemove.Visible := True;
      btUsage.Visible := True;
      btClose.Visible := True;
    end;
  end;
end;

procedure TfmGroupPersonel.btnNewClick(Sender: TObject);
begin

end;

function TfmGroupPersonel.CekInput: Boolean;
var
  i : Integer;
  isAda : Boolean;
  li : TListItem;

begin
  isAda := False;
  Result := False;

  if edtNameBrigade.Text = '' then
  begin
    ShowMessage('Please insert brigade name');
    Exit;
  end;

  for i := 0 to lvBrigade.Items.Count - 1 do
  begin
    li := lvBrigade.Items[i];
    if li.SubItems[0] =  edtNameBrigade.Text then
    begin
      isAda := True;
      Break;
    end;
  end;

  if isAda and (IdAction <> 2) then
  begin
    ShowMessage('Please use another name');
    Exit;
  end;

  if (IdAction = 2) and (LastName <> edtNameBrigade.Text)then
  begin
    if isAda then
    begin
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfmGroupPersonel.ClearData;
begin
  edtNameBrigade.Text := '';
  edtNameBatalyon.Text := '';
  tvPersonel.Items.Clear;
  grpCreateBrigade.Left := 6;

  btNew.Visible := False;
  btCopy.Visible := False;
  btEdit.Visible := False;
  btRemove.Visible := False;
  btUsage.Visible := False;
  btClose.Visible := False;

end;

function TfmGroupPersonel.CreateGroup(grp: TTreeNode):TGroup;
var
  OGrp : TGroup;
begin
  Result := nil;

  OGrp := TGroup.Create;
  OGrp.Identifier := grp.Text;
  OGrp.Id := 2;
  OGrp.quantity := StrToInt(TTreeNode(grp.getFirstChild).Text);

  Result := OGrp;
end;

procedure TfmGroupPersonel.btnCreateClick(Sender: TObject);
var
  i, j, k : Integer;
  Batalyon, Kompi, Platoon, Group: TTreeNode;
begin
  Batalyon := tvPersonel.Items.Add(nil, edtNameBatalyon.Text);
  for i := 0 to 2 do
  begin
    Kompi := tvPersonel.Items.AddChild(Batalyon, 'Kompi ' + IntToStr(i+1));
    for j := 0 to 2 do
    begin
      Platoon := tvPersonel.Items.AddChild( Kompi, 'Platoon ' + IntToStr(j+1));
      for k := 0 to 2 do
      begin
        Group := tvPersonel.Items.AddChild( Platoon, 'Group ' + IntToStr(k+1));
        tvPersonel.Items.AddChildFirst(Group, IntToStr(10));
      end;
    end;
  end;
end;

procedure TfmGroupPersonel.SaveToDbase;
var
  i, j, k, l, m : Integer;
  IdBrigade,IdBatalyon,IdKompi,IdPlatoon,IdGroup : Integer;
  Batalyon, Kompi, Platoon, Group: TTreeNode;
begin
  {insert brigade disini, mendapat nilai balik index brigade}
  if IdAction = 1 then
    IdBrigade := dmTTT.InsertPersonel_All(Tpersonel(OBrigade), 0, 0)
  else
  begin
    IdBrigade := IdxBrigade;
    dmTTT.UpdatePersonel_Brigade(IdBrigade, Tpersonel(OBrigade));
  end;


  for i := 0 to OBrigade.BatalyonList.Count-1 do
  begin
    OBatalyon := nil;
    OBatalyon := OBrigade.BatalyonList.Items[i];
    {insert batalyon disini, mendapat nilai balik index batalyon}

    IdBatalyon := dmTTT.InsertPersonel_All(Tpersonel(OBatalyon), 1, IdBrigade);
    for j := 0 to OBatalyon.KompiList.Count-1 do
    begin
      OKompi := nil;
      OKompi := OBatalyon.KompiList.Items[j];
      OKompi.IdBrigade := IdBrigade;
      {insert Kompi disini, mendapat nilai balik index kompi}

      IdKompi := dmTTT.InsertPersonel_All(Tpersonel(OKompi), 2, IdBatalyon);
      for k := 0 to OKompi.PlatoonList.Count-1 do
      begin
        OPlatoon := nil;
        OPlatoon := OKompi.PlatoonList.Items[k];
        OPlatoon.IdBrigade := IdBrigade;
        {insert Platoon disini, mendapat nilai balik index Platoon}

        IdPlatoon := dmTTT.InsertPersonel_All(Tpersonel(OPlatoon), 3, IdKompi);
        for l := 0 to OPlatoon.GroupList.Count-1 do
        begin
          OGroup := nil;
          OGroup := OPlatoon.GroupList.Items[l];
          OGroup.IdBrigade := IdBrigade;
          OGroup.IdBatalyon := IdBatalyon;
          OGroup.IdKompi := IdKompi;
          OGroup.IdPlatoon := IdPlatoon;

          {insert Group disini}
          IdGroup := dmTTT.InsertPersonel_All(Tpersonel(OGroup), 4, IdPlatoon);
        end;
      end;
    end;
  end;
end;

procedure TfmGroupPersonel.RefreshlvBrigade;
var
  i : Integer;
begin
  lvBrigade.Clear;

  dmTTT.GetAll_Brigade(BrigList);

  for i := 0 to BrigList.Count - 1 do
  begin
    with lvBrigade.Items.Add do
    begin
      Caption := IntToStr(i + 1);
      SubItems.Add(TPersonel(BrigList[i]).Identifier);
      SubItems.Add(IntToStr(TPersonel(BrigList[i]).Id));
    end;
  end;
//  btnEdit.Enabled := False;
//  btnDelete.Enabled := False;
end;

procedure TfmGroupPersonel.RenameClick(Sender: TObject);
begin
  tvPersonel.ReadOnly := false;
  tvPersonel.Selected.Focused := true;
  tvPersonel.Selected.EditText;
end;

procedure TfmGroupPersonel.SaveData;
var
  Batalyon, Kompi, Platoon, Group: TTreeNode;

begin
  if not CekInput then
    Exit;


  if tvPersonel.Items.Count < 1 then
    Exit;

  OBrigade  := TBrigade.Create;
  OBrigade.Identifier := edtNameBrigade.Text;
  OBrigade.Id := IdxBrigade;

  Batalyon := tvPersonel.Items.Item[0];
  repeat
    if Batalyon.HasChildren then
    begin
      OBatalyon := TBatalyon.Create;
      OBatalyon.Id := 0;
      OBatalyon.Identifier := Batalyon.Text;

      {Kompi -----------------------------------}
      Kompi := Batalyon.GetNext;
      repeat
        if Kompi.HasChildren then
        begin
          OKompi    := TKompi.Create;
          OKompi.Id := 0;
          OKompi.Identifier := Kompi.Text;

          {Platoon -------------------}
          Platoon := Kompi.GetNext;
          repeat
            if Platoon.HasChildren then
            begin
              OPlatoon  := TPlatoon.Create;
              OPlatoon.Id := 1;
              OPlatoon.Identifier := Platoon.Text;

              {Create Group ----------}
              Group := Platoon.GetNext;
              repeat
                OPlatoon.GroupList.Add(CreateGroup(Group));
                Group := Group.GetNextSibling;
              until
                Group = nil;

              OKompi.PlatoonList.Add(OPlatoon);
            end;
            Platoon := Platoon.GetNextSibling;
          until
            Platoon = nil;

          if OKompi.PlatoonList.Count > 0 then
            OBatalyon.KompiList.Add(OKompi);
        end;
        Kompi := Kompi.GetNextSibling;
      until
        Kompi = nil;

      if OBatalyon.KompiList.Count > 0 then
        OBrigade.BatalyonList.Add(OBatalyon);
    end;

    Batalyon := Batalyon.GetNextSibling;
  until
    Batalyon = nil;

  SaveToDbase;
  grpCreateBrigade.Left := 400;
  RefreshlvBrigade;
end;

procedure TfmGroupPersonel.tvPersonelEdited(Sender: TObject; Node: TTreeNode;
  var S: string);
begin
  tvPersonel.ReadOnly := True;
end;

procedure TfmGroupPersonel.tvPersonelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  pos: TPoint;
begin
  if tvPersonel.Selected = nil then
    Exit;

  GetCursorPos(pos);
  if Button = mbRight then
  begin
    hoverNode:= tvPersonel.GetNodeAt(X, Y);

    if not Assigned (hoverNode) then
    Exit;

    case hoverNode.Level of
      0 : Add.Caption := 'Add Kompi ';
      1 : Add.Caption := 'Add Platoon ';
      2 : Add.Caption := 'Add Group ';
      3 : Add.Caption := 'Add';
    end;

    Add.Visible := True;
    Quantity.Visible := False;

    if hoverNode.Level = 3 then
    begin
      Add.Visible := False;
      Quantity.Visible := True;
    end
    else if hoverNode.Level = 4 then
      Exit;

    pmEmbarked.Popup(pos.X, pos.Y);
  end;
end;

procedure TfmGroupPersonel.DeleteBrigadeName;
begin
  dmTTT.DeletePersonelBrigade_ByIdBrigade(IntToStr(IdxBrigade));
end;

procedure TfmGroupPersonel.DeleteClick(Sender: TObject);
begin
  hoverNode.Delete
end;

procedure TfmGroupPersonel.DeleteData;
begin
  dmTTT.DeletePersonel_ByIdBrigade(IntToStr(IdxBrigade));
  RefreshlvBrigade;
end;

procedure TfmGroupPersonel.FormCreate(Sender: TObject);
begin
  BrigList := TList.Create;
  BatalyonList := TList.Create;
  KompiList := TList.Create;
  PlatoonList := TList.Create;
  GroupList := TList.Create;
end;

procedure TfmGroupPersonel.FormDestroy(Sender: TObject);
begin
  BrigList.Free;
  BatalyonList.Free;
  KompiList.Free;
  PlatoonList.Free;
  GroupList.Free;
end;

procedure TfmGroupPersonel.FormShow(Sender: TObject);
begin
  Self.Width := 341;
  RefreshlvBrigade;
end;

procedure TfmGroupPersonel.LoadData;
var
  i, j, k, l : Integer;
  Batalyon, Kompi, Platoon, Group: TTreeNode;
  ObjPersonel : TPersonel;
  ObjBrigade  : TBrigade;
  ObjBatalyon : TBatalyon;
  ObjKompi    : TKompi;
  ObjPlatoon  : TPlatoon;
  ObjGroup    : TGroup;
  seleksidate : string ; // menampung nilai null datetime

begin
  tvPersonel.Items.Clear;

  ObjBrigade  := TBrigade.Create;
  ObjBatalyon := TBatalyon.Create;
  ObjKompi    := TKompi.Create;
  ObjPlatoon  := TPlatoon.Create;
  ObjGroup    := TGroup.Create;

  {Load brigade disini, mendapat nilai balik list batalyon}
  dmTTT.GetBatalyon(IdxBrigade, BatalyonList);
  for i := 0 to BatalyonList.Count-1 do
  begin
    ObjBrigade := TBrigade(BatalyonList[i]);
    seleksiDate := DateTimeToStr(ObjBrigade.last_updated);     //dng
    if seleksiDate = '30-Dec-99' then //dng nilai null datetime jika dikonversi ke string
      lbllstupdatedP.Caption := '- - -' // dng
    else
      lbllstupdatedP.Caption := DateTimeToStr(ObjBrigade.last_updated);  //dng

    ObjBatalyon := BatalyonList.Items[i];
    Batalyon := tvPersonel.Items.Add(nil, TPersonel(ObjBatalyon).Identifier);

    {Load batalyon disini, mendapat nilai balik list kompi}
    dmTTT.GetKompi(TPersonel(ObjBatalyon).Id, KompiList);
    for j := 0 to KompiList.Count-1 do
    begin
      ObjKompi := KompiList.Items[j];
      Kompi := tvPersonel.Items.AddChild(Batalyon, TPersonel(ObjKompi).Identifier);

      {Load Kompi disini, mendapat nilai balik list platoon}
      dmTTT.GetPlatoon(TPersonel(ObjKompi).Id, PlatoonList);
      for k := 0 to PlatoonList.Count-1 do
      begin
        ObjPlatoon := PlatoonList.Items[k];
        Platoon := tvPersonel.Items.AddChild( Kompi, TPersonel(ObjPlatoon).Identifier);

        {Load Platoon disini, mendapat nilai balik list group}
        dmTTT.GetGroup(TPersonel(ObjPlatoon).Id, GroupList);
        for l := 0 to GroupList.Count-1 do
        begin
          ObjGroup := GroupList.Items[l];

          Group := tvPersonel.Items.AddChild( Platoon, TPersonel(ObjGroup).Identifier);
          tvPersonel.Items.AddChildFirst(Group, IntToStr(ObjGroup.quantity));
        end;
      end;
    end;
  end;

  btNew.Visible := False;
  btCopy.Visible := False;
  btEdit.Visible := False;
  btRemove.Visible := False;
  btUsage.Visible := False;
  btClose.Visible := False;

  grpCreateBrigade.Left := 6;
end;

procedure TfmGroupPersonel.lvBrigadeSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
var
  li : TListItem;
begin
  if Selected then
  begin
    li := lvBrigade.Selected;
    LastName := li.SubItems[0];
    edtNameBrigade.Text := li.SubItems[0];
    IdxBrigade := StrToInt(li.SubItems[1]);
    edtNameBatalyon.Text := '';
  end;
end;

procedure TfmGroupPersonel.QuantityClick(Sender: TObject);
var
  Group: TTreeNode;
begin
  if fmPersonelQuantityInput.ShowModal = mrOk then
  begin
    Group := hoverNode.getFirstChild;
    Group.Text := fmPersonelQuantityInput.edtQuantity.Text;
  end;
end;

end.
