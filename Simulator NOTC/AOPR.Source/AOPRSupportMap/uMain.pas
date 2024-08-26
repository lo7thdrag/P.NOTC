unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, StdCtrls, ExtCtrls, Menus;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TMainForm = class(TForm)
    mmLog: TMemo;
    Panel1: TPanel;
    Label3: TLabel;
    lblPort: TLabel;
    lblGeoset: TLabel;
    lblMapData: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    mnMain: TPopupMenu;
    Show1: TMenuItem;
    N1: TMenuItem;
    Show2: TMenuItem;
    Label4: TLabel;
    lblGCPort: TLabel;
    Label5: TLabel;
    lblMapType: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Show2Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
  private
    { Private declarations }
    TrayIconData: TNotifyIconData;
    isShow : boolean;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
  public
    { Public declarations }
    procedure OnLogStr(const strHeader, strBody: string) ;
  end;

var
  MyMsg : Cardinal;
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
 with TrayIconData do
  begin
    cbSize := SizeOf(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
  isShow := false;

end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TMainForm.OnLogStr(const strHeader, strBody: string);
var
  str : string;
begin
  str := '<'+FormatDateTime('dd mmm yyyy hh:nn:ss',Now)+ '> ['+strHeader+'] '+strBody;
  mmLog.Lines.Add(str);
end;

procedure TMainForm.Show1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.Show2Click(Sender: TObject);
begin
  if not isShow then
    Show
  else
    Hide;

  isShow := not isShow;
end;

procedure TMainForm.TrayMessage(var Msg: TMessage);
var
  p : TPoint;
begin
  case Msg.lParam of

    WM_LBUTTONDOWN:
    begin
      //Show;
    end;

    WM_RBUTTONDOWN:
    begin
      SetForegroundWindow(Handle);
       GetCursorPos(p);
       mnMain.Popup(p.x, p.y);
       PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;
end;

end.
