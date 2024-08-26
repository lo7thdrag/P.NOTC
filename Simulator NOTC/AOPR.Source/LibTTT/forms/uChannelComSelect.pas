unit uChannelComSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, uDBAssetObject, newClassASTT;

type
  TfChannelComSelect = class(TForm)
    BtnAdd: TButton;
    BtnRemove: TButton;
    BtnOk: TButton;
    BtnCancel: TButton;
    LbChannelList: TListBox;
    LbChannelMap: TListBox;
    procedure BtnOkClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    CommList  : Tlist;
    ra          : TResource_Allocation;
    Scenario : TScenario_Definition;
    com_chanel : TExternal_Communication_Channel;
    id_scenario : string;
    { Public declarations }
  end;

var
  fChannelComSelect: TfChannelComSelect;

implementation

uses tttData, uDataModuleTTT, uRAList, ufScenario;

{$R *.dfm}

procedure TfChannelComSelect.BtnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TfChannelComSelect.BtnOkClick(Sender: TObject);
begin
 Close;
end;

procedure TfChannelComSelect.FormCreate(Sender: TObject);
begin
  com_chanel := TExternal_Communication_Channel.Create;
end;

procedure TfChannelComSelect.FormShow(Sender: TObject);
var
  i : integer;
  RaId : string;
begin
  dmTTT.GetScenario(StrToInt(id_scenario),scenario);
  dmTTT.GetResourceAlloc(scenario.FData.Resource_Alloc_Index,ra);

  Raid := inttostr(ra.FData.Resource_Alloc_Index);

  CommList := TList.Create;
  dmTTT.GetExternal_Communication_Channel(CommList, Raid, '1', com_chanel);
  lbChannelList.Items.Clear;

  for I := 0 to CommList.Count - 1 do
  begin
    LbChannelList.Items.Add('Channel : ' + IntToStr(TExternal_Communication_Channel(CommList[i]).FData.Channel_Number)+  '  ' +
    'Name : ' + TExternal_Communication_Channel(CommList[i]).FData.Channel_Identifier);
  end;
end;

end.
