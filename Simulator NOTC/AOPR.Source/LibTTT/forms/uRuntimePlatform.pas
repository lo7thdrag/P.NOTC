unit uRuntimePlatform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT, uDBAsset_Runtime_Platform_Library;

type
  TfRuntimePlatform = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtRuntimeName: TEdit;
    pnl2: TPanel;
    btnVehicle: TButton;
    grp1: TGroupBox;
    btnTorpedo: TButton;
    btnMine: TButton;
    btnMissile: TButton;
    btnSonobuoy: TButton;
    pnl3: TPanel;
    btnCancel: TButton;
    btnApply: TButton;
    btnOk: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVehicleClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnTorpedoClick(Sender: TObject);
    procedure btnMissileClick(Sender: TObject);
    procedure btnSonobuoyClick(Sender: TObject);
    procedure btnMineClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isNew : boolean;
    platform_library_index : Integer;
    runtime_library : TRuntime_Platform_Library;
    procedure getplatformLibraryEntry;
  end;

var
  fRuntimePlatform: TfRuntimePlatform;

implementation

uses
  uDataModuleTTT, uVehicleSelect, uTorpedoSelect, uMissileSelect,
  uSonobuoySelect, uMineSelect, ufDBEditor, uOtherSingleList;

{$R *.dfm}

procedure TfRuntimePlatform.btnApplyClick(Sender: TObject);
begin
  if fDBEditor.fromDBeditor then
  begin
    if fOtherSingle.isNew then
    begin
      with runtime_library.FData do
        Library_Name := edtRuntimeName.Text;
      dmTTT.InsertRuntime_Platform_Library(runtime_library);
      fOtherSingle.isNew := False;
    end
    else
    begin
      with runtime_library.FData do
        Library_Name := edtRuntimeName.Text;
      dmTTT.UpdateRuntime_Platform_Library(IntToStr(runtime_library.FData.Platform_Library_Index),runtime_library);
    end;
  end
  else
    Close;
end;

procedure TfRuntimePlatform.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfRuntimePlatform.btnMineClick(Sender: TObject);
begin
  fMine.Show;
end;

procedure TfRuntimePlatform.btnMissileClick(Sender: TObject);
begin
  fMissileSelect.Show;
end;

procedure TfRuntimePlatform.btnOkClick(Sender: TObject);
begin
  if fDBEditor.fromDBeditor then
  begin
    btnApplyClick(Sender);
    fOtherSingle.refresh;
  end;

  Close;
end;

procedure TfRuntimePlatform.btnSonobuoyClick(Sender: TObject);
begin
  fSonobuoy.Show;
end;

procedure TfRuntimePlatform.btnTorpedoClick(Sender: TObject);
begin
  fTorpedo.Show;
end;

procedure TfRuntimePlatform.btnVehicleClick(Sender: TObject);
begin
  fVehicleSelect.fromRuntime := true;
  fVehicleSelect.Show;
end;

procedure TfRuntimePlatform.FormCreate(Sender: TObject);
begin
   runtime_library := TRuntime_Platform_Library.Create;
end;



procedure TfRuntimePlatform.getplatformLibraryEntry;
begin
  //get data by platform_library_index
  dmTTT.getAllPlatform_Library_Entry(platform_library_index, runtime_library.FPlatform_Library_Entry);
end;

end.
