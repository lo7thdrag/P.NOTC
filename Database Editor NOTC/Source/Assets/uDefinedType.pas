unit uDefinedType;

interface

type

  TOperationalStatus = (osActivate, osDeactivate, osDamage);

  TWeaponCapability = (wcAntiAir, wcAntiSurface, wcAntiSubSurface, wcAntiLand,
    wcAutoFire);

  TPlatformDomain = (pdSurface, pdSubsurface, pdAir, pdLand);

  TPlatformCategory = (pcCombatant, pcNonCombatant, pcNonNaval, pcOther,
    pcSubmarine, pcWeapon, pcNonSubmarine, pcMilitary, pcCivilian,
    pcAmphibious);

  TObjectDetectability = (odNormalDetection, odUndetectable,
    odPassiveDetection, odAlwaysVisible);

  TPlatformCapability = (pcpBarrierChaff, pcpNavigationLights);

  TDetectingCapability = (dcSurfaceDetecting, dcSubSurfaceDetecting,
    dcTorpedoDetecting, dcMineDetecting);

  TMotionType = (mtMobile, mtFixed, mtDriftCurrent);

  TMotionEndurance = (meFuel, meTime, meRange, meUnlimited);

  TRadarType = (rtSearch, rtFire, rtSearchFire);

  TSonarCategory = (scHullMounted, scVDS, scTAS, scDipping);

  TOperatingMode = (omActive, omPassive, omActivePassive, omPassiveIntercept);

  TEOSensorType = (estIR, estLaser, estEO);

  TWeaponCapabilities = set of TWeaponCapability;

  TPlatformCapabilities = set of TPlatformCapability;

  TCommunicationCapability = (ctHFLink, ctUHFLink, ctHFVoice, ctUHFVHFVoice,
    ctSATCOM, ctUnderwater, ctHFMessage, ctUHFMessage, ctSATCOMMessage);

  TCommunicationCapabilities = set of TCommunicationCapability;

  TDetectingCapabilities = set of TDetectingCapability;

  TWeaponLaunchMethod = (wlmAimpoint, wlmBearing, wlmAimpointBearing,
    wlmDirect);

  TCommandSpeed = (csMinimum, csCruise, csHigh, csMaximum);

  TDimension = record
    Length: Double;
    Width: Double;
    Height: Double;
  end;

  TBombType = (btBomb, btDepthCharge);
  TGunType = (gtRocket, gtCIWS, gtGun);
  TMineCategory = (mcAcoustic, mcImpact, mcMagnetic, mcPressure);
  TMineMooringType = (mmFixed, mmFloating);

  TUser = (trainee,instructor);

implementation

end.
