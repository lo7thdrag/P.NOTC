unit ufrmUsage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAssetObject;

type
  TfrmUsage = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ListView1: TListView;
    btnOk: TButton;
    btnPrint: TButton;
    PrintDialog1: TPrintDialog;
    lbl1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    uList1 : Tlist;
    uList2 : TList; //digunakan untuk menampung data yang memiliki lebih dari satu macam tipe usage(selain usage vehicle)
    uList3 : TList;
    uList4 : TList;
    UIndex : integer;
    UId : integer;
    uTarget : byte;
    usage_title,name_usage: string;
    procedure getDataUsage;
    procedure showDataUsage;
  end;

var
  frmUsage: TfrmUsage;

implementation

{$R *.dfm}
uses
  uDataModuleTTT, uDBAsset_Countermeasure, uDBAsset_Radar, uDBAsset_Sonar, newClassASTT,
  uDBAsset_Sensor, uDBAsset_Sonobuoy, uDBAsset_Weapon, Printers,
  uDBAsset_Runtime_Platform_Library, uDBPattern, uDBAsset_GameEnvironment,
  uDBAsset_Vehicle, uDBAsset_Logistics,uDBAsset_Transport, uDBAsset_Base, uDBGame_Defaults; //dng

procedure TfrmUsage.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsage.btnPrintClick(Sender: TObject);
var
  pWidth, pHeight, i: Integer;
  v, h: Real;
  CurItem, iColumnCount: Integer;
  aCols: array[0..100] of Integer;
  iTotColsWidth, iInnerWidth, TopMarg, LinesOnPage, CurLine, TekstHeight, CurCol: Integer;
  CurRect: TRect;
  CurStr: string;
  CurLeft, NumPages, TmpPos: Integer;

begin
  if PrintDialog1.Execute then
  begin
    iColumnCount := Listview1.Columns.Count;

    Printer.Title := 'Listview Print';
    Printer.Copies := 1;
    Printer.Orientation := poPortrait;
    Printer.BeginDoc;
    pHeight := Printer.PageHeight;
    pWidth := Printer.PageWidth;

    v := (pHeight + (2 * GetDeviceCaps(Printer.Handle, PHYSICALOFFSETY))) / (29.7 * 0.95);
    //0.95 is a strange correction factor on the clients printer
    h := (pWidth + (2 * GetDeviceCaps(Printer.Handle, PHYSICALOFFSETX))) / 21;

    // calculate total width
    iTotColsWidth := 0;
    for i := 0 to iColumnCount - 1 do
      iTotColsWidth := iTotColsWidth + Listview1.Columns[i].Width;

    // calculate space between lMargin and rMargin
    aCols[0] := Round(1.5 * h); //left margin ?
    aCols[iColumnCount + 0] := pWidth - Round(1.5 * h); //rigth margin ?
    iInnerWidth := aCols[iColumnCount + 0] - aCols[0]; // space between margins ?

    //calculate start of each column
    for i := 0 to iColumnCount - 1 do
      aCols[i + 1] := aCols[i] + Round(Listview1.Columns[i].Width / iTotColsWidth * iInnerWidth);
    TopMarg := Round(2.5 * v);
    with Printer.Canvas do
    begin
      Font.Size := 10;
      Font.Style := [];
      Font.Name := 'Times New Roman';
      Font.Color := RGB(0, 0, 0);
      TekstHeight := Printer.Canvas.TextHeight('dummy');
      LinesOnPage := Round((PHeight - (5 * v)) / TekstHeight);
      NumPages := 1;

      // gather number of pages to print
      while (NumPages * LinesOnPage) < Listview1.Items.Count do
        inc(NumPages);
      // start
      CurLine := 0;
      for CurItem := 0 to Listview1.Items.Count - 1 do
      begin
        if (CurLine > LinesOnPage) or (CurLine = 0) then
        begin
          if (CurLine > LinesOnPage) then Printer.NewPage;
          CurLine := 1;
          if Printer.PageNumber = NumPages then
          begin
            MoveTo(aCols[1], topMarg);
            for i := 1 to iColumnCount - 1 do
            begin
              LineTo(aCols[i], TopMarg + (TekstHeight * (Listview1.Items.Count - CurItem + 2)));
              MoveTo(aCols[i + 1], topMarg);
            end;
          end
          else
          begin
            // draw vertical lines between data
            for i := 1 to iColumnCount - 1 do
            begin
              MoveTo(aCols[i], topMarg);
              LineTo(aCols[i], TopMarg + (TekstHeight * (LinesOnPage + 1)));
            end;
          end;

          Font.Style := [fsBold];
          // print column headers
          for i := 0 to iColumnCount - 1 do
          begin
            TextRect(Rect(aCols[i] + Round(0.1 * h), TopMarg - Round(0.1 * v), aCols[i + 1] - Round(0.1 * h)
              , TopMarg + TekstHeight - Round(0.1 * v)), ((aCols[i + 1] - aCols[i]) div 2) +
              aCols[i] - (TextWidth(Listview1.Columns.Items[i].Caption) div 2),
              TopMarg - Round(0.1 * v), Listview1.Columns.Items[i].Caption);
            //showmessage('print kolom: '+IntToStr(i));
          end;

          // draw horizontal line beneath column headers
          MoveTo(aCols[0] - Round(0.1 * h), TopMarg + TekstHeight - Round(0.05 * v));
          LineTo(aCols[iColumnCount] + Round(0.1 * h), TopMarg + TekstHeight - Round(0.05 * v));

          // print date and page number
          Font.Size := 8;
          Font.Style := [];
          TmpPos := (TextWidth('Date: ' + DateToStr(Date) + ' Page: ' +
            IntToStr(Printer.PageNumber) + ' / ' + IntToStr(NumPages))) div 2;

          TmpPos := PWidth - Round(1.5 * h) - (TmpPos * 2);

          Font.Size := 8;
          Font.Style := [];
          TextOut(TmpPos, Round(0.5 * v), 'Date: ' + DateToStr(Date) +
            ' Page: ' + IntToStr(Printer.PageNumber) + ' / ' + IntToStr(NumPages));

          // print report title

          Font.Size := 18;
          if TmpPos < ((PWidth + TextWidth('Usage : '+name_usage)) div 2 + Round(0.75 * h)) then
            TextOut((PWidth - TextWidth('Usage : '+name_usage)) div 2, Round(1 * v), 'Usage : '+name_usage)
          else
            TextOut(Round(3 * h), Round(1 * v), 'Usage : '+name_usage);

          Font.Size := 10;
          Font.Style := [];
        end;

        CurRect.Top := TopMarg + (CurLine * TekstHeight);
        CurRect.Bottom := TopMarg + ((CurLine + 1) * TekstHeight);

        // print contents of Listview
        for CurCol := -1 to iColumnCount - 2 do
        begin
          CurRect.Left := aCols[CurCol + 1] + Round(0.1 * h);
          CurRect.Right := aCols[CurCol + 2] - Round(0.1 * h);
          try
            if CurCol = -1 then
              CurStr := Listview1.Items[CurItem].Caption
            else
              CurStr := Listview1.Items[CurItem].SubItems[CurCol];
          except
            CurStr := '';
          end;
          CurLeft := CurRect.Left; // align left side
          // write string in TextRect
          TextRect(CurRect, CurLeft, CurRect.Top, CurStr);
        end;
        Inc(CurLine);
      end;
    end;
    Printer.EndDoc;
  end;
end;

procedure TfrmUsage.FormCreate(Sender: TObject);
begin
  uList1 := TList.Create;
  uList2 := TList.Create;
  uList3 := TList.Create;
  uList4 := TList.Create;
end;

procedure TfrmUsage.FormShow(Sender: TObject);
begin
  uList1.Clear;
  uList2.Clear;
  uList3.Clear;
  getDataUsage;
end;

procedure TfrmUsage.getDataUsage;
begin
  case UIndex of

    {$REGION ' Sensor '}
    1: {Radar}
    begin
      dmTTT.GetRadarAtVehicleOnBoard (UId,uList1);
    end;
    2: {Sonar}
    begin
      dmTTT.GetSonarAtVehicleOnBoard (UId,uList1);
      dmTTT.GetSonarAtSonobuoyDef (UId,uList2);
    end;
    3: {ESM}
    begin
      dmTTT.GetESMAtVehicleOnBoard(UId,uList1);
    end;
    4: {EOD}
    begin
      dmTTT.GetEOAtVehicleOnBoard(UId,uList1);
    end;
    5: {MAD}
    begin
      dmTTT.GetMADAtVehicleOnBoard(UId,uList1);
    end;
    6: {Sonobuoy}
    begin
      dmTTT.GetSonobuoyAtVehicleOnBoard       (UId,uList1);
      dmTTT.GetPlatformInstanceAtResourceAllocation(4, UId,uList3);
    end;
    {$ENDREGION}

    {$REGION ' Platform '}
    27:
    begin
      dmTTT.GetPlatformInstanceAtResourceAllocation(1,UId,uList1);
      dmTTT.GetPlatformAtPlatformLibraryEntry(1, UId,uList2);
      dmTTT.GetAllVehicle_OnBase(UId,uList3);
      dmTTT.GetAllVehicleAtHostPlatform(UId,uList4);
    end;
    {$ENDREGION}

    {$REGION ' Weapon '}
    7: {Missile}
    begin
      dmTTT.GetFittedWeaponAtVehicleOnBoard  (UIndex,UId,uList1);
      dmTTT.GetPlatformInstanceAtResourceAllocation(2,UId,uList3);
    end;
    8: {Torpedo}
    begin
      dmTTT.GetFittedWeaponAtVehicleOnBoard  (UIndex,UId,uList1);
      dmTTT.GetTorpedoAtMissileDef (UId,uList2);
      dmTTT.GetPlatformInstanceAtResourceAllocation(3,UId,uList3);
    end;
    9: {Mine}
    begin
      dmTTT.GetFittedWeaponAtVehicleOnBoard  (UIndex,UId,uList1);
      dmTTT.GetPlatformInstanceAtResourceAllocation(5,UId,uList3);
    end;
    10: {Gun}
    begin
      dmTTT.GetPointEffectAtVehicleOnBoard   (UIndex,UId,uList1);
    end;
    11: {Bomb}
    begin
      dmTTT.GetPointEffectAtVehicleOnBoard   (UIndex,UId,uList1);
    end;
    {$ENDREGION}

    {$REGION ' Countermeasure '}
    12: dmTTT.GetAcousticDecoyAtVehicleOnBoard(UId,uList1);
    13: dmTTT.GetAirBubbleAtVehicleOnBoard    (UId,uList1);
    14: dmTTT.GetChaffAtVehicleOnBoard         (UId,uList1);
    15: dmTTT.GetFloatingDecoyAtVehicleOnBoard(UId,uList1);
    16: dmTTT.GetSelfDefensiveAtVehicleOnBoard(UId,uList1);
    17: dmTTT.GetTowedJammerAtVehicleOnBoard  (UId,uList1);
    18: dmTTT.GetRadarNoiseAtVehicleOnBoard   (UId,uList1);
    19: dmTTT.GetInfraredDecoyAtVehicleOnBoard(UId,uList1);
    {$ENDREGION}

    {$REGION ' Other '}
    26: dmTTT.GetRPLAtResourceAllocation(UId,uList1);
    35: dmTTT.GetOverlayAtResourceAllocation(UId, uList1);
    38:
    begin
      dmTTT.GetRadarByPOD_vs_SNR(UId, uList1);
      dmTTT.GetSonarByPOD_vs_SNR(UId, uList2);
    end;
    39: dmTTT.GetLogisticAtVehicle(UId, uList1);
    40: dmTTT.GetBaseAtResourceAllocation(UId, uList1);
    41: dmTTT.GetWaypointAtResourceAllocation(UId,uList1);
    42: dmTTT.GetTransportAtVehicle(UId,uList1);
    44: dmTTT.GetGameDefaultAtResourceAllocation(UId,uList1);
    {$ENDREGION}

    {$REGION ' Exercise '}
    30: {Game Area}
    begin
      dmTTT.GetGameAreaAtEnvironment(UId,uList1);
    end;
    {$ENDREGION}

    // from RA
    20..25: dmTTT.GetPlatform_InstanceBySce(UIndex,UId,uList1,name_usage);
    28: dmTTT.GetScenario_ByRA      (UId,uList1);
    29: dmTTT.GetResourceAllocation_ByEnvi(UId,uList1);

    31: dmTTT.GetPlatform_Instance_SatelliteByRA(UId,uList1);
    32: dmTTT.GetVehicle_DefByMotion(UId,uList1);
    // other
    0,33,37: dmTTT.GetLibrary_MappingByRA (UIndex,UId,uList1);

    43: dmTTT.Get_IdResourceAlloc(UId,uList1);
  end;
  showDataUsage;
end;

procedure TfrmUsage.showDataUsage;
var ListItem: TListItem;
  I, j, k, l: Integer;
  obj: TObject;
begin
  ListView1.Clear;

  {$REGION ' Print List 1 '}
  for I := 0 to uList1.Count - 1 do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := usage_title;
    case UIndex of
      0,33,34,36,37: ListItem.SubItems.Add(TResource_Allocation(uList1[i]).FData.Allocation_Identifier);
      1:
        with TRadar_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      2:
        with TSonar_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      3:
        with TESM_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      4:
        with TEOD_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      5:
        with TMAD_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      6:
        with TSonobuoy_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      7,8,9:
        with TMissile_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.FData.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      10,11:
        with TPoint_Effect_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      12:
        with TAcoustic_Decoy_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      13:
        with TAir_Bubble_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      14:
        with TChaff_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      15:
        with TFloating_Decoy_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      16:
        with TDefensive_Jammer_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      17:
        with TTowed_Jammer_Decoy_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      18:
        with TRadar_Noise_Jammer_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      19:
        with TInfrared_Decoy_On_Board(uList1[i]) do begin
          ListItem.SubItems.Add('Class Name : '+ FVehicle.Vehicle_Identifier);
          ListItem.SubItems.Add('Mount Name : ' + FData.Instance_Identifier);
        end;
      20..25:
        with TPlatform_Instance(uList1[i]) do begin
          ListItem.SubItems.Add(FScenario.Scenario_Identifier);
          ListItem.SubItems.Add('Track ID: ' + FData.Track_ID);
        end;
      26:
        with TRuntime_Platform_Library(uList1[i]) do begin
          ListItem.Caption := 'Used By Scenario ';
          ListItem.SubItems.Add(FResource_Allocation.Allocation_Identifier);
        end;
      27: {berbeda dengan TTT}
        begin
          obj := TObject.Create;
          obj := uList1.Items[i];
          if obj is TPlatform_Instance then
          begin
            with TPlatform_Instance(uList1[i]) do begin
              ListItem.Caption := 'Platform Instance in Resource Allocation:';
              ListItem.SubItems.Add(FResource.Allocation_Identifier);
              ListItem.SubItems.Add('Platform Instance Name: ' + FData.Instance_Name);
            end;
          end
          else begin
            with TPredefined_Pattern(uList1[i]) do begin
              ListItem.Caption := 'Predefined Pattern:';
              ListItem.SubItems.Add(FData.Pattern_Identifier);
            end;
          end;
        end;
      28:
        with TScenario_Definition(uList1[i]) do begin
          ListItem.SubItems.Add(FData.Scenario_Identifier);
        end;
      29:
        with TResource_Allocation(uList1[i]) do begin
          ListItem.SubItems.Add(FData.Allocation_Identifier);
        end;
      30:
        with TGame_Environment_Definition(uList1[i]) do begin
          ListItem.Caption := 'Used By Scenario ';
          ListItem.SubItems.Add(FData.Game_Enviro_Identifier);
        end;
      31:
        with TPlatform_Instance(uList1[i]) do begin
          ListItem.SubItems.Add(FResource.Allocation_Identifier);
          ListItem.SubItems.Add('Platform Instance Name: ' + FData.Instance_Name);
        end;
      32:
        with TVehicle_Definition(uList1[i]) do
        begin
          ListItem.Caption := 'Used By Vehicle ';
          ListItem.SubItems.Add('Class Name : '+ FData.Vehicle_Identifier);
        end;
      35:
        with TResource_Overlay_Mapping(uList1[i]) do begin
          ListItem.Caption := 'Used bBy Scenario : ';
          ListItem.SubItems.Add(FResource_Allocation.Allocation_Identifier);
        end;
      38:
        with TRadar_On_Board(uList1[i]) do begin
          ListItem.Caption := 'Used by Radar :';
          ListItem.SubItems.Add(FDef.Radar_Identifier);
        end;
      39:
        with TLogistics(uList1[i]) do begin
          ListItem.Caption := 'Used By Vehicle : ';
          ListItem.SubItems.Add(FVecDef.Vehicle_Identifier);
        end;
      40:
        with TResource_Base_Mapping(uList1[i]) do begin
          ListItem.Caption := 'Used By Scenario : ';
          ListItem.SubItems.Add(FResource_Allocation.Allocation_Identifier);
        end;
      41:
        with TResource_Waypoint_Mapping(uList1[i]) do begin
          ListItem.Caption := 'Used By Scenario : ';
          ListItem.SubItems.Add(FResource_Allocation.Allocation_Identifier);
        end;

      42:
        with TTransport(uList1[i]) do begin
          ListItem.Caption := 'Used By Vehicle : ';
          ListItem.SubItems.Add(FVecDef.Vehicle_Identifier);
        end;
      43:
        with TResource_Allocation(uList1[i]) do begin
          ListItem.Caption := 'Used By Scenario : ';
          ListItem.SubItems.Add(FPlotting_Usage.Alloc_Identifier);
        end;
      44:
        with TGame_Defaults(uList1[i]) do begin
          ListItem.Caption := 'Used By Resource Allocation : ';
          ListItem.SubItems.Add(FResource_Allocation.Allocation_Identifier);
        end;
    end;
  end;
  if uList1.Count > 0 then
    ListItem := ListView1.Items.Add;
  {$ENDREGION}

  {$REGION ' Print List 2 '}

  for j := 0 to uList2.Count - 1 do
  begin

    ListItem := ListView1.Items.Add;

    case UIndex of
      2 :
      begin
        ListItem.Caption := 'Usage Sonobuoy';
        with TSonobuoy_On_Board(uList2[j]) do
        begin
          ListItem.SubItems.Add('Class Name: ' + FDef.Class_Identifier);
        end;
      end;
      6 :
      begin
        ListItem.Caption := 'Usage Runtime Platform Library';
        with TSonobuoy_On_Board(uList2[j]) do begin
          ListItem.SubItems.Add(dmTTT.GetNameRuntime_Platform_LibraryByID(FPlatform_Library_Entry.Library_Index));
          ListItem.SubItems.Add('Mount Name: ' + FDef.Class_Identifier);
        end;
      end;
      7 :
      begin
        ListItem.Caption := 'Usage Runtime Platform Library';
        with TMissile_On_Board(uList2[j]) do begin
          ListItem.SubItems.Add(dmTTT.GetNameRuntime_Platform_LibraryByID(FPlatform_Library_Entry.Library_Index));
          ListItem.SubItems.Add('Mount Name: ' + FDef.Class_Identifier);
        end;
      end;
      8 :
      begin
        ListItem.Caption := 'Used by Missile ';
        with TMissile_On_Board(uList2[j]) do begin
          ListItem.SubItems.Add('Class Name: ' + FDef.Class_Identifier);
        end;
      end;
      9 :
      begin
        ListItem.Caption := 'Usage Runtime Platform Library';
        with TMine_On_Board(uList2[j]) do begin
          ListItem.SubItems.Add(dmTTT.GetNameRuntime_Platform_LibraryByID(FPlatform_Library_Entry.Library_Index));
          ListItem.SubItems.Add('Mount Name: ' + FMine_Def.Mine_Identifier);
        end;
      end;
      27 :
      begin
        ListItem.Caption := 'Usage Runtime Platform Library';
        with TPlatform_Library_Entry(uList2[j]) do begin
          ListItem.SubItems.Add(FData.Identifier);
        end;
      end;
      38:
      with TSonar_On_Board(uList2[j]) do begin
        ListItem.Caption := 'Used by Sonar :';
        ListItem.SubItems.Add(FDef.Sonar_Identifier);
      end;
    end;
  end;

  if uList2.Count > 0 then
    ListItem := ListView1.Items.Add;
  {$ENDREGION}

  {$REGION ' Print List 3 '}
  for k := 0 to uList3.Count - 1 do
  begin
    ListItem := ListView1.Items.Add;

    case UIndex of
      27 :
      begin
        ListItem.Caption := 'Used At Base';
        with TVehicle_On_Base(uList3[k]) do begin
          ListItem.SubItems.Add(FBaseDef.Base_Identifier);
        end;
      end;
    end;
  end;

  if uList3.Count > 0 then
    ListItem := ListView1.Items.Add;
  {$ENDREGION}

  {$REGION ' Print List 4 '}
  for l := 0 to uList4.Count - 1 do
  begin
    ListItem := ListView1.Items.Add;

    case UIndex of
      27 :
      begin
        ListItem.Caption := 'Used Embarked Host';
        with THosted_Platform(uList4[l]) do begin
          ListItem.SubItems.Add(FVehicle.Vehicle_Identifier);
        end;
      end;
    end;
  end;
  {$ENDREGION}
end;

end.
