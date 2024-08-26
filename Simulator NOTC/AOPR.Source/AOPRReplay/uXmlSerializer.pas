unit uXmlSerializer;

interface

uses
  SysUtils, Forms, ActiveX,
  InvokeRegistry, OPToSOAPDomConv, XmlDoc, XmlIntf, XmlDom;

type
  TXmlSerializer = class
  strict private
    FObjConverter : IObjConverter;
    FXmlNamespace : string;
    FXmlRootNode  : string;
    FXmlObjectNode: string;
  protected
    function _Deserialize(DeserializedObjectType: TClass;
      const Xml: string; IsFileName: Boolean): TObject;
  public
    function Serialize(Obj: TObject): string; overload;
    function Serialize(Obj: TObject; const XmlFileName: string): string; overload;

    function Deserialize(DeserializedObjectType: TClass;
      const XmlContent: string): TObject;
    function DeserializeFromFile(DeserializedObjectType: TClass;
      const XmlFileName: string): TObject;

    property Converter    : IObjConverter read FObjConverter  write FObjConverter;
    property XmlNamespace : string        read FXmlNamespace  write FXmlNamespace;
    property XmlRootNode  : string        read FXmlRootNode   write FXmlRootNode;
    property XmlObjectNode: string        read FXmlObjectNode write FXmlObjectNode;
  end;

implementation

//------------------------------------------------------------------------------
// létrehoz egy objkektum-példányt XML-ből
//
function TXmlSerializer._Deserialize(DeserializedObjectType: TClass;
  const Xml: string; IsFileName: Boolean): TObject;
var
  XmlDoc  : TXMLDocument;
  Conv    : IObjConverter;
  RootNode: IXMLNode;
begin
  Result := nil;

  XmlDoc := TXMLDocument.Create(Application);
  try
    if IsFileName then
      XmlDoc.LoadFromFile(Xml)
    else
      XmlDoc.XML.Text := Xml;

    XmlDoc.Active := True;

    // XML ellenőrzése
    RootNode := XmlDoc.DocumentElement;
    if not Assigned(RootNode) or (RootNode.ChildNodes.Count = 0) then
      raise Exception.Create('Invalid XML format.');

    // konverter
    if Assigned(Converter) then
      Conv := Converter
    else
      Conv := TSOAPDomConv.Create(nil) as IObjConverter;

    RootNode := XmlDoc.DocumentElement.ChildNodes[0];

    // objektum létrehozása
    Result := DeserializedObjectType.Create;
    try
      Conv.InitObjectFromSOAP(Result, RootNode, RootNode);
    except
      FreeAndNil(Result);
      raise;
    end;
  finally
    XmlDoc.Free;
  end;
end;

//------------------------------------------------------------------------------
// létrehoz egy objkektum-példányt XML tartalomból
//
function TXmlSerializer.Deserialize(DeserializedObjectType: TClass;
  const XmlContent: string): TObject;
begin
  Result := _Deserialize(DeserializedObjectType, XmlContent, False);
end;

//------------------------------------------------------------------------------
// létrehoz egy objkektum-példányt XML fájlból
//
function TXmlSerializer.DeserializeFromFile(DeserializedObjectType: TClass;
  const XmlFileName: string): TObject;
begin
  Result := _Deserialize(DeserializedObjectType, XmlFileName, True);
end;

//------------------------------------------------------------------------------
// szerializálja egy objektum published tagjait egy XML fájlba
//
function TXmlSerializer.Serialize(Obj: TObject;
  const XmlFileName: string): string;
var
  RefId      : InvString;
  XmlDoc     : TXMLDocument;
  RootNode   : IXMLNode;
  Conv       : IObjConverter;
  XNamespace : string;
  XRootNode  : string;
  XObjectNode: string;
begin
  Result := EmptyStr;

  XmlDoc := TXMLDocument.Create(Application);
  try
    XmlDoc.Active  := True;
    XmlDoc.Options := XmlDoc.Options + [doNodeAutoIndent];

    // konverter
    if Assigned(Converter) then
      Conv := Converter
    else
      Conv := TSOAPDomConv.Create(nil) as IObjConverter;

    // XML névtér
    if XmlNamespace = EmptyStr then
      XNamespace := SXMLNamespaceURI
    else
      XNamespace := XmlNamespace;

    // gyökérelem
    if XRootNode = EmptyStr then
      XRootNode := 'Root'
    else
      XRootNode := XmlRootNode;

    RootNode := XmlDoc.AddChild(XRootNode);

    // az objektumot leíró csomópont az XML-ben
    if XmlObjectNode = EmptyStr then
      XObjectNode := Obj.ClassName
    else
      XObjectNode := XmlObjectNode;

    // szerializáció SOAP XML formátumba
    Conv.ObjInstanceToSOAP(Obj,
      RootNode, RootNode, XObjectNode, XNamespace, [], RefId);

    Result := XmlDoc.XML.Text;

    // mentés fájlba
    if XmlFileName <> EmptyStr then
      XmlDoc.SaveToFile(XmlFileName);
  finally
    XmlDoc.Free;
  end;
end;

//------------------------------------------------------------------------------
// szerializálja egy objektum published tagjait XML-be
//
function TXmlSerializer.Serialize(Obj: TObject): string;
begin
  Result:= Serialize(Obj, EmptyStr);
end;

end.
