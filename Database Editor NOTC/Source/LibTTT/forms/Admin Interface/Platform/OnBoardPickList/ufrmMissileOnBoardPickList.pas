unit ufrmMissileOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Weapon , uSimContainers;

type
  TfrmMissileOnBoardPickList = class(TForm)
    lbAllMissileDef: TListBox;
    lbAllMissileOnBoard: TListBox;
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

    procedure lbAllMissileDefClick(Sender: TObject);
    procedure lbAllMissileOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllMissileDefList : TList;
    FAllMissileOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedMissile : TMissile_On_Board;

    procedure UpdateMissileList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmMissileOnBoardPickList: TfrmMissileOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmMissileMount, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMissileOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllMissileDefList);
  FreeItemsAndFreeList(FAllMissileOnBoardList);
  Action := cafree;
end;

procedure TfrmMissileOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllMissileDefList := TList.Create;
  FAllMissileOnBoardList := TList.Create;
end;

procedure TfrmMissileOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateMissileList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMissileOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllMissileDef.ItemIndex = -1 then
    Exit;

  frmMissileMount := TfrmMissileMount.Create(Self);
  try
    with frmMissileMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMissile := FSelectedMissile;
      ShowModal;
    end;
    AfterClose := frmMissileMount.AfterClose;
  finally
    frmMissileMount.Free;
  end;

  UpdateMissileList;
end;

procedure TfrmMissileOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllMissileOnBoard.ItemIndex = -1 then
    Exit;

  frmMissileMount := TfrmMissileMount.Create(Self);
  try
    with frmMissileMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMissile := FSelectedMissile;
      ShowModal;
    end;
    AfterClose := frmMissileMount.AfterClose;
  finally
    frmMissileMount.Free;
  end;
  
  UpdateMissileList;
end;

procedure TfrmMissileOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllMissileOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedMissile.FData do
  begin
    dmTTT.DeleteBlindZone(Ord(bzcWeapon), Fitted_Weap_Index);
    dmTTT.DeleteFittedWeaponLauncherOnBoard(2, Fitted_Weap_Index);
    dmTTT.DeleteFittedWeaponOnBoard(2, Fitted_Weap_Index);
  end;

  AfterClose := True;
  UpdateMissileList;
end;

procedure TfrmMissileOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMissileOnBoardPickList.lbAllMissileDefClick(Sender: TObject);
begin
  if lbAllMissileDef.ItemIndex = -1 then
    Exit;

  FSelectedMissile := TMissile_On_Board(lbAllMissileDef.Items.Objects[lbAllMissileDef.ItemIndex]);
end;

procedure TfrmMissileOnBoardPickList.lbAllMissileOnBoardClick(Sender: TObject);
begin
  if lbAllMissileOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedMissile := TMissile_On_Board(lbAllMissileOnBoard.Items.Objects[lbAllMissileOnBoard.ItemIndex]);
end;

procedure TfrmMissileOnBoardPickList.UpdateMissileList;
var
  i : Integer;
  missile : TMissile_On_Board;
begin
  lbAllMissileDef.Items.Clear;
  lbAllMissileOnBoard.Items.Clear;

  dmTTT.GetAllMissileDef(FAllMissileDefList);
  dmTTT.GetMissileOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllMissileOnBoardList);

  for i := 0 to FAllMissileDefList.Count - 1 do
  begin
    missile := FAllMissileDefList.Items[i];
    lbAllMissileDef.Items.AddObject(missile.FDef.Class_Identifier, missile);
  end;

  for i := 0 to FAllMissileOnBoardList.Count - 1 do
  begin
    missile := FAllMissileOnBoardList.Items[i];
    lbAllMissileOnBoard.Items.AddObject(missile.FData.Instance_Identifier, missile);
  end;
end;

{$ENDREGION}

end.
