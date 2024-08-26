unit uESMPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSimDBEditor;

type
  TfESMPickList = class(TForm)
    lbESM: TListBox;
    btnNew: TButton;
    btnEdit: TButton;
    lbIdRadars: TListBox;
    btClose: TButton;
    btCopy: TButton;
    btFilter: TButton;
    btRemove: TButton;
    btUsage: TButton;
    lbTempidESMs: TListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btCopyClick(Sender: TObject);
  private
    { Private declarations }
    procedure getDataESM;
  public
    { Public declarations }
    rList: Tlist;
    procedure refresh;
  end;

var
  fESMPickList: TfESMPickList;
  pList : TList;


implementation

uses uDBAsset_Sensor,uESMWindow;

{$R *.dfm}

procedure TfESMPickList.getDataESM;
begin
  if lbESM.Selected[lbESM.ItemIndex] then
      fESMWindow.ESMobject := pList[lbESM.ItemIndex];
  fESMWindow.isNew := false;
  fESMWindow.Show;
end;


procedure TfESMPickList.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfESMPickList.btCopyClick(Sender: TObject);
begin
  fESMWindow.isCopy := True;
  getDataESM;
end;

procedure TfESMPickList.btnEditClick(Sender: TObject);
begin
  fESMWindow.isCopy := False;
  getDataESM;
end;

procedure TfESMPickList.btnNewClick(Sender: TObject);
begin
 fESMWindow.isNew := true;
 fESMWindow.Show;
end;

procedure TfESMPickList.FormCreate(Sender: TObject);
begin
 pList := Tlist.Create;

end;

procedure TfESMPickList.FormShow(Sender: TObject);
begin
  refresh;
end;

procedure TfESMPickList.refresh;
var i : integer;
begin

 uSimDBEditor.getAllESM_Definition(plist);

 lbESM.Items.Clear;
 lbTempidESMs.Items.Clear;

 for I := 0 to pList.Count - 1 do begin
  lbESM.Items.Add(TESM_On_Board(pList[i]).FESM_Def.Class_Identifier);
  lbTempidESMs.Items.Add(IntToStr(TESM_On_Board(pList[i]).FData.ESM_Index));
 end;
  //fRadarSummary.Show;
end;
end.
