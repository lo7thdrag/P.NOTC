unit uRadarIntervalSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TRadarIntervalSetupForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblRadarIntervals: TStaticText;
    cbxRadarIntervals: TComboBox;
    lblNumberOfScans: TStaticText;
    edtNumberOfScans: TEdit;
    lblTimeInterval: TStaticText;
    edtTimeInterval: TEdit;
    lblSeconds: TStaticText;
    btnAdd: TButton;
    ListView1: TListView;
    btnRemove: TButton;
    btnMoveUp: TButton;
    btnMoveDown: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RadarIntervalSetupForm: TRadarIntervalSetupForm;

implementation

{$R *.dfm}

end.
