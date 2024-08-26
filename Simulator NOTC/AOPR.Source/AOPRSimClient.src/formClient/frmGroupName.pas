unit frmGroupName;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uT3Unit, uT3GroupVehicle;

type
  TfrmGroupName1 = class(TForm)
    grpName: TGroupBox;
    lbl1: TLabel;
    edtGrpName: TEdit;
    btnOK: TButton;
    grpListPlatform: TGroupBox;
    pnl1: TPanel;
    lv1: TListView;
    pnl2: TPanel;
    btnOKList: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure btnOKListClick(Sender: TObject);
    procedure edtGrpNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    FGroupName: string;
    procedure setGroupName(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    btn : TMsgDlgBtn;

    procedure Initilaize(obj : TObject);
    property GroupName : string read FGroupName write setGroupName;
  end;

var
  frmGroupName1: TfrmGroupName1;

implementation

uses
  ufrmKeyboard;
{$R *.dfm}

{ TForm1 }

procedure TfrmGroupName1.btnOKClick(Sender: TObject);
begin
  GroupName := edtGrpName.Text;
  btn := mbOK;
  Close;
end;

procedure TfrmGroupName1.btnOKListClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGroupName1.edtGrpNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    btnOK.Click;
  end;
end;

procedure TfrmGroupName1.FormActivate(Sender: TObject);
begin
  frmKeyboard.HandleOfTheTargetForm := Self.Handle;
end;

procedure TfrmGroupName1.Initilaize(obj : TObject);
var
  grp : T3GroupVehicle;
  i : Integer;
  pi : TT3PlatformInstance;
  li : TListItem;
begin
  case (Tag) of
    0 :
      begin
        Height := 121;
        Width := 298;
        btn := mbCancel;
        edtGrpName.Text := '';
        grpName.BringToFront;
        grpListPlatform.SendToBack;
      end;
    1 :
      begin
        Height := 415;
        Width  := 354;

        grpName.SendToBack;
        grpListPlatform.BringToFront;

        if Assigned(obj) then
        begin
          lv1.Items.Clear;
          lv1.Clear;

          grp := T3GroupVehicle(obj);
          for i := 0 to grp.CountVe - 1 do
          begin
            pi := TT3PlatformInstance(grp.GetVehicle(i));
            li := lv1.Items.Add;
            li.Caption := pi.InstanceName;

            if li.Selected then
              li.SubItems.Add('TRUE')
            else
              li.SubItems.Add('FALSE');

            li.Data := pi;
          end;
        end;
      end;
  end;
end;

procedure TfrmGroupName1.setGroupName(const Value: string);
begin
  FGroupName := Value;
end;

end.
