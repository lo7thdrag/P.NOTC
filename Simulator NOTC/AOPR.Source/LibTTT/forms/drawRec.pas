unit drawRec;

interface

uses
  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, uCoordConvertor, uMapXHandler,
  uDBAsset_GameEnvironment, StrUtils;

type
  TfEditGameCenter = class(TForm)
    xDegree: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    widthEdit: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    FMap: TMap;
    GroupBox1: TGroupBox;
    apply: TButton;
    yDegree: TEdit;
    btOk: TButton;
    btCancel: TButton;
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Cardinal; const RectFull,
      RectInvalid: IDispatch);
    procedure FormCreate(Sender: TObject);
    procedure FMapClick(Sender: TObject);

    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure FMapMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FMapViewChanged(Sender: TObject);
  private
    { Private declarations }

    FCoordPlatformConv : TCoordConverter;
    FMapPlatform: TSimMap;

    procedure MoveGameCenter(const x, y: integer); overload;
    procedure MoveGameCenter(); overload;
    procedure UpdateGameCenter();
    procedure GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);

  public
    { Public declarations }

    ix, iy, iix, iiy, iXx, iYy : integer;               //point screen pixel
    sx, sy, sx2, sy2, Xx, Yy : single;                  //variabel penampung
    x1, y1, x2, y2 : double;                            //degree -> pojok kiri atas, pojok kanan bawah
    panjang, tinggi : integer;                          //panjang, lebar map
    drawing : boolean;

    move : boolean;

    {}
    GCx, GCy: Double;
    Gwidth  : Double;
    gPoint: TPoint;
    gRect : TRect;
    {}
    FLyrDraw    : CMapXLayer;
    FCanvas     : TCanvas;

    rectangle : TRect;
    xxx,yyy : integer;                                   //screen center point
    x_, y_, width : double;                              //degree center point
    partWidth, partDegree : double;                      //dapatkan selisih
    longsx, longsy : double;
    leftPoint : double;
    leftx, lefty : integer;
    leftsx, leftsy : single;
    selisih : integer;                                   //variable penampung untuk selisih
    x1_, y1_, x2_, y2_ : integer;                        //pojok kiri atas, kanan bawah dalam screen pixel
    singlex, singley : single;

    procedure LoadMap(aGeoset: String);
  end;

var
  fEditGameCenter: TfEditGameCenter;

implementation

uses uBaseCoordSystem, uExerciseArea, Math, uDataModuleTTT;

{$R *.dfm}

procedure InitOleVariant(var TheVar: OleVariant);
begin
  TVarData(TheVar).vType := varError;
  TVarData(TheVar).vError := DISP_E_PARAMNOTFOUND;
end;

procedure TfEditGameCenter.FMapMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState;
    X, Y: Integer) ;
begin
  move := true;
  MoveGameCenter(X, Y);
end;

procedure TfEditGameCenter.FMapMouseMove(Sender: TObject;
    Shift: TShiftState; X,Y: Integer) ;
begin
   if move then
   begin
     MoveGameCenter(X, Y);
   end;
end;

procedure TfEditGameCenter.FMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  move := false;
end;

procedure TfEditGameCenter.LoadMap(aGeoset: String);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if FMap = nil then
    Exit;
  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  FMap.Geoset := aGeoset;

  if aGeoset <> '' then
  begin
    for i := 1 to FMap.Layers.Count do
    begin
      FMap.Layers.Item(i).Selectable := false;
      FMap.Layers.Item(i).Editable  := False;
//      FMap.Layers.Item(i).AutoLabel := True;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'LYR_DRAW');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);

    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.MapUnit := miUnitNauticalMile;
  end;
  //FMap.BackColor := RGB(192, 224, 255);
  FMap.BackColor := RGB(0, 0, 0);
end;

procedure TfEditGameCenter.ApplyClick(Sender: TObject);
var v: Double;
  sub: String;
begin
{
  if TryStrToFloat(formatDMS_long(dmsToLong(xDegree.Text)), v) then
    GCx := v;

  if TryStrToFloat(formatDMS_latt(dmsToLatt(yDegree.Text)), v) then
    GCy := v;
 }

if strtoint(widthEdit.Text) > 2500 then
begin
ShowMessage('Width Must Be Less Than 2500 nm');
widthEdit.Text := '2500';
end
else
begin
  sub := Copy(xDegree.Text, 0, 3);
  if AnsiContainsStr(sub, '°') then
  begin
    if AnsiEndsText('°', sub) then
    begin
      xDegree.Text := Concat('0', xDegree.Text);
    end
    else
      if AnsiStartsText('°', sub) then
      begin
        xDegree.Text := Concat('000', xDegree.Text);
      end
      else
      begin
        xDegree.Text := Concat('00', xDegree.Text);
      end;
    end;

  end;


  GCx := dmToLongitude(xDegree.Text);
  GCy := dmToLatitude(yDegree.Text);

  if TryStrToFloat(widthEdit.Text, v) then
    Gwidth := v / 60.0;

  MoveGameCenter();
  UpdateGameCenter();  //
  FMap.Repaint;
end;

procedure TfEditGameCenter.btCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfEditGameCenter.btOkClick(Sender: TObject);
begin
  if strtoint(widthEdit.Text) > 2500 then ShowMessage('Width Must Be Less Than 2500 nm')
  else
  begin
       
      with ExerciseAreaForm.gameEnv.FGameArea do
      begin
        Game_Centre_Lat          := dmToLatitude(yDegree.Text);
        Game_Centre_Long         := dmToLongitude(xDegree.Text);
        Game_X_Dimension         := StrToFloat(widthEdit.Text);
        Game_Y_Dimension         := StrToFloat(widthEdit.Text);
      end;

      ExerciseAreaForm.edtLongitude.Text := formatDM_longitude(ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Long);   //long
      ExerciseAreaForm.edtLatitude.Text := formatDM_latitude(ExerciseAreaForm.gameEnv.FGameArea.Game_Centre_Lat);   //lat
      ExerciseAreaForm.edtMaximum.Text := FloatToStr(ExerciseAreaForm.gameEnv.FGameArea.Game_Y_Dimension);

      //dmTTT.updateGame_Area_Def(ExerciseAreaForm.gameEnv, IntToStr(ExerciseAreaForm.gameEnv.FGameArea.Game_Area_Index));

      Self.Close;
  end;
end;

procedure TfEditGameCenter.FMapClick(Sender: TObject);
begin
   //
end;

procedure TfEditGameCenter.FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
  hOutputDC, hAttributeDC: Cardinal; const RectFull, RectInvalid: IDispatch);
begin
   if not Assigned(FCanvas) then
    Exit;
    FCanvas.Handle := hOutputDC;

    //FCanvas.Pen.Color := clGreen;
    FCanvas.Pen.Color := RGB(200, 240, 100);
    FCanvas.Pen.Width := 1;

    //FCanvas.Pen.Color := RGB(255, 255, 255);;
    FCanvas.MoveTo(0, gPoint.Y);
    FCanvas.LineTo(FMap.Width, gPoint.Y);

    FCanvas.MoveTo(gPoint.X, 0);
    FCanvas.LineTo(gPoint.X, FMap.Height);

    FCanvas.Pen.Width := 2;
    FCanvas.Pen.Color := RGB(100, 240, 0);
    FCanvas.Brush.Style := bsClear;
    FCanvas.Rectangle(gRect);
    FCanvas.Brush.Style := bsSolid;
    FCanvas.Pen.Width := 2;
    //FCanvas.Pen.Color := 42768;
    //FCanvas.Pen.Color := 32768;
    //FCanvas.Pen.Mode := pmMask;
end;

procedure TfEditGameCenter.FormCreate(Sender: TObject);
begin
    FCanvas := TCanvas.Create;
    FCoordPlatformConv := TCoordConverter.Create;
    //FMapPlatform := TSimMap.Create(FMap);
    FCoordPlatformConv.FMap := FMap;
    //FMapPlatform.LoadMap(ExtractFilePath(Application.ExeName) + 'mapsea\mapdata.gst');
end;

procedure TfEditGameCenter.FormShow(Sender: TObject);
var
   aGeoset : string;
begin
   dmTTT.GetGame_Area_DefByID(ExerciseAreaForm.gameEnv.FData.Game_Area_Index, ExerciseAreaForm.gameEnv);
   aGeoset := ExtractFilePath(Application.ExeName) + 'map\world.gst';
   LoadMap(aGeoset);
end;

procedure TfEditGameCenter.MoveGameCenter(const x, y: integer);
var sx, sy: Single;
begin
  sx := x;
  sy := y;
  FMap.ConvertCoord(sx, sy,  GCx, GCy, miScreenToMap);
  UpdateGameCenter();
  FMap.Repaint;
end;

function GetIndexLong(const x: integer): string;
var i: integer;
begin
  i := EnsureRange(x, 1, 36);
  Result := Format('%2d', [i]);
end;

function GetIndexLatt(const y: integer): string;
var i: integer;
begin
  i := EnsureRange(y, 0, 17);
  Result := Char(Ord('A') + Y)
end;

procedure TfEditGameCenter.MoveGameCenter;
begin
  UpdateGameCenter();
  Fmap.Repaint;
end;

procedure TfEditGameCenter.UpdateGameCenter();
var sx, sy: Single;
    dx, dy, halfW: Double;
    gid : TRect;
begin
  xDegree.Text := formatDM_longitude(GCx);
  yDegree.Text := formatDM_latitude(GCy);

  halfW := 0.5 * Gwidth;
  FMap.ConvertCoord(sx, sy, GCx, GCy, miMapToScreen);

  gPoint.X := Round(sx);
  gPoint.Y := Round(sy);

  dx := GCx - halfW;
  dy := GCy - halfW;

  FMap.ConvertCoord(sx, sy, dx, dy, miMapToScreen);
  gRect.Left := Round(sx);
  gRect.Top  := Round(sy);

  dx := GCx + halfW;
  dy := GCy + halfW;

  FMap.ConvertCoord(sx, sy, dx, dy, miMapToScreen);
  gRect.Right := Round(sx);
  gRect.Bottom  := Round(sy);

  GetGridIndex(GCx, GCy, Gwidth, gid);

//  edX.Text := GetIndexLatt(gid.Top)    + ' - ' + GetIndexLong(gid.Left) ;
//  edY.Text := GetIndexLatt(gid.Bottom) + ' - ' + GetIndexLong(gid.Right);
//  edIDx.Text := IntToStr(gid.Left) + ' - ' +IntToStr(gid.Right);
//  edIDy.Text := IntToStr(gid.Top) + ' - ' +IntToStr(gid.Bottom);
end;

procedure TfEditGameCenter.GetGridIndex(const cx, cy, w: Double;
        var gid: TRect);
var i: integer;
    halfW: double;
begin
  halfW := 0.5 * w;

  i := Floor((cx - halfW + 180.0) / 10.0) + 1;
  gid.Left    := EnsureRange(i, 1, 36);

  i:=  Ceil((cx + halfW + 180.0) / 10.0) ;
  gid.Right   :=  EnsureRange(i, 1, 36);

  i := Floor ((90.0-(cy + halfW )) / 10.0)  ;
  gid.Top     :=  EnsureRange(i, 0, 17);

  i := Floor((90.0-(cy - halfW )) / 10.0) ;
  gid.Bottom  :=  EnsureRange(i, 0, 17);

end;

procedure TfEditGameCenter.FMapViewChanged(Sender: TObject);
begin
  UpdateGameCenter();
end;

end.

