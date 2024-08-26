unit uGameReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDataModuleTTT, tttData, uDBAsset_GameReport,
  ComCtrls, Buttons;

type
  TfrmGameReport = class(TForm)
    bvl1: TBevel;
    lbl1: TLabel;
    lbl2: TLabel;
    pnl1: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    rg1: TRadioGroup;
    mmoDesc: TMemo;
    lblGame_Name: TLabel;
    lblScenario: TLabel;
    lblDate: TLabel;
    lblTime_Start: TLabel;
    lblTime_End: TLabel;
    lbl8: TLabel;
    lblSubject: TLabel;
    lvGameReport: TListView;
    btnDelete: TSpeedButton;
    btnClear: TSpeedButton;
    btnClose: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnHandler(Sender: TObject);
    procedure lvGameReportSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    ReportList : tlist;
    id : Integer;
    IsShowBtn : Boolean;
  public
    { Public declarations }
    procedure Refres;
    procedure ClearAll;

  end;

var
  frmGameReport: TfrmGameReport;

implementation

{$R *.dfm}
procedure TfrmGameReport.BtnHandler(Sender: TObject);
var
  Rec : TRuntime_Game_Report;
begin
  case TButton(Sender).tag of
  0:
  begin
    dmTTT.DeleteByID_GameReport(IntToStr(id));
    id := 0;
    Refres;
    ClearAll;
  end;
  1:
  begin
    dmTTT.DeleteAll_GameReport(rec);
    id := 0;
    Refres;
    ClearAll;
  end;
  2:
  begin
    Close;
  end;
  end;
end;

procedure TfrmGameReport.ClearAll;
begin
  lblGame_Name.Caption  := '-------------------------------';
  lblScenario.Caption   := '-------------------------------';
  lblDate.Caption       := '-------------------------------';
  lblTime_Start.Caption := '-------------------------------';
  lblTime_End.Caption   := '-------------------------------';
  lblSubject.Caption    := '-------------------------------';
  mmoDesc.Text          := '-';
end;

procedure TfrmGameReport.FormCreate(Sender: TObject);
begin
  ReportList := TList.Create;
end;

procedure TfrmGameReport.FormDestroy(Sender: TObject);
begin
  ReportList.Free;
end;

procedure TfrmGameReport.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (HiWord(Msg.KeyData) and KF_ALTDOWN <> 0) and  (Msg.CharCode = Ord('D')) then
  begin
    Handled := not Handled;
    btnDelete.Visible := not btnDelete.Visible;
    btnClear.Visible := not btnClear.Visible;
  end;
  if btnDelete.Visible then
    btnClose.Left := 518
  else
    btnClose.Left := 439;
end;

procedure TfrmGameReport.FormShow(Sender: TObject);
begin
  id := 0;
  mmoDesc.Text := '';
  Refres;
  btnClose.Left := 439;
end;

procedure TfrmGameReport.lvGameReportSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Selected then
  begin
    id := StrToInt(Item.Caption);
    Refres;
  end;
end;

procedure TfrmGameReport.Refres;
var
  fRec : TRuntime_Game_Report;
  I, j: Integer;
begin
  if id = 0 then
  begin
    dmTTT.GetAllGameReport(ReportList, frec);
    lvGameReport.Clear;
    for I := 0 to ReportList.Count - 1 do
    begin
      with lvGameReport.Items.Add do
      begin
        Caption := IntToStr(TRuntime_Game_Report(ReportList[I]).FData.Id_Game);
        SubItems.Add(TRuntime_Game_Report(ReportList[I]).FData.Game_Name);
        SubItems.Add(TRuntime_Game_Report(ReportList[I]).FData.Subject);
      end;
    end;
  end
  else
  begin
    for j := 0 to ReportList.Count - 1 do
    begin
      if TRuntime_Game_Report(ReportList[j]).FData.Id_Game = id then
      begin
        lblGame_Name.Caption := TRuntime_Game_Report(ReportList[j]).FData.Game_Name;
        lblScenario.Caption := TRuntime_Game_Report(ReportList[j]).FData.Scenario_Name;
        lblDate.Caption := (formatdatetime('dd/mm/yyyy', TRuntime_Game_Report(ReportList[j]).FData.Start_Time));
        lblTime_Start.Caption := (formatdatetime('hh:nn:ss', TRuntime_Game_Report(ReportList[j]).FData.Start_Time));
        lblTime_End.Caption := (formatdatetime('hh:nn:ss', TRuntime_Game_Report(ReportList[j]).FData.End_Time));
        lblSubject.Caption := TRuntime_Game_Report(ReportList[j]).FData.Subject;
        mmoDesc.Text := TRuntime_Game_Report(ReportList[j]).FData.Description;
      end;
    end;
  end;
  if ReportList.Count = 0 then
  begin
    btnDelete.Enabled := False;
    btnClear.Enabled := False;
    ClearAll;
  end
  else
  begin
    btnDelete.Enabled := true;
    btnClear.Enabled := true;
  end;

end;

end.
