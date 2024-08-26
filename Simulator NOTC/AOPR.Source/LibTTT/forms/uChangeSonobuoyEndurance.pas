unit uChangeSonobuoyEndurance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  uT3Sonobuoy;

type
  TfChangeSonobuoyEndurance = class(TForm)
    pnl1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lbEnduranceCurrent: TLabel;
    Label4: TLabel;
    lbEnduranceTrack: TLabel;
    Bevel2: TBevel;
    btnCancel: TButton;
    btnOk: TButton;
    edtNewEndurance: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    lbIndex: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fChangeSonobuoyEndurance: TfChangeSonobuoyEndurance;

implementation

{$R *.dfm}

procedure TfChangeSonobuoyEndurance.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfChangeSonobuoyEndurance.btnOkClick(Sender: TObject);
begin
  Close
end;

end.
