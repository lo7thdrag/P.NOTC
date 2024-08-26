unit uReferencePointNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, tttData;

type
  TfReferencePointNew = class(TForm)
    lbl1: TLabel;
    edtReferenceName: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isNew : boolean;
    new_ref  : String;
  end;

var
  fReferencePointNew: TfReferencePointNew;

implementation

uses uDataModuleTTT, ufrmSummaryResourceAllocation, uReferencePointEditor,
  uDBAsset_Reference_Point;

{$R *.dfm}

procedure TfReferencePointNew.btnApplyClick(Sender: TObject);
var ref_point : TReference_Point;
begin
  ref_point := TReference_Point.Create;
  with ref_point.FData do begin
    Resource_Alloc_Index  := fReferencePointEditor.ra_id;
    Reference_Identifier  := edtReferenceName.Text;
    Force_Designation     := fReferencePointEditor.force;
    new_ref               := Reference_Identifier;
  end;
  if isNew then
  begin
    fReferencePointEditor.rpList.Add(ref_point);
//      dmTTT.insertReference(ref_point);
    isNew := false;
  end
  else fReferencePointEditor.rpList.Items[fReferencePointEditor.rpList.Count-1] := ref_point;
//    else dmTTT.updateReference(ref_point,IntToStr(ref_point.Reference_Index));
  fReferencePointEditor.changed := true;
  fReferencePointEditor.refreshNameList;
end;

procedure TfReferencePointNew.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfReferencePointNew.btnOkClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
end;

procedure TfReferencePointNew.FormShow(Sender: TObject);
begin
  edtReferenceName.Text := '(Reference Point)';
  new_ref := '';
end;

end.
