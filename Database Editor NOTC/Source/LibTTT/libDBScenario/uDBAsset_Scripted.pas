unit uDBAsset_Scripted;

interface

uses
  Windows, Classes, SysUtils, Graphics,tttData;

type
  // Scripted Behav
  TScripted_Behav_Definition = class
  public
    FData : TRecScripted_Behav_Definition;
  end;

  // Scripted Pattern
  TScripted_Pattern_Point = class
  public
    FData : TRecScripted_Pattern_Point;
  end;

  // Scripted Chaff
  TScripted_Chaff_Event = class
  public
    FData: TRecScripted_Chaff_Event;
  end;


  TScripted_Chaff = class
  public
    Event: TScripted_Chaff_Event;
    Behav: TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;

  end;

  // Pattern Chaff
  TPattern_Chaff_Event = class
  public
    FData : TRecPattern_Chaff_Event;
  end;

  TPattern_Chaff = class
  public
    Event     : TPattern_Chaff_Event;
    Pattern   : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

  // Scripted Radar
  TScripted_Radar_Event = class
  public
    FData : TRecScripted_Radar_Event;
  end;


  TScripted_Radar = class
  public
    Event  : TScripted_Radar_Event;
    Behav  : TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  //Pattern Radar
  TPattern_Radar_Event = class
  public
    FData  : TRecPattern_Radar_Event;
  end;

  TPattern_Radar = class
  public
    Event     : TPattern_Radar_Event;
    Pattern   : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

  //Scripted IFF
  TScripted_IFF_Event = class
  public
    FData   : TRecScripted_IFF_Event;
  end;

  TScripted_IFF   = class
  public
    Event   : TScripted_IFF_Event;
    Behav   : TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  //Pattern IFF
  TPattern_IFF_Event  = class
  public
    FData   : TRecPattern_IFF_Event;
  end;

  TPattern_IFF  = class
  public
    Event   : TPattern_IFF_Event;
    Pattern : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

  //Scripted Sonar
  TScripted_Sonar_Event = class
  public
    FData : TRecScripted_Sonar_Event;
  end;

  TScripted_Sonar = class
  public
    Event   : TScripted_Sonar_Event;
    Behav   : TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  //Pattern Sonar
  TPattern_Sonar_Event  = class
  public
    FData : TRecPattern_Sonar_Event;
  end;

  TPattern_Sonar  = class
  public
    Event   : TPattern_Sonar_Event;
    Pattern : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

  //Pattern Infrared
  TPattern_Infrared_Decoy_Event = class
  public
    FData : TRecPattern_Infrared_Decoy_Event;
  end;

  TPattern_Infrared = class
  public
    Event   : TPattern_Infrared_Decoy_Event;
    Pattern : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

  //Scripted Infrared
  TScripted_Infrared_Decoy_Event = class
  public
    FData : TRecScripted_Infrared_Decoy_Event;
  end;

  TScripted_Infrared  =class
  public
    Event : TScripted_Infrared_Decoy_Event;
    Behav : TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  //Scripted Weapon
  TScripted_Weapon_Event  = class
  public
    FData : TRecScripted_Weapon_Event;
  end;

  TScripted_Weapon = class
  public
    Event   : TScripted_Weapon_Event;
    Behav   : TScripted_Behav_Definition;

    constructor Create;
    destructor Destroy; override;
  end;

  //Pattern Weapon
  TPattern_Weapon_Event = class
  public
    FData : TRecPattern_Weapon_Event;
  end;

  TPattern_Weapon = class
  public
    Event   : TPattern_Weapon_Event;
    Pattern : TScripted_Pattern_Point;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TScripted_Chaff }

constructor TScripted_Chaff.Create;
begin
  Event := TScripted_Chaff_Event.Create;
  Behav := TScripted_Behav_Definition.Create;

end;

constructor TPattern_Chaff.Create;
begin
  Event   := TPattern_Chaff_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;


destructor TScripted_Chaff.Destroy;
begin
  Event.Free;
  Behav.Free;

  inherited;
end;

destructor TPattern_Chaff.Destroy;
begin
  Event.Free;
  Pattern.Free;

  inherited;
end;

constructor TScripted_Radar.Create;
begin
  Event   := TScripted_Radar_Event.Create;
  Behav   := TScripted_Behav_Definition.Create;
end;

destructor TScripted_Radar.Destroy;
begin
  Event.Free;
  Behav.Free;
end;

constructor TPattern_Radar.Create;
begin
  Event   := TPattern_Radar_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;

destructor TPattern_Radar.Destroy;
begin
  Event.Free;
  Pattern.Free;
end;

constructor TScripted_IFF.Create;
begin
  Event   := TScripted_IFF_Event.Create;
  Behav   := TScripted_Behav_Definition.Create;
end;

destructor TScripted_IFF.Destroy;
begin
  Event.Free;
  Behav.Free;
end;

constructor TPattern_IFF.Create;
begin
  Event   := TPattern_IFF_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;

destructor TPattern_IFF.Destroy;
begin
  Event.Free;
  Pattern.Free;
end;

constructor TScripted_Sonar.Create;
begin
  Event   := TScripted_Sonar_Event.Create;
  Behav   := TScripted_Behav_Definition.Create;
end;

destructor TScripted_Sonar.Destroy;
begin
  Event.Free;
  Behav.Free;
end;

constructor TPattern_Sonar.Create;
begin
  Event   := TPattern_Sonar_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;

destructor TPattern_Sonar.Destroy;
begin
  Event.Free;
  Pattern.Free;
end;

constructor TPattern_Infrared.Create;
begin
  Event   := TPattern_Infrared_Decoy_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;

destructor TPattern_Infrared.Destroy;
begin
  Event.Free;
  Pattern.Free;
end;

constructor TScripted_Infrared.Create;
begin
  Event   := TScripted_Infrared_Decoy_Event.Create;
  Behav   := TScripted_Behav_Definition.Create;
end;

destructor TScripted_Infrared.Destroy;
begin
  Event.Free;
  Behav.Free;
end;

constructor TScripted_Weapon.Create;
begin
  Event  := TScripted_Weapon_Event.Create;
  Behav  := TScripted_Behav_Definition.Create;
end;

destructor TScripted_Weapon.Destroy;
begin
  Event.Free;
  Behav.Free;
end;

constructor TPattern_Weapon.Create;
begin
  Event   := TPattern_Weapon_Event.Create;
  Pattern := TScripted_Pattern_Point.Create;
end;

destructor TPattern_Weapon.Destroy;
begin
  Event.Free;
  Pattern.Free;
end;


end.
