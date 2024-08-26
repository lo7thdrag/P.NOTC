unit uFormatioResourceList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBFormation;

type
  TFormationResourcesForm = class(TForm)
    btnClose: TButton;
    btnAdd: TButton;
    lbAvailablePlatforms: TListBox;
    lbSelectedPlatforms: TListBox;
    lbAvailablePlatformIndex: TListBox;
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    lbSelectedPlatformsIndex: TListBox;
    btnRemove: TButton;
    procedure RefresfPlatformList;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    raList:TList;
    { Public declarations }
  end;

var
  FormationResourcesForm: TFormationResourcesForm;
  idPlatformSelected: string;
  formAssignment: TList;

implementation

uses
  uDBAssetObject, uResourceAllocation, uFormationEditorPanel,
  uFormationeditor;

{$R *.dfm}

procedure TFormationResourcesForm.btEditClick(Sender: TObject);
begin
   ResourceAllocationForm.edtName.Text := lbAvailablePlatforms.Items.Strings[lbAvailablePlatforms.ItemIndex];
   ResourceAllocationForm.edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbAvailablePlatforms.ItemIndex]).FData.Game_Start_Time));
   ResourceAllocationForm.Show;
end;

procedure TFormationResourcesForm.btNewClick(Sender: TObject);
begin
  ResourceAllocationForm.Show;
end;

procedure TFormationResourcesForm.btOKClick(Sender: TObject);
var
  I: Integer;
begin
  //masukkan data platform kedalam formasi combobox member
  // -- clear dulu yang sebelumnya
  FormationEditorPanelForm.cbxMembers.Clear;
  FormationEditorPanelForm.lstPlatformSelected.Clear;
  FormationEditorPanelForm.lstPlatformSelectedIndex.Clear;
  for I := 0 to lbSelectedPlatforms.Count - 1 do
  begin
    FormationEditorPanelForm.lstPlatformSelected.Items.Add(lbSelectedPlatforms.Items.Strings[I]);
    FormationEditorPanelForm.cbxMembers.Items.Add(lbSelectedPlatforms.Items.Strings[I]);
    FormationEditorPanelForm.lstPlatformSelectedIndex.Items.Add(lbSelectedPlatformsIndex.Items.Strings[I]);
  end;

  Self.Close;
end;

procedure TFormationResourcesForm.btRemoveClick(Sender: TObject);
var I     : integer;
begin
 //delete pada db dulu
// with SIMMgr do
// begin
//   deleteFormation_Assignment(FormationEditorPanelForm.idFormationSelected, lbSelectedPlatformsIndex.Items.Strings[lbSelectedPlatforms.ItemIndex]);
// end;

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
    idPlatformSelected := '';
   end;




end;

procedure TFormationResourcesForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormationResourcesForm.btnAddClick(Sender: TObject);
var I: Integer;
begin
  //add pada database
  with formationDef do
  begin
    //set data
    FForm_Assign.Formation_Index := StrToInt(FormationEditorPanelForm.idFormationSelected);
    FForm_Assign.Platform_Instance_Index := StrToInt(lbAvailablePlatformIndex.Items.Strings[lbAvailablePlatforms.ItemIndex]);
    FForm_Assign.Range_from_Leader := 0;
    FForm_Assign.Angle_Offset := 0;
    FForm_Assign.Altitude := 0;
  end;

//  with SIMMgr do
//  begin
//    insertFormation_Assignment(formationDef);
//  end;

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
end;

procedure TFormationResourcesForm.FormShow(Sender: TObject);
begin
  RefresfPlatformList;
end;

procedure TFormationResourcesForm.RefresfPlatformList;
var idForce, idClass, I, J:integer;
begin
  //get Available Platform
//  with SimMgr do
//  begin
//   getPlatformInstance(Resource_alloc.FData.Resource_Alloc_Index,Platform_Insts,idForce,idClass);
//   lbAvailablePlatforms.Items.Clear;
//   lbAvailablePlatformIndex.Items.Clear;
//   for I:= 0 to Platform_Insts.Count - 1 do
//   begin
//    lbAvailablePlatforms.Items.Add(TPlatform_Instance(Platform_Insts[I]).FData.Instance_Name);
//    lbAvailablePlatformIndex.Items.Add(inttostr(TPlatform_Instance(Platform_Insts[I]).FData.Platform_Instance_Index));
//   end;
//  end;

  //get selected platform from assignment
//  with SIMMgr do
//  begin
//  formationDef.FFormation_Def.Formation_Index := FormationEditorForm.indexFormationSelected;
//    getFormationAssignment(formationDef, formAssignment);
//    lbSelectedPlatforms.Items.Clear;
//    lbSelectedPlatformsIndex.Items.Clear;
//
//    for I := 0 to formAssignment.Count - 1 do
//    begin
//      lbSelectedPlatformsIndex.Items.Add(IntToStr(TFormation(formAssignment[I]).FForm_Assign.Platform_Instance_Index));
//    end;
//  end;

  //masukkah nilai pada lbAvailable ke selected
  for J := 0 to lbSelectedPlatformsIndex.Items.Count - 1 do
  begin
    for I := 0 to lbAvailablePlatforms.Items.Count - 1 do
    begin
      if lbSelectedPlatformsIndex.Items.Strings[J] = lbAvailablePlatformIndex.Items.Strings[I]  then
      begin
        lbSelectedPlatforms.Items.Add(lbAvailablePlatforms.Items.Strings[I]);
        //hapus yang ada di available
        //lbAvailablePlatforms.Items.Delete(I);
        //lbAvailablePlatformIndex.Items.Delete(I);
      end;
    end;
  end;
end;


end.
