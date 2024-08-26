unit ufrmAirBubbleOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure, uSimContainers ;

type
  TfrmAirBubbleOnBoardPickList = class(TForm)
    lbAllAirBubbleDef: TListBox;
    lbAllAirBubbleOnBoard: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnEdit: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundForm: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label3: TLabel;
    Label4: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllAirBubbleDefClick(Sender: TObject);
    procedure lbAllAirBubbleOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllAirBubbleDefList : TList;
    FAllAirBubbleOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedAirBubble : TAir_Bubble_On_Board;

    procedure UpdateAirBubbleList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmAirBubbleOnBoardPickList: TfrmAirBubbleOnBoardPickList;

implementation

{$R *.dfm}

uses
  uDataModuleTTT, ufrmAirBubbleMount;

{$REGION ' Form Handle '}

procedure TfrmAirBubbleOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllAirBubbleDefList);
  FreeItemsAndFreeList(FAllAirBubbleOnBoardList);
  Action := cafree;
end;

procedure TfrmAirBubbleOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllAirBubbleDefList := TList.Create;
  FAllAirBubbleOnBoardList := TList.Create;
end;

procedure TfrmAirBubbleOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateAirBubbleList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAirBubbleOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllAirBubbleDef.ItemIndex = -1 then
    Exit;

  frmAirBubbleMount := TfrmAirBubbleMount.Create(Self);
  try
    with frmAirBubbleMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedAirBubble := FSelectedAirBubble;
      ShowModal;
    end;
    AfterClose := frmAirBubbleMount.AfterClose;
  finally
    frmAirBubbleMount.Free;
  end;

  UpdateAirBubbleList;
end;

procedure TfrmAirBubbleOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllAirBubbleOnBoard.ItemIndex = -1 then
    Exit;

  frmAirBubbleMount := TfrmAirBubbleMount.Create(Self);
  try
    with frmAirBubbleMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedAirBubble := FSelectedAirBubble;
      ShowModal;
    end;
    AfterClose := frmAirBubbleMount.AfterClose;
  finally
    frmAirBubbleMount.Free;
  end;

  UpdateAirBubbleList;
end;

procedure TfrmAirBubbleOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllAirBubbleOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedAirBubble.FData do
  begin
    dmTTT.DeleteAirBubbleOnBoard(2, Air_Bubble_Instance_Index);
  end;

  AfterClose := True;
  UpdateAirBubbleList;
end;

procedure TfrmAirBubbleOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAirBubbleOnBoardPickList.lbAllAirBubbleDefClick(Sender: TObject);
begin
  if lbAllAirBubbleDef.ItemIndex = -1 then
    Exit;

  FSelectedAirBubble := TAir_Bubble_On_Board(lbAllAirBubbleDef.Items.Objects[lbAllAirBubbleDef.ItemIndex]);
end;

procedure TfrmAirBubbleOnBoardPickList.lbAllAirBubbleOnBoardClick(Sender: TObject);
begin
  if lbAllAirBubbleOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedAirBubble := TAir_Bubble_On_Board(lbAllAirBubbleOnBoard.Items.Objects[lbAllAirBubbleOnBoard.ItemIndex]);
end;

procedure TfrmAirBubbleOnBoardPickList.UpdateAirBubbleList;
var
  i : Integer;
  airbubble : TAir_Bubble_On_Board;
begin
  lbAllAirBubbleDef.Items.Clear;
  lbAllAirBubbleOnBoard.Items.Clear;

  dmTTT.GetAllAirBubbleDef(FAllAirBubbleDefList);
  dmTTT.GetAirBubbleOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllAirBubbleOnBoardList);

  for i := 0 to FAllAirBubbleDefList.Count - 1 do
  begin
    airbubble := FAllAirBubbleDefList.Items[i];
    lbAllAirBubbleDef.Items.AddObject(airbubble.FAirBubble_Def.Air_Bubble_Identifier, airbubble);
  end;

  for i := 0 to FAllAirBubbleOnBoardList.Count - 1 do
  begin
    airbubble := FAllAirBubbleOnBoardList.Items[i];
    lbAllAirBubbleOnBoard.Items.AddObject(airbubble.FData.Instance_Identifier, airbubble);
  end;
end;

{$ENDREGION}

end.
