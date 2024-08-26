unit uSnapshotDLG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmSnapshotDLG = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    stateCanceled : boolean;
    stateFinished : boolean;
  public
    function SendSnaphotMessage(): boolean;
  end;

var
  frmSnapshotDLG: TfrmSnapshotDLG;

implementation

{$R *.dfm}

function TfrmSnapshotDLG.SendSnaphotMessage(): boolean;
begin
  stateCanceled := false;
  stateFinished := false;

  ShowModal;

  Result := stateFinished;

end;

procedure TfrmSnapshotDLG.Button1Click(Sender: TObject);
var
  i, j: Integer;
  snapName : string;
begin
  snapName := Edit1.Text;
  j := 0;
  for i := 1 to Length(snapName) do
  begin
    if snapName[i] in ['\', '/', '.', '"', ':','*','?','<','>','|'] then
      Inc(j);
  end;
  if j = 0 then
  begin
    stateFinished := true;
    Close;
  end
  else
  begin
    ShowMessage('The name must not contain any of the following character: '+
     #13 +'\/ . " : * ? < > | .');
    Exit;
  end;
end;

procedure TfrmSnapshotDLG.Button2Click(Sender: TObject);
begin
  stateCanceled := true;
  Close;
end;

procedure TfrmSnapshotDLG.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 Then Begin
    If HiWord(GetKeyState(VK_SHIFT)) <> 0 then
     SelectNext(Sender as TWinControl,False,True)
    else
     SelectNext(Sender as TWinControl,True,True) ;
     Key := #0
   end;
end;

procedure TfrmSnapshotDLG.FormCreate(Sender: TObject);
begin
   //
end;

procedure TfrmSnapshotDLG.FormShow(Sender: TObject);
begin
   Edit1.Text := '';
   Edit1.SetFocus;
end;

end.
