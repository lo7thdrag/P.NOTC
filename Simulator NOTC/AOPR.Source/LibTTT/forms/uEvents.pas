unit uEvents;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TEventsWindowForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grbWeapon: TGroupBox;
    lblEvents: TLabel;
    lblName: TLabel;
    edtEventWeapon: TEdit;
    cbxNameWeapon: TComboBox;
    lblSalvoSize: TLabel;
    edtSalvoSizeWeapon: TEdit;
    lblTarget: TLabel;
    edtTargetWeapon: TEdit;
    btnSearchTargetWeapon: TSpeedButton;
    updownEventweapon: TUpDown;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel3: TPanel;
    lstEvents: TListBox;
    grbSonobuoy: TGroupBox;
    lblNameSonobuoy: TLabel;
    lblSpacingSonobuoy: TLabel;
    lblNumberSonobuoy: TLabel;
    lblDepthSonobuoy: TLabel;
    cbxNameSonobuoy: TComboBox;
    edtSpacingSonobuoy: TEdit;
    edtNumberSonobuoy: TEdit;
    edtDepthSonobuoy: TEdit;
    nmSpacingSonobuoy: TStaticText;
    feetDepthSonobuoy: TStaticText;
    KingpinPositionSonobuoy: TStaticText;
    lblKingpin1: TLabel;
    lblKingpin2: TLabel;
    grbMine: TGroupBox;
    lblNameMine: TLabel;
    lblSpacingMine: TLabel;
    lblNumberMine: TLabel;
    lblDepthMine: TLabel;
    cbxNameMine: TComboBox;
    edtSpacingMine: TEdit;
    edtNumberMine: TEdit;
    edtDepthMine: TEdit;
    nmMine: TStaticText;
    feetMine: TStaticText;
    grbChaff: TGroupBox;
    lblNameChaff: TLabel;
    lblSpacingChaff: TLabel;
    lblNumberChaff: TLabel;
    cbxNameChaff: TComboBox;
    edtSpacingChaff: TEdit;
    edtNumberChaff: TEdit;
    nmChaff: TStaticText;
    cbDeployChaff: TCheckBox;
    grbCommLink: TGroupBox;
    lblHFCommLink: TLabel;
    lblUHFCommLink: TLabel;
    cbxHFCommLink: TComboBox;
    cbxUHFCommLink: TComboBox;
    grbRadar: TGroupBox;
    lblNameRadar: TLabel;
    lblActionRadar: TLabel;
    lblEventRadar: TLabel;
    cbxNameRadar: TComboBox;
    cbxActionRadar: TComboBox;
    edtEventRadar: TEdit;
    updownEventRadar: TUpDown;
    grbIFF: TGroupBox;
    lblInterrogatorIFF: TLabel;
    lblTransponderIFF: TLabel;
    lblNameIFF: TLabel;
    cbxInterrogatorIFF: TComboBox;
    cbxTransponderIFF: TComboBox;
    edtNameIFF: TEdit;
    grbJammer: TGroupBox;
    lblActionJammer: TLabel;
    lblNameJammer: TLabel;
    cbxActionJammer: TComboBox;
    edtNameJammer: TEdit;
    grbSonar: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure btnCancelClick(Sender: TObject);
    procedure lstEventsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EventsWindowForm: TEventsWindowForm;

implementation

{$R *.dfm}

procedure TEventsWindowForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TEventsWindowForm.lstEventsClick(Sender: TObject);
begin
if ((lstEvents.ItemIndex < lstEvents.Count) or (lstEvents.ItemIndex >= 0)) then
  case lstEvents.ItemIndex of
    0: grbRadar.BringToFront;
    1: grbSonar.BringToFront;
    2: grbWeapon.BringToFront;
    3: grbMine.BringToFront;
    4: grbSonobuoy.BringToFront;
    5: grbChaff.BringToFront;
    6: grbIFF.BringToFront;
    7: grbCommLink.BringToFront;
    8: grbJammer.BringToFront;
  end;
end;

end.
