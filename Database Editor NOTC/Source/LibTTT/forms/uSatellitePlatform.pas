unit uSatellitePlatform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Satellite;

type
  TSatellitePlatformForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtClass: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Physical: TTabSheet;
    Notes: TTabSheet;
    grbRecognition: TGroupBox;
    cbPlatformType: TCheckBox;
    cbPlatformClass: TCheckBox;
    edtDetectionRangeRadius: TEdit;
    edtAltitude: TEdit;
    edtGameArea: TEdit;
    edtGroundSpeed: TEdit;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grbDimensions: TGroupBox;
    grbRadarCrossSection: TGroupBox;
    edtLength: TEdit;
    edtWidth: TEdit;
    edtHeight: TEdit;
    edtFront: TEdit;
    edtSide: TEdit;
    cbxDbm2Front: TComboBox;
    cbxDbm2Side: TComboBox;
    mmNotes: TMemo;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure insert;
    procedure SatellitePlatformupdate;
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure refresh;
    procedure edtDetectionRangeRadiusKeyPress(Sender: TObject; var Key: Char);
    procedure edtAltitudeKeyPress(Sender: TObject; var Key: Char);
    procedure edtGameAreaKeyPress(Sender: TObject; var Key: Char);
    procedure edtGroundSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtFrontKeyPress(Sender: TObject; var Key: Char);
    procedure edtSideKeyPress(Sender: TObject; var Key: Char);
    procedure edtDetectionRangeRadiusKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAltitudeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGameAreaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtGroundSpeedKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtLengthKeyPress(Sender: TObject; var Key: Char);
    procedure edtLengthKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtWidthKeyPress(Sender: TObject; var Key: Char);
    procedure edtWidthKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtHeightKeyPress(Sender: TObject; var Key: Char);
    procedure edtHeightKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFrontKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSideKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    isNew,isCopy : boolean;
    satelliteObject : TSatellite_Definition;

    { Public declarations }
  end;

var
  SatellitePlatformForm: TSatellitePlatformForm;

implementation

uses
  uSimDBEditor, uSatelliteList, uSatelliteSelect;

{$R *.dfm}

procedure TSatellitePlatformForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    insert;
    isNew := False;
  end
  else
    SatellitePlatformupdate;
end;

procedure TSatellitePlatformForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TSatellitePlatformForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  close;
  SatelliteListForm.refresh;
  fSatellite.getAllSatellite;
end;

procedure TSatellitePlatformForm.edtAltitudeKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtAltitude.Text := FormatFloat('0.00', StrToFloat(edtAltitude.Text));
end;

procedure TSatellitePlatformForm.edtAltitudeKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtAltitude.Text = '' then
    Exit;

   if (StrToFloat(edtAltitude.Text) > 500000)  then
    begin
      ShowMessage('Incorrect value');
      edtAltitude.Text := '500000';
      edtAltitude.Text := FormatFloat('0.00', StrToFloat(edtAltitude.Text));
    end;
end;

procedure TSatellitePlatformForm.edtDetectionRangeRadiusKeyPress(
  Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDetectionRangeRadius.Text := FormatFloat('0.00', StrToFloat(edtDetectionRangeRadius.Text));
end;

procedure TSatellitePlatformForm.edtDetectionRangeRadiusKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtDetectionRangeRadius.Text = '' then
    Exit;

   if (StrToFloat(edtDetectionRangeRadius.Text) > 500)  then
    begin
      ShowMessage('Incorrect value');
      edtDetectionRangeRadius.Text := '500';
      edtDetectionRangeRadius.Text := FormatFloat('0.00', StrToFloat(edtDetectionRangeRadius.Text));
    end;
end;

procedure TSatellitePlatformForm.edtFrontKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtFront.Text := FormatFloat('0.00', StrToFloat(edtFront.Text));
end;

procedure TSatellitePlatformForm.edtFrontKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtFront.Text = '' then
    Exit;

   if (StrToFloat(edtFront.Text) > 500)  then
    begin
      ShowMessage('Incorrect value');
      edtFront.Text := '500';
      edtFront.Text := FormatFloat('0.00', StrToFloat(edtFront.Text));
    end;
end;

procedure TSatellitePlatformForm.edtGameAreaKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtGameArea.Text := FormatFloat('0.00', StrToFloat(edtGameArea.Text));
end;

procedure TSatellitePlatformForm.edtGameAreaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtGameArea.Text = '' then
    Exit;

   if (StrToFloat(edtGameArea.Text) > 10000)  then
    begin
      ShowMessage('Incorrect value');
      edtGameArea.Text := '10000';
    //  edtGameArea.Text := FormatFloat('0.00', StrToFloat(edtGameArea.Text));
    end;
end;

procedure TSatellitePlatformForm.edtGroundSpeedKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtGroundSpeed.Text := FormatFloat('0.00', StrToFloat(edtGroundSpeed.Text));
end;

procedure TSatellitePlatformForm.edtGroundSpeedKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtGroundSpeed.Text = '' then
    Exit;

   if (StrToFloat(edtGroundSpeed.Text) > 50000)  then
    begin
      ShowMessage('Incorrect value');
      edtGroundSpeed.Text := '50000';
    //  edtGroundSpeed.Text := FormatFloat('0.00', StrToFloat(edtGroundSpeed.Text));
    end;
end;

procedure TSatellitePlatformForm.edtHeightKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtHeight.Text := FormatFloat('0.00', StrToFloat(edtHeight.Text));
end;

procedure TSatellitePlatformForm.edtHeightKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtHeight.Text = '' then
    Exit;

   if (StrToFloat(edtHeight.Text) > 86900)  then
    begin
      ShowMessage('Incorrect value');
      edtHeight.Text := '86900';
      edtHeight.Text := FormatFloat('0.00', StrToFloat(edtHeight.Text));
    end;
end;

procedure TSatellitePlatformForm.edtLengthKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtLength.Text := FormatFloat('0.00', StrToFloat(edtLength.Text));
end;

procedure TSatellitePlatformForm.edtLengthKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtLength.Text = '' then
    Exit;

   if (StrToFloat(edtLength.Text) > 89000)  then
    begin
      ShowMessage('Incorrect value');
      edtLength.Text := '89000';
      edtLength.Text := FormatFloat('0.00', StrToFloat(edtLength.Text));
    end;
end;

procedure TSatellitePlatformForm.edtSideKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtSide.Text := FormatFloat('0.00', StrToFloat(edtSide.Text));
end;

procedure TSatellitePlatformForm.edtSideKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtSide.Text = '' then
    Exit;

   if (StrToFloat(edtSide.Text) > 700)  then
    begin
      ShowMessage('Incorrect value');
      edtSide.Text := '700';
      edtSide.Text := FormatFloat('0.00', StrToFloat(edtSide.Text));
    end;
end;

procedure TSatellitePlatformForm.edtWidthKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtWidth.Text := FormatFloat('0.00', StrToFloat(edtWidth.Text));
end;

procedure TSatellitePlatformForm.edtWidthKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtWidth.Text = '' then
    Exit;

   if (StrToFloat(edtWidth.Text) > 86500)  then
    begin
      ShowMessage('Incorrect value');
      edtWidth.Text := '86500';
      edtWidth.Text := FormatFloat('0.00', StrToFloat(edtWidth.Text));
    end;
end;

procedure TSatellitePlatformForm.FormCreate(Sender: TObject);
begin
  satelliteObject := TSatellite_Definition.Create;
end;

procedure TSatellitePlatformForm.insert;
begin
  with satelliteObject.FData do
  begin
    Satellite_Identifier := edtClass.Text;
    Platform_Domain := Platform_Domain;     //masih aslinya
    Platform_Category := Platform_Category;
    Platform_Type := Platform_Type;
    Length := StrToFloat(edtLength.Text);
    Width := StrToFloat(edtWidth.Text);
    Height := StrToFloat(edtHeight.Text);
    Front_Radar_Cross := StrToFloat(edtFront.Text);
    Side_Radar_Cross := StrToFloat(edtSide.Text);
    Orbit_Period := StrToInt(edtGameArea.Text);
    Detection_Range_Radius := StrToFloat(edtDetectionRangeRadius.Text);
    Altitude := StrToFloat(edtAltitude.Text);
    Ground_Speed := StrToFloat(edtGroundSpeed.Text);

    if cbPlatformType.Checked then
    begin
      Plat_Type_Recog_Capability := 1
    end
    else
    begin
      Plat_Type_Recog_Capability := 0;
    end;

    if cbPlatformClass.Checked then
    begin
      Plat_Class_Recog_Capability := 1;
    end
    else
    begin
      Plat_Class_Recog_Capability := 0;
    end;

    satelliteObject.FNote.Notes := mmNotes.Lines.Text;
  end;

  with simMgr do
  begin
      insertSatellite_Def(satelliteObject);
  end;

end;

procedure TSatellitePlatformForm.SatellitePlatformupdate;
begin
  with satelliteObject.FData do
  begin
    Satellite_Identifier := edtClass.Text;
    Platform_Domain      := Platform_Domain;     //masih aslinya
    Platform_Category    := Platform_Category;
    Platform_Type        := Platform_Type;
    Length               := StrToFloat(edtLength.Text);
    Width                := StrToFloat(edtWidth.Text);
    Height               := StrToFloat(edtHeight.Text);
    Front_Radar_Cross    := StrToFloat(edtFront.Text);
    Side_Radar_Cross     := StrToFloat(edtSide.Text);
    Orbit_Period         := StrToInt(edtGameArea.Text);
    Detection_Range_Radius := StrToFloat(edtDetectionRangeRadius.Text);
    Altitude               := StrToFloat(edtAltitude.Text);
    Ground_Speed           := StrToFloat(edtGroundSpeed.Text);

    if cbPlatformType.Checked then
    begin
      Plat_Type_Recog_Capability := 1
    end
    else
    begin
      Plat_Type_Recog_Capability := 0;
    end;

    if cbPlatformClass.Checked then
    begin
      Plat_Class_Recog_Capability := 1;
    end
    else
    begin
      Plat_Class_Recog_Capability := 0;
    end;

    satelliteObject.FNote.Notes := mmNotes.Lines.Text;
  end;

  with simMgr do
  begin
   updateSatellite_Def(satelliteObject, IntToStr(satelliteObject.FData.Satellite_Index));
  end;
end;

procedure TSatellitePlatformForm.refresh;
begin
  begin
//    with SIMMgr do
//    begin
//      getSatellite_Definition(StrToInt(SatelliteListForm.lbIdSatellites.Items.Strings[SatelliteListForm.lbSatellites.ItemIndex]), Self.satelliteObject);
//    end;

    with Self do
    begin
      isNew := false;
      if isCopy then
      begin
         edtClass.Text := 'Copy of ' + satelliteObject.FData.Satellite_Identifier;
         isNew := True;
      end
      else
        edtClass.Text := satelliteObject.FData.Satellite_Identifier;
      edtDetectionRangeRadius.Text := FloatToStr(satelliteObject.FData.Detection_Range_Radius);
      edtAltitude.Text := FloatToStr(satelliteObject.FData.Altitude);
      edtGameArea.Text := FloatToStr(satelliteObject.FData.Orbit_Period);
      edtGroundSpeed.Text := FloatToStr(satelliteObject.FData.Ground_Speed);
      edtLength.Text := FloatToStr(Round(satelliteObject.FData.Length));//(floattostr((satelliteObject.FData.Length));
      edtWidth.Text := FloatToStr(Round(satelliteObject.FData.Width));
      edtHeight.Text := FloatToStr(Round(satelliteObject.FData.Height));
      edtFront.Text := FloatToStr(satelliteObject.FData.Front_Radar_Cross);
      edtSide.Text := FloatToStr(satelliteObject.FData.Side_Radar_Cross);

      if satelliteObject.FData.Plat_Type_Recog_Capability = 0 then
      begin
        cbPlatformType.Checked := false;
      end
      else
      begin
        cbPlatformType.Checked := true;
      end;

      if satelliteObject.FData.Plat_Class_Recog_Capability = 0 then
      begin
        cbPlatformClass.Checked := false;
      end
      else
      begin
        cbPlatformClass.Checked := true;
      end;

      Show;
    end;
  end;
end;

end.
