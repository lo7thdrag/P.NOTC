unit uFormUtil;

interface

uses
  Forms;


type
  TAlignPos = (apNone, apLeftTop, apRightTop, apLeftBottom, apRightBottom, apCenter, apCenterBottom);


  procedure AlignFormToMonitor(const monNum: byte;
    const aPos: TAlignPos;
    const offX, offY: integer; var frm: Tform);


implementation

uses Types;



procedure AlignFormToMonitor(const monNum: byte;
 const aPos: TAlignPos;
 const offX, offY: integer; var frm: Tform);
begin
  if frm = nil then exit;
  frm.DefaultMonitor := dmDesktop;
  case aPos of
    apLeftTop    : begin
      frm.Left := offX + Screen.Monitors[monNum].BoundsRect.Left;
      frm.Top  := offY + Screen.Monitors[monNum].BoundsRect.Top;
    end;
    apRightTop    : begin
      frm.Left  := offX + Screen.Monitors[monNum].BoundsRect.Right - frm.Width;
      frm.Top   := offY + Screen.Monitors[monNum].BoundsRect.Top;
    end;
    apLeftBottom    : begin
      frm.Left  := offX + Screen.Monitors[monNum].BoundsRect.Left;
      frm.Top   := offY + Screen.Monitors[monNum].BoundsRect.Bottom - frm.Height;
    end;
    apRightBottom    : begin
      frm.Left  := offX + Screen.Monitors[monNum].BoundsRect.Right - frm.Width;
      frm.Top   := offY + Screen.Monitors[monNum].BoundsRect.Bottom - frm.Height;
    end;
    apCenter        : begin
      frm.Left  := offX + ((Screen.Monitors[monNum].WorkareaRect.Right - Screen.Monitors[monNum].WorkareaRect.Left) div 2) - (frm.Width div 2);
      frm.Top   := offY + ((Screen.Monitors[monNum].WorkareaRect.Bottom - Screen.Monitors[monNum].WorkareaRect.Top) div 2) - (frm.Height div 2);
    end;
    apCenterBottom  : begin
      frm.Left  := offX + ((Screen.Monitors[monNum].WorkareaRect.Right - Screen.Monitors[monNum].WorkareaRect.Left) div 2) - (frm.Width div 2);
      frm.Top   := offY + Screen.Monitors[monNum].WorkareaRect.Bottom - frm.Height;
    end;
  end;

end;

end.
