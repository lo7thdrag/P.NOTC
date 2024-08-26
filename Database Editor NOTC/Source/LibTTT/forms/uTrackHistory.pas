unit uTrackHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls;

type
  TfTrackHistory = class(TForm)
    PageControl1: TPageControl;
    tsAir: TTabSheet;
    tsSurface: TTabSheet;
    tsAll: TTabSheet;
    tsSubsurface: TTabSheet;
    tsLand: TTabSheet;
    tsGeneral: TTabSheet;
    sgTrackAll: TStringGrid;
    btShowALll: TButton;
    btHideAll: TButton;
    btClearSelected: TButton;
    btClearAll: TButton;
    btClose: TButton;
    btClearAllAir: TButton;
    btClearSelectedAir: TButton;
    btHideAllAir: TButton;
    btShowAll: TButton;
    sgTrackAir: TStringGrid;
    btClearAllSurface: TButton;
    btClearSelectedSurface: TButton;
    btHideALlSurface: TButton;
    btShowALlSurface: TButton;
    sgTrackSurface: TStringGrid;
    btClearAllSubsurface: TButton;
    btClearSelectedSubsurface: TButton;
    btHideAllSubsurface: TButton;
    btShowAllSubsurface: TButton;
    sgTrackSubsurface: TStringGrid;
    btClearAllLand: TButton;
    btClearSelectedLand: TButton;
    btHideAllLand: TButton;
    btShowAllLand: TButton;
    sgTrackLand: TStringGrid;
    btClearAllGeneral: TButton;
    btClearSelectedGeneral: TButton;
    btHideAllGeneral: TButton;
    btShowAllGeneral: TButton;
    sgTrackGeneral: TStringGrid;
    procedure btCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTrackHistory: TfTrackHistory;

implementation

{$R *.dfm}

procedure TfTrackHistory.btCloseClick(Sender: TObject);
begin
close;
end;

end.
