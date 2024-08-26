unit uEnvironmentdataPanels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TEnvironmentDataPanelsForm = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    Panel3: TPanel;
    btnD: TSpeedButton;
    btnF: TSpeedButton;
    btnG: TSpeedButton;
    btnH: TSpeedButton;
    cbxTop: TComboBox;
    btnA: TSpeedButton;
    btnB: TSpeedButton;
    btnE: TSpeedButton;
    btnC: TSpeedButton;
    grbCursorPosition: TGroupBox;
    grbSelectedSubArea: TGroupBox;
    grbSonarPrediction: TGroupBox;
    BearingCursor: TStaticText;
    DistanceCursor: TStaticText;
    PositionCursor: TStaticText;
    GridCursor: TStaticText;
    lblBearingCursor1: TLabel;
    lblDistanceCursor1: TLabel;
    lblPositionCursor1: TLabel;
    lblGridCursor1: TLabel;
    lbldegreesT: TLabel;
    lblnm: TLabel;
    lblPositionCursor2: TLabel;
    lblGridCursor2: TLabel;
    IdentifierSelected: TStaticText;
    TopLeft: TStaticText;
    PositionTopSelected: TStaticText;
    GridTopSelected: TStaticText;
    btnEditSelectedSubArea: TButton;
    lblIdentifierSelected: TLabel;
    lblPositionTopSelected1: TLabel;
    lbGridTopSelected1: TLabel;
    lblPositionTopSelected2: TLabel;
    lbGridTopSelected2: TLabel;
    DefaultsSonar: TStaticText;
    edtDefaultsSonar: TEdit;
    SpeedButton4: TSpeedButton;
    Sonar: TStaticText;
    edtSonar: TEdit;
    SpeedButton5: TSpeedButton;
    SonarModeSonar: TStaticText;
    SonarDepthSonar: TStaticText;
    TargetSourceLevelSonar: TStaticText;
    TargetCrossSectionSonar: TStaticText;
    TargetDepthSonar: TStaticText;
    PredictionRangeSonar: TStaticText;
    cbxSonarModeSonar: TComboBox;
    edtSonarDepthSonar: TEdit;
    edtTargetSourceLevelSonar: TEdit;
    edtTargetCrossSectionSonar: TEdit;
    edtTrgetDepthSonar: TEdit;
    edtPredictionRangeSonar: TEdit;
    feetSonarMode: TStaticText;
    dBSonar: TStaticText;
    dBmSonar: TStaticText;
    feetTargetDepth: TStaticText;
    nmPrediction: TStaticText;
    BottomRightSelected: TStaticText;
    PositionBottomSelected: TStaticText;
    GridBottomSelected: TStaticText;
    lblPositionBottomSelected1: TLabel;
    lblGridBottomSelected1: TLabel;
    lblPositionBottomSelected2: TLabel;
    lblGridBottomSelected2: TLabel;
    btnCalculateSonar: TButton;
    btnClose: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EnvironmentDataPanelsForm: TEnvironmentDataPanelsForm;

implementation

{$R *.dfm}

end.
