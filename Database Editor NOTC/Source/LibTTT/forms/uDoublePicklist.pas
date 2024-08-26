unit uDoublePicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TDoublePicklistForm = class(TForm)
    pnlMotion: TPanel;
    lstSelected: TListBox;
    btnEdit2: TButton;
    btnRemove: TButton;
    btnEdit: TButton;
    btnCopy: TButton;
    btnNew: TButton;
    btnAdd: TButton;
    lstAvailable: TListBox;
    lblSelected: TLabel;
    lblAvailable: TLabel;
    Panel1: TPanel;
    btnClose: TButton;
    btnFilter: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DoublePicklistForm: TDoublePicklistForm;

implementation

{$R *.dfm}

end.
