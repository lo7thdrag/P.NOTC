unit ufmEMCON;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufmControlled, ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfmEMCON = class(TfmControlled)
    PanelEmconChoices: TPanel;
    ListView7: TListView;
    PanelEmcon: TPanel;
    Label562: TLabel;
    Bevel120: TBevel;
    Bevel17: TBevel;
    Bevel18: TBevel;
    Label87: TLabel;
    Bevel21: TBevel;
    Bevel22: TBevel;
    sbEmconAllSystemsAllSilent: TSpeedButton;
    sbEmconAllSystemsClearAll: TSpeedButton;
    sbEmconGroupAirboneEMCON: TSpeedButton;
    sbEmconGroupAirboneClear: TSpeedButton;
    cbxEmcon: TComboBox;
    cbEmconSearchRadar: TCheckBox;
    cbEmconFireControl: TCheckBox;
    cbEmconIFF: TCheckBox;
    cbEmconJammingSystems: TCheckBox;
    cbEmconLasers: TCheckBox;
    cbEmconHFComm: TCheckBox;
    cbEmconVHFUHFComm: TCheckBox;
    cbEmconHFDatalink: TCheckBox;
    cbEmconUWT: TCheckBox;
    cbEmconActiveSonar: TCheckBox;
    cbEmconAcousticDecoys: TCheckBox;
    btnEmconDistributeToGroup: TButton;
    cbEmconVHFUHFDatalink: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEMCON: TfmEMCON;

implementation

{$R *.dfm}

end.
