unit uAddMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uGroupAllocationWindow, Grids, ExtCtrls;

type
  TAddMemberForm = class(TForm)
    Label1: TLabel;
    MemberName: TEdit;
    btOk: TButton;
    btCancel: TButton;
    verLabel: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    name: String;
  end;

var
  AddMemberForm: TAddMemberForm;

implementation

uses
  ComCtrls;

{$R *.dfm}

procedure TAddMemberForm.btCancelClick(Sender: TObject);
begin
  MemberName.Text := '';
  verLabel.Caption := '';
  Self.Close;
end;

procedure TAddMemberForm.btOkClick(Sender: TObject);
var
Li: TListItem;
count: integer;
begin
  if(MemberName.Text <> '')
  then
  begin
    count := GroupAllocationWindowForm.lstMembers.Items.Count;
    Li := GroupAllocationWindowForm.lstMembers.Items.Add;
    Li.Caption := IntToStr(count);
    Li.SubItems.Add(MemberName.Text);
    MemberName.Text := '';
    Self.Close;
  end
  else
    verLabel.Caption := 'This field is empty' ;
end;

end.
