unit uSelectRecipient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  uSimMgr_Client, uDBCubicles;

type
  TfSelectRecipient = class(TForm)
    lblNameRecipient: TLabel;
    edtNameRecipient: TEdit;
    lvName: TListView;
    lvTo: TListView;
    lvInfo: TListView;
    lblTo: TLabel;
    lblInfo: TLabel;
    btnAddTo: TButton;
    btnRemoveTo: TButton;
    btnAddInfo: TButton;
    btnRemoveInfo: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAddToClick(Sender: TObject);
    procedure btnRemoveToClick(Sender: TObject);
    procedure btnAddInfoClick(Sender: TObject);
    procedure btnRemoveInfoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    ToInfoCub : string;

    ToCub : TStrings;
    InfoCub : Tstrings;
    { Private declarations }
  public
    SendTo : string;
    SendInfo : string;
    { Public declarations }
  end;

var
  fSelectRecipient: TfSelectRecipient;

implementation

uses uNewMessage, ufToteDisplay;

{$R *.dfm}

procedure TfSelectRecipient.btnAddInfoClick(Sender: TObject);
var
  p : integer;
  isSelected : Boolean;
  i: Integer;
begin
  repeat
    isselected:= false;
    p:= 0;

    for i := 0 to lvName.Items.Count - 1 do
    begin
      if lvName.Items[i].Selected then
      begin
        p:= i;
        isselected:= lvName.Items[i].Selected;
        Break;
      end;
    end;

    if isSelected then
    begin
      with lvInfo.Items.Add do
      begin
        Caption := lvName.Items[p].Caption;
      end;

      lvName.Items.Delete(p);
    end;
  until
  not isselected;
end;

procedure TfSelectRecipient.btnAddToClick(Sender: TObject);
var
  i, p : integer;
  isselected: Boolean;
begin
  repeat
    isselected := false;
    p:= 0;

    for i := 0 to lvName.Items.Count - 1 do
    begin
      if lvName.Items[i].Selected then
      begin
        p:= i;
        isselected:= lvName.Items[i].Selected;
        Break;
      end;
    end;

    if isselected then
    begin
      with lvTo.Items.Add do
      begin
        Caption := lvName.Items[p].Caption;
      end;

      lvName.Items.Delete(p);
    end;
  until
  not isselected;
end;

procedure TfSelectRecipient.btnRemoveInfoClick(Sender: TObject);
var
  ii, p : integer;
  isselected: Boolean;
begin
  repeat
    isselected:= false;
    p := -1;

    for ii := 0 to lvInfo.Items.Count - 1 do
    begin
      if lvInfo.Items[ii].Selected then
      begin
        p:= ii;
        isselected:= lvInfo.Items[ii].Selected;
        Break;
      end;
    end;

    if isselected then
    begin
      with lvName.Items.Add do
      begin
        Caption := lvInfo.Items[p].Caption;
      end;

      lvInfo.Items.Delete(p);
    end;
  until not isselected;
end;

procedure TfSelectRecipient.btnRemoveToClick(Sender: TObject);
var
  ii, p : integer;
  isselected: Boolean;
begin
  repeat
    isselected:= false;
    p := -1;

    for ii := 0 to lvTo.Items.Count - 1 do
    begin
      if lvTo.Items[ii].Selected then
      begin
        p:= ii;
        isselected:= lvTo.Items[ii].Selected;
        Break;
      end;
    end;

    if isselected then
    begin
      with lvName.Items.Add do
      begin
        Caption := lvTo.Items[p].Caption;
      end;

      lvTo.Items.Delete(p);
    end;

  until not isselected;
end;

procedure TfSelectRecipient.btnCancelClick(Sender: TObject);
begin
  if Assigned(fNewMessage) then begin
    fNewMessage.edtTo.Text := '';
    fNewMessage.edtInfo.Text := '';
  end;

  Close;
end;

procedure TfSelectRecipient.btnOkClick(Sender: TObject);
var
  i : Integer;
begin
  SendTo := '';
  SendInfo := '';

  ToCub.Clear;
  InfoCub.Clear;

  for i := 0 to lvTo.Items.Count - 1 do
  begin
    ToCub.Add(lvTo.Items[i].Caption);
  end;

  for i := 0 to lvInfo.Items.Count - 1 do
  begin
    InfoCub.Add(lvInfo.Items[i].Caption);
  end;

  SendTo := ToCub.DelimitedText;
  SendInfo := InfoCub.DelimitedText;

  if Assigned(fNewMessage) then begin
    fNewMessage.ToCub         := Tocub;
    fNewMessage.InfoCub       := InfoCub;
    fNewMessage.edtTo.Text    := SendTo;
    fNewMessage.edtInfo.Text  := SendInfo;
  end;

  Close;
end;


procedure TfSelectRecipient.FormCreate(Sender: TObject);
begin
  ToCub := TStringList.Create;
  ToCub.Delimiter := ';';
  InfoCub := TStringList.Create;
  InfoCub.Delimiter := ';';

  ToInfoCub := '';
end;

procedure TfSelectRecipient.FormShow(Sender: TObject);
var
  i : Integer;
  grp : T3CubicleGroup;
  cubForce : Byte;
begin
  edtNameRecipient.Text := '';
  cubForce := simMgrClient.FMyCubGroup.FData.Force_Designation;

  lvName.Items.Clear;
  lvTo.Items.Clear;
  lvInfo.Items.Clear;

  with lvName.Items.Add do
  begin
    Caption := 'Controller';
  end;

  for i := 0 to simMgrClient.Scenario.CubiclesGroupsListFromDB.Count - 1 do
  begin
    grp := simMgrClient.Scenario.CubiclesGroupsListFromDB.Items[i] as T3CubicleGroup;
    if grp = nil then
      continue;

    if LowerCase(grp.FData.Group_Identifier) = 'controller' then
      Continue;

    if not simMgrClient.ISInstructor or not simMgrClient.ISWasdal then
    begin
      if grp.FData.Force_Designation <> cubForce then  Continue;
      if grp.FData.Group_Index = simMgrClient.FMyCubGroup.FData.Group_Index then Continue;
    end;

    with lvName.Items.Add do
    begin
      Caption := grp.FData.Group_Identifier;
    end;
  end;
end;

end.
