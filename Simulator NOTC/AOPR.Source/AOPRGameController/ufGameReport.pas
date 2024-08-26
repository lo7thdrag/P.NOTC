unit ufGameReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDMGC, tttData, ExtCtrls;

type
  TfrmGameReportEditor = class(TForm)
    btnSave: TButton;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lblScenario: TLabel;
    lblDate: TLabel;
    lblStartTime: TLabel;
    lblEndTime: TLabel;
    lbl6: TLabel;
    lblGameName: TLabel;
    lbl8: TLabel;
    edtSubject: TEdit;
    lbl7: TLabel;
    grp1: TGroupBox;
    mmoDescription: TMemo;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtSubjectKeyPress(Sender: TObject; var Key: Char);
    procedure btnSaveClick(Sender: TObject);
  private
    FList : TList;
    { Private declarations }

  public
    procedure Save;
    { Public declarations }
  end;

var
  frmGameReportEditor: TfrmGameReportEditor;

implementation
uses
  ufStartExerciseWizard;

{$R *.dfm}

procedure TfrmGameReportEditor.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGameReportEditor.btnSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TfrmGameReportEditor.edtSubjectKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Save;
  end;
end;

procedure TfrmGameReportEditor.FormCreate(Sender: TObject);
begin
  FList := TList.Create;
end;

procedure TfrmGameReportEditor.FormDestroy(Sender: TObject);
begin
  FList.Free;
end;

procedure TfrmGameReportEditor.FormShow(Sender: TObject);
var
  aRec : TGameReport;
  I : Integer;
  aDate : TDateTime;
begin
  aDate := Now;
  edtSubject.Text := 'Latih';
  dmGC.SelectGameReport(1, FList);
  if FList.Count > 0 then
  begin
    for I := 0 to FList.Count - 1 do
    begin
      aRec := Flist.Items[I];
      lblScenario.Caption := aRec.Fdata.Scenario_Name;
      lblGameName.Caption := aRec.Fdata.Game_Name;
      lblDate.Caption := (formatdatetime('dd/mm/yyyy', aRec.Fdata.Start_Time));
      lblStartTime.Caption := (formatdatetime('hh:nn:ss', aRec.Fdata.Start_Time));
      lblEndTime.Caption := (formatdatetime('hh:nn:ss', aDate));
      mmoDescription.Text := aRec.Fdata.Description;
    end;
  end;
end;

procedure TfrmGameReportEditor.Save;
var
  recGR : TRecGameReport;
begin
  if edtSubject.Text = '' then
  begin
    ShowMessage('Subject must be filled');
    Exit;
  end;

  recGR.Description := mmoDescription.Text;
  recGR.End_Time := Now;
  recGR.Subject := edtSubject.Text;
  recGR.Status := 0;
  dmGC.UpdateGameReport(1,recGR);
  ShowMessage('Description is saved');
  Close;
end;

end.
