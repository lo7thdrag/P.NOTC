unit ufmPlottingTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uDataModuleTTT, tttData, uDBAssetObject,
  uDBAsset_Plotting_Definition, DateUtils;

type
  TfmPlottingTime = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    dtpTimePlotting: TDateTimePicker;
    dtpDatePlotting: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fmPlottingTime: TfmPlottingTime;

implementation
uses
  ufrmPlottingResourceAllocationPickList, ufrmSummaryResourceAllocation, ufrmAdminMainForm;
{$R *.dfm}

procedure TfmPlottingTime.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPlottingTime.btnOkClick(Sender: TObject);
var
  plot : TResource_Allocation;
  fdate : TDateTime;
begin
  plot := TResource_Allocation.Create;
  with fmPlottingResourceAllocationPickList do
//  begin
//    if isnew then
//    begin
//       fmPlottingResourceAllocationPickList.FillListPlot;
//    end;
//    if isnew = false then
//    begin
//      plot.FPlotting.Plotting_Index := TResource_Allocation(PlotListMapping[idselect]).FPlotting.Plotting_Index;
//      plot.FPlotting.Plotting_Name:= TResource_Allocation(PlotListMapping[idselect]).FPlotting.Plotting_Name;
//      DecodeTime(dtpTimePlotting.Time, hh, nn, ss, ns);
//      fdate := RecodeTime(dtpDatePlotting.DateTime, hh, nn, ss, ns);
//      plot.FPlotting.Date := StrToDateTime(formatdatetime('dd/mm/yyyy hh:nn:ss', fdate));
//      plot.FPlotting.Force := TResource_Allocation(PlotListMapping[idselect]).FPlotting.Force;
//      PlotListMapping.Delete(idselect);
//      PlotListMapping.Add(plot);
//    end;
//  end;
  Close;
end;

procedure TfmPlottingTime.FormShow(Sender: TObject);
begin
  dtpDatePlotting.Date := frmAdminMainForm.dtpDate.Date;
  dtpTimePlotting.Time := frmAdminMainForm.dtpTime.Time;
end;

end.
