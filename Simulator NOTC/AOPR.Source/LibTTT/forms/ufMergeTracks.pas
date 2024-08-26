unit ufMergeTracks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, Buttons, ExtCtrls, uT3DetectedTrack, uSimObjects,
  System.ImageList;

type
  TfrmMergeTracks = class(TForm)
    Label1: TLabel;
    lbMergeTracks: TLabel;
    Label3: TLabel;
    edtWithTrack: TEdit;
    btHit: TButton;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    BtnOkMerge: TBitBtn;
    btCancel: TBitBtn;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure BtnOkMergeClick(Sender: TObject);
    procedure btHitClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    FControlledTrack : TSimObject;
    FFocusedTrack    : TSimObject;
  public
    Data : TObject;
    procedure SetControlledTrack(const value : TSimObject);
    procedure SetFocusedTrack(const value : TSimObject);
  published
    property ControlledTrack : TSimObject read FControlledTrack write SetControlledTrack;
    property FocusedTrack : TSimObject read FFocusedTrack write SetFocusedTrack;
  end;
  //form tambahan tini
var
  frmMergeTracks: TfrmMergeTracks;

implementation

uses uT3Unit, uMapXHandler, ufTacticalDisplay, uBaseCoordSystem, uGameData_TTT,
  uSimMgr_Client;

{$R *.dfm}

procedure TfrmMergeTracks.FormCreate(Sender: TObject);
begin
  Data := TObject.Create;
end;

procedure TfrmMergeTracks.FormShow(Sender: TObject);
begin
  if ControlledTrack is TT3ESMTrack then
    lbMergeTracks.Caption := TT3ESMTrack(ControlledTrack).TrackNumber
  else if ControlledTrack is TT3DetectedTrack then
    lbMergeTracks.Caption := IntToStr(TT3DetectedTrack(ControlledTrack).TrackNumber);

  edtWithTrack.Text := '';
end;
procedure TfrmMergeTracks.BtnOkMergeClick(Sender: TObject);
var
  rec : TRecCmd_MergeTrack;
begin
  if (not Assigned(ControlledTrack)) or (not Assigned(FocusedTrack)) then
    Exit;

  if (ControlledTrack is TT3ESMTrack) then
  begin
    if FocusedTrack is TT3DetectedTrack then
    begin
      if not (TT3DetectedTrack(FocusedTrack).TrackDomain = TT3ESMTrack(ControlledTrack).TrackDomain) then
      begin
        ShowMessage('Domain of Both Track must be identical');
        Exit;
      end;

      rec.EsmTrackNumber := StrToInt(TT3ESMTrack(ControlledTrack).TrackNumber);
      rec.DetectedTrackNumber := TT3DetectedTrack(FocusedTrack).TrackObject.InstanceIndex;
      rec.OrderMerge  := true;

      simMgrClient.netSend_Cmd_MergeTrack(rec);
    end;
  end
  else if ControlledTrack is TT3DetectedTrack then
  begin
    if FocusedTrack is TT3ESMTrack then
    begin
      if not (TT3DetectedTrack(ControlledTrack).TrackDomain = TT3ESMTrack(FocusedTrack).TrackDomain) then
      begin
        ShowMessage('Domain of Both Track must be identical');
        Exit;
      end;

      rec.EsmTrackNumber := StrToInt(TT3ESMTrack(FocusedTrack).TrackNumber);
      rec.DetectedTrackNumber := TT3DetectedTrack(ControlledTrack).TrackObject.InstanceIndex;
      rec.OrderMerge  := true;

      simMgrClient.netSend_Cmd_MergeTrack(rec);
    end;
  end;

  Close;
end;

procedure TfrmMergeTracks.Button2Click(Sender: TObject);
begin
  frmTacticalDisplay.btnHookPreviousClick(Sender);
  btHitClick(Sender);
end;

procedure TfrmMergeTracks.Button3Click(Sender: TObject);
begin
  frmTacticalDisplay.btnHookNextClick(Sender);
  btHitClick(Sender);
end;

procedure TfrmMergeTracks.btHitClick(Sender: TObject);
begin
  FocusedTrack := frmTacticalDisplay.focusedTrack;

  if ControlledTrack is TT3DetectedTrack then
  begin
    if FocusedTrack is TT3ESMTrack then
    begin
      edtWithTrack.Text := TT3ESMTrack(FocusedTrack).TrackNumber;
    end;
  end
  else if ControlledTrack is TT3ESMTrack then
  begin
    if FocusedTrack is TT3DetectedTrack then
    begin
      edtWithTrack.Text := FormatTrackNumber(TT3DetectedTrack(FocusedTrack).TrackNumber);
    end
  end
  else
  begin
    ShowMessage('Target track not suitable');
  end;
end;

procedure TfrmMergeTracks.btCancelClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMergeTracks.SetControlledTrack(const value: TSimObject);
begin
  FControlledTrack := value;
end;

procedure TfrmMergeTracks.SetFocusedTrack(const value: TSimObject);
begin
  FFocusedTrack := value;
end;

end.
