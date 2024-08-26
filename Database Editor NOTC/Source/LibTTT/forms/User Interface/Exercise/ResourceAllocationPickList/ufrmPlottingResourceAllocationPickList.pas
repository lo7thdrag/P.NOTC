unit ufrmPlottingResourceAllocationPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDBAsset_Plotting_Definition, ufmPlottingTime, uDBAssetObject,
  DateUtils, Vcl.Imaging.pngimage;

type
  TfmPlottingResourceAllocationPickList = class(TForm)
    lbAllPlottingAvailable: TListBox;
    lbAllPlottingOnScenario: TListBox;
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

    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure lbAllPlottingOnScenarioClick(Sender: TObject);
    procedure lbAllPlottingAvailableClick(Sender: TObject);

    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);

  private
    FSelectedForce : Integer;

    FAllVehicleDefList : TList;
    FAllVehicleOnRAList : TList;

//    FSelectedVehicle : TVehicle_Definition;
    FResourceAllocation : TResource_Allocation;

    procedure UpdatePlottingList;

  public
    isNoCancel : Boolean;
    property ResourceAllocation : TResource_Allocation read FResourceAllocation write FResourceAllocation;
    property SelectedForce : Integer read FSelectedForce write FSelectedForce;
  end;

var
  fmPlottingResourceAllocationPickList: TfmPlottingResourceAllocationPickList;

implementation
uses
  uDataModuleTTT, ufrmSummaryResourceAllocation, ufrmUsage, ufrmSummaryPlotting, ufrmAvailableResourceAllocation,
  uDBEditSetting;
{$R *.dfm}

{ TForm1 }

procedure TfmPlottingResourceAllocationPickList.btnAddClick(Sender: TObject);
begin
//  if not FileExists(vAppDBSetting.PlottingPath + '\' + FPlotName + '.dat') then
//  begin
//    ShowMessage(FPlotName + '.dat does not exist');
//    Exit;
//  end;

  if lbAllPlottingAvailable.ItemIndex <> -1 then
  begin
//    isnew := True;
    fmPlottingTime.ShowModal;
  end;
end;

procedure TfmPlottingResourceAllocationPickList.btnCancelClick(Sender: TObject);
begin
//  PlotListMapping.Clear;
  Close;
end;

//procedure TfmPlottingResourceAllocationPickList.btnCopyClick(Sender: TObject);
//begin
//  if lbAllPlottingAvailable.ItemIndex = -1 then
//    Exit;
//  with frmSummaryPlotting do
//  begin
//    dmTTT.GetPlotting_DefinitionByID(StrToInt(lbAllPlottingAvailable.Items[lbAllPlottingAvailable.ItemIndex]), Plotting_Definition);
//
//    IdAction := 4;
//    ShowModal;
//  end;
//end;
//
//procedure TfmPlottingResourceAllocationPickList.btnEdit1Click(Sender: TObject);
//begin
//  if lbAllPlottingAvailable.ItemIndex = -1 then
//    Exit;
//  with frmSummaryPlotting do
//  begin
//    dmTTT.GetPlotting_DefinitionByID(StrToInt(lbAllPlottingAvailable.Items[lbAllPlottingAvailable.ItemIndex]), Plotting_Definition);
//
//    IdAction := 2;
//    ShowModal;
//  end;
//end;

procedure TfmPlottingResourceAllocationPickList.btnEditClick(Sender: TObject);
begin
  if lbAllPlottingOnScenario.ItemIndex <> -1 then
  begin
    with fmPlottingTime do
    begin
//      isnew := False;
//      TempDateTime := TResource_Allocation(PlotListMapping[idselect]).FPlotting.Date;
//      DecodeDateTime(TempDateTime, yy,mm,dd,hh,nn,ss, ns);
//      dtpDatePlotting.Date := TResource_Allocation(PlotListMapping[idselect]).FPlotting.Date;
//      dtpTimePlotting.Time := TResource_Allocation(PlotListMapping[idselect]).FPlotting.Date;
//      Show ;
    end;
  end;
end;

//procedure TfmPlottingResourceAllocationPickList.btnNewClick(Sender: TObject);
//begin
//  with frmSummaryPlotting do
//  begin
//    IdAction := 1;
//    ShowModal;
//  end;
//end;
//
//procedure TfmPlottingResourceAllocationPickList.btnOkClick(Sender: TObject);
//var
//  I : Integer;
//  plottemp : TResource_Allocation;
//begin
//  PlotListOK.Clear;
//  for I := 0 to PlotListMapping.Count - 1 do
//  begin
//
//    plottemp := TResource_Allocation.Create;
//
//    plottemp.FPlotting.Plotting_Index := TResource_Allocation(PlotListMapping[I]).FPlotting.Plotting_Index;
//    plottemp.FPlotting.Plotting_Name := TResource_Allocation(PlotListMapping[I]).FPlotting.Plotting_Name;
//    plottemp.FPlotting.Date := (TResource_Allocation(PlotListMapping[I]).FPlotting.Date);
//
//    plottemp.FPlotting.Force := TResource_Allocation(PlotListMapping[I]).FPlotting.Force;
//    PlotListOK.Add(plottemp);
//  end;
//  Close;
//end;

procedure TfmPlottingResourceAllocationPickList.btnRemoveClick(Sender: TObject );
var
  warning, i : Integer;
begin
  if lbAllPlottingOnScenario.ItemIndex <> -1 then
  begin
    warning := MessageDlg('Are you sure you want to delete this item ?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
//      for I := 0 to lbPlottingSelect.SelCount - 1 do
//      begin
//        PlotListMapping.Delete(idselect);
//        RefreshListPlotting;
//      end;
    end;
  end;
end;

//procedure TfmPlottingResourceAllocationPickList.FillListPlot;
//var
//  PlotSelected : TResource_Allocation;
//begin
//    PlotSelected := TResource_Allocation.Create;
//    PlotSelected.FPlotting.Plotting_Index := FPlotIndex;
//    PlotSelected.FPlotting.Plotting_Name := FPlotName;
//    PlotSelected.FPlotting.Force := frmSummaryResourceAllocation.force;
//    with fmPlottingTime do
//    begin
//      DecodeTime(dtpTimePlotting.Time, hh, nn, ss, ns);
//      TempDateTime := dtpDatePlotting.DateTime;
//      TempDateTime := RecodeTime(TempDateTime,hh,nn,ss, ns);
//      PlotSelected.FPlotting.Date := StrToDateTime(formatdatetime('dd/mm/yyyy hh:nn:ss',TempDateTime));
//    end;
//    PlotListMapping.Add(PlotSelected);
////    RefreshListPlotting;
//end;

procedure TfmPlottingResourceAllocationPickList.FormCreate(Sender: TObject);
begin
//  plottime := TResource_Allocation.Create;
//  PlotListInDB := TList.Create;
//  PlotListOK := TList.Create;
//  PlotListMapping := TList.Create;
end;

//procedure TfmPlottingResourceAllocationPickList.FormDestroy(Sender: TObject);
//begin
//  PlotListInDB.Free;
//  PlotListMapping.Free;
//  PlotListOK.Free;
//end;
//
//procedure TfmPlottingResourceAllocationPickList.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
//begin
//  if GetKeyState(VK_ESCAPE)< 0 then
//  begin
//    case Msg.CharCode of
//     VK_ESCAPE:
////     begin
////       btnOk.Click;
////     end;
//    end;
//  end;
//end;

procedure TfmPlottingResourceAllocationPickList.FormShow(Sender: TObject);
var
  I: Integer;
  plottemp : TResource_Allocation;
begin
//  dmTTT.GetAllPlotting_Definition(PlotListInDB);
//  if PlotListOK.Count <> -1 then
//  begin
//    PlotListMapping.Clear;
//    for I := 0 to PlotListOK.Count - 1 do
//    begin
//      plottemp := TResource_Allocation.Create;
//      plottemp.FPlotting.Plotting_Index := TResource_Allocation(PlotListOK[I]).FPlotting.Plotting_Index;
//      plottemp.FPlotting.Plotting_Name := TResource_Allocation(PlotListOK[I]).FPlotting.Plotting_Name;
//      plottemp.FPlotting.Date := TResource_Allocation(PlotListOK[I]).FPlotting.Date;
//      plottemp.FPlotting.Force := TResource_Allocation(PlotListOK[I]).FPlotting.Force;
//      PlotListMapping.Add(plottemp);
//    end;
//  end;
//  RefreshListPlotting;
end;

procedure TfmPlottingResourceAllocationPickList.lbAllPlottingAvailableClick(Sender: TObject);
begin
//  FPlotIndex := StrToInt(lbIdPlotting.Items[lbAllPlottingAvailable.ItemIndex]);
//  FPlotName := lbAllPlottingAvailable.Items[lbAllPlottingAvailable.ItemIndex];
end;

//procedure TfmPlottingResourceAllocationPickList.lbAllPlottingAvailableDblClick(Sender: TObject);
//begin
////  btnAdd.Click;
//end;

procedure TfmPlottingResourceAllocationPickList.lbAllPlottingOnScenarioClick(Sender: TObject);
var
  j : Integer;
begin
// if (lbPlottingSelect.ItemIndex <> -1) then
// begin
////   btnUsage.Enabled := True;
//   btnRemove.Enabled := True;
//   btnEdit.Enabled := True;
// end
// else
 begin
//   btnUsage.Enabled := False;
   btnRemove.Enabled := False;
   btnEdit.Enabled := False;
 end;
// FPlotSelect := StrToInt(lbtempIDSelectedPlotting.Items[lbPlottingSelect.ItemIndex]);
// for j := 0 to PlotListMapping.Count - 1 do
// begin
//   if (FPlotSelect = (TResource_Allocation(PlotListMapping[j]).FPlotting.Plotting_Index))
//    and (TResource_Allocation(PlotListMapping[j]).FPlotting.Force = frmSummaryResourceAllocation.force) then
//   begin
//     idselect := j;
//     idplotedit := TResource_Allocation(PlotListMapping[j]).FPlotting.Plotting_Index;
//   end;
// end;
end;

procedure TfmPlottingResourceAllocationPickList.UpdatePlottingList;
begin
//
end;

//procedure TfmPlottingResourceAllocationPickList.RefreshListPlotting;
//var
//  i, j, IdInDB, IdInScenario : Integer;
//  IdForce : Integer;
//  IsPrintInAvailable : Boolean;
//begin
//  lbAllPlottingAvailable.Items.Clear;
////  lbIdPlotting.Items.Clear;
//  lbAllPlottingOnScenario.Items.Clear;
////  lbtempIDSelectedPlotting.Items.Clear;
//
//  for I := 0 to PlotListInDB.Count - 1 do
//  begin
//    IdInDB := TRuntime_Plotting_Definition(PlotListInDB[I]).FData.Plotting_Index;
//    IsPrintInAvailable := True;
//
//    for j := 0 to PlotListMapping.Count - 1 do
//    begin
//      IdInScenario := TResource_Allocation(PlotListMapping[j]).FPlotting.Plotting_Index;
//      IdForce := TResource_Allocation(PlotListMapping[j]).FPlotting.Force;
//
//      if (IdInDB = IdInScenario)then
//      begin
//        if (frmSummaryResourceAllocation.force = IdForce) then
//        begin
//          lbAllPlottingOnScenario.Items.Add(TRuntime_Plotting_Definition(PlotListInDB[I]).FData.Plotting_Name);
////          lbtempIDSelectedPlotting.Items.Add(IntToStr(TRuntime_Plotting_Definition(PlotListInDB[I]).FData.Plotting_Index));
//        end;
//        IsPrintInAvailable := False;
//        Break;
//      end;
//    end;
//    if IsPrintInAvailable then
//    begin
//      lbAllPlottingAvailable.Items.Add(TRuntime_Plotting_Definition(PlotListInDB[I]).FData.Plotting_Name);
////      lbIdPlotting.Items.Add(IntToStr(TRuntime_Plotting_Definition(PlotListInDB[I]).FData.Plotting_Index))
//    end;
//  end;
//end;
end.
