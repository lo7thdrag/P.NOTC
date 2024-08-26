unit ufrmGameAreaPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Vcl.Imaging.pngimage,
  uDBAsset_GameEnvironment, uSimContainers;

type
  TfrmGameAreaPickList = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstAvailableGameArea: TListBox;
    btnAdd: TImage;
    btnCancel: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableGameAreaClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedGameAreaId : Integer;
               FSelectedGameAreaName:string;
    FGameAreaList : TList;
    FSelectedGameArea : TGame_Environment_Definition;

    procedure UpdateGameAreaList;

  public
    property SelectedGameAreaId : Integer read FSelectedGameAreaId write FSelectedGameAreaId;
    property SelectedGameAreaName : string read FSelectedGameAreaName write FSelectedGameAreaName;

  end;

var
  frmGameAreaPickList: TfrmGameAreaPickList;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmGameAreaPickList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeItemsAndFreeList(FGameAreaList);

  Action := cafree;
end;

procedure TfrmGameAreaPickList.FormCreate(Sender: TObject);
begin
  FGameAreaList := TList.Create;
end;

procedure TfrmGameAreaPickList.FormShow(Sender: TObject);
begin
  UpdateGameAreaList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmGameAreaPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableGameArea.ItemIndex = -1 then
    Exit;

  FSelectedGameAreaId := FSelectedGameArea.FGameArea.Game_Area_Index;
     FSelectedGameAreaName := FSelectedGameArea.FGameArea.Game_Area_Identifier;
  Close;

end;

procedure TfrmGameAreaPickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGameAreaPickList.lstAvailableGameAreaClick(Sender: TObject);
begin
  if lstAvailableGameArea.ItemIndex = -1 then
    Exit;

  FSelectedGameArea := TGame_Environment_Definition(lstAvailableGameArea.Items.Objects[lstAvailableGameArea.ItemIndex]);
end;

procedure TfrmGameAreaPickList.UpdateGameAreaList;
var
  i : Integer;
  gamearea : TGame_Environment_Definition;
begin
  lstAvailableGameArea.Items.Clear;

  dmTTT.GetAllGameAreaDef(FGameAreaList);

  for i := 0 to FGameAreaList.Count - 1 do
  begin
    gameArea := FGameAreaList.Items[i];

    lstAvailableGameArea.Items.AddObject(gameArea.FGameArea.Game_Area_Identifier, gameArea);

  end;
end;

{$ENDREGION}

end.
