unit ufSurfaceToSurfaceMissile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Menus

  , uT3Unit, uT3Missile, uT3MissileEnvironment, uT3Vehicle, tttData, uBaseCoordSystem, uSimMgr_Client;

type
  TfrmSurfaceSurfaceMissileControl = class(TForm)
    lbl1: TLabel;
    bvl1: TBevel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    bvl2: TBevel;
    edtCruiseAltitude: TEdit;
    edtSeekerRange: TEdit;
    btnPreSearch: TSpeedButton;
    btnAttackMode: TSpeedButton;
    edtPreSearchSkim: TEdit;
    edtAttackMode: TEdit;
    edtHighFlyout: TEdit;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    edtWindSpeed: TEdit;
    edtWindDirection: TEdit;
    edtTemperature: TEdit;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    bvl3: TBevel;
    btnClose: TButton;
    pmPopUpMode: TPopupMenu;
    PopUp1: TMenuItem;
    SeaSkim1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSeekerRangeKeyPress(Sender: TObject; var Key: Char);
    procedure PopUp1Click(Sender: TObject);
    procedure edtCruiseAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure btnAttackModeClick(Sender: TObject);
    procedure edtHighFlyoutKeyPress(Sender: TObject; var Key: Char);
  private
    FCruiseAltitude, FSeekerRange, FHighFlyout : Double;
    FAttackMode   : TPopUpMode;
    { Private declarations }
  public
    ShipOwn        : TT3PlatformInstance;
    MissileVehicle : TT3MissilesOnVehicle;
    procedure SetEnvironment(pi : TT3PlatformInstance; Missile : TT3MissilesOnVehicle);

    { Public declarations }
  end;

var
  frmSurfaceSurfaceMissileControl: TfrmSurfaceSurfaceMissileControl;

implementation

uses ufTacticalDisplay;

{$R *.dfm}

procedure TfrmSurfaceSurfaceMissileControl.btnAttackModeClick(Sender: TObject);
var
  P : TPoint;
begin
  GetCursorPos(p);
  pmPopUpMode.Popup(p.X, p.Y);
end;

procedure TfrmSurfaceSurfaceMissileControl.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSurfaceSurfaceMissileControl.edtCruiseAltitudeKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if StrToFloat(edtCruiseAltitude.Text) > 500 then
    begin
      frmTacticalDisplay.addStatus('Input Too High');
      edtCruiseAltitude.Text := FloatToStr(MissileVehicle.DefaultAltitude);
    end
    else
    if StrToFloat(edtCruiseAltitude.Text) < MissileVehicle.MissileDefinition.
       FDef.Default_Altitude then
    begin
      frmTacticalDisplay.addStatus('Input Too Low');
      edtCruiseAltitude.Text := FloatToStr(MissileVehicle.DefaultAltitude);
    end
    else
    begin
      MissileVehicle.DefaultAltitude := StrToFloat(edtCruiseAltitude.Text);
    end;
  end;
end;

procedure TfrmSurfaceSurfaceMissileControl.edtHighFlyoutKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
  range, From_X, From_Y : Double;
  i : Integer;
  Owner, Target : TT3Vehicle;
  RBLWPoint : TPointVehicleMissileRBLW;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if Assigned(simMgrClient.ControlledPlatform) then
    begin
      range := 0;
      Owner := TT3Vehicle(simMgrClient.ControlledPlatform);

      if Assigned(MissileVehicle) then
      begin
        Target := TT3Vehicle(MissileVehicle.TargetObject);

        case MissileVehicle.FiringMode of
          mfmRBL,mfmBOL :
            begin
              range := CalcRange(Owner.PosX, Owner.PosY, Target.PosX, Target.PosY);
            end;
          mfmRBLW,mfmBOLW :
            begin
              From_X := Owner.PosX;
              From_Y := Owner.PosY;

              if MissileVehicle.RBLW_PointList.Count > 0 then
              begin
                for i := 0 to MissileVehicle.RBLW_PointList.Count - 1 do
                begin
                  RBLWPoint := MissileVehicle.RBLW_PointList.Items[i];

                  range := range + CalcRange(From_X, From_Y, RBLWPoint.PointRBLW_X1,
                           RBLWPoint.PointRBLW_Y1);
                  From_X := RBLWPoint.PointRBLW_X1;
                  From_Y := RBLWPoint.PointRBLW_Y1;
                end;
              end;

              range := range + CalcRange(From_X, From_Y, Target.PosX, Target.PosY);
            end;
        end;

        if StrToFloat(edtHighFlyout.Text) > range then
        begin
          edtHighFlyout.Text := FloatToStr(MissileVehicle.HitMode.HAFO);
          frmTacticalDisplay.addStatus('Input Range too High');
        end
        else
        if StrToFloat(edtHighFlyout.Text) < MissileVehicle.GameDefaults.FData.HAFO_Min_Range then
        begin
          edtHighFlyout.Text := FloatToStr(MissileVehicle.HitMode.HAFO);
          frmTacticalDisplay.addStatus('Input Range too Low');
        end
        else
        begin
          MissileVehicle.HitMode.HAFO := StrToFloat(edtHighFlyout.Text);
        end;
      end;
    end;
  end;
end;

procedure TfrmSurfaceSurfaceMissileControl.edtSeekerRangeKeyPress(
          Sender: TObject; var Key: Char);
var
  ValKey : set of AnsiChar;
begin
  ValKey := [#48 .. #57, #8, #13, #46];
  if not(CharInSet(Key, ValKey)) then
    Key := #0;

  if Key = #13 then
  begin
    if StrToFloat(edtSeekerRange.Text) > MissileVehicle.DestruckRange then
    begin
      frmTacticalDisplay.addStatus('Input Range Reach Weapon Range');
      edtSeekerRange.Text := Floattostr(MissileVehicle.SeekerRangeTurn);
    end
    else
    if StrToFloat(edtSeekerRange.Text) < 6 then
    begin
      frmTacticalDisplay.addStatus('Input Reach Minimum Seeker On');
      edtSeekerRange.Text := Floattostr(MissileVehicle.SeekerRangeTurn);
    end
    else
      MissileVehicle.SeekerRangeTurn := StrToFloat(edtSeekerRange.Text);
  end;
end;

procedure TfrmSurfaceSurfaceMissileControl.FormCreate(Sender: TObject);
begin
  frmSurfaceSurfaceMissileControl.Caption := 'Surface To Surface Missile Control';
  edtWindSpeed.Enabled := False;
  edtWindDirection.Enabled := False;
  edtTemperature.Enabled := False;
end;

procedure TfrmSurfaceSurfaceMissileControl.FormShow(Sender: TObject);
begin
  edtCruiseAltitude.Text := FloatToStr(FCruiseAltitude);
  edtSeekerRange.Text    := FloatToStr(FSeekerRange);
  edtHighFlyout.Text     := FloatToStr(FHighFlyout);

  case FAttackMode of
    ppPopUP   : edtAttackMode.Text := 'Pop Up' ;
    ppSeaSkim : edtAttackMode.Text := 'Sea Skim';
  end;

  edtHighFlyout.Text := FloatToStr(FHighFlyout);

  if ShipOwn is TT3Vehicle then
  begin
    edtWindDirection.Text := FloatToStr(TT3Vehicle(ShipOwn).WindDirection);
    edtWindSpeed.Text     := FloatToStr(TT3Vehicle(ShipOwn).WindSpeed);
  end;

  edtTemperature.Text := Floattostr(TT3Vehicle(ShipOwn).Environment.FData.Air_Temperature);

  if MissileVehicle.MissileDefinition.FDef.Fixed_Seeker_Turn_On_Range = 0 then
    edtSeekerRange.Enabled := False
  else
    edtSeekerRange.Enabled := True;
end;

procedure TfrmSurfaceSurfaceMissileControl.SetEnvironment(
  pi: TT3PlatformInstance; Missile: TT3MissilesOnVehicle);
begin
  FCruiseAltitude := TT3MissilesOnVehicle(Missile).DefaultAltitude;
  FSeekerRange    := TT3MissilesOnVehicle(Missile).SeekerRangeTurn;
  FHighFlyout     := TT3MissilesOnVehicle(Missile).HitMode.HAFO;
  FAttackMode     := TT3MissilesOnVehicle(missile).HitMode.PopUp_Move;
end;

procedure TfrmSurfaceSurfaceMissileControl.PopUp1Click(Sender: TObject);
begin
  case TMenuItem(sender).Tag of
    1 : begin
          MissileVehicle.HitMode.PopUp_Move := ppPopUP;
          edtAttackMode.Text        := 'Pop Up';
        end;
    2 : begin
          MissileVehicle.HitMode.PopUp_Move := ppSeaSkim;
          edtAttackMode.Text        := 'Sea Skim';
        end;
  end;
end;


end.

