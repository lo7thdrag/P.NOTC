unit ufrmMADOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,uDBAsset_Vehicle, uDBAsset_Sensor, Vcl.Imaging.pngimage, uSimContainers;

type
  TfrmMADOnBoardPickList = class(TForm)
    lbAllMADDef: TListBox;
    lbAllMADOnBoard: TListBox;
    ImgBackgroundForm: TImage;
    btnAdd: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundOnBoard: TImage;
    btnRemove: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    btnEdit: TImage;
    btnClose: TImage;
    Label1: TLabel;
    Label2: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllMADDefClick(Sender: TObject);
    procedure lbAllMADOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllMADDefList : TList;
    FAllMADOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedMAD : TMAD_On_Board;

    procedure UpdateMADList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmMADOnBoardPickList: TfrmMADOnBoardPickList;

implementation

uses
  uDataModuleTTT, ufrmMADMount;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMADOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllMADDefList);
  FreeItemsAndFreeList(FAllMADOnBoardList);
  Action := cafree;
end;

procedure TfrmMADOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllMADDefList := TList.Create;
  FAllMADOnBoardList := TList.Create;
end;

procedure TfrmMADOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateMADList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMADOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllMADDef.ItemIndex = -1 then
    Exit;

  frmMADMount := TfrmMADMount.Create(Self);
  try
    with frmMADMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMAD := FSelectedMAD;
      ShowModal;
    end;
    AfterClose := frmMADMount.AfterClose;
  finally
    frmMADMount.Free;
  end;

  UpdateMADList;
end;

procedure TfrmMADOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllMADOnBoard.ItemIndex = -1 then
    Exit;

  frmMADMount := TfrmMADMount.Create(Self);
  try
    with frmMADMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedMAD := FSelectedMAD;
      ShowModal;
    end;
    AfterClose := frmMADMount.AfterClose;
  finally
    frmMADMount.Free;
  end;

  UpdateMADList;
end;

procedure TfrmMADOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllMADOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedMAD.FData do
  begin
    dmTTT.DeleteMADOnBoard(2, MAD_Instance_Index);
  end;

  AfterClose := True;
  UpdateMADList;
end;

procedure TfrmMADOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMADOnBoardPickList.lbAllMADDefClick(Sender: TObject);
begin
  if lbAllMADDef.ItemIndex = -1 then
    Exit;

  FSelectedMAD := TMAD_On_Board(lbAllMADDef.Items.Objects[lbAllMADDef.ItemIndex]);
end;

procedure TfrmMADOnBoardPickList.lbAllMADOnBoardClick(Sender: TObject);
begin
  if lbAllMADOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedMAD := TMAD_On_Board(lbAllMADOnBoard.Items.Objects[lbAllMADOnBoard.ItemIndex]);
end;

procedure TfrmMADOnBoardPickList.UpdateMADList;
var
  i : Integer;
  mad : TMAD_On_Board;
begin
  lbAllMADDef.Items.Clear;
  lbAllMADOnBoard.Items.Clear;

  dmTTT.GetAllMADDef(FAllMADDefList);
  dmTTT.GetMADOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllMADOnBoardList);

  for i := 0 to FAllMADDefList.Count - 1 do
  begin
    mad := FAllMADDefList.Items[i];
    lbAllMADDef.Items.AddObject(mad.FMAD_Def.Class_Identifier, mad);
  end;

  for i := 0 to FAllMADOnBoardList.Count - 1 do
  begin
    mad := FAllMADOnBoardList.Items[i];
    lbAllMADOnBoard.Items.AddObject(mad.FData.Instance_Identifier, mad);
  end;
end;

{$ENDREGION}

end.
