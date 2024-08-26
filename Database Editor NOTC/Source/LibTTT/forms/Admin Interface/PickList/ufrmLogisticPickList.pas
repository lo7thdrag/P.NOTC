unit ufrmLogisticPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Logistics;

type
  TfrmLogisticPickList = class(TForm)
    btnAdd: TImage;
    btnCancel: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstAvailableLogistic: TListBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableMotionClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedLogisticId : Integer;

    FLogisticList : TList;
    FSelectedLogistic : TLogistics;

    procedure UpdateLogisticList;

  public
    property SelectedLogisticId : Integer read FSelectedLogisticId write FSelectedLogisticId;
  end;

var
  frmLogisticPickList: TfrmLogisticPickList;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmLogisticPickList.FormCreate(Sender: TObject);
begin
  FLogisticList := TList.Create;
end;

procedure TfrmLogisticPickList.FormShow(Sender: TObject);
begin
  UpdateLogisticList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmLogisticPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableLogistic.ItemIndex = -1 then
    Exit;

  FSelectedLogisticId := FSelectedLogistic.FData.Logistic_Index;
  Close;
end;

procedure TfrmLogisticPickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogisticPickList.lstAvailableMotionClick(Sender: TObject);
begin
  if lstAvailableLogistic.ItemIndex = -1 then
    Exit;

  FSelectedLogistic := TLogistics(lstAvailableLogistic.Items.Objects[lstAvailableLogistic.ItemIndex]);
end;

procedure TfrmLogisticPickList.UpdateLogisticList;
var
  i : Integer;
  logistics : TLogistics;
begin
  lstAvailableLogistic.Items.Clear;

  dmTTT.GetAllLogisticDef(FLogisticList);

  for i := 0 to FLogisticList.Count - 1 do
  begin
    logistics := FLogisticList.Items[i];

    lstAvailableLogistic.Items.AddObject(logistics.FData.Logistic_Identifier, logistics);

  end;
end;

{$ENDREGION}

end.
