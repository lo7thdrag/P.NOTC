unit uScreenCaptureWindow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TScreenCaptureWindowForm = class(TForm)
    Image1: TImage;
    scrl1: TScrollBar;
    scrl2: TScrollBar;
    Panel1: TPanel;
    btnCapture: TButton;
    btnPrint: TButton;
    btnSave: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScreenCaptureWindowForm: TScreenCaptureWindowForm;

implementation

{$R *.dfm}

end.
