unit uChannelComList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,tttData, uDataModuleTTT, newClassASTT;

type
  TfChannelComList = class(TForm)
    Panel1: TPanel;
    BtnNew: TButton;
    BtnUsage: TButton;
    BtnRemove: TButton;
    BtnEdit: TButton;
    BtnClose: TButton;
    Panel2: TPanel;
    lbChannelList: TListBox;
    BtnFilter: TButton;
    lbChannelID: TListBox;
    procedure getRAComm;
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    CommList  : Tlist;
    edtComList : Tlist;
    ExCom : TRecExternal_Communication_Channel;
    { Public declarations }
  end;

var
  fChannelComList: TfChannelComList;
  communication  : TExternal_Communication_Channel;
implementation

uses uCommunicationsChannels, uResourceAllocation,
  uResurceAllocationSelect, uSimDBEditor, uRAList;

{$R *.dfm}

procedure TfChannelComList.BtnCloseClick(Sender: TObject);
begin
 Close;
end;

procedure TfChannelComList.BtnEditClick(Sender: TObject);
var
  Band : byte;
begin
 edtComList := TList.Create;
 dmTTT.GetExternal_Communication_Channel(edtComList,'',
       lbChannelID.Items.Strings[lbChannelList.ItemIndex],communication);

 with CommunicationsChannelsForm do begin
   edtName.Text := TExternal_Communication_Channel(edtComList[0]).FData.Channel_Identifier;
   edtChannelNumber.Text := inttostr(TExternal_Communication_Channel(edtComList[0]).FData.Channel_Number);
   Band := TExternal_Communication_Channel(edtComList[0]).FData.Comms_Band;
   if Band = 0 then
   begin
     cbxCommunicationBand.Text := 'HF';
   end
   else
   if Band = 1 then
   begin
     cbxCommunicationBand.Text := 'UHF/VHF';
   end
   else
   if Band = 2 then
   begin
     cbxCommunicationBand.Text := 'SATCOM';
   end
   else
   if Band = 3 then
   begin
     cbxCommunicationBand.Text := 'UWT';
   end
   else
   begin
     cbxCommunicationBand.Text := 'FM';
   end;

   edtChannelFrequency.Text := FloatToStr(TExternal_Communication_Channel(edtComList[0]).FData.Channel_Freq);
   edtChannelCode.Text := TExternal_Communication_Channel(edtComList[0]).FData.Channel_Code;
 end;

 CommunicationsChannelsForm.ExComID := lbChannelID.Items.Strings[lbChannelList.ItemIndex];
 CommunicationsChannelsForm.Show;
 CommunicationsChannelsForm.isNew := False;
end;

procedure TfChannelComList.BtnNewClick(Sender: TObject);
begin
 with CommunicationsChannelsForm do begin
   edtName.Text := '[NoNammed]';
   edtChannelNumber.Text := inttostr(CommList.Count);
   cbxCommunicationBand.Text := 'HF';
   edtChannelFrequency.Text := '0.000';
   edtChannelCode.Text := 'CH-'+ inttostr(CommList.Count);
 end;

 CommunicationsChannelsForm.Show;
 CommunicationsChannelsForm.isNew := True;
end;

procedure TfChannelComList.BtnRemoveClick(Sender: TObject);
begin
  dmTTT.DeleteExternal_Communication_Channel
  (lbChannelID.Items.Strings[lbChannelList.ItemIndex]);

  getRAComm;
end;

procedure TfChannelComList.FormShow(Sender: TObject);
begin
  getRAComm;
end;

procedure TfChannelComList.getRAComm;
var
i : integer;
begin
  CommList := TList.Create;
  dmTTT.GetExternal_Communication_Channel(CommList, fRAList.RA_id,'',communication);

  lbChannelList.Items.Clear;
  lbChannelID.Items.Clear;

  for I := 0 to CommList.Count - 1 do
  begin
    lbChannelList.Items.Add('Channel : ' + IntToStr(TExternal_Communication_Channel(CommList[i]).FData.Channel_Number)+  '  ' +
    'Name : ' + TExternal_Communication_Channel(CommList[i]).FData.Channel_Identifier);
    lbChannelID.Items.Add(inttostr(TExternal_Communication_Channel(CommList[i]).FData.Comms_Channel_Index));
  end;
end;

end.

