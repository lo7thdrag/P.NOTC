unit ufrmTacticalSymbol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, ufrmSummaryVehicle, System.ImageList;

type
  TfrmTacticalSymbol = class(TForm)
    tvTacticalSymbol: TTreeView;
    btnOK: TButton;
    btnCancel: TButton;
    ilTacSymbol: TImageList;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    TacticalSimbol : string;
    FontId : string;
  end;

var
  frmTacticalSymbol: TfrmTacticalSymbol;

implementation

{$R *.dfm}

procedure TfrmTacticalSymbol.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTacticalSymbol.btnOKClick(Sender: TObject);
begin
  if tvTacticalSymbol.Selected.ImageIndex <= 0 then
  begin
    ShowMessage('Wrong Symbol');
  end
  else
  begin
    with tvTacticalSymbol.Selected do
    begin
      TacticalSimbol := Parent.Parent.Text + '\' + Parent.Text + '\' + Text;
      FontId := IntToStr(tvTacticalSymbol.Selected.StateIndex);
    end;

    Close;
  end;
end;

end.
