unit uMADPicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfMADPicklist = class(TForm)
    lbTempId: TListBox;
    lbMAD: TListBox;
    btnClose: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure MAD_Def;
    procedure getMAD;
    procedure FormCreate(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure getDataMAD;
  public
    { Public declarations }
    id_mad : string;
  end;

var
  fMADPicklist: TfMADPicklist;
  sList : TList;
  isCopy : Boolean;
implementation

{$R *.dfm}

uses uDataModuleTTT, uDBAsset_Sensor, uMADWindow;

procedure TfMADPicklist.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfMADPicklist.btnCopyClick(Sender: TObject);
begin
  MADForm.isCopy := True;
  getDataMAD;
end;

procedure TfMADPicklist.btnEditClick(Sender: TObject);
begin
  MADForm.isCopy := False;
  getDataMAD;
end;

procedure TfMADPicklist.getDataMAD;
begin
  id_mad  := lbTempId.Items.Strings[lbMAD.ItemIndex];
  MAD_Def;
  MADForm.Show;
end;

procedure TfMADPicklist.btnNewClick(Sender: TObject);
begin

  with MADForm do begin
    isNew := True;
    edtClass.Text             := '';
    edtAssociatedCross.Text   := '';
    edtBaselineDetection.Text := '';

    Show;
  end;
end;

procedure TfMADPicklist.btnRemoveClick(Sender: TObject);
begin
  dmTTT.deleteMAD_Def(StrToInt(lbTempId.Items.Strings[lbMAD.ItemIndex]));
  getMAD;
end;

procedure TfMADPicklist.FormCreate(Sender: TObject);
begin
  sList := TList.Create;
end;

procedure TfMADPicklist.FormShow(Sender: TObject);
begin
  getMAD;
end;

procedure TfMADPicklist.MAD_Def;
var i:integer;
begin

  dmTTT.getMAD_Def(StrToInt(id_mad),sList,MADForm.MADObject);

  for I := 0 to sList.Count - 1 do
  begin
    with MADForm do begin
      if isCopy then
      begin
        edtClass.Text              := 'Copy of ' + TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Class_Identifier;
        isNew := True;
      end
      else
        edtClass.Text              := TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Class_Identifier;
      edtBaselineDetection.Text  := FloatToStr(TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Baseline_Detect_Range);
      edtAssociatedCross.Text    := FloatToStr(TMAD_Sensor_On_Board(sList[i]).FMAD_Def.Known_Cross_Section);
    end;

  end;
end;

procedure TfMADPicklist.getMAD;
var int:integer;
begin

//get all sonar name
 dmTTT.getMAD_Def(0,sList,MADForm.MADObject);

 lbMAD.Items.Clear;
 lbTempId.Items.Clear;

 for int := 0 to sList.Count - 1 do
 begin
    lbMAD.Items.Add(TMAD_Sensor_On_Board(sList[int]).FMAD_Def.Class_Identifier);
    lbTempId.Items.Add(IntToStr(TMAD_Sensor_On_Board(sList[int]).FMAD_Def.MAD_Index));
 end;

end;

end.
