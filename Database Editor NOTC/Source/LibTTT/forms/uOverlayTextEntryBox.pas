unit uOverlayTextEntryBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TOverlayTextEntryForm = class(TForm)
    Panel1: TPanel;
    lblEnterText: TStaticText;
    edtText: TEdit;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OverlayTextEntryForm: TOverlayTextEntryForm;

implementation

{$R *.dfm}

end.
