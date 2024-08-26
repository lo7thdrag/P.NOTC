unit uChooseMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_GameEnvironment, uENCSelect,
  uCoordConvertor, uMLayerSelect;

type
  TChooseMap = class(TForm)
    grbDepthContours: TGroupBox;
    cbENC: TCheckBox;
    cbVektorMap: TCheckBox;
    btnOk: TButton;
    btnCancel: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure cbENCClick(Sender: TObject);
    procedure cbVektorMapClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setZoomENC();
  end;

var
  ChooseMap: TChooseMap;

implementation

uses
uDBEditSetting, uExerciseArea, ufrmAvailableGameArea;

{$R *.dfm}

procedure TChooseMap.btnCancelClick(Sender: TObject);
begin
   self.Close;
end;

procedure TChooseMap.cbENCClick(Sender: TObject);
begin
//   if cbENC.Checked then
//   begin
//      cbVektorMap.Checked := false;
//      cbVektorMap.Enabled := false;
//   end
//   else
//   begin
//      cbVektorMap.Checked := true;
//      cbVektorMap.Enabled := true;
//   end;

   if cbENC.Checked then
      cbVektorMap.Checked := false
   else
      cbVektorMap.Checked := true;

end;

procedure TChooseMap.cbVektorMapClick(Sender: TObject);
begin
//   if cbVektorMap.Checked then
//   begin
//      cbENC.Checked := false;
//      cbENC.Enabled := false;
//   end
//   else
//   begin
//      cbENC.Checked := true;
//      cbENC.Enabled := true;
//   end;

   if cbVektorMap.Checked then
      cbENC.Checked := false
   else
      cbENC.Checked := true;
end;

procedure TChooseMap.FormShow(Sender: TObject);
begin
//  if ufrmAvailableGameArea.frmAvailableGameArea.flagIsNew then
//  begin
//      cbENC.Checked := false;
//      cbVektorMap.Checked := false;
//      cbENC.Enabled := true;
//      cbVektorMap.Enabled := true;
//  end;
end;

procedure TChooseMap.setZoomENC();
var
   limitWidth : Array[0..15] of double;
   arrayTemp : Array[0..30] of double;
   arrayStringTemp : Array[0..30] of String;
   resultTemp : Array[0..30] of String;
   a, b : integer;
   widthNM : integer;
begin
  //isi combo box
  uENCSelect.ENCSelect.cbSetScale.Clear;
  uMLayerSelect.MLayerSelect.cbbSetScale.Clear;

  //widthNM := strtoint(ExerciseAreaForm.edtMaximum.Text);
  widthNM := 2500;

  limitWidth[0] := 0.125;
  limitWidth[1] := 0.25;
  limitWidth[2] := 0.5;
  limitWidth[3] := 1;
  limitWidth[4] := 2;
  limitWidth[5] := 4;
  limitWidth[6] := 8;
  limitWidth[7] := 16;
  limitWidth[8] := 32;
  limitWidth[9] := 64;
  limitWidth[10] := 128;
  limitWidth[11] := 256;
  limitWidth[12] := 512;
  limitWidth[13] := 1024;
  limitWidth[14] := 2048;
  limitWidth[15] := 2500;

  a := 0;
  while limitWidth[a] < widthNm do
  begin
    arrayTemp[a] := limitWidth[a];
    a := a+1;
  end;
  arrayTemp[a] := widthNm;

  for b := 0 to a do
      arrayStringTemp[b] := floattostr(arrayTemp[b]);

  for b := 0 to a do
  begin
      resultTemp[b] := arrayStringTemp[b];
      ENCSelect.cbSetScale.Items.Add(resultTemp[b]);
      MLayerSelect.cbbSetScale.Items.Add(resultTemp[b]);
  end;
end;

procedure TChooseMap.btnOkClick(Sender: TObject);
var
     ENCGeoset : string;

begin
  if cbENC.Checked then
  begin
     ENCSelect.ENCmap.Geoset := '';
//     ENCGeoset := 'M:\mapsource\coverage\AreaCoverage.gst';
     ENCGeoset := vAppDBSetting.MapSourceGeosetENC;
     ENCSelect.LoadENC(ENCGeoset);
     setZoomENC;
     ENCSelect.edtName.Text := '(noname)';
//     for I := 0 to ENCSelect.areaList.Count - 1 do
//     begin
//         ENCselect.areaList.Checked[I] := false;
//     end;

     ENCSelect.ShowModal;
  end
  else if cbVektorMap.Checked then
  begin
     with ExerciseAreaForm do
     begin
        edtName.Text      := '(Noname)';
        edtLatitude.Text  := '00° 00.000'''+' N';
        edtLongitude.Text := '000° 00.000'''+' E';
        edtMaximum.Text   := '1000';
     end;
     ExerciseAreaForm.isNew := true;
     ExerciseAreaForm.cbUseCoastlines.Enabled := false;
     ExerciseAreaForm.cbUseCoastlines.Checked := false;
     ExerciseAreaForm.btnSelectGame.Enabled := true;
     ExerciseAreaForm.ShowModal;
  end
  else
     ShowMessage('Please, Choose One');

  self.Close;
end;

end.
