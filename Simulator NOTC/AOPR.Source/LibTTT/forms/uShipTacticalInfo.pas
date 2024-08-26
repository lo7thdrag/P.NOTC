unit uShipTacticalInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, tttData, uSimMgr_Client;

type
  TfrmTacticalInfoSet = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnApply: TButton;
    btnCancel: TButton;
    cbCallSign1: TComboBox;
    cbCallSign2: TComboBox;
    cbCallSign3: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTacticalInfoSet: TfrmTacticalInfoSet;

implementation

uses
  ufrmKeyboard;

{$R *.dfm}

procedure TfrmTacticalInfoSet.btnApplyClick(Sender: TObject);
begin
  simMgrClient.ShipTacticalInfo1 := cbCallSign1.Text;
  simMgrClient.ShipTacticalInfo2 := cbCallSign2.Text;
  simMgrClient.ShipTacticalInfo3 := cbCallSign3.Text;
  simMgrClient.ApplyCallSign;

  Close;
end;

procedure TfrmTacticalInfoSet.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTacticalInfoSet.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmTacticalInfoSet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmTacticalInfoSet := nil;
end;

procedure TfrmTacticalInfoSet.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  { fill combolist }

  for I := 0 to Length(C_TacticalInfos) - 1 do
  begin
    cbCallSign1.Items.Add(C_TacticalInfos[I]);
    cbCallSign2.Items.Add(C_TacticalInfos[I]);
    cbCallSign3.Items.Add(C_TacticalInfos[I]);
  end;

  cbCallSign1.ItemIndex := cbCallSign1.Items.IndexOf(simMgrClient.ShipTacticalInfo1);
  cbCallSign2.ItemIndex := cbCallSign2.Items.IndexOf(simMgrClient.ShipTacticalInfo2);
  cbCallSign3.ItemIndex := cbCallSign3.Items.IndexOf(simMgrClient.ShipTacticalInfo3);

end;

end.
