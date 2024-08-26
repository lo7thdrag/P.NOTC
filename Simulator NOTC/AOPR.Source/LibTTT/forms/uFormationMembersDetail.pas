unit uFormationMembersDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uGameData_TTT, uT3Vehicle, uDBFormation;

type
  TfrmFormationMembersDetail = class(TForm)
    grpMembers: TGroupBox;
    lblAltitude: TStaticText;
    lblRange: TStaticText;
    lblBearing: TStaticText;
    edtAltitude: TEdit;
    edtRange: TEdit;
    edtBearing: TEdit;
    lbAltitude: TStaticText;
    lbRange: TStaticText;
    lblDegrees: TStaticText;
    btnAddorRemove: TButton;
    btnClose: TButton;
    procedure btnAddorRemoveClick(Sender: TObject);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure EmptyRec(var rec : TRecEditFormation);
    { Private declarations }
    //procedure SetformSelected(const Value: TFormation);
  public
    //property formSelected : TFormation read FformSelected write SetformSelected;
    isAddMembers : Boolean;
    FormationSelectedID  : Integer;
    VeMembers  : TT3Vehicle;
    { Public declarations }
  end;

var
  frmFormationMembersDetail: TfrmFormationMembersDetail;

implementation

uses uSimMgr_Client, uBaseCoordSystem, tttData;

{$R *.dfm}

procedure TfrmFormationMembersDetail.btnAddorRemoveClick(Sender: TObject);
var
  i : Integer;
  found : Boolean;
  FrecMembers : TRecEditFormation;
  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
begin
  EmptyRec(FrecMembers);

  FRecMembers.MemberId      := VeMembers.InstanceIndex;
  FrecMembers.MemberBearing := StrToFloat(edtBearing.Text);
  FrecMembers.MemberRange   := StrToFloat(edtRange.Text);
  FrecMembers.MemberAltitude:= StrToFloat(edtAltitude.Text);

  found := False;
  if isAddMembers then
  begin

    fm := simmgrclient.Scenario.Formation_List_rev.FormationByIndex(FormationSelectedID);
    if Assigned(fm) then
    begin
      FRecMembers.FormationID     := fm.FFormation_Def.Formation_Index;
      FRecMembers.FormationName   := fm.FFormation_Def.Formation_Identifier;
      FRecMembers.FormationLeader := fm.FFormation_Def.Formation_Leader;
      FRecMembers.Force           := fm.FFormation_Def.Force_Designation;
      FRecMembers.AngelType       := fm.FFormation_Def.Angle_Type;
      FRecMembers.DeploymentId    := fm.FFormation_Def.Deployment_Index;

      FRecMembers.OrderID := CORD_ID_AddMember;
      simMgrClient.netSend_CmdEditFormation(FrecMembers);
    end;
  end
  else
  begin
    fm := simmgrclient.Scenario.Formation_List_rev.FormationByIndex(FormationSelectedID);

    if not Assigned(fm) then
      Exit;

    if not Assigned(VeMembers) then
      Exit;

    fa := fm.MemberByIndex(VeMembers.InstanceIndex);

    if Assigned(fa) then
    begin
      FRecMembers.FormationID     := fm.FFormation_Def.Formation_Index;
      FRecMembers.FormationName   := fm.FFormation_Def.Formation_Identifier;
      FRecMembers.FormationLeader := fm.FFormation_Def.Formation_Leader;

      FRecMembers.OrderID := CORD_ID_EditMember;
      simMgrClient.netSend_CmdEditFormation(FrecMembers);
    end;
  end;

  Close;
end;

procedure TfrmFormationMembersDetail.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormationMembersDetail.edtAltitudeKeyPress(Sender: TObject;
  var Key: Char);
var
  ValKey : set of AnsiChar;
  nAlt, Altitude : Double;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(VeMembers) then
    begin
      TryStrToFloat(edtAltitude.Text, nAlt);
      Altitude := nAlt * C_Feet_To_Meter;

      if Altitude > VeMembers.Mover.MaxAltitude then
      begin
        edtAltitude.Text := FloatToStr(VeMembers.Mover.MaxAltitude / C_Feet_To_Meter);
      end
      else
      begin
        edtAltitude.Text := FloatToStr(Altitude / C_Feet_To_Meter);
      end;
    end;
  end;
end;

procedure TfrmFormationMembersDetail.EmptyRec(var rec: TRecEditFormation);
begin
  with rec do
  begin
    SessionID       := 0;
    OrderID         := 0;
    FormationID     := 0;
    FormationName   := '';
    FormationLeader := 0;
    AngelType       := 0;
    Force           := 0;
    DeploymentId    := 0;

    MemberId        := 0;
    MemberBearing   := 0;
    MemberRange     := 0;
    MemberAltitude  := 0;
  end;
end;

procedure TfrmFormationMembersDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmFormationMembersDetail := nil;
end;

procedure TfrmFormationMembersDetail.FormShow(Sender: TObject);
var
  i : Integer;
  fm : TFormationRefine;
  fa : TClassFormation_Assignment;
begin
  if isAddMembers then
  begin
    btnAddorRemove.Caption := 'Add Members';
    edtBearing.Text := '0';
    edtRange.Text   := '0';
    edtAltitude.Text:= '0';
  end
  else
  begin
    btnAddorRemove.Caption := 'Edit Members';

    fm := simmgrclient.Scenario.Formation_List_rev.FormationByIndex(FormationSelectedID);

    if not Assigned(fm) then
      Exit;

    if not Assigned(VeMembers) then
      Exit;

    fa := fm.MemberByIndex(VeMembers.InstanceIndex);

    if Assigned(fa) then
    begin
      edtBearing.Text := FloatToStr(fa.Angle_Offset);
      edtRange.Text   := FloatToStr(fa.Range_from_Leader);
      edtAltitude.Text:= FloatToStr(fa.Altitude);
    end
    else
    begin
      edtBearing.Text := '0';
      edtRange.Text   := '0';
      edtAltitude.Text:= '0';
    end;
  end;
end;

end.
