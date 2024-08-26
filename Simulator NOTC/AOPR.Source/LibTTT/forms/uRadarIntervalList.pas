unit uRadarIntervalList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, newClassASTT;

type
  TRadarIntervalListForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblName: TStaticText;
    edtName: TEdit;
    btnEditList: TButton;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    radar_interval : TRadar_Interval_List;
  end;

var
  RadarIntervalListForm: TRadarIntervalListForm;

implementation

{$R *.dfm}

end.
