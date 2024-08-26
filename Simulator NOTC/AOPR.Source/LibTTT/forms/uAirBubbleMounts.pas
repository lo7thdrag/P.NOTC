unit uAirBubbleMounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TAirBubblesMounts = class(TForm)
    pnl1: TPanel;
    txtName: TStaticText;
    edtName: TEdit;
    pnl2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    pnl3: TPanel;
    pgc1: TPageControl;
    tsGeneral: TTabSheet;
    txtAntenna: TStaticText;
    edtAntenna: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure getData;
    procedure getMount;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    air_bubble  : TAir_Bubble_Mount;
  end;

var
  AirBubblesMounts: TAirBubblesMounts;

implementation

{$R *.dfm}


uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter;

procedure TAirBubblesMounts.getMount;
begin

  with air_bubble.FData do begin
    edtName.Text      := Instance_Identifier;
    edtAntenna.Text   := FloatToStr(Bubble_Qty_On_Board);
  end;

end;


procedure TAirBubblesMounts.getData;
begin
  with air_bubble.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    Air_Bubble_Index      := Air_Bubble_Index;
    Bubble_Qty_On_Board   := StrToInt(edtAntenna.Text);
  end;

end;


procedure TAirBubblesMounts.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.updateAir_Bubble(air_bubble,IntToStr(air_bubble.FData.Air_Bubble_Instance_Index));
end;

procedure TAirBubblesMounts.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAirBubblesMounts.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TAirBubblesMounts.FormCreate(Sender: TObject);
begin
  air_bubble  := TAir_Bubble_Mount.Create;;
end;

procedure TAirBubblesMounts.FormShow(Sender: TObject);
begin
  getMount
end;

end.
