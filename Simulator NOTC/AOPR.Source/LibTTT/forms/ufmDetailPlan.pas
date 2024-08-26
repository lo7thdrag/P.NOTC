unit ufmDetailPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uFormUtil, uSimObjects, uT3Torpedo;

type
  TPlanDetail = class(TForm)
    bvl1: TBevel;
    bvl2: TBevel;
    bvl3: TBevel;
    bvl4: TBevel;
    btnAcousticTorpedoLaunch: TButton;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lblAcousticTorpedoStatus: TLabel;
    lblNeme: TLabel;
    lblTube: TLabel;
    lblTrack: TLabel;
    lblIdentity: TLabel;
    lblPropulsion: TLabel;
    lblCourse: TLabel;
    lblSpeed: TLabel;
    lblDepth: TLabel;
    lblBearing: TLabel;
    lblRange: TLabel;
    lblStatus: TLabel;
    lblCloseCourse: TLabel;
    lblLaunchCourse: TLabel;
    lblTime: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnAcousticTorpedoLaunchClick(Sender: TObject);
  private
    { Private declarations }
  public
    focused_weapon: TSimObject;
    { Public declarations }
  end;

var
  fPlanDetail: TPlanDetail;

implementation

{$R *.dfm}



{ TPlanDetail }

{ TPlanDetail }

procedure TPlanDetail.btnAcousticTorpedoLaunchClick(Sender: TObject);
begin
  Close
end;

procedure TPlanDetail.FormShow(Sender: TObject);
begin
  AlignFormToMonitor(0, apLeftTop, 350, 460, TForm(self));
end;

end.
