unit ufrmPickPoint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,Vcl.ExtCtrls ;

type
  E_MapCursor = (mcSelect, mcMultiSelect, mcZoom, mcGameCenter, mcPan);
  Tpickpoint = class(TForm)
    lbl1: TLabel;
    lattitude: TLabel;
    edtlattitude: TEdit;
    edtlongtitude: TEdit;
    ImgBackgroundForm: TImage;
    btnsave: TButton;
    btncancel: TButton;
    procedure btncancelClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    isCancel : Boolean;
    { Public declarations }
  end;

var
  pickpoint: Tpickpoint;

implementation

{$R *.dfm}

procedure Tpickpoint.btncancelClick(Sender: TObject);
begin
  isCancel := True;
  Close;
end;

procedure Tpickpoint.btnsaveClick(Sender: TObject);
begin
  isCancel := False;
  Close;
end;

end.
