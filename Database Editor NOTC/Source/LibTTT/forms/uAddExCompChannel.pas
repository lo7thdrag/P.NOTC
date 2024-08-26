unit uAddExCompChannel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddExCompChannelForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    MemberName: TEdit;
    ChannelName: TEdit;
    btOk: TButton;
    btCancel: TButton;
    verLabel: TLabel;
    procedure btOkClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddExCompChannelForm: TAddExCompChannelForm;

implementation

uses
  ComCtrls, ufrmGroupAllocation;

{$R *.dfm}

procedure TAddExCompChannelForm.btCancelClick(Sender: TObject);
begin
  verLabel.Caption := '';
  MemberName.Text := '';
  ChannelName.Text := '';
  Self.Close;
end;

procedure TAddExCompChannelForm.btOkClick(Sender: TObject);
var
Li: TListItem;
count: integer;
begin
  if((MemberName.Text <> '') and (ChannelName.Text <> ''))
  then
  begin
    count := frmGroupAllocation.lstExternallComm.Items.Count;
    Li := frmGroupAllocation.lstExternallComm.Items.Add;
    Li.Caption := IntToStr(count);
    Li.SubItems.Add(MemberName.Text);
    Li.SubItems.Add(ChannelName.Text);
    //clear Field
    MemberName.Text := '';
    ChannelName.Text := '';
    Self.Close;
  end
  else
    verLabel.Caption := 'There are empty field, please insert first';
end;

end.
