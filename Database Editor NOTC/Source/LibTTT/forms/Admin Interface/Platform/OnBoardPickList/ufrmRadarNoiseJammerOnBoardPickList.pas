unit ufrmRadarNoiseJammerOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure, uSimContainers ;

type
  TfrmRadarNoiseJammerOnBoardPickList = class(TForm)
    lbAllRadarJammerDef: TListBox;
    lbAllRadarJammerOnBoard: TListBox;
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

    procedure lbAllRadarJammerDefClick(Sender: TObject);
    procedure lbAllRadarJammerOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllRadarJammerDefList : TList;
    FAllRadarJammerOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedRadarJammer : TRadar_Noise_Jammer_On_Board;

    procedure UpdateRadarJammerList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmRadarNoiseJammerOnBoardPickList: TfrmRadarNoiseJammerOnBoardPickList;

implementation

{$R *.dfm}

uses
  uDataModuleTTT,ufrmRadarJammerMount;

{$REGION ' Form Handle '}

procedure TfrmRadarNoiseJammerOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllRadarJammerDefList);
  FreeItemsAndFreeList(FAllRadarJammerOnBoardList);
  Action := cafree;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllRadarJammerDefList := TList.Create;
  FAllRadarJammerOnBoardList := TList.Create;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateRadarJammerList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmRadarNoiseJammerOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllRadarJammerDef.ItemIndex = -1 then
    Exit;

  frmRadarJammerMount := TfrmRadarJammerMount.Create(Self);
  try
    with frmRadarJammerMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedRadarJammer := FSelectedRadarJammer;
      ShowModal;
    end;
    AfterClose := frmRadarJammerMount.AfterClose;
  finally
    frmRadarJammerMount.Free;
  end;

  UpdateRadarJammerList;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllRadarJammerOnBoard.ItemIndex = -1 then
    Exit;

  frmRadarJammerMount := TfrmRadarJammerMount.Create(Self);
  try
    with frmRadarJammerMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedRadarJammer := FSelectedRadarJammer;
      ShowModal;
    end;
    AfterClose := frmRadarJammerMount.AfterClose;
  finally
    frmRadarJammerMount.Free;
  end;

  UpdateRadarJammerList;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllRadarJammerOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedRadarJammer.FData do
  begin
    dmTTT.DeleteRadarNoiseJammerOnBoard(2, Jammer_Instance_Index);
  end;

  AfterClose := True;
  UpdateRadarJammerList;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.lbAllRadarJammerDefClick(Sender: TObject);
begin
  if lbAllRadarJammerDef.ItemIndex = -1 then
    Exit;

  FSelectedRadarJammer := TRadar_Noise_Jammer_On_Board(lbAllRadarJammerDef.Items.Objects[lbAllRadarJammerDef.ItemIndex]);
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.lbAllRadarJammerOnBoardClick(Sender: TObject);
begin
  if lbAllRadarJammerOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedRadarJammer := TRadar_Noise_Jammer_On_Board(lbAllRadarJammerOnBoard.Items.Objects[lbAllRadarJammerOnBoard.ItemIndex]);
end;

procedure TfrmRadarNoiseJammerOnBoardPickList.UpdateRadarJammerList;
var
  i : Integer;
  radarjammer : TRadar_Noise_Jammer_On_Board;
begin
  lbAllRadarJammerDef.Items.Clear;
  lbAllRadarJammerOnBoard.Items.Clear;

  dmTTT.GetAllRadarNoiseJammerDef(FAllRadarJammerDefList);
  dmTTT.GetRadarNoiseJammerOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllRadarJammerOnBoardList);

  for i := 0 to FAllRadarJammerDefList.Count - 1 do
  begin
    radarjammer := FAllRadarJammerDefList.Items[i];
    lbAllRadarJammerDef.Items.AddObject(radarjammer.FDef.Jammer_Identifier, radarjammer);
  end;

  for i := 0 to FAllRadarJammerOnBoardList.Count - 1 do
  begin
    radarjammer := FAllRadarJammerOnBoardList.Items[i];
    lbAllRadarJammerOnBoard.Items.AddObject(radarjammer.FData.Instance_Identifier, radarjammer);
  end;
end;

{$ENDREGION}

end.
