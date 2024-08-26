unit uTorpedoSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfTorpedoSingleList = class(TForm)
    lbTempId: TListBox;
    lbTorpedo: TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure refresh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTorpedoSingleList: TfTorpedoSingleList;
  mList : TList;

implementation

{$R *.dfm}
uses uDataModuleTTT, uSimDBEditor, uDBAsset_Weapon;

procedure TfTorpedoSingleList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfTorpedoSingleList.FormCreate(Sender: TObject);
begin
  mList := TList.Create;
end;

procedure TfTorpedoSingleList.refresh;
var
 I: Integer;
begin

  uSimDBEditor.getAllTorpedo(0,mList,);

  lbTorpedo.Clear;
  lbTempId.Clear;
  for I := 0 to mList.Count - 1 do
  begin
    lbTorpedo.Items.Add(TTorpedo_On_Board(mList[I]).FDef.Class_Identifier);
    lbTempId.Items.Add(IntToStr(TTorpedo_On_Board(mList[I]).FDef.Torpedo_Index));
  end;

end;

end.
