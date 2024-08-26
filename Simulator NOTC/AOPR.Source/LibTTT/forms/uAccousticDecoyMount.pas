unit uAccousticDecoyMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TAccousticDecoy = class(TForm)
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
    procedure getData;
    procedure getMount;
    procedure FormCreate(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    accoustic : TAcoustic_Decoy_On_Board;
  end;

var
  AccousticDecoy: TAccousticDecoy;

implementation

{$R *.dfm}

uses uDataModuleTTT, uVehicleAttributeWindow,uVehiclePicklistFilter;

procedure TAccousticDecoy.getMount;
begin

  with accoustic.FData do begin
    edtName.Text      := Instance_Identifier;
    edtAntenna.Text   := FloatToStr(Quantity);
  end;

end;


procedure TAccousticDecoy.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateAcoustic_Decoy_On_Board(IntToStr(accoustic.FData.Acoustic_Instance_Index),accoustic);
end;

procedure TAccousticDecoy.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAccousticDecoy.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TAccousticDecoy.FormCreate(Sender: TObject);
begin
  accoustic := TAcoustic_Decoy_On_Board.Create;;
end;

procedure TAccousticDecoy.FormShow(Sender: TObject);
begin
  getMount;
end;

procedure TAccousticDecoy.getData;
begin
  with accoustic.FData do begin
    Instance_Identifier   := edtName.Text;
    if fVehiclePicklistFilter.id_vehicle <> '' then
       Vehicle_Index  := StrToInt(fVehiclePicklistFilter.id_vehicle)
    else
       Vehicle_Index         := fVehicleAttributeWindow.vehicle.FData.Vehicle_Index;
    Decoy_Index      := Decoy_Index;
    Quantity         := StrToInt(edtAntenna.Text);
  end;

end;


end.
