unit uAddParticipant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAddParticipantForm = class(TForm)
    EParticipantName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EOctalPUC: TEdit;
    btOK: TButton;
    btCancel: TButton;
    verLabel: TLabel;
    procedure btCancelClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddParticipantForm: TAddParticipantForm;

implementation

uses
  ComCtrls, uLinkWindow;

{$R *.dfm}

procedure TAddParticipantForm.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TAddParticipantForm.btOKClick(Sender: TObject);
var
  Li: TListItem;
  count: Integer;
begin
  if (EParticipantName.Text <> '') and (EOctalPUC.Text <> '') then
    begin
    count := LinkWindowForm.lstParticipants.Items.Count;
    Li := LinkWindowForm.lstParticipants.Items.Add;
    Li.Caption := Self.EParticipantName.Text;
    Li.SubItems.Add(EOctalPUC.Text);
    end
  else
    verLabel.Caption := 'There are empty fields';

  Self.Close;
end;

end.
