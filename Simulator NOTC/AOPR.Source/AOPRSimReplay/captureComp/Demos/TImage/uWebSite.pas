//------------------------------------------------------------------------------
//  Apprehend Version  : 4.3
//  Copyright (c) 2008 : Adirondack Software & Graphics
//  Created            : 1-09-1992
//  Last Modification  : 10-26-2008
//  Description        : frmWebsite Unit
//------------------------------------------------------------------------------

unit uWebSite;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TWebsiteForm = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Image1: TImage;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    procedure Label2MouseEnter(Sender: TObject);
    procedure Label2MouseLeave(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Label5MouseEnter(Sender: TObject);
    procedure Label5MouseLeave(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseEnter(Sender: TObject);
    procedure Label1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebsiteForm: TWebsiteForm;

implementation

uses ShellAPI;

{$R *.dfm}

procedure TWebsiteForm.Label2MouseEnter(Sender: TObject);
begin
  Label2.Font.Color := clRed;
  Label2.Font.Style := Label2.Font.Style + [fsUnderline];
end;

procedure TWebsiteForm.Label2MouseLeave(Sender: TObject);
begin
   Label2.Font.Color := clBlack;
   Label2.Font.Style := Label2.Font.Style - [fsUnderline];
end;

procedure TWebsiteForm.Label2Click(Sender: TObject);
begin
  ShellExecute(0, nil, PChar('mailto:' + Label2.Caption), nil, nil, SW_NORMAL);
  Label2.Font.Color := clFuchsia;
end;

procedure TWebsiteForm.Label5Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(Label5.Caption), nil, nil, SW_SHOWNORMAL);
  Label5.Font.Color := clFuchsia;
end;

procedure TWebsiteForm.Label5MouseEnter(Sender: TObject);
begin
   Label5.Font.Color := clBlue;
   Label5.Font.Style := Label5.Font.Style + [fsUnderline];
end;

procedure TWebsiteForm.Label5MouseLeave(Sender: TObject);
begin
  Label5.Font.Color := clBlack;
  Label5.Font.Style := Label5.Font.Style - [fsUnderline];
end;

procedure TWebsiteForm.Label1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(Label1.Caption), nil, nil, SW_SHOWNORMAL);
  Label1.Font.Color := clFuchsia;
end;

procedure TWebsiteForm.Label1MouseEnter(Sender: TObject);
begin
   Label1.Font.Color := clBlue;
   Label1.Font.Style := Label1.Font.Style + [fsUnderline];
end;

procedure TWebsiteForm.Label1MouseLeave(Sender: TObject);
begin
  Label1.Font.Color := clBlack;
  Label1.Font.Style := Label1.Font.Style - [fsUnderline];
end;

end.
