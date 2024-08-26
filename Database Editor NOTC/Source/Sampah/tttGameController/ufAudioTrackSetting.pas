unit ufAudioTrackSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmAudioTrackSetting = class(TForm)
    Label4: TLabel;
    ListBox1: TListBox;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAudioTrackSetting: TfrmAudioTrackSetting;

implementation

{$R *.dfm}

procedure TfrmAudioTrackSetting.FormCreate(Sender: TObject);
begin
//  Show;
end;

end.
