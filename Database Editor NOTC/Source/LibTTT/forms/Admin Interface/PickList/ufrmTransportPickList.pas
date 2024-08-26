unit ufrmTransportPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uDBAsset_Transport ,uDBAssetObject ;

type
  TfrmTransportPickList = class(TForm)
    btnAdd: TImage;
    btnCancel: TImage;
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstAvailableTransport: TListBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableTransportClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedTransportId : Integer;

    FTransportList : TList;
    FSelectedTransport : TTransport;

    procedure UpdateTransportList;

  public
    property SelectedTransportId : Integer read FSelectedTransportId write FSelectedTransportId;
  end;

var
  frmTransportPickList: TfrmTransportPickList;

implementation

uses
  uDataModuleTTT ;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmTransportPickList.FormCreate(Sender: TObject);
begin
  FTransportList := TList.Create;
end;

procedure TfrmTransportPickList.FormShow(Sender: TObject);
begin
  UpdateTransportList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmTransportPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableTransport.ItemIndex = -1 then
    Exit;

  FSelectedTransportId := FSelectedTransport.FData.Transport_Index;
  Close;

end;

procedure TfrmTransportPickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTransportPickList.lstAvailableTransportClick(Sender: TObject);
begin
  if lstAvailableTransport.ItemIndex = -1 then
    Exit;

  FSelectedTransport := TTransport(lstAvailableTransport.Items.Objects[lstAvailableTransport.ItemIndex]);
end;

procedure TfrmTransportPickList.UpdateTransportList;
var
  i : Integer;
  transport : TTransport;
begin
  lstAvailableTransport.Items.Clear;

  dmTTT.GetAllTransportDef(FTransportList);

  for i := 0 to FTransportList.Count - 1 do
  begin
    transport := FTransportList.Items[i];

    lstAvailableTransport.Items.AddObject(transport.FData.Transport_Identifier, transport);

  end;
end;

{$ENDREGION}

end.
