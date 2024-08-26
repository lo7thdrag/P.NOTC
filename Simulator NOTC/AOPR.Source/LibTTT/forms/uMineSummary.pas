unit uMineSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Weapon;

type
  TfMineSummary = class(TForm)
    Panel1: TPanel;
    lbl1: TLabel;
    edtClassMine: TEdit;
    Panel2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel3: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbCategory: TComboBox;
    cbMooringType: TComboBox;
    grbLethality: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edtLethality: TEdit;
    TrackBarLethality: TTrackBar;
    grbCapabilities: TGroupBox;
    cbxAntiSurface: TCheckBox;
    cbxAntiSubSurface: TCheckBox;
    TabSheet6: TTabSheet;
    Memo1: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    cbDetectabilityType: TComboBox;
    Label9: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edtMaxLayingDepth: TEdit;
    grbDimensions: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    edtLengthDimension: TEdit;
    edtWidthDimension: TEdit;
    edtHeightDimension: TEdit;
    edtEngagementRangeDimension: TEdit;
    grbAcousticCrossSection: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    edtFrontRadarPhysical: TEdit;
    cbFrontRadarPhysical: TComboBox;
    edtSideRadarPhysical: TEdit;
    cbSideRadarPhysical: TComboBox;
    grbProbOfDetonationCurve: TGroupBox;
    btnEditProbOfDetonanationCurve: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mine : TMine_On_Board;
    isCopy  : Boolean;
  end;

var
  fMineSummary: TfMineSummary;

implementation

{$R *.dfm}
uses uDataModuleTTT,uWeaponSingleList;

procedure TfMineSummary.btnApplyClick(Sender: TObject);
begin
  if fWeaponSingle.isNew then
  begin
    getData;
    dmTTT.insertMine_Def(mine);
    fWeaponSingle.isNew := False;
  end
  else
  begin
    getData;
    dmTTT.updateMine_Def(mine,IntToStr(mine.FMine_Def.Mine_Index));
  end;

end;

procedure TfMineSummary.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfMineSummary.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fWeaponSingle.refresh;
end;

procedure TfMineSummary.FormCreate(Sender: TObject);
begin
   mine := TMine_On_Board.Create;
end;

procedure TfMineSummary.getData;
begin

  with mine.FMine_Def do begin
    Mine_Identifier         := edtClassMine.Text;

    if cbCategory.ItemIndex = 0 then
      Platform_Category := 0
    else
      Platform_Category := cbCategory.ItemIndex-1;

   { Platform_Domain         := ;
    Platform_Type           := ;
    Mine_Classification     := ;    }
    Length                  := StrToFloat(edtLengthDimension.Text);
    Width                   := StrToFloat(edtWidthDimension.Text);
    Height                  := StrToFloat(edtHeightDimension.Text);

    if cbMooringType.ItemIndex = 0 then
      Mooring_Type  := 0
    else
      Mooring_Type  := 1;

    Max_Laying_Depth        := StrToFloat(edtMaxLayingDepth.Text);
    Front_Acoustic_Cross    := StrToFloat(edtFrontRadarPhysical.Text);
    Side_Acoustic_Cross     := StrToFloat(edtSideRadarPhysical.Text);
    Mine_Lethality          := StrToInt(edtLethality.Text);
    Engagement_Range        := StrToFloat(edtEngagementRangeDimension.Text);

    if cbxAntiSurface.Checked then
      Anti_Sur_Capable        := 1
    else
      Anti_Sur_Capable        := 0;

    if cbxAntiSubSurface.Checked then
      Anti_SubSur_Capable   := 1
    else
      Anti_SubSur_Capable   := 0;

    if cbDetectabilityType.ItemIndex = 0 then
      Detectability_Type      := 0
    else if cbDetectabilityType.ItemIndex = 1 then
      Detectability_Type      := 1
    else if cbDetectabilityType.ItemIndex = 2 then
      Detectability_Type      := 2
    else
      Detectability_Type      := 3;
  end;
end;

end.
