unit uPictureFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, RzTreeVw, Vcl.ExtCtrls;

type
  TfPictureFilter = class(TForm)
    btnLockAll: TButton;
    btnShowMainAll: TButton;
    btClose: TButton;
    btnLockAir: TButton;
    btnShowMainAir: TButton;
    btnLockSurface: TButton;
    btnShowMainSurface: TButton;
    btnLockSubsurface: TButton;
    btnShowMainSubsurface: TButton;
    btnLockLand: TButton;
    btnShowMainLand: TButton;
    btnLockGeneral: TButton;
    btnShowMainGeneral: TButton;
    RzGeneral: TRzCheckTree;
    RzNone: TRzCheckTree;
    btnShowMainNone: TButton;
    btnLockNone: TButton;
    RzSubsurface: TRzCheckTree;
    RzLand: TRzCheckTree;
    RzSurface: TRzCheckTree;
    RzAir: TRzCheckTree;
    RzAll: TRzCheckTree;
    pnlPageControlPictureFilter: TPanel;
    pnlTabAll: TPanel;
    pnlTabAir: TPanel;
    pnlTabSurface: TPanel;
    pnlTabSubsurface: TPanel;
    pnlTabLand: TPanel;
    pnlTabGeneral: TPanel;
    pnlTabNone: TPanel;
    pnlTabPictureFilter: TPanel;
    pnlContentPicutreFilter: TPanel;
    pnlContentAll: TPanel;
    pnlContentAir: TPanel;
    pnlContentSurface: TPanel;
    pnlContentSubsurface: TPanel;
    pnlContentLand: TPanel;
    pnlContentGeneral: TPanel;
    pnlContentNone: TPanel;
    procedure btCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckTreeStateChange(Sender: TObject; Node: TTreeNode;
      NewState: TRzCheckState);
    procedure CheckTreeCascadeComplete(Sender: TObject; Node: TTreeNode);
    procedure CheckTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckTreeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlTabPictureFilterClick(Sender: TObject);
  private
    procedure UpdateCheckTree;
    procedure UpdateChild(aNode: TTreeNode; aNewState: TRzCheckState);
    procedure UpdateParents(aNode: TTreeNode);
    procedure RecurseChild(aNode: TTreeNode; aNewState: TRzCheckState);

    function GetSameNode(aCheckTree: TRzCheckTree; aNode: TTreeNode;
      var rNodeAllState: TRzCheckState): TList;
  public
    { Public declarations }
  end;

var
  fPictureFilter: TfPictureFilter;

implementation

uses
  uFilter, tttData;

{$R *.dfm}

procedure TfPictureFilter.btCloseClick(Sender: TObject);
begin
  Hide;
end;

procedure TfPictureFilter.CheckTreeCascadeComplete(Sender: TObject;
  Node: TTreeNode);
begin
//  UpdateCheckTree;
end;

procedure TfPictureFilter.CheckTreeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TfPictureFilter.CheckTreeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ct : TRzCheckTree;
  nodeList : TList;
  newState, nodeAllState : TRzCheckState;
  i : Integer;
  tn : TTreeNode;
begin
  ct := TRzCheckTree(Sender);
  nodeList := GetSameNode(ct, ct.Selected, nodeAllState);
  newState := TRzCheckState(ct.Selected.StateIndex);

  for i := 0 to nodeList.Count - 1 do
  begin
    tn := nodeList.Items[i];

    if (ct.Tag <> Ord(pftAll)) and (tn.TreeView.Tag = Ord(pftAll)) then
    begin
      TRzCheckTree(tn.TreeView).ChangeNodeCheckState(tn, nodeAllState); //Redirect to: CheckTreeStateChange
      UpdateChild(tn, nodeAllState);
    end
    else
    begin
      TRzCheckTree(tn.TreeView).ChangeNodeCheckState(tn, newState); //Redirect to: CheckTreeStateChange
      UpdateChild(tn, newState);
    end;

    UpdateParents(tn);
  end;
end;

procedure TfPictureFilter.CheckTreeStateChange(Sender: TObject; Node: TTreeNode;
  NewState: TRzCheckState);
var
  pfType : TPictureFilterType;
  parent, state : string;
begin
  pfType := TPictureFilterType(TRzCheckTree(Sender).Tag);

  if Assigned(Node.Parent) then
    vFilter.UpdateNodeState(pfType, Node.Text, Node.Parent.Text, Node.StateIndex)
  else
    vFilter.UpdateNodeState(pfType, Node.Text, '', Node.StateIndex);
end;

procedure TfPictureFilter.FormCreate(Sender: TObject);
var
  i, j : Integer;
  c : TComponent;
  ct : TRzCheckTree;
  tn : TTreeNode;
  pfType : TPictureFilterType;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    c := Components[i];

    if not (c is TRzCheckTree) then
      Continue;

    ct := TRzCheckTree(c);
    pfType := TPictureFilterType(ct.Tag);

    for j := 0 to ct.Items.Count - 1 do
    begin
      tn := ct.Items[j];

      if Assigned(tn.Parent) then
        vFilter.Add(pfType, tn.Text, tn.Parent.Text, Ord(csChecked))
      else
        vFilter.Add(pfType, tn.Text, '', Ord(csChecked));
    end;

    ct.FullExpand;
  end;
end;

procedure TfPictureFilter.FormShow(Sender: TObject);
begin
  UpdateCheckTree;
//  PageControl1.TabIndex := 0;
  pnlTabAll.Color := RGB(44, 127, 161);
  pnlContentAll.BringToFront;
  pnlTabAll.Tag := 1;
  pnlTabAir.Tag := 0;
  pnlTabSurface.Tag := 0;
  pnlTabSubsurface.Tag := 0;
  pnlTabLand.Tag := 0;
  pnlTabGeneral.Tag := 0;
  pnlTabNone.Tag := 0;
  pnlTabAir.Color := RGB(29, 81, 103);
  pnlTabSurface.Color := RGB(29, 81, 103);
  pnlTabSubsurface.Color := RGB(29, 81, 103);
  pnlTabLand.Color := RGB(29, 81, 103);
  pnlTabGeneral.Color := RGB(29, 81, 103);
  pnlTabNone.Color := RGB(29, 81, 103);
end;

function TfPictureFilter.GetSameNode(aCheckTree: TRzCheckTree; aNode: TTreeNode;
  var rNodeAllState: TRzCheckState): TList;
var
  i, j, uncheckCount, checkCount : Integer;
  c : TComponent;
  ct : TRzCheckTree;
  tn : TTreeNode;
  tnParentTxt, nodeParentTxt : string;
begin
  Result := TList.Create;

  if Assigned(aNode.Parent) then
    nodeParentTxt := aNode.Parent.Text
  else
    nodeParentTxt := '';

  uncheckCount := 0;
  checkCount := 0;
  rNodeAllState := csUnknown;

  for i := 0 to ComponentCount - 1 do
  begin
    c := Components[i];

    if not (c is TRzCheckTree) then
      Continue;

    ct := TRzCheckTree(c);
    for j := 0 to ct.Items.Count - 1 do
    begin
      tn := ct.Items[j];

      if Assigned(tn.Parent) then
        tnParentTxt := tn.Parent.Text
      else
        tnParentTxt := '';

      if (tn.Text = aNode.Text) and (tnParentTxt = nodeParentTxt) then
      begin
        if aCheckTree.Tag <> Ord(pftAll) then
        begin
          if (ct.Tag <> Ord(pftAll)) and
            not (rNodeAllState = csPartiallyChecked) then
          begin
            Inc(uncheckCount, Ord(tn.StateIndex = Ord(csUnchecked)));
            Inc(checkCount,  Ord(tn.StateIndex = Ord(csChecked)));

            if (tn.StateIndex = Ord(csPartiallyChecked)) or
              ((uncheckCount > 0) and (checkCount > 0)) then
              rNodeAllState := csPartiallyChecked
            else if checkCount > 0 then
              rNodeAllState := csChecked
            else
              rNodeAllState := csUnchecked;
          end;

          if (ct.Tag <> Ord(pftAll)) and (ct.Tag <> aCheckTree.Tag) then
            Continue;
        end;

        Result.Add(tn);
        Break;
      end;
    end;
  end;
end;

procedure TfPictureFilter.RecurseChild(aNode: TTreeNode;
  aNewState: TRzCheckState);
begin
  while Assigned(aNode) do
  begin
    TRzCheckTree(aNode.TreeView).ChangeNodeCheckState(aNode, aNewState); //Redirect to: CheckTreeStateChange

    if aNode.getFirstChild <> nil then
      RecurseChild(aNode.getFirstChild, aNewState);

    aNode := aNode.getNextSibling;
  end;
end;

procedure TfPictureFilter.UpdateCheckTree;
var
  i, j : Integer;
  c : TComponent;
  ct : TRzCheckTree;
  tn : TTreeNode;
  found : Boolean;
  apData : PAnsiChar;
  rData : ^TRecItemData;
  pfType : TPictureFilterType;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    c := Components[i];

    if not (c is TRzCheckTree) then
      Continue;

    ct := TRzCheckTree(c);
    pfType := TPictureFilterType(ct.Tag);

    for j := 0 to ct.Items.Count - 1 do
    begin
      tn := ct.Items[j];

      if Assigned(tn.Parent) then
        vFilter.Find(pfType, tn.Text, tn.Parent.Text, found, apData)
      else
        vFilter.Find(pfType, tn.Text, '', found, apData);

      rData := @apData^;

      if found then
        tn.StateIndex := rData^.State;
    end;
  end;
end;

procedure TfPictureFilter.UpdateChild(aNode: TTreeNode;
  aNewState: TRzCheckState);
begin
  RecurseChild(aNode.getFirstChild, aNewState);
end;

procedure TfPictureFilter.UpdateParents(aNode: TTreeNode);
var
  uncheckedCount, checkedCount, newState : Integer;
begin
  while Assigned(aNode) and Assigned(aNode.Parent) do
  begin
    aNode := aNode.Parent.getFirstChild;
    uncheckedCount := 0;
    checkedCount := 0;

    while True do
    begin
      Inc(uncheckedCount, Ord(aNode.StateIndex = Ord(csUnchecked)));
      Inc(checkedCount, Ord(aNode.StateIndex = Ord(csChecked)));

      if (aNode.StateIndex = Ord(csPartiallyChecked)) or
        ((uncheckedCount > 0) and (checkedCount > 0)) then
      begin
        newState := Ord(csPartiallyChecked);
        Break;
      end;

      if aNode.getNextSibling = nil then
      begin
        if checkedCount > 0 then
          newState := Ord(csChecked)
        else
          newState := Ord(csUnchecked);

        Break;
      end
      else
        aNode := aNode.getNextSibling;
    end;

    aNode := aNode.Parent;

    if Assigned(aNode) then
      TRzCheckTree(aNode.TreeView).ChangeNodeCheckState(aNode,
        TRzCheckState(newState)); //Redirect to: CheckTreeStateChange
  end;
end;

procedure TfPictureFilter.pnlTabPictureFilterClick(Sender: TObject);
var
  PanelTag: integer;
  Panel: Tpanel;
begin
  panel := Sender as Tpanel;
  PanelTag := panel.Tag;


  if panel = pnlTabAll then
  begin
    if PanelTag = 0 then
    begin
      pnlTabAll.Color := RGB(44, 127, 161);
      pnlContentAll.BringToFront;
      pnlTabAll.Tag := 1;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabAir then
  begin
    if PanelTag = 0 then
    begin
      pnlTabAir.Color := RGB(44, 127, 161);
      pnlContentAir.BringToFront;
      pnlTabAir.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabSurface then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSurface.Color := RGB(44, 127, 161);
      pnlContentSurface.BringToFront;
      pnlTabSurface.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabSubsurface then
  begin
    if PanelTag = 0 then
    begin
      pnlTabSubsurface.Color := RGB(44, 127, 161);
      pnlContentSubsurface.BringToFront;
      pnlTabSubsurface.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabLand then
  begin
    if PanelTag = 0 then
    begin
      pnlTabLand.Color := RGB(44, 127, 161);
      pnlContentLand.BringToFront;
      pnlTabLand.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabGeneral then
  begin
    if PanelTag = 0 then
    begin
      pnlTabGeneral.Color := RGB(44, 127, 161);
      pnlContentGeneral.BringToFront;
      pnlTabGeneral.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabNone.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabNone.Color := RGB(29, 81, 103);
    end;
  end

  else if panel = pnlTabNone then
  begin
    if PanelTag = 0 then
    begin
      pnlTabNone.Color := RGB(44, 127, 161);
      pnlContentNone.BringToFront;
      pnlTabNone.Tag := 1;
      pnlTabAll.Tag := 0;
      pnlTabAir.Tag := 0;
      pnlTabSurface.Tag := 0;
      pnlTabSubsurface.Tag := 0;
      pnlTabLand.Tag := 0;
      pnlTabGeneral.Tag := 0;
      pnlTabAll.Color := RGB(29, 81, 103);
      pnlTabAir.Color := RGB(29, 81, 103);
      pnlTabSurface.Color := RGB(29, 81, 103);
      pnlTabSubsurface.Color := RGB(29, 81, 103);
      pnlTabLand.Color := RGB(29, 81, 103);
      pnlTabGeneral.Color := RGB(29, 81, 103);
    end;
  end;
end;

end.
