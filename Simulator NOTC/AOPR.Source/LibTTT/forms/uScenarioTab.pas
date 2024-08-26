unit uScenarioTab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TScenarioGeneralTabForm = class(TForm)
    Panel1: TPanel;
    Name: TLabel;
    edtName: TEdit;
    Panel2: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    Panel3: TPanel;
    tab: TPageControl;
    TabGeneral: TTabSheet;
    lblResource: TLabel;
    btnBrowse: TSpeedButton;
    edtResourceAllocation: TEdit;
    btnDeploy: TButton;
    btnPreplayScenario: TButton;
    tabRelationships: TTabSheet;
    grbForce: TGroupBox;
    rbRed: TRadioButton;
    rbYellow: TRadioButton;
    rbBlue: TRadioButton;
    rbGreen: TRadioButton;
    rbNoForce: TRadioButton;
    rbNTDS: TRadioButton;
    grbPlatform: TGroupBox;
    btnGroups: TButton;
    btnLinks: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScenarioGeneralTabForm: TScenarioGeneralTabForm;

implementation

{$R *.dfm}

end.
