unit ufrmSelfDefensiveJammerOnBoardPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  uDBAsset_Vehicle, uDBAsset_Countermeasure ;

type
  TfrmSelfDefensiveJammerOnBoardPickList = class(TForm)
    lbAllDefensiveJammerDef: TListBox;
    lbAllDefensiveJammerOnBoard: TListBox;
    btnAdd: TImage;
    btnClose: TImage;
    btnRemove: TImage;
    ImgBackgroundAvailable: TImage;
    ImgBackgroundOnBoard: TImage;
    ImgHeaderAvailable: TImage;
    ImgHeaderOnBoard: TImage;
    Label1: TLabel;
    Label2: TLabel;
    ImgBackgroundForm: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbAllDefensiveJammerDefClick(Sender: TObject);
    procedure lbAllDefensiveJammerOnBoardClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);

  private
    FAllDefensiveJammerDefList : TList;
    FAllDefensiveJammerOnBoardList : TList;

    FSelectedVehicle : TVehicle_Definition;
    FSelectedDefensiveJammer : TDefensive_Jammer_On_Board;

    function CekInput: Boolean;
    procedure UpdateDefensiveJammerList;

  public
    property SelectedVehicle : TVehicle_Definition read FSelectedVehicle write FSelectedVehicle;

  end;

var
  frmSelfDefensiveJammerOnBoardPickList: TfrmSelfDefensiveJammerOnBoardPickList;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSelfDefensiveJammerOnBoardPickList.FormCreate(Sender: TObject);
begin
  FAllDefensiveJammerDefList := TList.Create;
  FAllDefensiveJammerOnBoardList := TList.Create;
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.FormShow(Sender: TObject);
begin
  UpdateDefensiveJammerList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSelfDefensiveJammerOnBoardPickList.btnAddClick(Sender: TObject);
begin
  if lbAllDefensiveJammerDef.ItemIndex = -1 then
    Exit;

  if not CekInput then
  begin
    Exit;
  end;

  with FSelectedDefensiveJammer do
  begin
    FData.Instance_Identifier := FDefensiveJammer_Def.Defensive_Jammer_Identifier;
    FData.Instance_Type := 0;
    FData.Vehicle_Index := FSelectedVehicle.FData.Vehicle_Index;
    FData.Defensive_Jammer_Index := FDefensiveJammer_Def.Defensive_Jammer_Index;

    if FData.Defensive_Jammer_Instance_Index = 0 then
      dmTTT.InsertSelfDefensiveJammerOnBoard(FData)
    else
      dmTTT.UpdateSelfDefensiveJammerOnBoard(FData);
  end;

  UpdateDefensiveJammerList;
end;


function TfrmSelfDefensiveJammerOnBoardPickList.CekInput: Boolean;
begin
  Result := False;

  {Jika Mount Name sudah ada}
  if dmTTT.GetSelfDefensiveJammerOnBoardCount(FSelectedVehicle.FData.Vehicle_Index, FSelectedDefensiveJammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier) then
  begin
    {Jika inputan baru}
    if FSelectedDefensiveJammer.FData.Defensive_Jammer_Instance_Index = 0 then
    begin
      ShowMessage('Duplicate Defensive Jammer!' + Char(13) + 'Choose another Defensive Jammer to continue.');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.btnRemoveClick(Sender: TObject);
begin
  if lbAllDefensiveJammerOnBoard.ItemIndex = -1 then
    Exit;

  with FSelectedDefensiveJammer.FData do
  begin
    dmTTT.DeleteSelfDefensiveJammerOnBoard(2, Defensive_Jammer_Instance_Index);
  end;

  UpdateDefensiveJammerList;
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.lbAllDefensiveJammerDefClick(Sender: TObject);
begin
  if lbAllDefensiveJammerDef.ItemIndex = -1 then
    Exit;

  FSelectedDefensiveJammer := TDefensive_Jammer_On_Board(lbAllDefensiveJammerDef.Items.Objects[lbAllDefensiveJammerDef.ItemIndex]);
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.lbAllDefensiveJammerOnBoardClick(Sender: TObject);
begin
  if lbAllDefensiveJammerOnBoard.ItemIndex = -1 then
    Exit;

  FSelectedDefensiveJammer := TDefensive_Jammer_On_Board(lbAllDefensiveJammerOnBoard.Items.Objects[lbAllDefensiveJammerOnBoard.ItemIndex]);
end;

procedure TfrmSelfDefensiveJammerOnBoardPickList.UpdateDefensiveJammerList;
var
  i : Integer;
  definsivejammer : TDefensive_Jammer_On_Board;
begin
  lbAllDefensiveJammerDef.Items.Clear;
  lbAllDefensiveJammerOnBoard.Items.Clear;

  dmTTT.GetAllSelfDefensiveJammerDef(FAllDefensiveJammerDefList);
  dmTTT.GetSelfDefensiveJammerOnBoard(FSelectedVehicle.FData.Vehicle_Index,FAllDefensiveJammerOnBoardList);

  for i := 0 to FAllDefensiveJammerDefList.Count - 1 do
  begin
    definsivejammer := FAllDefensiveJammerDefList.Items[i];
    lbAllDefensiveJammerDef.Items.AddObject(definsivejammer.FDefensiveJammer_Def.Defensive_Jammer_Identifier, definsivejammer);
  end;

  for i := 0 to FAllDefensiveJammerOnBoardList.Count - 1 do
  begin
    definsivejammer := FAllDefensiveJammerOnBoardList.Items[i];
    lbAllDefensiveJammerOnBoard.Items.AddObject(definsivejammer.FData.Instance_Identifier, definsivejammer);
  end;
end;

{$ENDREGION}

end.
