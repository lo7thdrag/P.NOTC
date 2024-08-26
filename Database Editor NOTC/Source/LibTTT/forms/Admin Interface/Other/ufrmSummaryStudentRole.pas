unit ufrmSummaryStudentRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAssetObject, Vcl.Imaging.pngimage,
  Vcl.ComCtrls;

type
  TfrmSummaryStudentRole = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    edtName: TEdit;
    ImgBackgroundForm: TImage;
    Label1: TLabel;
    ImgHeader: TImage;
    btnEditList: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    pnl2ControlPage: TPanel;
    PageControl1: TPageControl;
    tsGeneral: TTabSheet;

    procedure FormShow(Sender: TObject);

    //Global
    procedure edtChange(Sender: TObject);

    procedure btnEditListClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);

  private
    FSelectedStudentRoleList : TStudent_Role_List;

    procedure UpdateStudentRoleData;
    function CekInput: Boolean;

  public
    isOK  : Boolean; {Penanda jika gagal cek input, btn OK tidak langsung close}
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, list tdk perlu di update }
    LastName : string;

    property SelectedStudentRoleList : TStudent_Role_List read FSelectedStudentRoleList write FSelectedStudentRoleList;
  end;

var
  frmSummaryStudentRole: TfrmSummaryStudentRole;
  student_def           : TStudent_Role_Definition;

implementation

{$R *.dfm}
uses
   uDataModuleTTT, ufrmEditStudentRoleList ;

{$REGION ' Form Handle '}

procedure TfrmSummaryStudentRole.FormShow(Sender: TObject);
begin
  tsGeneral.Show;
  UpdateStudentRoleData;

  with FSelectedStudentRoleList.FData do
    btnApply.Enabled := Role_List_Index = 0;

  isOK := True;
  AfterClose := True;
  btnCancel.Enabled := True;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSummaryStudentRole.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  if isOk then
    Close;
end;

procedure TfrmSummaryStudentRole.btnEditListClick(Sender: TObject);
begin
  frmEditRoleList := TfrmEditRoleList.Create(Self);
  try
    with frmEditRoleList do
    begin
      SelectedStudentRole := FSelectedStudentRoleList;
      ShowModal;
    end;
    btnApply.Enabled := frmEditRoleList.AfterClose;
    btnCancel.Enabled := not frmEditRoleList.AfterClose;
  finally
    frmEditRoleList.Free;
  end;
end;

procedure TfrmSummaryStudentRole.btnApplyClick(Sender: TObject);
begin
  with FSelectedStudentRoleList do
  begin
    if not CekInput then
    begin
      isOK := False;
      Exit;
    end;

    FData.Role_List_Identifier := edtName.Text;
    LastName := edtName.Text;

    if FData.Role_List_Index = 0 then
      dmTTT.InsertStudentRoleList(FData)
    else
      dmTTT.UpdateStudentRoleList(FData);

    btnEditList.Enabled := FData.Role_List_Index <> 0;
  end;

  isOK := True;
  AfterClose := True;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmSummaryStudentRole.btnCancelClick(Sender: TObject);
begin
  Close;
end;

function TfrmSummaryStudentRole.CekInput: Boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  Result := False;

  {Jika inputan class name kosong}
  if (edtName.Text = '') or (edtName.Text = ' ') then
  begin
    ShowMessage('Please use another class name');
    Exit;
  end;

  {Jika berisi spasi semua}
  if Copy(edtName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtName.Text[i] = #32 then
      numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  {Jika Class Name sudah ada}
  if (dmTTT.GetStudentRoleList(edtName.Text)>0) then
  begin
    {Jika inputan baru}
    if FSelectedStudentRoleList.FData.Role_List_Index = 0 then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end
    else if LastName <> edtName.Text then
    begin
      ShowMessage('Please use another class name');
      Exit;
    end;
  end;

  Result := True;
end;

procedure TfrmSummaryStudentRole.UpdateStudentRoleData;
begin
  with FSelectedStudentRoleList.FData do
  begin
    if Role_List_Index = 0 then
      edtName.Text := '(Unnamed)'
    else
      edtName.Text := Role_List_Identifier;

    LastName := edtName.Text;

    btnEditList.Enabled := Role_List_Index <> 0;
  end;
end;

procedure TfrmSummaryStudentRole.edtChange(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

{$ENDREGION}


end.
