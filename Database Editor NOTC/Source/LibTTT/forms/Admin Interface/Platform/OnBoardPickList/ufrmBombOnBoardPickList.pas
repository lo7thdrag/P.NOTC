unit ufrmBombOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Weapon, uDBAsset_Vehicle, uSimContainers;

type
  TfrmBombOnBoardPickList = class(TForm)
    lbAllBombDef: TListBox;
    lbAllBombOnBoard: TListBox;
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

    procedure lbAllBombDefClick(Sender: TObject);
    procedure lbAllBombOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllBombDefList : TList;
    FAllBombOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedBomb : TBomb_Definition;

    procedure UpdateBombList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmBombOnBoardPickList: TfrmBombOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmBombMount, tttData;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmBombOnBoardPickList.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllBombDefList);
  FreeItemsAndFreeList(FAllBombOnBoardList);
  Action := cafree;
end;

procedure TfrmBombOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllBombDefList := TList.Create;
  FAllBombOnBoardList := TList.Create;
end;

procedure TfrmBombOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateBombList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmBombOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllBombDef.ItemIndex = -1 then
    Exit;

  frmBombMount := TfrmBombMount.Create(Self);
  try
    with frmBombMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedBomb := FSelectedBomb;
      ShowModal;
    end;
    AfterClose := frmBombMount.AfterClose;
  finally
    frmBombMount.Free;
  end;

  UpdateBombList;
end;

procedure TfrmBombOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllBombOnBoard.ItemIndex = -1 then
    Exit;

  frmBombMount := TfrmBombMount.Create(Self);
  try
    with frmBombMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedBomb := FSelectedBomb;
      ShowModal;
    end;
    AfterClose := frmBombMount.AfterClose;
  finally
    frmBombMount.Free;
  end;

  UpdateBombList;
end;

procedure TfrmBombOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllBombOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedBomb.FPoint.FData do
  begin
    dmTTT.DeletePointEffectOnBoard(2, Point_Effect_Index);
  end;

  AfterClose := True;
  UpdateBombList;
end;

procedure TfrmBombOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBombOnBoardPickList.lbAllBombDefClick(Sender: TObject);
begin
  if lbAllBombDef.ItemIndex = -1 then
    Exit;

  FSelectedBomb := TBomb_Definition(lbAllBombDef.Items.Objects[lbAllBombDef.ItemIndex]);
end;

procedure TfrmBombOnBoardPickList.lbAllBombOnBoardClick(Sender: TObject);
begin
  if lbAllBombOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedBomb := TBomb_Definition(lbAllBombOnBoard.Items.Objects[lbAllBombOnBoard.ItemIndex]);
end;

procedure TfrmBombOnBoardPickList.UpdateBombList;
var
  i : Integer;
  bomb :  TBomb_Definition;
begin
  lbAllBombDef.Items.Clear;
  lbAllBombOnBoard.Items.Clear;

  dmTTT.GetAllBombDef(FAllBombDefList);
  dmTTT.GetBombOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllBombOnBoardList);

  for i := 0 to FAllBombDefList.Count - 1 do
  begin
    bomb := FAllBombDefList.Items[i];
    lbAllBombDef.Items.AddObject(bomb.FData.Bomb_Identifier, bomb);
  end;

  for i := 0 to FAllBombOnBoardList.Count - 1 do
  begin
    bomb := FAllBombOnBoardList.Items[i];
    lbAllBombOnBoard.Items.AddObject(bomb.FData.Bomb_Identifier, bomb);
  end;
end;

{$ENDREGION}

end.
