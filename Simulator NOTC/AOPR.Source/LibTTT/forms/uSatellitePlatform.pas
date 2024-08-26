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
    lblClass: TStaticText;
    edtClass: TEdit;
    PageControl1: TPageControl;
    General: TTabSheet;
    Physical: TTabSheet;
    Notes: TTabSheet;
    grbRecognition: TGroupBox;
    lblDetectionRangeRadius: TStaticText;
    cbPlatformType: TCheckBox;
    cbPlatformClass: TCheckBox;
    edtDetectionRangeRadius: TEdit;
    lblnmDetectionRange: TStaticText;
    lblAltitude: TStaticText;
    edtAltitude: TEdit;
    lblFeetAltitude: TStaticText;
    lblGameArea: TStaticText;
    edtGameArea: TEdit;
    lblHoursGameArea: TStaticText;
    lblGroundSpeed: TStaticText;
    edtGroundSpeed: TEdit;
    lblKnotsGroundSpeed: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grbDimensions: TGroupBox;
    grbRadarCrossSection: TGroupBox;
    lblLength: TStaticText;
    edtLength: TEdit;
    lblFeetLength: TStaticText;
    lblWidth: TStaticText;
    edtWidth: TEdit;
    lblFeetWidth: TStaticText;
    lblHeight: TStaticText;
    edtHeight: TEdit;
    lblFeetHeight: TStaticText;
    lblFront: TStaticText;
    edtFront: TEdit;
    lblSide: TStaticText;
    edtSide: TEdit;
    cbxDbm2Front: TComboBox;
    cbxDbm2Side: TComboBox;
    mmNotes: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure insert;
    procedure update;
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure refresh;
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
  uSimDBEditor, uSatelliteList;

{$R *.dfm}

procedure TSatellitePlatformForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    insert;
    isNew := False;
  end
  else
    update;
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

procedure TSatellitePlatformForm.update;
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
    with SIMMgr do
    begin
      getSatellite_Definition(StrToInt(SatelliteListForm.lbIdSatellites.Items.Strings[SatelliteListForm.lbSatellites.ItemIndex]), Self.satelliteObject);
    end;

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
      edtLength.Text := FloatToStr(satelliteObject.FData.Length);
      edtWidth.Text := FloatToStr(satelliteObject.FData.Width);
      edtHeight.Text := FloatToStr(satelliteObject.FData.Height);
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
