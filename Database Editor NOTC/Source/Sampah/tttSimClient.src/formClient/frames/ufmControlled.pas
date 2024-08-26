unit ufmControlled;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs;

type
  TfmControlled = class(TFrame)

  private
    { Private declarations }
  protected
    FControlled :  TObject;
    FActiveTab: integer;

    procedure DisplayTab(const i: byte); virtual;

  public
    { Public declarations }
    procedure InitCreate(sender: TForm);  virtual;
    procedure SetControlledObject(ctrlObj: TObject); virtual;

  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TfmControlled.DisplayTab(const i: byte);
begin
  FActiveTab  := i;

end;

procedure TfmControlled.InitCreate(sender: TForm);
begin
  FControlled := nil;

end;

procedure TfmControlled.SetControlledObject(ctrlObj: TObject);
begin
  FControlled := ctrlObj;

end;

end.
