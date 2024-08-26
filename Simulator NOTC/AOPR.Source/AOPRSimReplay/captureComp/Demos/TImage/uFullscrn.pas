//------------------------------------------------------------------------------
//  Apprehend Version  : 4.3
//  Copyright (c) 2008 : Adirondack Software & Graphics
//  Created            : 1-09-1992
//  Last Modification  : 10-26-2009
//  Description        : FullScreen Unit
//------------------------------------------------------------------------------

unit uFullscrn;

interface

uses SysUtils, Windows, Messages, Classes, Graphics, Controls, Comctrls,
  Forms, Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFullScreen = class ( TForm )
    ScrollBox1: TScrollBox;
    Image1: TImage;
    procedure ImageClick ( Sender: TObject );
    procedure Image1KeyDown ( Sender: TObject;var Key: Word;Shift: TShiftState );
    procedure Image1Click ( Sender: TObject );
    procedure FormKeyPress ( Sender: TObject;var Key: Char );
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullScreen: TFullScreen;

implementation

uses uMain;

{$R *.DFM}

procedure TFullScreen.ImageClick ( Sender: TObject );
begin
  FullScreen.Close;
end;

procedure TFullScreen.Image1KeyDown ( Sender: TObject;var Key: Word;Shift: TShiftState );
begin
  FullScreen.Close;
end;

procedure TFullScreen.Image1Click ( Sender: TObject );
begin
  FullScreen.Close;
end;

procedure TFullScreen.FormKeyPress ( Sender: TObject;var Key: Char );
begin
  FullScreen.Close;
end;

end.

