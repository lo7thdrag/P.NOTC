unit uIFFMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, uDBAssetObject, Grids, newClassASTT,
  uDBGame_Defaults, Mask, uBaseCoordSystem  ;

type
  TIFFMode = class(TForm)
    btnApply: TButton;
    btnCancel: TButton;
    btnOK: TButton;
    grpAmberForce: TGroupBox;
    grdpnlAmberInterrogator: TGridPanel;
    pnlAmberInterrogator: TPanel;
    pnlAmberInterrogatorMode: TPanel;
    pnlAmberInterrogatorCode: TPanel;
    pnlAmberInterrogatorState: TPanel;
    pnlAmberInterMode1: TPanel;
    edtAmberInterCode1: TEdit;
    pnlAmberInterMode2: TPanel;
    edtAmberInterCode2: TEdit;
    pnlAmberInterMode3: TPanel;
    edtAmberInterCode3: TEdit;
    pnlAmberInterMode3C: TPanel;
    edtAmberInterCode3C: TEdit;
    pnlAmberInterMode4: TPanel;
    edtAmberInterCode4: TEdit;
    pnlAmberInterState1: TPanel;
    chkAmberInterState1: TCheckBox;
    pnlAmberInterState2: TPanel;
    chkAmberInterState2: TCheckBox;
    pnlAmberInterState3: TPanel;
    chkAmberInterState3: TCheckBox;
    pnlAmberInterState3C: TPanel;
    chkAmberInterState3C: TCheckBox;
    pnlAmberInterState4: TPanel;
    chkAmberInterState4: TCheckBox;
    grdpnlAmberTransponder: TGridPanel;
    pnlAmberTransponder: TPanel;
    pnlAmberTransponderMode: TPanel;
    pnlAmberTransponderCode: TPanel;
    pnlAmberTransponderState: TPanel;
    pnlAmberTransMode1: TPanel;
    edtAmberTransCode1: TEdit;
    pnlAmberTransMode2: TPanel;
    edtAmberTransCode2: TEdit;
    pnlAmberTransMode3: TPanel;
    edtAmberTransCode3: TEdit;
    pnlAmberTransMode3C: TPanel;
    edtAmberTransCode3C: TEdit;
    pnlAmberTransMode4: TPanel;
    edtAmberTransCode4: TEdit;
    pnlAmberTransState1: TPanel;
    chkAmberTransState1: TCheckBox;
    pnlAmberTransState2: TPanel;
    chkAmberTransState2: TCheckBox;
    pnlAmberTransState3: TPanel;
    chkAmberTransState3: TCheckBox;
    pnlAmberTransState3C: TPanel;
    chkAmberTransState3C: TCheckBox;
    pnlAmberTransState4: TPanel;
    chkAmberTransState4: TCheckBox;
    grpBlueForce: TGroupBox;
    grdpnlBlueInterrogator: TGridPanel;
    pnlBlueInterrogator: TPanel;
    pnlBlueInterrogatorMode: TPanel;
    pnlBlueInterrogatorCode: TPanel;
    pnlBlueInterrogatorState: TPanel;
    pnlBlueInterMode1: TPanel;
    edtBlueInterCode1: TEdit;
    pnlBlueInterMode2: TPanel;
    edtBlueInterCode2: TEdit;
    pnlBlueInterMode3: TPanel;
    edtBlueInterCode3: TEdit;
    pnlBlueInterMode3C: TPanel;
    edtBlueInterCode3C: TEdit;
    pnlBlueInterMode4: TPanel;
    edtBlueInterCode4: TEdit;
    pnlBlueInterState1: TPanel;
    chkBlueInterState1: TCheckBox;
    pnlBlueInterState2: TPanel;
    chkBlueInterState2: TCheckBox;
    pnlBlueInterState3: TPanel;
    chkBlueInterState3: TCheckBox;
    pnlBlueInterState3C: TPanel;
    chkBlueInterState3C: TCheckBox;
    pnlBlueInterState4: TPanel;
    chkBlueInterState4: TCheckBox;
    grdpnlBlueTransponder: TGridPanel;
    pnlBlueTransponder: TPanel;
    pnlBlueTransponderMode: TPanel;
    pnlBlueTransponderCode: TPanel;
    pnlBlueTransponderState: TPanel;
    pnlBlueTransMode1: TPanel;
    edtBlueTransCode1: TEdit;
    pnlBlueTransMode2: TPanel;
    edtBlueTransCode2: TEdit;
    pnlBlueTransMode3: TPanel;
    edtBlueTransCode3: TEdit;
    pnlBlueTransMode3C: TPanel;
    edtBlueTransCode3C: TEdit;
    pnlBlueTransMode4: TPanel;
    edtBlueTransCode4: TEdit;
    pnlBlueTransState1: TPanel;
    chkBlueTransState1: TCheckBox;
    pnlBlueTransState2: TPanel;
    chkBlueTransState2: TCheckBox;
    pnlBlueTransState3: TPanel;
    chkBlueTransState3: TCheckBox;
    pnlBlueTransState3C: TPanel;
    chkBlueTransState3C: TCheckBox;
    pnlBlueTransState4: TPanel;
    chkBlueTransState4: TCheckBox;
    grpGreenForce: TGroupBox;
    grdpnlGreenInterrogator: TGridPanel;
    pnlGreenInterrogator: TPanel;
    pnlGreenInterrogatorMode: TPanel;
    pnlGreenInterrogatorCode: TPanel;
    pnlGreenInterrogatorState: TPanel;
    pnlGreenInterMode1: TPanel;
    edtGreenInterCode1: TEdit;
    pnlGreenInterMode2: TPanel;
    edtGreenInterCode2: TEdit;
    pnlGreenInterMode3: TPanel;
    edtGreenInterCode3: TEdit;
    pnlGreenInterMode3C: TPanel;
    edtGreenInterCode3C: TEdit;
    pnlGreenInterMode4: TPanel;
    edtGreenInterCode4: TEdit;
    pnlGreenInterState1: TPanel;
    chkGreenInterState1: TCheckBox;
    pnlGreenInterState2: TPanel;
    chkGreenInterState2: TCheckBox;
    pnlGreenInterState3: TPanel;
    chkGreenInterState3: TCheckBox;
    pnlGreenInterState3C: TPanel;
    chkGreenInterState3C: TCheckBox;
    pnlGreenInterState4: TPanel;
    chkGreenInterState4: TCheckBox;
    grdpnlGreenTransponder: TGridPanel;
    pnlGreenTransponder: TPanel;
    pnlGreenTransponderMode: TPanel;
    pnlGreenTransponderCode: TPanel;
    pnlGreenTransponderState: TPanel;
    pnlGreenTransMode1: TPanel;
    edtGreenTransCode1: TEdit;
    pnlGreenTransMode2: TPanel;
    edtGreenTransCode2: TEdit;
    pnlGreenTransMode3: TPanel;
    edtGreenTransCode3: TEdit;
    pnlGreenTransMode3C: TPanel;
    edtGreenTransCode3C: TEdit;
    pnlGreenTransMode4: TPanel;
    edtGreenTransCode4: TEdit;
    pnlGreenTransState1: TPanel;
    chkGreenTransState1: TCheckBox;
    pnlGreenTransState2: TPanel;
    chkGreenTransState2: TCheckBox;
    pnlGreenTransState3: TPanel;
    chkGreenTransState3: TCheckBox;
    pnlGreenTransState3C: TPanel;
    chkGreenTransState3C: TCheckBox;
    pnlGreenTransState4: TPanel;
    chkGreenTransState4: TCheckBox;
    grpNoForce: TGroupBox;
    grdpnlNoForceInterrogator: TGridPanel;
    pnlNoForceInterrogator: TPanel;
    pnlNoForceInterrogatorMode: TPanel;
    pnlNoForceInterrogatorCode: TPanel;
    pnlNoForceInterrogatorState: TPanel;
    pnlNoForceInterMode1: TPanel;
    edtNoForceInterCode1: TEdit;
    pnlNoForceInterMode2: TPanel;
    edtNoForceInterCode2: TEdit;
    pnlNoForceInterMode3: TPanel;
    edtNoForceInterCode3: TEdit;
    pnlNoForceInterMode3C: TPanel;
    edtNoForceInterCode3C: TEdit;
    pnlNoForceInterMode4: TPanel;
    edtNoForceInterCode4: TEdit;
    pnlNoForceInterState1: TPanel;
    chkNoForceInterState1: TCheckBox;
    pnlNoForceInterState2: TPanel;
    chkNoForceInterState2: TCheckBox;
    pnlNoForceInterState3: TPanel;
    chkNoForceInterState3: TCheckBox;
    pnlNoForceInterState3C: TPanel;
    chkNoForceInterState3C: TCheckBox;
    pnlNoForceInterState4: TPanel;
    chkNoForceInterState4: TCheckBox;
    grdpnlNoForceTransponder: TGridPanel;
    pnlNoForceTransponder: TPanel;
    pnlNoForceTransponderMode: TPanel;
    pnlNoForceTransponderCode: TPanel;
    pnlNoForceTransponderState: TPanel;
    pnlNoForceTransMode1: TPanel;
    edtNoForceTransCode1: TEdit;
    pnlNoForceTransMode2: TPanel;
    edtNoForceTransCode2: TEdit;
    pnlNoForceTransMode3: TPanel;
    edtNoForceTransCode3: TEdit;
    pnlNoForceTransMode3C: TPanel;
    edtNoForceTransCode3C: TEdit;
    pnlNoForceTransMode4: TPanel;
    edtNoForceTransCode4: TEdit;
    pnlNoForceTransState1: TPanel;
    chkNoForceTransState1: TCheckBox;
    pnlNoForceTransState2: TPanel;
    chkNoForceTransState2: TCheckBox;
    pnlNoForceTransState3: TPanel;
    chkNoForceTransState3: TCheckBox;
    pnlNoForceTransState3C: TPanel;
    chkNoForceTransState3C: TCheckBox;
    pnlNoForceTransState4: TPanel;
    chkNoForceTransState4: TCheckBox;
    grpRedForce: TGroupBox;
    grdpnlRedInterrogator: TGridPanel;
    pnlRedInterrogator: TPanel;
    pnlRedInterrogatorMode: TPanel;
    pnlRedInterrogatorCode: TPanel;
    pnlRedInterrogatorState: TPanel;
    pnlRedInterMode1: TPanel;
    pnlRedInterMode2: TPanel;
    edtRedInterCode2: TEdit;
    pnlRedInterMode3: TPanel;
    edtRedInterCode3: TEdit;
    pnlRedInterMode3C: TPanel;
    edtRedInterCode3C: TEdit;
    pnlRedInterMode4: TPanel;
    edtRedInterCode4: TEdit;
    pnlRedInterState1: TPanel;
    chkRedInterState1: TCheckBox;
    pnlRedInterState2: TPanel;
    chkRedInterState2: TCheckBox;
    pnlRedInterState3: TPanel;
    chkRedInterState3: TCheckBox;
    pnlRedInterState3C: TPanel;
    chkRedInterState3C: TCheckBox;
    pnlRedInterState4: TPanel;
    chkRedInterState4: TCheckBox;
    edtRedInterCode1: TEdit;
    medtRedInterCode1: TMaskEdit;
    grdpnlRedTransponder: TGridPanel;
    pnlRedTransponder: TPanel;
    pnlRedTransponderMode: TPanel;
    pnlRedTransponderCode: TPanel;
    pnlRedTransponderState: TPanel;
    pnlRedTransMode1: TPanel;
    edtRedTransCode1: TEdit;
    pnlRedTransMode2: TPanel;
    edtRedTransCode2: TEdit;
    pnlRedTransMode3: TPanel;
    edtRedTransCode3: TEdit;
    pnlRedTransMode3C: TPanel;
    edtRedTransCode3C: TEdit;
    pnlRedTransMode4: TPanel;
    edtRedTransCode4: TEdit;
    pnlRedTransState1: TPanel;
    chkRedTransState1: TCheckBox;
    pnlRedTransState2: TPanel;
    chkRedTransState2: TCheckBox;
    pnlRedTransState3: TPanel;
    chkRedTransState3: TCheckBox;
    pnlRedTransState3C: TPanel;
    chkRedTransState3C: TCheckBox;
    pnlRedTransState4: TPanel;
    chkRedTransState4: TCheckBox;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure Code1KeyPress(Sender: TObject; var Key: Char);
    procedure Code2or3KeyPress(Sender: TObject; var Key: Char);
    procedure StateOnClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    FSelectedGameDefault : TGame_Defaults;

    FIFFList : TList;

    procedure UpdateIFFData;
  public
    property SelectedGameDefault : TGame_Defaults read FSelectedGameDefault
      write FSelectedGameDefault;
  end;

var
  fIFFMode: TIFFMode;

implementation

{$R *.dfm}
uses
  uDataModuleTTT, ufrmSummaryGameDefaults;

procedure TIFFMode.btnApplyClick(Sender: TObject);
var
  i : Integer;
  iffModeCode : TGame_Default_IFF_Mode_Code;
begin
  for i := 0 to FIFFList.Count - 1 do
  begin
    iffModeCode := FIFFList.Items[i];

    with iffModeCode do
    begin
      case FData.Force_Designation of
        1: //Red
        begin
          case FData.IFF_Device_Type of
            0: //Interrogator
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedInterCode1.Text);
                  FData.Mode_State := Ord(chkRedInterState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedInterCode2.Text);
                  FData.Mode_State := Ord(chkRedInterState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedInterCode3.Text);
                  FData.Mode_State := Ord(chkRedInterState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkRedInterState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkRedInterState4.Checked);
                end;
              end;
            end;
            1: //Transponder
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedTransCode1.Text);
                  FData.Mode_State := Ord(chkRedTransState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedTransCode2.Text);
                  FData.Mode_State := Ord(chkRedTransState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtRedTransCode3.Text);
                  FData.Mode_State := Ord(chkRedTransState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkRedTransState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkRedTransState4.Checked);
                end;
              end;
            end;
          end;
        end;
        2: //Amber / Yellow
        begin
          case FData.IFF_Device_Type of
            0: //Interrogator
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberInterCode1.Text);
                  FData.Mode_State := Ord(chkAmberInterState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberInterCode2.Text);
                  FData.Mode_State := Ord(chkAmberInterState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberInterCode3.Text);
                  FData.Mode_State := Ord(chkAmberInterState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkAmberInterState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkAmberInterState4.Checked);
                end;
              end;
            end;
            1: //Transponder
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberTransCode1.Text);
                  FData.Mode_State := Ord(chkAmberTransState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberTransCode2.Text);
                  FData.Mode_State := Ord(chkAmberTransState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtAmberTransCode3.Text);
                  FData.Mode_State := Ord(chkAmberTransState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkAmberTransState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkAmberTransState4.Checked);
                end;
              end;
            end;
          end;
        end;
        3: //Blue
        begin
          case FData.IFF_Device_Type of
            0: //Interrogator
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueInterCode1.Text);
                  FData.Mode_State := Ord(chkBlueInterState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueInterCode2.Text);
                  FData.Mode_State := Ord(chkBlueInterState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueInterCode3.Text);
                  FData.Mode_State := Ord(chkBlueInterState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkBlueInterState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkBlueInterState4.Checked);
                end;
              end;
            end;
            1: //Transponder
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueTransCode1.Text);
                  FData.Mode_State := Ord(chkBlueTransState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueTransCode2.Text);
                  FData.Mode_State := Ord(chkBlueTransState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtBlueTransCode3.Text);
                  FData.Mode_State := Ord(chkBlueTransState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkBlueTransState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkBlueTransState4.Checked);
                end;
              end;
            end;
          end;
        end;
        4: //Green
        begin
          case FData.IFF_Device_Type of
            0: //Interrogator
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenInterCode1.Text);
                  FData.Mode_State := Ord(chkGreenInterState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenInterCode2.Text);
                  FData.Mode_State := Ord(chkGreenInterState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenInterCode3.Text);
                  FData.Mode_State := Ord(chkGreenInterState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkGreenInterState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkGreenInterState4.Checked);
                end;
              end;
            end;
            1: //Transponder
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenTransCode1.Text);
                  FData.Mode_State := Ord(chkGreenTransState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenTransCode2.Text);
                  FData.Mode_State := Ord(chkGreenTransState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtGreenTransCode3.Text);
                  FData.Mode_State := Ord(chkGreenTransState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkGreenTransState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkGreenTransState4.Checked);
                end;
              end;
            end;
          end;
        end;
        5: //No Force
        begin
          case FData.IFF_Device_Type of
            0: //Interrogator
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceInterCode1.Text);
                  FData.Mode_State := Ord(chkNoForceInterState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceInterCode2.Text);
                  FData.Mode_State := Ord(chkNoForceInterState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceInterCode3.Text);
                  FData.Mode_State := Ord(chkNoForceInterState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkNoForceInterState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkNoForceInterState4.Checked);
                end;
              end;
            end;
            1: //Transponder
            begin
              case FData.IFF_Mode of
                0: //Mode 1
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceTransCode1.Text);
                  FData.Mode_State := Ord(chkNoForceTransState1.Checked);
                end;
                1: //Mode 2
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceTransCode2.Text);
                  FData.Mode_State := Ord(chkNoForceTransState2.Checked);
                end;
                2: //Mode 3
                begin
                  FData.IFF_Code := OctalToDecimal(edtNoForceTransCode3.Text);
                  FData.Mode_State := Ord(chkNoForceTransState3.Checked);
                end;
                3: //Mode 3C
                begin
                  FData.Mode_State := Ord(chkNoForceTransState3C.Checked);
                end;
                4: //Mode 4
                begin
                  FData.Mode_State := Ord(chkNoForceTransState4.Checked);
                end;
              end;
            end;
          end;
        end;
      end;

      dmTTT.UpdateIFFModeCode(FData);
    end;
  end;

  UpdateIFFData;
  btnApply.Enabled := False;
end;

procedure TIFFMode.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TIFFMode.btnOkClick(Sender: TObject);
begin
  if btnApply.Enabled then
    btnApply.Click;

  Close;
end;

procedure TIFFMode.Code1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#48 .. #55]) and (Length(TEdit(Sender).Text) < 2) then
    btnApply.Enabled := True
  else if Key = #8 then
  begin
    btnApply.Enabled := True
  end
  else
    Key := #0;
end;

procedure TIFFMode.Code2or3KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in [#48 .. #55]) and (Length(TEdit(Sender).Text) < 4) then
    btnApply.Enabled := True
  else if Key = #8 then
  begin
    btnApply.Enabled := True
  end
  else
    Key := #0;
end;

procedure TIFFMode.FormCreate(Sender: TObject);
begin
  FIFFList := TList.Create;
end;

procedure TIFFMode.FormShow(Sender: TObject);
begin
  UpdateIFFData;
  btnApply.Enabled := False;
end;

procedure TIFFMode.StateOnClick(Sender: TObject);
begin
  btnApply.Enabled := True;
end;

procedure TIFFMode.UpdateIFFData;
var
  i : Integer;
  iffModeCode : TGame_Default_IFF_Mode_Code;
  octalCode : string;
begin
  dmTTT.GetIFFModeCode(FSelectedGameDefault.FData.Defaults_Index, FIFFList);

  for i := 0 to FIFFList.Count - 1 do
  begin
    iffModeCode := FIFFList.Items[i];

    with iffModeCode.FData do
    begin
      case Force_Designation of
        1: //Red
        begin
          case IFF_Device_Type of
            0: //Interrogator
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtRedInterCode1.Text := octalCode;
                  chkRedInterState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtRedInterCode2.Text := octalCode;
                  chkRedInterState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtRedInterCode3.Text := octalCode;
                  chkRedInterState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtRedInterCode3C.Text := 'N/A';
                  chkRedInterState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtRedInterCode4.Text := 'N/A';
                  chkRedInterState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
            1: //Transponder
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtRedTransCode1.Text := octalCode;
                  chkRedTransState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtRedTransCode2.Text := octalCode;
                  chkRedTransState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtRedTransCode3.Text := octalCode;
                  chkRedTransState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtRedTransCode3C.Text := 'N/A';
                  chkRedTransState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtRedTransCode4.Text := 'N/A';
                  chkRedTransState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
          end;
        end;
        2: //Amber / Yellow
        begin
          case IFF_Device_Type of
            0: //Interrogator
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtAmberInterCode1.Text := octalCode;
                  chkAmberInterState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtAmberInterCode2.Text := octalCode;
                  chkAmberInterState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtAmberInterCode3.Text := octalCode;
                  chkAmberInterState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtAmberInterCode3C.Text := 'N/A';
                  chkAmberInterState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtAmberInterCode4.Text := 'N/A';
                  chkAmberInterState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
            1: //Transponder
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtAmberTransCode1.Text := octalCode;
                  chkAmberTransState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtAmberTransCode2.Text := octalCode;
                  chkAmberTransState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtAmberTransCode3.Text := octalCode;
                  chkAmberTransState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtAmberTransCode3C.Text := 'N/A';
                  chkAmberTransState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtAmberTransCode4.Text := 'N/A';
                  chkAmberTransState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
          end;
        end;
        3: //Blue
        begin
          case IFF_Device_Type of
            0: //Interrogator
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtBlueInterCode1.Text := octalCode;
                  chkBlueInterState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtBlueInterCode2.Text := octalCode;
                  chkBlueInterState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtBlueInterCode3.Text := octalCode;
                  chkBlueInterState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtBlueInterCode3C.Text := 'N/A';
                  chkBlueInterState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtBlueInterCode4.Text := 'N/A';
                  chkBlueInterState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
            1: //Transponder
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtBlueTransCode1.Text := octalCode;
                  chkBlueTransState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtBlueTransCode2.Text := octalCode;
                  chkBlueTransState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtBlueTransCode3.Text := octalCode;
                  chkBlueTransState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtBlueTransCode3C.Text := 'N/A';
                  chkBlueTransState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtBlueTransCode4.Text := 'N/A';
                  chkBlueTransState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
          end;
        end;
        4: //Green
        begin
          case IFF_Device_Type of
            0: //Interrogator
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtGreenInterCode1.Text := octalCode;
                  chkGreenInterState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtGreenInterCode2.Text := octalCode;
                  chkGreenInterState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtGreenInterCode3.Text := octalCode;
                  chkGreenInterState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtGreenInterCode3C.Text := 'N/A';
                  chkGreenInterState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtGreenInterCode4.Text := 'N/A';
                  chkGreenInterState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
            1: //Transponder
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtGreenTransCode1.Text := octalCode;
                  chkGreenTransState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtGreenTransCode2.Text := octalCode;
                  chkGreenTransState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtGreenTransCode3.Text := octalCode;
                  chkGreenTransState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtGreenTransCode3C.Text := 'N/A';
                  chkGreenTransState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtGreenTransCode4.Text := 'N/A';
                  chkGreenTransState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
          end;
        end;
        5: //No Force
        begin
          case IFF_Device_Type of
            0: //Interrogator
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtNoForceInterCode1.Text := octalCode;
                  chkNoForceInterState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtNoForceInterCode2.Text := octalCode;
                  chkNoForceInterState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtNoForceInterCode3.Text := octalCode;
                  chkNoForceInterState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtNoForceInterCode3C.Text := 'N/A';
                  chkNoForceInterState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtNoForceInterCode4.Text := 'N/A';
                  chkNoForceInterState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
            1: //Transponder
            begin
              case IFF_Mode of
                0: //Mode 1
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 2 do
                    octalCode := '0' + octalCode;

                  edtNoForceTransCode1.Text := octalCode;
                  chkNoForceTransState1.Checked := Boolean(Mode_State);
                end;
                1: //Mode 2
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtNoForceTransCode2.Text := octalCode;
                  chkNoForceTransState2.Checked := Boolean(Mode_State);
                end;
                2: //Mode 3
                begin
                  octalCode := DecimalToOctal(IFF_Code);

                  while Length(octalCode) < 4 do
                    octalCode := '0' + octalCode;

                  edtNoForceTransCode3.Text := octalCode;
                  chkNoForceTransState3.Checked := Boolean(Mode_State);
                end;
                3: //Mode 3C
                begin
                  edtNoForceTransCode3C.Text := 'N/A';
                  chkNoForceTransState3C.Checked := Boolean(Mode_State);
                end;
                4: //Mode 4
                begin
                  edtNoForceTransCode4.Text := 'N/A';
                  chkNoForceTransState4.Checked := Boolean(Mode_State);
                end;
              end;
            end;
          end;
        end;
      end;
    end;
  end;
end;

end.
