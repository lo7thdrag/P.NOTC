unit uSettingCoordinate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TfSettingCoordinate = class(TForm)
    pnl2: TPanel;
    pnl1: TPanel;
    rbLongLat: TRadioButton;
    rbCartesianGrid: TRadioButton;
    rbGeoref: TRadioButton;
    chkShowFormation: TCheckBox;
    lb1: TLabel;
    lb2: TLabel;
    edtForceAffiliation: TEdit;
    edtColorScheme: TEdit;
    rb4: TRadioButton;
    rbController: TRadioButton;
    rbCubicle: TRadioButton;
    rbIdentifier: TRadioButton;
    chk1: TCheckBox;
    btnClose: TButton;
    btnWeapon: TSpeedButton;
    btn1: TSpeedButton;
    rbUTM: TRadioButton;
    rbMGRS: TRadioButton;
    rbKarvak: TRadioButton;
    pnlTabCoordinateSystem: TPanel;
    pnlContentCoordinateSystem: TPanel;
    pnlTabSettingCoord: TPanel;
    pnlContentSettingCoord: TPanel;
    pnlTabTrackSymbols: TPanel;
    pnlTabTrackLabels: TPanel;
    pnlTabOther: TPanel;
    pnlContentTrackSymbols: TPanel;
    pnlContentTrackLabels: TPanel;
    pnlContentOther: TPanel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbLongLatClick(Sender: TObject);
    procedure TabSetCoordinateClick(Sender: TObject);
  private
    FidCoordinat : integer;
    { Private declarations }
  public
    { Public declarations }

  published
    property IdCoordinat : integer read FidCoordinat write FidCoordinat;
  end;

var
  fSettingCoordinate: TfSettingCoordinate;

implementation

uses uT3Unit, uSimMgr_Client, uMapXHandler, ufTacticalDisplay;

{$R *.dfm}

procedure TfSettingCoordinate.btnCloseClick(Sender: TObject);
begin
  frmTacticalDisplay.btnOptions.Down := False;
  Close;
end;

procedure TfSettingCoordinate.FormCreate(Sender: TObject);
begin
  rbLongLat.Checked := True;
end;

procedure TfSettingCoordinate.rbLongLatClick(Sender: TObject);
var
  aRadioButton : TRadioButton;
begin
  aRadioButton := TRadioButton(sender);
  FidCoordinat := aRadioButton.Tag;

//  if aRadioButton.Tag = 6 then
//  begin
//    VSimMap.CheckLayerKarvak(True);
//  end
//  else
//  begin
//    VSimMap.CheckLayerKarvak(False);
//  end;
end;

procedure TfSettingCoordinate.TabSetCoordinateClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;


  if panel = pnlTabCoordinateSystem then
  begin
    if PanelTag = 0 then
    begin
      pnlTabCoordinateSystem.Color := RGB(44, 127, 161);
      pnlContentCoordinateSystem.BringToFront;
      pnlTabCoordinateSystem.Tag := 1;
      pnlTabTrackSymbols.Tag := 0;
      pnlTabTrackLabels.Tag := 0;
      pnlTabOther.Tag := 0;
      pnlTabTrackSymbols.Color := RGB(29, 81, 103);
      pnlTabTrackLabels.Color := RGB(29, 81, 103);
      pnlTabOther.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabTrackSymbols then
  begin
    if PanelTag = 0 then
    begin
      pnlTabTrackSymbols.Color := RGB(44, 127, 161);
      pnlContentTrackSymbols.BringToFront;
      pnlTabTrackSymbols.Tag := 1;
      pnlTabCoordinateSystem.Tag := 0;
      pnlTabTrackLabels.Tag := 0;
      pnlTabOther.Tag := 0;
      pnlTabCoordinateSystem.Color := RGB(29, 81, 103);
      pnlTabTrackLabels.Color := RGB(29, 81, 103);
      pnlTabOther.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabTrackLabels then
  begin
    if PanelTag = 0 then
    begin
      pnlTabTrackLabels.Color := RGB(44, 127, 161);
      pnlContentTrackLabels.BringToFront;
      pnlTabTrackLabels.Tag := 1;
      pnlTabCoordinateSystem.Tag := 0;
      pnlTabTrackSymbols.Tag := 0;
      pnlTabOther.Tag := 0;
      pnlTabCoordinateSystem.Color := RGB(29, 81, 103);
      pnlTabTrackSymbols.Color := RGB(29, 81, 103);
      pnlTabOther.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabOther then
  begin
    if PanelTag = 0 then
    begin
      pnlTabOther.Color := RGB(44, 127, 161);
      pnlContentOther.BringToFront;
      pnlTabOther.Tag := 1;
      pnlTabCoordinateSystem.Tag := 0;
      pnlTabTrackSymbols.Tag := 0;
      pnlTabTrackLabels.Tag := 0;
      pnlTabCoordinateSystem.Color := RGB(29, 81, 103);
      pnlTabTrackSymbols.Color := RGB(29, 81, 103);
      pnlTabTrackLabels.Color := RGB(29, 81, 103);
    end;
  end;
end;

end.
