unit uChaff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TChaffForm = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    Launchers: TTabSheet;
    Seduction: TTabSheet;
    Bloom: TTabSheet;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grbChaffMounts: TGroupBox;
    btnEditChaff: TButton;
    lblMinDelay: TStaticText;
    edtMinDelay: TEdit;
    lblHoursMinDelay: TStaticText;
    lblMaxNumber: TStaticText;
    edtMaxNumber: TEdit;
    grbChaffLauncher1: TGroupBox;
    cbValidLauncher1: TCheckBox;
    btnEditLauncher1: TButton;
    grbChaffLauncher3: TGroupBox;
    cbValidlauncher3: TCheckBox;
    btnEditLauncher3: TButton;
    grbChaffLauncher2: TGroupBox;
    cbValidLauncher2: TCheckBox;
    btnEditLauncher2: TButton;
    grbChaffLauncher4: TGroupBox;
    cbValidLauncher4: TCheckBox;
    btnEditLauncher4: TButton;
    cbCapable: TCheckBox;
    lblTimeToWeapon: TStaticText;
    edtTimeToWeapon: TEdit;
    lblHoursTimeToWeapon: TStaticText;
    grbProbabilityOfSuccess: TGroupBox;
    TrackProbability: TTrackBar;
    edtProbability: TEdit;
    lbl0Percent: TStaticText;
    lbl100percent: TStaticText;
    lblDefaultRange: TStaticText;
    edtDefaultRange: TEdit;
    lblnmDefaultRange: TStaticText;
    lblDefaultAltitude: TStaticText;
    edtDefaultAltitude: TEdit;
    lblFeetDefaultAltitude: TStaticText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChaffForm: TChaffForm;

implementation

{$R *.dfm}

end.
