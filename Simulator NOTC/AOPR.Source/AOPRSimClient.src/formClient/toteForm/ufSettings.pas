unit ufSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, XMLDoc;

type
  TfSettings = class(TForm)
    gbSettings: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    gbSetEnDis: TGroupBox;
    cbSetEnDis: TCheckBox;
    gbSetTime: TGroupBox;
    edtSetTime: TEdit;
    Button1: TButton;
    btnSetXML: TButton;
    btnGetXML: TButton;
    tvSettings: TTreeView;
    procedure btnSetXMLClick(Sender: TObject);
    procedure btnGetXMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TreeToXML(tv: TTreeView);
    procedure XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
  end;

var
  fSettings: TfSettings;

implementation

uses
  XMLIntf;

{$R *.dfm}

procedure TfSettings.btnGetXMLClick(Sender: TObject);
var
  XMLDoc : TXMLDocument;
begin
  XMLDoc := TXMLDocument.Create(nil);

  // ShowMessage(temp);
  XMLToTree(tvSettings, XMLDoc);
  tvSettings.AutoExpand := False;
  tvSettings.Items[0].Expand(true);
end;

procedure TfSettings.btnSetXMLClick(Sender: TObject);
begin
  TreeToXML(Self.tvSettings);
end;

procedure TfSettings.TreeToXML(tv: TTreeView);
var
  tn: TTreeNode;
  XMLDoc: TXMLDocument;
  iNode: IXMLNode;

  procedure ProcessTreeItem(tn: TTreeNode; iNode: IXMLNode);
  var
    cNode: IXMLNode;
  begin
    if (tn = nil) then
      exit;
    cNode := iNode.AddChild('item');
    cNode.Attributes['text'] := tn.Text;
    cNode.Attributes['imageIndex'] := tn.ImageIndex;
    cNode.Attributes['stateIndex'] := tn.StateIndex;

    // child nodes
    tn := tn.getFirstChild;
    while tn <> nil do
    begin
      ProcessTreeItem(tn, cNode);
      tn := tn.getNextSibling;
    end;
  end;

begin
  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.Active := true;
  iNode := XMLDoc.AddChild('tree2xml');
  iNode.Attributes['app'] := ParamStr(0);

  tn := tv.TopItem;
  while tn <> nil do
  begin
    ProcessTreeItem(tn, iNode);

    tn := tn.getNextSibling;
  end;

  XMLDoc.SaveToFile(ChangeFileExt('setting', '.XML'));

  XMLDoc := nil;
end;

procedure TfSettings.XMLToTree(tv: TTreeView; XMLDoc: TXMLDocument);
var
  iNode: IXMLNode;
  procedure ProcessNode(Node: IXMLNode; tn: TTreeNode);
  var
    cNode: IXMLNode;
  begin
    if Node = nil then
      exit;
    with Node do
    begin
      tn := tv.Items.AddChild(tn, Attributes['text']);
      tn.ImageIndex := Integer(Attributes['imageIndex']);
      tn.StateIndex := Integer(Attributes['stateIndex']);
    end;
    cNode := Node.ChildNodes.First;
    while cNode <> nil do
    begin
      ProcessNode(cNode, tn);
      cNode := cNode.NextSibling;
    end;
  end;
(* ProcessNode *)
begin
  tv.Items.Clear;
  // XMLDoc.FileName := ChangeFileExt('setting', '.XML');
  XMLDoc.LoadFromFile('setting.XML');
  XMLDoc.AfterConstruction;
  XMLDoc.Active := true;
  iNode := XMLDoc.DocumentElement.ChildNodes.First;

  while iNode <> nil do
  begin
    ProcessNode(iNode, nil);
    iNode := iNode.NextSibling;
  end;

  XMLDoc.Active := False;
end;

end.
