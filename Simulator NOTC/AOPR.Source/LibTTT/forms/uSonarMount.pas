unit uSonarMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Sonar;

type
  TSonarMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    imgBlindZones: TImage;
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    lblBlindZones: TStaticText;
    lblHullMounted: TStaticText;
    edtHullMounted: TEdit;
    lblDeployTime: TStaticText;
    edtDeployTime: TEdit;
    lblStowTime: TStaticText;
    edtStowTime: TEdit;
    lblFeetHullMounted: TStaticText;
    lblFeetDeployTime: TStaticText;
    lblFeetStowTime: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    state : Integer;
    sonar : TSonar_On_Board;
    procedure getSonarForm;
  end;

Const
  isNew = 1;
  isCopy = 2;
  isEdit = 3;

var
  SonarMountForm: TSonarMountForm;

implementation

uses
  uVehicleAttributeWindow, uDataModuleTTT;

{$R *.dfm}

procedure TSonarMountForm.btnApplyClick(Sender: TObject);
begin
  getSonarForm;
  with sonar.FData do
  begin
     dmTTT.UpdateSonar_On_Board(IntToStr(Sonar_Instance_Index), sonar);
  end;
end;

procedure TSonarMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TSonarMountForm.FormCreate(Sender: TObject);
begin
  sonar := TSonar_On_Board.Create;
end;

procedure TSonarMountForm.FormShow(Sender: TObject);
begin
  if state = isNew then
  begin
     edtName.Text := 'noname';
     edtClassName.Text := '';
     edtHullMounted.Text := '0';
     edtDeployTime.Text := '0';
     edtStowTime.Text := '0';
  end
  else if state = isCopy then
  begin
     with sonar.FData do
     begin
       Instance_Identifier := sonar.FDef.Sonar_Identifier;
       Sonar_Index := sonar.FDef.Sonar_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := sonar.FDef.Sonar_Classification;

       cbMountExtension.ItemIndex := Instance_Type;
       edtName.Text := Instance_Identifier;
       edtClassName.Text := Instance_Identifier;
       edtHullMounted.Text := '0';
       edtDeployTime.Text := '0';
       edtStowTime.Text := '0';
     end;

  end
  else if state = isEdit then
  begin
     with sonar.FData do
     begin
       Instance_Identifier := sonar.FDef.Sonar_Identifier;
       Sonar_Index := sonar.FDef.Sonar_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := sonar.FDef.Sonar_Classification;

       cbMountExtension.ItemIndex := Instance_Type;
       edtName.Text := Instance_Identifier;
       edtClassName.Text := Instance_Identifier;
       edtHullMounted.Text := FloatToStr(Minimum_Depth);
       edtDeployTime.Text := FloatToStr(Time_2_Deploy);
       edtStowTime.Text := FloatToStr(Time_2_Stow);
     end;
  end;
end;

procedure TSonarMountForm.getSonarForm;
begin
   with sonar.FData do
   begin
     Instance_Identifier := edtName.Text;
     Instance_Type := cbMountExtension.ItemIndex;
     Minimum_Depth := StrToFloat(edtHullMounted.Text);
     Time_2_Deploy := StrToInt(edtDeployTime.Text);
     Time_2_Stow := StrToInt(edtStowTime.Text);
   end;
end;

end.
