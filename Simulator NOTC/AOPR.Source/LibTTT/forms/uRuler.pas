unit uRuler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uGameData_TTT, uDrawOverlay, uSimObjects;

type
  TfrmRuler = class(TForm)
    grpLine: TGroupBox;
    btn1: TSpeedButton;
    lbl1: TLabel;
    lbl2: TLabel;
    btn2: TSpeedButton;
    lblDistance: TLabel;
    edtRulerStartPosLat: TEdit;
    edtRulerStartPosLong: TEdit;
    edtRulerEndPosLat: TEdit;
    edtRulerEndPosLong: TEdit;
    cbbFormat: TComboBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lblDirection: TLabel;
    lblCounterDirection: TLabel;

    procedure btnHandlePosition(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtRulerStartPosLatChange(Sender: TObject);
    procedure edtRulerStartPosLongChange(Sender: TObject);
    procedure edtRulerEndPosLatChange(Sender: TObject);
    procedure edtRulerEndPosLongChange(Sender: TObject);
    procedure cbbFormatChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtRulerStartPosLatKeyPress(Sender: TObject; var Key: Char);
    procedure edtRulerStartPosLongKeyPress(Sender: TObject; var Key: Char);
    procedure edtRulerEndPosLatKeyPress(Sender: TObject; var Key: Char);
    procedure edtRulerEndPosLongKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);


  private
    { Private declarations }
    FTagBtnPosition : Integer;
    {FPosX,FPosY,}FStartX, FStartY, FEndX, FEndY : Double;
    FSRulerTrack, FERulerTrack : TSimObject;
    FSRTrack, FERTrack : string;

    procedure SetERulerTrack(const Value: TSimObject);
    procedure SetSRulerTrack(const Value: TSimObject);


  public
    { Public declarations }

    ruler : TDrawRuler;
    IsSelected ,IsStart,IsEnd, IsSVisible,IsEVisible : Boolean;
    IdSRulerTrackIndex, IdERulerTrackIndex : Integer;
    STempX,STempY,ETempX,ETempY : Double;


    procedure FillEditText;
    procedure FillDistanceLabel;
    procedure FillDirectionLabel;
//    procedure SetSRTrackPlatform;
//    procedure SetERTrackPlatform;

//    property PositionX : Double read FPosX write FPosX;
//    property PositionY : Double read FPosY write FPosY;
    property StartPosX : Double read FStartX write FStartX;
    property StartPosY : Double read FStartY write FStartY;
    property EndPosX : Double read FEndX write FEndX;
    property EndPosY : Double read FEndY write FEndY;
    property SRulerTrack : TSimObject read FSRulerTrack write SetSRulerTrack;
    property ERulerTrack : TSimObject read FERulerTrack write SetERulerTrack;

  end;

var
  frmRuler: TfrmRuler;

implementation

{$R *.dfm}
uses ufTacticalDisplay, tttData, uBaseCoordSystem, uSimMgr_Client, uT3Unit,
  ufrmKeyboard;



procedure TfrmRuler.btnHandlePosition(Sender: TObject);
begin
  if (Sender is TSpeedButton)  then
  begin
    FTagBtnPosition := TSpeedButton(Sender).Tag;
    case FTagBtnPosition of
      1 :
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtRuler;
        IsStart := True;
        IsEnd := False;
        btn1.Down := True; btn2.Down := False;
      end;
      2 :
      begin
        frmTacticalDisplay.Map1.CurrentTool := mtRuler;
        IsEnd := True;
        IsStart := False;
        btn1.Down := False; btn2.Down := True;
      end;
    end;
  end;
end;


procedure TfrmRuler.cbbFormatChange(Sender: TObject);
begin
  FillDistanceLabel;
  FillDirectionLabel;
end;


procedure TfrmRuler.edtRulerEndPosLatChange(Sender: TObject);
begin
  FEndY := dmsToLatt(edtRulerEndPosLat.Text);
  FillDistanceLabel;
  FillDirectionLabel;
end;

procedure TfrmRuler.edtRulerEndPosLatKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    FEndY := dmsToLatt(edtRulerEndPosLat.Text);
    FillDistanceLabel;
    simMgrClient.DrawRuler.postEnd.X := FEndX;
    simMgrClient.DrawRuler.postEnd.Y := FEndY;
    FillDirectionLabel;
  end;
end;

procedure TfrmRuler.edtRulerEndPosLongChange(Sender: TObject);
begin
  FEndX := dmsToLong(edtRulerEndPosLong.Text);
  FillDistanceLabel;
  FillDirectionLabel;
end;

procedure TfrmRuler.edtRulerEndPosLongKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    FEndX := dmsToLong(edtRulerEndPosLong.Text);
    FillDistanceLabel;
    simMgrClient.DrawRuler.postEnd.X := FEndX;
    simMgrClient.DrawRuler.postEnd.Y := FEndY;
    FillDirectionLabel;
  end;
end;

procedure TfrmRuler.edtRulerStartPosLatChange(Sender: TObject);
begin
  FStartY := dmsToLatt(edtRulerStartPosLat.Text);
  FillDistanceLabel;
  FillDirectionLabel;
end;

procedure TfrmRuler.edtRulerStartPosLatKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
  begin
    FStartY := dmsToLatt(edtRulerStartPosLat.Text);
    FillDistanceLabel;
    simMgrClient.DrawRuler.postStart.X := FStartX;
    simMgrClient.DrawRuler.postStart.Y := FStartY;
    FillDirectionLabel;
  end;
end;

procedure TfrmRuler.edtRulerStartPosLongChange(Sender: TObject);
begin
  FStartX := dmsToLong(edtRulerStartPosLong.Text);
  FillDistanceLabel;
  FillDirectionLabel;
end;

procedure TfrmRuler.edtRulerStartPosLongKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    FStartX := dmsToLong(edtRulerStartPosLong.Text);
    FillDistanceLabel;
    simMgrClient.DrawRuler.postStart.X := FStartX;
    simMgrClient.DrawRuler.postStart.Y := FStartY;
    FillDirectionLabel;
  end;
end;

procedure TfrmRuler.FillDirectionLabel;
var
  deg,cdeg : Double;
begin
  deg := CalcBearing(FStartX,FStartY,FEndX,FEndY);
  cdeg := CalcBearing(FEndX,FEndY,FStartX,FStartY);
  lblDirection.Caption := 'Bearing : ' + formatfloat('0.00',deg) + ' °';
  lblCounterDirection.Caption := '             ' + FormatFloat('0.00',cdeg)
     + ' °';
end;

procedure TfrmRuler.FillDistanceLabel;
var
  nmi, km, yd, m, ft, mi : Double;
begin
  nmi := CalcRange(FStartX,FStartY,FEndX,FEndY);
  m := nmi * C_NauticalMile_To_Metre;
  km := m / 1000;
  yd := nmi * C_NauticalMile_To_Yards;
  ft := nmi * C_NauticalMile_To_Feet;
  mi := nmi * 1.15077945;
  case cbbFormat.ItemIndex of
    0:
    begin
      lblDistance.Caption := 'Range : ' + formatfloat('0.00',nmi) + ' nmi';
    end;
    1:
    begin
      lblDistance.Caption := 'Range : ' + FormatFloat('0.00',mi) + ' mi';
    end;
    2:
    begin
      lblDistance.Caption := 'Range : ' + formatfloat('0.00',km) + ' km';
    end;
    3:
    begin
      lblDistance.Caption := 'Range : ' + formatfloat('0.00',yd) + ' yd';
    end;
    4:
    begin
      lblDistance.Caption := 'Range : ' + formatfloat('0.00',m) + ' m';
    end;
    5:
    begin
      lblDistance.Caption := 'Range : ' + formatfloat('0.00',ft) + ' ft';
    end;
  end;

end;

procedure TfrmRuler.FillEditText;
begin
  simMgrClient.DrawRuler.postStart.X := FStartX;
  simMgrClient.DrawRuler.postStart.Y := FStartY;
  edtRulerStartPosLat.Text := formatDMS_latt(FStartY);
  edtRulerStartPosLong.Text := formatDMS_long(FStartX);

  simMgrClient.DrawRuler.postEnd.X := FEndX;
  simMgrClient.DrawRuler.postEnd.Y := FEndY;
  edtRulerEndPosLat.Text := formatDMS_latt(FEndY);
  edtRulerEndPosLong.Text := formatDMS_long(FEndX);

  FillDistanceLabel;
  FillDirectionLabel;

end;

procedure TfrmRuler.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmRuler.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmTacticalDisplay.Map1.CurrentTool := mtSelectObject;
  simMgrClient.DrawRuler.IsVisible := False;
end;

procedure TfrmRuler.FormShow(Sender: TObject);
begin
  edtRulerStartPosLat.Text := formatDMS_latt(FStartY);
  edtRulerStartPosLong.Text := formatDMS_long(FStartX);
  edtRulerEndPosLat.Text := formatDMS_latt(FEndY);
  edtRulerEndPosLong.Text := formatDMS_long(FEndX);
  lblDistance.Caption := 'Range :';
  lblDirection.Caption := 'Bearing :';
  lblCounterDirection.Caption := '';
  simMgrClient.DrawRuler.IsVisible := True;
end;


{procedure TfrmRuler.SetERTrackPlatform;
begin
  if Assigned(ERulerTrack) then
  begin
    if ERulerTrack is TT3PlatformInstance then
      FERTrack := TT3PlatformInstance(ERulerTrack).Track_ID;
    IdERulerTrackIndex := TT3PlatformInstance(ERulerTrack).InstanceIndex;

  end;
end;  }

procedure TfrmRuler.SetERulerTrack(const Value: TSimObject);
begin
  FERulerTrack := Value;
end;

{procedure TfrmRuler.SetSRTrackPlatform;
begin
  if Assigned(SRulerTrack) then
  begin
    if SRulerTrack is TT3PlatformInstance then
      FSRTrack := TT3PlatformInstance(SRulerTrack).Track_ID;
    IdSRulerTrackIndex := TT3PlatformInstance(SRulerTrack).InstanceIndex;

  end;
end;     }


procedure TfrmRuler.SetSRulerTrack(const Value: TSimObject);
begin
  FSRulerTrack := Value;
end;



end.
