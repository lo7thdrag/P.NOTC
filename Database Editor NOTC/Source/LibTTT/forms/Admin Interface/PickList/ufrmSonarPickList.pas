unit ufrmSonarPickList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,Vcl.ExtCtrls,
  uDBAsset_Sonar;

type
  TfrmSonarPickList = class(TForm)
    lstAvailableSonar: TListBox;
    btnAdd: TImage;
    btnCancel: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label1: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableSonarClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedSonarId : Integer;

    FSonarList : TList;
    FSelectedSonar : TSonar_On_Board;

    procedure UpdateSonarList;

  public
    property SelectedSonarId : Integer read FSelectedSonarId write FSelectedSonarId;
  end;

var
  frmSonarPickList: TfrmSonarPickList;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSonarPickList.FormCreate(Sender: TObject);
begin
  FSonarList := TList.Create;
end;

procedure TfrmSonarPickList.FormShow(Sender: TObject);
begin
  UpdateSonarList
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSonarPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableSonar.ItemIndex = -1 then
    Exit;

  FSelectedSonarId := FSelectedSonar.FDef.Sonar_Index;
  close;

end;

procedure TfrmSonarPickList.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmSonarPickList.lstAvailableSonarClick(Sender: TObject);
begin
  if lstAvailableSonar.ItemIndex = -1 then
    Exit;

  FSelectedSonar := TSonar_On_Board(lstAvailableSonar.Items.Objects[lstAvailableSonar.ItemIndex]);
end;

procedure TfrmSonarPickList.UpdateSonarList;
var
  i : Integer;
  sonar : TSonar_On_Board;
begin
  lstAvailableSonar.Items.Clear;

  dmTTT.GetAllSonarDef(FSonarList);

  for i := 0 to FSonarList.Count - 1 do
  begin
    sonar := FSonarList.Items[i];
    lstAvailableSonar.Items.AddObject(sonar.FDef.Sonar_Identifier, sonar);
  end;
end;

{$ENDREGION}

end.
