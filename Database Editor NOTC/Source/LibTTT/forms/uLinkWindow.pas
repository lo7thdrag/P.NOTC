unit uLinkWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls, Buttons;

type
  TLinkWindowForm = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    lblIdentifierNumber: TLabel;
    cbxIdentifierNumber: TComboBox;
    lblName: TLabel;
    edtName: TEdit;
    lblController: TLabel;
    edtController: TEdit;
    lblForce: TLabel;
    edtForce: TEdit;
    lblMode: TLabel;
    cbxMode: TComboBox;
    grbParticipants: TGroupBox;
    btnAdd: TButton;
    btnRemove: TButton;
    btnNew: TButton;
    btnApply: TButton;
    btnRemove2: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lstParticipants: TListView;
    btnBrowse: TSpeedButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LinkWindowForm: TLinkWindowForm;

implementation

uses uAddParticipant;

{$R *.dfm}

procedure TLinkWindowForm.btnAddClick(Sender: TObject);
begin
  AddParticipantForm.Left := (Screen.Width-Width) div 2;
  AddParticipantForm.Top := (Screen.Height) div 2;
  AddParticipantForm.EParticipantName.Text := '';
  AddParticipantForm.EOctalPUC.Text := '';
  AddParticipantForm.verLabel.Caption := '';
  AddParticipantForm.ShowModal;
end;

procedure TLinkWindowForm.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TLinkWindowForm.btnRemoveClick(Sender: TObject);
begin
  if (lstParticipants.Selected <> nil)
  then
    lstParticipants.DeleteSelected;
end;

end.
