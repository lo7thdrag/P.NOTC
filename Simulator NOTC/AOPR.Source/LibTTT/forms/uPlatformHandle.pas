unit uPlatformHandle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAssetObject, uDBAsset_Radar, uDBAsset_Sonar;

type
  TfrmHandle = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    pName: TLabel;
    pSAngle: TEdit;
    pEAngle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button3: TButton;
    pRadar: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    FPlatformHooked: TPlatform_Instance;
    FRadarHooked: TRadar_On_Board;
    FSonarHooked: TSonar_On_Board;
    FActiveSensor : integer;
    procedure SetPlatformHooked(const Value: TPlatform_Instance);
    procedure SetRadarHooked(const Value: TRadar_On_Board);
    procedure SetSonarHooked(const Value: TSonar_On_Board);
  public
    { Public declarations }
    property PlatformHooked : TPlatform_Instance read FPlatformHooked write SetPlatformHooked;
    property RadarHooked : TRadar_On_Board read FRadarHooked write SetRadarHooked;
    property SonarHooked : TSonar_On_Board read FSonarHooked write SetSonarHooked;
  end;

var
  frmHandle: TfrmHandle;

implementation

{$R *.dfm}

{ TfmrHandle }

function TryStrToFloat(str : String) : double;
var val : double;
begin
  try
    val := StrToFloat(str);
  except
    val := 0;
  end;

  result := val;
end;

procedure TfrmHandle.Button1Click(Sender: TObject);
var rate : double;
begin
  rate := TryStrToFloat(Edit1.Text);
  if Assigned(FPlatformHooked) then begin
    FPlatformHooked.TurnLeft(rate);
  end;
end;

procedure TfrmHandle.Button2Click(Sender: TObject);
var rate : double;
begin
  rate := TryStrToFloat(Edit1.Text);
  if Assigned(FPlatformHooked) then begin
    FPlatformHooked.TurnRight(rate);
  end;
end;

procedure TfrmHandle.Button3Click(Sender: TObject);
var angle1,angle2 : double;
begin
  angle1 := TryStrToFloat(pSAngle.Text);
  angle2 := TryStrToFloat(pEAngle.Text);
  case FActiveSensor of
    0 :
      if Assigned(FRadarHooked) then begin
        FRadarHooked.FBlind_Zone.FData.Start_Angle  := angle1;
        FRadarHooked.FBlind_Zone.FData.End_Angle    := angle2;
      end;
    1 :
      if Assigned(FSonarHooked) then begin
        FSonarHooked.FBlind_Zone.FData.Start_Angle  := angle1;
        FSonarHooked.FBlind_Zone.FData.End_Angle    := angle2;
      end;
  end;
  //
end;

procedure TfrmHandle.SetPlatformHooked(const Value: TPlatform_Instance);
begin
  FPlatformHooked := Value;
  pName.Caption := FPlatformHooked.FData.Instance_Name;
end;

procedure TfrmHandle.SetRadarHooked(const Value: TRadar_On_Board);
begin
  FRadarHooked := Value;
  pRadar.Caption := FRadarHooked.FDef.Radar_Identifier;
  FActiveSensor := 0;
end;

procedure TfrmHandle.SetSonarHooked(const Value: TSonar_On_Board);
begin
  FSonarHooked := Value;
  pRadar.Caption := FSonarHooked.FDef.Sonar_Identifier;
  FActiveSensor := 1;
end;

end.
