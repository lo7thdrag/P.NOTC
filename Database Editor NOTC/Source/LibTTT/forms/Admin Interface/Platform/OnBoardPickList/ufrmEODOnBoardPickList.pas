unit ufrmEODOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle,uDBAsset_Sensor, uSimContainers ;

type
  TfrmEODOnBoardPickList = class(TForm)
    lbAllEODef: TListBox;
    lbAllEODOnBoard: TListBox;
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

    procedure lbAllEODDefClick(Sender: TObject);
    procedure lbAlEODOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllEODDefList : TList;
    FAllEODOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedEOD : TEOD_On_Board;

    procedure UpdateEODList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmEODOnBoardPickList: TfrmEODOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmEODMount, tttData;


{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmEODOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllEODDefList);
  FreeItemsAndFreeList(FAllEODOnBoardList);
  Action := cafree;
end;

procedure TfrmEODOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllEODDefList := TList.Create;
  FAllEODOnBoardList := TList.Create;

  AfterClose := False;
end;

procedure TfrmEODOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateEODList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmEODOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllEODef.ItemIndex = -1 then
    Exit;

  frmEODMount := TfrmEODMount.Create(Self);
  try
    with frmEODMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedEOD := FSelectedEOD;
      ShowModal;
    end;
    AfterClose := frmEODMount.AfterClose;
  finally
    frmEODMount.Free;
  end;

  UpdateEODList;
end;

procedure TfrmEODOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllEODOnBoard.ItemIndex = -1 then
    Exit;

  frmEODMount := TfrmEODMount.Create(Self);
  try
    with frmEODMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedEOD := FSelectedEOD;
      ShowModal;
    end;
    AfterClose := frmEODMount.AfterClose;
  finally
    frmEODMount.Free;
  end;

  UpdateEODList;
end;

procedure TfrmEODOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllEODOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedEOD.FData do
  begin
    dmTTT.DeleteBlindZone(Ord(bzcEO), EO_Instance_Index);
    dmTTT.DeleteEOOnBoard(2, EO_Instance_Index);
  end;

  AfterClose := True;
  UpdateEODList;
end;

procedure TfrmEODOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEODOnBoardPickList.lbAllEODDefClick(Sender: TObject);
begin
  if lbAllEODef.ItemIndex = -1 then
    Exit;

  FSelectedEOD := TEOD_On_Board(lbAllEODef.Items.Objects[lbAllEODef.ItemIndex]);
end;

procedure TfrmEODOnBoardPickList.lbAlEODOnBoardClick(Sender: TObject);
begin
  if lbAllEODOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedEOD := TEOD_On_Board(lbAllEODOnBoard.Items.Objects[lbAllEODOnBoard.ItemIndex]);
end;

procedure TfrmEODOnBoardPickList.UpdateEODList;
var
  i : Integer;
  eod : TEOD_On_Board;
begin
  lbAllEODef.Items.Clear;
  lbAllEODOnBoard.Items.Clear;

  dmTTT.GetAllEODef(FAllEODDefList);
  dmTTT.GetEOOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllEODOnBoardList);

  for i := 0 to FAllEODDefList.Count - 1 do
  begin
    eod := FAllEODDefList.Items[i];
    lbAllEODef.Items.AddObject(eod.FEO_Def.Class_Identifier, eod);
  end;

  for i := 0 to FAllEODOnBoardList.Count - 1 do
  begin
    eod := FAllEODOnBoardList.Items[i];
    lbAllEODOnBoard.Items.AddObject(eod.FData.Instance_Identifier, eod);
  end;
end;

{$ENDREGION}


end.
