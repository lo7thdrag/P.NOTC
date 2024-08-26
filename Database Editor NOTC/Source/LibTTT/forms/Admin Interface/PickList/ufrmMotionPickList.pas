unit ufrmMotionPickList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDBAsset_MotionCharacteristics,
  Vcl.Imaging.pngimage;

type
  TfrmMotionPickList = class(TForm)
    ImgBackground: TImage;
    ImgBackgroungList: TImage;
    Label2: TLabel;
    lstAvailableMotion: TListBox;
    btnAdd: TImage;
    btnCancel: TImage;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure lstAvailableMotionClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);

  private
    FSelectedMotionId : Integer;

    FMotionList : TList;
    FSelectedMotion : TMotion_Characteristics;

    procedure UpdateMotionList;

  public
    property SelectedMotionId : Integer read FSelectedMotionId write FSelectedMotionId;
  end;

var
  frmMotionPickList: TfrmMotionPickList;

implementation

uses
  uDataModuleTTT;

{$R *.dfm}

{$REGION ' Form Handle '}

procedure TfrmMotionPickList.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : Integer;

begin

  for i := FMotionList.Count - 1 downto 0 do
  begin
    TMotion_Characteristics(FMotionList[i]).Free
  end;
  FMotionList.Clear;
  FMotionList.Free;

  Action := cafree;
end;

procedure TfrmMotionPickList.FormCreate(Sender: TObject);
begin
  FMotionList := TList.Create;
end;

procedure TfrmMotionPickList.FormShow(Sender: TObject);
begin
  UpdateMotionList;
end;

{$ENDREGION}

{$REGION ' Button Handle '}

procedure TfrmMotionPickList.btnAddClick(Sender: TObject);
begin
  if lstAvailableMotion.ItemIndex = -1 then
    Exit;

  FSelectedMotionId := FSelectedMotion.FData.Motion_Index;
  Close;

end;

procedure TfrmMotionPickList.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMotionPickList.lstAvailableMotionClick(Sender: TObject);
begin
  if lstAvailableMotion.ItemIndex = -1 then
    Exit;

  FSelectedMotion := TMotion_Characteristics(lstAvailableMotion.Items.Objects[lstAvailableMotion.ItemIndex]);
end;

procedure TfrmMotionPickList.UpdateMotionList;
var
  i : Integer;
  motion : TMotion_Characteristics;
begin
  lstAvailableMotion.Items.Clear;

  dmTTT.GetAllMotionCharacteristicDef(FMotionList);

  for i := 0 to FMotionList.Count - 1 do
  begin
    motion := FMotionList.Items[i];

    lstAvailableMotion.Items.AddObject(motion.FData.Motion_Identifier, motion);

  end;
end;

{$ENDREGION}

end.
