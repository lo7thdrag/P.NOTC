unit uTransferSonobuoy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Menus;

type
  TfTransferSonobuoy = class(TForm)
    pnl1: TPanel;
    lb1: TLabel;
    btnCancel: TButton;
    btnOk: TButton;
    bvl7: TBevel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    lbParentCurrent: TLabel;
    edtNewParent: TEdit;
    btnSonobuoyControlCombo: TSpeedButton;
    Label4: TLabel;
    lbTransferTrack: TLabel;
    Bevel2: TBevel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    lbIdTransfer: TLabel;
    pmNewParent: TPopupMenu;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnSonobuoyControlComboClick(Sender: TObject);
    procedure RadioClick(Sender: TObject);
  private
    FOldParentID  : Integer;
    FNewParentID  : Integer;
    // FGroupNewParent : Integer;

    procedure OnMenuNewParentClick(Sender : TObject);
  public
    { Public declarations }
  end;

var
  fTransferSonobuoy: TfTransferSonobuoy;

implementation

{$R *.dfm}
uses
  uSimMgr_Client, uSimObjects, uT3Unit, uT3Vehicle, uT3Sonobuoy,
  uGameData_TTT, uLibSettingTTT;

procedure TfTransferSonobuoy.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfTransferSonobuoy.btnOkClick(Sender: TObject);
var
  recSon: TRecCmd_TransferSonobuoy;
begin
  recSon.OldParentID  := FOldParentID;
  recSon.NewParentID  := FNewParentID;
  recSon.SonoID       := StrToInt(lbIdTransfer.Caption);

  if RadioButton1.Checked then
    recSon.Flag     := True
  else
    recSon.Flag     := False;

  simMgrClient.netSend_CmdTransferSonobuoy(recSon);

  Close
end;

procedure TfTransferSonobuoy.btnSonobuoyControlComboClick(Sender: TObject);
var
  Pos   : TPoint;
  I, J  : Integer;
  p     : TSimObject;
  mn    : TMenuItem;
  dev   : TObject;
  pi    : TT3PlatformInstance;
begin
  inherited;
  GetCursorPos(pos);
  pmNewParent.Popup(pos.X, pos.Y);

  pmNewParent.Items.Clear;

  pi := simMgrClient.FindT3PlatformByID(StrToInt(lbIdTransfer.Caption));

  with simMgrClient do
  begin
    for I := 0 to SimPlatforms.itemCount - 1 do begin
      p := SimPlatforms.getObject(I);

      if p is TT3Vehicle then begin

        if TT3PlatformInstance(p).InstanceIndex = TT3Sonobuoy(pi).ParentIndex then
           Continue;

        if TT3Vehicle(p).Devices.Count > 0 then begin

          for  J:= 0 to TT3Vehicle(p).Devices.Count - 1 do begin
            dev := TT3Vehicle(p).Devices.Items[J];

            if ((TT3DeviceUnit(dev).InstanceName) = (TT3Sonobuoy(pi).InstanceName)) then begin
               FOldParentID := TT3Sonobuoy(pi).ParentIndex;
               mn           := TMenuItem.Create(nil);
               mn.Caption   := TT3Vehicle(p).Track_ID;//.InstanceName;
               mn.Tag       := TT3Vehicle(p).InstanceIndex;
               mn.OnClick   := OnMenuNewParentClick;
               pmNewParent.Items.Add(mn);
               Break;
            end
            else
              Continue;
          end;
        end
        else
         Continue;
      end;
    end;
  end;
end;

procedure TfTransferSonobuoy.OnMenuNewParentClick(Sender: TObject);
begin
  edtNewParent.Text := TMenuItem(sender).Caption;
  FNewParentID      := TMenuItem(sender).Tag
end;

procedure TfTransferSonobuoy.RadioClick(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    Label4.Visible          := True;
    lbTransferTrack.Visible := True;
  end
  else
  begin
    Label4.Visible          := False;
    lbTransferTrack.Visible := False;
  end;
end;

end.
