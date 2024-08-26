unit uAddRTPlatform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmRuntimeLibrary = class(TForm)
    Panel1: TPanel;
    Cancel: TButton;
    lvTrackTable: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRuntimeLibrary: TfrmRuntimeLibrary;

implementation

{$R *.dfm}

end.
