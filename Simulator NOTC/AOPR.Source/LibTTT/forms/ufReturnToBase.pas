unit ufReturnToBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit, uDBAsset_Embark_Library;

type
  TfrmReturnToBase = class(TForm)
    Label1: TLabel;
    lvBaseAvailable: TListView;
    btnOK: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvBaseAvailableSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);

  private
    FControlledPlatform: TT3PlatformInstance;
    FSelectedPlatform: TPlatformBase;

  public
    property ControlledPlatform : TT3PlatformInstance read FControlledPlatform write FControlledPlatform;
    property SelectedPlatform : TPlatformBase read FSelectedPlatform write FSelectedPlatform;

  end;

var
  frmReturnToBase: TfrmReturnToBase;

implementation

{$R *.dfm}
uses
  uSimMgr_Client, uT3Vehicle, uGameData_TTT, uSimObjects, uBaseCoordSystem,
  tttData, uDBScenario, ufTacticalDisplay;

procedure TfrmReturnToBase.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmReturnToBase.btnOKClick(Sender: TObject);
var
//  ve : TT3Vehicle;
//  I : Integer;
//  pjg, lbr, TotBrt, TotLuas : Double;
  ctrlPlatform : TPlatform_Embark_Library;
//  r : TRecCmd_EmbarkTemporary;

  rReturnToBase : TRecCmd_ReturnToBase;

  rrem : TRecCmd_SelectPlatformToRemove;
  base : TPlatformBase;
begin
  if ControlledPlatform <> nil then
  begin
    base := SelectedPlatform;
    ctrlPlatform := TPlatform_Embark_Library(ControlledPlatform);

    if not Assigned(base) then Exit;

    if ControlledPlatform is TT3Vehicle then
    begin
      rReturnToBase.SessionID         := simMgrClient.SessionID;
      rReturnToBase.IdPlatform        := TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Vehicle_Index;
      rReturnToBase.PlatformClassIden := TT3Vehicle(ControlledPlatform).InstanceClass;
      rReturnToBase.BaseId            := SelectedPlatform.id;
      rReturnToBase.BaseIdentifier    := SelectedPlatform.identifier;
      rReturnToBase.Width             := TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Width;
      rReturnToBase.Length            := TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Length;
      rReturnToBase.Force_Designation := SelectedPlatform.force;

      simMgrClient.netSend_CmdrReturnToBase(rReturnToBase);
    end;

    rrem.SessionID := simMgrClient.SessionID;
    rrem.PlatfomID := TT3PlatformInstance(ControlledPlatform).InstanceIndex;
    rrem.IdAction := 0;
    simMgrClient.netSend_CmdRemoveTemporary(rrem);
    Close;
  end;
end;

procedure TfrmReturnToBase.FormShow(Sender: TObject);
var
  li : TListItem;
  i,j : Integer;
  v : TT3Vehicle;
  jrk : Double;
  base : TPlatformBase;
begin
  if not Assigned(ControlledPlatform) then
    Exit;

  if ControlledPlatform is TT3Vehicle then
  begin
    v := TT3Vehicle(ControlledPlatform);

    lvBaseAvailable.Clear;

    for i := 0 to VScenario.BaseListFromDB.Count - 1 do
    begin
      base := TPlatformBase(VScenario.BaseListFromDB.Items[i]);

      {Cek kapal-kapal terdekat yg bisa dituju; jarak maks 0.25 nm}
      jrk := CalcRange(v.PosX, v.PosY, base.Longitude, base.Latitude);

      if jrk > base.Radius then Continue;
      if base.force <> TT3PlatformInstance(v).Force_Designation then Continue;

      li := lvBaseAvailable.Items.Add;
      li.Caption := base.identifier;
      li.Data := base;
    end;

  end;
end;

procedure TfrmReturnToBase.lvBaseAvailableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    SelectedPlatform := Item.Data;
    btnOK.Enabled := True;
  end
  else
  begin
    btnOK.Enabled := False;
  end;
end;

end.
