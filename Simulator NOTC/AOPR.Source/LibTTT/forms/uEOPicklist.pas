unit uEOPicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfEO = class(TForm)
    lbTempId: TListBox;
    lbEO: TListBox;
    btnClose: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    btnFilter: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure getEO;
    procedure EO_Def;
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataEO;
  public
    { Public declarations }
    id_eo : string;
  end;

var
  fEO: TfEO;
  sList : TList;

implementation

{$R *.dfm}

uses uDBAsset_Sensor,uDataModuleTTT, uElectroOpticalDetector;

procedure TfEO.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfEO.btnCopyClick(Sender: TObject);
begin
  ElectroOpticalForm.isCopy := True;
  getDataEO;
end;

procedure TfEO.btnEditClick(Sender: TObject);
begin
  ElectroOpticalForm.isCopy := False;
  getDataEO;
end;

procedure TfEO.getDataEO;
begin
  id_eo  := lbTempId.Items.Strings[lbEO.ItemIndex];
  EO_Def;
  ElectroOpticalForm.Show;
end;

procedure TfEO.btnNewClick(Sender: TObject);
begin

  with ElectroOpticalForm do begin
    isNew := True;
    edtClass.Text            := '';
    edtMaxPossible.Text      := '';
    edtAssociatedCross.Text  := '';
    edtDetectionRange.Text   := '';
    cbbSensorType.Clear;

    Show;
  end;
end;

procedure TfEO.btnRemoveClick(Sender: TObject);
begin
  dmTTT.deleteEO_Def(StrToInt(lbTempId.Items.Strings[lbEO.ItemIndex]));
  getEO;
end;

procedure TfEO.FormCreate(Sender: TObject);
begin
  sList := TList.Create;
end;

procedure TfEO.FormShow(Sender: TObject);
begin
  getEO;
end;

procedure TfEO.getEO;
var int:integer;
begin

//get all sonar name
 dmTTT.getEO_Def(0,sList,ElectroOpticalForm.EOObject);

 lbEO.Items.Clear;
 lbTempId.Items.Clear;

 for int := 0 to sList.Count - 1 do
 begin
    lbEO.Items.Add(TEO_On_Board(sList[int]).FEO_Def.Class_Identifier);
    lbTempId.Items.Add(IntToStr(TEO_On_Board(sList[int]).FEO_Def.EO_Index));
 end;
end;

procedure TfEO.EO_Def;
var i :integer;
begin

  dmTTT.getEO_Def(StrToInt(id_eo),sList,ElectroOpticalForm.EOObject);

  for I := 0 to sList.Count - 1 do
  begin
    with ElectroOpticalForm do begin
      if isCopy then
      begin
        edtClass.Text     := 'Copy of '+ TEO_On_Board(sList[i]).FEO_Def.Class_Identifier;
        isNew := True;
      end
      else
        edtClass.Text            := TEO_On_Board(sList[i]).FEO_Def.Class_Identifier;
      edtMaxPossible.Text      := FloatToStr(TEO_On_Board(sList[i]).FEO_Def.Max_Range);
      edtAssociatedCross.Text  := FloatToStr(TEO_On_Board(sList[i]).FEO_Def.Known_Cross_Section);
      edtDetectionRange.Text   := FloatToStr(TEO_On_Board(sList[i]).FEO_Def.Detection_Range);

      if (TEO_On_Board(sList[i]).FEO_Def.Sensor_Type) = 0 then
        cbbSensorType.Text   := 'EO Sensor(Optical)'
      else if (TEO_On_Board(sList[i]).FEO_Def.Sensor_Type) = 1 then
        cbbSensorType.Text   := 'Laser Sensor'
      else
        cbbSensorType.Text   := 'IR Sensor(Infrared)';
    end;
  end;
end;


end.
