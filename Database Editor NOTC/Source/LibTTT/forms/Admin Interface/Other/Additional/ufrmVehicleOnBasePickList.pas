unit ufrmVehicleOnBasePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Base, uSimContainers;

type
  TfrmVehicleOnBasePickList = class(TForm)
    lbAllVehicleOnBase: TListBox;
    lbAllVehicleDef: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnEdit: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllVehicleDefClick(Sender: TObject);
    procedure lbAlVehicleOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllVehicleDefList : TList;
    FAllVehicleOnBaseList : TList;

    FSelectedBase : TBase;
    FSelectedVehicleDef : TVehicle_Definition;
    FSelectedVehicleOnBase : TVehicle_On_Base;

    procedure UpdateVehicleList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedBase : TBase read FSelectedBase write FSelectedBase;
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicleDef write FSelectedVehicleDef;
    property SelectedVehicleOnBase : TVehicle_On_Base read FSelectedVehicleOnBase write FSelectedVehicleOnBase;

  end;

var
  frmVehicleOnBasePickList: TfrmVehicleOnBasePickList;

implementation

uses
  uDataModuleTTT, ufrmVehicleInputToBase, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmVehicleOnBasePickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllVehicleDefList);
  FreeItemsAndFreeList(FAllVehicleOnBaseList);
  Action := cafree;
end;

procedure TfrmVehicleOnBasePickList.FormCreate(Sender: TObject);
begin
  FAllVehicleDefList := TList.Create;
  FAllVehicleOnBaseList := TList.Create;

  AfterClose := False;
end;

procedure TfrmVehicleOnBasePickList.FormShow(Sender: TObject);
begin
  UpdateVehicleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmVehicleOnBasePickList.btnAddClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  frmVehicleInputToBase := TfrmVehicleInputToBase.Create(Self);
  try
    with frmVehicleInputToBase do
    begin
      SelectedVehicle := TVehicle_On_Base.Create;
      SelectedVehicle.FData.Vehicle_Index := FSelectedVehicleDef.FData.Vehicle_Index;
      SelectedVehicle.FData.Vehicle_Identifier := FSelectedVehicleDef.FData.Vehicle_Identifier;
      SelectedVehicle.FData.Base_Index := FSelectedBase.FData.Base_Index;
      ShowModal;

      SelectedVehicle.Free;
    end;
    AfterClose := frmVehicleInputToBase.AfterClose;
  finally
    frmVehicleInputToBase.Free;
  end;

  UpdateVehicleList;
end;

procedure TfrmVehicleOnBasePickList.btnEditClick(Sender: TObject);
begin
  if lbAllVehicleOnBase.ItemIndex = -1 then
    Exit;

  frmVehicleInputToBase := TfrmVehicleInputToBase.Create(Self);
  try
    with frmVehicleInputToBase do
    begin
      SelectedVehicle := SelectedVehicleOnBase;
      ShowModal;
    end;
    AfterClose := frmVehicleInputToBase.AfterClose;
  finally
    frmVehicleInputToBase.Free;
  end;

  UpdateVehicleList;
end;

procedure TfrmVehicleOnBasePickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllVehicleOnBase.ItemIndex = -1 then
    Exit;

  with FSelectedVehicleOnBase.FData do
    dmTTT.DeleteVehicle_OnBase(Vehicle_OnBase_Index);

  UpdateVehicleList;

  AfterClose := True;
end;

procedure TfrmVehicleOnBasePickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVehicleOnBasePickList.lbAllVehicleDefClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  FSelectedVehicleDef := TVehicle_Definition(lbAllVehicleDef.Items.Objects[lbAllVehicleDef.ItemIndex]);
end;

procedure TfrmVehicleOnBasePickList.lbAlVehicleOnBoardClick(Sender: TObject);
begin
  if lbAllVehicleOnBase.ItemIndex = -1 then
    Exit;

  FSelectedVehicleOnBase := TVehicle_On_Base(lbAllVehicleOnBase.Items.Objects[lbAllVehicleOnBase.ItemIndex]);
end;

procedure TfrmVehicleOnBasePickList.UpdateVehicleList;
var
  i, j : Integer;
  vehicle : TVehicle_Definition;
  vehicleOnBase : TVehicle_On_Base;
  found : Boolean;
begin
  lbAllVehicleDef.Items.Clear;
  lbAllVehicleOnBase.Items.Clear;

  dmTTT.GetAllVehicleDef(FAllVehicleDefList);
  dmTTT.GetAllVehicle_OnBase(FSelectedBase.FData.Base_Index,FAllVehicleOnBaseList);

  for i := 0 to FAllVehicleDefList.Count - 1 do
  begin
    vehicle := FAllVehicleDefList.Items[i];

    found := False;
    for j := 0 to FAllVehicleOnBaseList.Count - 1 do
    begin
      vehicleOnBase := FAllVehicleOnBaseList.Items[j];

      if vehicleOnBase.FData.Vehicle_Index = vehicle.FData.Vehicle_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllVehicleOnBase.Items.AddObject(vehicleOnBase.FData.Vehicle_Identifier,vehicleOnBase)
    else
      lbAllVehicleDef.Items.AddObject(vehicle.FData.Vehicle_Identifier, vehicle);
  end;
end;

{$ENDREGION}

end.
