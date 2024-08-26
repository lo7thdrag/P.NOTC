unit uResurceAllocationSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,uSimManager, ExtCtrls;

type
  TfResorceAllocationSelect = class(TForm)
    lbAvailableResAlloc: TListBox;
    lbSelectedRes: TListBox;
    btOK: TButton;
    Button2: TButton;
    btnAdd: TButton;
    btRemove: TButton;
    lbTempIdRA: TListBox;
    btNew: TButton;
    btCopy: TButton;
    Shape1: TShape;
    btnEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getRA;
    procedure showRA;
    procedure btCopyClick(Sender: TObject);
    procedure lbAvailableResAllocDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }

  public
  RA_id,idRASelected  :string;

    { Public declarations }
  end;

var
  fResorceAllocationSelect: TfResorceAllocationSelect;
  raList:TList;




implementation

uses uSimDBEditor,uDBAssetObject,uDBScenario, ufrmSummaryScenario, ufrmSummaryResourceAllocation;//,uT3SimManager;
{$R *.dfm}

procedure TfResorceAllocationSelect.btNewClick(Sender: TObject);
begin
  with frmSummaryResourceAllocation do
  begin
    edtName.Text  := '';
    edtStartTime.Text    := '';
    edtEnvironment.Text  := '';
    edtDefaults.Text  := '';

    isNew := True;
    btnVehicle.Enabled  := False;
    btnMissile.Enabled  := False;
    btnMine.Enabled     := False;
    btnTorpedo.Enabled  := False;
    btnSonobuoy.Enabled := False;
    btnSatelite.Enabled := False;
    btnRuntimePlatformLibraries.Enabled  := False;
    btnReferencePointsResources.Enabled  := False;
    btnPredifenedPatterns.Enabled  := False;
    btnOverlaysResources.Enabled   := False;
    btnRadarIntervalLists.Enabled  := False;
    btnCommunicationResources.Enabled  := False;

    ShowModal;
  end;

end;

procedure TfResorceAllocationSelect.btOKClick(Sender: TObject);
begin
// if (idRASelected<>'') then
// begin
//   getDBResourceAllocation(strtoint(idRASelected),raList, frmSummaryScenario.ResourceAllocation);
//   frmSummaryScenario.edResourceAllocation.text := frmSummaryScenario.ResourceAllocation.FData.Allocation_Identifier;
//   frmSummaryScenario.selectedResourceAllocation := frmSummaryScenario.ResourceAllocation.FData.Resource_Alloc_Index;
//
//   frmSummaryScenario.Scenario.FData.Resource_Alloc_Index := StrToInt(idRASelected);
//   frmSummaryScenario.buttonBehav;
//   close;
// end
// else begin
//   frmSummaryScenario.edResourceAllocation.text := '[None]';
//   frmSummaryScenario.buttonBehav;
//   close;
// end;
end;

procedure TfResorceAllocationSelect.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TfResorceAllocationSelect.btCopyClick(Sender: TObject);
begin

  with frmSummaryResourceAllocation do begin
    isNew  := False;
    isCopy := True;
    edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbAvailableResAlloc.ItemIndex]).FData.Game_Start_Time));
    ShowModal;
  end;
end;

procedure TfResorceAllocationSelect.btnAddClick(Sender: TObject);
begin
  if lbAvailableResAlloc.ItemIndex <> -1 then
  begin
    lbSelectedRes.Items.Clear;
    idRASelected := lbTempIdRA.Items.Strings[lbAvailableResAlloc.ItemIndex];

    showRA;
  end;
end;

procedure TfResorceAllocationSelect.btnEditClick(Sender: TObject);
begin
   RA_id := lbTempIdRA.Items.Strings[lbAvailableResAlloc.ItemIndex];
   with frmSummaryResourceAllocation do begin
      isNew := False;
      ra_id := StrToInt(lbTempIdRA.Items.Strings[lbAvailableResAlloc.ItemIndex]);
      edtName.Text := lbAvailableResAlloc.Items.Strings[lbAvailableResAlloc.ItemIndex];
      edtStartTime.Text := datetimetostr( floattodatetime(TResource_Allocation(raList[lbAvailableResAlloc.ItemIndex]).FData.Game_Start_Time));
      ShowModal;
   end;
end;

procedure TfResorceAllocationSelect.btRemoveClick(Sender: TObject);
begin
  if lbSelectedRes.ItemIndex <> -1 then
  begin
    idRASelected := '';
    showRA;
  end;
end;

procedure TfResorceAllocationSelect.FormCreate(Sender: TObject);
begin
  raList := Tlist.Create;
end;

procedure TfResorceAllocationSelect.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btOK.Click;
     end;
    end;
  end;
end;

procedure TfResorceAllocationSelect.FormShow(Sender: TObject);
begin
  getRA;
end;

procedure TfResorceAllocationSelect.getRA;
begin
//get all scenario name
  uSimDBEditor.getResourceAllocation(raList);
  showRA;
end;

procedure TfResorceAllocationSelect.showRA;
var i:integer;
begin
  lbAvailableResAlloc.Items.Clear;
  lbTempIdRA.Items.Clear;
  lbSelectedRes.Items.Clear;

  for I := 0 to raList.Count - 1 do
  begin
    if idRASelected = IntToStr(TResource_Allocation(raList[i]).FData.Resource_Alloc_Index) then
    begin
      lbSelectedRes.Items.Add(TResource_Allocation(raList[i]).FData.Allocation_Identifier);
    end
    else begin
      lbAvailableResAlloc.Items.Add(TResource_Allocation(raList[i]).FData.Allocation_Identifier);
      lbTempIdRA.Items.Add(IntToStr(TResource_Allocation(raList[i]).FData.Resource_Alloc_Index));
    end;
  end;
end;


procedure TfResorceAllocationSelect.lbAvailableResAllocDblClick(
  Sender: TObject);
begin
  btnAdd.Click;
end;

end.
