unit ufrmPlatformBaseDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, ufToteDisplay, uDBAsset_Embark_Library, tttData, uBaseCoordSystem;

type
  TfrmPlatformBaseDetail = class(TForm)
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    lblIdentifier: TLabel;
    btnClose: TButton;
    lblForce: TLabel;
    lblRadius: TLabel;
    lblType: TLabel;
    lblFuel: TLabel;
    lblLongitude: TLabel;
    lblLatitude: TLabel;
    Label1: TLabel;
    lblLubricants: TLabel;
    Label10: TLabel;
    lblWater: TLabel;
    Label13: TLabel;
    lblFood: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    LongLatt: Integer;
  public
    BaseId : Integer;

  end;

var
  frmPlatformBaseDetail: TfrmPlatformBaseDetail;

implementation

uses
  uSimMgr_Client;

{$R *.dfm}

procedure TfrmPlatformBaseDetail.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlatformBaseDetail.FormShow(Sender: TObject);
var
  baseTemp : TPlatformBase;

begin
  baseTemp := simMgrClient.SimPlatformBase.GetPlatformBaseByID(BaseId);

  if Assigned(baseTemp) then
  begin
    lblIdentifier.Caption := baseTemp.identifier;
    lblForce.Caption := IntToStr(baseTemp.force);

    case baseTemp.force of
      fcred: lblForce.Caption := 'Red';
      fcBlue: lblForce.Caption := 'Blue';
    end;
    lblRadius.Caption := FloatToStr(baseTemp.Radius) + ' nm';
    lblType.Caption  := IntToStr(baseTemp.TypeBase);
    lblFuel.Caption := FloatToStr(baseTemp.Fuel);

    lblLongitude.Caption := FloatToStr(baseTemp.Longitude);
    lblLatitude.Caption := FloatToStr(baseTemp.Latitude);

    case LongLatt of
      0:
      begin
          lblLatitude.Caption := formatDMS_latt(baseTemp.Latitude);
          lblLongitude.Caption := formatDMS_long(baseTemp.Longitude);
      end;
    end;

    lblWater.Caption := FloatToStr(baseTemp.Water);
    lblFood.Caption := FloatToStr(baseTemp.Food);
    lblLubricants.Caption := FloatToStr(baseTemp.Lubricants);

  end;
end;
end.
