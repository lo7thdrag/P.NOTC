unit uOverlayPlus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin,
  OleCtrls, MapXLib_TLB, uMapXHandler, uCoordConvertor,
  uDBAsset_GameEnvironment, {TeCanvas,} ColorGrd, RzButton;

type
  overlayPlus = class
  private

  public
     function checkXYPosition(x1 : single; y1 : single; x2 : single; y2 : single): TRect;
     function assignRect(x1 : single; y1 : single): TRect;
  end;

implementation

function overlayPlus.checkXYPosition(x1 : single; y1 : single; x2 : single; y2 : single): TRect;
var
  temp : single;
  rect : TRect;
begin
  if round(x2) >= round(x1) then                                   //kuadran 4
  begin
     if round(y2) >= round(y1) then
     begin
     end
     else if round(y2) <= round(y1) then                           //kuadran 1
     begin
        temp := y1;
        y1   := y2;
        y2   := temp;
     end;
  end;
  if round(x2) <= round(x1) then
  begin
     if round(y2) >= round(y1) then                                //kuadran 3
     begin
        temp := x1;
        x1   := x2;
        x2   := temp;
     end
     else if round(y2) <= round(y1) then                           //kuadran 2
     begin
        temp := y1;
        y1   := y2;
        y2   := temp;

        temp := x1;
        x1   := x2;
        x2   := temp;
     end;
  end;
  rect.Left   := Round(x1);
  rect.Top    := Round(y1);
  rect.Right  := Round(x2);
  rect.Bottom := Round(y2);
  result      := rect;
end;

function overlayPlus.assignRect(x1: Single; y1: Single): TRect;
const
  RANGE        = 5;
var
  rect        :  TRect;
begin
  rect.Left   := Round(x1) - RANGE;
  rect.Top    := Round(y1) - RANGE;
  rect.Right  := Round(x1) + RANGE;
  rect.Bottom := Round(y1) + RANGE;
  result      := rect;
end;

end.
