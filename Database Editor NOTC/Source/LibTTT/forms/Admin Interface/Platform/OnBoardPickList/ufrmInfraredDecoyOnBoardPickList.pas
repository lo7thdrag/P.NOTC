unit ufrmInfraredDecoyOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure, uSimContainers ;

type
  TfrmInfraredDecoyOnBoardPickList = class(TForm)
    lbAllInfraredDecoyDef: TListBox;
    lbAllInfraredDecoyOnBoard: TListBox;
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

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllInfraredDecoyDefClick(Sender: TObject);
    procedure lbAllInfraredDecoyOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FAllInfraredDecoyDefList : TList;
    FAllInfraredDecoyOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedInfraredDecoy : TInfrared_Decoy_On_Board;

    procedure UpdateInfraredDecoyList;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmInfraredDecoyOnBoardPickList: TfrmInfraredDecoyOnBoardPickList;

implementation

uses uDataModuleTTT, ufrmInfraRedmount;


{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmInfraredDecoyOnBoardPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FAllInfraredDecoyDefList);
  FreeItemsAndFreeList(FAllInfraredDecoyOnBoardList);
  Action := cafree;
end;

procedure TfrmInfraredDecoyOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllInfraredDecoyDefList := TList.Create;
  FAllInfraredDecoyOnBoardList := TList.Create;
end;

procedure TfrmInfraredDecoyOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateInfraredDecoyList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmInfraredDecoyOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllInfraredDecoyDef.ItemIndex = -1 then
    Exit;

  frmInfraRedmount := TfrmInfraRedmount.Create(Self);
  try
    with frmInfraRedmount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedInfraredDecoy := FSelectedInfraredDecoy;
      ShowModal;
    end;
    AfterClose := frmInfraRedmount.AfterClose;
  finally
    frmInfraRedmount.Free;
  end;

  UpdateInfraredDecoyList;
end;

procedure TfrmInfraredDecoyOnBoardPickList.btnEditClick(Sender: TObject);
begin
  if lbAllInfraredDecoyOnBoard.ItemIndex = -1 then
    Exit;

 frmInfraRedmount := TfrmInfraRedmount.Create(Self);
  try
    with frmInfraRedmount do
    begin
      SelectedVehicle := FSelectedVehicle;
      SelectedInfraredDecoy := FSelectedInfraredDecoy;
      ShowModal;
    end;
    AfterClose := frmInfraRedmount.AfterClose;
  finally
    frmInfraRedmount.Free;
  end;

  UpdateInfraredDecoyList;
end;

procedure TfrmInfraredDecoyOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllInfraredDecoyOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedInfraredDecoy.FData do
  begin
    dmTTT.DeleteInfraredDecoyOnBoard(2, Infrared_Decoy_Instance_Index);
  end;

  AfterClose := True;
  UpdateInfraredDecoyList;
end;

procedure TfrmInfraredDecoyOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInfraredDecoyOnBoardPickList.lbAllInfraredDecoyDefClick(Sender: TObject);
begin
  if lbAllInfraredDecoyDef.ItemIndex = -1 then
    Exit;

  FSelectedInfraredDecoy := TInfrared_Decoy_On_Board(lbAllInfraredDecoyDef.Items.Objects[lbAllInfraredDecoyDef.ItemIndex]);
end;

procedure TfrmInfraredDecoyOnBoardPickList.lbAllInfraredDecoyOnBoardClick(Sender: TObject);
begin
  if lbAllInfraredDecoyOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedInfraredDecoy := TInfrared_Decoy_On_Board(lbAllInfraredDecoyOnBoard.Items.Objects[lbAllInfraredDecoyOnBoard.ItemIndex]);
end;

procedure TfrmInfraredDecoyOnBoardPickList.UpdateInfraredDecoyList;
var
  i : Integer;
  infrareddecoy : TInfrared_Decoy_On_Board;
begin
  lbAllInfraredDecoyDef.Items.Clear;
  lbAllInfraredDecoyOnBoard.Items.Clear;

  dmTTT.GetAllInfraredDecoyDef(FAllInfraredDecoyDefList);
  dmTTT.GetInfraredDecoyOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllInfraredDecoyOnBoardList);

  for i := 0 to FAllInfraredDecoyDefList.Count - 1 do
  begin
    infrareddecoy := FAllInfraredDecoyDefList.Items[i];
    lbAllInfraredDecoyDef.Items.AddObject(infrareddecoy.FInfraRedDecoy_Def.Infrared_Decoy_Identifier, infrareddecoy);
  end;

  for i := 0 to FAllInfraredDecoyOnBoardList.Count - 1 do
  begin
    infrareddecoy := FAllInfraredDecoyOnBoardList.Items[i];
    lbAllInfraredDecoyOnBoard.Items.AddObject(infrareddecoy.FData.Instance_Identifier, infrareddecoy);
  end;
end;

{$ENDREGION}

end.
