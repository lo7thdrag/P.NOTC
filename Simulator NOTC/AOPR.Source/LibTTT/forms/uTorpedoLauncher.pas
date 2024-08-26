unit uTorpedoLauncher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, newClassASTT;

type
  TTorpedoLauncherForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    cbxName: TComboBox;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblMaxQuantity: TStaticText;
    edtMaxQuantity: TEdit;
    GroupBox1: TGroupBox;
    lblAngle: TStaticText;
    edtAngle: TEdit;
    cbAngleRequired: TCheckBox;

    procedure getData;
    procedure getMount;
    procedure cbAngleRequiredClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    launch : TFitted_Weap_Launcher_On_Board;
  end;

var
  TorpedoLauncherForm: TTorpedoLauncherForm;

implementation

{$R *.dfm}

uses uDataModuleTTT,uTorpedoMounts;

procedure TTorpedoLauncherForm.getMount;
var i: integer;
begin
  with launch.FData do begin
    cbxName.Text        := IntToStr(Launcher_Type);
    edtMaxQuantity.Text := IntToStr(Launcher_Max_Qty);
    if Launcher_Angle_Required = 1 then
      cbAngleRequired.Checked := True
    else
      cbAngleRequired.Checked := False;
    edtAngle.Text    := IntToStr(Launcher_Angle);
  end;
end;

procedure TTorpedoLauncherForm.btnApplyClick(Sender: TObject);
begin
  getData;
  if dmTTT.GetFitted_Weap_Launcher_On_Board(TorpedoMountsForm.torpedo.FData.Fitted_Weap_Index,
  TorpedoMountsForm.torpedo.FLaunch) then
  begin
    dmTTT.UpdateFitted_Weap_Launcher_On_Board(IntToStr(TorpedoMountsForm.torpedo.FData.Fitted_Weap_Index),
    IntToStr(0),launch)
  end
  else
    dmTTT.InsertFitted_Weap_Launcher_On_Board(launch.FData);
end;

procedure TTorpedoLauncherForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTorpedoLauncherForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TTorpedoLauncherForm.cbAngleRequiredClick(Sender: TObject);
begin
  if cbAngleRequired.Checked then
    edtAngle.Enabled := True
  else
    edtAngle.Enabled := False;
end;

procedure TTorpedoLauncherForm.FormCreate(Sender: TObject);
begin
  launch  := TFitted_Weap_Launcher_On_Board.Create;
end;

procedure TTorpedoLauncherForm.FormShow(Sender: TObject);
begin
  edtMaxQuantity.Clear;
  edtAngle.Clear;
  getMount;

end;

procedure TTorpedoLauncherForm.getData;
begin
  with launch.FData do
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
    Fitted_Weap_Index := TorpedoMountsForm.torpedo.FData.Fitted_Weap_Index;
  end;
end;

end.
