unit ufCubicleGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, ExtCtrls;

type
  TfCubicleGroups = class(TForm)
    gbCubicleGroups: TPanel;
    Panel15: TPanel;
    Panel39: TPanel;
    PageControl3: TPageControl;
    TabSheet8: TTabSheet;
    Panel63: TPanel;
    tvCubicleGroups: TTreeView;
    TabSheet9: TTabSheet;
    Label157: TLabel;
    StringGrid23: TStringGrid;
    Button36: TButton;
    Button37: TButton;
    Panel38: TPanel;
    Panel64: TPanel;
    lvCubicle: TListView;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cList : TList;
  public
    { Public declarations }
    procedure setCubicles(list : TList);
    function getCubicles : Tlist;
    procedure DisplayCubicleGroups;
  end;

var
  fCubicleGroups: TfCubicleGroups;

implementation

uses
  uSimMgr_Client, uDBAssetObject;

{$R *.dfm}

procedure TfCubicleGroups.FormCreate(Sender: TObject);
begin
  cList := TList.Create;
end;

procedure TfCubicleGroups.setCubicles(list : TList);
begin
  cList := list;
end;

procedure TfCubicleGroups.DisplayCubicleGroups;
var
  I : Integer;
  li : TListItem;
begin
  lvCubicle.Items.Clear;
  tvCubicleGroups.Items.Clear;
  // set cubicle groups
  with (simMgrClient).Scenario do
  begin
    for i := 0 to CubiclesGroups.Count - 1 do
    begin
      li := lvCubicle.Items.Add;
      li.Caption := TCubicle_Group_Assignment(CubiclesGroups[i])
        .FData.Group_Identifier;
      li.SubItems.Add(IntToStr(TCubicle_Group_Assignment(CubiclesGroups[i])
            .FData.Group_Index));
      li.SubItems.Add('GC');
    end;

    // isi treeview
    for i := 0 to CubiclesGroups.Count - 1 do
    begin
      tvCubicleGroups.Items.AddChild(nil,
        (TCubicle_Group_Assignment(CubiclesGroups[i]).FData.Group_Identifier));
    end;

  end;
end;

function TfCubicleGroups.getCubicles : TList;
begin
   Result := cList;
end;

end.
