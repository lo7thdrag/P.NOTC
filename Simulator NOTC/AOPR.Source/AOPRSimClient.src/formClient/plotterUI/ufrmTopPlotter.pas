unit ufrmTopPlotter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Vcl.StdCtrls, RzBmpBtn, Vcl.Imaging.pngimage;

type
  TfrmTopPlotter = class(TForm)
    pnlContent: TPanel;
    lbl1: TLabel;
    lblRangeRings: TLabel;
    cbbSetScale: TComboBox;
    imgBackground: TImage;
    imgShow: TImage;
    btnIncrease: TRzBmpButton;
    btnDecrease: TRzBmpButton;
    procedure imgShowClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbbSetScaleChange(Sender: TObject);
    procedure btnIncreaseClick(Sender: TObject);
    procedure btnDecreaseClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmTopPlotter: TfrmTopPlotter;

implementation

uses
  ufrmLeftToolsPlotter, ufTacticalDisplay, uSimMgr_Client, uMapXHandler,
  MapXLib_TLB, Math ;

{$R *.dfm}

const
  CMin_Z = 0;
  CMax_Z = 14;
  C_CLEAR = 0;  //untuk action multiselect
  C_ADD = 1;  //untuk action multiselect
  C_MOVE = 2;  //untuk action multiselect

function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure TfrmTopPlotter.btnDecreaseClick(Sender: TObject);
begin
  if cbbSetScale.Text = '25' then
  begin
    cbbSetScale.ItemIndex := 9;
    cbbSetScaleChange(nil);
    Exit
  end;

  cbbSetScale.ItemIndex := cbbSetScale.ItemIndex + 1;
  cbbSetScaleChange(nil);
end;

procedure TfrmTopPlotter.btnIncreaseClick(Sender: TObject);
begin
  if cbbSetScale.Text = '25' then
  begin
    cbbSetScale.ItemIndex := 7;
    cbbSetScaleChange(nil);
    Exit
  end;

  cbbSetScale.ItemIndex := cbbSetScale.ItemIndex - 1;
  cbbSetScaleChange(nil);
end;

procedure TfrmTopPlotter.cbbSetScaleChange(Sender: TObject);
var
  z: double;
  s: string;
  i: Integer;
  rrVis: Boolean;
begin
  if cbbSetScale.ItemIndex < 0 then
    exit;

  s := cbbSetScale.Items[cbbSetScale.ItemIndex];
  try
    z := StrToFloat(s);
    VSimMap.SetMapZoom(z * 2);
    frmTacticalDisplay.lblRangeScale.Caption := cbbSetScale.Text;
    lblRangeRings.Caption := '1 : ' + FloatToStr(z/4);

    // Set Range Ring
    rrVis := frmLeftToolsPlotter.btnFilterRings.down;
    if rrVis then
    begin
      z := FixMapZoom(VSimMap.FMap.Zoom);
      i := FindClosestZoomIndex(z);
      z := ZoomIndexToScale(i);
      simMgrClient.RangeRing.Interval := 0.125 * z;
    end;
  finally

  end;
end;

procedure TfrmTopPlotter.FormCreate(Sender: TObject);
var
  i : integer;
  z : Double;
begin
  cbbSetScale.Items.Clear;

  for i := CMin_Z to CMax_Z do
  begin
    z := ZoomIndexToScale(i);
    cbbSetScale.Items.Add(FloatToStr(z));
  end;

//  cbbSetScale.ItemIndex := 8;
  cbbSetScale.Text := '25';
  lblRangeRings.Caption := '1 : 6.25';
//  cbbSetScaleChange(nil);
end;

procedure TfrmTopPlotter.imgShowClick(Sender: TObject);
begin
  if pnlContent.Visible then
  begin
    pnlContent.Visible := False;
    Left := Left + 114;
  end
  else
  begin
    pnlContent.Visible := True;
    Left := Left - 114;
  end;
  BringToFront;
end;

end.
