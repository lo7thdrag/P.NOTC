unit ufmEmbarkPositionInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ufrmBaseResourceAllocationPickList, MapXLib_TLB, uBaseCoordSystem,
  ufmBaseLocation, uDataModuleTTT, uDBAsset_Base;

type
  TfmEmbarkPositionInput = class(TForm)
    Label23: TLabel;
    Label24: TLabel;
    edtPosLat: TEdit;
    edtPosLong: TEdit;
    SpeedButton3: TSpeedButton;
    btnOK: TButton;
    btnSelectList: TButton;
    edtBaseLocation: TEdit;
    lblBaseName: TLabel;
    lblSelectFromList: TLabel;
    procedure btnOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectListClick(Sender: TObject);
    procedure lblSelectFromListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    OpenBy : Byte; {0: open form fmBaseLocation; 1: Open from fmEmbarkLibrary}
    IdAction : Byte; {0: New; 1: Edit; 2: Pick}

//    IsClose, FromBase, IsNew, FromEEdit, IsOk, IsUpdate: Boolean;
    LastName, LastLat, LastLong : string;
    function CekInput: Boolean;

  end;

var
  fmEmbarkPositionInput: TfmEmbarkPositionInput;

implementation

uses
  ufrmAdminMainForm;

{$R *.dfm}

procedure TfmEmbarkPositionInput.btnOKClick(Sender: TObject);
begin
  if OpenBy = 0 then
  begin
    if not CekInput then
      Exit;

    close;
    with fmBaseLocation do
    begin
      Base_Location.FDAta.Base_Identifier := edtBaseLocation.Text;
      Base_Location.FDAta.Longitude := dmsToLong(edtPosLong.Text);
      Base_Location.FDAta.Latitude := dmsToLatt(edtPosLat.Text);

      case IdAction of
        0: {New}
        begin
          dmTTT.InsertBase_Location(Base_Location);
        end;
        1: {Edit}
        begin
          dmTTT.DeleteBase_Location(lbBaseID.Items[lbBaseLocation.ItemIndex]);
          dmTTT.InsertBase_Location(Base_Location);
        end;
      end;

      ShowModal;
    end;
  end
  else if OpenBy = 1 then
  begin
    close;
    with frmBaseResourceAllocationPickList do
    begin
//      FillBaseSelectedList;
      ShowModal;
    end;
  end;

  frmAdminMainForm.Map1.CurrentTool := miArrowTool;
  frmAdminMainForm.isBasePosition := False;
end;

procedure TfmEmbarkPositionInput.btnSelectListClick(Sender: TObject);
begin
  Close;
  if OpenBy = 0 then
  begin
    frmBaseResourceAllocationPickList.Close;
    fmBaseLocation.ShowModal;
  end
  else if OpenBy = 1 then
  begin
    fmBaseLocation.Close;
    frmBaseResourceAllocationPickList.Show;
  end;

  frmAdminMainForm.Map1.CurrentTool := miArrowTool;
  frmAdminMainForm.isBasePosition := False;
end;

function TfmEmbarkPositionInput.CekInput: Boolean;
begin
  Result := False;

  if edtBaseLocation.Text = '' then
  begin
    ShowMessage('Incomplete data input');
    Exit;
  end;

  if (dmTTT.CekBase_Location(edtBaseLocation.Text)) and (IdAction = 0) then
  begin
    ShowMessage('Please use another name');
    Exit;
  end;

  if (IdAction = 1) and (LastName <> edtBaseLocation.Text) then
  begin
    if (dmTTT.CekBase_Location(edtBaseLocation.Text))then
    begin
      ShowMessage('Please use another name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfmEmbarkPositionInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmAdminMainForm.Map1.CurrentTool := miArrowTool;
end;

procedure TfmEmbarkPositionInput.FormShow(Sender: TObject);
begin
  if OpenBy = 0 then
  begin
    lblBaseName.Visible := True;
    edtBaseLocation.Visible := True;
//    btnSelectList.Visible := False;
  end
  else if OpenBy = 1 then
  begin
    lblBaseName.Visible := False;
    edtBaseLocation.Visible := False;
//    btnSelectList.Visible := True;
  end;
end;

procedure TfmEmbarkPositionInput.lblSelectFromListClick(Sender: TObject);
begin
  Close;
  fmBaseLocation.ShowModal;

//  LastLong := edtPosLong.Text;
//  LastLat := edtPosLat.Text;
end;

procedure TfmEmbarkPositionInput.SpeedButton3Click(Sender: TObject);
begin
  frmAdminMainForm.isBasePosition := True;
  frmAdminMainForm.Map1.CurrentTool := TOOL_POSITION;
end;

end.
