unit uRadarJammer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TfRadarJammer = class(TForm)
    Panel1: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    lbl1: TLabel;
    edtClassRadarJammer: TEdit;
    Panel3: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Label10: TLabel;
    edtPowerDensity: TEdit;
    grbFreqOperatingLimits: TGroupBox;
    Label12: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtLowerLimit: TEdit;
    edtUpperLimit: TEdit;
    Notes: TTabSheet;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    edtMaxEffectiveRange: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbJammerType: TComboBox;
    Label5: TLabel;
    edtMaxSectorWidth: TEdit;
    Label6: TLabel;
    grbVerticalCoverageLimits: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtLowerVerticalLimits: TEdit;
    edtUpperVerticalLimits: TEdit;
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isCopy : Boolean;
  end;

var
  fRadarJammer: TfRadarJammer;

implementation

{$R *.dfm}

procedure TfRadarJammer.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
