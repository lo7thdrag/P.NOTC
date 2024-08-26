unit uLauncherSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TLauncherSetupForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblLauncherKnot: TStaticText;
    cbxLauncherKnot: TComboBox;
    grbOperatorDeployment: TGroupBox;
    lblMinimumRange: TStaticText;
    edtMinRange: TEdit;
    lblnmMinRange: TStaticText;
    lblMaximumRange: TStaticText;
    edtMaxRange: TEdit;
    lblnmMaxRange: TStaticText;
    lblMinimumElevation: TStaticText;
    edtMinElevation: TEdit;
    lblFeetMinElevation: TStaticText;
    lblMaximumElevation: TStaticText;
    edtMaxElevation: TEdit;
    lblMaxElevation: TStaticText;
    lblForward: TStaticText;
    imgForward: TImage;
    edtForward: TEdit;
    lblAvgSpeed: TStaticText;
    edtAvgSpeed: TEdit;
    lblKnotsAvgSpeed: TStaticText;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LauncherSetupForm: TLauncherSetupForm;

implementation

{$R *.dfm}

end.
