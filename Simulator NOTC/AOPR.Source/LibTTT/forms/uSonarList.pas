unit uSonarList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, uSonar;

type
  TfSonarList = class(TForm)
    btClose: TButton;
    btCopy: TButton;
    btFilter: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btRemove: TButton;
    btUsage: TButton;
    lbIdSonars: TListBox;
    lbSonars: TListBox;
    procedure FormShow(Sender: TObject);
    procedure refresh;
  private
    { Private declarations }
  public
    { Public declarations }
    sList: TList;
  end;

var
  fSonarList: TfSonarList;

implementation

uses uDataModuleTTT;

{$R *.dfm}

procedure TfSonarList.FormShow(Sender: TObject);
begin
  //
end;

procedure TfSonarList.refresh;
begin
  //
end;

end.
