unit ufrmTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn;

type
  TfrmTools = class(TForm)
    btnOverlayEditor: TRzBmpButton;
    btnPlotting: TRzBmpButton;
    btnOptionLogistik: TRzBmpButton;
    btnTimeOfRaid: TRzBmpButton;
    btnFullScreen: TRzBmpButton;
    btnWindowedScreen: TRzBmpButton;
    procedure btnOverlayEditorClick(Sender: TObject);
    procedure btnPlottingClick(Sender: TObject);
    procedure btnOptionLogistikClick(Sender: TObject);
    procedure btnTimeOfRaidClick(Sender: TObject);
    procedure btnFullScreenClick(Sender: TObject);
    procedure btnWindowedScreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTools: TfrmTools;

implementation

uses ufTacticalDisplay, ufmTimeOfRaid, ufrmTop;

{$R *.dfm}

procedure TfrmTools.btnFullScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmTools.btnWindowedScreenClick(Sender: TObject);
begin
  frmTacticalDisplay.hideBottomPanel(sender);
  frmTop.hideTopPanel(sender);
end;

procedure TfrmTools.btnOptionLogistikClick(Sender: TObject);
begin
  frmTacticalDisplay.btnLogisticClick(nil);
end;

procedure TfrmTools.btnOverlayEditorClick(Sender: TObject);
begin
  frmTacticalDisplay.btnOverlayClick(nil);
end;

procedure TfrmTools.btnPlottingClick(Sender: TObject);
begin
  frmTacticalDisplay.btnPlottingClick(nil);
end;

procedure TfrmTools.btnTimeOfRaidClick(Sender: TObject);
begin
  if btnTimeOfRaid.Down then
  begin
    fmTimeOfRaid.Show;
  end
  else
  begin
    if Assigned(fmTimeOfRaid) then
      fmTimeOfRaid.Close;
  end;
end;

end.
