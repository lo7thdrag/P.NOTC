unit uEnvironmentSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfEnvironmentSelect = class(TForm)
    lbEnvironmentAvailable: TListBox;
    lbEnvironmentSelect: TListBox;
    btnAdd: TButton;
    btnRemove: TButton;
    shp1: TShape;
    btnOk: TButton;
    btnCancel: TButton;
    lbtempIDEnvi: TListBox;
    btNew: TButton;
    btCopy: TButton;
    btEdit: TButton;
    lbTempIdArea: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure getEnvi;
    procedure lbEnvironmentAvailableDblClick(Sender: TObject);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
  private
    { Private declarations }
    procedure getEnvironmentData;
  public
    { Public declarations }
    idArea  : string;
    pList,aList : TList;
    fromRA  : boolean;
  end;

var
  fEnvironmentSelect: TfEnvironmentSelect;



implementation

uses uSimDBEditor,uDBAsset_GameEnvironment,ufrmSummaryResourceAllocation, ufrmSummaryEnvironment,
ufrmAvailableEnvironment, uEnvironmentCharacteristicsWindow;

{$R *.dfm}

procedure TfEnvironmentSelect.btCopyClick(Sender: TObject);
begin
  idArea := lbtempIdArea.Items.Strings[lbEnvironmentAvailable.ItemIndex];
  frmSummaryEnvironment.isCopy := True;
  fromRA  := True;
  getEnvironmentData;
end;

procedure TfEnvironmentSelect.btEditClick(Sender: TObject);
begin
  idArea := lbTempIdArea.Items.Strings[lbEnvironmentAvailable.ItemIndex];
  frmSummaryEnvironment.isCopy := False;
  frmSummaryEnvironment.isNew  := False;
  fromRA  := True;
  getEnvironmentData;
end;

procedure TfEnvironmentSelect.btnAddClick(Sender: TObject);

begin
  if lbEnvironmentAvailable.ItemIndex <> -1 then
  begin
    frmSummaryResourceAllocation.idEnvi := lbtempIDEnvi.Items.Strings[lbEnvironmentAvailable.ItemIndex];

    getEnvi;
  end;
end;

procedure TfEnvironmentSelect.getEnvironmentData;
begin
  with frmSummaryEnvironment do begin
    isNew := false;
   // id_area  := lbTempidArea.Items.Strings[lbEnvironmentList.ItemIndex];
    id_game_area := fEnvironmentSelect.idArea;
    envi_id  := lbtempIDEnvi.Items.Strings[lbEnvironmentAvailable.ItemIndex];
    if fEnvironmentSelect.idArea <> '' then
    begin
       getGameArea(id_game_area,fEnvironmentSelect.pList,EnvironmentCharacteristicsWindowForm.GameEnviroDef);
       if isCopy then
          edtName.Text := 'Copy of ' + fEnvironmentSelect.lbEnvironmentAvailable.Items.Strings[fEnvironmentSelect.lbEnvironmentAvailable.ItemIndex]
       else
          edtName.Text := fEnvironmentSelect.lbEnvironmentAvailable.Items.Strings[fEnvironmentSelect.lbEnvironmentAvailable.ItemIndex];

    end;
    edtArea.Text := EnvironmentCharacteristicsWindowForm.GameEnviroDef.FGameArea.Game_Area_Identifier;
    ShowModal;
    getEnvironment;
  end;
  getEnvi;
end;


procedure TfEnvironmentSelect.lbEnvironmentAvailableDblClick(Sender: TObject);
begin
  btnAdd.Click;
end;

procedure TfEnvironmentSelect.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfEnvironmentSelect.btNewClick(Sender: TObject);
begin
  fromRA  := True;
  frmSummaryEnvironment.isNew := true;
  frmSummaryEnvironment.envi_id := IntToStr(622);
  frmSummaryEnvironment.getEnvironment;
  frmSummaryEnvironment.edtName.Text := '[Unnamed]';
  frmSummaryEnvironment.edtArea.Text := '[None]';
  frmSummaryEnvironment.btnEditCharacteristics.Enabled := false;
  frmSummaryEnvironment.ShowModal;
end;

procedure TfEnvironmentSelect.btnOkClick(Sender: TObject);
begin
  if lbEnvironmentSelect.Count <> 0 then
    frmSummaryResourceAllocation.edtEnvironment.Text := lbEnvironmentSelect.Items[0]
  else frmSummaryResourceAllocation.edtEnvironment.Text := '[None]';
 close;
end;

procedure TfEnvironmentSelect.btnRemoveClick(Sender: TObject);

begin
  if lbEnvironmentSelect.ItemIndex <> -1 then
  begin
    frmSummaryResourceAllocation.idEnvi := '';
    getEnvi;
  end;
end;

procedure TfEnvironmentSelect.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
if GetKeyState(VK_ESCAPE)< 0 then
  begin
    case Msg.CharCode of
     VK_ESCAPE:
     begin
       btnOk.Click;
     end;
    end;
  end;
end;

procedure TfEnvironmentSelect.FormShow(Sender: TObject);

begin
  pList := Tlist.Create;
  getEnvi;
end;

procedure TfEnvironmentSelect.getEnvi;
var i:integer;
begin
//get all environment name
 uSimDBEditor.getEnvironments(pList);

 lbEnvironmentAvailable.Items.Clear;
 lbtempIDEnvi.Items.Clear;
 lbTempIdArea.Items.Clear;
 lbEnvironmentSelect.Items.Clear;

 for I := 0 to pList.Count - 1 do
 begin
  if frmSummaryResourceAllocation.idEnvi = IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index) then
    lbEnvironmentSelect.Items.Add(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier)
  else
  begin
    lbEnvironmentAvailable.Items.Add(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Identifier);
    lbtempIDEnvi.Items.Add(inttostr(TGame_Environment_Definition(pList[i]).FData.Game_Enviro_Index));
    lbTempIdArea.Items.Add(IntToStr(TGame_Environment_Definition(pList[i]).FData.Game_Area_Index));
  end;
  end;
end;



end.
