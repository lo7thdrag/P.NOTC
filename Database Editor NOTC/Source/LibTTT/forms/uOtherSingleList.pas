unit uOtherSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ufrmSummaryRadar;

type
  TfOtherSingle = class(TForm)
    lbTempId: TListBox;
    lbSingle : TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    btnOK: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refresh;
    procedure btnEditClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure NewDefinition;
    procedure Definition;
    procedure lbSingleClick(Sender: TObject);
    procedure btnUsageClick(Sender: TObject);
    procedure lbSingleDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    id : string;
    isNew,isCopy : Boolean;
    ShowFrom : Integer;
  end;

var
  fOtherSingle: TfOtherSingle;
  mList       : TList;

implementation

{$R *.dfm}

uses
  uDataModuleTTT, ufrmAdminMainForm, uDBAssetObject, uDBAsset_GameEnvironment,
  ufrmSummaryRuntimePlatform, ufrmSummaryPredefinedPattern, ufrmSummaryOverlay, ufrmSummaryRadarIntervalList,
  uDBGame_Defaults,ufrmSummaryGameDefaults, uDBPattern, ufrmSummaryStudentRole,
  newClassASTT, uDBAsset_Runtime_Platform_Library, ufrmSummarySNRvsPOD, ufrmUsage, uLibSettingTTT,
  uDBEditSetting,ufrmSummaryBase,uDBAsset_Base,
  ufrmSummaryPlotting, uDBAsset_Plotting_Definition ;

procedure TfOtherSingle.btnCloseClick(Sender: TObject);
begin
  Close;
  btnCopy.Enabled := false;
  btnEdit.Enabled := false;
  btnRemove.Enabled := false;
  btnUsage.Enabled := false;
end;

procedure TfOtherSingle.btnCopyClick(Sender: TObject);
begin
  if lbSingle.ItemIndex = -1 then
    Exit;

  id     := lbTempId.Items.Strings[lbSingle.ItemIndex];
  isCopy := True;

  if lbSingle.Selected[lbSingle.ItemIndex] then
  begin
    if frmAdminMainForm.index = 1 then
    begin
      Definition;
      frmSummaryRuntimePlatform.ShowModal;
    end
    else if frmAdminMainForm.index = 2 then
    begin
      Definition;
      frmSummaryPredefinedPattern.ShowModal;
    end
    else if frmAdminMainForm.index = 3 then
    begin
      Definition;
      frmSummaryRadarIntervalList.ShowModal;
    end
    else if frmAdminMainForm.index = 4 then
    begin
      Definition;
      frmSummaryOverlay.ShowModal;
    end
    else if frmAdminMainForm.index = 5 then
    begin
      Definition;
      frmSummaryStudentRole.ShowModal;
    end
    else if frmAdminMainForm.index = 6 then
    begin
      Definition;
      frmSummaryGameDefault.ShowModal;
    end
    else if frmAdminMainForm.index = 7 then
    begin
      Definition;
      frmSummarySnrVsPod.ShowModal;
    end
    else if frmAdminMainForm.index = 10 then
    begin
      Definition;
      frmSummaryBase.ShowModal;
    end
    else if frmAdminMainForm.index = 11 then
    begin
      Definition;
      frmSummaryPlotting.ShowModal;
    end;

  end;
end;

procedure TfOtherSingle.NewDefinition;
begin
  if frmAdminMainForm.index = 6 then
  begin
    LoadFF_dBaseSetting(vSettingFile, vDBSetting);
    id  := vDBSetting.dbGameDefault;
    with frmSummaryGameDefault do
    begin
      dmTTT.GetAllGame_Defaults(StrToInt(id),mList);
      edtName.Text := '(Unnamed)';
      enableButton;
      isNew := True;
      Definition;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 1 then
  begin
    with frmSummaryRuntimePlatform do begin
//      edtRuntimeName.Text := '';
//      edtRuntimeName.Enabled := True;
      btnVehicle.Enabled  := false;
//      frmSummaryRuntimePlatform.runtime_library := TRuntime_Platform_Library.Create;
//      frmSummaryRuntimePlatform.platform_library_index := 0;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 2 then
  begin
    with frmSummaryPredefinedPattern do begin
      edtPatternName.Text      := '[Noname]';
      edtHeading.Text          := '';
      cbbType.Text             := '(None)';
      chkEventPattern.Checked  := false;
      edt1.Text                := '[None]';
      btnEditPattern.Enabled   := false;
      isNew                    := True;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 3 then
  begin
    with frmSummaryRadarIntervalList do begin
      edtName.Text := '';
      btnEditList.Enabled  := false;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 4 then
  begin
    with frmSummaryOverlay do
    begin
//      IdAction := 1;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 5 then
  begin
    with frmSummaryStudentRole do begin
      edtName.Text := '(Unnamed)';
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 7 then
  begin
    with frmSummarySnrVsPod do begin
      edtName.Text := '(Unnamed)';
      btnEditList.Enabled := False;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 10 then
  begin
    with frmSummaryBase do begin
//      edtEmbarkPlatformLibraryName.Text := 'New Base';
      edtRadius.Text := '1.0';
//      rgTypeBase.ItemIndex := 0;
      edtFuel.Text := '10000';
      edtLubricants.Text := '10000';
      edtFreshWater.Text := '10000';
      edtWater.Text := '10000';
      edtFood.Text := '10000';
//      idAction := 1;
//      PlatformSelectedList.Clear;
      ShowModal;
    end;
  end
  else if frmAdminMainForm.index = 11 then
  begin
    with frmSummaryPlotting do
    begin
      edtPlotName.Text := 'New Plotting';
      cbbPlotType.Text :='';
      IdAction := 1;
      ShowModal;
    end;
  end;
end;

procedure TfOtherSingle.btnEditClick(Sender: TObject);
begin
  if lbSingle.ItemIndex = -1 then
    Exit;

  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];
  isCopy := false;

  if frmAdminMainForm.index = 1 then
  begin
    isNew := False;
    Definition;
    frmSummaryRuntimePlatform.ShowModal;
  end
  else if frmAdminMainForm.index = 2 then
  begin
    isNew := False;
    Definition;
    frmSummaryPredefinedPattern.ShowModal;
  end
  else if frmAdminMainForm.index = 3 then
  begin
    isNew := False;
    Definition;
    frmSummaryRadarIntervalList.ShowModal;
  end
  else if frmAdminMainForm.index = 4 then
  begin
    isNew := False;
    Definition;
    frmSummaryOverlay.ShowModal;
  end
  else if frmAdminMainForm.index = 5 then
  begin
    isNew := False;
    Definition;
    frmSummaryStudentRole.ShowModal;

  end
  else if frmAdminMainForm.index = 6 then
  begin
    isNew := False;
    Definition;
    frmSummaryGameDefault.ShowModal;
  end
  else if frmAdminMainForm.index = 7 then
  begin
    isNew := False;
    Definition;
    frmSummarySnrVsPod.ShowModal;
  end
  else if frmAdminMainForm.index = 10 then
  begin
    isNew := False;
    Definition;
    frmSummaryBase.ShowModal;
  end
  else if frmAdminMainForm.index = 11 then
  begin
    isNew := False;
    Definition;
    frmSummaryPlotting.ShowModal;
  end;

end;

procedure TfOtherSingle.Definition;
var i,j:integer;

begin
  if frmAdminMainForm.index = 1 then
  begin
//    frmSummaryRuntimePlatform.runtime_library := TRuntime_Platform_Library.Create;
//    dmTTT.GetRuntime_Platform_Library(StrToInt(id),mList,frmSummaryRuntimePlatform.runtime_library);
    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryRuntimePlatform do
      begin
        if isCopy then
        begin
//          edtRuntimeName.Text := 'Copy of '+ TRuntime_Platform_Library(mList[i]).FData.Library_Name;
          fOtherSingle.isNew  := True;
//          edtRuntimeName.Enabled := True;
          btnVehicle.Enabled  := false;
//          frmSummaryRuntimePlatform.platform_library_index := StrToInt(id);
        end
        else
        begin
//          edtRuntimeName.Text := TRuntime_Platform_Library(mList[i]).FData.Library_Name;
//          edtRuntimeName.Enabled := True;
          btnVehicle.Enabled  := true;

        end;
      end;
    end;
  end
  else if frmAdminMainForm.index = 2 then
  begin
    dmTTT.GetPredefined_Pattern(StrToInt(id),mList,frmSummaryPredefinedPattern.pattern);

    for I := 0 to mList.Count - 1 do
    begin
      with frmSummaryPredefinedPattern do
      begin
        if isCopy then
        begin
          edtPatternName.Text  := 'Copy of '+ TPredefined_Pattern(mList[i]).FData.Pattern_Identifier;
          isNew           := True;
        end
        else
          edtPatternName.Text  := TPredefined_Pattern(mList[i]).FData.Pattern_Identifier;

        cbbType.ItemIndex      := TPredefined_Pattern(mList[i]).FData.Pattern_Type;
        if TPredefined_Pattern(mList[i]).FData.Pattern_Termination = 0 then
          chkEventPattern.Checked := True
        else
          chkEventPattern.Checked := False;

        edtHeading.Text        := FloatToStr(TPredefined_Pattern(mList[i]).FData.Termination_Heading);

        dmTTT.GetVehicle_Definition(TPredefined_Pattern(mList[i]).FData.Vehicle_Index,vehicle);
        edt1.Text              := vehicle.FData.Vehicle_Identifier;
      end;

    end;
  end
  else if frmAdminMainForm.index = 3 then
  begin
    dmTTT.GetRadar_Interval_List(StrToInt(id),mList,frmSummaryRadarIntervalList.radar_interval);
    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryRadarIntervalList do
      begin
        if isCopy then
        begin
          edtName.Text := 'Copy of '+ TRadar_Interval_List(mList[i]).FData.Interval_List_Identifier;
          fOtherSingle.isNew  := True;
          btnEditList.Enabled := false;
        end
        else
        begin
          edtName.Text := TRadar_Interval_List(mList[i]).FData.Interval_List_Identifier;
          btnEditList.Enabled := true;
        end;
      end;
    end;
  end
  else if frmAdminMainForm.index = 4 then
  begin
//    dmTTT.GetOverlay_Definition_List(StrToInt(id),mList,frmSummaryOverlay.OverlayDefinition);
    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryOverlay do
      begin
//        OverlayDefinition := TMainOverlay_Definition(mList[i]);

        if Self.isCopy then
//          IdAction := 4
        else
//          IdAction := 2;
      end;
    end;
  end
  else if frmAdminMainForm.index = 5 then
  begin
    dmTTT.GetStudent_Role_List(StrToInt(id),mList,frmSummaryStudentRole.student_list);
    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryStudentRole do
      begin
        if isCopy then
        begin
          edtName.Text := 'Copy of '+ TStudent_Role_List(mList[i]).FData.Role_List_Identifier;
          isNew := True;
        end
        else
          edtName.Text := TStudent_Role_List(mList[i]).FData.Role_List_Identifier;
      end;
    end;
  end
  else if frmAdminMainForm.index = 6 then
  begin
    with frmSummaryGameDefault do
    begin
      dmTTT.GetAllGame_Defaults(StrToInt(id),mList);
      if isCopy then
      begin
        edtName.Text := 'Copy of '+ game_default.FData.Defaults_Identifier;
        isNew := True;
      end
      else
        edtName.Text := game_default.FData.Defaults_Identifier;
      Definition;
    end;
  end
  else if frmAdminMainForm.index = 7 then
  begin
//    dmTTT.GetPOD_vs_SNR_Curve_Definition(StrToInt(id),mList,frmSummarySnrVsPod.POD);
//    for I := 0 to mList.Count - 1 do
//    begin
//      with frmSummarySnrVsPod do
//      begin
//        if isCopy then
//        begin
//          edtName.Text := 'Copy of '+ TPOD_vs_SNR_Curve_Definition(mList[i]).FData.Curve_Definition_Identifier;
//          isNew := True;
//          btnEditList.Enabled := false;
//        end
//        else
//          edtName.Text := TPOD_vs_SNR_Curve_Definition(mList[i]).FData.Curve_Definition_Identifier;
//
//        index_toShow := 3;
//      end;
//    end;
  end
  else if frmAdminMainForm.index = 8 then
  begin
   {
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
    end;   }
  end
  else if frmAdminMainForm.index = 10 then
  begin
//    dmTTT.GetEmbark_Library(StrToInt(id),mList,frmSummaryBase.Embark_Library);

//    frmSummaryBase.SelId := StrToInt(id);
    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryBase do
      begin
//        PlatformSelectedList.Clear;
//        PersonelSelectedList.Clear;

//        Embark_Library := TBase(mList[i]);
        {set radius dan tipe pangkalan}
//        edtRadius.Text := FloatToStr(Embark_Library.FData.Base_Radius);
//        if Embark_Library.FData.Embark_Library_TypeBase = 0 then
//          rgTypeBase.ItemIndex := 0
//        else
//          rgTypeBase.ItemIndex := 1;
        {set logistic pangkalan}
//        edtFuel.Text := FloatToStr(Embark_Library.FData.Fuel);
//        edtLubricants.Text := FloatToStr(Embark_Library.FData.Lubricants);
//        edtFreshWater.Text := FloatToStr(Embark_Library.FData.FreshWater);
//        edtWater.Text := FloatToStr(Embark_Library.FData.Water);
//        edtFood.Text := FloatToStr(Embark_Library.FData.Food);
        if Self.isCopy then
        begin
//          IdAction := 4;
//          if SelId = Embark_Library.FData.Base_Index then
//            edtEmbarkPlatformLibraryName.text := 'Copy of ' + Embark_Library.FData.Base_Identifier;
//
//          dmTTT.getPlatform_Embark_Library(SelId,PlatformSelectedList,Platform_Embark_Library);
//          dmTTT.GetPersonel_Embark_Library(SelId,PersonelSelectedList,Personel);
        end
        else
        begin
//          IdAction := 2;
//          if SelId = Embark_Library.FData.Base_Index then
//            edtEmbarkPlatformLibraryName.text := Embark_Library.FData.Base_Identifier;
////            edtRadius.Text := FloatToStr(Embark_Library.FData.Embark_Library_Radius);  //dipindah ke atas
////
////            if Embark_Library.FData.Embark_Library_TypeBase =0 then
////              rgTypeBase.ItemIndex := 0
////            else
////              rgTypeBase.ItemIndex := 1;
//
//          dmTTT.getPlatform_Embark_Library(SelId,PlatformSelectedList,Platform_Embark_Library);
//          dmTTT.GetPersonel_Embark_Library(SelId,PersonelSelectedList,Personel);
        end;
      end;
    end;
  end
  else if frmAdminMainForm.index = 11 then
  begin
    dmTTT.GetAllPlotting_DefinitionByID(StrToInt(id), mList, frmSummaryPlotting.Plotting_Definition );
    frmSummaryPlotting.SelId := StrToInt(id);

    for i := 0 to mList.Count - 1 do
    begin
      with frmSummaryPlotting do
      begin
        Plotting_Definition := TRuntime_Plotting_Definition(mList[i]);
        if Self.isCopy then
        begin
          IdAction := 4;
        end
        else
        begin
          IdAction := 2;
        end;
      end;
    end;

  end;
end;

procedure TfOtherSingle.btnNewClick(Sender: TObject);
begin
  frmSummaryRadarIntervalList.isNew := True;
  isNew := True;
  isCopy := False;
  NewDefinition;
end;

procedure TfOtherSingle.btnOKClick(Sender: TObject);
begin
  if lbSingle.ItemIndex = -1 then
    Exit;

//  frmSummaryRadar.CurvDefIndex := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
//  frmSummaryRadar.edtSignalToNoise.Text := lbSingle.Items.Strings[lbSingle.ItemIndex];
  Close;
end;

procedure TfOtherSingle.btnRemoveClick(Sender: TObject);
var
  warning : Integer;
  del_id, FileName  : string;
  gList : TList;
  RARec : TResource_Allocation;
  I: Integer;
begin
  if lbSingle.ItemIndex = -1 then
    Exit;

  warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
  if warning = mrOK then
  begin
    del_id := lbTempId.Items.Strings[lbSingle.ItemIndex];
    case frmAdminMainForm.index of
      1:
        begin
          gList := TList.Create;
          if dmTTT.GetLibrary_MappingByRA(0,StrToInt(del_id),gList) then
          begin
            MessageDlg('cannot remove the connected Runtime Platform data which still connected to Scenario',
                         mtWarning,[mbOK], 0);
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
                case frmAdminMainForm.index of
                  1: UIndex := 0;
                  2..7: UIndex := frmAdminMainForm.index + 31;
                end;
                if UIndex = 38 then usage_title := 'Radar Class:'
                else usage_title := 'Scenario';
                ShowModal;
              end;
            end;
          end
          else
          begin
            if del_id = '1' then
            begin
              ShowMessage('Can not remove Default library');
              Exit;
            end;
            dmTTT.DeletePlatform_Library_Entry(0,StrToInt(del_id),0);
            dmTTT.DeleteRuntime_Platform_LibraryByResourceAlloc(del_id);
            dmTTT.DeleteRuntime_Platform_Library(del_id);
          end;

        end;
      2:
        begin
          dmTTT.DeletePredefined_Pattern(del_id,frmSummaryPredefinedPattern.pattern);
        end;

      3:
        begin
          try
            dmTTT.DeleteRadar_Interval_List(del_id);
          except
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
                case frmAdminMainForm.index of
                        1: UIndex := 0;
                        2..7: UIndex := frmAdminMainForm.index + 31;
                end;
                if UIndex = 38 then
                  usage_title := 'Radar Class:'
                else
                  usage_title := 'Scenario';

                ShowModal;
              end;
            end;
          end;
        end;

      4:
        begin
          if dmTTT.GetResource_Overlay_Mapping(StrToInt(del_id),mList) then
          begin
          MessageDlg('Overlay currently in use',
          mtWarning,[mbOK], 0);
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage := lbSingle.Items.Strings[lbSingle.ItemIndex];
                  case frmAdminMainForm.index of
                    1: UIndex := 0;
                    2..7: UIndex := frmAdminMainForm.index +  31;
                    10: UIndex := 40;
                    11: UIndex := 43;
                  end;
                if UIndex = 38 then
                  usage_title := 'Radar Class:'
                else
                  usage_title := 'Scenario';
                ShowModal;
              end;
            end;
          end
          else
          begin
            try
              FileName := vAppDBSetting.OverlayPath + '\' +TMainOverlay_Definition(mList[i]).FData.Name + '.dat';

              dmTTT.DeleteOverlay_Definition(del_id);

              if not DeleteFile(FileName) then
                ShowMessage('Couldn''t delete file ' + TMainOverlay_Definition(mList[i]).FData.Name + '.dat');

            except

            end;
          end;

        end;
      5:
        begin
          try
            gList := TList.Create;
            dmTTT.GetLibrary_MappingByRA(36,StrToInt(del_id),gList);
            for I := 0 to gList.Count - 1 do
            begin
              RARec := TResource_Allocation.Create;
              RARec := TResource_Allocation(gList[I]);
              RARec.FData.Role_List_Index := 1;
              dmTTT.updateResource(RARec,IntToStr(RARec.FData.Resource_Alloc_Index));
            end;
            dmTTT.DeleteStudent_Role_Definition(del_id,0);
            dmTTT.DeleteStudent_Role_List(del_id);
          except
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
                case frmAdminMainForm.index of
                        1: UIndex := 0;
                        2..7: UIndex := frmAdminMainForm.index + 31;
                end;
                if UIndex = 38 then usage_title := 'Radar Class:'
                else usage_title := 'Resource Allocation:';
                ShowModal;
              end;
            end;
          end;
        end;
      6:
        begin
          dmTTT.DeleteGame_Rainfall_On_Radar(del_id);
          dmTTT.DeleteGame_Cloud_On_Radar(del_id);
          dmTTT.DeleteGame_Sea_On_Radar(del_id);
          dmTTT.DeleteGame_Rainfall_On_ESM(del_id);
          dmTTT.DeleteGame_Cloud_On_ESM(del_id);
          dmTTT.DeleteGame_Rainfall_On_Missile_Seeker(del_id);
          dmTTT.DeleteGame_Sea_On_Missile_Safe_Altitude(del_id);
          dmTTT.DeleteGame_Rainfall_On_Sonar(del_id);
          dmTTT.DeleteGame_Ship_On_Sonar(del_id);
          dmTTT.DeleteGame_Sea_On_Sonar(del_id);
          dmTTT.DeleteGame_Default_IFF_Mode_Code(del_id);
          gList := TList.Create;
          dmTTT.GetResourceAlloc_byGameDef(StrToInt(del_id),gList);
          for I := 0 to gList.Count - 1 do
          begin
            RARec := TResource_Allocation.Create;
            RARec := TResource_Allocation(gList[I]);
            RARec.FData.Defaults_Index := 1;
            dmTTT.updateResource(RARec,IntToStr(RARec.FData.Resource_Alloc_Index));
          end;
          dmTTT.deleteGame_Defaults(StrToInt(del_id));
        end;
      7:
        begin
          dmTTT.DeletePOD_vs_SNR_Point(del_id);
          dmTTT.DeletePOD_vs_SNR_Curve_Definition(del_id);
        end;
      10:
        begin
          if dmTTT.GetEmbark_LibBySce(StrToInt(del_id), mList) then
          begin
            ShowMessage('base currently in use ');
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage := lbSingle.Items.Strings[lbSingle.ItemIndex];
                  case frmAdminMainForm.index of
                    1: UIndex := 0;
                    2..7: UIndex := frmAdminMainForm.index +  31;
                    10: UIndex := 40;
                    11: UIndex := 43;
                  end;
                if UIndex = 38 then
                  usage_title := 'Radar Class:'
                else
                  usage_title := 'Scenario';
                ShowModal;
              end;
            end;
          end
          else
          begin
            dmTTT.DeleteVehicle_OnBase(del_id);
            dmTTT.DeletePlatform_Embark_Library(del_id);
          end;

        end;
        11:
        begin
          if dmTTT.Get_IdResourceAlloc(StrToInt(del_id),mList) then
          begin
            ShowMessage('Plotting currently in use ');
            if lbSingle.ItemIndex <> -1 then
            begin
              with frmUsage do
              begin
                UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
                name_usage := lbSingle.Items.Strings[lbSingle.ItemIndex];
                  case frmAdminMainForm.index of
                    1: UIndex := 0;
                    2..7: UIndex := frmAdminMainForm.index +  31;
                    10: UIndex := 40;
                    11: UIndex := 43;
                  end;
                if UIndex = 38 then
                  usage_title := 'Radar Class:'
                else
                  usage_title := 'Scenario';
                ShowModal;
              end;
            end;
          end
          else
          begin
            FileName := vAppDBSetting.PlottingPath + '\' +
              TRuntime_Plotting_Definition(mList[i]).FData.Plotting_Name + '.dat';
            dmTTT.DeletePlotting(del_id);
            if not DeleteFile(FileName) then
              ShowMessage('Couldn''t delete file ' +
                TRuntime_Plotting_Definition(mList[i]).FData.Plotting_Name + '.dat');
          end;
        end;
    end;

    refresh;
  end;
end;

procedure TfOtherSingle.btnUsageClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then
  begin
    with frmUsage do
    begin
      UId := StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]);
      name_usage  := lbSingle.Items.Strings[lbSingle.ItemIndex];
      case frmAdminMainForm.index of
        1: UIndex := 0;
        2..7: UIndex := frmAdminMainForm.index + 31;
        10: UIndex := 40;
        11: UIndex := 43;

      end;
      if UIndex = 38 then usage_title := 'Radar Class:'
//      else if UIndex = 40 then usage_title := 'Scenario'
      else
        usage_title := 'Scenario';
//        usage_title := 'Resource Allocation:';
      ShowModal;
    end;
  end;
end;

procedure TfOtherSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfOtherSingle.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnClose.Click;
     end;
    end;
  end;
end;

procedure TfOtherSingle.FormShow(Sender: TObject);
begin
  btnOK.Visible := False;
  if frmAdminMainForm.index = 1 then
    Caption := 'Runtime Platform Libraries'
  else if frmAdminMainForm.index = 2 then
    Caption := 'Predefined Patterns'
  else if frmAdminMainForm.index = 3 then
    Caption := 'Radar Interval List'
  else if frmAdminMainForm.index = 4 then
    Caption := 'Overlay'
  else if frmAdminMainForm.index = 5 then
    Caption := 'Student Role List'
  else if frmAdminMainForm.index = 6 then
    Caption := 'Game Defaults'
  else if frmAdminMainForm.index = 7 then
  begin
    Caption := 'SNR vs POD Curve';
    if ShowFrom = 1 then  // from radar
      btnOK.Visible := True;
  end
  else if frmAdminMainForm.index = 8 then
    Caption := 'Report Editor'
  else if frmAdminMainForm.index = 9 then
    Caption := 'Report Viewer'
  else if frmAdminMainForm.index = 10 then
    Caption := 'Bases'
  else if frmAdminMainForm.index = 11 then
    Caption := 'Plotting';

  refresh;
end;

procedure TfOtherSingle.lbSingleClick(Sender: TObject);
begin
  if lbSingle.ItemIndex <> -1 then
  begin
    btnCopy.Enabled := true;
    btnEdit.Enabled := true;
    btnRemove.Enabled := true;
    btnUsage.Enabled := true;
  end
  else
  begin
    btnCopy.Enabled := false;
    btnEdit.Enabled := false;
    btnRemove.Enabled := false;
    btnUsage.Enabled := false;
  end;
end;

procedure TfOtherSingle.lbSingleDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfOtherSingle.refresh;
var i:integer;
begin
  if frmAdminMainForm.index = 1 then
  begin
//    dmTTT.GetRuntime_Platform_Library(0,mList,frmSummaryRuntimePlatform.runtime_library);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TRuntime_Platform_Library(mList[I]).FData.Library_Name);
      lbTempId.Items.Add(IntToStr(TRuntime_Platform_Library(mList[I]).FData.Platform_Library_Index));
    end;
  end
  else if frmAdminMainForm.index = 2 then
  begin
    dmTTT.GetPredefined_Pattern(0,mList,frmSummaryPredefinedPattern.pattern);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TPredefined_Pattern(mList[I]).FData.Pattern_Identifier);
      lbTempId.Items.Add(IntToStr(TPredefined_Pattern(mList[I]).FData.Pattern_Index));
    end;
  end
  else if frmAdminMainForm.index = 3 then
  begin
    dmTTT.GetRadar_Interval_List(0,mList,frmSummaryRadarIntervalList.radar_interval);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TRadar_Interval_List(mList[I]).FData.Interval_List_Identifier);
      lbTempId.Items.Add(IntToStr(TRadar_Interval_List(mList[I]).FData.Interval_List_Index));
    end;
  end
  else if frmAdminMainForm.index = 4 then
  begin
//    dmTTT.GetOverlay_Definition_List(0,mList,frmSummaryOverlay.OverlayDefinition);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TOverlay_Definition(mList[I]).FData.Overlay_Identifier);
      lbTempId.Items.Add(IntToStr(TOverlay_Definition(mList[I]).FData.Overlay_Index));
    end;
  end
  else if frmAdminMainForm.index = 5 then
  begin
    dmTTT.GetStudent_Role_List(0,mList,frmSummaryStudentRole.student_list);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TStudent_Role_List(mList[I]).FData.Role_List_Identifier);
      lbTempId.Items.Add(IntToStr(TStudent_Role_List(mList[I]).FData.Role_List_Index));
    end;
  end
  else if frmAdminMainForm.index = 6 then
  begin
    dmTTT.GetAllGame_Defaults(0,mList);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TGame_Defaults(mList[I]).FData.Defaults_Identifier);
      lbTempId.Items.Add(IntToStr(TGame_Defaults(mList[I]).FData.Defaults_Index));
    end;
  end
  else if frmAdminMainForm.index = 7 then
  begin
//    dmTTT.GetPOD_vs_SNR_Curve_Definition(0,mList,frmSummarySnrVsPod.POD);
//
//    lbSingle.Clear;
//    lbTempId.Clear;
//    for I := 0 to mList.Count - 1 do
//    begin
//      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
//      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
//    end;
  end
  else if frmAdminMainForm.index = 8 then
  begin
   // dmTTT.getAllRadar_On_Board(0,mList);

    lbSingle.Clear;
    lbTempId.Clear;
//    for I := 0 to mList.Count - 1 do
//    begin
//      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
//      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
//    end;
  end
  else if frmAdminMainForm.index = 9 then
  begin
   // dmTTT.getAllRadar_On_Board(0,mList);

    lbSingle.Clear;
    lbTempId.Clear;
//    for I := 0 to mList.Count - 1 do
//    begin
//      lbSingle.Items.Add(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Identifier);
//      lbTempId.Items.Add(IntToStr(TPOD_vs_SNR_Curve_Definition(mList[I]).FData.Curve_Definition_Index));
//    end;
  end
  else if frmAdminMainForm.index = 10 then
  begin
    {Tempat coding get all embark libraries}
//    dmTTT.GetAllEmbark_library(0,mList,frmSummaryBase.Embark_Library);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TBase(mList[I]).FData.Base_Identifier);
      lbTempId.Items.Add(IntToStr(TBase(mList[I]).FData.Base_Index));
    end;
  end
  else if frmAdminMainForm.index = 11 then
  begin
    dmTTT.GetPlotting_Definition(0,mList,frmSummaryPlotting.Plotting_Definition);
    lbSingle.Clear;
    lbTempId.Clear;

    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TRuntime_Plotting_Definition(mList[I]).FData.Plotting_Name);
      lbTempId.Items.Add(IntToStr(TRuntime_Plotting_Definition(mList[I]).FData.Plotting_Index));
    end;

  end;
end;
end.
