unit uCountemeasuresSingleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfCountermeasureSingle = class(TForm)
    lbTempId: TListBox;
    lbSingle: TListBox;
    btnClose: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnNew: TButton;
    btnRemove: TButton;
    btnUsage: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
    id : string;
    isNew : Boolean;
  end;

var
  fCountermeasureSingle: TfCountermeasureSingle;
  mList : TList;

implementation

{$R *.dfm}

uses uSimDBEditor, uDataModuleTTT;

end.
