unit uVehicleName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfVehicleName = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtVehicleName: TEdit;
    edtTrackId: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVehicleName: TfVehicleName;

implementation

uses uDataModuleTTT,uDBAssetObject,uResurceAllocationSelect,uResourceAllocation,
uVehicleSelect;

{$R *.dfm}

procedure TfVehicleName.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfVehicleName.btnOkClick(Sender: TObject);
var rec: TPlatform_Instance;
begin

  with rec.FData do begin
    Resource_Alloc_Index  := StrToInt(fResorceAllocationSelect.RA_id);
    Vehicle_Index         := StrToInt(fVehicleSelect.vId);
    Instance_Name         := edtVehicleName.Text;
    Track_ID              := edtTrackId.Text;
    Force_Designation     := ResourceAllocationForm.force;
  end;

  //dmTTT.insertPlatformInstance(rec);
  Close;
  fVehicleSelect.getRAVehicle;
  
end;

end.
