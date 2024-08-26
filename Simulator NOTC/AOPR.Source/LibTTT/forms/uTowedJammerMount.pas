unit uTowedJammerMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TTowedJammerMountForm = class(TForm)
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
    towedJammer : TTowed_Jammer_Decoy_On_Board;
    procedure getData;
    procedure setData;
  end;

var
  TowedJammerMountForm: TTowedJammerMountForm;

implementation

uses
  uTJDecoySelect, uDataModuleTTT;

{$R *.dfm}

procedure TTowedJammerMountForm.btnApplyClick(Sender: TObject);
begin
  setData;
  dmTTT.updateTowed_Jammer(towedJammer, IntToStr(towedJammer.FData.Towed_Decoy_Instance_Index));
end;

procedure TTowedJammerMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fTJDecoySelect.FormShow(Sender);
end;

procedure TTowedJammerMountForm.btnOKClick(Sender: TObject);
begin
  setData;
  dmTTT.updateTowed_Jammer(towedJammer, IntToStr(towedJammer.FData.Towed_Decoy_Instance_Index));
  Close;
  fTJDecoySelect.FormShow(Sender);
end;

procedure TTowedJammerMountForm.FormCreate(Sender: TObject);
begin
  towedJammer := TTowed_Jammer_Decoy_On_Board.Create;
end;

procedure TTowedJammerMountForm.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TTowedJammerMountForm.getData;
begin
  with towedJammer.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtQuantity.Text := IntToStr(Quantity);
  end;
end;

procedure TTowedJammerMountForm.setData;
begin
  with towedJammer.FData do
  begin
    Instance_Identifier := edtName.Text;
    Quantity := StrToInt(edtQuantity.Text);
  end;
end;

end.
