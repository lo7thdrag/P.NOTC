unit ufrmEmbarkedOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, newClassASTT, uDBAsset_Vehicle,
  Vcl.Imaging.pngimage, uSimContainers;

type
  TfrmEmbarkedOnBoardPickList = class(TForm)
    lbAllVehicleOnBoard: TListBox;
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
    FAllVehicleOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition; {Base Vehicle}
    FVehicleOnDef : TVehicle_Definition;    {Vehicle in List Def}
    FSelectedEmbarked : THosted_Platform;   {Embarked Vehicle}

    procedure UpdateVehicleList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmEmbarkedOnBoardPickList: TfrmEmbarkedOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmEmbarkedInputName, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmEmbarkedOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllVehicleDefList);
  FreeItemsAndFreeList(FAllVehicleOnBoardList);
  Action := cafree;
end;

procedure TfrmEmbarkedOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllVehicleDefList := TList.Create;
  FAllVehicleOnBoardList := TList.Create;

  AfterClose := False;
end;

procedure TfrmEmbarkedOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateVehicleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmEmbarkedOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  frmEmbarkedInputName := TfrmEmbarkedInputName.Create(Self);
  try
    with frmEmbarkedInputName do
    begin
      SelectedEmbarkedPlat := THosted_Platform.Create;

      with SelectedEmbarkedPlat do
      begin
        FData.Hosted_Vehicle_Index := FSelectedVehicle.FData.Vehicle_Index;
        FVehicle := FVehicleOnDef.FData;
        ShowModal;
      end;

      SelectedEmbarkedPlat.Free;
    end;
    AfterClose := frmEmbarkedInputName.AfterClose;
  finally
    frmEmbarkedInputName.Free;
  end;

  UpdateVehicleList;
end;

procedure TfrmEmbarkedOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllVehicleOnBoard.ItemIndex = -1 then
    Exit;

  frmEmbarkedInputName := TfrmEmbarkedInputName.Create(Self);
  try
    with frmEmbarkedInputName do
    begin
      SelectedEmbarkedPlat := FSelectedEmbarked;
      ShowModal;
    end;
    AfterClose := frmEmbarkedInputName.AfterClose;
  finally
    frmEmbarkedInputName.Free;
  end;

  UpdateVehicleList;
end;

procedure TfrmEmbarkedOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllVehicleOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedEmbarked.FData do
    dmTTT.DeleteHostedPlatform(2, Slave_Index);

  UpdateVehicleList;
end;

procedure TfrmEmbarkedOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmbarkedOnBoardPickList.lbAllVehicleDefClick(Sender: TObject);
begin
  if lbAllVehicleDef.ItemIndex = -1 then
    Exit;

  FVehicleOnDef := TVehicle_Definition(lbAllVehicleDef.Items.Objects[lbAllVehicleDef.ItemIndex]);
end;

procedure TfrmEmbarkedOnBoardPickList.lbAlVehicleOnBoardClick(Sender: TObject);
begin
  if lbAllVehicleOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedEmbarked := THosted_Platform(lbAllVehicleOnBoard.Items.Objects[lbAllVehicleOnBoard.ItemIndex]);
end;

procedure TfrmEmbarkedOnBoardPickList.UpdateVehicleList;
var
  i, j : Integer;
  vehicle : TVehicle_Definition;
  embarkedPlat : THosted_Platform;
  found : Boolean;
begin
  lbAllVehicleDef.Items.Clear;
  lbAllVehicleOnBoard.Items.Clear;

  dmTTT.GetAllVehicleDef(FAllVehicleDefList);
  dmTTT.GetHostedPlatform(FSelectedVehicle.FData.Vehicle_Index,FAllVehicleOnBoardList);

  for i := 0 to FAllVehicleDefList.Count - 1 do
  begin
    vehicle := FAllVehicleDefList.Items[i];

    if vehicle.FData.Vehicle_Index = FSelectedVehicle.FData.Vehicle_Index then
      Continue;

    found := False;
    for j := 0 to FAllVehicleOnBoardList.Count - 1 do
    begin
      embarkedPlat := FAllVehicleOnBoardList.Items[j];

      if embarkedPlat.FData.Vehicle_Index = vehicle.FData.Vehicle_Index then
      begin
        found := True;
        Break;
      end;
    end;

    if found then
      lbAllVehicleOnBoard.Items.AddObject(embarkedPlat.FVehicle.Vehicle_Identifier,embarkedPlat)
    else
      lbAllVehicleDef.Items.AddObject(vehicle.FData.Vehicle_Identifier, vehicle);
  end;
end;

{$ENDREGION}

end.
