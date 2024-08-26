unit uCountermeasuresSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfCountermeasureSingle = class(TForm)
    lbTempId: TListBox;
    lbSingle: TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure Definition;
    procedure btnNewClick(Sender: TObject);
    procedure NewDefinition;
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    id    : string;
    isNew : Boolean;
    procedure refresh;
  end;

var
  fCountermeasureSingle: TfCountermeasureSingle;
  mList : TList;

implementation

{$R *.dfm}

uses uDataModuleTTT, ufDBEditor, uDBAsset_Countermeasure,uAcousticDecoy,
uAirBubbleDef, uChaffDecoy, uFloatingDecoy, uDefensiveJammer, uTowedJammerDecoyDef,
uRadarJammer;

procedure TfCountermeasureSingle.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfCountermeasureSingle.btnCopyClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

  if lbSingle.Selected[lbSingle.ItemIndex] then
  begin
    if fDBEditor.index = 1 then
    begin
      fAcousticDecoy.isCopy := True;
      Definition;
      fAcousticDecoy.Show;
    end
    else if fDBEditor.index = 2 then
    begin
      fAirBubble.isCopy := True;
      Definition;
      fAirBubble.Show;
    end
    else if fDBEditor.index = 3 then
    begin
      fChaff.isCopy := True;
      Definition;
      fChaff.Show;
    end
    else if fDBEditor.index = 4 then
    begin
      fFloatingDecoy.isCopy := True;
      Definition;
      fFloatingDecoy.Show;
    end
    else if fDBEditor.index = 5 then
    begin
      fDefensiveJammer.isCopy := True;
      Definition;
      fDefensiveJammer.Show;
    end
    else if fDBEditor.index = 6 then
    begin
      fTowedjammerDecoy.isCopy := True;
      Definition;
      fTowedjammerDecoy.Show;
    end
    else
    begin
     fRadarJammer.isCopy := True;
      Definition;
      fRadarJammer.Show;
    end;

  end;
end;

procedure TfCountermeasureSingle.btnEditClick(Sender: TObject);
begin
  id  := lbTempId.Items.Strings[lbSingle.ItemIndex];

  if fDBEditor.index = 1 then
  begin
    fAcousticDecoy.isCopy := False;
    Definition;
    fAcousticDecoy.Show;
  end
  else if fDBEditor.index = 2 then
  begin
    fAirBubble.isCopy := False;
    Definition;
    fAirBubble.Show;
  end
  else if fDBEditor.index = 3 then
  begin
    fChaff.isCopy := False;
    Definition;
    fChaff.Show;
  end
  else if fDBEditor.index = 4 then
  begin
    fFloatingDecoy.isCopy := False;
    Definition;
    fFloatingDecoy.Show;
  end
  else if fDBEditor.index = 5 then
  begin
    fDefensiveJammer.isCopy := False;
    Definition;
    fDefensiveJammer.Show;
  end
  else if fDBEditor.index = 6 then
  begin
    fTowedjammerDecoy.isCopy := False;
    Definition;
    fTowedjammerDecoy.Show;
  end
  else if fDBEditor.index = 7 then
  begin
    fRadarJammer.isCopy := False;
    Definition;
    fRadarJammer.Show;
  end;
end;

procedure TfCountermeasureSingle.NewDefinition;
begin

  if fDBEditor.index = 1 then
  begin

    with fAcousticDecoy do
    begin
      edtClassAcousticDecoy.Text := '';
      edtDecoyNoise.Text         := '';

      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 2 then
  begin

    with fAirBubble do
    begin
       edtClassAirBubble.Text   := '';
       edtDissipationTime.Text  := '';
       edtAscentRate.Text       := '';
       edtMaxAcousticCross.Text := '';

       Show;
    end;
    Close;
  end
  else if fDBEditor.index = 3 then
  begin

    with fChaff do
    begin
       edtClassChaff.Text               := '';
       edtDissipationTimein100kt.Text   := '';
       edtDescentRate.Text              := '';
       edtMaxBloom.Text                 := '';
       edtMaxRadarCross.Text            := '';
       edtBloomTime.Text                := '';
       edtDissipationTimeinStillAir.Text:= '';
       edtMaxRadarAttenuation.Text      := '';
       edtLowerLimit.Text               := '';
       edtUpperLimit.Text               := '';
       cbMaxRadar.Clear;
       Show;
    end;
    Close;
  end
  else if fDBEditor.index = 4 then
  begin

    with fFloatingDecoy do
    begin
      edtClassFloatingDecoy.Text      := '';
      edtLengthDimensions.Text        := '';
      edtWidththDimensions.Text       := '';
      edtHeigthDimensions.Text        := '';
      edtFrontRadarCross.Text         := '';
      edtSideRadarCross.Text          := '';
      edtFrontAcousticCross.Text      := '';
      edtSideAcousticCross.Text       := '';
      edtFrontVisualCross.Text        := '';
      edtSideVisualCross.Text         := '';
      edtLifetimeDuration.Text        := '';
      cbFrontRadarCross.Clear;
      cbSideRadarCross.Clear;
      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 5 then
  begin

    with fDefensiveJammer do
    begin
      edtClassDefensiveJammer.Text  := '';
      edtTypeA.Text                 := '';
      edtTypeB.Text                 := '';
      edtTypeC.Text                 := '';
      cbxTARHMissiles.Checked       := False;
      cbxFireControlRadar.Checked   := False;
      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 6 then
  begin

    with fTowedjammerDecoy do
    begin
      edtClassTowedJammer.Text  := '';
      edtFrontRadarCross.Text   := '';
      edtSideRadarCross.Text    := '';
      edtLengthDimensions.Text  := '';
      edtWidththDimensions.Text := '';
      edtHeigthDimensions.Text  := '';
      edtFrontAcousticCross.Text:= '';
      edtSideAcousticCross.Text := '';
      edtFrontRadarCross.Text   := '';
      edtSideRadarCross.Text    := '';
      edtFrontVisualCross.Text  := '';
      edtSideVisualCross.Text   := '';
      edtActivationControl.Text := '';
      edtTowLength.Text         := '';
      edtTypeA.Text             := '';
      edtTypeB.Text             := '';
      edtTypeC.Text             := '';
      cbFrontRadarCross.Clear;
      cbSideRadarCross.Clear;
      cbxTARHMissiles.Checked   := False;
      cbxFireControlRadars.Checked  := False;
      Show;
    end;
    Close;
  end
  else if fDBEditor.index = 7 then
  begin

    with fRadarJammer do
    begin
      //edtClassRadarJammer.Text  := '';
      edtPowerDensity.Text      := '';
      edtLowerLimit.Text        := '';
      edtUpperLimit.Text        := '';
      edtMaxEffectiveRange.Text := '';
      edtMaxSectorWidth.Text    := '';
      edtLowerVerticalLimits.Text := '';
      edtUpperVerticalLimits.Text := '';
      Show;
    end;
    Close;
  end

end;

procedure TfCountermeasureSingle.btnNewClick(Sender: TObject);
begin
  isNew := True;
  NewDefinition;
end;

procedure TfCountermeasureSingle.btnRemoveClick(Sender: TObject);
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.deleteAccoustic_Decoy_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 2 then
  begin
    dmTTT.deleteAir_Bubble_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 3 then
  begin
    dmTTT.deleteChaff_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.deleteFloating_Decoy_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.deleteDefensive_Jammer_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 6 then
  begin
    dmTTT.deleteTowed_Jammer_Def(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end
  else if fDBEditor.index = 7 then
  begin
    //dmTTT.deleteBomb(StrToInt(lbTempId.Items.Strings[lbSingle.ItemIndex]));
  end;

  refresh;
end;

procedure TfCountermeasureSingle.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfCountermeasureSingle.FormShow(Sender: TObject);
begin

  if fDBEditor.index = 1 then
    Caption := 'Accoustic Decoy Window'
  else if fDBEditor.index = 2 then
    Caption := 'Air Bubble Decoy'
  else if fDBEditor.index = 3 then
    Caption := 'Chaff Decoy'
  else if fDBEditor.index = 4 then
    Caption := 'Floating Decoy'
  else if fDBEditor.index = 5 then
    Caption := 'Self Defensive Jammer'
  else if fDBEditor.index = 6 then
    Caption := 'Towed Jammer/Decoy'
  else if fDBEditor.index = 7 then
    Caption := 'Radar Noise Jammer';

  refresh;

end;

procedure TfCountermeasureSingle.refresh;
var i:integer;
begin
  if fDBEditor.index = 1 then
  begin
    dmTTT.getAccoustic_Decoy(0,mList,fAcousticDecoy.acoustic);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TAcoustic_Decoy_On_Board(mList[I]).FAccousticDecoy_Def.Decoy_Identifier);
      lbTempId.Items.Add(IntToStr(TAcoustic_Decoy_On_Board(mList[I]).FAccousticDecoy_Def.Decoy_Index));
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    dmTTT.getAir_Bubble_Def(0,mList,fAirBubble.air_bubble);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TAir_Bubble_Mount(mList[I]).FAirBubble_Def.Air_Bubble_Identifier);
      lbTempId.Items.Add(IntToStr(TAir_Bubble_Mount(mList[I]).FAirBubble_Def.Air_Bubble_Index));
    end;
  end
  else if fDBEditor.index = 3 then
  begin
    dmTTT.getChaff_Def(0,mList,fChaff.chaff);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TChaff_On_Board(mList[I]).FChaff_Def.Chaff_Identifier);
      lbTempId.Items.Add(IntToStr(TChaff_On_Board(mList[I]).FChaff_Def.Chaff_Index));
    end;
  end
  else if fDBEditor.index = 4 then
  begin
    dmTTT.getFloating_Decoy(0,mList,fFloatingDecoy.floating);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TFloating_Decoy_On_Board(mList[I]).FFloatingDecoy_Def.Floating_Decoy_Identifier);
      lbTempId.Items.Add(IntToStr(TFloating_Decoy_On_Board(mList[I]).FFloatingDecoy_Def.Floating_Decoy_Index));
    end;
  end
  else if fDBEditor.index = 5 then
  begin
    dmTTT.getDefensive_Jammer_Def(0,mList,fDefensiveJammer.defensive_jammer);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TDefensive_Jammer_On_Board(mList[I]).FDefensiveJammer_Def.Defensive_Jammer_Identifier);
      lbTempId.Items.Add(IntToStr(TDefensive_Jammer_On_Board(mList[I]).FDefensiveJammer_Def.Defensive_Jammer_Index));
    end;
  end
  else if fDBEditor.index = 6 then
  begin
    dmTTT.getTowed_Jammer_Def(0,mList,fTowedjammerDecoy.towed_jammer);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TTowed_Jammer_Decoy_On_Board(mList[I]).FDef.Towed_Decoy_Identifier);
      lbTempId.Items.Add(IntToStr(TTowed_Jammer_Decoy_On_Board(mList[I]).FDef.Towed_Decoy_Index));
    end;
  end
  else if fDBEditor.index = 7 then
  begin
   { dmTTT.getAllRadar_On_Board(0,mList);

    lbSingle.Clear;
    lbTempId.Clear;
    for I := 0 to mList.Count - 1 do
    begin
      lbSingle.Items.Add(TR(mList[I]).FDefensiveJammer_Def.Defensive_Jammer_Identifier);
      lbTempId.Items.Add(IntToStr(TDefensive_Jammer_On_Board(mList[I]).FDefensiveJammer_Def.Defensive_Jammer_Index));
    end; }
  end
end;

procedure TfCountermeasureSingle.Definition;
var i:integer;
begin
  lbTempId.Clear;
  lbSingle.Clear;

  if fDBEditor.index = 1 then
  begin
    if id <> '' then
      dmTTT.getAccoustic_Decoy(StrToInt(id),mList,fAcousticDecoy.acoustic);

    for I := 0 to mList.Count - 1 do
    begin
      with fAcousticDecoy do begin
        if isCopy then
        begin
          edtClassAcousticDecoy.Text := 'Copy of ' + TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Decoy_Identifier;
          isNew := True;
        end
        else
          edtClassAcousticDecoy.Text := TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Decoy_Identifier;
        edtDecoyNoise.Text := FloatToStr(TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Acoustic_Intensity_Increase);
        TrackBarDecoyNoise.Position := Round(TAcoustic_Decoy_On_Board(mList[i]).FAccousticDecoy_Def.Acoustic_Intensity_Increase);
      end;
    end;
  end
  else if fDBEditor.index = 2 then
  begin
    if id <> '' then
      dmTTT.getAir_Bubble_Def(StrToInt(id),mList,fAirBubble.air_bubble);

    for I := 0 to mList.Count - 1 do
    begin
      with fAirBubble do begin
        if isCopy then
        begin
          edtClassAirBubble.Text   := 'Copy of '+ TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Air_Bubble_Identifier;
          isNew := True;
        end
        else
          edtClassAirBubble.Text   := TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Air_Bubble_Identifier;
        edtDissipationTime.Text  := FloatToStr(TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Dissipation_Time);
        edtAscentRate.Text       := FloatToStr(TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Ascent_Rate);
        edtMaxAcousticCross.Text := FloatToStr(TAir_Bubble_Mount(mList[i]).FAirBubble_Def.Max_Acoustic_Cross);
      end;
    end;
  end
  else if fDBEditor.index = 3 then
  begin
    if id <> '' then
      dmTTT.getChaff_Def(StrToInt(id),mList,fChaff.chaff);

    for I := 0 to mList.Count - 1 do
    begin
      with fChaff do begin
        if isCopy then
        begin
          edtClassChaff.Text  := 'Copy of '+TChaff_On_Board(mList[i]).FChaff_Def.Chaff_Identifier;
          isNew := True;
        end
        else
          edtClassChaff.Text  := TChaff_On_Board(mList[i]).FChaff_Def.Chaff_Identifier;
        edtDissipationTimein100kt.Text   := IntToStr(TChaff_On_Board(mList[i]).FChaff_Def.Min_Dissipation_Time);
        edtDescentRate.Text              := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Descent_Rate);
        edtMaxBloom.Text                 := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Max_Radius);
        edtMaxRadarCross.Text            := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Max_Radar_Cross);
        edtBloomTime.Text                := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Bloom_Time);
        edtDissipationTimeinStillAir.Text:= FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Max_Dissipation_Time);
        edtMaxRadarAttenuation.Text      := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Max_Radar_Attenuation);
        edtLowerLimit.Text               := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Radar_Affect_Lower_Freq);
        edtUpperLimit.Text               := FloatToStr(TChaff_On_Board(mList[i]).FChaff_Def.Radar_Affect_Upper_Freq);
      end;
    end;
  end
  else if fDBEditor.index = 4 then
  begin
    if id <> '' then
      dmTTT.getFloating_Decoy(StrToInt(id),mList,fFloatingDecoy.floating);

    for I := 0 to mList.Count - 1 do
    begin
      with fFloatingDecoy do begin
        if isCopy then
        begin
          edtClassFloatingDecoy.Text := 'Copy of '+TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Floating_Decoy_Identifier;
          isNew := True;
        end
        else
          edtClassFloatingDecoy.Text := TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Floating_Decoy_Identifier;
        edtLengthDimensions.Text   := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Length);
        edtWidththDimensions.Text  := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Width);
        edtHeigthDimensions.Text   := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Height);
        edtFrontRadarCross.Text    := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Front_Radar_Cross);
        edtSideRadarCross.Text     := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Side_Radar_Cross);
        edtFrontAcousticCross.Text := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Front_Acoustic_Cross);
        edtSideAcousticCross.Text  := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Side_Acoustic_Cross);
        edtFrontVisualCross.Text   := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Front_Visual_Cross);
        edtSideVisualCross.Text    := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Side_Visual_Cross);
        edtLifetimeDuration.Text   := FloatToStr(TFloating_Decoy_On_Board(mList[i]).FFloatingDecoy_Def.Lifetime_Duration);
      end;
    end;
  end
  else if fDBEditor.index = 5 then
  begin
    if id <> '' then
      dmTTT.getDefensive_Jammer_Def(StrToInt(id),mList,fDefensiveJammer.defensive_jammer);

    for I := 0 to mList.Count - 1 do
    begin
      with fDefensiveJammer do begin
        if isCopy then
        begin
          edtClassDefensiveJammer.Text := 'Copy of '+ TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Defensive_Jammer_Identifier;
          isNew := True;
        end
        else
          edtClassDefensiveJammer.Text := TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Defensive_Jammer_Identifier;

        TrackBarTypeA.Position       := Round (TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_A_Seducing_Prob);
        edtTypeA.Text                := FloatToStr(TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_A_Seducing_Prob);
        TrackBarTypeB.Position       := Round (TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_B_Seducing_Prob);
        edtTypeB.Text                := FloatToStr(TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_B_Seducing_Prob);
        TrackBarTypeC.Position       := Round (TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_C_Seducing_Prob);
        edtTypeC.Text                := FloatToStr(TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Type_C_Seducing_Prob);

        if TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.ECM_Type = 0 then
          cbECMType.ItemIndex := 0
        else if TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.ECM_Type = 1 then
          cbECMType.ItemIndex := 1
        else
          cbECMType.ItemIndex := 2;

        if TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Jammer_TARH_Capable = 1 then
          cbxTARHMissiles.Checked  := True
        else
          cbxTARHMissiles.Checked  := False;

        if TDefensive_Jammer_On_Board(mList[i]).FDefensiveJammer_Def.Jammer_SARH_Capable = 1 then
          cbxFireControlRadar.Checked  := True
        else
          cbxFireControlRadar.Checked  := False;
      end;
    end;
  end
  else if fDBEditor.index = 6 then
  begin
    if id <> '' then
      dmTTT.getTowed_Jammer_Def(StrToInt(id),mList,fTowedjammerDecoy.towed_jammer);

    for I := 0 to mList.Count - 1 do
    begin
      with fTowedjammerDecoy do begin
        if isCopy then
        begin
          edtClassTowedJammer.Text  := 'Copy of ' + TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Towed_Decoy_Identifier;
          isNew := True;
        end
        else
          edtClassTowedJammer.Text  := TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Towed_Decoy_Identifier;
        edtFrontRadarCross.Text   := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Front_Radar_Cross);
        edtSideRadarCross.Text    := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Side_Radar_Cross);
        edtFrontAcousticCross.Text:= FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Front_Acoustic_Cross);
        edtSideAcousticCross.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Side_Acoustic_Cross);
        edtFrontVisualCross.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Front_Visual_Cross);
        edtSideVisualCross.Text   := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Side_Visual_Cross);
        edtLengthDimensions.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Length);
        edtWidththDimensions.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Width);
        edtHeigthDimensions.Text  := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Height);
        edtActivationControl.Text := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Activation_Control_Delay);
        edtTowLength.Text         := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Tow_Length);
        edtTypeA.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_A_Seducing_Prob);
        edtTypeB.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_B_Seducing_Prob);
        edtTypeC.Text             := FloatToStr(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_C_Seducing_Prob);
        TrackBarTypeA.Position    := Round(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_A_Seducing_Prob);
        TrackBarTypeB.Position    := Round(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_B_Seducing_Prob);
        TrackBarTypeC.Position    := Round(TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Type_C_Seducing_Prob);


        if TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.ECM_Type = 0 then
          cbECMType.ItemIndex := 0
        else if TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.ECM_Type = 1 then
          cbECMType.ItemIndex := 1
        else
          cbECMType.ItemIndex := 2;

        if TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Decoy_TARH_Capable = 1 then
          cbxTARHMissiles.Checked := True
        else
          cbxTARHMissiles.Checked := False;

        if TTowed_Jammer_Decoy_On_Board(mList[i]).FDef.Decoy_SARH_Capable = 1 then
          cbxFireControlRadars.Checked := True
        else
          cbxFireControlRadars.Checked := False;
      end;

    end;
  end
  else if fDBEditor.index = 7 then
  begin
  { if id <> '' then
    uSimDBEditor.getAllMissile(StrToInt(id),mList,fMissileSummary.Missile);

    for I := 0 to mList.Count - 1 do
    begin

    end;  }
  end
end;

end.
