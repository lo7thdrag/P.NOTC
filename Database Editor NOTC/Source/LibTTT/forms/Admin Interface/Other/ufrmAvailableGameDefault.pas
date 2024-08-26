unit ufrmAvailableGameDefault;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, uDBGame_Defaults;

type
  TfrmAvailableGameDefault = class(TForm)
    lstGameDefault: TListBox;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    Image1: TImage;
    btnEdit: TImage;
    imgImgBtnBack: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lbSingleClick(Sender: TObject);

    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtgameareaDefKeyPress(Sender: TObject; var Key: Char);

  private
    FUpdateList : Boolean;
    FGameDefaultList : TList;
    FSelectedGameDefaults : TGame_Defaults;

    procedure UpdateGameDefaultList;
    procedure CopyGameDefaultEffect(const aDefaultIndex,aNewDefaultIndex: Integer);
    procedure CopyGameDefaultIFF(const aDefaultIndex,aNewDefaultIndex: Integer);
  end;

var
  frmAvailableGameDefault: TfrmAvailableGameDefault;

implementation

uses
  uDataModuleTTT, ufrmSummaryGameDefaults, ufrmUsage, newClassASTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmAvailableGameDefault.FormCreate(Sender: TObject);
begin
  FGameDefaultList := TList.Create;
end;

procedure TfrmAvailableGameDefault.FormShow(Sender: TObject);
begin
  UpdateGameDefaultList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmAvailableGameDefault.btnNewClick(Sender: TObject);
begin
  frmSummaryGameDefault := TfrmSummaryGameDefault.Create(Self);
  try
    with frmSummaryGameDefault do
    begin
      SelectedGameDefault := TGame_Defaults.Create;
      ShowModal;
      SelectedGameDefault.Free;
      FUpdateList := AfterClose;
    end;
  finally
    frmSummaryGameDefault.Free;
  end;

  if FUpdateList then
    UpdateGameDefaultList;
end;

procedure TfrmAvailableGameDefault.btnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmAvailableGameDefault.btnCopyClick(Sender: TObject);
var
  newClassName : string;
  count, parentIndex : Integer;
begin
  if lstGameDefault.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  with TGame_Defaults(FSelectedGameDefaults) do
  begin
    parentIndex := FData.Defaults_Index;
    newClassName := FData.Defaults_Identifier + ' - Copy';

    count := dmTTT.GetGameDefaultDef(newClassName);

    if count > 0 then
    newClassName := newClassName + ' (' + IntToStr(count + 1) + ')';

    FData.Defaults_Identifier := newClassName;

    dmTTT.InsertGameDefaultDef(FData);
    CopyGameDefaultEffect(parentIndex, FData.Defaults_Index);
    CopyGameDefaultIFF(parentIndex, FData.Defaults_Index);
  end;

  UpdateGameDefaultList;
end;

procedure TfrmAvailableGameDefault.btnEditClick(Sender: TObject);
begin
  if lstGameDefault.ItemIndex = -1 then
  begin
    ShowMessage('Select Game Default... !');
    Exit;
  end;

  frmSummaryGameDefault := TfrmSummaryGameDefault.Create(Self);
  try
    with frmSummaryGameDefault do
    begin
      SelectedGameDefault := FSelectedGameDefaults;
      ShowModal;
      FUpdateList := AfterClose;
    end;

  finally
    frmSummaryGameDefault.Free;
  end;

  if FUpdateList then
    UpdateGameDefaultList;
end;

procedure TfrmAvailableGameDefault.btnDeleteClick(Sender: TObject);
var
  warning : Integer;
  tempList: TList;

begin
  if lstGameDefault.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  warning := MessageDlg('Are you sure to delete this item?', mtConfirmation, mbOKCancel, 0);

  if warning = mrOK then
  begin
    tempList := TList.Create;

    with FSelectedGameDefaults.FData do
    begin
      {Pengecekan Game Default utama tidak bisa dihapus}
      if Defaults_Index = 1 then
      begin
        ShowMessage('Cannot delete Default GameDefault');
        Exit;
      end;

      {Pengecekan Relasi Dengan Resource Allocation}
      if dmTTT.GetGameDefaultAtResourceAllocation(Defaults_Index, tempList) then
      begin
        ShowMessage('Cannot delete, because is already used by some Resource Allocation');
        tempList.Free;
        Exit;
      end;
      tempList.Free;

      dmTTT.DeleteGameRainfallOnRadar(Defaults_Index);
      dmTTT.DeleteGameCloudOnRadar(Defaults_Index);
      dmTTT.DeleteGameSeaStateOnRadar(Defaults_Index);
      dmTTT.DeleteGameRainfallOnESM(Defaults_Index);
      dmTTT.DeleteGameCloudOnESM(Defaults_Index);
      dmTTT.DeleteGameRainfallOnMissile(Defaults_Index);
      dmTTT.DeleteGameSeaStateOnMissile(Defaults_Index);
      dmTTT.DeleteGameRainfallOnSonar(Defaults_Index);
      dmTTT.DeleteGameShipNoiseOnSonar(Defaults_Index);
      dmTTT.DeleteGameSeaStateOnSonar(Defaults_Index);
      dmTTT.DeleteIFFModeCode(Defaults_Index);

      if dmTTT.DeleteGameDefaultDef(Defaults_Index) then
        ShowMessage('Data has been deleted');
    end;

    UpdateGameDefaultList;
  end;
end;

procedure TfrmAvailableGameDefault.btnUsageClick(Sender: TObject);
begin
  if lstGameDefault.ItemIndex = -1 then
  begin
    ShowMessage('Select Torpedo... !');
    Exit;
  end;

  with frmUsage do
  begin
    UId := FSelectedGameDefaults.FData.Defaults_Index;
    name_usage := FSelectedGameDefaults.FData.Defaults_Identifier;
    UIndex := 40;

    ShowModal;
  end;

end;

procedure TfrmAvailableGameDefault.lbSingleClick(Sender: TObject);
begin
  if lstGameDefault.ItemIndex = -1 then
    Exit;
  FSelectedGameDefaults := TGame_Defaults(lstGameDefault.Items.Objects[lstGameDefault.ItemIndex]);
end;

procedure TfrmAvailableGameDefault.UpdateGameDefaultList;
var
  i : Integer;
  gamedefaults : TGame_Defaults;
begin
  lstGameDefault.Items.Clear;

  dmTTT.GetAllGameDefaultDef(FGameDefaultList);

  for i := 0 to FGameDefaultList.Count - 1 do
  begin
    gamedefaults := FGameDefaultList.Items[i];
    lstGameDefault.Items.AddObject(gamedefaults.FData.Defaults_Identifier, gamedefaults);
  end;
end;

procedure TfrmAvailableGameDefault.CopyGameDefaultEffect(const aDefaultIndex, aNewDefaultIndex: Integer);
var
  effectList : TList;
  i : Integer;
  radarRainfall : TGame_Rainfall_On_Radar;
  radarCloud : TGame_Cloud_On_Radar;
  radarSeastate : TGame_Sea_On_Radar;
  esmRainfall : TGame_Rainfall_On_ESM;
  esmCloud : TGame_Cloud_On_ESM;
  missileRainfall : TGame_Rainfall_On_Missile_Seeker;
  missileSeastate : TGame_Sea_On_Missile_Safe_Altitude;
  sonarRainfall : TGame_Rainfall_On_Sonar;
  sonarShipNoise : TGame_Ship_On_Sonar;
  sonarSeastate : TGame_Sea_On_Sonar;
begin
  effectList := TList.Create;

//  dmTTT.GetGameRainfallOnRadar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    radarRainfall := effectList.Items[i];

    with radarRainfall do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameRainfallOnRadar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    radarRainfall := effectList.Items[i];
    radarRainfall.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameCloudOnRadar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    radarCloud := effectList.Items[i];

    with radarCloud do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameCloudOnRadar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    radarCloud := effectList.Items[i];
    radarCloud.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameSeaStateOnRadar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    radarSeastate := effectList.Items[i];

    with radarSeastate do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameSeaStateOnRadar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    radarSeastate := effectList.Items[i];
    radarSeastate.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameRainfallOnESM(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    esmRainfall := effectList.Items[i];

    with esmRainfall do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameRainfallOnESM(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    esmRainfall := effectList.Items[i];
    esmRainfall.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameCloudOnESM(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    esmCloud := effectList.Items[i];

    with esmCloud do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameCloudOnESM(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    esmCloud := effectList.Items[i];
    esmCloud.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameRainfallOnMissile(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    missileRainfall := effectList.Items[i];

    with missileRainfall do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameRainfallOnMissile(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    missileRainfall := effectList.Items[i];
    missileRainfall.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameSeaStateOnMissile(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    missileSeastate := effectList.Items[i];

    with missileSeastate do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameSeaStateOnMissile(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    missileSeastate := effectList.Items[i];
    missileSeastate.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameRainfallOnSonar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    sonarRainfall := effectList.Items[i];

    with sonarRainfall do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameRainfallOnSonar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    sonarRainfall := effectList.Items[i];
    sonarRainfall.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameShipNoiseOnSonar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    sonarShipNoise := effectList.Items[i];

    with sonarShipNoise do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameShipNoiseOnSonar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    sonarShipNoise := effectList.Items[i];
    sonarShipNoise.Free;
  end;

  effectList.Clear;

//  dmTTT.GetGameSeaStateOnSonar(aDefaultIndex, effectList);

  for i := 0 to effectList.Count - 1 do
  begin
    sonarSeastate := effectList.Items[i];

    with sonarSeastate do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertGameSeaStateOnSonar(FData);
    end;
  end;

  for i := 0 to effectList.Count - 1 do
  begin
    sonarSeastate := effectList.Items[i];
    sonarSeastate.Free;
  end;

  effectList.Free;
end;

procedure TfrmAvailableGameDefault.CopyGameDefaultIFF(const aDefaultIndex, aNewDefaultIndex: Integer);
var
  iffMCList : TList;
  i : Integer;
  iffMC : TGame_Default_IFF_Mode_Code;
begin
  iffMCList := TList.Create;

//  dmTTT.GetIFFModeCode(aDefaultIndex, iffMCList);

  for i := 0 to iffMCList.Count - 1 do
  begin
    iffMC := iffMCList.Items[i];

    with iffMC do
    begin
      FData.Defaults_Index := aNewDefaultIndex;

//      dmTTT.InsertIFFModeCode(FData);
    end;
  end;

  for i := 0 to iffMCList.Count - 1 do
  begin
    iffMC := iffMCList.Items[i];
    iffMC.Free;
  end;

  iffMCList.Free;
end;

procedure TfrmAvailableGameDefault.edtgameareaDefKeyPress(Sender: TObject;
  var Key: Char);
  var
   i : Integer;
 gamedefaults : TGame_Defaults;
begin
  if Key = #13 then
  begin
    lstGameDefault.Items.Clear;

//    dmTTT.GetfilterGameAreadef(TGame_Defaults,edtgameareaDef.Text);

    for i := 0 to FGameDefaultList.Count - 1 do
    begin
  gamedefaults := FGameDefaultList.Items[i];
    lstGameDefault.Items.AddObject(gamedefaults.FData.Defaults_Identifier, gamedefaults);
    end;
  end;
end;

{$ENDREGION}

end.
