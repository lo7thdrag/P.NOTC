unit tttData;

interface

uses Classes, graphics, uT3Listener ;

const
  /// client role play
  crpServer      = 0;
  crpInstruktur  = 1;
  crpCubicle     = 2;

  /// color group
  cgFriend       = clBlue; // TColor($33CCFF);  // light blue
  cgHostile      = clRed;  // TColor($FF0000);  // red
  cgSuspect      = clGreen;// TColor($00FF33);  // green
  cgOther        = clWhite;//

  clrSelected    = clYellow; //TColor($FFFF33);  // Yellow

  /// User Map Tool Constanta
  mtAddWaypoint  = 100;
  mtSelectObject = 101;
  mtAnchorTool   = 102;
  mtDeployPosition = 103;
  mtCenterOnHook = 104;
  mtAimpoint     = 105;
  mtDeployChaff  = 106;
  mtDeployNGS    = 107;

  //Hambali
  mtEditDynamic  = 108;
  mtEditStatic   = 109;
  mtAddText      = 110;

  //choco
  mtEditWaypoint  = 111;

  //andik
  mtMultiMode = 112;

  /// detectability type (*sesuai dengan id database)
  dtNormalDetection     = 0;     //platform can be detected by sensors as appropriate
  dtUndetectable        = 1;     //platform cannot be detected by any sensor
  dtPassiveDetection    = 2;     //platforms is only detectable by passive sensors
  dtAlwaysVisible       = 3;     //applies to platforms that are always visible to all forces

  /// platform Identity (*sesuai id database)
  piPending             = 0;
  piUnknown             = 1;
  piAssumedFriend       = 2;
  piFriend              = 3;
  piNeutral             = 4;
  piSuspect             = 5;
  piHostile             = 6;

  /// symbol pictures name
  pfAssumedFriend           : string = 'AssumedFriend';
  pfFriend                  : string = 'Friend';
  pfHostile                 : string = 'Hostile';
  pfNeutral                 : string = 'Neutral';
  pfPending                 : string = 'Pending';
  pfUnknown                 : string = 'Unknown';
  pfSuspect                 : string = 'Suspect';

  pctAir                     : string = 'Air';
  pctAirborneEarlyWarning    : string = 'AirborneEarlyWarning';
  pctAirfield                : string = 'Airfield';
  pctAirGeneral              : string = 'AirGeneral';
  pctAirport_Civilian        : string = 'Airport_Civilian';
  pctAirport_Military        : string = 'Airport_Military';
  pctArmour                  : string = 'Armour';
  pctAssign                  : string = 'Assign';
  pctAswGeneral              : string = 'AswGeneral';
  pctBatteryAaa              : string = 'BatteryAaa';
  pctBatterySam              : string = 'BatterySam';
  pctBriefContact            : string = 'BriefContact';
  pctBullseye                : string = 'Bullseye';
  pctBuoy                    : string = 'Buoy';
  pctChaff                   : string = 'Chaff';
  pctCoastArtillery          : string = 'CoastArtillery';
  pctCoastMissile            : string = 'CoastMissile';
  pctCombatAirPatrol         : string = 'CombatAirPatrol';
  pctDataLinkReferencePoint  : string = 'DataLinkReferencePoint';
  pctDatum                   : string = 'Datum';
  pctDecoy                   : string = 'Decoy';
  pctDistressedVessel        : string = 'DistressedVessel';
  pctDitchedAirCraft         : string = 'DitchedAirCraft';
  pctEmpty                   : string = 'Empty';
  pctEngage                  : string = 'Engage';
  pctEsmEcmFix               : string = 'EsmEcmFix';
  pctFixedWing               : string = 'FixedWing';
  pctForceCenter             : string = 'ForceCenter';
  pctFormationMember         : string = 'FormationMember';
  pctGate                    : string = 'Gate';
  pctGeneral                 : string = 'General';
  pctGroundZero              : string = 'GroundZero';
  pctIff                     : string = 'Iff';
  pctInfantry                : string = 'Infantry';
  pctInfraredDecoy           : string = 'InfraredDecoy';
  pctKingpin                 : string = 'Kingpin';
  pctLand                    : string = 'Land';
  pctManInWater              : string = 'ManInWater';
  pctMaritimeHeadquarters    : string = 'MaritimeHeadquarters';
  pctMidCrsMissile           : string = 'MidCrsMissile';
  pctMine                    : string = 'Mine';
  pctMineHazard              : string = 'MineHazard';
  pctMissile                 : string = 'Missile';
  pctNavigationHazard        : string = 'NavigationHazard';
  pctNavigationalHazard      : string = 'NavigationalHazard';
  pctOilRig                  : string = 'OilRig';
  pctOwnShip                 : string = 'OwnShip';
  pct_Platform               : string = 'Platform';
  pctPopulated_Place         : string = 'Populated_Place';
  pctPort                    : string = 'Port';
  pctRiser                   : string = 'Riser';
  pctRotaryWing              : string = 'RotaryWing';
  pctSearchCenter            : string = 'SearchCenter';
  pctSearchCentre            : string = 'SearchCentre';
  pctSinker                  : string = 'Sinker';
  pctSonobuoy                : string = 'Sonobuoy';
  pctSonoMonitorCtrl         : string = 'SonoMonitorCtrl';
  pctSonoMonitorOther        : string = 'SonoMonitorOther';
  pctStation                 : string = 'Station';
  pctSubSurfaceAssumedFriend : string = 'SubSurfaceAssumedFriend';
  pctSubSurface              : string = 'SubSurface';
  pctSurface                 : string = 'Surface';
  pctTacticalGridorigin      : string = 'TacticalGridorigin';
  pctTaskGroup               : string = 'TaskGroup';
  pctTorpedo                 : string = 'Torpedo';
  pctWayPoint                : string = 'WayPoint';
  pctWeaponEntryPoint        : string = 'WeaponEntryPoint';
  pctWpnDropPoint            : string = 'WpnDropPoint';
  pctWreck                   : string = 'Wreck';
  pctAmphibious              : string = 'Amphibious';  //mk 03052012

  //Non Realtime Runtime Platform type
  nrpPoint    = 1;  nrpsPoint = 'Non real Time Point Track';
  nrpBearing  = 2;  nrpsBearing = 'Non Real Time Bearing Track';
  nrpArea     = 3;  nrpsArea = 'Non Real Time Area of Probability';
  nrpSpecial  = 4;  nrpsSpecial = 'Special Point';

  /// vehicle misc data
  /// vehicle domain
  vhdAir        = 0;        vhdsAir         = 'Air';
  vhdSurface    = 1;        vhdsSurface     = 'Surface';
  vhdSubsurface = 2;        vhdsSubsurface  = 'Subsurface';
  vhdLand       = 3;        vhdsLand        = 'Land';
  vhdAmphibious = 4;        vhdsAmphibious  = 'Amphibious'; //mk oper vhdGeneral - vhdAmphibious
  vhdWreck      = 5;        vhdsWreck       = 'Wreck';
  vhdGeneral    = 6;        vhdsGeneral     = 'General';    //mk oper vhdAmphibious - vhdGeneral
  vhdGrpPersonel= 7;        vhdsGrpPersonel = 'GRPPersonel';

  /// vehicle category
  vhcOther      = 0;        vhcsOther       = 'Other';
  vhcCombatant  = 1;        vhcsCombatant   = 'Combatant';
  vhcNonCombat  = 2;        vhcsNonCombat   = 'Non Combat';
  vhcNonNaval   = 3;        vhcsNonNaval    = 'Non Naval';
  vhcSubmarine  = 4;        vhcsSubmarine   = 'Submarine';
  vhcSubWeapon  = 5;        vhcsSubWeapon   = 'SubWeapon';
  vhcNonSubmarine = 6;      vhcsNonSubmarine= 'Non Submarine';
  vhcMilittary  = 7;        vhcsMilittary   = 'Milittary';
  vhcCivilian   = 8;        vhcsCivilian    = 'Civilion';
  vhcAirWeapon  = 9;        vhcsAirWeapon   = 'Air Weapon';
  vhcLandAmphibi  = 10;     vhcsLandAmphibi = 'Land Amphibi';
  vhcGrpPersonel = 11;      vhcsGrpPersonel = 'GRPPersonel';

  /// vehicle type
  vhtFighter      = 0;      vhtsFighter       = 'Fixed Wing, Fighter';
  vhtStrikeBomber = 1;      vhtsStrikeBomber  = 'Fixed Wing, Strike/Bomber';
  vhtFixed        = 2;      vhtsFixed         = 'Fixed Wing, ASW/MP';
  vhtFixedEW      = 3;      vhtsFixedEW       = 'Fixed Wing, EW';
  vhtRotaryAttack = 4;      vhtsRotaryAttack  = 'Rotary Wing, Attack';
  vhtRotaryASW    = 5;      vhtsRotaryASW     = 'Rotary Wing, ASW';
  vhtFixedSurv    = 6;      vhtsFixedSurv     = 'Fixed Wing, Surveillance/AEW';
  vhtFixedRec     = 7;      vhtsFixedRec      = 'Fixed Wing, Reconnaissance';
  vhtSeaPlane     = 8;      vhtsSeaPlane      = 'Seaplane';
  vhtMissile      = 9;      vhtsMissile       = 'Missile';
  vhtAirCarrier   = 10;     vhtsAirCarrier    = 'Aircraft Carrier (CV/CVN)';
  vhtCruiseGuided = 11;     vhtsCruiseGuided  = 'Cruiser, Guided Missile (CG/CGN)';
  vhtDestroGuided = 12;     vhtsDestroGuided  = 'Destroyer, Guided Missile (DDG)';
  vhtFrigatGuided = 13;     vhtsFrigatGuided  = 'Frigate, Guided Missile (FFG)';
  vhtDestroyer    = 14;     vhtsDestroyer     = 'Destroyer (DD)';
  vhtFrigate      = 15;     vhtsFrigate       = 'Frigate (FF)';
  vhtMineWarfare  = 16;     vhtsMineWarfare   = 'Warfare';
  vhtPatrolCraft  = 17;     vhtsPatrolCraft   = 'Patrol Craft (PT/PTG)';
  vhtMerchant     = 18;     vhtsMerchant      = 'Merchant';
  vhtUtilityVess  = 19;     vhtsUtilityVess   = 'Utility Vessel';
  vhtSurfOther    = 20;     vhtsSurfOther     = 'Surface Other';
  vhtNuclearBalis = 21;     vhtsNuclearBalis  = 'Nuclear, Ballistic Missile (SSBN)';
  vhtAuxiliary    = 22;     vhtsAuxiliary     = 'Auxiliary';
  vhtNuclearAtt   = 23;     vhtsNuclearAtt    = 'Nuclear, Attack (SSN)';
  vhtNuclearGuided= 24;     vhtsNuclearGuided = 'Nuclear, Guided Missile (SSGN)';
  vhtDieselAttack = 25;     vhtsDieselAttack  = 'Diesel, Attack (SSK)';
  vhtDieselGuided = 26;     vhtsDieselGuided  = 'Diesel, Guided Missile (SSG)';
  vhtBaterySurf   = 27;     vhtsBaterySurf    = 'Battery, Surface';  // Battery, Surface-to-Air Missile?
  vhtBateryMissile= 28;     vhtsBateryMissile = 'Battery, Missile';  // Battery, Coastal Defence Missile?
  vhtBateryGun    = 29;     vhtsBateryGun     = 'Battery, Gun';      // Battery, Coastal Defence Artillery?
  vhtAirfield     = 30;     vhtsAirfield      = 'Airfield';
  vhtPlatoonArm   = 31;     vhtsPlatoonArm    = 'Platoon, Armour';
  vhtPlatoonInf   = 32;     vhtsPlatoonInf    = 'Platoon, Infantry';
  vhtBatteryArt   = 33;     vhtsBatteryArt    = 'Battery, Artilery';  // Battery, Anti-Aircraft Artillery?
  vhtPort         = 34;     vhtsPort          = 'Port';
  vhtSpecialCraft = 35;     vhtsSpecialCraft  = 'Special Craft';
  vhtOther        = 40;     vhtsOther         = 'Other';
  vhtAmphibious   = 41;     vhtsAmphibious    = 'Amphibious Warfare';
  vhtRotarySurv   = 45;     vhtsRotarySurv    = 'Rotary Wing, Surveillance/AEW';
  vhtRotaryRec    = 46;     vhtsRotaryRec     = 'Rotary Wing, Reconnaissance';
  vhtChaff        = 47;     vhtsChaff         = 'Chaff';      ///  Chaff
  vhtAirBubble    = 48;     vhtsAirBubble     = 'Air Bubble'; ///  Air Bubble
  vhtSonobuoy     = 49;     vhtsSonobuoy      = 'Sonobuoy';   ///  Sonobuoy
  vhtMine         = 50;     vhtsMine          = 'Mine';       ///  Mine
  vhtTorpedo      = 51;     vhtsTorpedo       = 'Torpedo';    ///  Torpedo
  vhtGrpPersonel  = 52;     vhtsGrpPersonel   = 'GRPPersonel';

  ///  id belum terdefinisi
  ///  Rotary Wing, Satellite
  ///  Jammer Decoy
  ///  Acoustic Decoy


  {aldy datalink}
  dlbHF     = 1;    dlbHFs  = 'HF';
  dlbUVHF   = 2;    dblUVHF = 'VHF/UHF';

  {order data link}
  odlAdd          = 1;    // add platform to participant, remove from eligible
  odlRemove       = 2;    // remove platform from participant, add platform to eligible
  odlForce        = 3;    // change force datalink
  odlBand         = 4;    // change band datalink
  odlActivate     = 5;
  odlPlay         = 6;
  odlStop         = 7;
  odlPUStatus     = 8;
  odlPool         = 9;
  odlPooledTracks = 10;
  odlRemovePermanently = 11;
  odlPUEMCONActivated = 12;
  odlNCSEMCONActivated = 13;

//  {MINE CATEGORY}
//  mcAccoustic = 0;
//  mcImpact = 1;
//  mcMagnetic = 2;
//  mcPressure = 3;

  //Sonar Category
  scsHMS = 'Hull-M0unted';
  scsVDS = 'Variable Depth';
  scsTAS = 'Towed Array';
  scsDipping = 'Dipping';
  scsSonobuoy = 'Sonobuoy';

  //EO Sonar Category
  eocsOptical = 'EO Sensor (Optical)';
  eocsLaserSensor = 'Laser Sensor';
  eocsInfrared = 'IR Sensor (Infrared)';

  //force color
  fcRed = 0;
  fcBlue = 1;
  fcGreen = 2;
  fcAmber = 3;
  fcNoForce = 4;

type
  TWeapoonCategory = (
      wcMissileAirToSurfaceSubsurface,
      wcMissileSurfaceSubsurfaceToSurfaceSubsurface,
      wcMissileSurfaceSubsurfaceToAir,
      wcMissileAirToAir,
      wcMissileLandAttack,
      wcTorpedoStraigth,
      wcTorpedoActiveAcoustic,
      wcTorpedoPassiveAcoustic,
      wcTorpedoWireGuided,
      wcTorpedoWakeHoming,
      wcTorpedoActivePassive,
      wcTorpedoAirDropped,
      wcMine,
      wcGunCIWS, wcGunGun, wcGunRocket,
      wcBomb, wcVectac,
      wcHybrid);

  TTorpedoLaunchMethod = (tlmAimpoint, tlmBearing, tlmAimBearing, tlmDirect);
  TEnduranceType = ( entFuel, entTime, entRange, entUnlimited );
  TMovementType  = ( mtStop, mtMinimum, mtMinimumCruise, mtCruise, mtCruiseHigh, mtHigh, mtHighMaximum, mtMaximum );
  TMotionType    = ( motMobile, motFixed, motDriftCurrent );

  TPlatformPropertyCategory = (ppcDamagePercent, ppcSpeed);
  TOnPlatformPropertyChange = procedure (Sender : TObject; Category : TPlatformPropertyCategory;
                                         Value : Variant ) of object;

  TWeaponPropertyCategory = (wpcQuantity, wpcStatus);
  TOnWeaponPropertyChange = procedure (Sender : TObject; Category : TWeaponPropertyCategory;
                                         Value : Variant ) of object;

  TDevicePropertyCategory = (dpcStatus);
  TOnDevicePropertyChange = procedure (Sender : TObject; Category : TDevicePropertyCategory;
                                         Value : Variant ) of object;

  TWeaponStatus = ( wsAvailable, wsUnavailable, wsDamaged,
                    wsTooHigh, wsFiring );

  TModifCommStatus = (mcsCreate, mcsOff,
                      mcsChangeBand, mcsChangeLabel, mcsChangeSecure,
                      mcsAdd, mcsRemove,
                      mcsInterference);
  TModifCommInterference = (mcsClear, mcsJamming, mcsNoise, mcsTones);

  TDetectedSensorType = (dstNone, dstRadar,dstSonar, dstVisual);
  TDetectedSensors = set of TDetectedSensorType;
  TDetectedObjectType = (dotPlatform, dotMissile, dotTorpedo);

  /// Event
  TOnSensorDetect = procedure (aSensor : TObject; aTrack : TObject; aValue : boolean; aIFF : Boolean) of object;
  TOnSensorRemove = procedure (aSensor : TObject; aTrack : TObject; aValue : boolean) of object; //choco
  TOnWeaponHit    = procedure (aWeapon : TObject; aTrack : TObject; aValue : integer; freeWeapon : Boolean = True) of object;
  TOnWeaponOut    = procedure (aWeapon : TObject; aValue : Byte) of object; //ham 04052012
  TOnWeaponLaunch = procedure (aWeapon : TObject; aTrack : TObject) of object;
  TOnWeaponTargetChange = procedure (aWeapon : TObject; aTrack : TObject) of object;
  TOnHybridlaunch = procedure (aWeapon : TObject) of object; //far 4 march 2013
  TOnSyncTarget   = procedure (aWeapon, aTarget : TObject) of object;
  TOnDeploySonar = procedure (VIndex, SensorType, SensorIndex, ControlMode, Status : integer) of object; //andi
  TOnUpdateFormSonar = procedure (VIndex, SensorType, SensorIndex, Counter, param, Order : Integer) of object; //andi
  TOnUpdateActualCable = procedure (VIndex, SensorType, SensorIndex : integer; aValue : Double)of object;
  TOnSonobuoyPassiveDetect = procedure (aSonobuoy, aTarget: TObject; Value : Byte) of object;
  TOnPropertyIntChange = procedure (Sender : TObject;Props : TPropsID; Value : Integer) of object;

  TJammedObjectType = (jotFCR, jotMissile);
  TJammedObjectParameter = record
    PJammedObjectID : Integer;
    PJammedObjectOwnerID : Integer;
    PJammedObjectType : TJammedObjectType;
  end;

  TOnSDJammingSuccess = procedure(Sender : TObject; JammedOject : TJammedObjectParameter) of object;
  TOnSDJammingFailed  = procedure(Sender : TObject; reason : String) of object;
  TOnRNJammingSuccess = procedure(Sender : TObject; JammedOject : TJammedObjectParameter; Value : boolean) of object;
  //TOnRNJammingFailed  = procedure(Sender : TObject; JammedOject : TJammedObjectParameter) of object;

  TOnIFFDetect = procedure (aShip, aSensor, aTarget : TObject; Value, value2 : boolean; mode1,mode2,mode3,mode3C : string) of object;
  TOnModeSearchIFF = procedure (aSensor : TObject; value : byte) of object;
  TEventAddWaypoint = procedure (Long,Lat : double) of object;
  TEventEditWaypoint = procedure (Long,Lat : double) of object;
  TEventToolMapUsed = procedure (ASender: TObject; ToolNum: Smallint;
            X1, Y1, X2, Y2, Distance: double; Shift, Ctrl: WordBool;
            var EnableDefault: WordBool) of object;

  TEventJumpToTime = procedure (const aTime : TTime) of object;

  /// ---- ESM EVENT -----
  TOnVarianceESM = procedure (aESMtrack : TObject; aTrack : TObject) of object;

  //--- rec ESM detail show ----
  TRecDetailESM = record
    Bearing_Data_Capability : ByteBool;
    Class_Data_Capability   : ByteBool;
    Name_Data_Capability    : ByteBool;
    Track_ID                : ByteBool;
  end;

  /// ---- EMCON ----
  TEMCON_Catgr = (srcRadar, FCRadar, IFF, Jamming, Lasers, HFComm, VHFComm,
                  HFDatalink, VHFDatalink, UWT, ActiveSonar, AcousticDecoy);
  TEMCON_OperasionalStatus = (EmconOn, EmconOff);
  TEMCON_ChekBoxStatus = (UnChecked, Checked);
  // --- EMCON STATUS DATALINK ---//
  TEMCON_HFDataLinkVehicle = (EmconHFDatalinkOn, EmconHFDatalinkOff);
  TEMCON_UHFVHFDataLinkVehicle = (EmconUHFVHFDatalinkOn, EmconUHFVHFDatalinkOff);

  /// ---- RADAR ----
  /// sopDamage  : Damaged radars will be unable to detect targets.
  /// sopEMCON   : Radars which are in EMCON status are incapable of transmitting
  ///              and hence will be unable to detect targets until
  ///              the EMCON status is revoked.
  /// sopTooDeep : Radars assigned to submarines may indicate the too deep
  ///              status which means the submarine has exceeded the
  ///              maximum submerged operating depth of the radar
  /// ---- SONAR ----
  /// sopTooDeep  : appears when the sonar is at a depth which exceeds
  ///               the maximum operating depth of the sonar.
  /// sopTooFast  : indicates that the platform is moving at a speed which
  ///               exceeds the maximum speed at which the sonar is still operational.
  /// sopTooSlow  : indicates that the platform is moving too slow for
  ///               a towed array sonar to be operational or make detections.
  /// sopKinked   : indicaTT3EOSensortes that the towed array sonar cable has become kinked.
  /// sopTooHigh  : the air platform employing the dipping sonar is at
  ///               an altitude such that the sonar is above the surface of the water.
  TSensorOperationalStatus = (sopOn, sopOff, sopActive, sopPassive, sopDamage,
                              sopTooDeep, sopEMCON, sopUp, sopDown,
                              sopStowed, sopStowing, sopDeployed, sopDeploying,
                              sopTooFast, sopTooSlow, sopKinked, sopTooHigh,
                              sopUnkinked, sopOffIFF);
  TOnSensorOperationalStatus = procedure (Sender : TObject; Mode : TSensorOperationalStatus) of object;

  /// Used to set the operating mode (activation) of radars
  TRadarControlMode = (rcmOff, rcmTrack, rcmSearchTrack, rcmEmcon);
  TOnRadarControlMode = procedure (Sender : TObject; Mode : TRadarControlMode) of object;

  ///-------- Radar Noise Jammer ------------
  TRNJammOperasionalStatus = (JammedOn, JammedOff);
  ///--------- SONAR -------------
  /// Used to set the sonar operating mode (activation)
  TSonarControlMode = (scmOff, scmPassive, scmActive, scmEmcon, scmDeployed, scmDeploying,
                       scmStowed, scmStowing); //17042012 mk
  TOnSonarControlMode = procedure (Sender : TObject; Mode : TSonarControlMode) of object;
  // Sonar category
  TSonarCategory       = (scHMS, scVDS, scTAS, scDipping, scSonobuoy);
  TEOCategory          = (eocOptical, eocLaserSensor, eocInfrared);
  TSensorOperatingMode = (somActive, somPassive, somActivePassive, somPassiveIntercept);
  TSonarTransmissionLossType = (Cylindrical, Spherical);

  /// rscFull    : Full coverage results in radar detections within 360°
  ///              around the controlled platform.
  /// rscPartial : Partial coverage will result in radar detection
  ///              occurring only within the coverage arc specified
  /// Scan sector controls will only be available if the radar has been
  /// defined as sector-scan capable.
  TRadarScanSector  = (rscFull, rscPartial);

  /// Waypoint termination action category
  ///  wtLH : continue on last heading and ground speed
  ///  wtTH : Continue on terminal heading (requires a terminal heading in degrees).
  ///  wtRP : Repeat the pattern, using the current position as the anchor point
  ///  wtRP2: Repeat the pattern, reusing the existing waypoint positions.
  ///  wtRB : Return to launching base.
  ///  wtRM : Remove platform from exercise (instructor function only);
  TWaypointTermination = (wtLH, wtTH, wtRP,wtRP2, wtRB, wtRM);

  TMissileFiringMode  = (mfmRBL, mfmRBLW, mfmBOL, mfmBOLW, mfmDirect, mfmAimpoint, mfmBearing);
  TMissileEngagement  = (meRipple, meSTOT, meDTOT);

  //nando
  //TMissileKind                = (msl_SS, msl_SA, msl_AA, msl_AS, msl_LA, msl_HM, msl_TM);
  TPopUpMode                  = (ppPopUP, ppSeaSkim);
  //TMissileAir_TargetingMethod = (MA_Direct, MA_AIMPOINT, MA_BEARING);

  TOnWaypointChange = procedure (id : Integer) of object; //choco
  TOnNextWaypointChangeToNFS = procedure (aShipID: Integer;
    aSpeed, aBearing: Double) of object; //choco
  /// Record for waypoint
  ///
  TRecWaypoint = record
    Name   : string[20];
    Behav  : TObject;
    Events : TList;
  end;

  TRecWeaponWaypoint = record
    Name   : string[20];
    Behav  : TObject;
    Events : TList;
  end;

  /// USed to set IFF operating status
  TIFFOperationStatus = (oosOn, oosOff, oosEMCON, oosDamaged, oosTooDeep);
  TESMOperationalStatus = (eosOn, eosOff, eosTooDeep, eosDamaged);

  // Missile guide type
  TMissileGuidanceType = (mgtSARH, mgtTARH,mgtIRHoming, mgtAntiRadiation,
                          mgtStraigth, mgtHybrid);

  /// Vehicle Guidance Type :
  TVehicleGuidanceType = ( vgtNone,
                           vgtStraightLine,  vgtHelm,  vgtCircle, {vgtCircleOnPosition,}
                           vgtStation, {vgtStationOnPosition,}
                           vgtZigzag, vgtSinuation, vgtFormation, vgtEvasion,
                           vgtWaypoint, vgtOutrun,vgtEngagement, vgtShadow,
                           vgtReturnToBase );

  TPictureFilterType = (pftAir, pftSurface, pftSubsurface, pftLand, pftAmphibious,
    pftWreck, pftGeneral, pftPersonal, pftNone, pftAll);

  TPlatformOrderedControl = (pocSpeed, pocAltitude, pocHeading);
  TOnPlatformOrderedControl = procedure (Sender : TObject;
                                       Order : TPlatformOrderedControl;
                                       Value : double) of object;
  TOnWeaponSetSalvo = procedure (Sender : TObject; Salvo : integer) of object;
  TOnPlatformFreeMe = procedure (Sender : TObject;Value : boolean) of object;

  TDamageItemType = (diOverall, diMaxSpeed, diSensor, diECM, diWeapon, diCommm, diHelm,
   diPropulsion );

  TNotifyDamageChange =  procedure (sender: TObject;
     const dmgType: TDamageItemType) of object;

  TOnCollision = procedure(Sender : TObject) of object;



  ////====================================================
  TRecAcoustic_Decoy_Definition =  record
    Decoy_Index                  : integer;
    Decoy_Identifier             : string[60];
    Acoustic_Intensity_Increase  : single;
  end;

  ////====================================================
  TRecAcoustic_Decoy_On_Board =  record
    Acoustic_Instance_Index  : integer;
    Instance_Identifier      : string[80];
    Instance_Type            : byte;
    Quantity                 : integer;
    Vehicle_Index            : integer;
    Decoy_Index              : integer;
  end;

  ////====================================================
  TRecAcoustic_Decoy_POH_Modifier =  record
    Decoy_Index            : integer;
    Torpedo_Guidance_Type  : byte;
    Aspect_Angle           : byte;
    POH_Modifier           : single;
  end;

  ////====================================================
  TRecAir_Bubble_Definition =  record
    Air_Bubble_Index       : integer;
    Air_Bubble_Identifier  : string[60];
    Platform_Domain        : byte;
    Platform_Category      : byte;
    Platform_Type          : byte;
    Max_Acoustic_Cross     : single;
    Dissipation_Time       : single;
    Ascent_Rate            : single;
    Descent_Rate           : single;
  end;

  ////====================================================
  TRecAir_Bubble_Mount =  record
    Air_Bubble_Instance_Index  : integer;
    Instance_Identifier        : string[80];
    Instance_Type              : byte;
    Bubble_Qty_On_Board        : integer;
    Vehicle_Index              : integer;
    Air_Bubble_Index           : integer;
  end;

  ////====================================================
  TRecAsset_Deployment_Definition =  record
    Deployment_Index       : integer;
    Deployment_Identifier  : string[60];
    Scenario_Index         : integer;
  end;

  ////====================================================
  TRecBlind_Zone_Definition =  record
    Blind_Zone_Index       : integer;
    Blind_Zone_Type        : byte;
    BlindZone_Number       : byte;
    FCR_Instance_Index     : integer;
    ESM_Instance_Index     : integer;
    EO_Instance_Index      : integer;
    Visual_Instance_Index  : integer;
    Point_Effect_Index     : integer;
    Fitted_Weap_Index      : integer;
    Sonar_Instance_Index   : integer;
    Radar_Instance_Index   : integer;
    Start_Angle            : single;
    End_Angle              : single;
  end;

  ////====================================================
  TRecBomb_Definition =  record
    Bomb_Index           : integer;
    Bomb_Identifier      : string[60];
    Bomb_Type            : byte;
    Lethality            : integer;
    Min_Range            : single;
    Max_Range            : single;
    Anti_Sur_Capable     : byte;
    Anti_SubSur_Capable  : byte;
    Anti_Land_Capable    : byte;
    Anti_Amphibious_Capable: Byte;
  end;

  ////====================================================
  TRecBomb_POH_vs_Range =  record
    List_Index   : integer;
    Bomb_Index   : integer;
    Prob_of_Hit  : single;
    Range        : single;
  end;

  ////====================================================
  TRecChaff_Definition =  record
    Chaff_Index              : integer;
    Chaff_Identifier         : string[60];
    Platform_Domain          : byte;
    Platform_Category        : byte;
    Platform_Type            : byte;
    Max_Radar_Cross          : single;
    Bloom_Time               : integer;
    Max_Dissipation_Time     : integer;
    Min_Dissipation_Time     : integer;
    Descent_Rate             : single;
    Max_Radius               : single;
    Max_Radar_Attenuation    : single;
    Radar_Affect_Lower_Freq  : single;
    Radar_Affect_Upper_Freq  : single;
  end;

  ////====================================================
  TRecChaff_Launcher_On_Board =  record
    Vehicle_Index        : integer;
    Launcher_Number      : byte;
    Launcher_Angle       : single;
    Launcher_Kind        : byte;
    Def_Bloom_Range      : single;
    Def_Bloom_Altitude   : single;
    Max_Range            : single;
    Min_Range            : single;
    Max_Elevation        : single;
    Min_Elevation        : single;
    Average_Launch_Spd   : single;
  end;

  ////====================================================
  TRecChaff_On_Board =  record
    Chaff_Instance_Index   : integer;
    Instance_Identifier    : string[80];
    Instance_Type          : byte;
    Chaff_Qty_On_Board     : integer;
    Vehicle_Index          : integer;
    Chaff_Index            : integer;
  end;

  ////====================================================
  TRecCloud_Effects_On_ESM =  record
    Radar_Frequency  : single;
    Cloud_0_Effect   : single;
    Cloud_1_Effect   : single;
    Cloud_2_Effect   : single;
    Cloud_3_Effect   : single;
    Cloud_4_Effect   : single;
    Cloud_5_Effect   : single;
    Cloud_6_Effect   : single;
  end;

  ////====================================================
  TRecCloud_Effects_On_Radar =  record
    Radar_Frequency  : single;
    Cloud_0_Effect   : single;
    Cloud_1_Effect   : single;
    Cloud_2_Effect   : single;
    Cloud_3_Effect   : single;
    Cloud_4_Effect   : single;
    Cloud_5_Effect   : single;
    Cloud_6_Effect   : single;
  end;

  ////====================================================
  TRecConditional_Event_Definition =  record
    Conditional_Event_Index      : integer;
    Conditional_Identifier       : string[60];
    Conditional_Event_Type       : byte;
    Response_Speed               : byte;
    Response_Altitude            : byte;
    Response_Range               : single;
    Cleared_2_Attack             : byte;
    Check_Fuel                   : byte;
    Fuel_Condition               : byte;
    Fuel_Threshold               : single;
    Check_Weapons                : byte;
    Weapons_Condition            : byte;
    Weapons_Inventory            : integer;
    Check_Damage                 : byte;
    Damage_Condition             : byte;
    Current_Damage_State         : single;
    Hit_By_Weapon                : byte;
    Lock_By_FCR_or_Weap          : byte;
    Check_Target_Domain          : byte;
    Target_Plat_Domain           : byte;
    Check_Target_Type            : byte;
    Target_Plat_Type             : byte;
    Check_Target_Threat          : byte;
    Target_Plat_Threat_Class     : byte;
    Check_Target_Duration        : byte;
    Target_Duration_State        : byte;
    Target_Range_Duration        : integer;
    Check_Target_Range           : byte;
    Target_Range_Condition       : byte;
    Target_Plat_Range            : single;
    Check_Target_Delta           : byte;
    Target_Delta_Condition       : byte;
    Target_Plat_Altitude_Delta   : single;
    Check_Target_Altitude        : byte;
    Target_Altitude_Condition    : byte;
    Target_Platform_Altitude     : single;
    Check_Target_Speed           : byte;
    Target_Speed_Condition       : byte;
    Target_Platform_Speed        : single;
    Check_Own_Position           : byte;
    Own_In_Geo                   : byte;
    Check_Encountered_Position   : byte;
    Encountered_In_Geo           : byte;
    Geo_Area_Index               : integer;
  end;

  ////====================================================
  TRecConditional_Event_List =  record
    Event_List_Index       : integer;
    Event_List_Identifier  : string[60];
  end;

  ////====================================================
  TRecCubicle_Group =  record
    Group_Index        : integer;
    Deployment_Index   : integer;
    Group_Identifier   : string[60];
    Force_Designation  : byte;
    Tracks_Block       : byte;
    Track_Block_Start  : integer;
    Track_Block_End    : integer;
    Zulu_Zulu          : integer;
  end;

  ////====================================================
  TRecCubicle_Group_Assignment =  record
    Platform_Instance_Index  : integer;
    Group_Index              : integer;
    Command_Priority         : integer;
    Deployment_Index         : integer;
  end;

  ////====================================================
  TRecCubicle_Group_Channel_Assgnmnt =  record
    Group_Index          : integer;
    Channel_Slot         : byte;
    Comms_Channel_Index  : integer;
  end;

  ////====================================================
  TRecDIS_Category_Definition =  record
    DIS_Category_Index         : integer;
    DIS_Category_Enumeration   : integer;
    DIS_Category_Identifier    : string[60];
    DIS_Country_Index          : integer;
  end;

  ////====================================================
  TRecDIS_Country_Definition =  record
    DIS_Country_Index        : integer;
    DIS_Country_Identifier   : string[60];
  end;

  ////====================================================
  TRecDIS_Domain_Country_Mapping =  record
    DIS_Domain_Index   : integer;
    DIS_Country_Index  : integer;
  end;

  ////====================================================
  TRecDIS_Domain_Definition =  record
    DIS_Domain_Index       : integer;
    DIS_Domain_Identifier  : string[60];
  end;

  ////====================================================
  TRecDIS_Kind_Definition =  record
    DIS_Kind_Index       : integer;
    DIS_Kind_Identifier  : string[60];
  end;

  ////====================================================
  TRecDIS_Kind_Domain_Mapping =  record
    DIS_Kind_Index     : integer;
    DIS_Domain_Index   : integer;
  end;

  ////====================================================
  TRecDIS_Specific_Definition =  record
    DIS_Specific_Index             : integer;
    DIS_Specific_Enumeration       : integer;
    DIS_Specific_Identifier        : string[60];
    DIS_Subcategory_Index          : integer;
    SARH_POH_Modifier              : single;
    CG_POH_Modifier                : single;
    TARH_POH_Modifier              : single;
    IR_POH_Modifier                : single;
    AR_POH_Modifier                : single;
    Active_Acoustic_Tor_POH_Mod    : single;
    Passive_Acoustic_Tor_POH_Mod   : single;
    Active_Passive_Tor_POH_Mod     : single;
    Wake_Home_POH_Modifier         : single;
    Wire_Guide_POH_Modifier        : single;
    Mag_Mine_POH_Modifier          : single;
    Press_Mine_POH_Modifier        : single;
    Impact_Mine_POH_Modifier       : single;
    Acoustic_Mine_POH_Modifier     : single;
    Engagement_Range               : single;
    Damage_Capacity                : integer;
    Lethality                      : integer;
    Prob_of_Hit                    : single;
  end;

  ////====================================================
  TRecDIS_Subcategory_Definition =  record
    DIS_Subcategory_Index        : integer;
    DIS_Subcategory_Enumeration  : integer;
    DIS_Subcategory_Identifier   : string[60];
    DIS_Category_Index           : integer;
  end;

  ////====================================================
  TRecDefault_Definition =  record
    Defaults_Index                   : Integer;
    Defaults_Identifier              : string;
    Init_AOP                         : integer;
    AOP_Decrease_Rate                : single;
    Sono_Num_2_Initiate              : integer;
    Trans_Range_2_Air                : single;
    Trans_Range_2_Sur                : single;
    Init_AOP_Modifier                : single;
    Visual_Detect_Range              : single;
    Known_Cross_Section              : single;
    Max_Visual_Range                 : single;
    EO_Detection_Factor              : single;
    Visual_Detection_Factor          : single;
    EO_Ident_Factor                  : single;
    Visual_Ident_Factor              : single;
    Sine_Period_Distance             : single;
    Sine_Period_Amplitude            : single;
    Short_Period_Distance            : single;
    Short_Period_Amplitude           : single;
    Long_Period_Distance             : single;
    Long_Period_Amplitude            : single;
    Very_Period_Distance             : single;
    Very_Period_Amplitude            : single;
    Air_Lost_Time                    : integer;
    Sur_Lost_Time                    : integer;
    Sub_Lost_Time                    : integer;
    ESM_Bearing_Lost_Time            : integer;
    Sonar_Bearing_Lost_Time          : integer;
    Stale_Air_Time                   : integer;
    Stale_Sur_Time                   : integer;
    Stale_Sub_Time                   : integer;
    Stale_ESM_Bearing_Time           : integer;
    Stale_Sonar_Bearing_Time         : integer;
    POD_Check_Time                   : integer;
    TMA_Range_Rate                   : single;
    Frequency_Identity_Weighting     : single;
    PRF_Identity_Weighting           : single;
    Pulsewidth_Identity_Weighting    : single;
    Scan_Period_Identity_Weighting   : single;
    Crew_Eff_Heading_Error           : single;
    Crew_Eff_Speed_Error             : single;
    TMA_Relative_Bearing_Rate        : single;
    Passive_Sonar_Max_Course_Error   : single;
    Passive_Sonar_Max_Speed_Error    : single;
    ESM_Error_Corr_Rate              : single;
    Chaff_Altitude_Threshold         : single;
    MHS_Flash_Delay_Time             : single;
    MHS_Immed_Delay_Time             : single;
    MHS_Priority_Delay_Time          : single;
    MHS_Routine_Delay_Time           : single;
    Max_UWT_Range                    : single;
    Max_HF_Detect_Range              : single;
    Max_UHF_Detect_Range             : single;
    Max_IFF_Range                    : single;
    Track_History_Air_Sample_Rate    : integer;
    Track_History_Air_Max_Points     : integer;
    Track_History_Sample_Rate        : integer;
    Track_History_Max_Points         : integer;
    Auto_Gun_Interception_Range      : single;
    Auto_Gun_Threshold_Speed         : single;
    Clutter_Reduction_Scale          : single;
    Jam_Break_Lock_Time_Interval     : integer;
    Missile_Reacquisition_Time       : integer;
    Seduction_Bloom_Altitude         : integer;
    Seduction_Bloom_Range            : single;
    HF_Datalink_MHS_Trans_Freq       : single;
    UHF_Datalink_MHS_Trans_Freq      : single;
    Max_Num_Radar_Classes            : integer;
    Max_Num_Sonar_Classes            : integer;
    Max_Num_Sonobuoy_Classes         : integer;
    Max_Num_EO_Classes               : integer;
    Max_Num_ESM_Classes              : integer;
    Max_Num_MAD_Classes              : integer;
    Max_Num_Fitted_Weap_Classes      : integer;
    Max_Num_Point_Effect_Classes     : integer;
    HAFO_Min_Range                   : single;
    HAFO_Max_Range                   : single;
    Engage_Guide_Stale_Target_Time   : integer;
    Outrun_Guide_Stale_Target_Time   : integer;
    Shadow_Guide_Stale_Target_Time   : integer;
    Sonobuoy_Air_Deceleration        : single;
    Sonobuoy_Air_Descent_Rate        : single;
    Depth_Charge_Air_Deceleration    : single;
    Depth_Charge_Air_Descent_Rate    : single;
    Missile_Sea_Check_Interval       : integer;
  end;

  ////====================================================
  TRecDefault_IFF_Mode_Code =  record
    Force_Designation  : byte;
    IFF_Device_Type    : byte;
    IFF_Mode           : byte;
    IFF_Code           : integer;
    Mode_State         : byte;
  end;

  ////====================================================
  TRecDefensive_Jammer_Definition =  record
    Defensive_Jammer_Index       : integer;
    Defensive_Jammer_Identifier  : string[60];
    Jammer_TARH_Capable          : byte;
    Jammer_SARH_Capable          : byte;
    Type_A_Seducing_Prob         : single;
    Type_B_Seducing_Prob         : single;
    Type_C_Seducing_Prob         : single;
    ECM_Type                     : byte;
  end;

  ////====================================================
  TRecDefensive_Jammer_On_Board =  record
    Defensive_Jammer_Instance_Index  : integer;
    Instance_Identifier              : string[80];
    Instance_Type                    : byte;
    Vehicle_Index                    : integer;
    Defensive_Jammer_Index           : integer;
  end;

  ////====================================================
TRecECCM_Type =  record
  ECCM_Type_Index  : byte;
  ECCM_Type_Name   : string[50];
end;

////====================================================
  TRecEO_Detection_Definition =  record
    EO_Index             : integer;
    Class_Identifier     : string[60];
    Sensor_Type          : byte;
    Detection_Range      : single;
    Known_Cross_Section  : single;
    Max_Range            : single;
    Scan_Rate            : single;
    Num_FC_Channels      : byte;
  end;

  ////====================================================
  TRecEO_On_Board =  record
    EO_Instance_Index    : integer;
    Instance_Identifier  : string[80];
    Instance_Type        : byte;
    Vehicle_Index        : integer;
    EO_Index             : integer;
    Antenna_Height       : single;
  end;

  ////====================================================
  TRecESM_Definition =  record
    ESM_Index                        : integer;
    Class_Identifier                 : string[60];
    Low_Detect_Frequency1            : double;
    High_Detect_Frequency1           : double;
    Low_Detect_Frequency2            : double;
    High_Detect_Frequency2           : double;
    ESM_Classification               : byte;
    Emitter_Detect_Range_Factor      : single;
    Comm_Intercept_Capable           : byte;
    Frequency_Identify_Range         : double;
    PRF_Identify_Range               : single;
    Pulsewidth_Identify_Range        : single;
    Scan_Period_Identify_Range       : single;
    Sector_Blank_Detection_Factor    : single;
    Identification_Period            : single;
    Classification_Period            : single;
    Minimum_Bearing_Error_Variance   : single;
    Initial_Bearing_Error_Variance   : single;
  end;

  ////====================================================
  TRecESM_On_Board =  record
    ESM_Instance_Index         : integer;
    Instance_Identifier        : string[80];
    Instance_Type              : byte;
    Vehicle_Index              : integer;
    ESM_Index                  : integer;
    Rel_Antenna_Height         : single;
    Max_Operational_Depth      : single;
    Submerged_Antenna_Height   : single;
  end;

  ////====================================================
  TRecExternal_Communication_Channel =  record
    Comms_Channel_Index    : integer;
    Resource_Alloc_Index   : integer;
    Channel_Number         : integer;
    Channel_Identifier     : string[60];
    Comms_Band             : byte;
    Channel_Freq           : double;
    Channel_Security       : byte;
    Channel_Code           : string[6];
    Channel_Interference   : TModifCommInterference;
  end;

  ////====================================================
  TRecFCR_Definition =  record
    FCR_Index                    : integer;
    Radar_Identifier             : string[60];
    Radar_Emitter                : string[60];
    Frequency                    : single;
    Scan_Rate                    : single;
    Radar_Power                  : single;
    Pulse_Rep_Freq               : single;
    Pulse_Width                  : single;
    Max_Unambig_Detection_Range  : single;
  end;

  ////====================================================
  TRecFCR_On_Board =  record
    FCR_Instance_Index   : integer;
    Instance_Identifier  : string[80];
    Instance_Type        : byte;
    Vehicle_Index        : integer;
    Radar_Index          : integer;
    Rel_Antenna_Height   : single;
  end;

  ////====================================================
  TRecFitted_Weap_Launcher_On_Board =  record
    Fitted_Weap_Index        : integer;
    Launcher_Type            : byte;
    Launcher_Angle_Required  : byte;
    Launcher_Angle           : integer;
    Launcher_Qty             : Integer;
    Launcher_Max_Qty         : integer;
  end;

  ////====================================================
  TRecFitted_Weapon_On_Board =  record
    Fitted_Weap_Index      : integer;
    Instance_Identifier    : string[80];
    Instance_Type          : byte;
    Vehicle_Index          : integer;
    Mount_Type             : byte;
    Launch_Angle           : single;
    Launch_Angle_Required  : byte;
    Quantity               : integer;
    Firing_Delay           : Single;
    Missile_Index          : integer;
    Torpedo_Index          : integer;
    Mine_Index             : integer;
    Hybrid_Index           : integer;
  end;

  ////====================================================
  TRecFloating_Decoy_Definition =  record
    Floating_Decoy_Index       : integer;
    Floating_Decoy_Identifier  : string[60];
    Platform_Domain            : byte;
    Platform_Category          : byte;
    Platform_Type              : byte;
    Length                     : single;
    Width                      : single;
    Height                     : single;
    Front_Radar_Cross          : single;
    Side_Radar_Cross           : single;
    Front_Visual_Cross         : single;
    Side_Visual_Cross          : single;
    Front_Acoustic_Cross       : single;
    Side_Acoustic_Cross        : single;
    Lifetime_Duration          : single;
  end;

  ////====================================================
  TRecFloating_Decoy_On_Board =  record
    Floating_Decoy_Instance_Index  : integer;
    Instance_Identifier            : string[80];
    Instance_Type                  : byte;
    Quantity                       : integer;
    Vehicle_Index                  : integer;
    Floating_Decoy_Index           : integer;
  end;

  ////====================================================
  TRecFormation_Assignment =  record
    Platform_Instance_Index  : integer;
    Formation_Index          : integer;
    Angle_Offset             : single;
    Range_from_Leader        : single;
    Altitude                 : single;
  end;

  TClassFormation_Assignment =  class
    Platform_Instance_Index  : integer;
    Formation_Index          : integer;
    Angle_Offset             : single;
    Range_from_Leader        : single;
    Altitude                 : single;
  end;

  ////====================================================
  TRecFormation_Definition =  record
    Formation_Index        : integer;
    Formation_Identifier   : string[60];
    Force_Designation      : byte;
    Formation_Leader       : integer;
    Angle_Type             : byte;
    Deployment_Index       : integer;
  end;

  ////====================================================
  TRecGame_Area_Definition =  record
    Game_Area_Index          : integer;
    Game_Area_Identifier     : string[60];
    Game_Centre_Lat          : double;
    Game_Centre_Long         : double;
    Game_X_Dimension         : single;
    Game_Y_Dimension         : single;
    Use_Real_World           : byte;
    Use_Artificial_Landmass  : byte;
    Detail_Map               : string[50];
  end;

  ////====================================================
  TRecGame_Cloud_On_ESM =  record
    Defaults_Index   : integer;
    Radar_Frequency  : single;
    Cloud_0_Effect   : single;
    Cloud_1_Effect   : single;
    Cloud_2_Effect   : single;
    Cloud_3_Effect   : single;
    Cloud_4_Effect   : single;
    Cloud_5_Effect   : single;
    Cloud_6_Effect   : single;
  end;

  ////====================================================
  TRecGame_Cloud_On_Radar =  record
    Defaults_Index   : integer;
    Radar_Frequency  : single;
    Cloud_0_Effect   : single;
    Cloud_1_Effect   : single;
    Cloud_2_Effect   : single;
    Cloud_3_Effect   : single;
    Cloud_4_Effect   : single;
    Cloud_5_Effect   : single;
    Cloud_6_Effect   : single;
  end;

  ////====================================================
  TRecGame_Default_IFF_Mode_Code =  record
    Defaults_Index     : integer;
    Force_Designation  : byte;
    IFF_Device_Type    : byte;
    IFF_Mode           : byte;
    IFF_Code           : integer;
    Mode_State         : byte;
  end;

  TTransponderCodeIFF = record
    IFF_Mode : Byte;
    IFF_Code : integer;
  end;

  ////====================================================
  TRecGame_Defaults =  record
    Defaults_Index                   : integer;
    Defaults_Identifier              : string[60];
    Init_AOP                         : integer;
    AOP_Decrease_Rate                : single;
    Sono_Num_2_Initiate              : integer;
    Trans_Range_2_Air                : single;
    Trans_Range_2_Sur                : single;
    Init_AOP_Modifier                : single;
    Visual_Detect_Range              : single;
    Known_Cross_Section              : single;
    Max_Visual_Range                 : single;
    EO_Detection_Factor              : single;
    Visual_Detection_Factor          : single;
    EO_Ident_Factor                  : single;
    Visual_Ident_Factor              : single;
    Sine_Period_Distance             : single;
    Sine_Period_Amplitude            : single;
    Short_Period_Distance            : single;
    Short_Period_Amplitude           : single;
    Long_Period_Distance             : single;
    Long_Period_Amplitude            : single;
    Very_Period_Distance             : single;
    Very_Period_Amplitude            : single;
    Air_Lost_Time                    : integer;
    Sur_Lost_Time                    : integer;
    Sub_Lost_Time                    : integer;
    ESM_Bearing_Lost_Time            : integer;
    Sonar_Bearing_Lost_Time          : integer;
    Stale_Air_Time                   : integer;
    Stale_Sur_Time                   : integer;
    Stale_Sub_Time                   : integer;
    Stale_ESM_Bearing_Time           : integer;
    Stale_Sonar_Bearing_Time         : integer;
    POD_Check_Time                   : integer;
    TMA_Range_Rate                   : single;
    Frequency_Identity_Weighting     : single;
    PRF_Identity_Weighting           : single;
    Pulsewidth_Identity_Weighting    : single;
    Scan_Period_Identity_Weighting   : single;
    Crew_Eff_Heading_Error           : single;
    Crew_Eff_Speed_Error             : single;
    TMA_Relative_Bearing_Rate        : single;
    Passive_Sonar_Max_Course_Error   : single;
    Passive_Sonar_Max_Speed_Error    : single;
    ESM_Error_Corr_Rate              : single;
    Chaff_Altitude_Threshold         : single;
    MHS_Flash_Delay_Time             : single;
    MHS_Immed_Delay_Time             : single;
    MHS_Priority_Delay_Time          : single;
    MHS_Routine_Delay_Time           : single;
    Max_UWT_Range                    : single;
    Max_HF_Detect_Range              : single;
    Max_UHF_Detect_Range             : single;
    Max_IFF_Range                    : single;
    Track_History_Air_Sample_Rate    : integer;
    Track_History_Air_Max_Points     : integer;
    Track_History_Sample_Rate        : integer;
    Track_History_Max_Points         : integer;
    Auto_Gun_Interception_Range      : single;
    Auto_Gun_Threshold_Speed         : single;
    Clutter_Reduction_Scale          : single;
    Jam_Break_Lock_Time_Interval     : integer;
    Missile_Reacquisition_Time       : integer;
    Seduction_Bloom_Altitude         : integer;
    Seduction_Bloom_Range            : single;
    HF_Datalink_MHS_Trans_Freq       : single;
    UHF_Datalink_MHS_Trans_Freq      : single;
    Max_Num_Radar_Classes            : integer;
    Max_Num_Sonar_Classes            : integer;
    Max_Num_Sonobuoy_Classes         : integer;
    Max_Num_EO_Classes               : integer;
    Max_Num_ESM_Classes              : integer;
    Max_Num_MAD_Classes              : integer;
    Max_Num_Fitted_Weap_Classes      : integer;
    Max_Num_Point_Effect_Classes     : integer;
    HAFO_Min_Range                   : single;
    HAFO_Max_Range                   : single;
    Engage_Guide_Stale_Target_Time   : integer;
    Outrun_Guide_Stale_Target_Time   : integer;
    Shadow_Guide_Stale_Target_Time   : integer;
    Sonobuoy_Air_Deceleration        : single;
    Sonobuoy_Air_Descent_Rate        : single;
    Depth_Charge_Air_Deceleration    : single;
    Depth_Charge_Air_Descent_Rate    : single;
    Missile_Sea_Check_Interval       : integer;
  end;

  ////====================================================
  TRecGame_Environment_Definition =  record
    Game_Enviro_Index                : integer;
    Game_Enviro_Identifier           : string[60];
    Game_Area_Index                  : integer;
    Wind_Speed                       : single;
    Wind_Direction                   : single;
    Daytime_Visual_Modifier          : single;
    Nighttime_Visual_Modifier        : single;
    Daytime_Infrared_Modifier        : single;
    Nighttime_Infrared_Modifier      : single;
    Sunrise                          : integer;
    Sunset                           : integer;
    Period_of_Twilight               : integer;
    Rain_Rate                        : byte;
    Cloud_Base_Height                : single;
    Cloud_Attenuation                : byte;
    Sea_State                        : byte;
    Ocean_Current_Speed              : single;
    Ocean_Current_Direction          : single;
    Thermal_Layer_Depth              : single;
    Sound_Velocity_Type              : byte;
    Surface_Sound_Speed              : single;
    Layer_Sound_Speed                : single;
    Bottom_Sound_Speed               : single;
    Bottomloss_Coefficient           : byte;
    Ave_Ocean_Depth                  : single;
    CZ_Active                        : byte;
    Surface_Ducting_Active           : byte;
    Upper_Limit_Surface_Duct_Depth   : single;
    Lower_Limit_Surface_Duct_Depth   : single;
    Sub_Ducting_Active               : byte;
    Upper_Limit_Sub_Duct_Depth       : single;
    Lower_Limit_Sub_Duct_Depth       : single;
    Shipping_Rate                    : byte;
    Shadow_Zone_Trans_Loss           : single;
    Atmospheric_Refract_Modifier     : single;
    Barometric_Pressure              : single;
    Air_Temperature                  : single;
    Surface_Temperature              : single;
    Start_HF_Range_Gap               : single;
    End_HF_Range_Gap                 : single;
  end;

  ////====================================================
  TRecGame_Rainfall_On_ESM =  record
    Defaults_Index   : integer;
    Radar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecGame_Rainfall_On_Missile_Seeker =  record
    Defaults_Index   : integer;
    Guide_Type       : byte;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecGame_Rainfall_On_Radar =  record
    Defaults_Index   : integer;
    Radar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecGame_Rainfall_On_Sonar =  record
    Defaults_Index   : integer;
    Sonar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecGame_Sea_On_Missile_Safe_Altitude =  record
    Defaults_Index                   : integer;
    Sea_State                        : byte;
    Effect_on_Missile_Safe_Altitude  : single;
  end;

  ////====================================================
  TRecGame_Sea_On_Radar =  record
    Defaults_Index   : integer;
    Sea_State        : byte;
    Effect_on_Radar  : single;
  end;

  ////====================================================
  TRecGame_Sea_On_Sonar =  record
    Defaults_Index   : integer;
    Sonar_Frequency  : single;
    Sea_0_Effect     : single;
    Sea_1_Effect     : single;
    Sea_2_Effect     : single;
    Sea_3_Effect     : single;
    Sea_4_Effect     : single;
    Sea_5_Effect     : single;
    Sea_6_Effect     : single;
    Sea_7_Effect     : single;
    Sea_8_Effect     : single;
    Sea_9_Effect     : single;
  end;

  ////====================================================
  TRecGame_Ship_On_Sonar =  record
    Defaults_Index       : integer;
    Sonar_Frequency      : single;
    Distant_Ship_Effect  : single;
    Light_Ship_Effect    : single;
    Medium_Ship_Effect   : single;
    Heavy_Ship_Effect    : single;
  end;

  ////====================================================
  TRecGeo_Area_Definition =  record
    Geo_Area_Index       : integer;
    Geo_Area_Identifier  : string[60];
    Game_Area_Index      : integer;
  end;

  ////====================================================
  TRecGeo_Area_Point =  record
    Geo_Area_Index   : integer;
    Point_Number     : byte;
    Latitude         : double;
    Longitude        : double;
    X_Position       : single;
    Y_Position       : single;
  end;

  ////====================================================
  TRecGlobal_Convergence_Zone =  record
    Converge_Index         : integer;
    Game_Enviro_Index      : integer;
    Occurance_Range        : single;
    Width                  : single;
    Signal_Reduction_Term  : single;
    Increase_per_CZ        : single;
    Max_Sonar_Depth        : single;
  end;

  ////====================================================
  TRecGun_Definition =  record
    Gun_Index                    : integer;
    Gun_Identifier               : string[60];
    Gun_Category                 : byte;
    Rate_of_Fire                 : integer;
    Lethality_per_Round          : integer;
    Min_Range                    : single;
    Max_Range                    : single;
    Air_Min_Range                : single;
    Air_Max_Range                : single;
    Fire_Cntl_Director_Req       : byte;
    Chaff_Capable_Gun            : byte;
    Anti_Sur_Capable             : byte;
    Anti_Land_Capable            : byte;
    Anti_Air_Capable             : byte;
    Anti_Amphibious_Capable      : byte;
    Automode_Capable             : byte;
    FireArms                     : Byte;
    Max_Target_Altitude_Delta    : integer;
    Gun_Average_Shell_Velocity   : single;
    Man_Gun_Max_Elevation        : single;
    Man_Gun_Min_Elevation        : single;
    Man_Gun_Rotation_Rate        : single;
    Man_Gun_Elevation_Rate       : single;
    Man_Gun_Num_Rounds_Per_Load  : integer;
    Man_Gun_Time_to_Reload       : single;
    Man_Gun_Muzzle_Velocity      : single;
    NGS_Capable                  : byte;
    NGS_MinDeflectionError       : single;
    NGS_MaxDeflectionError       : single;
    NGS_MinRangeError            : single;
    NGS_MaxRangeError            : single;
    NGS_MaxDispersionError       : single;
    NGS_MaxDamageRadius          : single;
    NGS_EffectiveRadius          : single;
    NGS_DamageRating             : integer;
  end;

  ////====================================================
  TRecGun_POH_vs_Range =  record
    List_Index   : integer;
    Gun_Index    : integer;
    Target_Type  : byte;
    Prob_of_Hit  : single;
    Range        : single;
  end;

  ////====================================================
  TRecHelicopter_Land_Launch_Limits =  record
    Vehicle_Index                : integer;
    Max_Relative_Wind_Magnitude  : single;
    Max_Turn_Rate_To_Launch      : integer;
    Max_Turn_Rate_To_Land        : integer;
    Max_Landing_Altitude         : single;
    Max_Relative_Speed           : integer;
    Approach_Range               : single;
    Approach_Center_Bearing      : integer;
    Approach_Sector_Width        : integer;
  end;

  ////====================================================
  TRecHosted_Platform =  record
    Slave_Index            : integer;      // primary key table
    Vehicle_Index          : integer;      // vehicle induknya
    Hosted_Vehicle_Index   : integer;      // vehicle embarked
    Quantity               : integer;      // jumlah embarked
  end;

  ////====================================================
  TRecHybrid_Definition =  record
    Hybrid_Index   : integer;
    Missile_Index  : integer;
    Torpedo_Index  : integer;
  end;

  ////====================================================
  TRecIFF_Sensor_On_Board =  record
    IFF_Instance_Index         : integer;
    Instance_Identifier        : string[80];
    Instance_Type              : byte;
    Vehicle_Index              : integer;
    IFF_Capability             : byte;
    Rel_Antenna_Height         : single;
    Submerged_Antenna_Height   : single;
    Max_Operational_Depth      : single;
  end;

  ////====================================================
  TRecInfrared_Decoy_Definition =  record
    Infrared_Decoy_Index       : integer;
    Infrared_Decoy_Identifier  : string[60];
    Platform_Domain            : byte;
    Platform_Category          : byte;
    Platform_Type              : byte;
    Max_Infrared_Cross         : single;
    Bloom_Time                 : integer;
    Sustain_Time               : integer;
    Max_Dissipation_Time       : integer;
    Min_Dissipation_Time       : integer;
    Descent_Rate               : single;
  end;

  ////====================================================
  TRecInfrared_Decoy_On_Board =  record
    Infrared_Decoy_Instance_Index  : integer;
    Instance_Identifier            : string[80];
    Instance_Type                  : byte;
    Infrared_Decoy_Qty_On_Board    : integer;
    Vehicle_Index                  : integer;
    Infrared_Decoy_Index           : integer;
  end;

  ////====================================================
  TRecJammer_Definition =  record
    Jammer_Index               : integer;
    Jammer_Type                : byte;
    Jammer_Identifier          : string[60];
    Lower_Freq_Limit           : double;
    Upper_Freq_Limit           : double;
    Jammer_Power_Density       : double;
    Max_Effective_Range        : single;
    Max_Sector_Width           : single;
    Upper_Vert_Coverage_Angle  : single;
    Lower_Vert_Coverage_Angle  : single;
  end;

  ////====================================================
  TRecJammer_On_Board =  record
    Jammer_Instance_Index  : integer;
    Instance_Identifier    : string[80];
    Instance_Type          : byte;
    Vehicle_Index          : integer;
    Jammer_Index           : integer;
    Antenna_Height         : single;
  end;

  ////====================================================
  TRecLink_Definition =  record
    Link_Index           : integer;
    Link_Identifier_Num  : byte;
    Link_Force           : byte;
    Link_Controller      : integer;
    Deployment_Index     : integer;
    Trans_Mode           : byte;
    Link_Identifier      : string[60];
  end;

  ////====================================================
  TRecLink_Participant =  record
    Link_Index           : integer;
    Participating_Unit   : integer;
    Deployment_Index     : integer;
    PU_Octal_Code        : integer;
  end;

  ////====================================================
  TRecList_Conditional_Event_Mapping =  record
    Event_List_Index         : integer;
    Priority                 : integer;
    Conditional_Event_Index  : integer;
  end;

  ////====================================================
  TRecMAD_Definition =  record
    MAD_Index              : integer;
    Class_Identifier       : string[60];
    Baseline_Detect_Range  : single;
    Known_Cross_Section    : single;
  end;

  ////====================================================
  TRecMAD_Sensor_On_Board =  record
    MAD_Instance_Index   : integer;
    Instance_Identifier  : string[80];
    Instance_Type        : byte;
    Vehicle_Index        : integer;
    MAD_Index            : integer;
    Antenna_Height       : single;
  end;

  ////====================================================
  TRecMine_Definition =  record
    Mine_Index             : integer;
    Mine_Identifier        : string[60];
    Platform_Domain        : byte;
    Platform_Category      : byte;
    Platform_Type          : byte;
    Mine_Classification    : byte;        // acoustic, impact, magnetic, pressure
    Length                 : single;
    Width                  : single;
    Height                 : single;
    Mooring_Type           : byte;
    Max_Laying_Depth       : single;
    Front_Acoustic_Cross   : single;
    Side_Acoustic_Cross    : single;
    Mine_Lethality         : integer;
    Engagement_Range       : single;
    Anti_Sur_Capable       : byte;
    Anti_SubSur_Capable    : byte;
    Detectability_Type     : byte;
  end;

  ////====================================================
  TRecMine_POD_vs_Range =  record
    List_Index           : integer;
    Mine_Index           : integer;
    Prob_of_Detonation   : single;
    Range                : single;
  end;

  ////====================================================
  TRecMissile_Definition =  record
    Missile_Index                    : integer;
    Class_Identifier                 : string[60];
    Platform_Domain                  : byte;
    Platform_Category                : byte;
    Platform_Type                    : byte;
    Max_Range                        : single;
    Min_Range                        : single;
    Motion_Index                     : integer;
    Seeker_TurnOn_Range              : single;
    Second_Seeker_Pattern_Capable    : byte;
    Seeker_Bias_Capable              : byte;
    Fixed_Seeker_Turn_On_Range       : byte;
    Lethality                        : integer;
    Prob_of_Hit                      : single;
    Damage_Capacity                  : integer;
    Default_Altitude                 : single;
    Length                           : single;
    Width                            : single;
    Height                           : single;
    Front_Radar_Cross                : single;
    Side_Radar_Cross                 : single;
    Front_Visual_Cross               : single;
    Side_Visual_Cross                : single;
    Front_Infrared_Cross             : single;
    Side_Infrared_Cross              : single;
    Pursuit_Guide_Type               : byte;
    Primary_Guide_Type               : byte;
    Secondary_Guide_Type             : byte;
    Anti_Air_Capable                 : byte;
    Anti_Sur_Capable                 : byte;
    Anti_SubSur_Capable              : byte;
    Anti_Land_Capable                : byte;
    Anti_Amphibious_Capable          : byte;
    Primary_Target_Domain            : byte;
    SARH_POH_Modifier                : single;
    CG_POH_Modifier                  : single;
    TARH_POH_Modifier                : single;
    IR_POH_Modifier                  : single;
    AR_POH_Modifier                  : single;
    Transmitted_Frequency            : double;
    Scan_Rate                        : single;
    Pulse_Rep_Freq                   : single;
    Pulse_Width                      : single;
    Xmit_Power                       : single;
    TARH_Jamming_A_Probability       : single;
    TARH_Jamming_B_Probability       : single;
    TARH_Jamming_C_Probability       : single;
    Wpt_Capable                      : byte;
    Max_Num_Wpts                     : byte;
    Min_Final_Leg_Length             : single;
    Engagement_Range                 : single;
    Max_Firing_Depth                 : single;
    Upper_Received_Freq              : double;
    Lower_Received_Freq              : double;
    Fly_Out_Required                 : byte;
    Fly_Out_Range                    : single;
    Fly_Out_Altitude                 : single;
    Booster_Separation_Required      : byte;
    Booster_Separation_Range         : single;
    Booster_Separation_Box_Width     : single;
    Booster_Separation_Box_Length    : single;
    Term_Guide_Azimuth               : single;
    Term_Guide_Elevation             : single;
    Term_Guide_Range                 : single;
    Terminal_Guidance_Capability     : byte;
    Terminal_Altitude_Required       : byte;
    Terminal_Acquisition_Altitude    : single;
    Terminal_Sinuation_Start_Range   : single;
    Terminal_Sinuation_Period        : single;
    Terminal_Sinuation_Amplitude     : single;
    Terminal_Pop_Up_Range            : single;
    Terminal_Pop_Up_Altitude         : single;
    Mid_Course_Update_Mode           : byte;
    Home_On_Jam_Type_A_Capable       : byte;
    Home_On_Jam_Type_B_Capable       : byte;
    Home_On_Jam_Type_C_Capable       : byte;
    Launch_Method                    : byte;
    Data_Entry_Method                : byte;
    Launch_Speed                     : byte;
    Max_Target_Altitude_Delta        : integer;
    Term_Guide_Azimuth_Narrow        : single;
    Term_Guide_Elevation_Narrow      : single;
    Term_Guide_Range_Narrow          : single;
    Spot_Number                      : integer;
    ECCM_Type                        : byte;
    ECM_Detonation                   : byte;
    ECM_Detection                    : byte;
    Detectability_Type               : byte;
    IRCM_Detonation                  : byte;
    IRCM_Detection                   : byte;
    Sea_State_Modelling_Capable      : byte;
  end;

  ////====================================================
  TRecMotion_Characteristics =  record
    Motion_Index               : integer;
    Motion_Identifier          : string[60];
    Motion_Type                : byte;
    Max_Altitude               : single;
    Max_Depth                  : single;
    Min_Ground_Speed           : single;
    Cruise_Ground_Speed        : single;
    High_Ground_Speed          : single;
    Max_Ground_Speed           : single;
    Acceleration               : single;
    Deceleration               : single;
    Normal_Climb_Rate          : single;
    Max_Climb_Rate             : single;
    Normal_Descent_Rate        : single;
    Max_Descent_Rate           : single;
    Vertical_Accel             : single;
    Standard_Turn_Rate         : single;
    Tight_Turn_Rate            : single;
    Max_Helm_Angle             : single;
    Helm_Angle_Rate            : single;
    Speed_Reduce_In_Turn       : single;
    Time_To_Reduce_Speed       : single;
    Min_Speed_To_Reduce        : single;
    Rate_of_Turn_Rate_Chg      : single;
    Min_Pitch_Angle            : single;
    Max_Pitch_Angle            : single;
    Max_Roll_Angle             : single;
    Endurance_Type             : byte;
    Endurance_Time             : integer;
    Max_Effective_Range        : single;
    Fuel_Unit_Type             : byte;
    Max_Fuel_Capacity          : single;
    Min_Speed_Fuel_Consume     : double;
    Cruise_Speed_Fuel_Consume  : double;
    High_Speed_Fuel_Consume    : double;
    Max_Speed_Fuel_Consume     : double;
  end;

  ////====================================================
  TRecNote_Storage =  record
    Note_Index               : integer;
    Note_Type                : byte;
    Vehicle_Index            : integer;
    Missile_Index            : integer;
    Mine_Index               : integer;
    Torpedo_Index            : integer;
    Satellite_Index          : integer;
    Sonobuoy_Index           : integer;
    Radar_Index              : integer;
    FCR_Index                : integer;
    Sonar_Index              : integer;
    ESM_Index                : integer;
    MAD_Index                : integer;
    EO_Index                 : integer;
    Gun_Index                : integer;
    Bomb_Index               : integer;
    Jammer_Index             : integer;
    Defensive_Jammer_Index   : integer;
    Towed_Decoy_Index        : integer;
    Floating_Decoy_Index     : integer;
    Chaff_Index              : integer;
    Decoy_Index              : integer;
    Air_Bubble_Index         : integer;
    Pattern_Index            : integer;
//    Notes                    : string[2000];
    Notes                    : string;
    Infrared_Decoy_Index     : integer;
  end;

  ////====================================================
TRecOperating_Mode =  record
  Operating_Mode_Index   : byte;
  Operating_Mode_Name    : string[50];
end;

////====================================================
  TRecOverlay_Definition =  record
    Overlay_Index        : integer;
    Overlay_Identifier   : string[60];
    Overlay_Filename     : string[60];
    Static_Overlay       : byte;
    Game_Area_Index      : integer;
    Domain               : byte;
    Force                : byte;
  end;

  ////====================================================
  TRecPOD_vs_SNR_Curve_Definition =  record
    Curve_Definition_Index       : integer;
    Curve_Definition_Identifier  : string[60];
  end;

  ////====================================================
  TRecPOD_vs_SNR_Point =  record
    List_Index               : integer;
    Curve_Definition_Index   : integer;
    SNR_Ratio                : single;
    Prob_of_Detection        : single;
  end;

  ////====================================================
  TRecPattern_Chaff_Event =  record
    Scripted_Pattern_Index   : integer;
    Chaff_Instance_Index     : integer;
    Chaff_Bloom_Spacing      : Double;
    Num_Blooms_2_Release     : integer;
  end;

  ////====================================================
  TRecPattern_IFF_Event =  record
    Scripted_Pattern_Index     : integer;
    IFF_Instance_Index         : integer;
    IFF_Interrogator_Control   : byte;
    IFF_Transponder_Control    : byte;
  end;

  ////====================================================
  TRecPattern_Infrared_Decoy_Event =  record
    Scripted_Pattern_Index         : integer;
    Infrared_Decoy_Instance_Index  : integer;
    Infrared_Decoy_Bloom_Spacing   : single;
    Num_Blooms_2_Release           : integer;
  end;

  ////====================================================
  TRecPattern_Point =  record
    Pattern_Index  : integer;
    Point_Number   : byte;
    Heading        : single;
    Range          : single;
  end;

  ////====================================================
  TRecPattern_Radar_Event =  record
    Scripted_Pattern_Index   : integer;
    Radar_Index              : integer;
    Radar_Control            : byte;
  end;

  ////====================================================
  TRecPattern_Sonar_Event =  record
    Scripted_Pattern_Index   : integer;
    Sonar_Index              : integer;
    Sonar_Control            : byte;
  end;

  ////====================================================
  TRecPattern_Weapon_Event =  record
    List_Index               : integer;
    Scripted_Pattern_Index   : integer;
    Salvo_Size               : integer;
    Number_Layed             : integer;
    Distance_Between         : single;
    Mine_Depth               : single;
    Weapon_Type              : byte;
    Point_Effect             : integer;
    Weapons_Mount            : integer;
  end;

  ////====================================================
  TRecPattern_Sonobuoy_Event =  record
    List_Index              : integer;
    Scripted_Event_Index    : integer;
    Mode                    : Byte;
    Depth                   : Double;
    Spacing                 : Double;
    Quantity                : Integer;
    DeployUntilNextWaypoint : Boolean;
  end;

  ////====================================================
  TRecPattern_Mine_Event =  record
    List_Index              : integer;
    Scripted_Event_Index    : integer;
    Depth                   : Double;
    Spacing                 : Double;
    Quantity                : Integer;
    DeployUntilNextWaypoint : Boolean;
  end;

  ////====================================================
  TRecPattern_Datalink_Event =  record
    Scripted_Event_Index   : integer;
    Datalink_Index         : integer;
    Datalink_Control       : byte;
  end;

  ////====================================================
  TRecPlatform_Activation =  record
    Platform_Event_Index         : integer;
    Deployment_Index             : integer;
    Platform_Instance_Index      : integer;
    Platform_Activation_Time     : integer;
    Init_Guidance_Type           : byte;
    Init_Position_Latitude       : double;
    Init_Position_Longitude      : double;
    Init_Position_Cartesian_X    : single;
    Init_Position_Cartesian_Y    : single;
    Init_Altitude                : single;
    Init_Course                  : single;
    Init_Helm_Angle              : single;
    Init_Ground_Speed            : byte;
    Init_Vertical_Speed          : byte;
    Init_Command_Altitude        : single;
    Init_Command_Course          : single;
    Init_Command_Helm_Angle      : single;
    Init_Command_Ground          : byte;
    Init_Command_Vert            : byte;
    Deg_of_Rotation              : single;
    Radius_of_Travel             : single;
    Direction_of_Travel          : byte;
    Circle_Latitude              : double;
    Circle_Longitude             : double;
    Circle_X                     : single;
    Circle_Y                     : single;
    Dynamic_Circle_Range_Offset  : single;
    Dynamic_Circle_Angle_Offset  : byte;
    Dynamic_Circle_Offset_Mode   : byte;
    Period_Distance              : single;
    Amplitude_Distance           : single;
    Zig_Zag_Leg_Type             : byte;
    Target_Angle_Offset          : single;
    Target_Angle_Type            : byte;
    Target_Range                 : single;
    Guidance_Target              : integer;
    Pattern_Instance_Index       : integer;
    Angular_Offset               : single;
    Anchor_Cartesian_X           : single;
    Anchor_Cartesian_Y           : single;
    Anchor_Latitude              : single;
    Anchor_Longitude             : single;
    Current_Drift                : byte;
    Waypoint_Termination         : byte;
    Termination_Heading          : single;
    Cond_List_Instance_Index     : integer;
    Damage                       : single;
  end;

  ////====================================================
  TRecPlatform_DIS_Definition =  record
    Platform_DIS_Index   : integer;
    DIS_Type             : byte;
    Vehicle_Index        : integer;
    Missile_Index        : integer;
    Mine_Index           : integer;
    Torpedo_Index        : integer;
    Hybrid_Index         : integer;
    Satellite_Index      : integer;
    Sonobuoy_Index       : integer;
    DIS_Kind             : integer;
    DIS_Domain           : integer;
    DIS_Country          : integer;
    DIS_Category         : integer;
    DIS_Subcategory      : integer;
    DIS_Specific         : integer;
  end;

  ////====================================================
  TRecPlatform_IFF_Activation =  record
    IFF_Activation_Index       : integer;
    IFF_Interrogator_Control   : byte;
    IFF_Transponder_Control    : byte;
    Platform_Event_Index       : integer;
    IFF_Instance_Index         : integer;
  end;

  ////====================================================
  TRecPlatform_IFF_Mode_Code =  record
    IFF_Activation_Index   : integer;
    IFF_Device_Type        : byte;
    IFF_Mode               : byte;
    IFF_Code               : integer;
    Mode_State             : byte;
  end;

  ////====================================================
  TRecPlatform_Instance =  record
    Platform_Instance_Index  : integer;
    Resource_Alloc_Index     : integer;
    Platform_Type            : byte;
    Vehicle_Index            : integer;
    Missile_Index            : integer;
    Torpedo_Index            : integer;
    Mine_Index               : integer;
    Hybrid_Index             : integer;
    Satellite_Index          : integer;
    Sonobuoy_Index           : integer;
    Instance_Name            : string[60];
    Force_Designation        : byte;
    Track_ID                 : string[5];
    Instance_Ident_Index     : Integer;
  end;

  ////====================================================
  TRecPlatform_Type = record
    Platform_Type             : byte;
    Platform_Type_Definition  : string[50];
  end;

//  ARecPlatform_Instance =  array of   TRecPlatform_Instance;


  ////====================================================
  TRecPlatform_Instance_Identifier =  record
    Instance_Ident_Index   : integer;
    Vehicle_Index          : integer;
    Instance_Identifier    : string[60];
  end;

  ////====================================================
  TRecPlatform_Library_Entry =  record
    Library_Entry_Index  : integer;
    Library_Index        : integer;
    Platform_Type        : byte;
    Vehicle_Index        : integer;
    Missile_Index        : integer;
    Torpedo_Index        : integer;
    Mine_Index           : integer;
    Hybrid_Index         : integer;
    Satellite_Index      : integer;
    Sonobuoy_Index       : integer;
  end;

  ////====================================================
  TRecPoint_Effect_On_Board =  record
    Point_Effect_Index   : integer;
    Instance_Identifier  : string[80];
    Instance_Type        : byte;
    Vehicle_Index        : integer;
    Mount_Type           : byte;
    Quantity             : integer;
    Gun_Index            : integer;
    Bomb_Index           : integer;
  end;

  ////====================================================
  TRecPredefined_Pattern =  record
    Pattern_Index        : integer;
    Pattern_Identifier   : string[60];
    Pattern_Type         : byte;
    Vehicle_Index        : integer;
    Pattern_Termination  : byte;
    Termination_Heading  : single;
  end;

  ////====================================================
  TRecRadar_Definition =  record
    Radar_Index                    : integer;
    Radar_Identifier               : string[60];
    Radar_Emitter                  : string[60];
    Radar_Type                     : byte;
    Frequency                      : single;
    Scan_Rate                      : single;
    Pulse_Rep_Freq                 : single;
    Pulse_Width                    : single;
    Radar_Power                    : single;
    Detection_Range                : single;
    Known_Cross_Section            : single;
    Max_Unambig_Detect_Range       : single;
    IFF_Capability                 : ByteBool;
    Altitude_Data_Capability       : ByteBool;
    Ground_Speed_Data_Capability   : ByteBool;
    Heading_Data_Capability        : ByteBool;
    Plat_Type_Recog_Capability     : ByteBool;
    Plat_Class_Recog_Capability    : ByteBool;
    Clutter_Rejection              : single;
    Anti_Jamming_Capable           : ByteBool;
    Curve_Definition_Index         : integer;
    Second_Vert_Coverage           : ByteBool;
    Jamming_A_Resistant            : ByteBool;
    Jamming_B_Resistant            : ByteBool;
    Jamming_C_Resistant            : ByteBool;
    Anti_Jamming_A_Resistant       : ByteBool;
    Anti_Jamming_B_Resistant       : ByteBool;
    Anti_Jamming_C_Resistant       : ByteBool;
    Anti_Jamming_Range_Reduction   : single;
    Beam_Width                     : single;
    Sector_Scan_Capable            : ByteBool;
    Off_Axis_Jammer_Reduction      : single;
    Num_FCR_Channels               : byte;
    Radar_Spot_Number              : integer;
    Radar_Horizon_Factor           : single;
    Main_Lobe_Gain                 : single;
    Counter_Detection_Factor       : single;
    ECCM_Type                      : byte;
    MTI_Capable                    : ByteBool;
    MTI_MinTargetSpeed             : single;
  end;

  ////====================================================
  TRecRadar_Interval_Definition =  record
    Interval_List_Index  : integer;
    Priority             : byte;
    Radar_State          : byte;
    Num_Scans            : byte;
    Radar_Off_Time       : integer;
  end;


  {$REGION 'Documentation'}
  ///	<summary>to record Radar capabilities detection detail -- implemented in
  ///	TT3PlatformInstance</summary>
  {$ENDREGION}
  TRadarDetailedCapabilities = record
    IFF_Capability                 : ByteBool;
    Altitude_Data_Capability       : ByteBool;
    Ground_Speed_Data_Capability   : ByteBool;
    Heading_Data_Capability        : ByteBool;
    Plat_Type_Recog_Capability     : ByteBool;
    Plat_Class_Recog_Capability    : ByteBool;

    //add mk
    Plat_Name_Recog_Capability     : ByteBool;
    Track_ID  : ByteBool;
  end;

  ////====================================================
  TRecRadar_Interval_List =  record
    Interval_List_Index        : integer;
    Interval_List_Identifier   : string[60];
  end;

  ////====================================================
  TRecRadar_On_Board =  record
    Radar_Instance_Index       : integer;
    Instance_Identifier        : string[80];
    Instance_Type              : byte;
    Vehicle_Index              : integer;
    Radar_Index                : integer;
    Rel_Antenna_Height         : single;
    Submerged_Antenna_Height   : single;
    Max_Operational_Depth      : single;
  end;

  ////====================================================
  TRecRadar_Type =  record
    Radar_Type_Index   : byte;
    Radar_Type_Name    : string[50];
end;

////====================================================

  TRecRadar_Vertical_Coverage =  record
    Coverage_Index             : integer;
    Radar_Index                : integer;
    Coverage_Diagram           : byte;
    Vert_Coverage_Range        : single;
    Vert_Cover_Min_Elevation   : single;
    Vert_Cover_Max_Elevation   : single;
  end;

  PRecRadar_Vertical_Coverage = ^TRecRadar_Vertical_Coverage;

  ////====================================================
  TRecRainfall_On_ESM =  record
    Radar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecRainfall_On_Missile_Seeker =  record
    Guide_Type     : byte;
    Rain_0_Effect  : single;
    Rain_1_Effect  : single;
    Rain_2_Effect  : single;
    Rain_3_Effect  : single;
    Rain_4_Effect  : single;
    Rain_5_Effect  : single;
    Rain_6_Effect  : single;
  end;

  ////====================================================
  TRecRainfall_On_Radar =  record
    Radar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecRainfall_On_Sonar =  record
    Sonar_Frequency  : single;
    Rain_0_Effect    : single;
    Rain_1_Effect    : single;
    Rain_2_Effect    : single;
    Rain_3_Effect    : single;
    Rain_4_Effect    : single;
    Rain_5_Effect    : single;
    Rain_6_Effect    : single;
  end;

  ////====================================================
  TRecReference_Point =  record
    Reference_Index        : integer;
    Resource_Alloc_Index   : integer;
    Reference_Identifier   : string[60];
    Force_Designation      : byte;
    Track_Type             : byte;
    Symbol_Type            : integer;
    Course                 : single;
    Speed                  : single;
    X_Position             : single;
    Y_Position             : single;
    Latitude               : double;
    Longitude              : double;
    Track_Bearing          : single;
    AOP_Start_Time_Offset  : integer;
  end;

  ////====================================================
  TRecResource_Allocation =  record
    Resource_Alloc_Index   : integer;
    Allocation_Identifier  : string[60];
    Game_Enviro_Index      : integer;
    Defaults_Index         : integer;
    Role_List_Index        : integer;
    Game_Start_Time        : double;
  end;

  ////====================================================
  TRecResource_Cond_List_Mapping =  record
    Cond_List_Instance_Index   : integer;
    Resource_Alloc_Index       : integer;
    Event_List_Index           : integer;
    Force_Designation          : byte;
  end;

  ////====================================================
  TRecResource_Geo_Area_Mapping =  record
    Geo_Area_Instance_Index  : integer;
    Resource_Alloc_Index     : integer;
    Geo_Area_Index           : integer;
    Force_Designation        : byte;
  end;

  ////====================================================
  TRecResource_Interval_List_Mapping =  record
    Resource_Alloc_Index   : integer;
    Interval_List_Index    : integer;
  end;

  ////====================================================
  TRecResource_Library_Mapping =  record
    Resource_Alloc_Index   : integer;
    Library_Index          : integer;
  end;

  ////====================================================
  TRecResource_Overlay_Mapping =  record
    Overlay_Instance_Index   : integer;
    Resource_Alloc_Index     : integer;
    Overlay_Index            : integer;
    Force_Designation        : byte;
  end;

  ////====================================================
  TRecResource_Pattern_Mapping =  record
    Pattern_Instance_Index   : integer;
    Resource_Alloc_Index     : integer;
    Pattern_Index            : integer;
  end;

  ////====================================================
  TRecResource_Sonobuoy_Mapping =  record
    Sonobuoy_Resource_Index  : integer;
    Resource_Alloc_Index     : integer;
    Sonobuoy_Index           : integer;
    Force_Designation        : byte;
  end;

  ////====================================================
  TRecResource_Template_Mapping =  record
    Template_Instance_Index  : integer;
    Resource_Alloc_Index     : integer;
    Template_Index           : integer;
    Force_Designation        : byte;
  end;

  ////====================================================
  TRecRuntime_Platform_Library =  record
    Platform_Library_Index   : integer;
    Library_Name             : string[60];
  end;

  ////====================================================
  TRecSatellite_Definition =  record
    Satellite_Index              : integer;
    Satellite_Identifier         : string[60];
    Platform_Domain              : byte;
    Platform_Category            : byte;
    Platform_Type                : byte;
    Length                       : single;
    Width                        : single;
    Height                       : single;
    Front_Radar_Cross            : single;
    Side_Radar_Cross             : single;
    Orbit_Period                 : integer;
    Detection_Range_Radius       : single;
    Altitude                     : single;
    Ground_Speed                 : single;
    Plat_Type_Recog_Capability   : byte;
    Plat_Class_Recog_Capability  : byte;
  end;

  ////====================================================
  TRecScenario_Definition =  record
    Scenario_Index         : integer;
    Scenario_Identifier    : string[60];
    Resource_Alloc_Index   : integer;
  end;

  ////====================================================
  TRecScripted_Behav_Definition =  record
    Scripted_Event_Index     : integer;
    Number_of_Event          : integer;
    Platform_Event_Index     : integer;
    Speed                    : Double;
    Altitude                 : Double;
    Vert_Speed               : byte;
    Waypoint_Latitude        : double;
    Waypoint_Longitude       : double;
    Cartesian_Waypoint_X     : single;
    Cartesian_Waypoint_Y     : single;
    Time_Waypoint            : byte;
    Time_2_Waypoint          : integer;
    HF_Datalink_Activate     : byte;
    UHF_Datalink_Activate    : byte;
    Sonobuoy_Resource_Index  : integer;
    Sonobuoy_Instance_Index  : integer;
    Deploy_Sonobuoys         : byte;
    Sonobuoy_Spacing         : single;
    Num_Sonobuoys_2_Drop     : integer;
    Sonobuoy_Depth           : single;
    Jammer_Control           : byte;
    Remove_from_Game         : byte;
  end;

  ////====================================================
  TRecScripted_Chaff_Event =  record
    Scripted_Event_Index   : integer;
    Chaff_Instance_Index   : integer;
    Chaff_Bloom_Spacing    : Double;
    Num_Blooms_2_Release   : integer;

    Countermeasure_Control : Byte;
  end;

  ////====================================================
  TRecScripted_IFF_Event =  record
    Scripted_Event_Index       : integer;
    IFF_Instance_Index         : integer;
    IFF_Interrogator_Control   : byte;
    IFF_Transponder_Control    : byte;
  end;

  ////====================================================
  TRecScripted_Infrared_Decoy_Event =  record
    Scripted_Event_Index           : integer;
    Infrared_Decoy_Instance_Index  : integer;
    Infrared_Decoy_Bloom_Spacing   : single;
    Num_Blooms_2_Release           : integer;
  end;

  ////====================================================
  TRecScripted_Pattern_Point =  record
    Scripted_Pattern_Index   : integer;
    Point_Number             : byte;
    Pattern_Index            : integer;
    Heading                  : single;
    Range                    : single;
    Speed                    : byte;
    Altitude                 : single;
    Vert_Speed               : byte;
    Time_Waypoint            : byte;
    Time_2_Waypoint          : integer;
    HF_Datalink_Activate     : byte;
    UHF_Datalink_Activate    : byte;
    Sonobuoy_Instance_Index  : integer;
    Deploy_Sonobuoys         : byte;
    Sonobuoy_Spacing         : single;
    Num_Sonobuoys_2_Drop     : integer;
    Sonobuoy_Depth           : single;
    Jammer_Control           : byte;
    Remove_from_Game         : byte;
  end;

  ////====================================================
  TRecScripted_Radar_Event =  record
    Scripted_Event_Index   : integer;
    Radar_Index            : integer;
    Radar_Control          : byte;
  end;

  ////====================================================
  TRecScripted_Sonar_Event =  record
    Scripted_Event_Index   : integer;
    Sonar_Index            : integer;
    Sonar_Control          : byte;
  end;

  ////====================================================
  TRecScripted_Weapon_Event =  record
    List_Index             : integer;
    Scripted_Event_Index   : integer;
    Salvo_Size             : integer;
    Number_Layed           : integer;
    Distance_Between       : single;
    Mine_Depth             : single;
    Target_Index           : integer;
    Weapon_Type            : byte;
    Point_Effect           : integer;
    Weapons_Mount          : integer;
  end;

  ////====================================================
  TRecScripted_Sonobuoy_Event =  record
    List_Index              : integer;
    Scripted_Event_Index    : integer;
    SonobuoyType            : Byte;
    SonobuoyMode            : Byte;
    SonobuoyDepth           : Double;
    SonobuoySpacing         : Double;
    SonobuoyQuantity        : Integer;
    DeploySonoUntilNextWp   : Boolean;
  end;

  ////====================================================
  TRecScripted_Mine_Event =  record
    List_Index              : integer;
    Scripted_Event_Index    : integer;
    MineType                : Byte;
    MineDepth               : Double;
    MineSpacing             : Double;
    MineQuantity            : Integer;
    DeployMineUntilNextWp   : Boolean;
  end;

  ////====================================================
  TRecScripted_Datalink_Event =  record
    Scripted_Event_Index   : integer;
    Datalink_Index         : integer;
    Datalink_Control       : byte;
  end;

  ////====================================================
  TRecSea_State_On_Missile_Safe_Altitude =  record
    Sea_State                        : byte;
    Effect_on_Missile_Safe_Altitude  : single;
  end;

  ////====================================================
  TRecSea_State_On_Radar =  record
    Sea_State        : byte;
    Effect_on_Radar  : single;
  end;

  ////====================================================
  TRecSea_State_On_Sonar =  record
    Sonar_Frequency  : single;
    Sea_0_Effect     : single;
    Sea_1_Effect     : single;
    Sea_2_Effect     : single;
    Sea_3_Effect     : single;
    Sea_4_Effect     : single;
    Sea_5_Effect     : single;
    Sea_6_Effect     : single;
    Sea_7_Effect     : single;
    Sea_8_Effect     : single;
    Sea_9_Effect     : single;
  end;

  ////====================================================
  TRecShip_Noise_On_Sonar =  record
    Sonar_Frequency      : single;
    Distant_Ship_Effect  : single;
    Light_Ship_Effect    : single;
    Medium_Ship_Effect   : single;
    Heavy_Ship_Effect    : single;
  end;

  ////====================================================
TRecSonar_Category =  record
  Sonar_Category_Index   : byte;
  Sonar_Category_Name    : string[50];
end;

////====================================================
  TRecSonar_Definition =  record
    Sonar_Index                      : integer;
    Sonar_Identifier                 : string[60];
    Sonar_Category_Index             : byte;
    Sonar_Classification             : byte;
    Passive_Int_Period               : integer;
    Active_Int_Period                : integer;
    TIOW_Short_Range                 : single;
    TIOW_Medium_Range                : single;
    TIOW_Long_Range                  : single;
    Passive_Detect_Range             : single;
    Active_Detect_Range              : single;
    Max_Detect_Range                 : single;
    Known_Signal_Source              : single;
    Known_Cross_Section              : single;
    Sonar_Directivity_Index          : single;
    Active_Operating_Power           : single;
    Active_Freq_of_Op                : single;
    Passive_Freq_of_Op               : single;
    Max_Operating_Depth              : single;
    Sonar_Depth_Rate_of_Change       : single;
    Depth_per_Speed                  : single;
    Kinking_Processing               : ByteBool;
    Turn_Rate_2_Kink                 : single;
    Time_2_Settle_Kinked             : integer;
    Bearing_Processing               : ByteBool;
    Time_2_Resolve_Bearing           : integer;
    Passive_Processing               : ByteBool;
    Target_Identification            : ByteBool;
    Time_2_Identify                  : integer;
    Curve_Detection_Index            : integer;
    Track_Analysis                   : byte;
    Time_2_Provide_Track             : integer;
    Ownship_Increase_due_to_Active   : single;
    Tow_Speed                        : single;
    Minimum_Depth                    : single;
    Maximum_Tow_Speed                : single;
    Maximum_Sonar_Speed              : single;
    Depth_Finding_Capable            : ByteBool;
    Tracking_Capable                 : ByteBool;
    Surface_Detection_Capable        : ByteBool;
    SubSurface_Detection_Capable     : ByteBool;
    Torpedo_Detection_Capable        : ByteBool;
    Mine_Detection_Capable           : ByteBool;
    Cable_Length                     : single;
    Maximum_Reported_Bearing_Error   : single;
    Average_Beam_Width               : single;
    Counter_Detection_Factor         : single;
  end;

  ////====================================================
  TRecSonar_On_Board =  record
    Sonar_Instance_Index   : integer;
    Instance_Identifier    : string[80];
    Instance_Type          : byte;
    Vehicle_Index          : integer;
    Sonar_Index            : integer;
    Minimum_Depth          : single;
    Time_2_Deploy          : integer;
    Time_2_Stow            : integer;
  end;

  ////====================================================
  TRecSonobuoy_Definition =  record
    Sonobuoy_Index         : integer;
    Class_Identifier       : string[60];
    Sonobuoy_Type          : byte;
    Platform_Domain        : byte;
    Platform_Category      : byte;
    Platform_Type          : byte;
    Endurance_Time         : integer;
    Max_Depth              : single;
    Length                 : single;
    Width                  : single;
    Height                 : single;
    Front_Acoustic_Cross   : single;
    Side_Acoustic_Cross    : single;
    Damage_Capacity        : integer;
    CPA_Detection_Capable  : byte;
    CPA_Range_Limit        : single;
    Sonar_Index            : integer;
  end;

  ////====================================================
  TRecSonobuoy_On_Board =  record
    Sonobuoy_Instance_Index  : integer;
    Instance_Identifier      : string[80];
    Instance_Type            : byte;
    Vehicle_Index            : integer;
    Sonobuoy_Index           : integer;
    Quantity                 : integer;
    Sonar_Instance_Index     : integer;
  end;

  ////====================================================
  TRecStudent_Role_Definition =  record
    Student_Role_Index   : integer;
    Role_Identifier      : string[6];
    Role_List_Index      : integer;
  end;

  ////====================================================
  TRecStudent_Role_List =  record
    Role_List_Index        : integer;
    Role_List_Identifier   : string[60];
  end;

  ////====================================================
  TRecSubArea_Enviro_Definition =  record
    Enviro_Index                   : integer; //sub area index
    Game_Enviro_Index              : integer; //enviro_index
    Enviro_Identifier              : string[60];
    X_Position_1                   : single;
    Y_Position_1                   : single;
    X_Position_2                   : single;
    Y_Position_2                   : single;
    Latitude_1                     : double;
    Longitude_1                    : double;
    Latitude_2                     : double;
    Longitude_2                    : double;
    Wind_Speed                     : single;
    Wind_Direction                 : single;
    Daytime_Visual_Modifier        : single;
    Nighttime_Visual_Modifier      : single;
    Daytime_Infrared_Modifier      : single;
    Nighttime_Infrared_Modifier    : single;
    Rain_Rate                      : byte;
    Cloud_Base_Height              : single;
    Cloud_Attenuation              : byte;
    Sea_State                      : byte;
    Ocean_Current_Speed            : single;
    Ocean_Current_Direction        : single;
    Thermal_Layer_Depth            : single;
    Sound_Velocity_Type            : byte;
    Surface_Sound_Speed            : single;
    Layer_Sound_Speed              : single;
    Bottom_Sound_Speed             : single;
    Bottomloss_Coefficient         : byte;
    Ave_Ocean_Depth                : single;
    CZ_Active                      : byte;
    Surface_Ducting_Active         : byte;
    Upper_Limit_Sur_Duct_Depth     : single;
    Lower_Limit_Sur_Duct_Depth     : single;
    Sub_Ducting_Active             : byte;
    Upper_Limit_Sub_Duct_Depth     : single;
    Lower_Limit_Sub_Duct_Depth     : single;
    Shipping_Rate                  : byte;
    Shadow_Zone_Trans_Loss         : single;
    Atmospheric_Refract_Modifier   : single;
    Barometric_Pressure            : single;
    Air_Temperature                : single;
    Surface_Temperature            : single;
    HF_Black_Hole                  : byte;
  end;

  ////====================================================
  TRecText_Message_Template =  record
    Template_Index       : integer;
    Template_Identifier  : string[60];
//    Template_Form        : string[2000];
    Template_Form        : string;
  end;

  ////====================================================
  TRecTorpedo_Definition =  record
    Torpedo_Index                : integer;
    Class_Identifier             : string[60];
    Platform_Domain              : byte;
    Platform_Category            : byte;
    Platform_Type                : byte;
    Max_Range                    : single;
    Min_Range                    : single;
    Motion_Index                 : integer;
    Seeker_TurnOn_Range          : single;
    Lethality                    : integer;
    Damage_Capacity              : integer;
    Default_Depth                : single;
    Length                       : single;
    Width                        : single;
    Height                       : single;
    Front_Acoustic_Cross         : single;
    Side_Acoustic_Cross          : single;
    LSpeed_Acoustic_Intens       : single;
    Below_Cav_Acoustic_Intens    : single;
    Above_Cav_Acoustic_Intens    : single;
    HSpeed_Acoustic_Intens       : single;
    Cavitation_Switch_Point      : single;
    Term_Guide_Azimuth           : single;
    Term_Guide_Elevation         : single;
    Term_Guide_Range             : single;
    Pursuit_Guidance_Type        : byte;
    Air_Drop_Capable             : byte;
    Use_Terminal_Circle          : byte;
    Terminal_Circle_Radius       : single;
    Fixed_Circle_Radius          : byte;
    Lateral_Deceleration         : single;
    Airborne_Descent_Rate        : double;
    Wire_Angle_Offset            : single;
    Guidance_Type                : byte;
    Anti_Sur_Capable             : byte;
    Anti_SubSur_Capable          : byte;
    Primary_Target_Domain        : byte;
    Active_Acoustic_POH_Mod      : single;
    Passive_Acoustic_POH_Mod     : single;
    Active_Passive_POH_Mod       : single;
    WireGuide_POH_Modifier       : single;
    WakeHome_POH_Modifier        : single;
    Active_Seeker_Power          : single;
    Active_Seeker_Freq           : single;
    Engagement_Range             : single;
    First_Relative_Gyro_Angle    : integer;
    Second_Relative_Gyro_Angle   : integer;
    Max_Torpedo_Gyro_Angle       : single;
    Max_Torpedo_Search_Depth     : single;
    Acoustic_Torp_Ceiling_Depth  : single;
    Fixed_Ceiling_Depth          : byte;
    Fixed_Seeker_TurnOn_Range    : byte;
    Sinuation_Runout             : byte;
    Runout_Sinuation_Period      : single;
    Runout_Sinuation_Amplitude   : single;
    Min_Runout_Range             : single;
    Launch_Method                : byte;
    Data_Entry_Method            : byte;
    Launch_Speed                 : byte;
    Opt_Launch_Range_Nuc_Sub     : single;
    Opt_Launch_Range_Conv_Sub    : single;
    Opt_Launch_Range_Other       : single;
    Detectability_Type           : byte;
  end;

  ////====================================================
  TRecTorpedo_POH_Modifier =  record
    Torpedo_Index  : integer;
    Aspect_Angle   : byte;
    POH_Modifier   : single;
  end;

  ////====================================================
  TRecTowed_Jammer_Decoy_Definition =  record
    Towed_Decoy_Index          : integer;
    Towed_Decoy_Identifier     : string[60];
    Decoy_TARH_Capable         : byte;
    Decoy_SARH_Capable         : byte;
    Platform_Domain            : byte;
    Platform_Category          : byte;
    Platform_Type              : byte;
    Length                     : single;
    Width                      : single;
    Height                     : single;
    Front_Radar_Cross          : single;
    Side_Radar_Cross           : single;
    Front_Visual_Cross         : single;
    Side_Visual_Cross          : single;
    Front_Acoustic_Cross       : single;
    Side_Acoustic_Cross        : single;
    Type_A_Seducing_Prob       : single;
    Type_B_Seducing_Prob       : single;
    Type_C_Seducing_Prob       : single;
    Activation_Control_Delay   : single;
    Tow_Length                 : single;
    ECM_Type                   : byte;
  end;

  ////====================================================
  TRecTowed_Jammer_Decoy_On_Board =  record
    Towed_Decoy_Instance_Index   : integer;
    Instance_Identifier          : string[80];
    Instance_Type                : byte;
    Quantity                     : integer;
    Vehicle_Index                : integer;
    Towed_Decoy_Index            : integer;
  end;

  ////====================================================
  TRecVehicle_Definition =  record
    Vehicle_Index                      : integer;
    Vehicle_Identifier                 : string[60];
    Platform_Domain                    : byte;
    Platform_Category                  : byte;
    Platform_Type                      : byte;
    Motion_Characteristics             : integer;
    Length                             : single;
    Width                              : single;
    Height                             : single;
    Draft                              : single;
    Front_Radar_Cross                  : single;
    Side_Radar_Cross                   : single;
    Front_Acoustic_Cross               : single;
    Side_Acoustic_Cross                : single;
    Magnetic_Cross                     : single;
    Front_Visual_EO_Cross              : single;
    Side_Visual_EO_Cross               : single;
    Front_Infrared_Cross               : single;
    Side_Infrared_Cross                : single;
    LSpeed_Acoustic_Intens             : single;
    Below_Cav_Acoustic_Intens          : single;
    Above_Cav_Acoustic_Intens          : single;
    HSpeed_Acoustic_Intens             : single;
    Cavitation_Speed_Switch            : single;
    Time_of_Weapon_Impact              : integer;
    Chaff_Seduction_Capable            : ByteBool;
    Seduction_Mode_Prob                : single;
    Min_Delay_Between_Chaff_Rounds     : integer;
    Max_Chaff_Salvo_Size               : byte;
    SARH_POH_Modifier                  : single;
    CG_POH_Modifier                    : single;
    TARH_POH_Modifier                  : single;
    IR_POH_Modifier                    : single;
    AR_POH_Modifier                    : single;
    Active_Acoustic_Tor_POH_Mod        : single;
    Passive_Acoustic_Tor_POH_Mod       : single;
    Active_Passive_Tor_POH_Mod         : single;
    Wake_Home_POH_Modifier             : single;
    Wire_Guide_POH_Modifier            : single;
    Mag_Mine_POH_Modifier              : single;
    Press_Mine_POH_Modifier            : single;
    Impact_Mine_POH_Modifier           : single;
    Acoustic_Mine_POH_Modifier         : single;
    Sub_Comm_Antenna_Height            : single;
    Rel_Comm_Antenna_Height            : single;
    Max_Comm_Operating_Depth           : single;
    HF_Link_Capable                    : ByteBool;
    UHF_Link_Capable                   : ByteBool;
    HF_Voice_Capable                   : ByteBool;
    VHF_Voice_Capable                  : ByteBool;
    UHF_Voice_Capable                  : ByteBool;
    SATCOM_Voice_Capable               : ByteBool;
    UWT_Voice_Capable                  : ByteBool;
    HF_MHS_Capable                     : ByteBool;
    UHF_MHS_Capable                    : ByteBool;
    SATCOM_MHS_Capable                 : ByteBool;
    Damage_Capacity                    : integer;
    Plat_Basing_Capability             : ByteBool;
    Chaff_Capability                   : ByteBool;
    Readying_Time                      : integer;
    Sonobuoy_Capable                   : ByteBool;
    Nav_Light_Capable                  : ByteBool;
    Periscope_Depth                    : single;
    Periscope_Height_Above_Water       : single;
    Periscope_Front_Radar_Xsection     : single;
    Periscope_Side_Radar_Xsection      : single;
    Periscope_Front_Vis_Xsection       : single;
    Periscope_Side_Vis_Xsection        : single;
    Periscope_Front_IR_Xsection        : single;
    Periscope_Side_IR_Xsection         : single;
    Engagement_Range                   : single;
    Auto_Air_Defense_Capable           : ByteBool;
    Alert_State_Time                   : single;
    Detectability_Type                 : byte;
    Max_Sonobuoys_To_Monitor           : integer;
    Sonobuoy_Deploy_Max_Altitude       : integer;
    Sonobuoy_Deploy_Min_Altitude       : integer;
    Sonobuoy_Deploy_Max_Speed          : integer;
    Air_Drop_Torpedo_Max_Altitude      : integer;
    Air_Drop_Torpedo_Min_Altitude      : integer;
    Air_Drop_Torpedo_Max_Speed         : integer;
    TMA_Rate_Factor                    : single;
    HMS_Noise_Reduction_Factor         : single;
    TAS_Noise_Reduction_Factor         : single;
    Infrared_Decoy_Capable             : ByteBool;
    HF_Mid_Course_Update_Capable       : ByteBool;
    UHF_Mid_Course_Update_Capable      : ByteBool;
    SATCOM_Mid_Course_Update_Capable   : ByteBool;
    Quantity_Group_Personal            : Integer;
    VBS_Class_Name                     : string[60];
  end;

  ////====================================================
  TRecVisual_Sensor_On_Board =  record
    Visual_Instance_Index  : integer;
    Instance_Identifier    : string[80];
    Instance_Type          : byte;
    Vehicle_Index          : integer;
    Observer_Height        : single;
  end;

  // record TRecFuelEndurance ini edited and moved by sam (TFuelEndurance)
  TRecFuelEndurance = record
    FuelMinimum     : double;
    FuelCruise      : double;
    FuelHigh        : double;
    FuelMaximum     : double;
  end;

  // record TRecDamageStatus ini edited and moved by sam (TDamageStatus)
  TRecDamageStatus = record
    CurrentHealth   : single;  ///  current health point
    DamageCapacity  : single;  ///  max health point
    PercentHealth   : single;  ///  current health point in percent
    PercentMaxSpeed : single;  ///
    SensorDamage    : boolean;
    WeaponDamage    : boolean;
    CommDamage      : boolean; /// cant move at all. related to FMaxSpeedPercent = 0
    HelmDamage      : boolean;
    FuelRemaining   : single;
    FuelLeakage     : boolean;
// belum ada rumus perhitungannya:
    PropultionDamage : boolean;
//    MainBodyDamage  : boolean; /// begin to sink..
  end;

  TRecItemData = record
    Text : string[50];
    Parent : string[50];
    State : Integer;
  end;

  TSingleArray = array of Single;
  TIntegerArray = array of Integer;
  TString      = array of String;
  TDefaultDef  = array of TRecDefault_Definition;
  TIFFMode     = array of TRecDefault_IFF_Mode_Code;

  TSeaStateSonarArray = array of TRecGame_Sea_On_Sonar;
  TRainRateNoiseSonarArray = array of TRecGame_Rainfall_On_Sonar;

  TShippingRate = (srDistant,srLow,srMedium,srHigh);
  TShipNoiseOnSonarArray  = array of TRecGame_Ship_On_Sonar;

  TSonarTIOWRange = (strShort,strMedium,strLong);

function SensorOpStatusToString(aValue : TSensorOperationalStatus) : String;
function SonarTIOWRangeToString(aValue : TSonarTIOWRange) : String;

implementation

function SonarTIOWRangeToString(aValue : TSonarTIOWRange) : String;
begin
  case aValue of
    strShort    : result := 'Short Range';
    strMedium   : result := 'Medium Range';
    strLong     : result := 'Long Range';
  end;
end;

function SensorOpStatusToString(aValue : TSensorOperationalStatus) : String;
begin
  case aValue of
    sopOn         : result := 'On';
    sopOff        : result := 'Off';
    sopActive     : result := 'Active';
    sopPassive    : result := 'Passive';
    sopDamage     : result := 'Damage';
    sopTooDeep    : result := 'Too Deep';
    sopEMCON      : result := 'EMCON';
    sopUp         : result := 'Up';
    sopDown       : result := 'Down';
    sopStowed     : result := 'Stowed';
    sopStowing    : result := 'Stowing';
    sopDeployed   : result := 'Deployed';
    sopDeploying  : result := 'Deploying';
    sopTooFast    : result := 'Too Fast';
    sopTooSlow    : result := 'Too Slow';
    sopKinked     : result := 'Kinked';
    sopTooHigh    : result := 'Too High';
    sopUnkinked   : result := 'Unkinked';
  end;
end;

end.
