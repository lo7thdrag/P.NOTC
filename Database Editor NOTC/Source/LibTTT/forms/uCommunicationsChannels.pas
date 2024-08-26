unit uCommunicationsChannels;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, tttData;

type
  TCommunicationsChannelsForm = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    lblName: TStaticText;
    edtName: TEdit;
    lblChannelNumber: TStaticText;
    lblCommunicationBand: TStaticText;
    lblChannelFrequency: TStaticText;
    lblChannelCode: TStaticText;
    cbSecureChannel: TCheckBox;
    edtChannelNumber: TEdit;
    cbxCommunicationBand: TComboBox;
    edtChannelFrequency: TEdit;
    edtChannelCode: TEdit;
    lblMhz: TStaticText;
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbxCommunicationBandChange(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
    isNew : boolean;
    force : integer;
    BandId : byte;

    ExCom : TRecExternal_Communication_Channel;
    ExComID : string;

    procedure getData;
    { Public declarations }
  end;

var
  CommunicationsChannelsForm: TCommunicationsChannelsForm;


implementation

uses uChannelComList, ufrmSummaryResourceAllocation, uDataModuleTTT, ufrmAvailableResourceAllocation;

{$R *.dfm}

procedure TCommunicationsChannelsForm.btnApplyClick(Sender: TObject);
begin
  if isNew then
  begin
    getData;
    dmTTT.insertComm(ExCom);
    isNew := False;
    ExComID := IntToStr(ExCom.Comms_Channel_Index);
  end
  else
  begin
    getData;
    dmTTT.updateComm(ExCom, ExComID);
  end;

  fChannelComList.getRAComm;
end;

procedure TCommunicationsChannelsForm.btnCancelClick(Sender: TObject);
begin
 Close;
end;

procedure TCommunicationsChannelsForm.btnOKClick(Sender: TObject);
begin
  btnApplyClick(Sender);

  Close;
end;

procedure TCommunicationsChannelsForm.cbxCommunicationBandChange(
  Sender: TObject);
begin
 if cbxCommunicationBand.Text = 'HF' then
  BandId := 0;
 if cbxCommunicationBand.Text = 'UHF/VHF' then
  BandId := 1;
 if cbxCommunicationBand.Text = 'SATCOM' then
  BandId := 2;
 if cbxCommunicationBand.Text = 'UWT' then
  BandId := 3;
 if cbxCommunicationBand.Text = 'FM' then
  BandId := 4;
end;

procedure TCommunicationsChannelsForm.getData;
var
  Name, Number, Frek , Code : string;
  Secure : byte;
  id :integer;
begin
  Name := edtName.Text;
  Number := edtChannelNumber.Text;
  Frek := edtChannelFrequency.Text;
  Code := edtChannelCode.Text;

  if cbSecureChannel.Checked = True then
   Secure := 1
  else
   Secure := 0;

  if frmAvailableResourceAllocation.RA_id <> '' then
    ExCom.Resource_Alloc_Index :=  StrToInt(frmAvailableResourceAllocation.RA_id)
  else
  begin
    dmTTT.GetMaxResource_Allocation(id);
    ExCom.Resource_Alloc_Index := id;
  end;
  ExCom.Channel_Number := StrToInt(Number);
  ExCom.Channel_Identifier := Name;
  ExCom.Comms_Band := BandId;
  Excom.Channel_Freq := StrToFloat(Frek);
  ExCom.Channel_Security := Secure;
  ExCom.Channel_Code := Code;

end;

end.

