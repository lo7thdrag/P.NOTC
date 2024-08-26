unit uGuidance_unsure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TGuidanceForm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tabInitial: TTabSheet;
    tabLateral: TTabSheet;
    grbComboBoxGuidance: TGroupBox;
    cbxLateral: TComboBox;
    tabVertical: TTabSheet;
    grbResultStraightHeading: TGroupBox;
    Course: TLabel;
    edtCourse: TEdit;
    GroundSpeed: TLabel;
    degreesT: TLabel;
    cbxGroundSpeed: TComboBox;
    grbResultPatternonSelf: TGroupBox;
    PredifenedPattern: TLabel;
    AngularOffset: TLabel;
    degrees: TLabel;
    btnbrowse: TSpeedButton;
    edtPredifened: TEdit;
    edtAngularOffset: TEdit;
    grbResultPatternonTarget: TGroupBox;
    PredifinedPattern2: TLabel;
    AngularOffset2: TLabel;
    degress2: TLabel;
    btnBrowse2: TSpeedButton;
    Target: TLabel;
    btnSearch: TSpeedButton;
    edtPredifened2: TEdit;
    edtAngularOffset2: TEdit;
    edtTarget: TEdit;
    grbPatternOnPoint: TGroupBox;
    PredifenedPattern3: TLabel;
    AngularOffset3: TLabel;
    degrees3: TLabel;
    btnBrowse3: TSpeedButton;
    btnAdd: TSpeedButton;
    AnchorPosition: TLabel;
    AnchorGrid: TLabel;
    edtPredifened3: TEdit;
    edtAngularOffset3: TEdit;
    edtAnchorPosition1: TEdit;
    edtAnchorGrid1: TEdit;
    edtAnchorPosition2: TEdit;
    edtAnchorGrid2: TEdit;
    grbReturntoBase: TGroupBox;
    groundSpeed2: TLabel;
    Base: TLabel;
    btnSearch2: TSpeedButton;
    edtBase: TEdit;
    ComboBox1: TComboBox;
    grbStationKeepOnTrack: TGroupBox;
    Target2: TLabel;
    TargetRange: TLabel;
    SpeedButton1: TSpeedButton;
    AngleOffset2: TLabel;
    degrees4: TLabel;
    nm: TLabel;
    edtTargetRange: TEdit;
    edtAngleOffset2: TEdit;
    cbAbsoluteOffset: TCheckBox;
    edtTarget2: TEdit;
    grbStationKeepOnPosition: TGroupBox;
    AnchorPosition2: TLabel;
    AnchorGrid2: TLabel;
    btnSearch3: TSpeedButton;
    edtAnchorPosition21: TEdit;
    edtAnchorGrid21: TEdit;
    cbxDriftOnCurrent: TCheckBox;
    edtAnchorPosition22: TEdit;
    edtAnchorGrid22: TEdit;
    grbCircleOnTrack: TGroupBox;
    RangeOffset: TLabel;
    AngleOffset: TLabel;
    btnSearch4: TSpeedButton;
    Target3: TLabel;
    Radius: TLabel;
    Direction: TLabel;
    GroundSpeed3: TLabel;
    nm2: TLabel;
    nm3: TLabel;
    degrees5: TLabel;
    edtRangeOffset: TEdit;
    edtAngleOffset: TEdit;
    cbAbsoluteOffset2: TCheckBox;
    edtTarget3: TEdit;
    edtRadius: TEdit;
    cbxDirection: TComboBox;
    cbxGroundSpeed2: TComboBox;
    grbCircleOnPoint: TGroupBox;
    Radius2: TLabel;
    SpeedButton2: TSpeedButton;
    CentrePosition: TLabel;
    CentreGrid: TLabel;
    nm4: TLabel;
    Direction2: TLabel;
    GroundSpeed4: TLabel;
    edtRadius2: TEdit;
    edtCentrePosition1: TEdit;
    edtCentrePosition2: TEdit;
    edtCentreGrid1: TEdit;
    edtCentreGrid2: TEdit;
    cbxDirection2: TComboBox;
    cbxGroundspeed3: TComboBox;
    grbZigZag: TGroupBox;
    LegLength: TLabel;
    Amplitude: TLabel;
    BaseCourse: TLabel;
    Period: TLabel;
    nm6: TLabel;
    GroundSpeed5: TLabel;
    nm5: TLabel;
    degreesT2: TLabel;
    cbxLeglength: TComboBox;
    edtAmplitude: TEdit;
    edtBaseCourse: TEdit;
    edtPeriod: TEdit;
    cbxGroundspeed4: TComboBox;
    grbSinuate: TGroupBox;
    Amplitude2: TLabel;
    BaseCourse2: TLabel;
    Period2: TLabel;
    nm8: TLabel;
    GroundSpeed6: TLabel;
    nm7: TLabel;
    degreesT3: TLabel;
    edtAmplitude2: TEdit;
    edtBaseCourse2: TEdit;
    edtPeriod2: TEdit;
    cbxGroundSpeed6: TComboBox;
    grbShadow: TGroupBox;
    TargetRange2: TLabel;
    nm9: TLabel;
    Target4: TLabel;
    btnSearch5: TSpeedButton;
    edtTargetRange2: TEdit;
    edtTarget4: TEdit;
    grbEngagement: TGroupBox;
    TargetRange3: TLabel;
    nm10: TLabel;
    Target5: TLabel;
    btnSearch6: TSpeedButton;
    edtTargetRange3: TEdit;
    edtTarget5: TEdit;
    grbEvasion: TGroupBox;
    Target6: TLabel;
    btnSearch7: TSpeedButton;
    edtTarget6: TEdit;
    grbOutrun: TGroupBox;
    Target7: TLabel;
    btnSearch8: TSpeedButton;
    edtTarget7: TEdit;
    grbWaypoint: TGroupBox;
    Type1: TLabel;
    Heading: TLabel;
    Target8: TLabel;
    btnSearch9: TSpeedButton;
    cbxType: TComboBox;
    edtHeading: TEdit;
    edtTarget8: TEdit;
    degreesT4: TLabel;
    btnEditWaypoint: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GuidanceForm: TGuidanceForm;

implementation

{$R *.dfm}

end.
