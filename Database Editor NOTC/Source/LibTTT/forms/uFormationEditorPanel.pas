unit uFormationEditorPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, uDBAsset_Deploy, uObjectVisuals, uCoordConvertor, System.ImageList;

type
  TfFormationEditorPanel = class(TForm)
    pnlTestArea: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton9: TToolButton;
    toolbtnDecreaseScale: TToolButton;
    cbSetScale: TComboBox;
    toolbtnIncreaseScale: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ImageList1: TImageList;
    btnCancel: TButton;
    btnCapture: TButton;
    ToolButton10: TToolButton;
    btnOK: TButton;
    pnl1: TPanel;
    btnBrowse: TSpeedButton;
    edtLeaderIndex: TEdit;
    edtName: TEdit;
    edtForce: TEdit;
    chkAbsolute: TCheckBox;
    edtLeader: TEdit;
    lbPlatformSelectedIndex: TListBox;
    lbPlatformSelected: TListBox;
    btnApply: TButton;
    img1: TImage;
    grpFormationMember: TGroupBox;
    btnAddRemoveMembers: TButton;
    cbbFormationMembers: TComboBox;
    edtMemberAltitude: TEdit;
    edtMemberBearing: TEdit;
    edtMemberRange: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure cbSetScaleChange(Sender: TObject);
    procedure Map1MapViewChanged(Sender: TObject);
    procedure toolbtnIncreaseScaleClick(Sender: TObject);
    procedure toolbtnDecreaseScaleClick(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure Map1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CalcXY(const x1, y1: Integer; const aDist, aCourse: double; var x2, y2: Integer);
    procedure btnApplyClick(Sender: TObject);
    procedure FormationEditorUpdate;
    procedure Insert;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddorRemoveClick(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure cbbMembersChange(Sender: TObject);
    procedure edtAltitudeChange(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnAddRemoveMembersClick(Sender: TObject);
    procedure cbbFormationMembersChange(Sender: TObject);
  Const
    //r        = 200;
  private
    patternIndex        : Integer;

    function getItemIndexCbb(aStr : string) : Integer;
    procedure getFormAssignmentByFormID(FormID : Integer; aForm : TList);

  public
    { Public declarations }

    add, arrow                     : Boolean;
    isCapturingScreen, MouseIsDown : Boolean;
    wCross, hCross                 : Integer;
    radiusNm, radius, r, index     : Integer;
    oriLong, oriLat                : Double;
    FCanvas                        : TCanvas;
    centX, centY                   : Integer;
    mapX, mapY                     : Double;

    isNew: boolean;
    idFormationSelected: string;
    idSelectedPlatformToUpdate: string;
    leader_id,force_design,formation_id  : Integer;
    asset_deploy  : TAsset_Deployment;
//    memberList: TList;



    draw: TBitmapSymbol;
    FCoordPlatformConv : TCoordConverter;
    procedure showDetail(index: Integer);
    procedure refreshDraw;
    procedure getMemberList;
    procedure DrawMember;
    procedure spiderWeb;
    procedure DrawSelected(const X,Y: Integer);
    procedure ScreenShot(DestBitmap : TBitmap) ;
    procedure DrawSymbol(s_name: String; s_color: TColor; X,Y: Integer);

//    function getCenterX(fMap : TMap): Double;
//    function getCenterY(fMap : TMap): Double;

  end;

var
   FormationEditorPanelForm : TfFormationEditorPanel;
   b, TmpBmp        : TBitmap;

implementation
{$R *.dfm}

uses uScrCapture, ufCaptureRes, uDataModuleTTT, math, uDBFormation, tttData,
  uFormationeditor, uSimDBEditor, uFormatioResourceList,
  uFormationMemberList;

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfFormationEditorPanel.getFormAssignmentByFormID(FormID: Integer;
  aForm: TList);
var
 i : Integer;
 aFormAssignResult : TFormation;
begin
  aFormAssignResult := TFormation.Create;
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    aFormAssignResult := TFormation(FormationEditorForm.FormationAssignmentList.Items[i]);
    if aFormAssignResult.FForm_Assign.Formation_Index = FormID then
    begin
      aForm.Add(aFormAssignResult);
    end;
  end;
end;

function TfFormationEditorPanel.getItemIndexCbb(aStr : string): Integer;
var
  i, j : Integer;
  aInstanceName, CbbText : string;
begin
  Result := -1;

    for j := 0 to cbbFormationMembers.Items.Count - 1 do
    begin
      CbbText := cbbFormationMembers.Items.Strings[j];
      if aStr = CbbText then
      begin
        Result := j;
        break;
      end;
    end;


end;

procedure TfFormationEditorPanel.getMemberList;
var
  I, symbolX, symbolY: Integer;
begin
//  memberList.Clear;
//  dmTTT.GetFormation_Assignment(formation_id,FormationEditorForm.FormationAssignmentList);
  grpFormationMember.Enabled  := true;
  cbbFormationMembers.Text := '';
  cbbFormationMembers.Items.Clear;
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    if formation_id = TFormation(FormationEditorForm.FormationAssignmentList.Items[i]).FForm_Assign.Formation_Index then
    begin
      cbbFormationMembers.Items.Add(TFormation(FormationEditorForm.FormationAssignmentList[i]).FPlatform_Instance.Instance_Name);
      CalcXY(centX,centY,TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Range_from_Leader,
            TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Angle_Offset,symbolX,symbolY);
      DrawSymbol(pctFormationMember+'.bmp', clDkGray, symbolX, symbolY);
    end;
  end;

  if (FormationEditorForm.FormationAssignmentList.Count > 0) then
  begin
    cbbFormationMembers.ItemIndex  := 0;
    showDetail(0);
  end
  else begin
    edtMemberAltitude.Text := '';
    edtMemberRange.Text    := '';
    edtMemberBearing.Text  := '';
  end;
end;

procedure TfFormationEditorPanel.DrawMember;
var
  I, symbolX, symbolY: Integer;
begin
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    if formation_id = TFormation(FormationEditorForm.FormationAssignmentList.Items[i]).FForm_Assign.Formation_Index then
    begin
      CalcXY(centX,centY,TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Range_from_Leader,
            TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Angle_Offset,symbolX,symbolY);
      DrawSymbol(pctFormationMember+'.bmp', clDkGray, symbolX, symbolY);
    end;
  end;
end;

procedure TfFormationEditorPanel.img1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var I, indexCbb: Integer;
    pointX,pointY: Integer;
begin
  if isCapturingScreen then
  with fscrCapture do
  begin
     PDown.X := X;
     PDown.Y := Y;
     PActually.X := X;
     PActually.Y := Y;
     MouseIsDown := TRUE;
     Canvas.DrawFocusRect(Rect(x, y, x, y));
  end
  else
  begin
    for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do begin
      with TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign do begin
        CalcXY(centX,centY,Range_from_Leader,Angle_Offset,pointX,pointY);
        if (X < pointX + 10) and (Y < pointY + 10) and
           (X > pointX - 10) and (Y > pointY - 10) then
        begin
          indexCbb := getItemIndexCbb(TFormation(FormationEditorForm.FormationAssignmentList[i]).FPlatform_Instance.Instance_Name);
          cbbFormationMembers.ItemIndex  := indexCbb;
          cbbMembersChange(Sender);
          refreshDraw;
          DrawSelected(pointX,pointY);
        end;
      end;
    end;
  end;
end;

procedure TfFormationEditorPanel.DrawSelected(const X,Y: Integer);
begin
  img1.Canvas.Pen.Color   := clYellow;
  img1.Canvas.Pen.Style   := psSolid;
  img1.Canvas.Brush.Style := bsClear;
  img1.Canvas.Rectangle(X-10,Y-10,X+10,Y+10);
end;

procedure TfFormationEditorPanel.refreshDraw;
begin
  img1.Canvas.Brush.Color := clLtGray;
  img1.Canvas.Rectangle(0,0,img1.Width,img1.Height);
  spiderWeb;
  DrawMember;
end;

procedure TfFormationEditorPanel.img1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if isCapturingScreen then
 begin

  with fscrCapture do
  begin

   PActually.X := x;
   PActually.Y := Y;
   MouseIsDown := TRUE;

   TmpBmp := TBitmap.Create;

   with TmpBmp do
   begin
     Width := Round(abs(PActually.x - PDown.x));
     Height := Round(abs(PActually.y - PDown.y));
     BitBlt(TmpBmp.Canvas.Handle, 0, 0, Width, Height, fScrCapture.Image1.Canvas.Handle,
      img1.Left+ PDown.x, PDown.y, SRCCOPY);
     fCaptureRes.imgCaptureResult.AutoSize := false;
     fCaptureRes.imgCaptureResult.Picture.Bitmap.Assign(TmpBmp);
     fCaptureRes.Width := Width+10;
     fCaptureRes.Height := Height+fCaptureRes.panel3.height+10;
     fCaptureRes.ShowModal;

     if  fCaptureRes.recapture then  fCaptureRes.recapture:= false
     else isCapturingScreen := false;
     MouseIsDown :=false;
   end;
  end;
 end;
end;

procedure TfFormationEditorPanel.CalcXY(const x1, y1: Integer; const aDist, aCourse: double; var x2, y2: Integer);
var dir : Double;
begin
  dir := DegToRad(90 - aCourse);

  X2 := Round(X1 + (aDist*radiusNm) * Cos(dir));
  Y2 := Round(Y1 - (aDist*radiusNm) * Sin(dir));
end;

procedure TfFormationEditorPanel.showDetail(index: Integer);
var X,Y, i: Integer;
  aFormAssign : TFormation;
begin
  aFormAssign := TFormation.Create;
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    aFormAssign := TFormation(FormationEditorForm.FormationAssignmentList.Items[i]);
    if cbbFormationMembers.Text = aFormAssign.FPlatform_Instance.Instance_Name then
    begin
      edtMemberAltitude.Text  := FormatFloat('0',aFormAssign.FForm_Assign.Altitude);
      edtMemberRange.Text     := FormatFloat('0.00',aFormAssign.FForm_Assign.Range_from_Leader);
      edtMemberBearing.Text   := FormatFloat('0',aFormAssign.FForm_Assign.Angle_Offset);
      CalcXY(centX,centY,aFormAssign.FForm_Assign.Range_from_Leader,
            aFormAssign .FForm_Assign.Angle_Offset,X,Y);
      DrawSelected(X,Y);
      Break;
    end
    else
    begin
      edtMemberAltitude.Text := '';
      edtMemberRange.Text    := '';
      edtMemberBearing.Text  := '';
    end;
  end;
end;

procedure TfFormationEditorPanel.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);

//  FormationEditorForm.refreshFormationList;
  Self.Close;
end;

procedure TfFormationEditorPanel.ScreenShot(DestBitmap : TBitmap) ;
 var
   DC : HDC;
 begin
   DC := GetDC (GetDesktopWindow) ;
   try
    DestBitmap.Width := GetDeviceCaps (DC, HORZRES) ;
    DestBitmap.Height := GetDeviceCaps (DC, VERTRES) ;
    BitBlt(DestBitmap.Canvas.Handle, 0, 0, DestBitmap.Width, DestBitmap.Height, DC, 0, 0, SRCCOPY) ;
   finally
    ReleaseDC (GetDesktopWindow, DC) ;
   end;
 end;

procedure TfFormationEditorPanel.btnAddorRemoveClick(Sender: TObject);
begin
  FormationResourcesForm.ShowModal;
end;

procedure TfFormationEditorPanel.btnAddRemoveMembersClick(Sender: TObject);
begin
  FormationResourcesForm.ShowModal;

end;

procedure TfFormationEditorPanel.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    Insert;
    isNew := false;
    grpFormationMember.Enabled  := true;
    formation_id := formationDef.FFormation_Def.Formation_Index;
  end
  else
  begin
    grpFormationMember.Enabled  := true;
    FormationEditorUpdate;
  end;
  refreshDraw;

  FormationEditorForm.refreshFormationList;
end;

procedure TfFormationEditorPanel.btnBrowseClick(Sender: TObject);
begin
  FormationMemberForm.ShowModal;
end;

procedure TfFormationEditorPanel.FormationEditorupdate;
var
  I: Integer;
  FFormDef : TFormation;
begin
  for I := 0 to FormationEditorForm.FormationDefList.Count - 1 do
  begin
    FFormDef := FormationEditorForm.FormationDefList.Items[i];
    if FFormDef.FFormation_Def.Formation_Index = formation_id then
    begin
      FFormDef.FFormation_Def.Formation_Identifier := edtName.Text;
//      FFormDef.FFormation_Def.Deployment_Index := fPlatformDeploytment.deploy_id;
      FFormDef.FFormation_Def.Force_Designation := force_design;
      FFormDef.FFormation_Def.Formation_Leader := leader_id;
      if chkAbsolute.Checked then
        FFormDef.FFormation_Def.Angle_Type  := 1
      else if not chkAbsolute.Checked then
       FFormDef.FFormation_Def. Angle_Type  := 0;

       FFormDef.FPlatform_Instance.Instance_Name := edtLeader.Text;
       FFormDef.FPlatform_Instance.Platform_Instance_Index := leader_id;
    end;
  end;

  with SIMMgr do
  begin
//    updateFormation_Def(formationDef, IntToStr(formationDef.FFormation_Def.Deployment_Index));
  end;

//  deleteAllFormation_Assignment(IntToStr(formation_id));

  //update formation assignment
  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    formationDef := TFormation(FormationEditorForm.FormationAssignmentList[I]);

    if (formationDef.FPlatform_Instance.Instance_Name = cbbFormationMembers.Text) then
    begin
      with formationDef.FForm_Assign do
      begin
        Altitude := StrToFloat(edtMemberAltitude.Text);
        Angle_Offset :=  strtofloat(edtMemberBearing.Text);
        Range_from_Leader := strtofloat(edtMemberRange.Text);
      end;
    end;

    with SIMMgr do
    begin
//      insertFormation_Assignment(formationDef);

    end;
  end;
end;

procedure TfFormationEditorPanel.Insert;
begin
  formationDef := TFormation.Create;
  with formationDef.FFormation_Def do
  begin
    Formation_Identifier := edtName.Text;
//    Deployment_Index := fPlatformDeploytment.deploy_id;
    Force_Designation := force_design;
    Formation_Leader := leader_id;
    if chkAbsolute.Checked then
      Angle_Type  := 1
    else if not chkAbsolute.Checked then
      Angle_Type  := 0;

    Formation_Index := FormationEditorForm.FormationIndexInc;  // temporary saja
  end;
    formationDef.FPlatform_Instance.Instance_Name := edtLeader.Text;
    formationDef.FPlatform_Instance.Platform_Instance_Index := leader_id;

  FormationEditorForm.FormationDefList.Add(formationDef); //masukkan ke list menampung formation_definition

//  with SIMMgr do
//  begin
//    insertFormation_Def(formationDef);
//  end;
end;

procedure TfFormationEditorPanel.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfFormationEditorPanel.btnCaptureClick(Sender: TObject);
begin
 b := TBitmap.Create;
 ScreenShot(b) ;
 isCapturingScreen := true;
 fScrCapture.Image1.Picture.Assign(b);
// img1.Cursor := cmiCrossCursor;
end;

procedure TfFormationEditorPanel.cbbFormationMembersChange(Sender: TObject);
var
  aFormAssigmentByFormID : TFormation;
  i : Integer;
begin
//  aFormAssigmentByFormID := TList.Create;
//  getFormAssignmentByFormID(formation_id, aFormAssigmentByFormID);

  for I := 0 to FormationEditorForm.FormationAssignmentList.Count - 1 do
  begin
    aFormAssigmentByFormID := TFormation(FormationEditorForm.FormationAssignmentList.Items[i]);
    if cbbFormationMembers.Text = aFormAssigmentByFormID.FPlatform_Instance.Instance_Name then
//    if formation_id = aFormAssigmentByFormID.FForm_Assign.Formation_Index then
    begin
      edtMemberAltitude.Text := FormatFloat('0.00',aFormAssigmentByFormID.FForm_Assign.Altitude);
      edtMemberBearing.Text  := FormatFloat('0.00',aFormAssigmentByFormID.FForm_Assign.Angle_Offset);
      edtMemberRange.Text    := FormatFloat('0.00',aFormAssigmentByFormID.FForm_Assign.Range_from_Leader);
    end;
  end;
end;

procedure TfFormationEditorPanel.cbbMembersChange(Sender: TObject);
begin
  if cbbFormationMembers.ItemIndex <> -1 then
  begin
    refreshDraw;
    showDetail(cbbFormationMembers.ItemIndex);
  end;
end;

procedure TfFormationEditorPanel.cbSetScaleChange(Sender: TObject);
var z : Double;
    s : string;
begin
//  img1.OnMapViewChanged := nil;
  if cbSetScale.ItemIndex < 0  then Exit;

  if (cbSetScale.ItemIndex <= 500) then
  begin
   s := cbSetScale.Items[cbSetScale.ItemIndex];
   try
     z := StrToFloat(s);
//     map1.ZoomTo(z, Map1.CenterX, Map1.CenterY);
   finally

   end;
  end
  else cbSetScale.ItemIndex := cbSetScale.ItemIndex -1 ;
//  Map1.OnMapViewChanged := Map1MapViewChanged;
end;

procedure TfFormationEditorPanel.spiderWeb;
var
  I  : Integer;
begin
  radius       := 0;

  img1.Canvas.Pen.color   := clBlack;
  img1.Canvas.Brush.Style := bsClear;

  for I := 0 to 3 do
  begin
      radius     := radius + radiusNm;
      img1.Canvas.Ellipse(centX - radius, centY - radius, centX + radius, centY + radius);
  end;

  // plus line
  with img1.Canvas do
  begin
      MoveTo(centX, centY - radius);
      LineTo(centX, centY + radius);
      MoveTo(centX - radius, centY);
      LineTo(centX + radius, centY);
  end;

  // cross line
  wCross := round(cos(DegToRad(45)) * radius);
  hCross := round(sin(DegToRad(45)) * radius);

  with img1.Canvas do
  begin
      MoveTo(centX - wCross, centY - hCross);
      LineTo(centX + wCross, centY + hCross);
      MoveTo(centX + wCross, centY - hCross);
      LineTo(centX - wCross, centY + hCross);
  end;

  DrawSymbol(pctForceCentre+'.bmp', clBlue, centX, centY);
end;

procedure TfFormationEditorPanel.DrawSymbol(s_name: String; s_color: TColor; X,Y: Integer);
var
  s   : String;
begin
  s   := ExtractFilePath(ParamStr(0));
  with TBitmapSymbol(draw) do begin
    LoadBitmap(s + '\data\Bitmap\' + s_name, s_color);
    Center.X  := X;
    Center.Y  := Y;
    Visible   := true;
    Draw(img1.Canvas);
  end;
end;

procedure TfFormationEditorPanel.edtAltitudeChange(Sender: TObject);
var i: Integer;
begin
  if cbbFormationMembers.ItemIndex <> -1 then
  begin
    i := cbbFormationMembers.ItemIndex;
    if Sender = edtMemberAltitude then
      TryStrToFloat(edtMemberAltitude.Text,TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Altitude);
    if Sender = edtMemberRange then
      TryStrToFloat(edtMemberRange.Text,TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Range_from_Leader);
    if Sender = edtMemberBearing then
      TryStrToFloat(edtMemberBearing.Text,TFormation(FormationEditorForm.FormationAssignmentList[i]).FForm_Assign.Angle_Offset);
  end;
end;

procedure TfFormationEditorPanel.toolbtnDecreaseScaleClick(Sender: TObject);
begin
  if  cbSetScale.ItemIndex >  0 then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex  - 1;
    toolbtnIncreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if cbsetscale.ItemIndex = 0 then
   toolbtnDecreaseScale.Enabled := false
  else
   toolbtnDecreaseScale.Enabled := true;
end;

procedure TfFormationEditorPanel.toolbtnIncreaseScaleClick(Sender: TObject);
begin
  if  (cbSetScale.ItemIndex <= 500) then
  begin
    cbSetScale.ItemIndex := cbSetScale.ItemIndex + 1;
    toolbtnDecreaseScale.Enabled := true;
  end;

  cbSetScaleChange(cbSetScale);

  if (cbSetScale.ItemIndex = 0) then //sampai batas akhir
   toolbtnIncreaseScale.Enabled := true
  else
    toolbtnIncreaseScale.Enabled := true;
end;

procedure TfFormationEditorPanel.Map1MapViewChanged(Sender: TObject);
var
      tempZoom : double;
begin
//      if Map1.CurrentTool = miZoomInTool then
//      begin
//         if Map1.Zoom <= 0.125 then tempZoom := 0.125;
//         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 1) then tempZoom := Map1.Zoom;
//         if (Map1.Zoom >= 1) AND (Map1.Zoom <= 2500) then tempZoom := round(Map1.Zoom);
//         if Map1.Zoom > 2500 then tempZoom := 2500;
//
//         Map1.OnMapViewChanged := nil;
//         Map1.ZoomTo(tempZoom, Map1.CenterX, Map1.CenterY);
//
//         if (Map1.Zoom > 0.125) AND (Map1.Zoom < 0.25) then
//         begin
//               cbSetScale.Text := FormatFloat('0.000', tempZoom);
//         end
//         else if (Map1.Zoom >= 0.25) AND (Map1.Zoom < 0.5) then
//         begin
//               cbSetScale.Text := FormatFloat('0.00', tempZoom);
//         end
//         else if (Map1.Zoom >= 0.5) AND (Map1.Zoom < 1) then
//         begin
//               cbSetScale.Text := FormatFloat('0.0', tempZoom);
//         end
//         else
//               cbSetScale.Text := floattostr(tempZoom);
//         Map1.OnMapViewChanged := Map1MapViewChanged;
//      end;
end;

procedure TfFormationEditorPanel.Map1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
end;

//function TfFormationEditorPanel.getCenterX(fMap : TMap): Double;
//begin
//  Result := fMap.CenterX;
//end;
//
//function TfFormationEditorPanel.getCenterY(fMap : TMap): Double;
//begin
//  Result := fMap.CenterY;
//end;

procedure TfFormationEditorPanel.FormCreate(Sender: TObject);
begin
  draw        := TBitmapSymbol.Create;
//  memberList  := TList.Create;
  FCoordPlatformConv := TCoordConverter.Create;
end;

procedure TfFormationEditorPanel.FormShow(Sender: TObject);
begin
  arrow   := true;
  add     := false;

  img1.Canvas.Brush.Color := clLtGray;
  img1.Canvas.Rectangle(0,0,img1.Width,img1.Height);

  centX := Round(img1.Width / 2);
  centY := Round(img1.Height / 2);

  radiusNm     := 70;

  spiderWeb;

  if isNew then
  begin
    grpFormationMember.Enabled := false;
  end
  else
  begin
    FormationEditorPanelForm.btnBrowse.Enabled := true;
    FormationEditorPanelForm.grpFormationMember.Visible := true;
    FormationEditorPanelForm.grpFormationMember.Enabled := true;
    getMemberList;
  end;
end;

procedure TfFormationEditorPanel.ToolButton10Click(Sender: TObject);
begin
    if (mapX <> 0) and (mapY <> 0) then
    begin
//      Map1.CenterX := mapX;
//      Map1.CenterY := mapY;
    end;
end;

procedure TfFormationEditorPanel.ToolButton13Click(Sender: TObject);
begin

//  Map1.CurrentTool := miZoomInTool;
//  Map1.MousePointer := miZoomInCursor;

end;

procedure TfFormationEditorPanel.ToolButton14Click(Sender: TObject);
begin
  ToolButton1.Down := false;
  ToolButton13.Down := false;

  if ToolButton14.Down then
  begin
    {statePan := true;
    stateDrawing := false;
    stateDelete := false;
    stateSelect := false; }
//    map1.MousePointer := miCenterCursor;
  end
  else
  begin
    {statePan := false;
    stateSelect := true;
    stateDrawing := false;
    stateDelete := false;   }
//    Map1.CurrentTool := miArrowTool;
  end;
end;

end.

