unit ufrmSummaryWaypoint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, ComCtrls, tttData, uDBAssetObject,
  Vcl.Imaging.pngimage;

type
  TfrmSummaryWaypoint = class(TForm)
    ImgBackgroundForm: TImage;
    ImgHeader: TImage;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    pnl1Title: TPanel;
    txtClass: TLabel;
    edtName: TEdit;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;
    btnEditWaypoint: TButton;
    Label1: TLabel;

    procedure edtChange(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure btnApplyClick(Sender: TObject);
    procedure btnEditWaypointClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);

  private
    FSelectedWaypoint : TWaypoint_Def;

    recWpData: TWaypoint_Data;
    FTerminationIndex : Integer;

    function CekInput: Boolean;
    procedure UpdateWaypointData;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedWaypoint : TWaypoint_Def read FSelectedWaypoint write FSelectedWaypoint;
//    property TerminationIndex : Integer read FTerminationIndex write FTerminationIndex;
  end;

var
  frmSummaryWaypoint: TfrmSummaryWaypoint;

implementation

uses ufrmAdminMainForm, uWaypointWindow,uBaseCoordSystem, uDataModuleTTT, ufrmWaypointEditor;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSummaryWaypoint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := cafree;
end;

procedure TfrmSummaryWaypoint.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateWaypointData;

  with FSelectedWaypoint.FData do
    btnApply.Enabled := Waypoint_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}
procedure TfrmSummaryWaypoint.btnApplyClick(Sender: TObject);
begin
  with FSelectedWaypoint do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    {$REGION ' General '}
    FData.Waypoint_Name := edtName.Text;
//    FData.Termination := FTerminationIndex;
    FData.Waypoint_Centre_Lat := -0.328853651464508;
    FData.Waypoint_Centre_Long := 116.357322793642;
    FData.Dimension := 500000;

    LastName := edtName.Text;
    {$ENDREGION}

    if FData.Waypoint_Index = 0 then
    begin
      if dmTTT.InsertWaypointDef(FData) then
      begin
        ShowMessage('Data has been saved');
      end;
    end
    else
    begin
      if dmTTT.UpdateWaypointDef(FData) then
      begin
        ShowMessage('Data has been updated');
      end;
    end;

    btnEditWaypoint.Enabled := FData.Waypoint_Index <> 0;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryWaypoint.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

procedure TfrmSummaryWaypoint.btnEditWaypointClick(Sender: TObject);
begin
  with frmWaypointEditor do
  begin
    SelectedWaypoint := FSelectedWaypoint;
    ShowModal;
  end;

  AfterClose := frmWaypointEditor.AfterClose;

  btnCancel.Enabled := not AfterClose;
  btnApply.Enabled := true;
end;

procedure TfrmSummaryWaypoint.btnOKClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

function TfrmSummaryWaypoint.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if edtName.Text = '' then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;
    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
        numSpace := numSpace + 1;
    end;
    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetWaypointDef(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedWaypoint.FData.Waypoint_Index = 0 then
    begin
      ShowMessage('Please use another waypoint name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another waypoint name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSummaryWaypoint.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TfrmSummaryWaypoint.UpdateWaypointData;
begin
  with FSelectedWaypoint.FData do
  begin
    if Waypoint_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Waypoint_Name;

    LastName := edtName.Text;
    FTerminationIndex := Termination;

    btnEditWaypoint.Enabled := Waypoint_Index <> 0;
  end;
end;
{$ENDREGION}

end.
