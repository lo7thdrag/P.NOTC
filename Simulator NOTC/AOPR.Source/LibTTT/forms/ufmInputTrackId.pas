unit ufmInputTrackId;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uT3Unit, uT3Vehicle,
  uDBAsset_Embark_Library, ExtCtrls, uDBCubicles;

type
  TfmInputTrackId = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edtTrackId: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    lbl3: TLabel;
    lblWeight: TLabel;
    lbl4: TLabel;
    lblWidth: TLabel;
    lbl6: TLabel;
    lblLength: TLabel;
    lstGroup: TListBox;
    lblGroup: TLabel;
    edtName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    Vehicle : TT3Vehicle;
    grpId : Integer;
  end;

var
  fmInputTrackId: TfmInputTrackId;

implementation

uses
  uDBScenario;

{$R *.dfm}

procedure TfmInputTrackId.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInputTrackId.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfmInputTrackId.FormShow(Sender: TObject);
begin
  edtTrackId.Text := 'Null'
end;

procedure TfmInputTrackId.lstGroupClick(Sender: TObject);
var
  grp : T3CubicleGroup;
begin
  btnOk.Enabled := True;
  if lstGroup.ItemIndex < 0 then
    Exit;

  grp := lstGroup.Items.Objects[lstGroup.ItemIndex] as T3CubicleGroup;
  if Assigned (grp) then
  begin
   grpId := grp.FData.Group_Index;
  end;
end;

end.
