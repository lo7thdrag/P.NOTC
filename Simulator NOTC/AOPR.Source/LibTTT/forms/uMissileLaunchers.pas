unit uMissileLaunchers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, newClassASTT ;

type
  TMissileLaunchersForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblMaxQuantity: TStaticText;
    edtMaxQuantity: TEdit;
    cbxName: TComboBox;
    GroupBox1: TGroupBox;
    lblAngle: TStaticText;
    edtAngle: TEdit;
    cbAngleRequired: TCheckBox;
    procedure getMount;
    procedure FormShow(Sender: TObject);
    procedure cbAngleRequiredClick(Sender: TObject);
    procedure getData;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fitted_launch : TFitted_Weap_Launcher_On_Board;

  end;

var
  MissileLaunchersForm: TMissileLaunchersForm;

implementation

{$R *.dfm}

uses uDataModuleTTT,uMissileMountForm;

procedure TMissileLaunchersForm.btnApplyClick(Sender: TObject);
begin
  getData;
  if dmTTT.GetFitted_Weap_Launcher_On_Board(MissileMountForm.missile_fitted.FData.Fitted_Weap_Index,
  MissileMountForm.missile_fitted.FLaunch) then
  begin
    dmTTT.UpdateFitted_Weap_Launcher_On_Board(IntToStr(MissileMountForm.missile_fitted.FData.Fitted_Weap_Index),
    IntToStr(0),fitted_launch);
  end
  else
    dmTTT.InsertFitted_Weap_Launcher_On_Board(fitted_launch.FData);
end;

procedure TMissileLaunchersForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TMissileLaunchersForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TMissileLaunchersForm.cbAngleRequiredClick(Sender: TObject);
begin
  if cbAngleRequired.Checked then
    edtAngle.Enabled := True
  else
    edtAngle.Enabled := False;
end;


procedure TMissileLaunchersForm.FormCreate(Sender: TObject);
begin
  fitted_launch := TFitted_Weap_Launcher_On_Board.Create;
end;

procedure TMissileLaunchersForm.FormShow(Sender: TObject);
begin
  edtMaxQuantity.Clear;
  edtAngle.Clear;
  getMount;
end;

procedure TMissileLaunchersForm.getMount;
var i: integer;
begin
  with fitted_launch.FData do begin
    cbxName.Text        := IntToStr(Launcher_Type);
    edtMaxQuantity.Text := IntToStr(Launcher_Max_Qty);
    if Launcher_Angle_Required = 1 then
      cbAngleRequired.Checked := True
    else
      cbAngleRequired.Checked := False;
    edtAngle.Text    := IntToStr(Launcher_Angle);
  end;
end;

procedure TMissileLaunchersForm.getData;
begin
  with fitted_launch.FData do
  begin
    if cbxName.ItemIndex <> -1 then
      Launcher_Type := cbxName.ItemIndex
    else
      Launcher_Type := 0;
    if cbAngleRequired.Checked then
    begin
      Launcher_Angle_Required := 1;
      Launcher_Angle  := StrToInt(edtAngle.Text);
    end
    else
      Launcher_Angle  := 0;
    Launcher_Max_Qty  := StrToInt(edtMaxQuantity.Text);
    Fitted_Weap_Index := MissileMountForm.missile_fitted.FData.Fitted_Weap_Index;
  end;


end;



end.
