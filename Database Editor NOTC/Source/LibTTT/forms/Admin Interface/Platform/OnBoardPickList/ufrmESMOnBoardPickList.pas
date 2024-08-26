unit ufrmESMOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,uDBAsset_Vehicle,uDBAsset_Sensor, Vcl.Imaging.pngimage, uSimContainers;

type
  TfrmESMOnBoardPickList = class(TForm)
    lbAllESMDef: TListBox;
    lbESMOnBoard: TListBox;
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

    procedure lbAllESMDefClick(Sender: TObject);
    procedure lbAllESMOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllESMDefList : TList;
    FAllESMOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedESM : TESM_On_Board;

    procedure UpdateESMList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmESMOnBoardPickList: TfrmESMOnBoardPickList;

implementation

uses
  uDataModuleTTT,ufrmESMMount, tttData;


{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmESMOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllESMDefList);
  FreeItemsAndFreeList(FAllESMOnBoardList);
  Action := cafree;
end;

procedure TfrmESMOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllESMDefList := TList.Create;
  FAllESMOnBoardList := TList.Create;
end;

procedure TfrmESMOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateESMList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmESMOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllESMDef.ItemIndex = -1 then
    Exit;

  frmESMMount := TfrmESMMount.Create(Self);
  try
    with frmESMMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedESM := FSelectedESM;
      ShowModal;
    end;
    AfterClose := frmESMMount.AfterClose;
  finally
    frmESMMount.Free;
  end;

  UpdateESMList;
end;

procedure TfrmESMOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbESMOnBoard.ItemIndex = -1 then
    Exit;

  frmESMMount := TfrmESMMount.Create(Self);
  try
    with frmESMMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedESM := FSelectedESM;
      ShowModal;
    end;
    AfterClose := frmESMMount.AfterClose;
  finally
    frmESMMount.Free;
  end;

  UpdateESMList;
end;

procedure TfrmESMOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbESMOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedESM.FData do
  begin
    dmTTT.DeleteBlindZone(Ord(bzcESM), ESM_Instance_Index);
    dmTTT.DeleteESMOnBoard(2, ESM_Instance_Index);
  end;

  AfterClose := True;
  UpdateESMList;
end;

procedure TfrmESMOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmESMOnBoardPickList.lbAllESMDefClick(Sender: TObject);
begin
  if lbAllESMDef.ItemIndex = -1 then
    Exit;

  FSelectedESM := TESM_On_Board(lbAllESMDef.Items.Objects[lbAllESMDef.ItemIndex]);
end;

procedure TfrmESMOnBoardPickList.lbAllESMOnBoardClick(Sender: TObject);
begin
  if lbESMOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedESM := TESM_On_Board(lbESMOnBoard.Items.Objects[lbESMOnBoard.ItemIndex]);
end;

procedure TfrmESMOnBoardPickList.UpdateESMList;
var
  i : Integer;
  esm : TESM_On_Board;
begin
  lbAllESMDef.Items.Clear;
  lbESMOnBoard.Items.Clear;

  dmTTT.GetAllESMDef(FAllESMDefList);
  dmTTT.GetESMOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllESMOnBoardList);

  for i := 0 to FAllESMDefList.Count - 1 do
  begin
    esm := FAllESMDefList.Items[i];
    lbAllESMDef.Items.AddObject(esm.FESM_Def.Class_Identifier, esm);
  end;

  for i := 0 to FAllESMOnBoardList.Count - 1 do
  begin
    esm := FAllESMOnBoardList.Items[i];
    lbESMOnBoard.Items.AddObject(esm.FData.Instance_Identifier, esm);
  end;
end;

{$ENDREGION}

end.
