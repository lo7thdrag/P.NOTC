unit uTrackHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, uSimObjects, uT3Unit, tttData, uT3DetectedTrack,
  Vcl.ExtCtrls;

type
  TfTrackHistory = class(TForm)
    btShowALll: TButton;
    btHideAll: TButton;
    btClearSelected: TButton;
    btClearAll: TButton;
    btClose: TButton;
    btClearAllAir: TButton;
    btClearSelectedAir: TButton;
    btHideAllAir: TButton;
    btShowAll: TButton;
    btClearAllSurface: TButton;
    btClearSelectedSurface: TButton;
    btHideALlSurface: TButton;
    btShowALlSurface: TButton;
    btClearAllSubsurface: TButton;
    btClearSelectedSubsurface: TButton;
    btHideAllSubsurface: TButton;
    btShowAllSubsurface: TButton;
    btClearAllLand: TButton;
    btClearSelectedLand: TButton;
    btHideAllLand: TButton;
    btShowAllLand: TButton;
    btClearAllGeneral: TButton;
    btClearSelectedGeneral: TButton;
    btHideAllGeneral: TButton;
    btShowAllGeneral: TButton;
    lvAll: TListView;
    chk1: TCheckBox;
    lvAir: TListView;
    lvSurface: TListView;
    lvSubsurface: TListView;
    lvLand: TListView;
    lvGeneral: TListView;
    pnlPageControlPictureFilter: TPanel;
    pnlTabPictureFilter: TPanel;
    pnlTabAll: TPanel;
    pnlTabAir: TPanel;
    pnlTabSurface: TPanel;
    pnlTabSubsurface: TPanel;
    pnlTabLand: TPanel;
    pnlTabGeneral: TPanel;
    pnlContentPicutreFilter: TPanel;
    pnlContentAir: TPanel;
    pnlContentSurface: TPanel;
    pnlContentGeneral: TPanel;
    pnlContentLand: TPanel;
    pnlContentSubsurface: TPanel;
    pnlContentAll: TPanel;
    procedure btCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btShowAllClick(Sender: TObject);
    procedure btHideAllClick(Sender: TObject);
    procedure lvAllItemChecked(Sender: TObject; Item: TListItem);
    procedure btClearSelectedClick(Sender: TObject);
    procedure btClearAllClick(Sender: TObject);
//    procedure PageControl1Change(Sender: TObject);
    procedure TabTrackHistoryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure showAll(ListView: TListView);
    procedure hideAll(ListView: TListView);
    procedure clearSelect(ListView: TListView);
    procedure clearAll(ListView: TListView);
  end;

var
  fTrackHistory: TfTrackHistory;

implementation

uses
  uSimMgr_Client, uT3Vehicle, ufTacticalDisplay;

{$R *.dfm}

procedure TfTrackHistory.btClearAllClick(Sender: TObject);
begin
  if pnlTabAll.Visible then clearAll(lvAll)
  else if pnlTabAir.Visible then clearAll(lvAir)
  else if pnlTabSurface.Visible then clearAll(lvSurface)
  else if pnlTabSubsurface.Visible then clearAll(lvSubsurface)
  else if pnlTabLand.Visible then clearAll(lvLand)
  else if pnlTabGeneral.Visible then clearAll(lvGeneral);
end;

procedure TfTrackHistory.clearAll(ListView: TListView);
var
  v : TObject;
  I: Integer;
begin
  if not Assigned(ListView) then
    Exit;
  for I := 0 to ListView.Items.Count - 1 do
  begin
    v := ListView.Items.Item[I].Data;
    if v is TT3Vehicle then
      TT3Vehicle(v).VHistory.ClearHistory
    else
    if v is TT3DetectedTrack then
      TT3DetectedTrack(v).VHistory.ClearHistory;
  end;
end;

procedure TfTrackHistory.btClearSelectedClick(Sender: TObject);
begin
  if pnlTabAll.Visible then clearSelect(lvAll)
  else if pnlTabAir.Visible then clearSelect(lvAir)
  else if pnlTabSurface.Visible then clearSelect(lvSurface)
  else if pnlTabSubsurface.Visible then clearSelect(lvSubsurface)
  else if pnlTabLand.Visible then clearSelect(lvLand)
  else if pnlTabGeneral.Visible then clearSelect(lvGeneral);
end;

procedure TfTrackHistory.clearSelect(ListView: TListView);
var
  v : TObject;
begin
  if not Assigned(ListView) then
    Exit;
  v := ListView.Selected.Data;
  if v is TT3Vehicle then
    TT3Vehicle(v).VHistory.ClearHistory
  else
  if v is TT3DetectedTrack then
    TT3DetectedTrack(v).VHistory.ClearHistory
end;

procedure TfTrackHistory.btCloseClick(Sender: TObject);
begin
  close;
end;

procedure TfTrackHistory.btHideAllClick(Sender: TObject);
begin
  if pnlTabAll.Visible then hideAll(lvAll)
  else if pnlTabAir.Visible then hideAll(lvAir)
  else if pnlTabSurface.Visible then hideAll(lvSurface)
  else if pnlTabSubsurface.Visible then hideAll(lvSubsurface)
  else if pnlTabLand.Visible then hideAll(lvLand)
  else if pnlTabGeneral.Visible then hideAll(lvGeneral);
end;

procedure TfTrackHistory.btShowAllClick(Sender: TObject);
begin
  if pnlTabAll.Visible then showAll(lvAll)
  else if pnlTabAir.Visible then showAll(lvAir)
  else if pnlTabSurface.Visible then showAll(lvSurface)
  else if pnlTabSubsurface.Visible then showAll(lvSubsurface)
  else if pnlTabLand.Visible then showAll(lvLand)
  else if pnlTabGeneral.Visible then showAll(lvGeneral);
end;

procedure TfTrackHistory.showAll(ListView: TListView);
var I: Integer;
begin
  for I := 0 to ListView.Items.Count - 1 do
    ListView.Items.Item[I].Checked  := true;
end;

procedure TfTrackHistory.hideAll(ListView: TListView);
var I: Integer;
begin
  for I := 0 to ListView.Items.Count - 1 do
    ListView.Items.Item[I].Checked  := false;
end;

procedure TfTrackHistory.lvAllItemChecked(Sender: TObject; Item: TListItem);
var
  v : TObject;
begin
  if not Assigned(item) then
    Exit;

  if not Assigned(item.Data) then
    Exit;

  v := item.Data;
  if (v is TT3Vehicle) then
  begin
    if item.Checked then
      TT3Vehicle(v).ShowTrails := true
    else TT3Vehicle(v).ShowTrails := false;
  end else
  if (v is TT3DetectedTrack) then
  begin
    if item.Checked then
      TT3DetectedTrack(v).ShowTrails := true
    else TT3DetectedTrack(v).ShowTrails := false;
  end;

  frmTacticalDisplay.SetSelectedTrack(TT3Unit(v));
end;

//procedure TfTrackHistory.PageControl1Change(Sender: TObject);
//var
//  i: Integer;
//  aObject: TSimObject;
//  LIAll,LIAir,LISurface,LISub,LILand,LIGen: TListItem;
//begin
//  if simMgrClient.ISInstructor or simMgrClient.ISWasdal then begin
//
//    case PageControl1.TabIndex of
//      0:
//        begin
//          lvAll.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            LIAll := lvAll.Items.Add;
//            LIAll.Caption := TT3PlatformInstance(aObject).Track_ID;
//            LIAll.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//            LIAll.Data := aObject;
//            if TT3Vehicle(aObject).ShowTrails then LIAll.Checked := true;
//          end;
//        end;
//      1:
//        begin
//          lvAir.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).PlatformDomain = vhdAir then
//            begin
//              LIAir := lvAir.Items.Add;
//              LIAir.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LIAir.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LIAir.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LIAir.Checked := true;
//            end;
//          end;
//        end;
//      2:
//        begin
//          lvSurface.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).PlatformDomain = vhdSurface then
//            begin
//              LISurface := lvSurface.Items.Add;
//              LISurface.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LISurface.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LISurface.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LISurface.Checked := true;
//            end;
//          end;
//        end;
//      3:
//        begin
//          lvSubsurface.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface then
//            begin
//              LISub := lvSubsurface.Items.Add;
//              LISub.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LISub.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LISub.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LISub.Checked := true;
//            end;
//          end;
//        end;
//      4:
//        begin
//          lvLand.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).PlatformDomain = vhdLand then
//            begin
//              LILand := lvLand.Items.Add;
//              LILand.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LILand.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LILand.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LILand.Checked := true;
//            end;
//          end;
//        end;
//      5:
//        begin
//          lvGeneral.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).PlatformDomain = vhdGeneral then
//            begin
//              LIGen := lvGeneral.Items.Add;
//              LIGen.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LIGen.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LIGen.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LIGen.Checked := true;
//            end;
//          end;
//        end;
//    end;
//  end else
//  begin
//    case PageControl1.TabIndex of
//      0 :
//        begin
//          lvAll.Items.Clear;
//
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).UnitGroup then begin
//              LIAll := lvAll.Items.Add;
//              LIAll.Caption := TT3PlatformInstance(aObject).Track_ID;
//              LIAll.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//              LIAll.Data := aObject;
//              if TT3Vehicle(aObject).ShowTrails then LIAll.Checked := true;
//            end;
//          end;
//
//          for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
//          begin
//            aObject := simMgrClient.SimDetectedTrackList.getObject(i);
//            if not Assigned(aObject) then continue;
//
//            if aObject is TT3DetectedTrack then begin
//              LIAll := lvAll.Items.Add;
//              LIAll.Caption := TT3DetectedTrack(aObject).TrackID;
//              LIAll.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
//              LIAll.Data := aObject;
//              if TT3DetectedTrack(aObject).ShowTrails then LIAll.Checked := true;
//            end;
//          end;
//        end;
//      1 :
//        begin
//          lvAir.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).UnitGroup then begin
//              if TT3PlatformInstance(aObject).PlatformDomain = vhdAir then
//              begin
//                LIAir := lvAir.Items.Add;
//                LIAir.Caption := TT3PlatformInstance(aObject).Track_ID;
//                LIAir.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//                LIAir.Data := aObject;
//                if TT3Vehicle(aObject).ShowTrails then LIAir.Checked := true;
//              end;
//            end;
//          end;
//          for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
//          begin
//            aObject := simMgrClient.SimDetectedTrackList.getObject(i);
//            if not Assigned(aObject) then continue;
//
//            if aObject is TT3DetectedTrack then begin
//              if TT3DetectedTrack(aObject).TrackDomain = vhdAir then begin
//                LIAir := lvAir.Items.Add;
//                LIAir.Caption := TT3DetectedTrack(aObject).TrackID;
//                LIAir.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
//                LIAir.Data := aObject;
//                if TT3DetectedTrack(aObject).ShowTrails then LIAir.Checked := true;
//              end;
//            end;
//          end;
//        end;
//      2 :
//        begin
//          lvSurface.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).UnitGroup then begin
//              if TT3PlatformInstance(aObject).PlatformDomain = vhdSurface then
//              begin
//                LISurface := lvSurface.Items.Add;
//                LISurface.Caption := TT3PlatformInstance(aObject).Track_ID;
//                LISurface.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//                LISurface.Data := aObject;
//                if TT3Vehicle(aObject).ShowTrails then LISurface.Checked := true;
//              end;
//            end;
//          end;
//          for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
//          begin
//            aObject := simMgrClient.SimDetectedTrackList.getObject(i);
//            if not Assigned(aObject) then continue;
//            if aObject is TT3DetectedTrack then begin
//              if TT3DetectedTrack(aObject).TrackDomain = vhdSurface then begin
//                LISurface := lvSurface.Items.Add;
//                LISurface.Caption := TT3DetectedTrack(aObject).TrackID;
//                LISurface.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
//                LISurface.Data := aObject;
//                if TT3DetectedTrack(aObject).ShowTrails then LISurface.Checked := true;
//              end;
//            end;
//          end;
//        end;
//      3 :
//        begin
//          lvSubsurface.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).UnitGroup then begin
//              if TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface then
//              begin
//                LISub := lvSubsurface.Items.Add;
//                LISub.Caption := TT3PlatformInstance(aObject).Track_ID;
//                LISub.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//                LISub.Data := aObject;
//                if TT3Vehicle(aObject).ShowTrails then LISub.Checked := true;
//              end;
//            end;
//          end;
//          for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
//          begin
//            aObject := simMgrClient.SimDetectedTrackList.getObject(i);
//            if not Assigned(aObject) then continue;
//            if aObject is TT3DetectedTrack then begin
//              if TT3DetectedTrack(aObject).TrackDomain = vhdSubsurface then begin
//                LISub := lvSubsurface.Items.Add;
//                LISub.Caption := TT3DetectedTrack(aObject).TrackID;
//                LISub.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
//                LISub.Data := aObject;
//                if TT3DetectedTrack(aObject).ShowTrails then LISub.Checked := true;
//              end;
//            end;
//          end;
//
//        end;
//      4 :
//        begin
//          lvGeneral.Items.Clear;
//          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
//          begin
//            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
//            if not Assigned(aObject) then continue;
//            if TT3PlatformInstance(aObject).UnitGroup then begin
//              if TT3PlatformInstance(aObject).PlatformDomain = vhdGeneral then
//              begin
//                LIGen := lvGeneral.Items.Add;
//                LIGen.Caption := TT3PlatformInstance(aObject).Track_ID;
//                LIGen.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
//                LIGen.Data := aObject;
//                if TT3Vehicle(aObject).ShowTrails then LIGen.Checked := true;
//              end;
//            end;
//          end;
//          for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
//          begin
//            aObject := simMgrClient.SimDetectedTrackList.getObject(i);
//            if not Assigned(aObject) then continue;
//            if aObject is TT3DetectedTrack then begin
//              if TT3DetectedTrack(aObject).TrackDomain = vhdGeneral then begin
//                LIGen := lvSubsurface.Items.Add;
//                LIGen.Caption := TT3DetectedTrack(aObject).TrackID;
//                LIGen.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
//                LIGen.Data := aObject;
//                if TT3DetectedTrack(aObject).ShowTrails then LIGen.Checked := true;
//              end;
//            end;
//          end;
//        end;
//    end;
//  end;
//end;

procedure TfTrackHistory.FormShow(Sender: TObject);
begin
//  PageControl1Change(Sender);
end;

procedure TfTrackHistory.TabTrackHistoryClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
  i: Integer;
  aObject: TSimObject;
  LIAll,LIAir,LISurface,LISub,LILand,LIGen: TListItem;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;

  if panel = pnlTabAll then
  begin
    if PanelTag = 0 then
    begin
      pnlTabAll.Color := RGB(44, 127, 161);
      pnlContentAll.BringToFront;
      pnlTabAll.Tag := 1;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        lvAll.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          LIAll := lvAll.Items.Add;
          LIAll.Caption := TT3PlatformInstance(aObject).Track_ID;
          LIAll.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
          LIAll.Data := aObject;
          if TT3Vehicle(aObject).ShowTrails then LIAll.Checked := true;
        end;
      end

      else
      begin
        lvAll.Items.Clear;

        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).UnitGroup then begin
            LIAll := lvAll.Items.Add;
            LIAll.Caption := TT3PlatformInstance(aObject).Track_ID;
            LIAll.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
            LIAll.Data := aObject;
            if TT3Vehicle(aObject).ShowTrails then LIAll.Checked := true;
          end;
        end;

        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
        begin
          aObject := simMgrClient.SimDetectedTrackList.getObject(i);
          if not Assigned(aObject) then continue;

          if aObject is TT3DetectedTrack then begin
            LIAll := lvAll.Items.Add;
            LIAll.Caption := TT3DetectedTrack(aObject).TrackID;
            LIAll.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
            LIAll.Data := aObject;
            if TT3DetectedTrack(aObject).ShowTrails then LIAll.Checked := true;
          end;
        end;
      end;
    end;
  end

  else if panel = pnlTabAir then
  begin
    if PanelTag = 0 then
    begin
      pnlTabAir.Color := RGB(44, 127, 161);
      pnlContentAir.BringToFront;
      pnlTabAir.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        lvAir.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).PlatformDomain = vhdAir then
          begin
            LIAir := lvAir.Items.Add;
            LIAir.Caption := TT3PlatformInstance(aObject).Track_ID;
            LIAir.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
            LIAir.Data := aObject;
            if TT3Vehicle(aObject).ShowTrails then LIAir.Checked := true;
          end;
        end;
      end

      else
      begin
        lvAir.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).UnitGroup then begin
            if TT3PlatformInstance(aObject).PlatformDomain = vhdAir then
            begin
              LIAir := lvAir.Items.Add;
              LIAir.Caption := TT3PlatformInstance(aObject).Track_ID;
              LIAir.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
              LIAir.Data := aObject;
              if TT3Vehicle(aObject).ShowTrails then LIAir.Checked := true;
            end;
          end;
        end;

        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
        begin
          aObject := simMgrClient.SimDetectedTrackList.getObject(i);
          if not Assigned(aObject) then continue;

          if aObject is TT3DetectedTrack then begin
            if TT3DetectedTrack(aObject).TrackDomain = vhdAir then begin
              LIAir := lvAir.Items.Add;
              LIAir.Caption := TT3DetectedTrack(aObject).TrackID;
              LIAir.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
              LIAir.Data := aObject;
              if TT3DetectedTrack(aObject).ShowTrails then LIAir.Checked := true;
            end;
          end;
        end;
      end;
    end;
  end

  else if panel = pnlTabSurface then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSurface.Color := RGB(44, 127, 161);
      pnlContentSurface.BringToFront;
      pnlTabSurface.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        lvSurface.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).PlatformDomain = vhdSurface then
          begin
            LISurface := lvSurface.Items.Add;
            LISurface.Caption := TT3PlatformInstance(aObject).Track_ID;
            LISurface.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
            LISurface.Data := aObject;
            if TT3Vehicle(aObject).ShowTrails then LISurface.Checked := true;
          end;
        end;
      end

      else
      begin
        lvSurface.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).UnitGroup then begin
            if TT3PlatformInstance(aObject).PlatformDomain = vhdSurface then
            begin
              LISurface := lvSurface.Items.Add;
              LISurface.Caption := TT3PlatformInstance(aObject).Track_ID;
              LISurface.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
              LISurface.Data := aObject;
              if TT3Vehicle(aObject).ShowTrails then LISurface.Checked := true;
            end;
          end;
        end;

        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
        begin
          aObject := simMgrClient.SimDetectedTrackList.getObject(i);
          if not Assigned(aObject) then continue;
          if aObject is TT3DetectedTrack then begin
            if TT3DetectedTrack(aObject).TrackDomain = vhdSurface then begin
              LISurface := lvSurface.Items.Add;
              LISurface.Caption := TT3DetectedTrack(aObject).TrackID;
              LISurface.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
              LISurface.Data := aObject;
              if TT3DetectedTrack(aObject).ShowTrails then LISurface.Checked := true;
            end;
          end;
        end;
      end;
    end;
  end

  else if panel = pnlTabSubsurface then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSubsurface.Color := RGB(44, 127, 161);
      pnlContentSubsurface.BringToFront;
      pnlTabSubsurface.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        lvSubsurface.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface then
          begin
            LISub := lvSubsurface.Items.Add;
            LISub.Caption := TT3PlatformInstance(aObject).Track_ID;
            LISub.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
            LISub.Data := aObject;
            if TT3Vehicle(aObject).ShowTrails then LISub.Checked := true;
          end;
        end;
      end

      else
      begin
        lvSubsurface.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).UnitGroup then begin
            if TT3PlatformInstance(aObject).PlatformDomain = vhdSubsurface then
            begin
              LISub := lvSubsurface.Items.Add;
              LISub.Caption := TT3PlatformInstance(aObject).Track_ID;
              LISub.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
              LISub.Data := aObject;
              if TT3Vehicle(aObject).ShowTrails then LISub.Checked := true;
            end;
          end;
        end;

        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
        begin
          aObject := simMgrClient.SimDetectedTrackList.getObject(i);
          if not Assigned(aObject) then continue;
          if aObject is TT3DetectedTrack then begin
            if TT3DetectedTrack(aObject).TrackDomain = vhdSubsurface then begin
              LISub := lvSubsurface.Items.Add;
              LISub.Caption := TT3DetectedTrack(aObject).TrackID;
              LISub.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
              LISub.Data := aObject;
              if TT3DetectedTrack(aObject).ShowTrails then LISub.Checked := true;
            end;
          end;
        end;
      end;
    end;
  end

  else if panel = pnlTabLand then
  begin
    if PanelTag = 0 then
    begin
      pnlTabLand.Color := RGB(44, 127, 161);
      pnlContentLand.BringToFront;
      pnlTabLand.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
          lvLand.Items.Clear;
          for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
          begin
            aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
            if not Assigned(aObject) then continue;
            if TT3PlatformInstance(aObject).PlatformDomain = vhdLand then
            begin
              LILand := lvLand.Items.Add;
              LILand.Caption := TT3PlatformInstance(aObject).Track_ID;
              LILand.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
              LILand.Data := aObject;
              if TT3Vehicle(aObject).ShowTrails then LILand.Checked := true;
            end;
          end;
      end

      else
      begin
        lvGeneral.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).UnitGroup then begin
            if TT3PlatformInstance(aObject).PlatformDomain = vhdGeneral then
            begin
              LIGen := lvGeneral.Items.Add;
              LIGen.Caption := TT3PlatformInstance(aObject).Track_ID;
              LIGen.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
              LIGen.Data := aObject;
              if TT3Vehicle(aObject).ShowTrails then LIGen.Checked := true;
            end;
          end;
        end;

        for i := 0 to simMgrClient.SimDetectedTrackList.itemCount - 1 do
        begin
          aObject := simMgrClient.SimDetectedTrackList.getObject(i);
          if not Assigned(aObject) then continue;
          if aObject is TT3DetectedTrack then begin
            if TT3DetectedTrack(aObject).TrackDomain = vhdGeneral then begin
              LIGen := lvSubsurface.Items.Add;
              LIGen.Caption := TT3DetectedTrack(aObject).TrackID;
              LIGen.SubItems.Add(TT3DetectedTrack(aObject).TrackObject.InstanceName);
              LIGen.Data := aObject;
              if TT3DetectedTrack(aObject).ShowTrails then LIGen.Checked := true;
            end;
          end;
        end;
      end;
    end;
  end

  else if panel = pnlTabGeneral then
  begin
    if PanelTag = 0 then
    begin
      pnlTabGeneral.Color := RGB(44, 127, 161);
      pnlContentGeneral.BringToFront;
      pnlTabGeneral.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);

      if simMgrClient.ISInstructor or simMgrClient.ISWasdal then
      begin
        lvGeneral.Items.Clear;
        for i := 0 to simMgrClient.SimPlatforms.itemCount - 1 do
        begin
          aObject := TT3PlatformInstance(simMgrClient.SimPlatforms.getObject(i));
          if not Assigned(aObject) then continue;
          if TT3PlatformInstance(aObject).PlatformDomain = vhdGeneral then
          begin
            LIGen := lvGeneral.Items.Add;
            LIGen.Caption := TT3PlatformInstance(aObject).Track_ID;
            LIGen.SubItems.Add(TT3PlatformInstance(aObject).InstanceName);
            LIGen.Data := aObject;
            if TT3Vehicle(aObject).ShowTrails then LIGen.Checked := true;
          end;
        end;
      end;
    end;
  end;
end;

end.
