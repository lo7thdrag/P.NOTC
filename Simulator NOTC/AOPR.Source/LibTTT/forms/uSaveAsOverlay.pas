unit uSaveAsOverlay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, uMainOverlay, uSimMgr_Client,uFormUtil,
  uDBEditSetting, uOverlayTemplateEditor, tttData, uDataModuleTTT,
  uDBAsset_GameEnvironment, uLibSettingTTT, uDBAssetObject, CheckLst;

type
  TfrmSaveAsOverlay = class(TForm)
    lvOverlayTemplate: TListView;
    btnSaveAs: TButton;
    btnCancel: TButton;
    pnlScenario: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lblScenarioName: TLabel;
    rgfOrCe: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure lvOverlayTemplateSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    function RecordToFileStream(fFile: String): Boolean;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OverlayDefinition : TRecOverlay_Definition;
    StateOverlay : Integer;
    OverlayIndex : Integer;
    ForceScn : Integer;
    stateSave : Byte; {0: save to database; 1: save to scenario}

    procedure RefreshListOverlay;
  end;

var
  frmSaveAsOverlay: TfrmSaveAsOverlay;
  vAppDBSetting         : TDBEditorSetting;
  IdSelectedOverlay : Integer;
  nameSelectedOverlay : string;
  identifierSelectedOverlay : string;


implementation

{$R *.dfm}



procedure TfrmSaveAsOverlay.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSaveAsOverlay.btnSaveAsClick(Sender: TObject);
var
  buttonSelected : Integer;
  ovInScenario : TResource_Allocation;
  ListItem : TListItem;
begin
  with OverlayDefinition do
  begin
    Overlay_Identifier := nameSelectedOverlay;
    Static_Overlay := StateOverlay;
    Overlay_Filename := nameSelectedOverlay;
    Game_Area_Index := simMgrClient.GameEnvironment.FGameArea.Game_Area_Index ;
    case rgfOrCe.ItemIndex of
      0 : ForceScn := 3; //blue
      1 : ForceScn := 1; //red
      2 : ForceScn := 2; //yellow
      3 : ForceScn := 4; //green
      4 : ForceScn := 5; //no force
      5 : ForceScn := 6; //NTDS
    end;
    Force := ForceScn;
  end;

  if lvOverlayTemplate.ItemIndex <> -1 then
  begin
    if dmTTT.checkOverlayName(nameSelectedOverlay) then
    begin
      if RecordToFileStream(vMapSetting.OverlayDestination + '\' + nameSelectedOverlay + '.dat') then
      begin
        dmTTT.insertOverlay_Definition(OverlayDefinition);

        case stateSave of
        0 :
          begin
            if dmTTT.checkOverlayName(nameSelectedOverlay)then
              showmessage('Data cannt be insert to Database')
            else
            begin
              showmessage('Data  has been saved in Database');
              btnCancel.Caption := 'Close';
            end;
          end;
        1 :
        end;
      end;
    end
    else
    begin
      showmessage('Please use another name');
      Exit;
    end;

    case stateSave of
      0 : Exit;
      1 :
        begin
          OverlayIndex := dmTTT.getOverlayIndex(identifierSelectedOverlay,StateOverlay);
          with ovInScenario do
          begin
            FData.Resource_Alloc_Index := simMgrClient.Scenario.ResourceAllocIndex ;
            FOverlay.Overlay_Index := OverlayIndex;
            FOverlay.Force := ForceScn;
          end;
          dmTTT.insert_Resource_Overlay_Mapping(ovInScenario);

          if dmTTT.checkOverlayNameScenario(OverlayIndex)then
            showmessage('Data cannt be insert to Scenario')
          else
          begin
            showmessage('Data has been saved in Scenario');
            btnCancel.Caption := 'Close';
          end;
        end;
    end;
  end;
end;

procedure TfrmSaveAsOverlay.FormShow(Sender: TObject);
begin
  case stateSave of
    0:
    begin
      frmSaveAsOverlay.Caption := 'Save As Overlay to Database';
      pnlScenario.Visible := False;
      lvOverlayTemplate.Height := 277;
    end;
    1:
    begin
      frmSaveAsOverlay.Caption := 'Save As Overlay to Scenario';
      pnlScenario.Visible := True;
      lvOverlayTemplate.Height := 174;
      lblScenarioName.Caption := simMgrClient.Scenario.ScenarioName;
    end;
  end;
  RefreshListOverlay;
  btnSaveAs.Enabled := False;
  btnCancel.Caption := 'Cancel';
end;

procedure TfrmSaveAsOverlay.lvOverlayTemplateSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
var
  li : TListItem;
  i,j : Integer;
  overlayTemplate, overlaySelected : TMainOverlayTemplate;
  force : string;
  nameTemplate : string;
begin

  if Selected  then
  begin
    li := lvOverlayTemplate.Items[lvOverlayTemplate.Selected.Index];
    identifierSelectedOverlay := li.SubItems[0];
    nameSelectedOverlay := identifierSelectedOverlay;

    if li.SubItems[1] = 'Dynamic' then
      StateOverlay := 0
    else
      StateOverlay := 1;

    lvTemplateOriginal := TListView.Create(self);
    lvTemplateOriginal.Parent := Self;
    lvTemplateOriginal.Visible := False;

    for I := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
    begin
      OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];
      with lvTemplateOriginal.Items.Add do
      begin
        Caption := IntToStr(i) ;
        SubItems.Add(OverlayTemplate.Name);
        if OverlayTemplate.Tipe = 0 then
          SubItems.Add('Dynamic')
        else
          SubItems.Add('Static');

        case OverlayTemplate.force of
          1 : force := 'Red';
          2 : force := 'Yellow';
          3 : force := 'Blue';
          4 : force := 'Green';
          5 : force := 'No Force';
          6 : force := 'NTDS';
        end;
        SubItems.Add(force);
      end;
    end;

    nameTemplate := lvOverlayTemplate.Selected.SubItems[0];

    for I := 0 to lvTemplateOriginal.Items.Count - 1 do
    begin
      nameSelectedOverlay  := lvTemplateOriginal.Items[i].SubItems[0];
      if nameSelectedOverlay  =  nameTemplate then
      begin
        IdSelectedOverlay  := i;
        Break;
      end;
    end;

    overlaySelected := simMgrClient.SimOverlayTemplate.FList.Items[IdSelectedOverlay];
    btnSaveAs.Enabled := True;
  end
  else
  begin
//    Showmessage('Please choice ');
    btnSaveAs.Enabled := False;
  end;
end;

function TfrmSaveAsOverlay.RecordToFileStream(fFile: String): Boolean;
 var
     Fs : TFileStream;
begin
  Result := True;
  try
    Fs := TFileStream.Create(fFile, fmOPENWRITE or fmCREATE);
    case StateOverlay of
        0 : simMgrClient.SimOverlayTemplate.SaveStreamDataDynamic(Fs,IdSelectedOverlay );
        1 : simMgrClient.SimOverlayTemplate.SaveStreamDataStatic(Fs,IdSelectedOverlay);
    end;
  except
     Showmessage('Couldn''t save file overlay!' + #13);
     Result := False;
  end;
  Fs.Free;  // << this actually writes the data to disk
end;

procedure TfrmSaveAsOverlay.RefreshListOverlay;
var
  i : Integer;
  OverlayTemplate : TMainOverlayTemplate;
begin
  lvOverlaytemplate.Items.Clear;

  for i := 0 to simMgrClient.SimOverlayTemplate.FList.Count - 1 do
  begin
    OverlayTemplate := simMgrClient.SimOverlayTemplate.FList.Items[i];

    with lvOverlaytemplate.Items.Add do
    begin
      SubItems.Add(OverlayTemplate.Name);
      if OverlayTemplate.Tipe = 0 then
        SubItems.Add('Dynamic')
      else
        SubItems.Add('Static');
    end;
  end;

  lvOverlaytemplate.Items.BeginUpdate;
  try
   for i := 0 to lvOverlaytemplate.Items.Count-1 do
     lvOverlaytemplate.Items.Item[i].Caption:=IntToStr(i+1);
  finally
    lvOverlaytemplate.Items.EndUpdate;
  end;
end;

end.
