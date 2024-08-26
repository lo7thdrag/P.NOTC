unit uESMMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uDBAsset_Sensor;

type
  TESMMountForm = class(TForm)
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
    lblAntenna: TStaticText;
    edtAntenna: TEdit;
    lblSubmergedAntenna: TStaticText;
    edtSubmerged: TEdit;
    lblMaxOperational: TStaticText;
    edtMaxOperational: TEdit;
    lblFeetAntenna: TStaticText;
    lblFeetSubmerged: TStaticText;
    lblFeetMaxOperational: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    state : Integer;
    esm : TESM_On_Board;
    procedure getESMForm;
  end;

Const
  isNew = 1;
  isCopy = 2;
  isEdit = 3;

var
  ESMMountForm: TESMMountForm;

implementation

uses uDataModuleTTT, uESMDoublePickList, uVehicleAttributeWindow;

{$R *.dfm}

procedure TESMMountForm.btnApplyClick(Sender: TObject);
begin
  getESMForm;
  with esm.FData do
  begin
     dmTTT.UpdateESM_On_Board(IntToStr(ESM_Instance_Index), esm);
  end;
end;

procedure TESMMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fESMDoublePickList.Show;
end;

procedure TESMMountForm.btnOKClick(Sender: TObject);
begin
  getESMForm;
  with esm.FData do
  begin
     dmTTT.UpdateESM_On_Board(IntToStr(ESM_Instance_Index), esm);
  end;
  Close;
  fESMDoublePickList.Show;
end;

procedure TESMMountForm.FormCreate(Sender: TObject);
begin
  esm := TESM_On_Board.Create;
end;

procedure TESMMountForm.FormShow(Sender: TObject);
begin
  if state = isNew then
  begin
     edtName.Text := 'noname';
     edtClassName.Text := '';
     edtAntenna.Text := '0';
     edtSubmerged.Text := '0';
     edtMaxOperational.Text := '0';
  end
  else if state = isCopy then
  begin
     with esm.FData do
     begin
       Instance_Identifier := esm.FESM_Def.Class_Identifier;
       ESM_Index := esm.FESM_Def.ESM_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := esm.FESM_Def.ESM_Classification;

       cbMountExtension.ItemIndex := Instance_Type;
       edtName.Text := Instance_Identifier;
       edtClassName.Text := Instance_Identifier;
       edtAntenna.Text := '0';
       edtSubmerged.Text := '0';
       edtMaxOperational.Text := '0';
     end;

  end
  else if state = isEdit then
  begin
     with esm.FData do
     begin
       Instance_Identifier := esm.FESM_Def.Class_Identifier;
       ESM_Index := esm.FESM_Def.ESM_Index;
       Vehicle_Index := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
       Instance_Type := esm.FESM_Def.ESM_Classification;

       cbMountExtension.ItemIndex := Instance_Type;
       edtName.Text := Instance_Identifier;
       edtClassName.Text := Instance_Identifier;
       edtAntenna.Text := FloatToStr(Rel_Antenna_Height);
       edtSubmerged.Text := FloatToStr(Submerged_Antenna_Height);
       edtMaxOperational.Text := FloatToStr(Max_Operational_Depth);
     end;
  end;
end;

procedure TESMMountForm.getESMForm;
begin
   with esm.FData do
   begin
     Instance_Identifier := edtName.Text;
     Instance_Type := cbMountExtension.ItemIndex;
     Rel_Antenna_Height := StrToFloat(edtAntenna.Text);
     Submerged_Antenna_Height := StrToFloat(edtSubmerged.Text);
     Max_Operational_Depth := StrToFloat(edtMaxOperational.Text);
   end;
end;

end.
