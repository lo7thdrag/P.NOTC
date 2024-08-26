unit u2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TLateralForm = class(TForm)
    pnl1: TPanel;
    pgControl: TPageControl;
    tabInitial: TTabSheet;
    tabLateral: TTabSheet;
    tabVertical: TTabSheet;
    grbSelect: TGroupBox;
    cbxLateral: TComboBox;
    grbStraughtHeading: TGroupBox;
    Course: TLabel;
    GroundSpeed: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    degreesT: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LateralForm: TLateralForm;

implementation

{$R *.dfm}

end.
