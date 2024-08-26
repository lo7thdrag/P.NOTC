unit uCalculationEnvi;

{ wN        = WindDirection
  sN        = ShipDirection
  wSpeed    = WindSpeed
  sSpeed    = ShipSpeed
  alfa2     = beta
  penanda   = wind_marker
  penanda2  = ship_marker
  ket       = note
  resultan  = currentSpeed
  arah      = currentDirection
  =====================================
  Diganti, Wind Direction = Ocean Current Direction
  WindDirection = EnviDirection
  WindSpeed     = EnviSpeed
}

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, uCoordConvertor, uBaseCoordSystem, uMapXHandler,
  StrUtils, Math;

type
  CalculationEnvironment = Class

  private

  public
    // farah
    OceanCurrentDirection, OceanCurrentSpeed : Double;
    isOceanCurrentEffect : Boolean;

    Constructor Create; overload;

//    function getCurrentDirection (ShipDirection: Double; EnviDirection: Double; ShipSpeed: Double; EnviSpeed: Double): Double;
//    function getCurrentSpeed     (ShipDirection: Double; EnviDirection: Double; ShipSpeed: Double; EnviSpeed: Double): Double;

    procedure getCurrent_EnviEffect(ShipDirection: Double; EnviDirection: Double; ShipSpeed: Double; EnviSpeed: Double;
    var actual_course: Double; var actual_Speed: Double);
  end;

implementation

constructor CalculationEnvironment.Create;
begin
    inherited;
end;

//function CalculationEnvironment.getCurrentDirection (ShipDirection: Double; EnviDirection: Double; ShipSpeed: Double; EnviSpeed: Double): Double;
procedure CalculationEnvironment.getCurrent_EnviEffect
          (ShipDirection: Double; EnviDirection: Double;
          ShipSpeed: Double; EnviSpeed: Double;
          var actual_course: Double; var actual_Speed: Double);
var
     alfa, beta        : Double;
     //FX, FY            : Double;
     ang, sdtYgDiapit  : Double;
     currentSpeed, currentDirection : Double;
     //ShipFX, ShipFY, EnviFX, EnviFY : Double;
     selisih, sisa, hasil, praShip  : Double;
     envi_marker, ship_marker, note : Integer;
     tempDegree : Double;               //, degreeFromEnviVector
begin
     { input : in degree of compass
               in knots
     }

     sdtYgDiapit := 0;  //mk 02052012 set nilai default
     envi_marker := 1;
     ship_marker := 1;
     beta        := 0;
     alfa        := 0;
     currentDirection := 0;
     note        := 0;
     //currentSpeed := 0; //mk 02052012 set nilai default

     if EnviSpeed = 0 then
     begin
        actual_course := ShipDirection;
        actual_Speed  := ShipSpeed;
        Exit;
     end;

     //detection wind direction
     if (EnviDirection <= 90) then
        begin alfa := 90-EnviDirection; envi_marker := 1; end;
     if ((EnviDirection > 90) and (EnviDirection <=180)) then
        begin alfa := (EnviDirection-90); envi_marker := 2; end;
     if ((EnviDirection >180) and (EnviDirection <=270)) then
        begin alfa := (270-EnviDirection); envi_marker := 3; end;
     if (EnviDirection >270) then
        begin alfa := EnviDirection-270; envi_marker := 4; end;

     //detection ship direction
     if (ShipDirection <= 90) then
        begin beta := 90-ShipDirection; ship_marker := 1; end;
     if ((ShipDirection > 90) and (ShipDirection <=180)) then
        begin beta := (ShipDirection-90); ship_marker := 2; end;
     if ((ShipDirection >180) and (ShipDirection <=270)) then
        begin beta := (270-ShipDirection); ship_marker := 3; end;
     if (ShipDirection >270) then
        begin beta := ShipDirection-270; ship_marker := 4; end;

     //get new speed of ship
     tempDegree   := Abs(EnviDirection-ShipDirection);
     currentSpeed := power(EnviSpeed,2) + Power(ShipSpeed,2) + (2*EnviSpeed*ShipSpeed*cos(DegToRad(tempDegree)));
     currentSpeed := Sqrt(Abs(currentSpeed));
     actual_Speed := currentSpeed;

     //get new course of course
//     degreeFromEnviVector := (Sin(DegToRad(tempDegree))*ShipSpeed) / (ShipSpeed + EnviSpeed);
//     degreeFromEnviVector := ArcSin(currentDirection);
//     actual_course    := ConvCartesian_To_Compass(currentDirection);

     //get each item X and Y
//     ShipFX := ShipSpeed*(cos(DegToRad(beta)));
//     ShipFY := ShipSpeed*(sin(DegToRad(beta)));
//     EnviFX := EnviSpeed*(cos(DegToRad(alfa)));
//     EnviFY := EnviSpeed*(sin(DegToRad(alfa)));
//
//     //get sigma FX and FY
//     FX := ShipFX + EnviFX;
//     FY := ShipFY + EnviFY;
//
//     //get new speed of ship
//     currentSpeed := sqrt (power(FX,2)+power(FY,2));
//     actual_Speed := currentSpeed;
//
//     if ShipSpeed = 0 then
//        actual_course := EnviDirection
//     else
//     begin

       // check ket & sdt yg diapit -> berada di kuadran mana
       if(ship_marker = 1) AND (envi_marker = 1) then
          begin
              note := 1;
              if(ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(ship_marker = 1) AND (envi_marker = 2) then
          begin
              sdtYgDiapit := alfa+beta;
              if (alfa+beta) <=90 then note := 1
              else note := 2;
          end;
       if(ship_marker = 1) AND (envi_marker = 3) then
          begin
              note := 2;
              ang := beta+90+(90-alfa);
              if (ang <=180) then sdtYgDiapit := ang
              else sdtYgDiapit := (90-beta)+90+alfa;
          end;
       if(ship_marker = 1) AND (envi_marker = 4) then
          begin
              if((90-alfa)+(90-beta)) <= 90 then note := 1
              else note := 2;
              sdtYgDiapit := ((90-alfa)+(90-beta));
          end;
       if(ship_marker = 2) AND (envi_marker = 2) then
          begin
              note := 1;
              if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(ship_marker = 2) AND (envi_marker = 3) then
          begin
              if((90-alfa)+(90-beta)) <= 90 then note := 1
              else note := 2;
              sdtYgDiapit := ((90-alfa)+(90-beta));
          end;
       if(ship_marker = 2) AND (envi_marker = 4) then
          begin
              note := 2;
              ang := beta+90+(90-alfa);
              if (ang >= 180) then sdtYgDiapit := alfa+90+(90-beta)
              else sdtYgDiapit := ang;
          end;
       if(ship_marker = 3) AND (envi_marker = 3) then
          begin
              note := 1;
              if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(ship_marker = 3) AND (envi_marker = 4) then
          begin
              sdtYgDiapit := alfa+beta;
              if (alfa+beta) <=90 then note := 1
              else note := 2;
          end;
       if(ship_marker = 4) AND (envi_marker = 4) then
          begin
              note := 1;
              if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;

       //check ket & sdt yg diapit -> berada di kuadran mana
       if(envi_marker = 1) AND (ship_marker = 1) then
          begin
              note := 1;
              if(ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else
                    sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(envi_marker = 1) AND (ship_marker = 2) then
          begin
              sdtYgDiapit := alfa+beta;
              if (alfa+beta) <=90 then note := 1
              else note := 2;
          end;
       if(envi_marker = 1) AND (ship_marker = 3) then
          begin
              note := 2;
              ang := beta+90+(90-alfa);
              if (ang >=180) then sdtYgDiapit := (alfa+90+(90-beta))
              else sdtYgDiapit := ang;
          end;
       if(envi_marker = 1) AND (ship_marker = 4) then
          begin
              sdtYgDiapit := (90-alfa)+(90-beta);
              if((90-alfa)+(90-beta)) <= 90 then note := 1
              else note := 2;
          end;
       if(envi_marker = 2) AND (ship_marker = 2) then
          begin
              note := 1;
              if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(envi_marker = 2) AND (ship_marker = 3) then
          begin
              sdtYgDiapit := (90-alfa)+(90-beta);
              if((90-alfa)+(90-beta)) <= 90 then note := 1
              else note := 2;
          end;
       if(envi_marker = 2) AND (ship_marker = 4) then
          begin
              note := 2;
              ang := (90-beta)+90+alfa;
              if (ang >= 180) then sdtYgDiapit := beta+90+(90-alfa)
              else sdtYgDiapit := ang;
          end;
       if(envi_marker = 3) AND (ship_marker = 3) then
          begin
              note := 1;
              if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
              else sdtYgDiapit := ShipDirection-EnviDirection;
          end;
       if(envi_marker = 3) AND (ship_marker = 4) then
         begin
             sdtYgDiapit := alfa+beta;
             if (alfa+beta) <=90 then note := 1
             else note := 2;
         end;

       if(envi_marker = 4) AND (ship_marker = 4) then
         begin
            note := 1;
            if (ShipDirection <= EnviDirection) then sdtYgDiapit := EnviDirection-ShipDirection
            else
                  sdtYgDiapit := ShipDirection-EnviDirection;
          end;

       // selisih = selisih derajat antara : Arah Kapal lama dengan Arah Kapal baru
       // note -> menentukan sudutnya lancip atau tidak
       if (note = 1) then
        begin
          praShip := EnviSpeed*(cos(DegToRad(sdtYgDiapit)));
          if currentSpeed <= 0 then
            currentSpeed := 1;

          hasil   := (ShipSpeed+praShip)/currentSpeed;
          selisih := ArcCos(hasil);
          selisih := RadToDeg(selisih);
        end
       else
        begin
          praShip := EnviSpeed*(cos(DegToRad(180-sdtYgDiapit)));
          if currentSpeed <= 0 then
            currentSpeed := 1;

          hasil   := (ShipSpeed-praShip)/currentSpeed;
          selisih := ArcCos(hasil);
          selisih := RadToDeg(selisih);
        end;

       //check ship
       if(ship_marker = 1) AND (envi_marker = 1) then
          begin
            if(ShipDirection <= EnviDirection) then  currentDirection := ShipDirection+selisih  //currentDirection := 90 - (ShipDirection + degreeFromEnviVector)
            else
              currentDirection := ShipDirection-selisih;
          end;
       if(ship_marker = 1) AND (envi_marker = 2) then
          begin
            currentDirection := ShipDirection+selisih;
          end;
       if(ship_marker = 1) AND (envi_marker = 3) then
          begin
            ang := beta+90+(90-alfa);

            if (ang <=180) then currentDirection := ShipDirection+selisih
            else
            begin
              sisa := selisih-ShipDirection;
              if (ShipDirection >= selisih) then currentDirection := ShipDirection-selisih
              else currentDirection := 360-sisa;
            end;
          end;
       if(ship_marker = 1) AND (envi_marker = 4) then
          begin
            sisa := selisih-ShipDirection;
            if (ShipDirection >= selisih) then currentDirection := ShipDirection-selisih
            else currentDirection := 360-sisa;
          end;
       if(ship_marker = 2) AND (envi_marker = 2) then
          begin
            if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
            else currentDirection := ShipDirection-selisih;
          end;
       if(ship_marker = 2) AND (envi_marker = 3) then
          begin
              currentDirection := ShipDirection+selisih;
          end;
       if(ship_marker = 2) AND (envi_marker = 4) then
          begin
              ang := beta+90+(90-alfa);
              if (ang >= 180) then currentDirection := ShipDirection+selisih
              else
                  begin
                      sisa := selisih-ShipDirection;
                      if (ShipDirection >= selisih) then currentDirection := ShipDirection-selisih
                      else currentDirection := 360-sisa;
                  end;
          end;
       if(ship_marker = 3) AND (envi_marker = 3) then
          begin
            if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
            else currentDirection := ShipDirection-selisih;
          end;
       if(ship_marker = 3) AND (envi_marker = 4) then
          begin
             currentDirection := ShipDirection+selisih;
          end;
       if(ship_marker = 4) AND (envi_marker = 4) then
          begin
            if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
            else currentDirection := ShipDirection-selisih;
          end;

       //check wind
       if(envi_marker = 1) AND (ship_marker = 1) then
          begin
            if(ShipDirection <= EnviDirection) then
                 currentDirection := ShipDirection+selisih
            else currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 1) AND (ship_marker = 2) then
          begin
            currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 1) AND (ship_marker = 3) then
          begin
            ang := beta+90+(90-alfa);

            if (ang >=180) then currentDirection := ShipDirection-selisih
            else
            begin
              sisa := selisih-(beta+90);
              if (selisih >= (beta+90)) then currentDirection := 0+sisa
              else currentDirection := ShipDirection+selisih;
            end;
          end;
       if(envi_marker = 1) AND (ship_marker = 4) then
          begin
              sisa := selisih - (90-beta);
              if selisih >= (90-beta) then currentDirection := 0+sisa
              else currentDirection := ShipDirection+selisih;
          end;
       if(envi_marker = 2) AND (ship_marker = 2) then
          begin
            if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
            else
              currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 2) AND (ship_marker = 3) then
          begin
              currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 2) AND (ship_marker = 4) then
          begin
            ang := (90-beta)+90+alfa;

            if (ang >= 180) then currentDirection := ShipDirection-selisih
            else
            begin
                sisa := selisih-(90-beta);
                if (selisih >= (90-beta)) then currentDirection := 0+sisa
                else currentDirection := ShipDirection+selisih;
            end;
          end;
       if(envi_marker = 3) AND (ship_marker = 3) then
          begin
              if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
              else currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 3) AND (ship_marker = 4) then
          begin
             currentDirection := ShipDirection-selisih;
          end;
       if(envi_marker = 4) AND (ship_marker = 4) then
          begin
              if (ShipDirection <= EnviDirection) then currentDirection := ShipDirection+selisih
              else currentDirection := ShipDirection-selisih
          end;

       actual_course := currentDirection;
//     end;
end;

//function CalculationEnvironment.getCurrentSpeed     (ShipDirection: Double; EnviDirection: Double; ShipSpeed: Double; EnviSpeed: Double): Double;
//var
//     alfa, beta : Double;
//     FX, FY : Double;
//     ShipFX, ShipFY, WindFX, WindFY : Double;
//     wind_marker, ship_marker : Integer;
//begin
//     //detection wind direction
//     if (EnviDirection <= 90) then
//        begin alfa := 90-EnviDirection; wind_marker := 1; end;
//     if ((EnviDirection > 90) and (EnviDirection <=180)) then
//        begin alfa := (EnviDirection-90); wind_marker := 2; end;
//     if ((EnviDirection >180) and (EnviDirection <=270)) then
//        begin alfa := (270-EnviDirection); wind_marker := 3; end;
//     if (EnviDirection >270) then
//        begin alfa := EnviDirection-270; wind_marker := 4; end;
//
//     //detection ship direction
//     if (ShipDirection <= 90) then
//        begin beta := 90-ShipDirection; ship_marker := 1; end;
//     if ((ShipDirection > 90) and (ShipDirection <=180)) then
//        begin beta := (ShipDirection-90); ship_marker := 2; end;
//     if ((ShipDirection >180) and (ShipDirection <=270)) then
//        begin beta := (270-ShipDirection); ship_marker := 3; end;
//     if (ShipDirection >270) then
//        begin beta := ShipDirection-270; ship_marker := 4; end;
//
//     //get each item X and Y
//     ShipFX := ShipSpeed*(cos(DegToRad(beta)));
//     ShipFY := ShipSpeed*(sin(DegToRad(beta)));
//     WindFX := EnviSpeed*(cos(DegToRad(alfa)));
//     WindFY := EnviSpeed*(sin(DegToRad(alfa)));
//
//     //get sigma FX and FY
//     FX := ShipFX + WindFX;
//     FY := ShipFY + WindFY;
//
//     //get new speed of ship
//     Result := sqrt (power(FX,2)+power(FY,2));
//end;

end.
