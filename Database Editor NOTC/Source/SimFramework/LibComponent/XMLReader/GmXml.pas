{******************************************************************************}
{                                                                              }
{                                GmXml.pas                                     }
{                                                                              }
{           Copyright (c) 2003 Graham Murt  - www.murtsoft.co.uk               }
{                                                                              }
{   Feel free to e-mail me with any comments, suggestions, bugs or help at:    }
{                                                                              }
{                           graham@murtsoft.co.uk                              }
{                                                                              }
{******************************************************************************}

unit GmXml;

interface

uses Classes, SysUtils;

const
  COMP_VERSION = 0.14;
  XML_SPECIFICATION = '<?xml version="1.0"%s?>';

type
  TGmXmlNode = class;
  TGmXmlNodeList = class;

  TGmXmlEnumNodeEvent = procedure(Sender: TObject; ANode: TGmXmlNode) of object;

  // *** TGmXmlNodeElement ***

  TGmXmlNodeAttribute = class
  private
    FName: string;
    FValue: string;
    procedure SetName(AValue: string);
    procedure SetValue(AValue: string);
  public
    property Name: string read FName write SetName;
    property Value: string read FValue write SetValue;
  end;

  //  *** TGmXmlNodeAttributeList ***
  TGmXmlNodeAttributeList = class
  private
    FList: TList;
    FAttr: TGmXmlNodeAttribute;

    function GetAtrrib(index: integer): TGmXmlNodeAttribute;
    function GetCount: integer;

    procedure SetAttrib(index: integer; const Value: TGmXmlNodeAttribute);
    function GeAttribByName(aName: string): TGmXmlNodeAttribute;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    function AddNameValue(const AName, AValue: string): TGmXmlNodeAttribute;
    procedure Remove(Value: TGmXmlNodeAttribute);

    property Count: integer read GetCount;
    property Attrib[index: integer]: TGmXmlNodeAttribute read GetAtrrib write SetAttrib; default;

    property AttribByName[AName: string]: TGmXmlNodeAttribute read GeAttribByName;
  end;

  // *** TGmXmlNode ***

  TGmXmlNode = class(TPersistent)
  private
    FChildren: TGmXmlNodeList;
    FElement: TGmXmlNodeAttributeList;

    FName: string;
    FParent: TGmXmlNode;
    FValue: string;
    // events...
    function GetAsDisplayString: string;
    function GetIsLeafNode: Boolean;
    function GetAsBoolean: Boolean;
    function GetAsFloat: Extended;
    function GetAsInteger: integer;
    function GetAsString: string;
    function GetLevel: integer;
    function CloseTag: string;
    function OpenTag: string;
    procedure SetAsBoolean(const Value: Boolean);
    procedure SetAsFloat(const Value: Extended);
    procedure SetAsInteger(const Value: integer);
    procedure SetAsString(const Value: string);
    procedure SetName(Value: string); virtual;
  public
    constructor Create(AParentNode: TGmXmlNode); virtual;
    destructor Destroy; override;
    procedure EnumerateNodes(ACallback: TGmXmlEnumNodeEvent);
    property AsDisplayString: string read GetAsDisplayString;

    property AsString: string read GetAsString write SetAsString;
    property AsBoolean: Boolean read GetAsBoolean write SetAsBoolean;
    property AsFloat: Extended read GetAsFloat write SetAsFloat;
    property AsInteger: integer read GetAsInteger write SetAsInteger;

    property Attribute: TGmXmlNodeAttributeList read FElement write FElement;

    property Children: TGmXmlNodeList read FChildren;
    property IsLeafNode: Boolean read GetIsLeafNode;
    property Level: integer read GetLevel;
    property Name: string read FName write SetName;
    property Parent: TGmXmlNode read FParent;
  end;

  // *** TGmXmlNodeList ***

  TGmXmlNodeList = class
  private
    FCurrentNode: TGmXmlNode;
    FList: TList;
    function GetCount: integer;
    function GetNode(index: integer): TGmXmlNode;
    function GetNodeByName(AName: string): TGmXmlNode;
    procedure SetNodeByName(AName: string; ANode: TGmXmlNode);
    function GetRoot: TGmXmlNode;
    procedure AddNode(ANode: TGmXmlNode);
    procedure SetNode(index: integer; const Value: TGmXmlNode);
  public
    constructor Create(AParent: TGmXmlNode);
    destructor Destroy; override;
    function AddLeaf(AName: string): TGmXmlNode;
    function AddOpenTag(AName: string): TGmXmlNode;
    procedure AddCloseTag;
    //procedure NextNode;
    procedure Clear;
    property Count: integer read GetCount;
    property CurrentNode: TGmXmlNode read FCurrentNode write FCurrentNode;
    property Node[index: integer]: TGmXmlNode read GetNode write SetNode; default;
    property NodeByName[AName: string]: TGmXmlNode read GetNodeByName write SetNodeByName;
    property Root: TGmXmlNode read GetRoot;
  end;

  // *** TGmXML ***

  TGmXML = class(TComponent)
  private
    FAutoIndent: Boolean;
    FEncoding: string;
    FIncludeHeader: Boolean;
    FNodes: TGmXmlNodeList;
    FStrings: TSTringList;
    function GetAbout: string;
    function GetDisplayText: string;
    function GetEncodingStr: string;
    function GetIndent(ALevel: integer): string;
    function GetText(ReplaceEscapeChars: Boolean): string;
    function GetXmlText: string;
    procedure SetAsText(Value: string);
    procedure SetAbout(Value: string);
    procedure SetAutoIndent(const Value: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure LoadFromFile(AFileName: string);
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToFile(AFilename: string);
    procedure SaveToStream(Stream: TStream);
    property DisplayText: string read GetDisplayText;
    property Nodes: TGmXmlNodeList read FNodes;
    property Text: string read GetXmlText write SetAsText;
  published
    property About: string read GetAbout write SetAbout;
    property AutoIndent: Boolean read FAutoIndent write SetAutoIndent default True;
    property Encoding: string read FEncoding write FEncoding;
    property IncludeHeader: Boolean read FIncludeHeader write FIncludeHeader default True;
  end;

  //procedure Register;

function makeChildNodeExist(const cTag: string; var nParent: TGmXmlNode): TGmXmlNode;
function makeAttribNodeExist(const aName, aValue: string; var node: TGmXmlNode): TGmXmlNodeAttribute;

implementation

uses StrUtils;

//------------------------------------------------------------------------------

function makeAttribNodeExist(const aName, aValue: string; var node: TGmXmlNode): TGmXmlNodeAttribute;
begin
  Result := node.Attribute.AttribByName[aName];
  if Result = nil then
    Result := node.Attribute.AddNameValue(aName, aValue)
end;

function makeChildNodeExist(const cTag: string; var nParent: TGmXmlNode): TGmXmlNode;
begin // make sure a child node exist
  Result := nParent.Children.NodeByName[cTag];
  if Result = nil then
    Result := nParent.Children.AddLeaf(cTag)

end;

// *** Unit Functions ***

function StrPos(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I, X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do begin
      if S[I] = SubStr[1] then begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;

procedure ReplaceText(var AText: string; AFind, AReplace: string);
var
  Index: integer;
begin
  Index := 1;
  while StrPos(AFind, AText, Index) <> 0 do begin
    Index := StrPos(AFind, AText, Index);
    Delete(AText, Index, Length(AFind));
    Insert(AReplace, AText, Index);
    Inc(Index, Length(AReplace));
  end;
end;

//------------------------------------------------------------------------------

// *** TGmXmlNodeElement ***

procedure TGmXmlNodeAttribute.SetName(AValue: string);
begin
  FName := Trim(AValue);
end;

procedure TGmXmlNodeAttribute.SetValue(AValue: string);
begin
  FValue := Trim(AValue);
  ReplaceText(FValue, '"', '');
end;

//------------------------------------------------------------------------------

// *** TGmXmlNode ***

constructor TGmXmlNode.Create(AParentNode: TGmXmlNode);
begin
  inherited Create;
  FChildren := TGmXmlNodeList.Create(Self);
  FElement := TGmXmlNodeAttributeList.Create;

  FParent := AParentNode;
end;

destructor TGmXmlNode.Destroy;
begin
  FElement.Free;
  FChildren.Free;
  inherited Destroy;
end;

function TGmXmlNode.CloseTag: string;
begin
  Result := '</' + FName + '>';
end;

function TGmXmlNode.OpenTag: string;
var
  i: Integer;
  s: string;
begin
  if FElement.Count = 0 then
    Result := Format('<%s>', [Name])
  else begin
    Result := Format('<%s', [Name]);
    s := '';
    for i := 0 to FElement.Count - 1 do begin
      s := s + Format(' %s="%s"', [FElement.Attrib[i].Name,
        FElement.Attrib[i].Value]);
    end;
    Result := Result + s + '>';
  end;

end;

procedure TGmXmlNode.EnumerateNodes(ACallback: TGmXmlEnumNodeEvent);
var
  ICount: integer;
begin
  for ICount := 0 to FChildren.Count - 1 do begin
    if Assigned(ACallback) then ACallback(Self, FChildren[ICount]);
  end;
end;

function TGmXmlNode.GetAsBoolean: Boolean;
begin
  Result := Boolean(StrToInt(FValue));
end;

function TGmXmlNode.GetAsFloat: Extended;
begin
  try
    Result := StrToFloat(FValue);
  except
    on EConvertError do
      Result := 0.0;
  end;
end;

function TGmXmlNode.GetAsInteger: integer;
begin
  Result := StrToInt(FValue);
end;

function TGmXmlNode.GetAsString: string;
begin
  Result := FValue;
end;

function TGmXmlNode.GetLevel: integer;
var
  AParent: TGmXmlNode;
begin
  AParent := Parent;
  Result := 0;
  while AParent <> nil do begin
    AParent := AParent.Parent;
    Inc(Result);
  end;
end;

procedure TGmXmlNode.SetAsBoolean(const Value: Boolean);
begin
  FValue := IntToStr(Ord(Value));
end;

procedure TGmXmlNode.SetAsFloat(const Value: Extended);
begin
  FValue := FloatToStr(Value);
end;

procedure TGmXmlNode.SetAsInteger(const Value: integer);
begin
  FValue := IntToStr(Value);
end;

procedure TGmXmlNode.SetAsString(const Value: string);
begin
  FValue := Value;
  // replace any illegal characters...
  ReplaceText(FValue, '&', '&amp;');
  ReplaceText(FValue, '<', '&lt;');
  ReplaceText(FValue, '>', '&gt;');
  ReplaceText(FValue, '''', '&pos;');
  ReplaceText(FValue, '"', '&quot;');
end;

function TGmXmlNode.GetAsDisplayString: string;
begin
  Result := FValue;
  // replace any illegal characters...
  ReplaceText(Result, '&amp;', '&');
  ReplaceText(Result, '&lt;', '<');
  ReplaceText(Result, '&gt;', '>');
  ReplaceText(Result, '&pos;', '''');
  ReplaceText(Result, '&quot;', '"');
end;

function TGmXmlNode.GetIsLeafNode: Boolean;
begin
  Result := FChildren.Count = 0;
end;

procedure TGmXmlNode.SetName(Value: string);
var
  sProc: string;
  sName, sVal: string;
  i, j, k: Integer;
begin
  FName := Value;
  if FName[1] = '<' then Delete(FName, 1, 1);
  if FName[Length(FName)] = '>' then Delete(FName, Length(FName), 1);
  Trim(FName);
  i := Pos(#13#10, FName);
  while i <> 0 do begin
    Delete(FName, i, 2);
    i := Pos(#13#10, FName);
  end;

  i := Pos(' ', FName);
  if i <> 0 then begin
    sProc := Copy(FName, i, Length(FName) - i + 1);
    Delete(FName, i, Length(FName) - i + 1);
    Trim(FName);

    i := Pos(' ', sProc);
    while i <> 0 do begin
      sName := '';
      sVal := '';

      j := PosEx('=', sProc, i + 1);
      if j <> 0 then begin
        sName := Trim(Copy(sProc, i + 1, j - i - 1));
        Delete(sProc, 1, j);

        j := PosEx('"', sProc);
        k := PosEx('"', sProc, j + 1);

        if (j <> 0) and (k > j) then begin
          sVal := Trim(Copy(sProc, j + 1, k - 1));

          FElement.AddNameValue(sName, sVal);

          Delete(sProc, 1, k);
          i := Pos(' ', sProc);
        end
        else
          i := 0;
      end
      else
        i := 0;

    end;
  end;
end;

//------------------------------------------------------------------------------

// *** TGmXmlNodeList ***

constructor TGmXmlNodeList.Create(AParent: TGmXmlNode);
begin
  inherited Create;
  FList := TList.Create;
  FCurrentNode := AParent;
end;

destructor TGmXmlNodeList.Destroy;
var
  ICount: integer;
begin
  for ICount := Count - 1 downto 0 do
    Node[ICount].Free;
  FList.Free;
  inherited Destroy;
end;

function TGmXmlNodeList.AddLeaf(AName: string): TGmXmlNode;
begin
  Result := AddOpenTag(AName);
  AddCloseTag;
end;

function TGmXmlNodeList.AddOpenTag(AName: string): TGmXmlNode;
begin
  Result := TGmXmlNode.Create(FCurrentNode);
  Result.Name := AName;
  if FCurrentNode = nil then
    AddNode(Result)
  else
    FCurrentNode.Children.AddNode(Result);

  FCurrentNode := Result;
end;

procedure TGmXmlNodeList.AddCloseTag;
begin
  FCurrentNode := FCurrentNode.Parent;
end;

{procedure TGmXmlNodeList.NextNode;
var
  AIndex: integer;
begin
  AIndex := FList.IndexOf(FCurrentNode);
  if AIndex < FList.Count then
  FCurrentNode := TGmXmlNode(FList[AIndex]);
end;}

procedure TGmXmlNodeList.Clear;
var
  ICount: integer;
begin
  for ICount := 0 to FList.Count - 1 do begin
    Node[ICount].Free;
    Node[ICount] := nil;
  end;
  FList.Clear;
  FCurrentNode := nil;
end;

function TGmXmlNodeList.GetCount: integer;
begin
  Result := FList.Count;
end;

function TGmXmlNodeList.GetNode(index: integer): TGmXmlNode;
begin
  if (index >= 0) and (index < FList.Count) then
    Result := TGmXmlNode(FList[index])
  else
    Result := nil;
end;

function TGmXmlNodeList.GetNodeByName(AName: string): TGmXmlNode;
var
  ICount: integer;
begin
  Result := nil;
  for ICount := 0 to Count - 1 do begin
    if UpperCase(Node[ICount].Name) = UpperCase(AName) then begin
      Result := Node[ICount];
      Exit;
    end;
  end;
end;

procedure TGmXmlNodeList.SetNodeByName(AName: string; ANode: TGmXmlNode);
var
  ICount: integer;
begin
  for ICount := 0 to Count - 1 do begin
    if Node[ICount].Name = AName then begin
      Node[ICount] := ANode;
      Exit;
    end;
  end;
end;

function TGmXmlNodeList.GetRoot: TGmXmlNode;
begin
  Result := nil;
  if Count > 0 then Result := Node[0];
end;

procedure TGmXmlNodeList.AddNode(ANode: TGmXmlNode);
begin
  FList.Add(ANode);
end;

procedure TGmXmlNodeList.SetNode(index: integer; const Value: TGmXmlNode);
begin
  FList[index] := Value;
end;

//------------------------------------------------------------------------------

// *** TGmXml ***

constructor TGmXml.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FStrings := TStringList.Create;
  FNodes := TGmXmlNodeList.Create(nil);
  FIncludeHeader := True;
  FAutoIndent := True;
  FEncoding := '';
end;

destructor TGmXml.Destroy;
begin
  FNodes.Free;
  FStrings.Free;
  inherited Destroy;
end;

function TGmXml.GetAbout: string;
begin
  Result := Format('%s v%f', [ClassName, COMP_VERSION]);
end;

function TGmXml.GetDisplayText: string;
begin
  Result := GetText(True);
end;

function TGmXml.GetEncodingStr: string;
begin
  Result := '';
  if FEncoding <> '' then Result := Format(' encoding="%s"', [FEncoding]);
end;

function TGmXml.GetIndent(ALevel: integer): string;
begin
  Result := '';
  if FAutoIndent then Result := StringOfChar(' ', ALevel * 2);

end;

function TGmXml.GetText(ReplaceEscapeChars: Boolean): string;

  procedure NodeToStringList(var AXml: TStringList; ANode: TGmXmlNode; AReplaceChars: Boolean);
  var
    ICount: integer;
    AValue: string;
  begin
    if ANode.IsLeafNode then begin
      if AReplaceChars then
        AValue := ANode.AsDisplayString
      else
        AValue := ANode.AsString;
      AXml.Add(GetIndent(ANode.Level) + ANode.OpenTag + AValue + ANode.CloseTag);
    end
    else begin
      AXml.Add(GetIndent(ANode.Level) + ANode.OpenTag);
      for ICount := 0 to ANode.FChildren.Count - 1 do
        NodeToStringList(AXml, ANode.Children.Node[ICount], AReplaceChars);
      AXml.Add(GetIndent(ANode.Level) + ANode.CloseTag);
    end;
  end;

var
  ICount: integer;
begin
  FStrings.Clear;
  if FNodes.Count = 0 then Exit;
  if FIncludeHeader then
    FStrings.Add(Format(XML_SPECIFICATION, [GetEncodingStr]));
  for ICount := 0 to FNodes.Count - 1 do
    NodeToStringList(FStrings, FNodes.Node[ICount], ReplaceEscapeChars);
  Result := FStrings.Text;
end;

function TGmXml.GetXmlText: string;
begin
  Result := GetText(False);
end;

procedure TGmXml.SetAsText(Value: string);
var
  ACursor: integer;
  AText: string;
  ATag: string;
  AValue: string;
  ATags: string;
begin
  AText := Value;
  ACursor := 1;
  ATags := '';
  while ACursor <> Length(Value) do begin
    AValue := '';
    if Value[ACursor] = '<' then begin
      // reading a tag
      ATag := '<';
      while Value[ACursor] <> '>' do begin
        Inc(ACursor);
        ATag := ATag + Value[ACursor];
      end;
      if ATag[2] = '/' then
        Nodes.AddCloseTag
      else if ATag[2] <> '?' then
        Nodes.AddOpenTag(ATag)
    end
    else begin
      // reading a value...
      while (Value[ACursor] <> '<') and (ACursor < Length(Value)) do begin
        AValue := AValue + Value[ACursor];
        Inc(ACursor);
      end;
      if Assigned(Nodes.CurrentNode) then
        Nodes.CurrentNode.AsString := AValue;
      Dec(ACursor);
    end;
    Inc(ACursor);
  end;
end;

procedure TGmXml.SetAbout(Value: string);
begin
  // does nothing... (only needed to display property in Object Inspector)
end;

procedure TGmXML.SetAutoIndent(const Value: Boolean);
begin
  FAutoIndent := Value;
end;

procedure TGmXml.LoadFromFile(AFileName: string);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    AStream.LoadFromFile(AFileName);
    AStream.Seek(0, soFromBeginning);
    LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TGmXml.LoadFromStream(Stream: TStream);
var
  ALines: TStringList;
begin
  if Stream.Size = 0 then Exit;
  ALines := TStringList.Create;
  try
    ALines.LoadFromStream(Stream);
    Text := ALines.Text;
  finally
    ALines.Free;
  end;
end;

procedure TGmXml.SaveToFile(AFilename: string);
var
  AStream: TMemoryStream;
begin
  AStream := TMemoryStream.Create;
  try
    SaveToStream(AStream);
    AStream.SaveToFile(AFilename);
  finally
    AStream.Free;
  end;
end;

procedure TGmXml.SaveToStream(Stream: TStream);
begin
  GetText(False);
  FStrings.SaveToStream(Stream);
end;
{
procedure Register;
begin
  RegisterComponents('GmXML', [TGmXml]);
end;
}
{ TGmXmlNodeAttributeList }

constructor TGmXmlNodeAttributeList.Create;
begin
  FList := TList.Create;

end;

destructor TGmXmlNodeAttributeList.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TGmXmlNodeAttributeList.AddNameValue(const AName, AValue: string): TGmXmlNodeAttribute;
begin
  FAttr := TGmXmlNodeAttribute.Create;
  FAttr.SetName(AName);
  FAttr.SetValue(AValue);

  FList.Add(FAttr);
  Result := FAttr;
end;

procedure TGmXmlNodeAttributeList.Clear;
var
  i: Integer;
  o: TObject;
begin
  for i := FList.Count - 1 downto 0 do begin
    o := FList.items[i];
    o.Free;
  end;
  FList.Clear;
end;

function TGmXmlNodeAttributeList.GetAtrrib(
  index: integer): TGmXmlNodeAttribute;
begin
  if (index >= 0) and (index < FList.Count) then
    Result := FList[index]
  else
    Result := nil;
end;

procedure TGmXmlNodeAttributeList.SetAttrib(index: integer;
  const Value: TGmXmlNodeAttribute);
begin
  if (index >= 0) and (index < FList.Count) then
    FList[index] := Value;
end;

function TGmXmlNodeAttributeList.GetCount: integer;
begin
  Result := FList.Count;
end;

function TGmXmlNodeAttributeList.GeAttribByName(
  aName: string): TGmXmlNodeAttribute;
var
  ICount: integer;
begin
  Result := nil;
  for ICount := 0 to FList.Count - 1 do begin
    if Uppercase(Attrib[ICount].Name) = UpperCase(AName) then begin
      Result := Attrib[ICount];
      Exit;
    end;
  end;
end;

procedure TGmXmlNodeAttributeList.Remove(Value: TGmXmlNodeAttribute);
begin
  FList.Remove(Value);
end;

end.
