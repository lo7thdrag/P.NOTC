unit uAvailableEnvironment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAvailableEnvironmentForm = class(TForm)
    lbEnvironment: TListBox;
    btNew: TButton;
    btEdit: TButton;
    procedure FormShow(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btNewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AvailableEnvironmentForm: TAvailableEnvironmentForm;

implementation

uses
  uSimDBEditor, newClassASTT, uEnvironment, uDBAsset_GameEnvironment;

{$R *.dfm}

procedure TAvailableEnvironmentForm.btEditClick(Sender: TObject);
begin
  EnvironmentForm.edtName.Text := lbEnvironment.Items.Strings[lbEnvironment.ItemIndex];
  EnvironmentForm.Show;
end;

procedure TAvailableEnvironmentForm.btNewClick(Sender: TObject);
begin
  EnvironmentForm.edtName.Text := '';
  EnvironmentForm.edtArea.Text := '';
  EnvironmentForm.Show;
end;

procedure TAvailableEnvironmentForm.FormShow(Sender: TObject);
var
  EList : TGame_Environment_Definition;
  I : Integer;
begin
  EList := TGame_Environment_Definition.Create;
  uSimDBEditor.getEnvironment(getfocusedPlatform, EList);

  for I := 0 to EList.FOverlay.Count - 1 do
    begin
      //tambahkan di Listnya
      lbEnvironment.Items.Add(EList.FData.Game_Enviro_Identifier);
    end;

end;

end.
