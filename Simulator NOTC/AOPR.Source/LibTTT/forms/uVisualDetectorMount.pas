unit uVisualDetectorMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, uDBAsset_Sensor;

type
  TVisualDetectorMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    imgBlindZones: TImage;
    lblBlindZones: TStaticText;
    lblObserver: TStaticText;
    edtObserver: TEdit;
    lblFeetObserver: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    vd : TVisual_Sensor_On_Board;
    procedure setData;
    procedure getData;
  end;

var
  VisualDetectorMountForm: TVisualDetectorMountForm;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

procedure TVisualDetectorMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.updateVisual(vd, IntToStr(vd.FData.Visual_Instance_Index));
end;

procedure TVisualDetectorMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TVisualDetectorMountForm.btnOKClick(Sender: TObject);
begin
  getData;
  dmTTT.updateVisual(vd, IntToStr(vd.FData.Visual_Instance_Index));
  Close;
end;

procedure TVisualDetectorMountForm.FormCreate(Sender: TObject);
begin
  vd := TVisual_Sensor_On_Board.Create;
end;

procedure TVisualDetectorMountForm.FormShow(Sender: TObject);
begin
  setData;
end;

procedure TVisualDetectorMountForm.setData;
begin
  with vd.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtObserver.Text := FloatToStr(Observer_Height);
  end;
end;

procedure TVisualDetectorMountForm.getData;
begin
  with vd.FData do
  begin
    Instance_Identifier := edtName.Text;
    Observer_Height := StrToFloat(edtObserver.Text);
  end;
end;

end.
