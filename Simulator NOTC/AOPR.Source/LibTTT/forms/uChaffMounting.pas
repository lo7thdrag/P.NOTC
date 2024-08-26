unit uChaffMounting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TChaffMountingForm = class(TForm)
    Panel1: TPanel;
    lblName: TStaticText;
    Panel3: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    Panel2: TPanel;
    PageControl1: TPageControl;
    General: TTabSheet;
    lblQuantity: TStaticText;
    edtAntenna: TEdit;
    cbxName: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ChaffMountingForm: TChaffMountingForm;

implementation

{$R *.dfm}

end.
