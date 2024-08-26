unit uSonarDefList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfSonarDefList = class(TForm)
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
//    procedure refresh;
  private
    { Private declarations }
  public
    { Public declarations }
    sList: TList;
  end;

var
  fSonarDefList: TfSonarDefList;

implementation

{$R *.dfm}

procedure TfSonarDefList.FormShow(Sender: TObject);
begin
  //
end;



end.
