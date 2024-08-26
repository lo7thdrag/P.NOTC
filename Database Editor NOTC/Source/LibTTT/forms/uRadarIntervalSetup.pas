unit uRadarIntervalSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, newClassASTT;

type
  TfRadarIntervalSetup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblRadarIntervals: TStaticText;
    cbxRadarIntervals: TComboBox;
    lblNumberOfScans: TStaticText;
    edtNumberOfScans: TEdit;
    lblTimeInterval: TStaticText;
    edtTimeInterval: TEdit;
    lblSeconds: TStaticText;
    btnAdd: TButton;
    ListView1: TListView;
    btnRemove: TButton;
    btnMoveUp: TButton;
    btnMoveDown: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    procedure cbxRadarIntervalsSelect(Sender: TObject);
    procedure comboBehav;
    procedure showData;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure ExchangeItems(lv: TListView; const i, j: Integer);
    procedure btnMoveDownClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure edtNumberOfScansKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumberOfScansKeyPress(Sender: TObject; var Key: Char);
    procedure edtTimeIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure edtTimeIntervalKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumberOfScansKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    radar_def : TRadar_Interval_Definition;
    mList : TList;
  end;

var
  fRadarIntervalSetup: TfRadarIntervalSetup;

implementation

uses uDataModuleTTT, ufrmSummaryRadarIntervalList;

{$R *.dfm}

procedure TfRadarIntervalSetup.btnAddClick(Sender: TObject);
var ListItem: TListItem;
    count:  integer;
begin
  count := ListView1.GetCount;
  ListItem := ListView1.Items.Add;
  ListItem.Caption := IntToStr(count+1);
  if cbxRadarIntervals.ItemIndex = 0 then
  begin
    ListItem.SubItems.Add('On');
    ListItem.SubItems.Add(edtNumberOfScans.Text);
    ListItem.SubItems.Add('-');
  end
  else begin
    ListItem.SubItems.Add('Off');
    ListItem.SubItems.Add('-');
    ListItem.SubItems.Add(edtTimeInterval.Text);
  end;
  ListView1.Items.Item[0].Selected  := true;
end;

procedure TfRadarIntervalSetup.btnApplyClick(Sender: TObject);
var
  I: Integer;
  ListItem: TListItem;
begin
  radar_def.FData.Interval_List_Index := frmSummaryRadarIntervalList.id_radar;
  dmTTT.DeleteRadar_Interval_Def(radar_def.FData.Interval_List_Index);
  for I := 0 to ListView1.GetCount - 1 do
  begin
    ListItem := ListView1.Items.Item[I];
    with radar_def.FData do
    begin
      Priority := StrToInt(ListItem.Caption);
      if ListItem.SubItems.Strings[0] = 'On' then
        Radar_State := 1
      else Radar_State := 0;
      if ListItem.SubItems.Strings[1] <> '-' then
        Num_Scans := StrToInt(ListItem.SubItems.Strings[1])
      else Num_Scans  := 1;
      if ListItem.SubItems.Strings[2] <> '-' then
        Radar_Off_Time  := StrToInt(ListItem.SubItems.Strings[2])
      else Radar_Off_Time  := 1;
    end;
    dmTTT.insertRadar_Interval_Def(radar_def);
  end;
end;

procedure TfRadarIntervalSetup.btnCancelClick(Sender: TObject);
var buttonSelected : Integer;
begin
  buttonSelected := MessageDlg('Your editing will not be saved if you choose the Cancel Button '+
  'and close this form.'+#13#10+'Are you sure you want to close this form?', mtWarning, mbYesNoCancel, 0);

  if buttonSelected = mrYes then Close;
end;

procedure TfRadarIntervalSetup.btnMoveDownClick(Sender: TObject);
var d : integer;
begin
  d := ListView1.Selected.Index;
  ExchangeItems(ListView1,d,d+1);
  ListView1.Items.Item[d+1].Selected := true;
end;

procedure TfRadarIntervalSetup.btnMoveUpClick(Sender: TObject);
var u : integer;
begin
  u := ListView1.Selected.Index;
  ExchangeItems(ListView1,u,u-1);
  ListView1.Items.Item[u-1].Selected := true;
end;

procedure TfRadarIntervalSetup.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TfRadarIntervalSetup.btnRemoveClick(Sender: TObject);
var
  I: Integer;
begin
  ListView1.DeleteSelected;
  for I := 0 to ListView1.GetCount - 1 do
    ListView1.Items.Item[I].Caption := IntToStr(I+1);
  if ListView1.GetCount > 0 then ListView1.Items.Item[0].Selected := true;
end;

procedure TfRadarIntervalSetup.ExchangeItems(lv: TListView; const i, j: Integer);
var
  tempLI: TListItem;
  no: string;
begin
  lv.Items.BeginUpdate;
  try
    tempLI := TListItem.Create(lv.Items);
    tempLI.Assign(lv.Items.Item[i]);
    no  := lv.Items.Item[j].Caption;
    lv.Items.Item[i].Assign(lv.Items.Item[j]);
    lv.Items.Item[i].Caption := tempLI.Caption;
    lv.Items.Item[j].Assign(tempLI);
    lv.Items.Item[j].Caption := no;
    tempLI.Free;
  finally
    lv.Items.EndUpdate
  end;
end;

procedure TfRadarIntervalSetup.cbxRadarIntervalsSelect(Sender: TObject);
begin
  comboBehav;
end;

procedure TfRadarIntervalSetup.comboBehav;
begin
  if cbxRadarIntervals.ItemIndex = 0 then
  begin
    edtNumberOfScans.Text     := '1';
    edtNumberOfScans.Enabled  := true;
    lblNumberOfScans.Enabled  := true;
    edtTimeInterval.Text      := '1';
    edtTimeInterval.Enabled   := false;
    lblTimeInterval.Enabled   := false;
    lblSeconds.Enabled        := false;
  end
  else if cbxRadarIntervals.ItemIndex = 1 then
  begin
    edtNumberOfScans.Text     := '1';
    edtNumberOfScans.Enabled  := false;
    lblNumberOfScans.Enabled  := false;
    edtTimeInterval.Text      := '1';
    edtTimeInterval.Enabled   := true;
    lblTimeInterval.Enabled   := true;
    lblSeconds.Enabled        := true;
  end;
end;

procedure TfRadarIntervalSetup.edtNumberOfScansKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  tmpFloat : Double;
begin

//  if not (Key in[#48 .. #57, #8, #13, #46]) then
//    Key := #0;
//
//  if key = #13 then
//    edtNumberOfScans.Text := FormatFloat('0.00', StrToFloat(edtNumberOfScans.Text));
end;

procedure TfRadarIntervalSetup.edtNumberOfScansKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtNumberOfScans.Text := FormatFloat('0.00', StrToFloat(edtNumberOfScans.Text));
end;

procedure TfRadarIntervalSetup.edtNumberOfScansKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtNumberOfScans.Text = '' then
    Exit;

   if (StrToFloat(edtNumberOfScans.Text) > 4500)  then
    begin
      ShowMessage('Incorrect value');
      edtNumberOfScans.Text := '4500';
    //  edtNumberOfScans.Text := FormatFloat('0.00', StrToFloat(edtNumberOfScans.Text));
    end;
end;

procedure TfRadarIntervalSetup.edtTimeIntervalKeyPress(Sender: TObject;
  var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtTimeInterval.Text := FormatFloat('0.00', StrToFloat(edtTimeInterval.Text));
end;

procedure TfRadarIntervalSetup.edtTimeIntervalKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if edtTimeInterval.Text = '' then
    Exit;

   if (StrToFloat(edtTimeInterval.Text) > 4350)  then
    begin
      ShowMessage('Incorrect value');
      edtTimeInterval.Text := '4350';
    //  edtTimeInterval.Text := FormatFloat('0.00', StrToFloat(edtTimeInterval.Text));
    end;
end;

procedure TfRadarIntervalSetup.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
  radar_def := TRadar_Interval_Definition.Create;
  cbxRadarIntervals.ItemIndex := 0;
  comboBehav;
end;


procedure TfRadarIntervalSetup.FormShow(Sender: TObject);
begin
  fRadarIntervalSetup.Caption := frmSummaryRadarIntervalList.radar_interval.FData.Interval_List_Identifier;
  btnMoveUp.Enabled   := false;
  btnMoveDown.Enabled := false;
  showData;
end;

procedure TfRadarIntervalSetup.showData;
var ListItem: TListItem;
    I : Integer;
begin
  mList.Clear;
  ListView1.Clear;
  dmTTT.GetRadar_Interval_Def(frmSummaryRadarIntervalList.id_radar,mList,radar_def);
  for I := 0 to mList.Count - 1 do
  begin
    ListItem := ListView1.Items.Add;
    ListItem.Caption := IntToStr(I+1);
    if TRadar_Interval_Definition(mList[I]).FData.Radar_State = 1 then
    begin
      ListItem.SubItems.Add('On');
      ListItem.SubItems.Add(IntToStr(TRadar_Interval_Definition(mList[I]).FData.Num_Scans));
      ListItem.SubItems.Add('-');
    end
    else begin
      ListItem.SubItems.Add('Off');
      ListItem.SubItems.Add('-');
      ListItem.SubItems.Add(IntToStr(TRadar_Interval_Definition(mList[I]).FData.Radar_Off_Time));
    end;
  end;
  if mList.Count > 0 then ListView1.Items.Item[0].Selected := true;
end;

procedure TfRadarIntervalSetup.ListView1Click(Sender: TObject);
begin
  if ListView1.ItemIndex = -1 then
  begin
    btnMoveUp.Enabled   := false;
    btnMoveDown.Enabled := false;
  end;
end;

procedure TfRadarIntervalSetup.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  if Item.Index = ListView1.GetCount-1 then
  begin
    btnMoveUp.Enabled   := true;
    btnMoveDown.Enabled := false;
  end
  else if Item.Index = 0 then
  begin
    btnMoveUp.Enabled   := false;
    btnMoveDown.Enabled := true;
  end
  else
  begin
    btnMoveUp.Enabled   := true;
    btnMoveDown.Enabled := true;
  end;
end;

end.
