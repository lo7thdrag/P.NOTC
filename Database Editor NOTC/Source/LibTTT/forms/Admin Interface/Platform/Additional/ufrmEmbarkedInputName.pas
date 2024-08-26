unit ufrmEmbarkedInputName;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  uDBAssetObject ;

type
  TfrmEmbarkedInputName = class(TForm)
    ImgBackgroundForm: TImage;
    btnOK: TButton;
    btnCancel: TButton;
    pnl1: TPanel;
    lblName: TLabel;
    edtClass: TEdit;
    edtQuantity: TEdit;
    Label1: TLabel;

    procedure FormShow(Sender: TObject);

    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    FSelectedEmbarkedPlat : THosted_Platform;

  public
    AfterClose : Boolean; {Penanda ketika yg dipilih btn cancel, btn Cancel di summary menyala}
    property SelectedEmbarkedPlat : THosted_Platform read FSelectedEmbarkedPlat write FSelectedEmbarkedPlat;

  end;

var
  frmEmbarkedInputName: TfrmEmbarkedInputName;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmEmbarkedInputName.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEmbarkedInputName.FormShow(Sender: TObject);
begin
  with FSelectedEmbarkedPlat do
  begin
    edtClass.Text := FVehicle.Vehicle_Identifier;
    edtQuantity.Text := IntToStr(FData.Quantity);
  end;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmEmbarkedInputName.btnOkClick(Sender: TObject);
begin
  with FSelectedEmbarkedPlat do
  begin
    FData.Vehicle_Index := FVehicle.Vehicle_Index;
    FData.Quantity := StrToInt(edtQuantity.Text);

    if FData.Slave_Index = 0 then
      dmTTT.InsertHostedPlatform(FData)
    else
      dmTTT.UpdateHostedPlatform(FData);
  end;
  AfterClose := True;
  Close;
end;

procedure TfrmEmbarkedInputName.btnCancelClick(Sender: TObject);
begin
  AfterClose := False;
  Close;
end;

{$ENDREGION}

end.
