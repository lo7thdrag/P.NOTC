unit uFormDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uBaseCoordSystem, MapXLib_TLB;

type
  TFormDefinition = class(TForm)
    grp_Definition: TGroupBox;
    grp_StartPoint: TGroupBox;
    lbl_X1: TLabel;
    lbl_Y1: TLabel;
    edt_X1Value: TEdit;
    edt_Y1Value: TEdit;
    grp_EndPoint: TGroupBox;
    lbl_X2: TLabel;
    lbl_Y2: TLabel;
    edt_X2Value: TEdit;
    edt_Y2Value: TEdit;
    btn_OK: TButton;
    btn_Close: TButton;
    btn_PStart: TSpeedButton;
    btn_PEnd: TSpeedButton;
    grp_Zoom: TGroupBox;
    lbl_ZoomIn: TLabel;
    lbl_ZoomOut: TLabel;
    edt_ZoomMinValue: TEdit;
    edt_ZoomMaxValue: TEdit;

    procedure btn_CloseClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure btn_PStartClick(Sender: TObject);
    procedure btn_PEndClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ZoomMinClick(Sender: TObject);
    procedure btn_ZoomMaxClick(Sender: TObject);
    procedure edt_ZoomMinValueKeyPress(Sender: TObject; var Key: Char);
    procedure edt_ZoomMaxValueKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

    LastIndex : Integer;

    function GetInput(s : string): Boolean;

  public
    FBtnActive : Integer;
    FS_MapX, FS_MapY, FE_MapX, FE_MapY  : Double;
    FObjArea : Boolean;
    FListDefArea : TStringList;
    FListCheckValueArea : TStringList;
    FNewData : string;
    FIndexNewdata : Integer;
    FIndex : Integer;
    FCountOriArea : Integer;

    procedure Fill_Longlat;
    procedure SaveDefSelectedArea;
  end;

var
  FormDefinition: TFormDefinition;

implementation

uses
  uCreateDefinitionArea;

{$R *.dfm}

procedure TFormDefinition.btn_CloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  CreateDefinitionArea.FBtnSetDef := False;

  edt_X1Value.Text := '0';
  edt_Y1Value.Text := '0';
  edt_X2Value.Text := '0';
  edt_Y2Value.Text := '0';

  edt_ZoomMinValue.Text := '';
  edt_ZoomMaxValue.Text := '';

  FObjArea := False;
  FBtnActive := 0;
  btn_PStart.Down := False;
  btn_PEnd.Down := False;

  Close;
end;

procedure TFormDefinition.btn_OKClick(Sender: TObject);
begin
  ModalResult := mrOk;
  CreateDefinitionArea.FBtnSetDef := False;

  if (StrToFloat(edt_ZoomMinValue.Text) >= StrToFloat(edt_ZoomMaxValue.Text)) then
  begin
    ShowMessage('Minimum zoom value must be less than the maximum zoom value!');
    Exit;
  end
  else
  begin
    SaveDefSelectedArea;

    edt_X1Value.Text := '0';
    edt_Y1Value.Text := '0';
    edt_X2Value.Text := '0';
    edt_Y2Value.Text := '0';

    edt_ZoomMinValue.Text := '';
    edt_ZoomMaxValue.Text := '';

    FObjArea := False;
    FBtnActive := 0;
    btn_PStart.Down := False;
    btn_PEnd.Down := False;

    Close;
  end;
end;

procedure TFormDefinition.btn_PEndClick(Sender: TObject);
begin
  FBtnActive := 2;
  FObjArea := True;

  btn_PStart.Down := False;
end;

procedure TFormDefinition.btn_PStartClick(Sender: TObject);
begin
  FBtnActive := 1;
  FObjArea := True;

  CreateDefinitionArea.mp_SelectedGameArea.CurrentTool := miArrowTool;
  CreateDefinitionArea.mp_SelectedGameArea.MousePointer := miCrossCursor;

  btn_PEnd.Down := False;
end;

procedure TFormDefinition.btn_ZoomMaxClick(Sender: TObject);
begin
  FBtnActive := 5;
  CreateDefinitionArea.mp_SelectedGameArea.CurrentTool  := miZoomOutTool;
  CreateDefinitionArea.mp_SelectedGameArea.MousePointer := miZoomOutCursor;
end;

procedure TFormDefinition.btn_ZoomMinClick(Sender: TObject);
begin
  FBtnActive := 4;
  CreateDefinitionArea.mp_SelectedGameArea.CurrentTool  := miZoomInTool;
  CreateDefinitionArea.mp_SelectedGameArea.MousePointer := miZoomInCursor;
end;

procedure TFormDefinition.edt_ZoomMaxValueKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    CreateDefinitionArea.mp_SelectedGameArea.Zoom := StrToFloat(edt_ZoomMaxValue.Text);
  end;
end;

procedure TFormDefinition.edt_ZoomMinValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in[#48 .. #57, #8, #13, #46]) then
  begin
    Key := #0;
    Exit;
  end;

  if GetInput(TEdit(sender).Text) then
  begin
    if Key = #46 then
      Key := #0;
  end;

  if key = #13 then
  begin
    CreateDefinitionArea.mp_SelectedGameArea.Zoom := StrToFloat(edt_ZoomMinValue.Text);
  end;
end;

procedure TFormDefinition.Fill_Longlat;
begin
  case FBtnActive of
  1 :
    begin
      edt_X1Value.Text := formatDMS_long(FS_MapX);
      edt_Y1Value.Text := formatDMS_latt(FS_MapY);
    end;
  2 :
    begin
      edt_X2Value.Text := formatDMS_long(FE_MapX);
      edt_Y2Value.Text := formatDMS_latt(FE_MapY);
    end;
  3 :
    begin
      edt_X1Value.Text := formatDMS_long(FS_MapX);
      edt_Y1Value.Text := formatDMS_latt(FS_MapY);
      edt_X2Value.Text := formatDMS_long(FE_MapX);
      edt_Y2Value.Text := formatDMS_latt(FE_MapY);
    end;
  end;
end;

procedure TFormDefinition.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FBtnActive := 0;
  CreateDefinitionArea.FBtnSetDef := False;
  CreateDefinitionArea.mp_SelectedGameArea.CurrentTool   := miArrowTool;
  CreateDefinitionArea.mp_SelectedGameArea.MousePointer  := crDefault;
end;

procedure TFormDefinition.FormCreate(Sender: TObject);
begin
  FListDefArea := TStringList.Create;
  FListCheckValueArea := TStringList.Create;
end;

procedure TFormDefinition.FormShow(Sender: TObject);
begin
  FObjArea := True;
  CreateDefinitionArea.FBtnSetDef := True;

  if CreateDefinitionArea.FActive = 'Edit' then
  begin
    btn_OK.Left := 160;
    btn_Close.Visible := False;
  end
  else
  begin
    btn_Close.Visible:= True;
    btn_OK.Left := 112;
  end;
end;

function TFormDefinition.GetInput(s: string): Boolean;
var
  a, i : Integer;
begin
  Result := False;
  a := 0;

  for i := 1 to length(s) do
  begin
    if s[i] = '.' then
      a := a + 1;
  end;

  if a > 0 then
    Result := True;
end;

procedure TFormDefinition.SaveDefSelectedArea;
var
  DefValue : string;
  Nx1, Ny1, Nx2, Ny2 : Double;
  FData : string;
begin
  Nx1 := dmsToLong(edt_X1Value.Text);
  Ny1 := dmsToLatt(edt_Y1Value.Text);
  Nx2 := dmsToLong(edt_X2Value.Text);
  Ny2 := dmsToLatt(edt_Y2Value.Text);

  DefValue := 'Area_' + FormDefinition.Caption + '\X1_' + FloatToStr(Nx1) + '\Y1_' +
    FloatToStr(Ny1) + '\X2_' + FloatToStr(Nx2) + '\Y2_' + FloatToStr(Ny2) +
    '\InZoom_' + edt_ZoomMinValue.Text + '\OutZoom_' + edt_ZoomMaxValue.Text + '#';

  if FListDefArea.Count = 0 then
    LastIndex:= 0;

  if (FListDefArea.Count > 0) and (FNewData <> '') and (FNewData <> DefValue)
    and (FListCheckValueArea[FIndexNewdata] = '1') then
  begin
    FListDefArea.Delete(FIndexNewdata);
    FListDefArea.Insert(FIndexNewdata, DefValue);
  end
  else if (FNewData = DefValue) then
    Exit
  else if (CreateDefinitionArea.FActive = 'Edit') then
  begin
    if FIndex < FCountOriArea then
    begin
      FListDefArea[FIndex] := DefValue;
      CreateDefinitionArea.ListDefSelected[FIndex] := DefValue;
    end
    else if (FListDefArea.Count > 0) and (FNewData <> DefValue) and
      (FListCheckValueArea[FIndex] = '1') then
    begin
      FListDefArea.Delete(FIndex);
      FListDefArea.Insert(FIndex, DefValue);
      CreateDefinitionArea.ListDefSelected[FIndex] := DefValue;
    end
    else
    begin
      FListDefArea.Add(DefValue);
      CreateDefinitionArea.ListDefSelected.Add(DefValue);
      FListCheckValueArea[FIndex] := '1';
      FCountOriArea := CreateDefinitionArea.ListDefSelected.Count;
    end;
  end
  else
  begin
    FListDefArea.Add(DefValue);
    FListCheckValueArea[FIndex] := '1';
  end;

  LastIndex := FIndex;
end;

end.
