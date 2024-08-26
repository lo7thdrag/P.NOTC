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
  uSatellitePlatform, uSimDBEditor;
{$R *.dfm}

procedure TSatelliteListForm.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TSatelliteListForm.btCopyClick(Sender: TObject);
begin
  SatellitePlatformForm.isCopy := True;
  getDataSatellite;
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

procedure TSatelliteListForm.btnEditClick(Sender: TObject);
begin
  SatellitePlatformForm.isCopy := False;
  getDataSatellite;
end;

procedure TSatelliteListForm.btnNewClick(Sender: TObject);
begin

  with SatellitePlatformForm do
  begin
    isNew := true;
    edtClass.Text := '';
    edtDetectionRangeRadius.Text := '';
    edtAltitude.Text := '';
    edtGameArea.Text := '';
    edtGroundSpeed.Text := '';
    edtLength.Text := '';
    edtWidth.Text := '';
    edtFront.Text := '';
    edtSide.Text := '';
    cbPlatformType.Checked := false;
    cbPlatformClass.Checked := false;
    Show;
  end;
end;

procedure TSatelliteListForm.btRemoveClick(Sender: TObject);
begin
  if lbSatellites.Selected[lbSatellites.ItemIndex] then
  begin
    uSimDBEditor.deleteSatellite_Def(StrToInt(lbIdSatellites.Items.Strings[lbSatellites.ItemIndex]));
  end;
  refresh;
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
