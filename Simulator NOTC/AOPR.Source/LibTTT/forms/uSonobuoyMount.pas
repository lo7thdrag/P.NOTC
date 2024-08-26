unit uSonobuoyMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Sonobuoy;

type
  TSonobuoyMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblClassName: TStaticText;
    edtClassName: TEdit;
    lblMountExtension: TStaticText;
    cbMountExtension: TComboBox;
    lblQuantity: TStaticText;
    edtQuantity: TEdit;
    lblSonarMount: TStaticText;
    edtSonarMount: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sono : TSonobuoy_On_Board;
    procedure getData;
  end;

var
  SonobuoyMountForm: TSonobuoyMountForm;

implementation

uses
  uDataModuleTTT, uSonobuoyDoublePickList;

{$R *.dfm}

procedure TSonobuoyMountForm.btnApplyClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateSonobuoy_On_Board(IntToStr(sono.FData.Sonobuoy_Instance_Index),sono);
end;

procedure TSonobuoyMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fSonobuoyDoublePickList.Show;
end;

procedure TSonobuoyMountForm.btnOKClick(Sender: TObject);
begin
  getData;
  dmTTT.UpdateSonobuoy_On_Board(IntToStr(sono.FData.Sonobuoy_Instance_Index),sono);
  Close;
  fSonobuoyDoublePickList.Show;
end;

procedure TSonobuoyMountForm.FormCreate(Sender: TObject);
begin
  sono := TSonobuoy_On_Board.Create;
end;

procedure TSonobuoyMountForm.FormShow(Sender: TObject);
begin
  with sono.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtClassName.Text := Instance_Identifier;
    edtQuantity.Text := IntToStr(Quantity);
    edtSonarMount.Text := IntToStr(Sonar_Instance_Index);
    cbMountExtension.ItemIndex := Instance_Type;
  end;
end;

procedure TSonobuoyMountForm.getData;
begin
  with sono.FData do
  begin
    Instance_Identifier := edtName.Text;
    Quantity := StrToInt(edtQuantity.Text);
    Sonar_Instance_Index := StrToInt(edtSonarMount.Text);
    Instance_Type := cbMountExtension.ItemIndex;
  end;
end;

end.
