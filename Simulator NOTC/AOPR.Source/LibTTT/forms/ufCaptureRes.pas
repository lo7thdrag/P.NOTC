unit ufCaptureRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ExtDlgs;

type
  TfCaptureRes = class(TForm)
    Panel2: TPanel;
    imgCaptureResult: TImage;
    Panel3: TPanel;
    btnCapture: TButton;
    btnSave: TButton;
    btnPrint: TButton;
    btOK: TButton;
    SavePictureDialog1: TSavePictureDialog;
    PrintDialog1: TPrintDialog;
    procedure btnCaptureClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    recapture:boolean;
  end;

var
  fCaptureRes: TfCaptureRes;

implementation

uses uLandMassEditor,Printers;

{$R *.dfm}

procedure TfCaptureRes.btnCaptureClick(Sender: TObject);
begin
  fLandmassEditor.isCapturingScreen := true;
  recapture := true;
end;

procedure TfCaptureRes.btnPrintClick(Sender: TObject);
var
 BmpImage: TBitmap;
 RR: TRect;
 ScaleX, ScaleY: Integer;
begin

 if printDialog1.Execute then
  begin

   Printer.BeginDoc;
   //Printer.Canvas.Draw();
   ScaleX := GetDeviceCaps(Handle, logPixelsX) div PixelsPerInch;
      ScaleY := GetDeviceCaps(Handle, logPixelsY) div PixelsPerInch;
   RR := Rect(0, 0, imgCaptureResult.Picture.Width * scaleX, imgCaptureResult.Picture.Height * ScaleY);
   printer.Canvas.StretchDraw(RR, imgCaptureResult.Picture.Graphic);
   Printer.EndDoc;

  end;



end;


procedure TfCaptureRes.btnSaveClick(Sender: TObject);
begin

 if SavePictureDialog1.Execute then
 begin
   imgCaptureResult.Picture.SaveToFile(SavePictureDialog1.FileName);
 end;

end;

end.
