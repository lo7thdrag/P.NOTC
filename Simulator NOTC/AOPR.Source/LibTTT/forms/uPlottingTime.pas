unit uPlottingTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uDataModuleTTT, tttData, uDBAssetObject,
   DateUtils, uSimMgr_Client;

type
  TfmPlottingTime = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    dtpTimePlotting: TDateTimePicker;
    dtpDatePlotting: TDateTimePicker;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
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
  uSaveAsPlotting;

{$R *.dfm}

procedure TfmPlottingTime.btnCancelClick(Sender: TObject);
begin
  ShowMessage('Saving process has been aborted by user');
  Close;
end;

procedure TfmPlottingTime.btnOkClick(Sender: TObject);
var
  I: integer;
  plot : TResource_Allocation;
  hh, nn, ss, ns : Word;
  fdate : TDateTime;
  group : Integer;
  SaveAvailable : Boolean;
begin

  with fmSaveAsPlot do
  begin
    aIndex := dmTTT.InsertPlotting_Definition(aData);
    for i := 0 to rgForce.Items.Count - 1 do
    begin
      SaveAvailable := False;
      if rgForce.ItemIndex <> -1 then
      begin
        case rgForce.ItemIndex of
          0 : group:= 3;
          1 : group:= 1;
          2 : group:= 2;
          3 : group:= 4;
          4 : group:= 5;
        end;
        SaveAvailable := True;
      end;
    end;
    if SaveAvailable then
    begin
      plot := TResource_Allocation.Create;
      plot.FPlotting.Resource_Alloc_Index := simMgrClient.Scenario.ResourceAllocation.FData.Resource_Alloc_Index;
      plot.FPlotting.Plotting_Index := aIndex;
      plot.FPlotting.Plotting_Name := aName;
      DecodeTime(dtpTimePlotting.Time, hh, nn, ss, ns);
      fdate := RecodeTime(dtpDatePlotting.DateTime, hh, nn, ss, ns);
      plot.FPlotting.Date := StrToDateTime(formatdatetime('dd/mm/yyyy hh:nn:ss', fdate));
      plot.FPlotting.Force := group;
      dmTTT.InsertPlottingMapping(plot);
    end;
  end;
  ShowMessage('Data saved');
  Close;
end;

procedure TfmPlottingTime.FormShow(Sender: TObject);
begin
  dtpDatePlotting.Date :=  simMgrClient.GameTIME;
  dtpDatePlotting.Format := 'dd-MM-yyyy';
  dtpTimePlotting.Time :=  simMgrClient.GameTIME;
  dtpTimePlotting.Format := 'HH:mm:ss';
end;

end.
