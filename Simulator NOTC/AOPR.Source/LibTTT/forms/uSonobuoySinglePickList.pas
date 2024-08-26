unit uSonobuoySinglePickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSimDBEditor, uDBAsset_Sonar, uSonobuoyWindow;

type
  TfSonobuoySelect = class(TForm)
    lbTempSonobuoyId: TListBox;
    lbSonobuoyList: TListBox;
    btNew: TButton;
    btEdit: TButton;
    btCopy: TButton;
    btRemove: TButton;
    btUsage: TButton;
    btFilter: TButton;
    btClose: TButton;
    procedure btEditClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btRemoveClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
    procedure Sonobuoy_Def;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure getDataSonobuoy;
  public
    { Public declarations }
    rList: Tlist;
    id_sonobuoy : string;
    procedure refresh;

  end;

var
  fSonobuoySelect: TfSonobuoySelect;
  pList : TList;

implementation


uses uDBAsset_Sonobuoy, uDataModuleTTT, uSonarDoubleList;

{$R *.dfm}

procedure TfSonobuoySelect.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfSonobuoySelect.btCopyClick(Sender: TObject);
begin
  SonobuoyWindowForm.isCopy := True;
  getDataSonobuoy;
end;

procedure TfSonobuoySelect.btEditClick(Sender: TObject);
begin
  SonobuoyWindowForm.isCopy := False;
  getDataSonobuoy;
end;

procedure TfSonobuoySelect.getDataSonobuoy;
begin
  if lbSonobuoyList.Selected[lbSonobuoyList.ItemIndex] then
      SonobuoyWindowForm.sonobuoyobject := pList[lbSonobuoyList.ItemIndex];
  id_sonobuoy := lbTempSonobuoyId.Items.Strings[lbSonobuoyList.ItemIndex];
  SonobuoyWindowForm.isNew := false;
  SonobuoyWindowForm.Show;
end;


procedure TfSonobuoySelect.btNewClick(Sender: TObject);
begin
  SonobuoyWindowForm.isNew := true;
  SonobuoyWindowForm.Show;
end;

procedure TfSonobuoySelect.btRemoveClick(Sender: TObject);
begin
  dmTTT.deleteSonobuoy_Def(StrToInt(lbTempSonobuoyId.Items.Strings[lbSonobuoyList.ItemIndex]));
  refresh;
end;

procedure TfSonobuoySelect.FormCreate(Sender: TObject);
begin
 pList := TList.Create;
end;

procedure TfSonobuoySelect.FormShow(Sender: TObject);
begin
  ShowMessage('Ujan');
end;

procedure TfSonobuoySelect.refresh;
var i : integer;
begin

 uSimDBEditor.getAllSonobuoy(0,plist,SonobuoyWindowForm.sonobuoyobject);

 lbSonobuoyList.Items.Clear;
 lbTempSonobuoyId.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbSonobuoyList.Items.Add(TSonobuoy_On_Board(pList[i]).FDef.Class_Identifier);
  lbTempSonobuoyId.Items.Add(IntToStr(TSonobuoy_On_Board(pList[i]).FDef.Sonobuoy_Index));
 end;

end;

procedure TfSonobuoySelect.Sonobuoy_Def;
var i:integer;
begin
  uSimDBEditor.getAllSonobuoy(StrToInt(fSonobuoySelect.id_sonobuoy),pList,SonobuoyWindowForm.sonobuoyobject);

  for i := 0 to pList.Count - 1 do begin
    with SonobuoyWindowForm do begin
      if isCopy then
        edtName.Text         := 'Copy of ' + TSonobuoy_On_Board(pList[i]).FDef.Class_Identifier
      else
        edtName.Text         := TSonobuoy_On_Board(pList[i]).FDef.Class_Identifier ;
      edtMaxDepth.Text     := FloatToStr(TSonobuoy_On_Board(pList[i]).FDef.Max_Depth);
      edtEnduranceTime.Text:= IntToStr(TSonobuoy_On_Board(pList[i]).FDef.Endurance_Time);
      edtLength.Text       := FloatToStr(TSonobuoy_On_Board(pList[i]).FDef.Length);
      edtWidth.Text        := FloatToStr(TSonobuoy_On_Board(pList[i]).FDef.Width);
      edtHeight.Text       := FloatToStr(TSonobuoy_On_Board(pList[i]).FDef.Height);

      uSimDBEditor.getAllSonar(TSonobuoy_On_Board(pList[i]).FDef.Sonar_Index,pList,fSonarDoubleList.sonar);
      edtSonarDef.Text     := TSonar_On_Board(pList[i]).FDef.Sonar_Identifier;
    end;

  end;

end;

end.
