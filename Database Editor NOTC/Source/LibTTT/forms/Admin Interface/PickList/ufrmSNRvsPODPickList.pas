unit ufrmSNRvsPODPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, newClassASTT, Vcl.Imaging.pngimage,
  uSimContainers;

type
  TfrmSNRvsPODPickList = class(TForm)
    lbl1: TLabel;
    lstAvailableSNRvsPOD: TListBox;
    btnAdd: TImage;
    btnCancel: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableSNRvsPODClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedPODvsSNRId : Integer;

    FSNRvsPODList : TList;
    FSelectedPODvsSNR : TPOD_vs_SNR_Curve_Definition;

    procedure UpdateSNRvsPODList;
  public
    property SelectedPODvsSNRId : Integer read FSelectedPODvsSNRId
      write FSelectedPODvsSNRId;
  end;

var
  frmSNRvsPODPickList: TfrmSNRvsPODPickList;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmSNRvsPODPickList.FormCreate(Sender: TObject);
begin
  FSNRvsPODList := TList.Create;
end;

procedure TfrmSNRvsPODPickList.FormShow(Sender: TObject);
begin
  UpdateSNRvsPODList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmSNRvsPODPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableSNRvsPOD.ItemIndex = -1 then
    Exit;

  FSelectedPODvsSNRId := FSelectedPODvsSNR.FData.Curve_Definition_Index;
  Close;
end;

procedure TfrmSNRvsPODPickList.btnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TfrmSNRvsPODPickList.lstAvailableSNRvsPODClick(Sender: TObject);
begin
  if lstAvailableSNRvsPOD.ItemIndex = -1 then
    Exit;

  FSelectedPODvsSNR := TPOD_vs_SNR_Curve_Definition(
    lstAvailableSNRvsPOD.Items.Objects[lstAvailableSNRvsPOD.ItemIndex]);
end;

procedure TfrmSNRvsPODPickList.UpdateSNRvsPODList;
var
  i : Integer;
  snrVSpod : TPOD_vs_SNR_Curve_Definition;
begin
  lstAvailableSNRvsPOD.Items.Clear;

  dmTTT.GetAllPODvsSNRCurveDef(FSNRvsPODList);

  for i := 0 to FSNRvsPODList.Count - 1 do
  begin
    snrVSpod := FSNRvsPODList.Items[i];

    if snrVSpod.FData.Curve_Definition_Index <> FSelectedPODvsSNRId then
      lstAvailableSNRvsPOD.Items.AddObject(snrVSpod.FData.Curve_Definition_Identifier, snrVSpod);

  end;
end;

{$ENDREGION}

end.
