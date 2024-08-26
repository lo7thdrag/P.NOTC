unit uEmbarkedPlatforms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TEmbarkedPlatformsForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblClass: TStaticText;
    edtClass: TEdit;
    lblQuantity: TStaticText;
    edtQuantity: TEdit;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmbarkedPlatformsForm: TEmbarkedPlatformsForm;

implementation

{$R *.dfm}

end.
