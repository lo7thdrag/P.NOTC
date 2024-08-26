unit uSonobuoyWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, uDBAsset_Sonobuoy;

type
  TSonobuoyWindowForm = class(TForm)
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
    edtMaxDepth: TEdit;
    lblMountExtension: TStaticText;
    lblQuantity: TStaticText;
    edtSonarDef: TEdit;
    txt1: TStaticText;
    txt2: TStaticText;
    txt3: TStaticText;
    edtEnduranceTime: TEdit;
    ts1: TTabSheet;
    btn1: TButton;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtLength: TEdit;
    edtWidth: TEdit;
    edtHeight: TEdit;
    ts2: TTabSheet;
    mmNotes: TMemo;
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure getData;
  public
    { Public declarations }
    sonobuoyobject  : TSonobuoy_On_Board;
    isNew,isCopy           : Boolean;
  end;

var
  SonobuoyWindowForm: TSonobuoyWindowForm;

implementation

{$R *.dfm}

uses uSimDBEditor, uSonobuoySinglePicklist, uDataModuleTTT, uSonarDoubleList;

procedure TSonobuoyWindowForm.btn1Click(Sender: TObject);
begin
  fSonarDoubleList.fromCharacteristic := false;
  fSonarDoubleList.fromSonobuoy := true;
  fSonarDoubleList.Show;
end;

procedure TSonobuoyWindowForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    uSimDBEditor.insertSonobuoy_Def(sonobuoyobject);
    isNew := False;
  end
  else
  begin
    getData;
    uSimDBEditor.updateSonobuoy_Def(sonobuoyobject,fSonobuoySelect.id_sonobuoy);
  end;
end;

procedure TSonobuoyWindowForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TSonobuoyWindowForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);
  Close;
  fSonobuoySelect.refresh;

end;

procedure TSonobuoyWindowForm.FormCreate(Sender: TObject);
begin
  sonobuoyobject  := TSonobuoy_On_Board.Create;
end;

procedure TSonobuoyWindowForm.FormShow(Sender: TObject);
begin

  if isNew then
  begin
    with SonobuoyWindowForm do begin
      edtName.Text           := '';
      edtMaxDepth.Text       := '';
      edtSonarDef.Text       := '';
      edtEnduranceTime.Text  := '';
      edtLength.Text         := '';
      edtWidth.Text          := '';
      edtHeight.Text         := '';
    end;

  end
  else begin
    fSonobuoySelect.Sonobuoy_Def;
  end;

end;

procedure TSonobuoyWindowForm.getData;
begin
  with sonobuoyobject.FDef do
  begin
    Class_Identifier        := edtName.Text;
   { Sonobuoy_Type           := StrToFloat();
    Platform_Domain         := FieldByName('Platform_Domain').AsInteger;
    Platform_Category       := FieldByName('Platform_Category').AsInteger;
    Platform_Type           := FieldByName('Platform_Type').AsInteger;   }
    Endurance_Time          := StrToInt(edtEnduranceTime.Text);
    Max_Depth               := StrToFloat(edtMaxDepth.Text);
    Length                  := StrToFloat(edtLength.Text);
    Width                   := StrToFloat(edtWidth.Text);
    Height                  := StrToFloat(edtHeight.Text);
    Sonar_Index             := StrToInt(fSonarDoubleList.sId);
  end;

  sonobuoyobject.FNote.Notes := mmNotes.Lines.Text;
end;



end.
