unit ufDBEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfDBEditor = class(TForm)
    MainMenu1: TMainMenu;
    Exercise1: TMenuItem;
    Platforms1: TMenuItem;
    Sensors1: TMenuItem;
    Weapons1: TMenuItem;
    Countermeasures1: TMenuItem;
    Other1: TMenuItem;
    Options1: TMenuItem;
    Shutdown1: TMenuItem;
    Help1: TMenuItem;
    Scenario1: TMenuItem;
    ResourceAllocation1: TMenuItem;
    Environment1: TMenuItem;
    GameArea1: TMenuItem;
    Vehicle1: TMenuItem;
    Satellite1: TMenuItem;
    Motion1: TMenuItem;
    Radar1: TMenuItem;
    Sonar1: TMenuItem;
    ESM1: TMenuItem;
    ElectroOpticalDetector1: TMenuItem;
    MAD1: TMenuItem;
    Sonobuoy1: TMenuItem;
    Missile1: TMenuItem;
    orpedo1: TMenuItem;
    Mine1: TMenuItem;
    Gun1: TMenuItem;
    Bomb1: TMenuItem;
    AcousticDecoy1: TMenuItem;
    AirBubble1: TMenuItem;
    Chaff1: TMenuItem;
    FloatingDecoy1: TMenuItem;
    SelfDefensiveJammer1: TMenuItem;
    owedJammerDecoy1: TMenuItem;
    RadarNoiseJammer1: TMenuItem;
    RuntimePlatformLibrary1: TMenuItem;
    PredefinedPatterns1: TMenuItem;
    RadarActivationIntervals1: TMenuItem;
    GraphicalOverlays1: TMenuItem;
    x1: TMenuItem;
    GameDefaults1: TMenuItem;
    SNRvsPODCurve1: TMenuItem;
    ReportEditor1: TMenuItem;
    ReportViewer1: TMenuItem;
    DisplayDimensionsinfeet1: TMenuItem;
    DisplayDimensionsinmetres1: TMenuItem;
    ShutdownDatabaseEditor1: TMenuItem;
    AboutDatabaseEditor1: TMenuItem;
    procedure Scenario1Click(Sender: TObject);
    procedure ResourceAllocation1Click(Sender: TObject);
    procedure Environment1Click(Sender: TObject);
    procedure GameArea1Click(Sender: TObject);
    procedure Vehicle1Click(Sender: TObject);
    procedure Satellite1Click(Sender: TObject);
    procedure ShutdownDatabaseEditor1Click(Sender: TObject);
    procedure Motion1Click(Sender: TObject);
    procedure Radar1Click(Sender: TObject);
    procedure Sonar1Click(Sender: TObject);
	procedure ESM1Click(Sender: TObject);
    procedure ElectroOpticalDetector1Click(Sender: TObject);
    procedure MAD1Click(Sender: TObject);
    procedure Sonobuoy1Click(Sender: TObject);
    procedure Missile1Click(Sender: TObject);
    procedure orpedo1Click(Sender: TObject);
    procedure Mine1Click(Sender: TObject);
    procedure Gun1Click(Sender: TObject);
    procedure Bomb1Click(Sender: TObject);
    procedure AcousticDecoy1Click(Sender: TObject);
    procedure AirBubble1Click(Sender: TObject);
    procedure Chaff1Click(Sender: TObject);
    procedure FloatingDecoy1Click(Sender: TObject);
    procedure SelfDefensiveJammer1Click(Sender: TObject);
    procedure owedJammerDecoy1Click(Sender: TObject);
    procedure RadarNoiseJammer1Click(Sender: TObject);
    procedure PredefinedPatterns1Click(Sender: TObject);
    procedure RuntimePlatformLibrary1Click(Sender: TObject);
    procedure RadarActivationIntervals1Click(Sender: TObject);
    procedure GraphicalOverlays1Click(Sender: TObject);
    procedure x1Click(Sender: TObject);
    procedure GameDefaults1Click(Sender: TObject);
    procedure SNRvsPODCurve1Click(Sender: TObject);
    procedure ReportEditor1Click(Sender: TObject);
    procedure ReportViewer1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    index : integer;
    fromDBeditor :boolean;

  end;

var
  fDBEditor: TfDBEditor;

implementation
 uses ufScenario,uAvailableScenario,uResurceAllocationSelect,uFEnvironmentSelection,
 uGameAreaList, uVehicleSelect, uSatelliteList, uMotionSingleList, uRadarPickList,
 uVehiclePicklistFilter, uESMPickList,uSonarPicklist, uEOPicklist, uMADPicklist,
 uWeaponSingleList, uCountermeasuresSingleList, uSonobuoySinglePicklist,
 uOtherSingleList,uRAList;


{$R *.dfm}


procedure TfDBEditor.ESM1Click(Sender: TObject);
begin
 fESMPickList.Show;
end;

procedure TfDBEditor.FloatingDecoy1Click(Sender: TObject);
begin
  index := 4;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.ShutdownDatabaseEditor1Click(Sender: TObject);
begin
 try
  Self.Close;
 finally
  free;
 end;

end;

procedure TfDBEditor.SNRvsPODCurve1Click(Sender: TObject);
begin
  index := 7;
  fOtherSingle.Show;
end;

procedure TfDBEditor.Sonar1Click(Sender: TObject);
begin
  fSonarPicklist.Show;
end;

procedure TfDBEditor.Sonobuoy1Click(Sender: TObject);
begin
  fSonobuoySelect.Show;
end;

procedure TfDBEditor.Vehicle1Click(Sender: TObject);
begin
  {
   if idRASelected = '' then
   begin
     ShowMessage('No Resource Allocation Selected, Please Select One First');
     Exit;
   end;
   fVehicleSelect.Show;
   }
   fVehiclePicklistFilter.Show;
end;

procedure TfDBEditor.x1Click(Sender: TObject);
begin
  index := 5;
  fromDBeditor := True;
  fOtherSingle.Show;
end;

procedure TfDBEditor.AcousticDecoy1Click(Sender: TObject);
begin
  index := 1;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.AirBubble1Click(Sender: TObject);
begin
  index := 2;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.Bomb1Click(Sender: TObject);
begin
  index := 5;
  fromDBeditor := True;
  fWeaponSingle.Show;
end;

procedure TfDBEditor.Chaff1Click(Sender: TObject);
begin
  index := 3;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.ElectroOpticalDetector1Click(Sender: TObject);
begin
  fEO.Show;
end;

procedure TfDBEditor.Environment1Click(Sender: TObject);
begin
  fEnvironmentsSelect.Show;
end;

procedure TfDBEditor.GameArea1Click(Sender: TObject);
begin
  fGameAreaList.Show;
end;

procedure TfDBEditor.GameDefaults1Click(Sender: TObject);
begin
  index := 6;
  fromDBeditor := True;
  fOtherSingle.Show;
end;

procedure TfDBEditor.GraphicalOverlays1Click(Sender: TObject);
begin
  index := 4;
  fOtherSingle.Show;
end;

procedure TfDBEditor.Gun1Click(Sender: TObject);
begin
  index := 4;
  fromDBeditor := True;
  fWeaponSingle.Show;
end;

procedure TfDBEditor.MAD1Click(Sender: TObject);
begin
  fMADPicklist.Show;
end;

procedure TfDBEditor.Mine1Click(Sender: TObject);
begin
  index := 3;
  fromDBeditor := True;
  fWeaponSingle.Show;
end;

procedure TfDBEditor.Missile1Click(Sender: TObject);
begin
  index := 1;
  fromDBeditor := True;
  fWeaponSingle.Show;
end;

procedure TfDBEditor.Motion1Click(Sender: TObject);
begin
  fmotionSingleList.show;
end;

procedure TfDBEditor.orpedo1Click(Sender: TObject);
begin
  index := 2;
  fromDBeditor := True;
  fWeaponSingle.Show;
end;

procedure TfDBEditor.owedJammerDecoy1Click(Sender: TObject);
begin
  index := 6;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.PredefinedPatterns1Click(Sender: TObject);
begin
  index := 2;
  fOtherSingle.Show;
end;

procedure TfDBEditor.Radar1Click(Sender: TObject);
begin
 fRadarPickList.Show;
end;

procedure TfDBEditor.RadarActivationIntervals1Click(Sender: TObject);
begin
  index := 3;
  fOtherSingle.Show;
end;

procedure TfDBEditor.RadarNoiseJammer1Click(Sender: TObject);
begin
  index := 7;
  fCountermeasureSingle.Show;
end;

procedure TfDBEditor.ReportEditor1Click(Sender: TObject);
begin
  index := 8;
  fOtherSingle.Show;
end;

procedure TfDBEditor.ReportViewer1Click(Sender: TObject);
begin
  index := 9;
  fOtherSingle.Show;
end;

procedure TfDBEditor.ResourceAllocation1Click(Sender: TObject);
begin
 fRAList.Show;
end;

procedure TfDBEditor.RuntimePlatformLibrary1Click(Sender: TObject);
begin
  index := 1;
  fromDBeditor := True;
  fOtherSingle.Show;
end;

procedure TfDBEditor.Satellite1Click(Sender: TObject);
begin
  SatelliteListForm.Show;
end;

procedure TfDBEditor.Scenario1Click(Sender: TObject);
begin
 favailableScenario.show;
end;

procedure TfDBEditor.SelfDefensiveJammer1Click(Sender: TObject);
begin
  index := 5;
  fCountermeasureSingle.Show;
end;

end.
