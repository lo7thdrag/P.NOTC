unit uBlindZoneAttachment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  TBlindZonesAttachmentForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    grbFirstBlindZone: TGroupBox;
    grbSecondBlindZone: TGroupBox;
    lblCentreFirst: TStaticText;
    TrackCentreFirst: TTrackBar;
    edtCentreFirst: TEdit;
    lblWidthFirst: TStaticText;
    TrackWidthFirst: TTrackBar;
    edtWidthFirst: TEdit;
    imgForwardFirst: TImage;
    lblForwardFirst: TStaticText;
    imgForwardSecond: TImage;
    lblForwardSecond: TStaticText;
    lblCentreSecond: TStaticText;
    TrackCentreSecond: TTrackBar;
    edtCentreSecond: TEdit;
    lblWidthSecond: TStaticText;
    TrackWidthSecond: TTrackBar;
    edtWidthSecond: TEdit;
    cbFirstBlindZone: TCheckBox;
    cbSecondBlindZone: TCheckBox;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BlindZonesAttachmentForm: TBlindZonesAttachmentForm;

implementation

{$R *.dfm}

end.
