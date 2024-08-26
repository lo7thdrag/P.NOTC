unit uChaffMount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Countermeasure;

type
  TChaffMountForm = class(TForm)
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
    chaff : TChaff_On_Board;
    procedure getData;
    procedure setData;
  end;

var
  ChaffMountForm: TChaffMountForm;

implementation

uses
  uChaffSelect, uDataModuleTTT;

{$R *.dfm}

procedure TChaffMountForm.btnApplyClick(Sender: TObject);
begin
  setData;
  dmTTT.updateChaff(chaff, IntToStr(chaff.FData.Chaff_Index), IntToStr(chaff.FData.Chaff_Instance_Index));
end;

procedure TChaffMountForm.btnCancelClick(Sender: TObject);
begin
  Close;
  fChaffSelect.FormShow(Sender);
end;

procedure TChaffMountForm.btnOKClick(Sender: TObject);
begin
  setData;
  dmTTT.updateChaff(chaff, IntToStr(chaff.FData.Chaff_Index), IntToStr(chaff.FData.Chaff_Instance_Index));
  Close;
  fChaffSelect.FormShow(Sender);
end;

procedure TChaffMountForm.FormCreate(Sender: TObject);
begin
  chaff := TChaff_On_Board.Create;
end;

procedure TChaffMountForm.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TChaffMountForm.getData;
begin
  with chaff.FData do
  begin
    edtName.Text := Instance_Identifier;
    edtQuantity.Text := IntToStr(Chaff_Qty_On_Board);
  end;
end;

procedure TChaffMountForm.setData;
begin
  with chaff.FData do
  begin
    Instance_Identifier := edtName.Text;
    Chaff_Qty_On_Board := StrToInt(edtQuantity.Text);
  end;
end;

end.
