unit uAccousticDecoyProb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAsset_Countermeasure, DB,
  uBlindZoneView, uDBBlind_Zone;

type
  TAccousticDecoyProb = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    pnl3: TPanel;
    grdpnl1: TGridPanel;
    pnl01: TPanel;
    pnl1: TPanel;
    pnl_BZone1: TPanel;
    pnl_BZone2: TPanel;
    pnl_BZone3: TPanel;
    pnl_BZone4: TPanel;
    pnl2: TPanel;
    edtActive1: TEdit;
    edtActive2: TEdit;
    edtActive3: TEdit;
    edtActive4: TEdit;
    pnl4: TPanel;
    edtPassive1: TEdit;
    edtPassive2: TEdit;
    edtPassive3: TEdit;
    edtPassive4: TEdit;
    pnl5: TPanel;
    edtActivePassive1: TEdit;
    edtActivePassive2: TEdit;
    edtActivePassive3: TEdit;
    edtActivePassive4: TEdit;
    pnl6: TPanel;
    edtWireGuided1: TEdit;
    edtWireGuided2: TEdit;
    edtWireGuided3: TEdit;
    edtWireGuided4: TEdit;
    pnl7: TPanel;
    edtWakeHoming1: TEdit;
    edtWakeHoming2: TEdit;
    edtWakeHoming3: TEdit;
    edtWakeHoming4: TEdit;
    pnl8: TPanel;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtActive1KeyPress(Sender: TObject; var Key: Char);
    procedure edtActive2KeyPress(Sender: TObject; var Key: Char);
    procedure edtActive3KeyPress(Sender: TObject; var Key: Char);
    procedure edtActive4KeyPress(Sender: TObject; var Key: Char);
    procedure edtPassive1KeyPress(Sender: TObject; var Key: Char);
    procedure edtPassive2KeyPress(Sender: TObject; var Key: Char);
    procedure edtPassive3KeyPress(Sender: TObject; var Key: Char);
    procedure edtPassive4KeyPress(Sender: TObject; var Key: Char);
    procedure edtActivePassive1KeyPress(Sender: TObject; var Key: Char);
    procedure edtActivePassive2KeyPress(Sender: TObject; var Key: Char);
    procedure edtActivePassive3KeyPress(Sender: TObject; var Key: Char);
    procedure edtActivePassive4KeyPress(Sender: TObject; var Key: Char);
    procedure edtWireGuided1KeyPress(Sender: TObject; var Key: Char);
    procedure edtWireGuided2KeyPress(Sender: TObject; var Key: Char);
    procedure edtWireGuided3KeyPress(Sender: TObject; var Key: Char);
    procedure edtWireGuided4KeyPress(Sender: TObject; var Key: Char);
    procedure edtWakeHoming1KeyPress(Sender: TObject; var Key: Char);
    procedure edtWakeHoming2KeyPress(Sender: TObject; var Key: Char);
    procedure edtWakeHoming3KeyPress(Sender: TObject; var Key: Char);
    procedure edtWakeHoming4KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    BlindZone : TBlind_Zone;
    acc : TAcoustic_Decoy_POH_Modifier;
  public
    { Public declarations }
    bList : TList;
    isNew : boolean;
    id    : Integer;
    procedure showData;
    procedure getData;
    procedure addRecord(const g_type,aspect: Integer);
  end;

var
  fAccousticDecoyProb: TAccousticDecoyProb;

implementation

{$R *.dfm}

uses uDataModuleTTT, ufrmSummaryAcousticDecoy;

procedure TAccousticDecoyProb.btnApplyClick(Sender: TObject);
begin
  getData;
  isNew := false;
  showData;
end;

procedure TAccousticDecoyProb.getData;
var val: Double;
    isvalid: Boolean;
begin
  with acc.FAccousticDecoy_POH do begin
    isvalid := TryStrToFloat(edtActive1.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(10,0);
    end;
    isvalid := TryStrToFloat(edtActive2.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(10,1);
    end;
    isvalid := TryStrToFloat(edtActive3.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(10,2);
    end;
    isvalid := TryStrToFloat(edtActive4.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(10,3);
    end;
    isvalid := TryStrToFloat(edtPassive1.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(11,0);
    end;
    isvalid := TryStrToFloat(edtPassive2.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(11,1);
    end;
    isvalid := TryStrToFloat(edtPassive3.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(11,2);
    end;
    isvalid := TryStrToFloat(edtPassive4.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(11,3);
    end;
    isvalid := TryStrToFloat(edtActivePassive1.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(12,0);
    end;
    isvalid := TryStrToFloat(edtActivePassive2.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(12,1);
    end;
    isvalid := TryStrToFloat(edtActivePassive3.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(12,2);
    end;
    isvalid := TryStrToFloat(edtActivePassive4.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(12,3);
    end;
    isvalid := TryStrToFloat(edtWireGuided1.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(13,0);
    end;
    isvalid := TryStrToFloat(edtWireGuided2.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(13,1);
    end;
    isvalid := TryStrToFloat(edtWireGuided3.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(13,2);
    end;
    isvalid := TryStrToFloat(edtWireGuided4.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(13,3);
    end;
    isvalid := TryStrToFloat(edtWakeHoming1.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(18,0);
    end;
    isvalid := TryStrToFloat(edtWakeHoming2.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(18,1);
    end;
    isvalid := TryStrToFloat(edtWakeHoming3.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(18,2);
    end;
    isvalid := TryStrToFloat(edtWakeHoming4.Text,val);
    if (isvalid) and (val >= 0) and (val <= 0.5) then
    begin
      POH_Modifier := val;
      addRecord(18,3);
    end;
  end;
end;

procedure TAccousticDecoyProb.addRecord(const g_type,aspect: Integer);
begin
  acc.FAccousticDecoy_POH.Decoy_Index           := id;
  acc.FAccousticDecoy_POH.Torpedo_Guidance_Type := g_type;
  acc.FAccousticDecoy_POH.Aspect_Angle          := aspect;
 try
  if isNew then dmTTT.InsertAcoustic_Decoy_POH_Modifier(acc)
  else dmTTT.UpdateAcoustic_Decoy_POH_Modifier(id,g_type,aspect,acc);
 except

 end;
end;

procedure TAccousticDecoyProb.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TAccousticDecoyProb.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TAccousticDecoyProb.edtActive1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActive1.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActive2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActive2.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActive3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActive3.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActive4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActive4.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActivePassive1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActivePassive1.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActivePassive2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActivePassive2.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActivePassive3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActivePassive3.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtActivePassive4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtActivePassive4.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtPassive1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtPassive1.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtPassive2KeyPress(Sender: TObject;
  var Key: Char);
begin
     if StrToFloat(edtPassive2.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtPassive3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtPassive3.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtPassive4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtPassive4.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWakeHoming1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWakeHoming1.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWakeHoming2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWakeHoming2.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWakeHoming3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWakeHoming3.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWakeHoming4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWakeHoming4.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWireGuided1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWireGuided1.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWireGuided2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWireGuided2.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWireGuided3KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWireGuided3.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.edtWireGuided4KeyPress(Sender: TObject;
  var Key: Char);
begin
  if StrToFloat(edtWireGuided4.Text) >= 3 then
  ShowMessage('Incorrect value')
end;

procedure TAccousticDecoyProb.FormCreate(Sender: TObject);
begin
  bList := TList.Create;
  acc := TAcoustic_Decoy_POH_Modifier.Create;
end;

procedure TAccousticDecoyProb.FormShow(Sender: TObject);
var
  rw1,rw2,rw3,rw4     : TBlindZoneView;
  z : TZoneSector;
  I: Integer;
begin
//  id  := frmSummaryAcousticDecoy.acoustic.FAccousticDecoy_Def.Decoy_Index;
  isNew := false;

  grdpnl1.ColumnCollection.BeginUpdate;
  for I := 1 to 4 do begin
    grdpnl1.ColumnCollection[I].SizeStyle := ssAbsolute;
    grdpnl1.ColumnCollection[I].Value     := 80;
  end;
  grdpnl1.RowCollection[1].SizeStyle := ssAbsolute;
  grdpnl1.RowCollection[1].Value     := 80;
  for I := 2 to 6 do begin
    grdpnl1.RowCollection[I].SizeStyle := ssPercent;
    grdpnl1.RowCollection[I].Value     := 12;
  end;
  grdpnl1.ColumnCollection.EndUpdate;

  DoubleBuffered := True;
  pnl_BZone1.DoubleBuffered := True;
  rw1 := TBlindZoneView.Create(self);
  rw1.Parent := pnl_BZone1;
  rw1.Left := 1;
  rw1.Top  := 1;
  rw1.Width  := pnl_BZone1.Width - 4;
  rw1.Height := pnl_BZone1.Height - 4;
  rw1.AddZone;
  rw1.ClearZone;
  z := rw1.AddZone;
  rw1.Zones[0];
  z.StartAngle := 315;
  z.EndAngle   := 45;
  rw1.Repaint;

  pnl_BZone2.DoubleBuffered := True;
  rw2 := TBlindZoneView.Create(self);
  rw2.Parent := pnl_BZone2;
  rw2.Left := 1;
  rw2.Top  := 1;
  rw2.Width  := pnl_BZone2.Width - 4;
  rw2.Height := pnl_BZone2.Height - 4;
  rw2.AddZone;
  rw2.ClearZone;
  z := rw2.AddZone;
  rw2.Zones[0];
  z.StartAngle := 270;
  z.EndAngle   := 315;
  z := rw2.AddZone;
  rw2.Zones[1];
  z.StartAngle := 45;
  z.EndAngle   := 90;
  rw2.Repaint;

  pnl_BZone3.DoubleBuffered := True;
  rw3 := TBlindZoneView.Create(self);
  rw3.Parent := pnl_BZone3;
  rw3.Left := 1;
  rw3.Top  := 1;
  rw3.Width  := pnl_BZone3.Width - 4;
  rw3.Height := pnl_BZone3.Height - 4;
  rw3.AddZone;
  rw3.ClearZone;
  z := rw3.AddZone;
  rw3.Zones[0];
  z.StartAngle := 90;
  z.EndAngle   := 135;
  z := rw3.AddZone;
  rw3.Zones[1];
  z.StartAngle := 225;
  z.EndAngle   := 270;
  rw3.Repaint;

  pnl_BZone4.DoubleBuffered := True;
  rw4 := TBlindZoneView.Create(self);
  rw4.Parent := pnl_BZone4;
  rw4.Left := 1;
  rw4.Top  := 1;
  rw4.Width  := pnl_BZone4.Width - 4;
  rw4.Height := pnl_BZone4.Height - 4;
  rw4.AddZone;
  rw4.ClearZone;
  z := rw4.AddZone;
  rw4.Zones[0];
  z.StartAngle := 135;
  z.EndAngle   := 225;
  rw4.Repaint;

  showData;
end;

procedure TAccousticDecoyProb.showData;
var
  I: Integer;
begin
  bList.Clear;
  dmTTT.getAllAcoustic_Decoy_POH_Modifier(id,bList);
  for I := 0 to bList.Count - 1 do begin
    with TAcoustic_Decoy_POH_Modifier(bList[I]).FAccousticDecoy_POH do begin
      case Torpedo_Guidance_Type of
        10:
          begin
            case Aspect_Angle of
              0: edtActive1.Text  := FormatFloat('0.0',POH_Modifier);
              1: edtActive2.Text  := FormatFloat('0.0',POH_Modifier);
              2: edtActive3.Text  := FormatFloat('0.0',POH_Modifier);
              3: edtActive4.Text  := FormatFloat('0.0',POH_Modifier);
            end;
          end;
        11:
          begin
            case Aspect_Angle of
              0: edtPassive1.Text  := FormatFloat('0.0',POH_Modifier);
              1: edtPassive2.Text  := FormatFloat('0.0',POH_Modifier);
              2: edtPassive3.Text  := FormatFloat('0.0',POH_Modifier);
              3: edtPassive4.Text  := FormatFloat('0.0',POH_Modifier);
            end;
          end;
        12:
          begin
            case Aspect_Angle of
              0: edtActivePassive1.Text  := FormatFloat('0.0',POH_Modifier);
              1: edtActivePassive2.Text  := FormatFloat('0.0',POH_Modifier);
              2: edtActivePassive3.Text  := FormatFloat('0.0',POH_Modifier);
              3: edtActivePassive4.Text  := FormatFloat('0.0',POH_Modifier);
            end;
          end;
        13:
          begin
            case Aspect_Angle of
              0: edtWireGuided1.Text  := FormatFloat('0.0',POH_Modifier);
              1: edtWireGuided2.Text  := FormatFloat('0.0',POH_Modifier);
              2: edtWireGuided3.Text  := FormatFloat('0.0',POH_Modifier);
              3: edtWireGuided4.Text  := FormatFloat('0.0',POH_Modifier);
            end;
          end;
        18:
          begin
            case Aspect_Angle of
              0: edtWakeHoming1.Text  := FormatFloat('0.0',POH_Modifier);
              1: edtWakeHoming2.Text  := FormatFloat('0.0',POH_Modifier);
              2: edtWakeHoming3.Text  := FormatFloat('0.0',POH_Modifier);
              3: edtWakeHoming4.Text  := FormatFloat('0.0',POH_Modifier);
            end;
          end;
      end;
    end;
  end;
  if bList.Count < 1 then
  begin
    isNew := true;
    edtActive1.Text := '0.0';
    edtActive2.Text := '0.0';
    edtActive3.Text := '0.0';
    edtActive4.Text := '0.0';
    edtPassive1.Text := '0.0';
    edtPassive2.Text := '0.0';
    edtPassive3.Text := '0.0';
    edtPassive4.Text := '0.0';
    edtActivePassive1.Text := '0.0';
    edtActivePassive2.Text := '0.0';
    edtActivePassive3.Text := '0.0';
    edtActivePassive4.Text := '0.0';
    edtWireGuided1.Text := '0.0';
    edtWireGuided2.Text := '0.0';
    edtWireGuided3.Text := '0.0';
    edtWireGuided4.Text := '0.0';
    edtWakeHoming1.Text := '0.0';
    edtWakeHoming2.Text := '0.0';
    edtWakeHoming3.Text := '0.0';
    edtWakeHoming4.Text := '0.0';
  end;
end;

end.
