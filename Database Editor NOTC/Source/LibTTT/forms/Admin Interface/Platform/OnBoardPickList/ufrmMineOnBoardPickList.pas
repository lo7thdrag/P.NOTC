unit ufrmMineOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Weapon , uSimContainers;

type
  TfrmMineOnBoardPickList = class(TForm)
    lbAllMineDef: TListBox;
    lbMineOnBoard: TListBox;
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

    procedure lbAllMineDefClick(Sender: TObject);
    procedure lbAllMineOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllMineDefList : TList;
    FAllMineOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedMine : TMine_On_Board;

    procedure UpdateMineList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmMineOnBoardPickList: TfrmMineOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmMineMount, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMineOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllMineDefList);
  FreeItemsAndFreeList(FAllMineOnBoardList);
  Action := cafree;
end;

procedure TfrmMineOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllMineDefList := TList.Create;
  FAllMineOnBoardList := TList.Create;
end;

procedure TfrmMineOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateMineList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMineOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllMineDef.ItemIndex = -1 then
    Exit;

  frmMineMount := TfrmMineMount.Create(Self);
  try
    with frmMineMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMine := FSelectedMine;
      ShowModal;
    end;
    AfterClose := frmMineMount.AfterClose;
  finally
    frmMineMount.Free;
  end;

  UpdateMineList;
end;

procedure TfrmMineOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbMineOnBoard.ItemIndex = -1 then
    Exit;

  frmMineMount := TfrmMineMount.Create(Self);
  try
    with frmMineMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMine := FSelectedMine;
      ShowModal;
    end;
    AfterClose := frmMineMount.AfterClose;
  finally
    frmMineMount.Free;
  end;

  UpdateMineList;
end;

procedure TfrmMineOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbMineOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedMine.FData do
  begin
    dmTTT.DeleteFittedWeaponOnBoard(2, Fitted_Weap_Index);
  end;

  AfterClose := True;
  UpdateMineList;
end;

procedure TfrmMineOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMineOnBoardPickList.lbAllMineDefClick(Sender: TObject);
begin
  if lbAllMineDef.ItemIndex = -1 then
    Exit;

  FSelectedMine := TMine_On_Board(lbAllMineDef.Items.Objects[lbAllMineDef.ItemIndex]);
end;

procedure TfrmMineOnBoardPickList.lbAllMineOnBoardClick(Sender: TObject);
begin
  if lbMineOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedMine := TMine_On_Board(lbMineOnBoard.Items.Objects[lbMineOnBoard.ItemIndex]);
end;

procedure TfrmMineOnBoardPickList.UpdateMineList;
var
  i : Integer;
  mine : TMine_On_Board;
begin
  lbAllMineDef.Items.Clear;
  lbMineOnBoard.Items.Clear;

  dmTTT.GetAllMineDef(FAllMineDefList);
  dmTTT.GetMineOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllMineOnBoardList);

  for i := 0 to FAllMineDefList.Count - 1 do
  begin
    mine := FAllMineDefList.Items[i];
    lbAllMineDef.Items.AddObject(mine.FMine_Def.Mine_Identifier, mine);
  end;

  for i := 0 to FAllMineOnBoardList.Count - 1 do
  begin
    mine := FAllMineOnBoardList.Items[i];
    lbMineOnBoard.Items.AddObject(mine.FData.Instance_Identifier, mine);
  end;
end;

{$ENDREGION}

end.
