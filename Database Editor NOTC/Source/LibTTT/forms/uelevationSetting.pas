unit uelevationSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TElevationSettingForm = class(TForm)
    edtElevation: TEdit;
    btnOK: TButton;
    btnCancel: TButton;
    btnApply: TButton;
    lblFeet: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ElevationSettingForm: TElevationSettingForm;

implementation

{$R *.dfm}

end.
