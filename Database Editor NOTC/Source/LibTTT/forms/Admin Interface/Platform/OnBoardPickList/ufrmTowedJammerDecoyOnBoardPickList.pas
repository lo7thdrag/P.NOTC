unit ufrmTowedJammerDecoyOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure, uSimContainers ;

type
  TfrmTowedJammerDecoyOnBoardPickList = class(TForm)
    lbAllTowedJammerDecoyDef: TListBox;
    lbAllTowedJammerDecoyOnBoard: TListBox;
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

    procedure lbAllTowedJammerDecoyDefClick(Sender: TObject);
    procedure lbAllTowedJammerDecoyOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllTowedJammerDecoyDefList : TList;
    FAllTowedJammerDecoyOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedTowedJammerDecoy : TTowed_Jammer_Decoy_On_Board;

    procedure UpdateTowedJammerDecoyList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmTowedJammerDecoyOnBoardPickList: TfrmTowedJammerDecoyOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmTowedJammerMount ;


{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmTowedJammerDecoyOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllTowedJammerDecoyDefList);
  FreeItemsAndFreeList(FAllTowedJammerDecoyOnBoardList);
  Action := cafree;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllTowedJammerDecoyDefList := TList.Create;
  FAllTowedJammerDecoyOnBoardList := TList.Create;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateTowedJammerDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmTowedJammerDecoyOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllTowedJammerDecoyDef.ItemIndex = -1 then
    Exit;

  frmTowedJammerMount := TfrmTowedJammerMount.Create(Self);
  try
    with frmTowedJammerMount do
    begin
      SelectedVehicle := FSelectedVehicle;
       SelectedTowedJammerDecoy := FSelectedTowedJammerDecoy;
      ShowModal;
    end;
    AfterClose := frmTowedJammerMount.AfterClose;

  finally
    frmTowedJammerMount.Free;
  end;

  UpdateTowedJammerDecoyList;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllTowedJammerDecoyOnBoard.ItemIndex = -1 then
    Exit;

  frmTowedJammerMount := TfrmTowedJammerMount.Create(Self);
  try
    with frmTowedJammerMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedTowedJammerDecoy := FSelectedTowedJammerDecoy;
      ShowModal;
    end;
    AfterClose := frmTowedJammerMount.AfterClose;
  finally
    frmTowedJammerMount.Free;
  end;

  UpdateTowedJammerDecoyList;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllTowedJammerDecoyOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedTowedJammerDecoy.FData do
  begin
    dmTTT.DeleteTowedJammerDecoyOnBoard(2, Towed_Decoy_Instance_Index);
  end;

  AfterClose := True;
  UpdateTowedJammerDecoyList;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.lbAllTowedJammerDecoyDefClick(Sender: TObject);
begin
  if lbAllTowedJammerDecoyDef.ItemIndex = -1 then
    Exit;

  FSelectedTowedJammerDecoy := TTowed_Jammer_Decoy_On_Board(lbAllTowedJammerDecoyDef.Items.Objects[lbAllTowedJammerDecoyDef.ItemIndex]);
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.lbAllTowedJammerDecoyOnBoardClick(Sender: TObject);
begin
  if lbAllTowedJammerDecoyOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedTowedJammerDecoy := TTowed_Jammer_Decoy_On_Board(lbAllTowedJammerDecoyOnBoard.Items.Objects[lbAllTowedJammerDecoyOnBoard.ItemIndex]);
end;

procedure TfrmTowedJammerDecoyOnBoardPickList.UpdateTowedJammerDecoyList;
var
  i : Integer;
  towedjammerdecoy : TTowed_Jammer_Decoy_On_Board;
begin
  lbAllTowedJammerDecoyDef.Items.Clear;
  lbAllTowedJammerDecoyOnBoard.Items.Clear;

  dmTTT.GetAllTowedJammerDecoyDef(FAllTowedJammerDecoyDefList);
  dmTTT.GetTowedJammerDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllTowedJammerDecoyOnBoardList);

  for i := 0 to FAllTowedJammerDecoyDefList.Count - 1 do
  begin
    towedjammerdecoy := FAllTowedJammerDecoyDefList.Items[i];
    lbAllTowedJammerDecoyDef.Items.AddObject(towedjammerdecoy.FDef.Towed_Decoy_Identifier, towedjammerdecoy);
  end;

  for i := 0 to FAllTowedJammerDecoyOnBoardList.Count - 1 do
  begin
    towedjammerdecoy := FAllTowedJammerDecoyOnBoardList.Items[i];
    lbAllTowedJammerDecoyOnBoard.Items.AddObject(towedjammerdecoy.FData.Instance_Identifier, towedjammerdecoy);
  end;
end;

{$ENDREGION}

end.
