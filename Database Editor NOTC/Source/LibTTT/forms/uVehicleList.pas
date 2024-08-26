unit uVehicleList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfVehicleList = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lbVehicle: TListBox;
    BtnNew: TButton;
    BtnEdit: TButton;
    BtnRemove: TButton;
    BtnClose: TButton;
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fVehicleList: TfVehicleList;

implementation

uses ufrmGroupAllocation;

{$R *.dfm}

procedure TfVehicleList.BtnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfVehicleList.BtnEditClick(Sender: TObject);
begin
// frmGroupAllocation.Create;
// frmGroupAllocation.Show;
end;

end.
