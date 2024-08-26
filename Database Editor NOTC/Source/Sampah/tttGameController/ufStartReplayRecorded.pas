unit ufStartReplayRecorded;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmStartReplayRecorded = class(TForm)
    Panel1: TPanel;
    PanelAudio: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Panel2: TPanel;
    Bevel1: TBevel;
    btnFinish: TButton;
    btnCancel: TButton;
    btnBack: TButton;
    btnAudioTrackSettings: TButton;
    GroupBox1: TGroupBox;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStartReplayRecorded: TfrmStartReplayRecorded;

implementation

{$R *.dfm}

procedure TfrmStartReplayRecorded.FormCreate(Sender: TObject);
begin
//  Show;

end;

end.
