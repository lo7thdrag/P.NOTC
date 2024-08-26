//------------------------------------------------------------------------------
//  Apprehend Version  : 4.3
//  Copyright (c) 2008 : Adirondack Software & Graphics
//  Created            : 1-09-1992
//  Last Modification  : 10-26-2008
//  Description        : ScreenDelay Unit
//------------------------------------------------------------------------------

unit uScreenDelay;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, Buttons,
  ComCtrls;

type
  TDelayDlg = class ( TForm )
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edScreenDelay: TEdit;
    UpDown1: TUpDown;
    procedure OKBtnClick ( Sender: TObject );
    procedure CancelBtnClick ( Sender: TObject );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DelayDlg: TDelayDlg;

implementation

{$R *.DFM}

procedure TDelayDlg.OKBtnClick ( Sender: TObject );
begin
  ModalResult := mrOK;
end;

procedure TDelayDlg.CancelBtnClick ( Sender: TObject );
begin
  ModalResult := mrCancel;
end;

end.

