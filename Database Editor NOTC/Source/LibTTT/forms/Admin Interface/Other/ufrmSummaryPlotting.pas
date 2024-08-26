unit ufrmSummaryPlotting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,uDBAsset_Plotting_Definition, tttData,
  uDataModuleTTT, uDrawStrategi;

type
  TfrmSummaryPlotting = class(TForm)
    edtPlotName: TEdit;
    cbbPlotType: TComboBox;
    btnEditPlot: TButton;
    bvl1: TBevel;
    btnOk: TButton;
    btnCancel: TButton;
    lblName: TLabel;
    lbl1: TLabel;
    bvl2: TBevel;
    rbRed: TRadioButton;
    rbBlue: TRadioButton;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure btnEditPlotClick(Sender: TObject);
    procedure cbbPlotTypeSelect(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    OldNameDat, NewNameDat : string;
    StatusDat : Boolean;
    function CekInput: Boolean;
    function RecordToFileStream(fFile : string): Boolean;
    procedure CekNameDat;
  public
    { Public declarations }
    FileNameSource, FileNameCopy, NameSource : string;
    FFileName     : string;
    IdAction      : Integer;
    SelId         : Integer;
    isnew         : Boolean;
    iscopy        : Boolean;
    Plotting_Definition   : TRuntime_Plotting_Definition;
    PlottingSelectedList  : TList;
    FIndexType    : Integer;
    PanelName     : string;
    acolor        : Integer;
    Data          : TrecPlotting_Definition;
    property FOldName : string read OldNameDat write OldNameDat;
    property FNewName : string read NewNameDat write NewNameDat;
    property StatusNameDat : Boolean read StatusDat write StatusDat;
  end;

var
  frmSummaryPlotting: TfrmSummaryPlotting;

implementation
uses
  uPlottingEditor, MapXLib_TLB, uGameAreaSelection, ufrmAvailableResourceAllocation,
  uDBEditSetting, uBaseCoordSystem, ufrmPlottingResourceAllocationPickList;

{$R *.dfm}

procedure TfrmSummaryPlotting.btnCancelClick(Sender: TObject);
begin
  fmPlottingEditor.DrawPlotting.FList.Clear;
  Close;
end;

procedure TfrmSummaryPlotting.btnEditPlotClick(Sender: TObject);
var
  id : Integer;
begin
  NewNameDat := edtPlotName.Text;
  if rbRed.Checked then
    acolor := 255
  else
    acolor := 16711680 ;
  if cbbPlotType.Text = '' then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;
  with fmPlottingEditor do
  begin
    SetCbScale;
    cbbSetScale.ItemIndex := cbbSetScale.Items.Count - 1;
    cbbSetScaleChange(Sender);
    cbbSetScale.Text := fmPlottingEditor.cbbSetScale.Items.Strings[fmPlottingEditor.cbbSetScale.ItemIndex];
  end;

  PanelName := edtPlotName.Text;
  case IdAction of
    1:       {new}
    begin
      fmPlottingEditor.FFileName := PanelName;
      id := cbbPlotType.ItemIndex;
      case cbbPlotType.ItemIndex of
      plIntelijen:
      begin
        with fmPlottingEditor do
        begin
          lblIntelName.Caption := PanelName;
          ClearInput;
          ShowPanel(id);
          FTagApply := id;
          Color := acolor;
          ShowModal;
        end;
      end;
      plLogistic:
      begin
        with fmPlottingEditor do
        begin
          lblLogisticName.Caption := PanelName;
          ClearInput;
          ShowPanel(id);
          FTagApply := id;
          Color := acolor;
          ShowModal;
        end;
      end;
      plRadar:
      begin
        with fmPlottingEditor do
        begin
          lblRadarName.Caption := PanelName;
          ClearInput;
          ShowPanel(id);
          FTagApply := id;
          Color := acolor;
          ShowModal;
        end;
      end;
      plPangkalan:
      begin
        with fmPlottingEditor do
        begin
          lblBaseName.Caption := PanelName;
          ClearInput;
          ShowPanel(id);
          FTagApply := id;
          Color := acolor;
          ShowModal;
        end;
      end;
      plPanah:
      begin
        with fmPlottingEditor do
        begin
          lblArrowName.Caption := PanelName;
          ClearInput;
          ShowPanel(id);
          FTagApply := id;
          Color := acolor;
          ShowModal;
        end;
      end;
      end;
    end;
    2:    {edit}
    begin
      CekNameDat;
      fmPlottingEditor.FFileName := PanelName;
      with fmPlottingEditor do
      begin
        isedit := True;
        isnew := False;
        iscopy := False;
        FEdtColor := acolor;
        ShowModal;
      end;
    end;
    4:
    begin
      fmPlottingEditor.FFileName := PanelName;
      with fmPlottingEditor do
      begin
        iscopy := True;
        isedit := false;
        isnew := False;
        FEdtColor := acolor;
        ShowModal;
      end;
    end;
  end;

  edtPlotName.Enabled := False;
  cbbPlotType.Enabled := False;
  rbRed.Enabled := False;
  rbBlue.Enabled := False;

end;

procedure TfrmSummaryPlotting.btnOkClick(Sender: TObject);
begin
  if not CekInput then
    Exit;

  case IdAction of
  1:              {New}
  begin
    if RecordToFileStream(vAppDBSetting.PlottingPath + '\' + edtPlotName.Text +'.dat') then
      dmTTT.InsertPlotting_Definition(Data)
    else
    Exit
  end;

  2:              {edit}
  begin
    CekNameDat;
    if not StatusDat then
    begin
      NewNameDat := edtPlotName.Text;
      if FileExists(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat') then
      begin
        FileNameCopy := vAppDBSetting.PlottingPath +'\' + edtPlotName.Text + '.dat';
        fmPlottingEditor.LoadPlotting(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat');
        RecordToFileStream(FileNameCopy);
        dmTTT.UpdatePlotting(Data,IntToStr(SelId));
      end;

      DeleteFile(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat');

    end
    else
    begin
      DeleteFile(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat');
      if RecordToFileStream(vAppDBSetting.PlottingPath + '\' + OldNameDat +'.dat') then
        dmTTT.UpdatePlotting(Data,IntToStr(SelId));
    end;
//    if RecordToFileStream(vAppDBSetting.PlottingPath + '\' + edtPlotName.Text +'.dat') then
//      dmTTT.UpdatePlotting(Data,IntToStr(SelId))
//    else
//    Exit
  end;
  4:               {}
  begin
    DeleteFile(vAppDBSetting.PlottingPath + '\' + fmPlottingEditor.FFileCopy + '.dat');
    if RecordToFileStream(vAppDBSetting.PlottingPath + '\' + edtPlotName.Text +'.dat') then
       dmTTT.InsertPlotting_Definition(Data)
    else
    Exit
  end;
  end;
//  fmPlottingResourceAllocationPickList.RefreshListPlotting;
//  fmPlottingResourceAllocationPickList.lbPlottingAvailable.Refresh;
//  fmPlottingResourceAllocationPickList.RefreshListPlotting;
  fmPlottingEditor.isedit := False;
  fmPlottingEditor.DrawPlotting.FList.Clear;
  Close;
end;

procedure TfrmSummaryPlotting.cbbPlotTypeSelect(Sender: TObject);
begin
//  if cbbPlotType.ItemIndex = 0 then
//    rbBlue.Visible := True
//  else
//    rbBlue.Visible := True;
end;

function TfrmSummaryPlotting.CekInput: Boolean;
begin
  Result := False;

  if (edtPlotName.Text = '') or (cbbPlotType.Text = '')  then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  if dmTTT.CekPlottingInsert(edtPlotName.Text) and (IdAction<>2) then
  begin
    ShowMessage('Please use another name');
    Exit;
  end;

  if (IdAction <> 2) and (FFileName <> edtPlotName.Text) then
  begin
    if dmTTT.CekPlottingInsert(edtPlotName.Text) then
    begin
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  Data.Plotting_Name := edtPlotName.Text;
  Data.Plotting_Type := cbbPlotType.ItemIndex;
  if rbRed.Checked then
    Data.Plotting_Group := 1
  else if rbBlue.Checked then
    Data.Plotting_Group := 3;
  Result := True;
end;

procedure TfrmSummaryPlotting.CekNameDat;
begin

  if edtPlotName.Text = OldNameDat then
  begin
    StatusDat := true ;
    if(not FileExists(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat')) then
    begin
      ShowMessage(edtPlotName.Text + '.dat does not exist');
      Exit;
    end;
  end
  else
  begin
    StatusDat := false;
    if (not FileExists(vAppDBSetting.PlottingPath + '\' + OldNameDat + '.dat'))then
    begin
      ShowMessage(edtPlotName.Text + '.dat does not exist');
      Exit;
    end;
  end;

end;

procedure TfrmSummaryPlotting.FormCreate(Sender: TObject);
begin
  Plotting_Definition := TRuntime_Plotting_Definition.Create;
end;

procedure TfrmSummaryPlotting.FormShow(Sender: TObject);
var
  i : Integer;
begin
  edtPlotName.Enabled := True;
  cbbPlotType.Enabled := True;
  rbRed.Enabled := True;
  rbBlue.Enabled := True;
  rbRed.Checked := True;
  case IdAction of
    1:   {New}
    begin
      cbbPlotType.Enabled := true;
      isnew := True;
    end;
    2:   {Edit}
    begin
      isnew := false;

      cbbPlotType.Enabled := False;
      edtPlotName.Text := Plotting_Definition.FData.Plotting_Name ;
      cbbPlotType.ItemIndex := Plotting_Definition.FData.Plotting_Type;
      FIndexType := Plotting_Definition.FData.Plotting_Type;
      if Plotting_Definition.FData.Plotting_Group = 1 then
        rbRed.Checked := true
      else if Plotting_Definition.FData.Plotting_Group = 3 then
        rbBlue.Checked := True;
      if cbbPlotType.Text = 'Intelligence' then
        rbBlue.Visible := False
      else
        rbBlue.Visible := True;
      Refresh;
      OldNameDat := edtPlotName.Text;
    end;
    3: {Delete}
    begin

    end;
    4: {Copy}
    begin
      cbbPlotType.Enabled := False;
      i := 0;
      NameSource := Plotting_Definition.FData.Plotting_Name;
      FileNameSource := vAppDBSetting.PlottingPath + '\' + NameSource + '.dat';
      FileNameCopy := FileNameSource;

      cbbPlotType.ItemIndex := Plotting_Definition.FData.Plotting_Type;
      if cbbPlotType.Items.Text <> 'Intelligence' then
      begin
        rbBlue.Visible := True;
        if Plotting_Definition.FData.Plotting_Group= 1 then
          rbRed.Checked := True
        else if Plotting_Definition.FData.Plotting_Group = 3 then
          rbBlue.Checked := True;
      end
      else
      begin
        rbBlue.Visible := False;
        rbRed.Checked := True;
      end;

      while FileExists(FileNameCopy) do
      begin
        i := i+1;
        FFileName := 'Copy ' + IntToStr(i) + ' of ' + NameSource;
        edtPlotName.Text := FFileName;

        FileNameCopy := vAppDBSetting.PlottingPath +'\' + edtPlotName.Text + '.dat';
      end;
      fmPlottingEditor.LoadPlotting(FileNameSource);
      RecordToFileStream(FileNameCopy);
    end;
  end;
end;

function TfrmSummaryPlotting.RecordToFileStream(fFile: string): Boolean;
var
  Fs : TFileStream;
begin
  Result := True;
  try
    Fs := TFileStream.Create(fFile, fmOpenWrite or fmCreate);
    fmPlottingEditor.DrawPlotting.SaveStreamData(Fs);
  Except
    Showmessage('Can''t save file plotting!' + #13);
    Result := False;
  end;
  Fs.Free;
end;
end.
