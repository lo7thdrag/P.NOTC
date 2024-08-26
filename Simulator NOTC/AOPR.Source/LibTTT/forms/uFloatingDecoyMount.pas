unit uFloatingDecoyMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TFloatingMountForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblAntenna: TStaticText;
    edtQuantity: TEdit;
    lblFeetAntenna: TStaticText;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    floating : TFloating_Decoy_On_board;
    procedure getData;
    procedure setData;
  end;

var
  FloatingMountForm: TFloatingMountForm;

implementation

uses
  uFloatingDecoySelect, uDataModuleTTT;

{$R *.dfm}

procedure TFloatingMountForm.btnApplyClick(Sender: TObject);
begin
  setData;
  dmTTT.updateFloating_Decoy(floating, IntToStr(floating.FData.Floating_Decoy_Instance_Index));
end;

procedure TFloatingMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fFloatingDecoySelect.FormShow(Sender);
end;

procedure TFloatingMountForm.btnOKClick(Sender: TObject);
begin
  setData;
  dmTTT.updateFloating_Decoy(floating, IntToStr(floating.FData.Floating_Decoy_Instance_Index));
  Close;
  fFloatingDecoySelect.FormShow(Sender);
end;

procedure TFloatingMountForm.FormCreate(Sender: TObject);
begin
  floating := TFloating_Decoy_On_Board.Create;
end;

procedure TFloatingMountForm.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TFloatingMountForm.getData;
begin
  with floating.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtQuantity.Text := IntToStr(Quantity);
  end;
end;

procedure TFloatingMountForm.setData;
begin
  with floating.FData do
  begin
    Instance_Identifier := edtName.Text;
    Quantity := StrToInt(edtQuantity.Text);
  end
end;

end.
