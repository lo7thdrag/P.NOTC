unit uPlatformUtility;

interface

uses uDefinedType;

type

//==============================================================================
  TPlatformCommunication = class
  public
    AntennaHeight: double;
    AntennaHeightAbove: double;
    MaximumDepth: double;
    Capabilities: TCommunicationCapabilities;
  end;

//==============================================================================
  TPlatformMotion = class
  public
     MinGroundSpeed: Integer;
     CruiseGroundSpeed: Integer;
     HighGroundSpeed: Integer;
     MaxGroundSpeed: Integer;

     Acceleration: double;
     Deceleration: double;
     StandarTurnRate: Integer;

     TightTurnRate: Integer;
     MaxHelmAngle: Integer;
     HelmAngleRate: Integer;
     MotionName: string;
     MaxAltitude: Integer;
     MaxDepth: Integer;
     NormalClimbRate: Integer;

     MaxClimbRate: Integer;
     NormalDescentRate: Integer;
     MaxDescentRate: Integer;
     VerticalAcceleration: Integer;
     MotionType: TMotionType;
     MotionEndurance: TMotionEndurance;
     MaxFuelCapacity: Integer;
     MinFuelConsumption: double;

     CruiseFuelConsumption: double;
     HighFuelConsumption: Integer;
     MaxFuelConsumption: Integer;
     MaxEffectiveRange: double;
     EnduranceTime: Word;
  end;

//==============================================================================

  TPlatformCrossSection = class
  public
    RadarFront: double;
    RadarSide: double;
    AcousticFront: double;
    AcousticSide: double;
    VisualFront: double;
    VisualSide: double;
    InfraredFront: double;
    InfraredSide: double;
    Magnetic: double;
  public

  end;

//==============================================================================
  TPlatformWithAirDroppedObject = class
  public
    MaxDropAltitude: double;
    MinDropAltitiude: double;
    MaxDropSpeed: double;
    MaxDeployAltitude: double;
    MinDeployAltitude: double;
    MaxDeploySpeed: double;
  end;

implementation


end.
