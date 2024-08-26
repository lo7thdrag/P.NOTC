unit uFormationList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormationListForm = class(TForm)
    lstFormation: TListBox;
    btOk: TButton;
    btCancel: TButton;
    procedure btCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure refreshFormationList;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormationListForm: TFormationListForm;

implementation

uses
  uDBFormation, uSimDBEditor, uFormationEditorPanel;

{$R *.dfm}

procedure TFormationListForm.btCancelClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFormationListForm.btOkClick(Sender: TObject);
begin
  if ((lstFormation.ItemIndex > -1) or (lstFormation.ItemIndex < lstFormation.Count)) then
  begin
    with FormationEditorPanelForm do
    begin
      edtName.Text := lstFormation.Items.Strings[lstFormation.ItemIndex];
      //belum pake insert pada edit yang lain
    end;

  end;

end;

procedure TFormationListForm.FormShow(Sender: TObject);
begin
  //get Formation Identifier from uDataModulTTT
  refreshFormationList;
end;

procedure TFormationListForm.refreshFormationList;
var
  I: Integer;
  form: TFormation;
begin

  with SIMMgr do
  begin
    getFormationAssignment(form, Formation);

    //clear the item first
    lstFormation.Clear;

    for I := 0 to Formation.Count - 1 do
    begin
       //add list Available
       lstFormation.Items.Add(form.FFormation_Def.Formation_Identifier);
    end;

  end;
end;

end.
