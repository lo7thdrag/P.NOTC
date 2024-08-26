unit uFormatioResourceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBFormation;

type
  TFormationResourcesForm = class(TForm)
    btCopy: TButton;
    btEdit: TButton;
    btNew: TButton;
    btOK: TButton;
    btRemove: TButton;
    Button2: TButton;
    Button3: TButton;
    lbAvailablePlatforms: TListBox;
    lbSelectedPlatforms: TListBox;
    lbAvailablePlatformIndex: TListBox;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    lbSelectedPlatformsIndex: TListBox;
    procedure RefreshPlatformList;
    procedure RefreshMemberList;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FormationAssign : TFormation;

    procedure GetAllPlatformInSceByForce(force : Integer; aAllPlat, aPlatResult : TList);
  public
    raList:TList;
    { Public declarations }
  end;

var
  FormationResourcesForm: TFormationResourcesForm;
  idPlatformSelected: string;
  formAssignment,formPlatform: TList;

implementation

uses
  uSimDBEditor, uDBAssetObject, ufrmSummaryResourceAllocation, uFormationEditorPanel,
  uFormationeditor, uDataModuleTTT, uInputName;

{$R *.dfm}

procedure TFormationResourcesForm.btEditClick(Sender: TObject);
begin
   frmSummaryResourceAllocation.edtName.Text := lbAvailablePlatforms.Items.Strings[lbAvailablePlatforms.ItemIndex];
   frmSummaryResourceAllocation.edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbAvailablePlatforms.ItemIndex]).FData.Game_Start_Time));
   frmSummaryResourceAllocation.ShowModal;
end;

procedure TFormationResourcesForm.btNewClick(Sender: TObject);
begin
  frmSummaryResourceAllocation.ShowModal;
end;

procedure TFormationResourcesForm.btOKClick(Sender: TObject);
begin
  //masukkan data platform kedalam formasi combobox member
  // -- clear dulu yang sebelumnya
//  FormationEditorPanelForm.cbxMembers.Clear;
//  FormationEditorPanelForm.lstPlatformSelected.Clear;
//  FormationEditorPanelForm.lstPlatformSelectedIndex.Clear;
//  for I := 0 to lbSelectedPlatforms.Count - 1 do
//  begin
//    FormationEditorPanelForm.lstPlatformSelected.Items.Add(lbSelectedPlatforms.Items.Strings[I]);
//    FormationEditorPanelForm.cbxMembers.Items.Add(lbSelectedPlatforms.Items.Strings[I]);
//    FormationEditorPanelForm.lstPlatformSelectedIndex.Items.Add(lbSelectedPlatformsIndex.Items.Strings[I]);
//  end;
  FormationEditorPanelForm.getMemberList;

  Self.Close;
end;

procedure TFormationResourcesForm.btRemoveClick(Sender: TObject);
var I     : integer;
begin
 //delete pada db dulu
 if lbSelectedPlatforms.ItemIndex <> -1 then
 begin
   with SIMMgr do
   begin
     deleteFormation_Assignment(IntToStr(FormationEditorPanelForm.formation_id),
          lbSelectedPlatformsIndex.Items.Strings[lbSelectedPlatforms.ItemIndex]);

     for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
     begin
       if (TFormation(FormationEditorForm.FormationAssignmentList.Items[i]).FForm_Assign.Platform_Instance_Index =
          StrToInt(lbSelectedPlatformsIndex.Items.Strings[lbSelectedPlatforms.ItemIndex])) and
          (TFormation(FormationEditorForm.FormationAssignmentList.Items[i]).FForm_Assign.Formation_Index =
          FormationEditorPanelForm.formation_id) then
       begin
         FormationEditorForm.FormationAssignmentList.Delete(i);
         Break;
       end;

     end;

   end;

   for I := 0 to lbSelectedPlatforms.Items.Count - 1 do
     if lbSelectedPlatforms.Selected[I] then
     begin
      lbAvailablePlatforms.Items.Add(lbSelectedPlatforms.Items[I]);
      lbAvailablePlatformIndex.Items.Add(idPlatformSelected);
     end;
   for I :=lbSelectedPlatforms.Items.Count - 1 downto 0 do
     if lbSelectedPlatforms.Selected[I] then
     begin
      lbSelectedPlatforms.Items.Delete(I);
      lbSelectedPlatformsIndex.Items.Delete(I);
      idPlatformSelected := '';
     end;
 end;
end;

procedure TFormationResourcesForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormationResourcesForm.Button3Click(Sender: TObject);
var I: Integer;
begin

  FormationAssign := TFormation.Create; // bentuk baru tiap kali add

  //add pada database
  with FormationAssign do
  begin
    //set data
    FForm_Assign.Formation_Index := FormationEditorPanelForm.formation_id;
    FForm_Assign.Platform_Instance_Index := StrToInt(lbAvailablePlatformIndex.Items.Strings[lbAvailablePlatforms.ItemIndex]);
    FForm_Assign.Range_from_Leader := 3;
    FForm_Assign.Angle_Offset := 0;
    FForm_Assign.Altitude := 0;

    FPlatform_Instance.Instance_Name := lbAvailablePlatforms.Items.Strings[lbAvailablePlatforms.ItemIndex];
  end;

  with SIMMgr do
  begin
//    insertFormation_Assignment(formationDef);
    FormationEditorForm.FormationAssignmentList.Add(FormationAssign);
  end;

  // add selected List
  for I := 0 to lbAvailablePlatforms.Items.Count - 1 do
  if lbAvailablePlatforms.Selected[I] then
  begin
    //lbSelectedPlatforms.Items.Clear;
    lbSelectedPlatforms.Items.Add(lbAvailablePlatforms.Items[I]);
    lbSelectedPlatformsIndex.Items.Add(lbAvailablePlatformIndex.Items[I]);
  end;

  for I :=lbAvailablePlatforms.Items.Count - 1 downto 0 do
  if lbAvailablePlatforms.Selected[I] then
  begin
    lbAvailablePlatforms.Items.Delete(I);
    lbAvailablePlatformIndex.Items.Delete(I);
  end;

end;

procedure TFormationResourcesForm.FormCreate(Sender: TObject);
begin
  formAssignment := TList.Create;
  formPlatform   := TList.Create;
end;

procedure TFormationResourcesForm.FormShow(Sender: TObject);
begin
  RefreshPlatformList;
end;

procedure TFormationResourcesForm.GetAllPlatformInSceByForce(force: Integer;
  aAllPlat, aPlatResult: TList);
var
 i,j, platID : Integer;
 aPlat : TPlatform_Instance;
begin
  if Assigned(aPlatResult) then
    aPlatResult.Clear
  else
    aPlatResult := TList.Create;

  for I := 0 to aAllPlat.Count - 1 do
  begin
    aPlat := aAllPlat.Items[i];
    if aPlat.FData.Force_Designation = force then
    begin
      aPlatResult.Add(aPlat);
    end;
  end;
end;

procedure TFormationResourcesForm.RefreshPlatformList;
var I, J:integer;
    isSame: boolean;
begin
  //get Available Platform
  RefreshMemberList;

//  dmTTT.getAllPlatFormInstanceForceClassification(0,fPlatformDeploytment.ra_id,
//        formPlatform,FormationEditorPanelForm.force_design,-1);

  GetAllPlatformInSceByForce(FormationEditorPanelForm.force_design, fInputName.PlatformVecList,
     formPlatform);


  lbAvailablePlatforms.Items.Clear;
  lbAvailablePlatformIndex.Items.Clear;
  for I:= 0 to formPlatform.Count - 1 do
  begin
    isSame := False;
    //cek jika sudah ada di leader formation pada formation definition
    for j := 0 to FormationEditorForm.FormationDefList.Count - 1 do
    begin
      if TPlatform_Instance(formPlatform[I]).FData.Platform_Instance_Index =
         TFormation(FormationEditorForm.FormationDefList.Items[j]).FFormation_Def.Formation_Leader  then
      begin
        isSame  := true;
        Break;
      end;

    end;

    for J := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
    begin
      if TPlatform_Instance(formPlatform[I]).FData.Platform_Instance_Index =
         TFormation(FormationEditorForm.FormationAssignmentList.Items[J]).FForm_Assign.Platform_Instance_Index then
      begin
        isSame  := true;
        Break;
      end;
    end;

    if {(TPlatform_Instance(formPlatform[I]).FData.Platform_Instance_Index <> FormationEditorPanelForm.leader_id)
      and }(not isSame) then
    begin
      lbAvailablePlatforms.Items.Add(TPlatform_Instance(formPlatform[I]).FData.Instance_Name);
      lbAvailablePlatformIndex.Items.Add(inttostr(TPlatform_Instance(formPlatform[I]).FData.Platform_Instance_Index));
    end;
    isSame := false;
  end;

  //get selected platform from assignment


  //masukkah nilai pada lbAvailable ke selected
//  for J := 0 to lbSelectedPlatformsIndex.Items.Count - 1 do
//  begin
//    for I := 0 to lbAvailablePlatforms.Items.Count - 1 do
//    begin
//      if lbSelectedPlatformsIndex.Items.Strings[J] = lbAvailablePlatformIndex.Items.Strings[I]  then
//      begin
//        lbSelectedPlatforms.Items.Add(lbAvailablePlatforms.Items.Strings[I]);
//        //hapus yang ada di available
//        //lbAvailablePlatforms.Items.Delete(I);
//        //lbAvailablePlatformIndex.Items.Delete(I);
//      end;
//    end;
//  end;
end;

procedure TFormationResourcesForm.RefreshMemberList;
var I: Integer;
 aFormAssign : TFormation;
begin
//  dmTTT.GetFormation_Assignment(FormationEditorPanelForm.formation_id,formAssignment);

  lbSelectedPlatforms.Items.Clear;
  lbSelectedPlatformsIndex.Items.Clear;
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    aFormAssign := TFormation(FormationEditorForm.FormationAssignmentList.Items[i]);
    if aFormAssign.FForm_Assign.Formation_Index = FormationEditorPanelForm.formation_id then
    begin
      lbSelectedPlatforms.Items.Add(aFormAssign.FPlatform_Instance.Instance_Name);
      lbSelectedPlatformsIndex.Items.Add(IntToStr(aFormAssign.FForm_Assign.Platform_Instance_Index));
    end;
  end;
end;


end.
