unit uSimbolTaktis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, uDBAsset_FontTaktis, StdCtrls{, uVehicleAttributeWindow};

type
  TfrmSimbolTaktis = class(TForm)
    drwgrdFontTaktis: TDrawGrid;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure drwgrdFontTaktisDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FontTaktisList : TList;
  public
    { Public declarations }
    FontType : Byte;  // 0 : AD, 1 : AL, 2 : AU
  end;

var
  frmSimbolTaktis: TfrmSimbolTaktis;

implementation

{$R *.dfm}

uses uDataModuleTTT,uStrategiEditor;

procedure TfrmSimbolTaktis.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSimbolTaktis.btnOKClick(Sender: TObject);
begin
  frmStrategiEditor.lblFontTaktis.Font.Name := TFontTaktis(FontTaktisList.Items[drwgrdFontTaktis.Row]).FData.FONT_NAME;
  frmStrategiEditor.lblFontTaktis.Font.Size := 30;
  frmStrategiEditor.lblFontTaktis.Font.Style := [fsBold];
  frmStrategiEditor.lblFontTaktis.Caption := Char(TFontTaktis(FontTaktisList.Items[drwgrdFontTaktis.Row]).FData.FONT_INDEX);
  Close;
end;

procedure TfrmSimbolTaktis.drwgrdFontTaktisDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
 b, i : integer;
 aFontTaktis : TFontTaktis;
begin
  if not (gdFixed in state) then
  begin
    drwgrdFontTaktis.Canvas.Font.Name := 'calibri';
    aFontTaktis := TFontTaktis(FontTaktisList.Items[aRow]);
//    drwgrdFontTaktis.Canvas.Font.Size := 12;
//    drwgrdFontTaktis.Canvas.TextOut(Rect.Left + 10, Rect.Top + 10, IntToStr(aRow + 1) + '.');
   // drwgrdFontTaktis.Canvas.TextOut(Rect.Left + 100, Rect.Top + 10, '( '+ aFontTaktis.FData.FONT_NAME + ' )');
    drwgrdFontTaktis.Canvas.TextOut(Rect.Left + 120, Rect.Top + 10, aFontTaktis.FData.KETERANGAN);
    drwgrdFontTaktis.Canvas.Font.Name := aFontTaktis.FData.FONT_NAME;
    drwgrdFontTaktis.Canvas.Font.Style := [fsBold];
    drwgrdFontTaktis.Canvas.Font.Size := 24;
    drwgrdFontTaktis.Canvas.TextOut(Rect.Left + 60, Rect.Top, char(aFontTaktis.FData.FONT_INDEX));

  end;
end;

procedure TfrmSimbolTaktis.FormCreate(Sender: TObject);
begin
  FontTaktisList := TList.Create;
end;

procedure TfrmSimbolTaktis.FormDestroy(Sender: TObject);
begin
  FontTaktisList.Free;
end;

procedure TfrmSimbolTaktis.FormShow(Sender: TObject);
begin
  if Assigned(FontTaktisList) then
    FontTaktisList.Clear
  else
    FontTaktisList.Create;

  dmTTT.getAllFontTaktis(FontTaktisList, 0);
end;

end.
