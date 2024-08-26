unit uSatelliteList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uDBAsset_Satellite;

type
  TSatelliteListForm = class(TForm)
    lbSatellites: TListBox;
    btnNew: TButton;
    btnEdit: TButton;
    lbIdSatellites: TListBox;
    btClose: TButton;
    btCopy: TButton;
    btFilter: TButton;
    btRemove: TButton;
    btUsage: TButton;
    procedure FormShow(Sender: TObject);
    procedure refresh;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btUsageClick(Sender: TObject);
    procedure lbSatellitesDblClick(Sender: TObject);
  private
    { Private declarations }
    satellite : TSatellite_Definition;
    procedure getDataSatellite;
  public
    { Public declarations }
    idSatelliteSelected: Integer;
    sList: TList;
  end;

var
  SatelliteListForm: TSatelliteListForm;

implementation

uses
  uSatellitePlatform, uSimDBEditor, ufrmUsage;
{$R *.dfm}

procedure TSatelliteListForm.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSatelliteListForm.btCopyClick(Sender: TObject);
begin
  if lbSatellites.ItemIndex = -1 then
  begin
    ShowMessage('Select Satellites List first');
    Exit;
  end;

  SatellitePlatformForm.isCopy := True;
  getDataSatellite;
  SatellitePlatformForm.Show;
end;

procedure TSatelliteListForm.getDataSatellite;
begin
  if lbSatellites.Selected[lbSatellites.ItemIndex] then
  begin
    with SIMMgr do
    begin
      getSatellite_Definition(StrToInt(lbIdSatellites.Items.Strings[lbSatellites.ItemIndex]), SatellitePlatformForm.satelliteObject);
    end;
    SatellitePlatformForm.refresh;
  end;
end;

procedure TSatelliteListForm.lbSatellitesDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TSatelliteListForm.btnEditClick(Sender: TObject);
begin
  if lbSatellites.ItemIndex = -1 then
  begin
    ShowMessage('Select Satellites List first');
    Exit;
  end;

  SatellitePlatformForm.isCopy := False;
  getDataSatellite;
  SatellitePlatformForm.General.PageControl.ActivePageIndex := 0;
end;

procedure TSatelliteListForm.btnNewClick(Sender: TObject);
begin

  with SatellitePlatformForm do
  begin
    isNew := true;
    edtClass.Text := '[None]';
    edtDetectionRangeRadius.Text := '0';
    edtAltitude.Text := '0';
    edtGameArea.Text := '0';
    edtGroundSpeed.Text := '0';

    edtLength.Text := '0';
    edtWidth.Text := '0';
    edtFront.Text := '0';
    edtHeight.Text := '0';
    edtSide.Text := '0';

    cbPlatformType.Checked := false;
    cbPlatformClass.Checked := false;

    mmNotes.Clear;

    satelliteObject := TSatellite_Definition.Create;

    ShowModal;
  end;
end;

procedure TSatelliteListForm.btRemoveClick(Sender: TObject);
var warning: integer;
begin
  if lbSatellites.ItemIndex = -1 then
  begin
    ShowMessage('Select Satellites List first');
    Exit;
  end;

  if lbSatellites.Selected[lbSatellites.ItemIndex] then
  begin
    warning := MessageDlg('Are you sure you want to delete this item?',mtConfirmation,mbOKCancel,0);
    if warning = mrOK then
    begin
      try
        uSimDBEditor.deleteSatellite_Def(StrToInt(lbIdSatellites.Items.Strings[lbSatellites.ItemIndex]));
      except
          if lbSatellites.ItemIndex <> -1 then begin
            with frmUsage do begin
                UId := StrToInt(lbIdSatellites.Items.Strings[lbSatellites.ItemIndex]);
                name_usage  := lbSatellites.Items.Strings[lbSatellites.ItemIndex];
                UIndex  := 31;
                usage_title := 'Platform Instance in Resource Allocation:';
                ShowModal;
            end;
          end;
      end;
    end;
  end;
  refresh;
end;

procedure TSatelliteListForm.btUsageClick(Sender: TObject);
begin
  if lbSatellites.ItemIndex <> -1 then begin
    with frmUsage do begin
      UId := StrToInt(lbIdSatellites.Items.Strings[lbSatellites.ItemIndex]);
      name_usage  := lbSatellites.Items.Strings[lbSatellites.ItemIndex];
      UIndex  := 31;
      usage_title := 'Platform Instance in Resource Allocation:';
      ShowModal;
    end;
  end
  else
    ShowMessage('Select Satellites List first');
end;

procedure TSatelliteListForm.FormCreate(Sender: TObject);
begin
  sList := TList.Create;
  satellite := TSatellite_Definition.Create;
end;

procedure TSatelliteListForm.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TSatelliteListForm.refresh;
var
  I: Integer;
begin
  uSimDBEditor.getAllSatellite(0,sList,satellite);
  // masukkan nilainya ke List
  lbSatellites.Clear;
  lbIdSatellites.Clear;
  for I := 0 to sList.Count - 1 do
  begin
    lbSatellites.Items.Add(TSatellite_Definition(sList[I])
        .FData.Satellite_Identifier);
    lbIdSatellites.Items.Add(IntToStr(TSatellite_Definition(sList[I])
          .FData.Satellite_Index));
  end;
end;

end.
