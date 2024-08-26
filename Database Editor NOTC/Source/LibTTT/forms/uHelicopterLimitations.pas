unit uHelicopterLimitations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, tttData, ufrmSummaryVehicle,
  uHelicopter_Land_Launch_Limits;

type
  TfrmHelicopterLimitations = class(TForm)
    Panel1: TPanel;
    pgc1: TPageControl;
    tsGeneral: TTabSheet;
    grp1: TGroupBox;
    grp2: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edtShipMaxTurnRate_toLaunch: TEdit;
    edtShipMaxTurnRate_toLand: TEdit;
    edtMaxRelativeWindMagnitude: TEdit;
    edtMaxRelativeSpeedToLand: TEdit;
    edtApproachCentBearing: TEdit;
    edtApproachSectorWidth: TEdit;
    edtApproachRange: TEdit;
    edtMaxLandingAltitude: TEdit;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtShipMaxTurnRate_toLaunchKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtShipMaxTurnRate_toLaunchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtShipMaxTurnRate_toLandKeyPress(Sender: TObject; var Key: Char);
    procedure edtShipMaxTurnRate_toLandKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxRelativeWindMagnitudeKeyPress(Sender: TObject;
      var Key: Char);
    procedure edtMaxRelativeWindMagnitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxRelativeSpeedToLandKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxRelativeSpeedToLandKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtApproachCentBearingKeyPress(Sender: TObject; var Key: Char);
    procedure edtApproachCentBearingKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtApproachSectorWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtApproachSectorWidthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtApproachRangeKeyPress(Sender: TObject; var Key: Char);
    procedure edtApproachRangeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtMaxLandingAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtMaxLandingAltitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    H_List : TList;

    procedure insertHelicopterLimitations;
    procedure updateHelicopterLimitations;
    procedure getData;
    procedure showData;
    procedure refreshData;
    function  Bulatkan( BilanganDesimal : Single;BildiBlkngKoma : Integer  ): String ;

  public
    { Public declarations }
    v_index : Integer;
    Helicopter_Land_Launch_Limits : THelicopter_Land_Launch_Limits;
  end;

var
  frmHelicopterLimitations: TfrmHelicopterLimitations;

implementation

{$R *.dfm}

uses uDataModuleTTT;

procedure TfrmHelicopterLimitations.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

function TfrmHelicopterLimitations.Bulatkan(BilanganDesimal: Single;
  BildiBlkngKoma: Integer): String;
  var
    s : string;
begin
  Str(BilanganDesimal:20:BildiBlkngKoma,s);
  result:=Trim(s);
end;

procedure TfrmHelicopterLimitations.edtApproachCentBearingKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtApproachCentBearing.Text := FormatFloat('0.00', StrToFloat(edtApproachCentBearing.Text));
end;

procedure TfrmHelicopterLimitations.edtApproachCentBearingKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtApproachCentBearing.Text = '' then
    Exit;

   if (StrToFloat(edtApproachCentBearing.Text) > 8470)  then
    begin
      ShowMessage('Incorrect value');
      edtApproachCentBearing.Text := '8470';
    //  edtApproachCentBearing.Text := FormatFloat('0.00', StrToFloat(edtApproachCentBearing.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtApproachRangeKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtApproachRange.Text := FormatFloat('0.00', StrToFloat(edtApproachRange.Text));
end;

procedure TfrmHelicopterLimitations.edtApproachRangeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtApproachRange.Text = '' then
    Exit;

   if (StrToFloat(edtApproachRange.Text) > 7950)  then
    begin
      ShowMessage('Incorrect value');
      edtApproachRange.Text := '7950';
    //  edtApproachRange.Text := FormatFloat('0.00', StrToFloat(edtApproachRange.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtApproachSectorWidthKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtApproachSectorWidth.Text := FormatFloat('0.00', StrToFloat(edtApproachSectorWidth.Text));
end;

procedure TfrmHelicopterLimitations.edtApproachSectorWidthKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtApproachSectorWidth.Text = '' then
    Exit;

   if (StrToFloat(edtApproachSectorWidth.Text) > 9340)  then
    begin
      ShowMessage('Incorrect value');
      edtApproachSectorWidth.Text := '9340';
    // edtApproachSectorWidth.Text := FormatFloat('0.00', StrToFloat(edtApproachSectorWidth.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtMaxLandingAltitudeKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtMaxLandingAltitude.Text := FormatFloat('0.00', StrToFloat(edtMaxLandingAltitude.Text));
end;

procedure TfrmHelicopterLimitations.edtMaxLandingAltitudeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtMaxLandingAltitude.Text = '' then
    Exit;

   if (StrToFloat(edtMaxLandingAltitude.Text) > 8560)  then
    begin
      ShowMessage('Incorrect value');
      edtMaxLandingAltitude.Text := '8560';
    //  edtMaxLandingAltitude.Text := FormatFloat('0.00', StrToFloat(edtMaxLandingAltitude.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtMaxRelativeSpeedToLandKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtMaxRelativeSpeedToLand.Text := FormatFloat('0.00', StrToFloat(edtMaxRelativeSpeedToLand.Text));
end;

procedure TfrmHelicopterLimitations.edtMaxRelativeSpeedToLandKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtMaxRelativeSpeedToLand.Text = '' then
    Exit;

   if (StrToFloat(edtMaxRelativeSpeedToLand.Text) > 9760)  then
    begin
      ShowMessage('Incorrect value');
      edtMaxRelativeSpeedToLand.Text := '9760';
    //  edtMaxRelativeSpeedToLand.Text := FormatFloat('0.00', StrToFloat(edtMaxRelativeSpeedToLand.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtMaxRelativeWindMagnitudeKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtMaxRelativeWindMagnitude.Text := FormatFloat('0.00', StrToFloat(edtMaxRelativeWindMagnitude.Text));
end;

procedure TfrmHelicopterLimitations.edtMaxRelativeWindMagnitudeKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtMaxRelativeWindMagnitude.Text = '' then
    Exit;

   if (StrToFloat(edtMaxRelativeWindMagnitude.Text) > 8650)  then
    begin
      ShowMessage('Incorrect value');
      edtMaxRelativeWindMagnitude.Text := '8650';
    //  edtMaxRelativeWindMagnitude.Text := FormatFloat('0.00', StrToFloat(edtMaxRelativeWindMagnitude.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtShipMaxTurnRate_toLandKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtShipMaxTurnRate_toLand.Text := FormatFloat('0.00', StrToFloat(edtShipMaxTurnRate_toLand.Text));
end;

procedure TfrmHelicopterLimitations.edtShipMaxTurnRate_toLandKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtShipMaxTurnRate_toLand.Text = '' then
    Exit;

   if (StrToFloat(edtShipMaxTurnRate_toLand.Text) > 3500)  then
    begin
      ShowMessage('Incorrect value');
      edtShipMaxTurnRate_toLand.Text := '3500';
    //  edtShipMaxTurnRate_toLand.Text := FormatFloat('0.00', StrToFloat(edtShipMaxTurnRate_toLand.Text));
    end;
end;

procedure TfrmHelicopterLimitations.edtShipMaxTurnRate_toLaunchKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtShipMaxTurnRate_toLaunch.Text := FormatFloat('0.00', StrToFloat(edtShipMaxTurnRate_toLaunch.Text));
end;

procedure TfrmHelicopterLimitations.edtShipMaxTurnRate_toLaunchKeyUp(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if edtShipMaxTurnRate_toLaunch.Text = '' then
    Exit;

   if (StrToFloat(edtShipMaxTurnRate_toLaunch.Text) > 2650)  then
    begin
      ShowMessage('Incorrect value');
      edtShipMaxTurnRate_toLaunch.Text := '2650';
    //  edtShipMaxTurnRate_toLaunch.Text := FormatFloat('0.00', StrToFloat(edtShipMaxTurnRate_toLaunch.Text));
    end;
end;

procedure TfrmHelicopterLimitations.FormCreate(Sender: TObject);
begin
  Helicopter_Land_Launch_Limits := THelicopter_Land_Launch_Limits.Create;
  H_List := TList.Create;
end;

procedure TfrmHelicopterLimitations.showData;
begin
  refreshData;

  H_List.Clear;
  dmTTT.GetHelicopter(v_index, H_List);

  if H_List.Count > 0 then
  begin
    with THelicopter_Land_Launch_Limits(H_List[0]), Helicopter_Land_Launch_Limits.FData do
    begin
      Max_Turn_Rate_To_Launch     := FData.Max_Turn_Rate_To_Launch;
      Max_Turn_Rate_To_Land       := FData.Max_Turn_Rate_To_Land;
      Max_Relative_Wind_Magnitude := FData.Max_Relative_Wind_Magnitude;
      Max_Relative_Speed          := FData.Max_Relative_Speed;
      Approach_Center_Bearing     := FData.Approach_Center_Bearing;
      Approach_Sector_Width       := FData.Approach_Sector_Width;
      Approach_Range              := FData.Approach_Range;//FloatToStr(Approach_Range);
      Max_Landing_Altitude        := FData.Max_Landing_Altitude;//FloatToStr(Max_Landing_Altitude);
    end;
  end;
end;

procedure TfrmHelicopterLimitations.FormShow(Sender: TObject);
begin
  showData;
  with Helicopter_Land_Launch_Limits.FData do begin
    edtShipMaxTurnRate_toLaunch.Text := IntToStr(Max_Turn_Rate_To_Launch);
    edtShipMaxTurnRate_toLand.Text   := IntToStr(Max_Turn_Rate_To_Land);
    edtMaxRelativeWindMagnitude.Text := FloatToStr(Max_Relative_Wind_Magnitude);
    edtMaxRelativeSpeedToLand.Text   := IntToStr(Max_Relative_Speed);
    edtApproachCentBearing.Text      := IntToStr(Approach_Center_Bearing);
    edtApproachSectorWidth.Text      := IntToStr(Approach_Sector_Width);
    edtApproachRange.Text            := Bulatkan(Approach_Range,1);//FloatToStr(Approach_Range);
    edtMaxLandingAltitude.Text       := Bulatkan(Max_Landing_Altitude,1);//FloatToStr(Max_Landing_Altitude);
  end;
end;

procedure TfrmHelicopterLimitations.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHelicopterLimitations.btnApplyClick(Sender: TObject);
begin
  edtApproachRange.Text:=Bulatkan(StrToFloat(edtApproachRange.Text),1);
  edtMaxLandingAltitude.Text:=Bulatkan(StrToFloat(edtMaxLandingAltitude.Text),1);
  updateHelicopterLimitations;
end;

procedure TfrmHelicopterLimitations.insertHelicopterLimitations;
begin
  getData;
  Helicopter_Land_Launch_Limits.FData.Vehicle_Index := v_index;
  dmTTT.insertHelicopter(Helicopter_Land_Launch_Limits);
end;

procedure TfrmHelicopterLimitations.updateHelicopterLimitations;
begin
  if dmTTT.GetHelicopter(v_index,H_List) > 0 then
  begin
    getData;
    dmTTT.updateHelicopter(Helicopter_Land_Launch_Limits, IntToStr(v_index));
  end
  else
  begin
    insertHelicopterLimitations;
  end;
end;

procedure TfrmHelicopterLimitations.getData;
begin
  with Helicopter_Land_Launch_Limits.FData do
  begin
    Max_Turn_Rate_To_Launch     := StrToInt(edtShipMaxTurnRate_toLaunch.Text);
    Max_Turn_Rate_To_Land       := StrToInt(edtShipMaxTurnRate_toLand.Text);
    Max_Relative_Wind_Magnitude := StrToFloat(edtMaxRelativeWindMagnitude.Text);
    Max_Relative_Speed          := StrToInt(edtMaxRelativeSpeedToLand.Text);
    Approach_Center_Bearing     := StrToInt(edtApproachCentBearing.Text);
    Approach_Sector_Width       := StrToInt(edtApproachSectorWidth.Text);
    Approach_Range              := StrToFloat(edtApproachRange.Text);
    Max_Landing_Altitude        := StrToFloat(edtMaxLandingAltitude.Text);
  end;
end;

procedure TfrmHelicopterLimitations.refreshData;
begin
  with Helicopter_Land_Launch_Limits.FData do
  begin
    Max_Turn_Rate_To_Launch     := 0;
    Max_Turn_Rate_To_Land       := 0;
    Max_Relative_Wind_Magnitude := 0;
    Max_Relative_Speed          := 0;
    Approach_Center_Bearing     := 0;
    Approach_Sector_Width       := 0;
    Approach_Range              := 0;
    Max_Landing_Altitude        := 0;
  end;
end;

end.
