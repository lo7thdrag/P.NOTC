unit uFLanding;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uT3Unit;

type
  TfrmLanding = class(TForm)
    lvPlaformAvailable: TListView;
    spl1: TSplitter;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure lvPlaformAvailableSelectItem(Sender: TObject;
      Item: TListItem; Selected: Boolean);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    FControlledPlatform : TT3PlatformInstance;
    FSelectedPlatform : TT3PlatformInstance;
  public
    { Public declarations }
    property ControlledPlatform : TT3PlatformInstance read FControlledPlatform write FControlledPlatform;
    property SelectedPlatform   : TT3PlatformInstance read FSelectedPlatform write FSelectedPlatform;
  end;

var
  frmLanding: TfrmLanding;

implementation

uses
  uSimMgr_Client, uT3Vehicle, uGameData_TTT, uSimObjects, uBaseCoordSystem, 
  tttData, ufTacticalDisplay;

{$R *.dfm}

procedure TfrmLanding.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLanding.btnOKClick(Sender: TObject);
var
  parentObj : TSimObject;
  ve : TT3Vehicle;
  embark : TT3EmbarkedVehicle;
  I : Integer;
  r : TRecCmd_Embark_Landing;
  dist, HeadingTmp : Double;
  bearing : Double;
  LeftLimit, RightLimit : Double;
begin
  if ControlledPlatform <> nil then
  begin
    parentObj := SelectedPlatform;
    if not Assigned(parentObj) then
      Exit;

    if (not parentObj.Equals(ControlledPlatform)) and (parentObj is TT3Vehicle)
      and (ControlledPlatform is TT3Vehicle) then
    begin
      ve := TT3Vehicle(parentObj);

      {check non helly criteria}
//      if (TT3Vehicle(ControlledPlatform).TrackDomain <> vhdAir)
//       or (ControlledPlatform.PlatformDomain <> vhdAir) then
//      begin
//        //check turnrate ship (jika masih dalam proses belok / headingnya belum stabil)
//        if not (ve.HeadingState = mcsStable) then
//          Exit;
//
//        case TT3Vehicle(SelectedPlatform).VehicleDefinition.FData.GangwayPosition of
//          0 :  //front door
//            begin
//              //check ship course
//              HeadingTmp := SelectedPlatform.Heading;
//
//              bearing := CalcBearing(SelectedPlatform.PosX, SelectedPlatform.PosY,
//                        ControlledPlatform.PosX, ControlledPlatform.PosY);
//
//              //if not (Abs(bearing - HeadingTmp) < 30) then
//              LeftLimit := ValidateDegree(HeadingTmp - 15);
//              RightLimit := ValidateDegree(HeadingTmp + 15);
//              if not DegComp_IsBeetwen(bearing, LeftLimit, RightLimit) then
//              begin
//                frmTacticalDisplay.addStatus('Platform not in right course');
//                Exit;
//              end;
//            end;
//          1 : // Back door
//            begin
//              //check ship course
//              HeadingTmp := SelectedPlatform.Heading + 180;
//              if HeadingTmp > 360 then
//                HeadingTmp := HeadingTmp - 360;
//
//              bearing := CalcBearing(SelectedPlatform.PosX, SelectedPlatform.PosY,
//                        ControlledPlatform.PosX, ControlledPlatform.PosY);
//
//              //if not (Abs(bearing - HeadingTmp) < 30) then
//              LeftLimit := ValidateDegree(HeadingTmp - 15);
//              RightLimit := ValidateDegree(HeadingTmp + 15);
//
//              if not DegComp_IsBeetwen(bearing, LeftLimit, RightLimit) then
//              begin
//                frmTacticalDisplay.addStatus('Platform not in right course');
//                Exit;
//              end;
//            end;
//        end;
//
//
//        //check speed
//        if not (Abs(ControlledPlatform.Speed - SelectedPlatform.Speed) < 25) then
//        begin
//          frmTacticalDisplay.addStatus('Dismatch platform speed');
//          Exit;
//        end;
//
//        //check jarak
//        dist := CalcRange(ControlledPlatform.PosX, ControlledPlatform.PosY,
//                SelectedPlatform.PosX, SelectedPlatform.PosY);
//        if not (dist < 1) then
//        begin
//          frmTacticalDisplay.addStatus('Platform is too far');
//          Exit;
//        end;
//
//        //check environment
//        {not yet implemented todo by Farah}
//
//        //cek ketinggian jika adalah platform udara
//        if (ControlledPlatform.TrackDomain = vhdAir)
//          or (ControlledPlatform.PlatformDomain = vhdAir) then
//        begin
//          if not (ControlledPlatform.Altitude < 50) then
//          begin
//            frmTacticalDisplay.addStatus('Altitude not allowed');
//            Exit;
//          end;
//        end;
//      end
//      else
//      begin
//        {check helly criteria}
//        //check turnrate ship (jika masih dalam proses belok / headingnya belum stabil)
//        if not (ve.HeadingState = mcsStable) then
//          Exit;
//
//        //check ship course
//        if SelectedPlatform.PlatformDomain <> vhdLand then
//        begin
//          if ve.VehicleDefinition.FHeliLimitation.
//             Max_Turn_Rate_To_Land <> 0 then
//          begin
//            if (abs(ControlledPlatform.Heading - SelectedPlatform.Heading)
//               > ve.VehicleDefinition.FHeliLimitation.Max_Turn_Rate_To_Land) then
//            begin
//              frmTacticalDisplay.addStatus('Platform not in right course');
//              Exit;
//            end;
//          end
//          else
//          begin
//            if (abs(ControlledPlatform.Heading - SelectedPlatform.Heading) > 30) then
//            begin
//              frmTacticalDisplay.addStatus('Platform not in right course');
//              Exit;
//            end;
//          end;
//        end;
//
//        //check speed
//        if ve.VehicleDefinition.FHeliLimitation.Max_Relative_Speed <> 0 then
//        begin
//          if  (Abs(ControlledPlatform.Speed - SelectedPlatform.Speed)
//              > ve.VehicleDefinition.FHeliLimitation.Max_Relative_Speed) then
//          begin
//            frmTacticalDisplay.addStatus('Dismatch platform speed');
//            Exit;
//          end;
//        end
//        else
//        begin
//          if  (Abs(ControlledPlatform.Speed - SelectedPlatform.Speed) > 25) then
//          begin
//            frmTacticalDisplay.addStatus('Dismatch platform speed');
//            Exit;
//          end;
//        end;
//
//        //check jarak
//        dist := CalcRange(ControlledPlatform.PosX, ControlledPlatform.PosY
//                , SelectedPlatform.PosX, SelectedPlatform.PosY);
//        if ve.VehicleDefinition.FHeliLimitation.Approach_Range <> 0 then
//        begin
//          if not (dist <= ve.VehicleDefinition.FHeliLimitation.Approach_Range) then
//          begin
//            frmTacticalDisplay.addStatus('Platform is too far');
//            Exit;
//          end;
//        end
//        else
//        begin
//          if not (dist < 1) then
//          begin
//            frmTacticalDisplay.addStatus('Platform is too far');
//            Exit;
//          end;
//        end;
//
//        //check environment
//        {not yet implemented todo by Farah}
//
//        //cek ketinggian jika adalah platform udara
//        if (ControlledPlatform.TrackDomain = vhdAir)
//           or (ControlledPlatform.PlatformDomain = vhdAir) then
//        begin
//          if ve.VehicleDefinition.FHeliLimitation.Max_Landing_Altitude <> 0 then
//          begin
//            if not(ControlledPlatform.Altitude <= ve.VehicleDefinition.FHeliLimitation
//                    .Max_Landing_Altitude) then
//            begin
//              frmTacticalDisplay.addStatus('Altitude not allowed');
//              Exit;
//            end;
//          end
//          else
//          begin
//            if not (ControlledPlatform.Altitude < 50) then
//            begin
//              frmTacticalDisplay.addStatus('Altitude not allowed');
//              Exit;
//            end;
//          end;
//        end;
//      end;

      {end check}
      r.ParentPlatformID := ve.InstanceIndex;
      if ve.EmbarkedVehicles.Count > 0 then
      begin
        for I := 0 to ve.EmbarkedVehicles.Count - 1 do
        begin
          embark := ve.EmbarkedVehicles[I];
          if embark.EmbarkedVehicle.Hosted_Vehicle_Index
             = TT3Vehicle(ControlledPlatform).VehicleDefinition.FData.Vehicle_Index then
          begin
            //kirim ke server klo akan landing
            r.EmbarkPlatformID := TT3Vehicle(ControlledPlatform).InstanceIndex;
            r.OrderID := CORD_SET_READYING;
            r.IndexEmbark := 0;
            r.IndexLanding := 0;
            r.InitSpeed := TT3Vehicle(ControlledPlatform).Speed;
            r.InitCourse := TT3Vehicle(ControlledPlatform).Course;
            r.InitAltitude := TT3Vehicle(ControlledPlatform).Altitude;

            simMgrClient.netSend_Cmd_Embark_Land(r);
            Break;
          end;
        end;
      end
      else
      begin
        r.EmbarkPlatformID := TT3Vehicle(ControlledPlatform).InstanceIndex;
        r.OrderID := CORD_SET_READYING;
        r.IndexEmbark := 0;
        r.IndexLanding := 0;
        r.InitSpeed := TT3Vehicle(ControlledPlatform).Speed;
        r.InitCourse := TT3Vehicle(ControlledPlatform).Course;
        r.InitAltitude := TT3Vehicle(ControlledPlatform).Altitude;

        simMgrClient.netSend_Cmd_Embark_Land(r);
      end;
    end;

    Close;
  end;
end;

procedure TfrmLanding.FormShow(Sender: TObject);
var
  li : TlistItem;
  platformObj : TT3PlatformInstance;
  I,J: Integer;  //add andi_29032012
  v : TT3Vehicle;//add andi_29032012
  vEmbark : TT3EmbarkedVehicle;//add andi_29032012
begin
  if not Assigned(ControlledPlatform) then
    Exit;

  if ControlledPlatform is TT3Vehicle then
  begin
    v := TT3Vehicle(ControlledPlatform);//add andi_29032012

    lvPlaformAvailable.Clear;
    for I := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
    begin
      platformObj := simMgrClient.SimPlatforms.getObject(I) as TT3PlatformInstance;
      if ControlledPlatform.Equals(platformObj) or not (platformObj is TT3Vehicle) then
        Continue;

      //==================== add andi_29032012
      if platformObj is TT3Vehicle then
      begin
        for j := 0 to TT3Vehicle(platformObj).EmbarkedVehicles.Count - 1 do
        begin
          vEmbark := TT3Vehicle(platformObj).EmbarkedVehicles[j];
          if (vEmbark.EmbarkedVehicle.Hosted_Vehicle_Index) = (v.VehicleDefinition.FData.Vehicle_Index) then
          begin
             li := lvPlaformAvailable.Items.Add;
             li.Caption := platformObj.InstanceName;
             li.SubItems.Add('Fuel Only');
             li.Data := platformObj;

             Break;
          end
          else Continue;
        end;
      end
      else Continue;
      //================== end andi_29032012
    end;
  end;
end;

procedure TfrmLanding.lvPlaformAvailableSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  SelectedPlatform := Item.Data;
end;

end.
