unit ufrmTorpedoPickList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,Vcl.ExtCtrls,
  uDBAsset_Weapon;

type
  TfrmTorpedoPickList = class(TForm)
    lbl1: TLabel;
    lstAvailableTorpedo: TListBox;
    btnAdd: TImage;
    btnCancel: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lstAvailableTorpedoClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FTorpedoList : TList;
    FTorpedoId : Integer;

    FSelectedTorpedo : TTorpedo_On_Board;
    FSelectedHybrid : THybrid_On_Board;

    procedure UpdateTorpedoList;

  public
    property SelectedHybrid : THybrid_On_Board read FSelectedHybrid write FSelectedHybrid;
  end;

var
  frmTorpedoPickList: TfrmTorpedoPickList;

implementation

uses
  uDataModuleTTT;
{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmTorpedoPickList.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;

begin

  for i := FTorpedoList.Count - 1 downto 0 do
  begin
    TTorpedo_On_Board(FTorpedoList[i]).Free
  end;
  FTorpedoList.Clear;
  FTorpedoList.Free;

  Action := cafree;
end;

procedure TfrmTorpedoPickList.FormCreate(Sender: TObject);
begin
  FTorpedoList := TList.Create;
end;

procedure TfrmTorpedoPickList.FormShow(Sender: TObject);
begin
  UpdateTorpedoList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmTorpedoPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableTorpedo.ItemIndex = -1 then
    Exit;

  with FSelectedHybrid.FTorpedo_Def do
  begin
    Torpedo_Index := FSelectedTorpedo.FDef.Torpedo_Index;
    Class_Identifier := FSelectedTorpedo.FDef.Class_Identifier;
  end;

  close;
end;

procedure TfrmTorpedoPickList.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmTorpedoPickList.lstAvailableTorpedoClick(Sender: TObject);
begin
  if lstAvailableTorpedo.ItemIndex = -1 then
    Exit;

  FSelectedTorpedo := TTorpedo_On_Board(lstAvailableTorpedo.Items.Objects[lstAvailableTorpedo.ItemIndex]);
end;

procedure TfrmTorpedoPickList.UpdateTorpedoList;
var
  i : Integer;
  torpedo : TTorpedo_On_Board;
begin
  lstAvailableTorpedo.Items.Clear;

  dmTTT.GetAllTorpedoDef(FTorpedoList);

  for i := 0 to FTorpedoList.Count - 1 do
  begin
    torpedo := FTorpedoList.Items[i];
    lstAvailableTorpedo.Items.AddObject(torpedo.FDef.Class_Identifier, torpedo);
  end;

end;

{$ENDREGION}

end.
