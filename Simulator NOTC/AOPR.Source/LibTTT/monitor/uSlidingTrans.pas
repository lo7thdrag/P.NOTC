unit uSlidingTrans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI;

type
  TSlidingTrans = class

  public
    constructor create;
    destructor Destroy; override;

    procedure ShowHideBtnProc{vLayer: Byte)};
  end;

var
  VSlidingTrans  : TSlidingTrans;

implementation

uses
  ufTacticalDisplay, ufToteDisplay;

{ TSlidingTrans }

constructor TSlidingTrans.create;
begin
//
end;

destructor TSlidingTrans.Destroy;
begin

  inherited;
end;

procedure TSlidingTrans.ShowHideBtnProc{vLayer: Byte)};
var
  Flags: DWORD;
  Handle: HWND;
begin
  Handle := frmTacticalDisplay.Handle;

  if frmTacticalDisplay.FBlendHidden then
    Flags  := AW_ACTIVATE
  else
    Flags  := AW_HIDE;

  Flags := Flags OR AW_BLEND;

  if not AnimateWindow(Handle, 300, Flags) then begin
    AnimateWindow(Handle, 300, Flags);
  end;

  frmTacticalDisplay.FBlendHidden := not frmTacticalDisplay.FBlendHidden;
end;

end.

