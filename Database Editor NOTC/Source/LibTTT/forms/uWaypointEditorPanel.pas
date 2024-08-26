unit uWaypointEditorPanel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ToolWin, ImgList,
  System.ImageList;

type
  TWaypointEditorPanelForm = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    grbCursonPosition: TGroupBox;
    grbControlledPlatform: TGroupBox;
    grbWaypoint: TGroupBox;
    lblBearingCursor: TLabel;
    lblDistanceCursor: TLabel;
    lblPositionCursor: TLabel;
    lblGridCursor: TLabel;
    lbldegreesT: TLabel;
    lblnm: TLabel;
    lblNameControlled: TLabel;
    lblPositionControlled: TLabel;
    lblGridControlled: TLabel;
    BearingCursor: TLabel;
    DistanceCursor: TLabel;
    PositionCursor1: TLabel;
    GridCursor1: TLabel;
    PositionCursor2: TLabel;
    GridCursor2: TLabel;
    NameControlledPlatform: TLabel;
    PositionControlled1: TLabel;
    GridControlled1: TLabel;
    PositionControlled2: TLabel;
    GridControlled2: TLabel;
    lblPositionWaypoint: TLabel;
    edtPositionWaypoint1: TEdit;
    edtPositionWaypoint2: TEdit;
    lblGridWaypoint: TLabel;
    lblGroundSpeedWaypoint: TLabel;
    cbxGroundSpeedWaypoint: TComboBox;
    cbArrivalWaypoint: TCheckBox;
    edtGridWaypoint1: TEdit;
    edtGridWaypoint2: TEdit;
    edtArrivalWaypoint: TEdit;
    btnEditEvents: TButton;
    btnCancel: TButton;
    btnScreenCapture: TButton;
    btnOK: TButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ComboBox1: TComboBox;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ImageList1: TImageList;
    Ebfh: TEdit;
    Edfh: TEdit;
    Epos1: TEdit;
    Epos2: TEdit;
    Egrid1: TEdit;
    Egrid2: TEdit;
    EplaName: TEdit;
    EplatPos1: TEdit;
    EplatPos2: TEdit;
    EplatGrid1: TEdit;
    EplatGrid2: TEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnEditEventsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaypointEditorPanelForm: TWaypointEditorPanelForm;

implementation

uses
  uEvents;

{$R *.dfm}

procedure TWaypointEditorPanelForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TWaypointEditorPanelForm.btnEditEventsClick(Sender: TObject);
begin
  EventsWindowForm.ShowModal;
end;

end.
