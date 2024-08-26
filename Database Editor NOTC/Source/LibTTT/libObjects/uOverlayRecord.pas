unit uOverlayRecord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, MapXLib_TLB, uMapXHandler, uCoordConvertor,
  uDBAsset_GameEnvironment, {TeCanvas,} ColorGrd, RzButton, uOverlayOther;

type
  TOverlayRecord = class
  private

  public
      lineOver : TLineOverlay;
      tableOver : TTableOverlay;
      rectOver : TRectOverlay;
      ellipseOver : TEllipseOverlay;
      textOver : TTextOverlay;
      constructor  create;
      destructor Destroy; override;

      procedure loadFromFile(fName : String);
      {procedure saveToFile(fName : String);    }
      procedure drawCanvas(fCanvas : TCanvas; Map1 : TMap);
      procedure clearList;
      {procedure createList; }
  end;

implementation

{ TOverlayRecord }

constructor TOverlayRecord.create;
begin
  lineOver    := TLineOverlay.Create;
  tableOver   := TTableOverlay.Create;
  rectOver    := TRectOverlay.Create;
  ellipseOver := TEllipseOverlay.Create;
  textOver    := TTextOverlay.Create;
end;

destructor TOverlayRecord.Destroy;
begin
  lineOver.Free;
  tableOver.Free;
  rectOver.Free;
  ellipseOver.Free;
  textOver.Free;
end;

procedure TOverlayRecord.clearList;
begin
  lineOver.Clear;
  tableOver.Clear;
  rectOver.Clear;
  ellipseOver.Clear;
  textOver.Clear;
end;

procedure TOverlayRecord.loadFromFile(fName : String);
begin
  lineOver.loadLineOverlay  (fName + 'line.bin');
  tableOver.loadTableOverlay(fName + 'table.bin');
  rectOver.loadRectOverlay  (fName + 'rect.bin');
  ellipseOver.loadEllipseOverlay(fName + 'ellipse.bin');
  textOver.loadTextOverlay  (fName + 'text.bin');
end;

procedure TOverlayRecord.drawCanvas(fCanvas : TCanvas; Map1 : TMap);
begin
  lineOver.drawLineOverlay  (FCanvas, Map1);
  tableOver.drawTableOverlay(FCanvas, Map1);
  rectOver.drawRectOverlay  (FCanvas, Map1);
  ellipseOver.drawEllipseOverlay(FCanvas, Map1);
  textOver.drawTextOverlay  (FCanvas, Map1);
end;

end.
