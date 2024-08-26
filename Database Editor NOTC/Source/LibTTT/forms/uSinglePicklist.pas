unit uSinglePicklist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSinglePicklistForm = class(TForm)
    Panel1: TPanel;
    grbFilter: TGroupBox;
    cbUsage: TCheckBox;
    cbxFilter: TComboBox;
    Panel2: TPanel;
    btnNew: TButton;
    btnCopy: TButton;
    btnEdit: TButton;
    btnRemove: TButton;
    btnFilter: TButton;
    btnUsage: TButton;
    btnClose: TButton;
    Panel3: TPanel;
    lstMotion: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SinglePicklistForm: TSinglePicklistForm;

implementation

{$R *.dfm}

end.
