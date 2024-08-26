unit uSaveAsPlotting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uMainPlottingShape, uSimMgr_Client, uDrawStrategi,
  uDataModuleTTT, uPlottingRecord, tttData, uDBEditSetting, uLibSettingTTT,
  ExtCtrls, DBCtrls, CheckLst;

type
  TfmSaveAsPlot = class(TForm)
    lvSaveAsPlot: TListView;
    btnSave: TButton;
    btnClose: TButton;
    pnlScenario: TPanel;
    lblScenario: TLabel;
    lbl1: TLabel;
    rgForce: TRadioGroup;
    procedure refresform;
    Function FileStream(fFile: string): Boolean;
    procedure btnSaveClick(Sender: TObject);
    procedure lvSaveAsPlotSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Fname : string;
    FTipe : string;
    FForce : string ;
    FListPlot : TList;
    FData : TRecPlotting_Definition;
    FIndexPlot : Integer;
    FTypePlot : Integer;
    FGroupPlot : Integer;
    Chek: Integer;
  public
    { Public declarations }
    FSaveToDatabase : Boolean;
    property aData : TRecPlotting_Definition read FData write FData;
    property aName: string read Fname write Fname;
    property aIndex: integer read FIndexPlot write FIndexPlot;
    property aType: integer read FTypePlot write FTypePlot;
    property aGroup: integer read FGroupPlot write FGroupPlot;
  end;
var
  fmSaveAsPlot: TfmSaveAsPlot;

implementation
uses
  uStrategiEditor, uPlottingTime;

{$R *.dfm}
procedure TfmSaveAsPlot.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSaveAsPlot.btnSaveClick(Sender: TObject);
var
  I: Integer;
  plot : TMainPlottingShape;
  SaveAvailable : Boolean;
begin
  if Fname ='' then
  begin
    ShowMessage('Please select plotting!');
    Exit;
  end;
  if FSaveToDatabase = false then
  begin

      if rgForce.ItemIndex <> -1 then
      begin
        SaveAvailable := True;
      end
      else
         SaveAvailable := False;

    if not SaveAvailable then
    begin
      ShowMessage('Please Choose group force!');
      Exit;
    end;
  end;

  FData.Plotting_Name := Fname;

  if FTipe = 'Intelijen' then
    FData.Plotting_Type := 0
  else if  FTipe = 'Logistik' then
    FData.Plotting_Type := 1
  else if  FTipe = 'Radar' then
    FData.Plotting_Type := 2
  else if  FTipe = 'Pangkalan' then
    FData.Plotting_Type := 3
  else if  FTipe = 'Panah' then
    FData.Plotting_Type := 4;

  if FForce = 'Red' then
    FData.Plotting_Group := 1
  else
    FData.Plotting_Group := 3;

  for I := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
  begin
    plot := simMgrClient.SimPlotting.FList[I];
    if (plot.Name = FData.Plotting_Name) and (plot.Tipe = FData.Plotting_Type) then
      FIndexPlot := I;
  end;
  FTypePlot := FData.Plotting_Type;
  FGroupPlot := FData.Plotting_Group;
  if dmTTT.CekPlottingInsert(Fname) then
  begin
    ShowMessage('Please use another name');
    Exit;
  end;
  if FileStream(vMapSetting.PlottingDestination + '\' + Fname +'.dat') then
  begin

    if FSaveToDatabase = false then
    begin
      fmPlottingTime.Show;
    end
    else
    begin
      FIndexPlot := dmTTT.InsertPlotting_Definition(FData) ;
      ShowMessage('Data saved');
    end;
  end
  else
    Exit;
end;

function TfmSaveAsPlot.FileStream(fFile: string): Boolean;
var
  Fs : TFileStream;
begin
  Result := True;
  try
    Fs := TFileStream.Create(fFile, fmOpenWrite or fmCreate);
    simMgrClient.SimPlotting.SaveStreamData(Fs, FIndexPlot);
  Except
    Showmessage('Can''t save file plotting!' + #13);
    Result := False;
    Exit;
  end;
  Fs.Free;
end;

procedure TfmSaveAsPlot.FormCreate(Sender: TObject);
begin
  FListPlot := TList.Create;
end;

procedure TfmSaveAsPlot.FormDestroy(Sender: TObject);
begin
  FListPlot.Free;
end;

procedure TfmSaveAsPlot.FormShow(Sender: TObject);
var
  I: Integer;
begin
  refresform;
  lblScenario.Caption := simMgrClient.Scenario.ScenarioName;
  Fname := '';
  FTipe := '';
  FForce := '';
  Chek := 0;
  rgForce.ItemIndex := -1;
end;

procedure TfmSaveAsPlot.lvSaveAsPlotSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if Selected then
  begin
    btnSave.Enabled := True;
    Fname := Item.SubItems[0];
    FTipe := Item.SubItems[1];
    FForce := Item.SubItems[2];
  end
  else
    btnSave.Enabled := False;
end;

procedure TfmSaveAsPlot.refresform;
var
  I: Integer;
  plotting : TMainPlottingShape;
  color : string;
begin
  lvSaveAsPlot.Clear;
  for I := 0 to simMgrClient.SimPlotting.FList.Count - 1 do
  begin
    plotting := simMgrClient.SimPlotting.FList[I];
    if plotting.IsCreate then
    begin
      if plotting.Identity = 255 then
        color := 'Red'
      else
        color := 'Blue';
      with lvSaveAsPlot.Items.Add do
      begin
        SubItems.Add(Plotting.Name);
        case Plotting.Tipe of
          0: SubItems.Add('Intelijen');
          1: SubItems.Add('Logistik');
          2: SubItems.Add('Radar');
          3: SubItems.Add('Pangkalan');
          4: SubItems.Add('Panah');
        end;
        SubItems.Add(color);
      end;
    end;
  end;
  lvSaveAsPlot.Items.BeginUpdate;
  try
    for i := 0 to lvSaveAsPlot.Items.Count-1 do
      lvSaveAsPlot.Items.Item[i].Caption:=IntToStr(i+1);
  finally
    lvSaveAsPlot.Items.EndUpdate;
  end;
end;
end.
