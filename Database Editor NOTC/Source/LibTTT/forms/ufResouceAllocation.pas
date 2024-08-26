unit ufResouceAllocation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfResourceAllocSelection = class(TForm)
    lbAvailableResAlloc: TListBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    ListBox2: TListBox;
    Label2: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResourceAllocSelection: TfResourceAllocSelection;

implementation

{$R *.dfm}

end.
