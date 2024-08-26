unit ufrmAcousticDecoyOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure, uSimContainers ;

type
  TfrmAcousticDecoyOnBoardPickList = class(TForm)
    lbAllAcousticDecoyDef: TListBox;
    lbAllAcousticDecoyOnBoard: TListBox;
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

    procedure lbAllAcousticDecoyDefClick(Sender: TObject);
    procedure lbAllAcousticDecoyOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);


  private
    FAllAcousticDecoyDefList : TList;
    FAllAcousticDecoyOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedAcousticDecoy : TAcoustic_Decoy_On_Board;

    procedure UpdateAcousticDecoyList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;
  end;

var
  frmAcousticDecoyOnBoardPickList: TfrmAcousticDecoyOnBoardPickList;

implementation

{$R *.dfm}

uses
  uDataModuleTTT, ufrmAcousticDecoyMount;

{$REGION ' Form Handle '}

procedure TfrmAcousticDecoyOnBoardPickList.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllAcousticDecoyDefList);
  FreeItemsAndFreeList(FAllAcousticDecoyOnBoardList);
  Action := cafree;
end;

procedure TfrmAcousticDecoyOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllAcousticDecoyDefList := TList.Create;
  FAllAcousticDecoyOnBoardList := TList.Create;
end;

procedure TfrmAcousticDecoyOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateAcousticDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAcousticDecoyOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllAcousticDecoyDef.ItemIndex = -1 then
    Exit;

  frmAcousticDecoyMount := TfrmAcousticDecoyMount.Create(Self);
  try
    with frmAcousticDecoyMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedAcousticDecoy := FSelectedAcousticDecoy;
      ShowModal;
    end;
    AfterClose := frmAcousticDecoyMount.AfterClose;
  finally
    frmAcousticDecoyMount.Free;
  end;

  UpdateAcousticDecoyList;
end;

procedure TfrmAcousticDecoyOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllAcousticDecoyOnBoard.ItemIndex = -1 then
    Exit;

  frmAcousticDecoyMount := TfrmAcousticDecoyMount.Create(Self);
  try
    with frmAcousticDecoyMount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedAcousticDecoy := FSelectedAcousticDecoy;
      ShowModal;
    end;
    AfterClose := frmAcousticDecoyMount.AfterClose;

  finally
    frmAcousticDecoyMount.Free;
  end;

  UpdateAcousticDecoyList;
end;

procedure TfrmAcousticDecoyOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllAcousticDecoyOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedAcousticDecoy.FData do
  begin
    dmTTT.DeleteAcousticDecoyOnBoard(2, Acoustic_Instance_Index);
  end;

  AfterClose := True;
  UpdateAcousticDecoyList;
end;

procedure TfrmAcousticDecoyOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAcousticDecoyOnBoardPickList.lbAllAcousticDecoyDefClick(Sender: TObject);
begin
  if lbAllAcousticDecoyDef.ItemIndex = -1 then
    Exit;

  FSelectedAcousticDecoy := TAcoustic_Decoy_On_Board(lbAllAcousticDecoyDef.Items.Objects[lbAllAcousticDecoyDef.ItemIndex]);
end;

procedure TfrmAcousticDecoyOnBoardPickList.lbAllAcousticDecoyOnBoardClick(Sender: TObject);
begin
  if lbAllAcousticDecoyOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedAcousticDecoy := TAcoustic_Decoy_On_Board(lbAllAcousticDecoyOnBoard.Items.Objects[lbAllAcousticDecoyOnBoard.ItemIndex]);
end;

procedure TfrmAcousticDecoyOnBoardPickList.UpdateAcousticDecoyList;
var
  i : Integer;
  acousticdecoy : TAcoustic_Decoy_On_Board;
begin
  lbAllAcousticDecoyDef.Items.Clear;
  lbAllAcousticDecoyOnBoard.Items.Clear;

  dmTTT.GetAllAcousticDecoyDef(FAllAcousticDecoyDefList);
  dmTTT.GetAcousticDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllAcousticDecoyOnBoardList);

  for i := 0 to FAllAcousticDecoyDefList.Count - 1 do
  begin
    acousticdecoy := FAllAcousticDecoyDefList.Items[i];
    lbAllAcousticDecoyDef.Items.AddObject(acousticdecoy.FAccousticDecoy_Def.Decoy_Identifier, acousticdecoy);
  end;

  for i := 0 to FAllAcousticDecoyOnBoardList.Count - 1 do
  begin
    acousticdecoy := FAllAcousticDecoyOnBoardList.Items[i];
    lbAllAcousticDecoyOnBoard.Items.AddObject(acousticdecoy.FData.Instance_Identifier, acousticdecoy);
  end;
end;

{$ENDREGION}

end.
