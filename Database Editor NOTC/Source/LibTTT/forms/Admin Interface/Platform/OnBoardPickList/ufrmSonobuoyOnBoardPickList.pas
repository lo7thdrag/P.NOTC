unit ufrmSonobuoyOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Sonar, uDBAsset_Sonobuoy, uSimContainers;

type
  TfrmSonobuoyOnBoardPickList = class(TForm)
    lbAllSonobuoyDef: TListBox;
    lbAllSonobuoyOnBoard: TListBox;
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

    procedure lbAllSonobuoyDefClick(Sender: TObject);
    procedure lbAllSonobuoyOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllSonobuoyDefList : TList;
    FAllSonobuoyOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedSonobuoy : TSonobuoy_On_Board;

    procedure UpdateRadarList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmSonobuoyOnBoardPickList: TfrmSonobuoyOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmSonobuoyMount;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSonobuoyOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllSonobuoyDefList);
  FreeItemsAndFreeList(FAllSonobuoyOnBoardList);
  Action := cafree;
end;

procedure TfrmSonobuoyOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllSonobuoyDefList := TList.Create;
  FAllSonobuoyOnBoardList := TList.Create;
end;

procedure TfrmSonobuoyOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateRadarList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSonobuoyOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllSonobuoyDef.ItemIndex = -1 then
    Exit;

  frmSonobuoyMount := TfrmSonobuoyMount.Create(Self);
  try
    with frmSonobuoyMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedSonobuoy := FSelectedSonobuoy;
      ShowModal;
    end;
    AfterClose := frmSonobuoyMount.AfterClose;
  finally
    frmSonobuoyMount.Free;
  end;

  UpdateRadarList;
end;

procedure TfrmSonobuoyOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllSonobuoyOnBoard.ItemIndex = -1 then
    Exit;

  frmSonobuoyMount := TfrmSonobuoyMount.Create(Self);
  try
    with frmSonobuoyMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedSonobuoy := FSelectedSonobuoy;
      ShowModal;
    end;
    AfterClose := frmSonobuoyMount.AfterClose;
  finally
    frmSonobuoyMount.Free;
  end;

  UpdateRadarList;
end;

procedure TfrmSonobuoyOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllSonobuoyOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedSonobuoy.FData do
  begin
    dmTTT.DeleteSonobuoyOnBoard(2, Sonobuoy_Instance_Index);
  end;

  AfterClose := True;
  UpdateRadarList;
end;

procedure TfrmSonobuoyOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSonobuoyOnBoardPickList.lbAllSonobuoyDefClick(Sender: TObject);
begin
  if lbAllSonobuoyDef.ItemIndex = -1 then
    Exit;

  FSelectedSonobuoy := TSonobuoy_On_Board(lbAllSonobuoyDef.Items.Objects[lbAllSonobuoyDef.ItemIndex]);
end;

procedure TfrmSonobuoyOnBoardPickList.lbAllSonobuoyOnBoardClick(Sender: TObject);
begin
  if lbAllSonobuoyOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedSonobuoy := TSonobuoy_On_Board(lbAllSonobuoyOnBoard.Items.Objects[lbAllSonobuoyOnBoard.ItemIndex]);
end;

procedure TfrmSonobuoyOnBoardPickList.UpdateRadarList;
var
  i : Integer;
  sonobuoy : TSonobuoy_On_Board;
begin
  lbAllSonobuoyDef.Items.Clear;
  lbAllSonobuoyOnBoard.Items.Clear;

  dmTTT.GetAllSonobuoyDef(FAllSonobuoyDefList);
  dmTTT.GetSonobuoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllSonobuoyOnBoardList);

  for i := 0 to FAllSonobuoyDefList.Count - 1 do
  begin
    sonobuoy := FAllSonobuoyDefList.Items[i];
    lbAllSonobuoyDef.Items.AddObject(sonobuoy.FDef.Class_Identifier, sonobuoy);
  end;

  for i := 0 to FAllSonobuoyOnBoardList.Count - 1 do
  begin
    sonobuoy := FAllSonobuoyOnBoardList.Items[i];
    lbAllSonobuoyOnBoard.Items.AddObject(sonobuoy.FData.Instance_Identifier, sonobuoy);
  end;
end;

{$ENDREGION}

end.
