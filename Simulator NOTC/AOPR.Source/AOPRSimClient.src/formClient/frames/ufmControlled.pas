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
    FControlled: TObject;
    FActiveTab: integer;
    procedure DisplayTab(const i: byte); virtual;
  public
    { Public declarations }
    procedure InitCreate(sender: TForm); virtual;
    procedure SetControlledObject(ctrlObj: TObject); virtual;
    procedure UpdateForm; virtual;
    procedure ReadOnlyMode; virtual;
    procedure UnReadOnlyMode; virtual;
    procedure clearPlatformMultiSelectList; virtual;
    procedure SetPlatformMultiSelectList(ctrlObj: TObject); virtual;
  end;

implementation

{$R *.dfm}
{ TFrame1 }

procedure TfmControlled.clearPlatformMultiSelectList;
begin
//
end;

procedure TfmControlled.DisplayTab(const i: byte);
begin
  FActiveTab := i;

end;

procedure TfmControlled.InitCreate(sender: TForm);
begin
  FControlled := nil;

end;

procedure TfmControlled.ReadOnlyMode;
begin
  Self.Enabled := false;
end;

procedure TfmControlled.SetControlledObject(ctrlObj: TObject);
begin
  FControlled := ctrlObj;
  UpdateForm;
end;

procedure TfmControlled.SetPlatformMultiSelectList(ctrlObj: TObject);
begin
//
end;

procedure TfmControlled.UnReadOnlyMode;
begin
  Self.Enabled := true;
end;

procedure TfmControlled.UpdateForm;
begin
end;

end.
